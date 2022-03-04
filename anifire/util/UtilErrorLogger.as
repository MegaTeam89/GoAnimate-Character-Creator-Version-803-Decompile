package anifire.util
{
   import anifire.util.Crypto.FastRC4;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLVariables;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.ByteArray;
   import flash.utils.getTimer;
   import mx.utils.Base64Encoder;
   import mx.utils.ObjectUtil;
   
   public class UtilErrorLogger extends EventDispatcher
   {
      
      public static const FATAL_EVENT_LOGGED:String = "FATAL_EVENT_LOGGED";
      
      public static const ERROR_EVENT_LOGGED:String = "ERROR_EVENT_LOGGED";
      
      public static const LOG_SENT_COMPLETE:String = "LOG_SENT_COMPLETE";
      
      public static const LOG_SENT_FAIL:String = "LOG_SENT_FAIL";
      
      public static const SOURCE_FVM:String = "SOURCE_FVM";
      
      public static const SOURCE_PLAYER:String = "SOURCE_PLAYER";
      
      private static var _instance:UtilErrorLogger = null;
       
      
      private var _log:Array;
      
      private var _movieId:String;
      
      private var _lastTimeErrorShown:Date;
      
      private var _lastTimeLogSent:Date;
      
      private var _hasFatalError:Boolean = false;
      
      private var _source:String;
      
      public function UtilErrorLogger()
      {
         this._log = [];
         this._lastTimeErrorShown = new Date(1999);
         this._lastTimeLogSent = new Date(1999);
         super();
      }
      
      public static function getInstance() : UtilErrorLogger
      {
         if(!_instance)
         {
            _instance = new UtilErrorLogger();
         }
         return _instance;
      }
      
      public function set movieId(param1:String) : void
      {
         this._movieId = param1;
      }
      
      public function appendDebug(param1:String) : void
      {
         this.info(param1);
      }
      
      public function appendError(param1:Error) : void
      {
         this._log.push(param1);
      }
      
      public function appendCustomError(param1:String, param2:Error = null, param3:Object = null) : void
      {
         var _loc4_:NestedError = null;
         if(param2)
         {
            (_loc4_ = new NestedError(param1,param2)).userData = param3 || {};
            this.appendError(_loc4_);
         }
         else
         {
            this.appendDebug(param1);
         }
      }
      
      public function fatal(param1:String) : void
      {
         this._hasFatalError = true;
         var _loc2_:* = getTimer() / 1000 + "s";
         param1 = _loc2_ + " [FATAL] " + param1;
         this._log.push(param1);
         this.dispatchEvent(new Event(FATAL_EVENT_LOGGED));
         this.sendLog(true);
      }
      
      public function error(param1:String) : void
      {
         var _loc2_:* = getTimer() / 1000 + "s";
         param1 = _loc2_ + " [ERROR] " + param1;
         this._log.push(param1);
         this.dispatchEvent(new Event(ERROR_EVENT_LOGGED));
         this.sendLog(true);
      }
      
      public function info(param1:String) : void
      {
         var _loc2_:* = getTimer() / 1000 + "s";
         param1 = _loc2_ + " " + param1;
         this._log.push(param1);
      }
      
      private function getFlashVars() : String
      {
         var _loc1_:URLVariables = new URLVariables();
         var _loc2_:UtilHashArray = Util.getFlashVar();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc1_[_loc2_.getKey(_loc3_)] = _loc2_.getValueByIndex(_loc3_);
            _loc3_++;
         }
         return _loc1_.toString();
      }
      
      private function prepareModel() : Object
      {
         var _loc1_:Number = 100;
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         _loc2_ = this._log.length > _loc1_ ? Number(this._log.length - _loc1_) : Number(0);
         return {
            "env":this.getFlashVars(),
            "err":this._log.slice(_loc2_)
         };
      }
      
      public function getEncryptedDebugInfo(param1:Boolean = false, param2:Boolean = false, param3:String = "") : String
      {
         var _loc4_:String = this.debugInfo;
         if(!param1 && UtilUser.hasAdminFeatures)
         {
            return _loc4_;
         }
         var _loc5_:ByteArray = new ByteArray();
         var _loc6_:Base64Encoder = new Base64Encoder();
         var _loc7_:ByteArray;
         (_loc7_ = new ByteArray()).writeUTFBytes("i32b7!2qM*s82@pT");
         var _loc8_:FastRC4 = new FastRC4(_loc7_);
         _loc5_.writeUTFBytes(_loc4_);
         _loc8_.encrypt(_loc5_);
         _loc6_.encodeBytes(_loc5_);
         var _loc9_:* = (!!param2 ? Capabilities.version + "\n" : "") + _loc6_.flush();
         if(param2)
         {
            _loc9_ += "\n" + "ver:" + param3;
            if(!Util.playerIsUpdated(11,0))
            {
               _loc9_ = (_loc9_ += "\n\n") + "godesk-flag-flash-player-already-obsolete-end";
            }
         }
         return _loc9_;
      }
      
      private function get debugInfo() : String
      {
         var _loc1_:String = "";
         _loc1_ += "movieId: " + this._movieId + "\n";
         _loc1_ += this.systemInfo + "\n";
         _loc1_ += this.flashPlayerInfo + "\n";
         _loc1_ += this.browserInfo + "\n";
         return _loc1_ + ObjectUtil.toString(this.prepareModel());
      }
      
      public function get systemInfo() : String
      {
         return "OS: " + Capabilities.os;
      }
      
      public function get flashPlayerInfo() : String
      {
         return "Flash: " + Capabilities.version + (!!Capabilities.isDebugger ? " (Debugger)" : "");
      }
      
      public function get browserInfo() : String
      {
         var _loc1_:String = "Unknown";
         var _loc2_:String = "Unknown";
         var _loc3_:String = "Not set";
         if(ExternalInterface.available)
         {
            _loc1_ = ExternalInterface.call("navigator.appName.toString");
            _loc2_ = ExternalInterface.call("navigator.appVersion.toString");
            _loc3_ = ExternalInterface.call("navigator.userAgent.toString");
            return "Browser: " + _loc1_ + " (" + _loc2_ + ")\n" + "User Agent: " + _loc3_;
         }
         return "[No ExternalInterface]";
      }
      
      private function sendLog(param1:Boolean = false) : void
      {
         if(this._log.length == 0)
         {
            return;
         }
         if(Capabilities.isDebugger)
         {
            if(this._hasFatalError)
            {
               this.dispatchEvent(new Event(LOG_SENT_COMPLETE));
            }
            return;
         }
         var _loc2_:Date = new Date();
         if(_loc2_.time - this._lastTimeLogSent.time > 60000)
         {
            this._lastTimeLogSent = _loc2_;
            var _loc3_:URLRequest = UtilNetwork.getSendBugReportRequest();
            _loc3_.data["rpt"] = this.getEncryptedDebugInfo(true);
            if(param1)
            {
               _loc3_.data["eml"] = "1";
            }
            if(this._source && this._source != "")
            {
               _loc3_.data["source"] = this._source;
            }
            var _loc4_:URLLoader;
            (_loc4_ = new URLLoader()).addEventListener(Event.COMPLETE,this.onSendLogComplete);
            _loc4_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSendLogError);
            _loc4_.addEventListener(IOErrorEvent.IO_ERROR,this.onSendLogError);
            _loc4_.load(_loc3_);
            return;
         }
      }
      
      private function onSendLogComplete(param1:Event) : void
      {
         var _loc3_:String = null;
         IEventDispatcher(param1.target).removeEventListener(Event.COMPLETE,this.onSendLogComplete);
         IEventDispatcher(param1.target).removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSendLogError);
         IEventDispatcher(param1.target).removeEventListener(IOErrorEvent.IO_ERROR,this.onSendLogError);
         var _loc2_:URLLoader = param1.target as URLLoader;
         if(_loc2_)
         {
            if(_loc2_.dataFormat == URLLoaderDataFormat.TEXT && _loc2_.data)
            {
               _loc3_ = String(_loc2_.data);
               if(_loc3_.charAt(0) == "0")
               {
                  if(this._hasFatalError)
                  {
                     this.dispatchEvent(new Event(LOG_SENT_COMPLETE));
                  }
               }
            }
         }
      }
      
      private function onSendLogError(param1:Event) : void
      {
         IEventDispatcher(param1.target).removeEventListener(Event.COMPLETE,this.onSendLogComplete);
         IEventDispatcher(param1.target).removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSendLogError);
         IEventDispatcher(param1.target).removeEventListener(IOErrorEvent.IO_ERROR,this.onSendLogError);
         if(this._hasFatalError)
         {
            this.dispatchEvent(new Event(LOG_SENT_FAIL));
         }
      }
      
      public function copyLog() : void
      {
         var _loc1_:String = this.getEncryptedDebugInfo(false,true);
         System.setClipboard(_loc1_);
      }
      
      public function set source(param1:String) : void
      {
         this._source = param1;
      }
   }
}
