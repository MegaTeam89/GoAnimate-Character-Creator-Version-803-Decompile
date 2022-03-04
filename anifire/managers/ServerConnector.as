package anifire.managers
{
   import anifire.constant.ServerConstants;
   import anifire.event.StudioEvent;
   import anifire.util.Util;
   import anifire.util.UtilErrorLogger;
   import anifire.util.UtilUser;
   import com.adobe.serialization.json.JSON;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   
   public class ServerConnector extends EventDispatcher
   {
      
      private static var _instance:ServerConnector;
       
      
      private var _logger:UtilErrorLogger;
      
      public function ServerConnector()
      {
         super();
         this._logger = UtilErrorLogger.getInstance();
         if(ExternalInterface.available)
         {
            ExternalInterface.addCallback("onUpsellUpgrade",this.onUpsellUpgradePending);
         }
      }
      
      public static function get instance() : ServerConnector
      {
         if(!_instance)
         {
            _instance = new ServerConnector();
         }
         return _instance;
      }
      
      public function displayUpsellHook(param1:String) : void
      {
         if(ExternalInterface.available)
         {
            ExternalInterface.call("triggerUpsell",param1);
         }
      }
      
      public function onUpsellUpgradePending() : void
      {
         dispatchEvent(new StudioEvent(StudioEvent.UPGRADE_PENDING));
      }
      
      public function refreshUserType() : void
      {
         var _loc1_:URLVariables = new URLVariables();
         Util.addFlashVarsToURLvar(_loc1_);
         var _loc2_:URLRequest = new URLRequest(ServerConstants.ACTION_GET_INIT_PARAMS);
         _loc2_.data = _loc1_;
         _loc2_.method = URLRequestMethod.POST;
         var _loc3_:URLLoader = new URLLoader();
         _loc3_.addEventListener(Event.COMPLETE,this.onRefreshUserTypeComplete);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.onRefreshUserTypeError);
         _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onRefreshUserTypeError);
         _loc3_.load(_loc2_);
      }
      
      private function onRefreshUserTypeComplete(param1:Event) : void
      {
         var result:Object = null;
         var newUserType:Number = NaN;
         var event:Event = param1;
         var urlLoader:URLLoader = event.target as URLLoader;
         urlLoader.removeEventListener(Event.COMPLETE,this.onRefreshUserTypeComplete);
         urlLoader.removeEventListener(IOErrorEvent.IO_ERROR,this.onRefreshUserTypeError);
         urlLoader.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onRefreshUserTypeError);
         try
         {
            result = com.adobe.serialization.json.JSON.decode(urlLoader.data);
            if(result["result"] != true)
            {
               this.dispatchRefreshUserTypeError(result["message"]);
               return;
            }
            newUserType = result["ut"];
            UtilUser.updateUserType(newUserType);
            this._logger.info("User type upgraded to: " + newUserType);
         }
         catch(e:Error)
         {
            dispatchRefreshUserTypeError(e.message,e);
            return;
         }
         dispatchEvent(new StudioEvent(StudioEvent.UPGRADE_COMPLETE));
      }
      
      private function onRefreshUserTypeError(param1:Event) : void
      {
         var _loc2_:URLLoader = param1.target as URLLoader;
         _loc2_.removeEventListener(Event.COMPLETE,this.onRefreshUserTypeComplete);
         _loc2_.removeEventListener(IOErrorEvent.IO_ERROR,this.onRefreshUserTypeError);
         _loc2_.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onRefreshUserTypeError);
         this.dispatchRefreshUserTypeError(param1.toString());
      }
      
      private function dispatchRefreshUserTypeError(param1:String = "", param2:Error = null) : void
      {
         this._logger.appendCustomError("Upgrade error: " + param1,param2);
         dispatchEvent(new StudioEvent(StudioEvent.UPGRADE_ERROR));
      }
   }
}
