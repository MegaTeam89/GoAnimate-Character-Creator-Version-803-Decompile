package anifire.component
{
   import anifire.util.UtilErrorLogger;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.ProgressEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.preloaders.IPreloaderDisplay;
   
   public class GoPreloader extends Sprite implements IPreloaderDisplay
   {
       
      
      private var _204959693bgClass:Class;
      
      private var _bg:MovieClip;
      
      private var _bar:Sprite;
      
      private var _width:Number = 0;
      
      private var _height:Number = 0;
      
      public function GoPreloader()
      {
         this._204959693bgClass = GoPreloader_bgClass;
         super();
         this._bg = new this.bgClass();
         addChild(this._bg);
         this._bar = new Sprite();
         this._bg.addChild(this._bar);
         this._bar.x = 50;
         this._bar.y = 95;
         this._bar.graphics.beginFill(0,0.1);
         this._bar.graphics.drawRect(-5,6,216,15);
         this._bar.graphics.lineStyle(1,11184810);
         this._bar.graphics.beginFill(16777215);
         this._bar.graphics.drawRect(0,0,216,15);
         this._bar.graphics.endFill();
         this.visible = false;
      }
      
      private function initMessage(param1:String = "en_US") : void
      {
         if(param1 == null)
         {
            param1 = "en_US";
         }
         var _loc2_:XML = <msg>
					<status>
						<en_US>Loading...</en_US>
						<zh_TW>下載中...</zh_TW>
						<ja_JP>ダウンロード...</ja_JP>
					</status>
				</msg>;
         var _loc3_:TextField = new TextField();
         this._bg.addChild(_loc3_);
         _loc3_.x = 0;
         _loc3_.width = 300;
         _loc3_.y = 70;
         var _loc4_:TextFormat;
         (_loc4_ = new TextFormat()).align = TextFormatAlign.CENTER;
         _loc4_.color = 11184810;
         _loc4_.size = 14;
         _loc4_.font = "trebuchet MS";
         _loc3_.defaultTextFormat = _loc4_;
         _loc3_.text = _loc2_.status.child(param1);
      }
      
      public function set preloader(param1:Sprite) : void
      {
         var preloader:Sprite = param1;
         preloader.addEventListener(ProgressEvent.PROGRESS,this.handleProgress);
         preloader.addEventListener(Event.COMPLETE,this.handleComplete);
         preloader.addEventListener(FlexEvent.INIT_PROGRESS,this.handleInitProgress);
         preloader.addEventListener(FlexEvent.INIT_COMPLETE,this.handleInitComplete);
         var tlang:String = "en_US";
         try
         {
            tlang = preloader.loaderInfo.parameters["tlang"];
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("preloader",e);
            tlang = "en_US";
         }
         this.initMessage(tlang);
      }
      
      public function initialize() : void
      {
      }
      
      private function handleProgress(param1:ProgressEvent) : void
      {
         this._bar.graphics.beginFill(16742400);
         this._bar.graphics.lineStyle(1,16777215);
         this._bar.graphics.drawRect(5,5,206 * param1.bytesLoaded / param1.bytesTotal,5);
         this._bar.graphics.endFill();
         this.centerPreloader();
      }
      
      private function handleComplete(param1:Event) : void
      {
      }
      
      private function handleInitProgress(param1:Event) : void
      {
      }
      
      private function handleInitComplete(param1:Event) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      private function dispatchComplete(param1:TimerEvent) : void
      {
         dispatchEvent(new Event(Event.COMPLETE));
      }
      
      public function get backgroundColor() : uint
      {
         return 16777215;
      }
      
      public function set backgroundColor(param1:uint) : void
      {
      }
      
      public function get backgroundAlpha() : Number
      {
         return 0;
      }
      
      public function set backgroundAlpha(param1:Number) : void
      {
      }
      
      public function get backgroundImage() : Object
      {
         return undefined;
      }
      
      public function set backgroundImage(param1:Object) : void
      {
      }
      
      public function get backgroundSize() : String
      {
         return "";
      }
      
      public function set backgroundSize(param1:String) : void
      {
      }
      
      public function get stageWidth() : Number
      {
         return this._width;
      }
      
      public function set stageWidth(param1:Number) : void
      {
         this._width = param1;
      }
      
      public function get stageHeight() : Number
      {
         return this._height;
      }
      
      public function set stageHeight(param1:Number) : void
      {
         this._height = param1;
      }
      
      private function centerPreloader() : void
      {
         if(this.stage)
         {
            this.x = (this.stage.stageWidth - 304) / 2;
            this.y = (this.stage.stageHeight - 123) / 2;
            this.visible = true;
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bgClass() : Class
      {
         return this._204959693bgClass;
      }
      
      public function set bgClass(param1:Class) : void
      {
         var _loc2_:Object = this._204959693bgClass;
         if(_loc2_ !== param1)
         {
            this._204959693bgClass = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgClass",_loc2_,param1));
            }
         }
      }
   }
}
