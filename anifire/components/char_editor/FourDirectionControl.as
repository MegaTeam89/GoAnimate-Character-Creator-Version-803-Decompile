package anifire.components.char_editor
{
   import anifire.cc_theme_lib.CcComponent;
   import anifire.event.CcThumbPropertyEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.containers.Canvas;
   import mx.controls.Button;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.events.PropertyChangeEvent;
   
   public class FourDirectionControl extends Canvas
   {
       
      
      private var _205752606btnDown:Button;
      
      private var _205980803btnLeft:Button;
      
      private var _2096098592btnRight:Button;
      
      private var _94069271btnUp:Button;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _component:CcComponent;
      
      private var _timer:Timer;
      
      private var _type:String;
      
      public function FourDirectionControl()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {
                  "width":82,
                  "height":77,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Button,
                     "id":"btnUp",
                     "events":{
                        "mouseDown":"__btnUp_mouseDown",
                        "mouseOut":"__btnUp_mouseOut",
                        "mouseUp":"__btnUp_mouseUp"
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":30,
                           "y":1,
                           "styleName":"btnPropertyArrowUp",
                           "buttonMode":true
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Button,
                     "id":"btnDown",
                     "events":{
                        "mouseDown":"__btnDown_mouseDown",
                        "mouseOut":"__btnDown_mouseOut",
                        "mouseUp":"__btnDown_mouseUp"
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":30,
                           "y":55,
                           "styleName":"btnPropertyArrowDown",
                           "buttonMode":true
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Button,
                     "id":"btnLeft",
                     "events":{
                        "mouseDown":"__btnLeft_mouseDown",
                        "mouseOut":"__btnLeft_mouseOut",
                        "mouseUp":"__btnLeft_mouseUp"
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":1,
                           "y":28,
                           "styleName":"btnPropertyArrowLeft",
                           "buttonMode":true
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":Button,
                     "id":"btnRight",
                     "events":{
                        "mouseDown":"__btnRight_mouseDown",
                        "mouseOut":"__btnRight_mouseOut",
                        "mouseUp":"__btnRight_mouseUp"
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":59,
                           "y":28,
                           "styleName":"btnPropertyArrowRight",
                           "buttonMode":true
                        };
                     }
                  })]
               };
            }
         });
         super();
         mx_internal::_document = this;
         this.styleName = "bgPropertyCross";
         this.width = 82;
         this.height = 77;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function onMouseDown(param1:Event) : void
      {
         var _loc2_:CcThumbPropertyEvent = null;
         this._type = this.getTypeByEventTarget(param1.currentTarget);
         _loc2_ = new CcThumbPropertyEvent(this._type,this);
         this.dispatch(_loc2_);
         this._timer = new Timer(1000,1);
         this._timer.addEventListener(TimerEvent.TIMER,this.doFirstTimer);
         this._timer.start();
      }
      
      private function onMouseUp(param1:Event) : void
      {
         var _loc2_:CcThumbPropertyEvent = null;
         if(this._timer != null && this._timer.running)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.doTimer);
            _loc2_ = new CcThumbPropertyEvent(CcThumbPropertyEvent.CCPROP_LOCATION_UPDATE,this);
            this.dispatch(_loc2_);
         }
      }
      
      private function doFirstTimer(param1:TimerEvent) : void
      {
         this._timer.stop();
         this._timer.removeEventListener(TimerEvent.TIMER,this.doFirstTimer);
         this._timer = new Timer(20);
         this._timer.addEventListener(TimerEvent.TIMER,this.doTimer);
         this._timer.start();
      }
      
      private function doTimer(param1:TimerEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:CcThumbPropertyEvent = null;
         _loc2_ = this._type;
         _loc3_ = new CcThumbPropertyEvent(_loc2_,this);
         this.dispatch(_loc3_);
      }
      
      private function onClick(param1:Event) : void
      {
         var _loc3_:CcThumbPropertyEvent = null;
         var _loc2_:String = this.getTypeByEventTarget(param1.currentTarget);
         _loc3_ = new CcThumbPropertyEvent(_loc2_,this);
         this.dispatch(_loc3_);
      }
      
      public function destroy() : void
      {
         this.visible = false;
      }
      
      private function dispatch(param1:Event) : void
      {
         this.dispatchEvent(param1);
      }
      
      private function getTypeByEventTarget(param1:Object) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case this.btnUp:
               _loc2_ = CcThumbPropertyEvent.CCPROP_UP_BUTTON_CLICK;
               break;
            case this.btnDown:
               _loc2_ = CcThumbPropertyEvent.CCPROP_DOWN_BUTTON_CLICK;
               break;
            case this.btnLeft:
               _loc2_ = CcThumbPropertyEvent.CCPROP_LEFT_BUTTON_CLICK;
               break;
            case this.btnRight:
               _loc2_ = CcThumbPropertyEvent.CCPROP_RIGHT_BUTTON_CLICK;
         }
         return _loc2_;
      }
      
      public function __btnUp_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnUp_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnUp_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnDown_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnDown_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnDown_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnLeft_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnLeft_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnLeft_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnRight_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnRight_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnRight_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get btnDown() : Button
      {
         return this._205752606btnDown;
      }
      
      public function set btnDown(param1:Button) : void
      {
         var _loc2_:Object = this._205752606btnDown;
         if(_loc2_ !== param1)
         {
            this._205752606btnDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnLeft() : Button
      {
         return this._205980803btnLeft;
      }
      
      public function set btnLeft(param1:Button) : void
      {
         var _loc2_:Object = this._205980803btnLeft;
         if(_loc2_ !== param1)
         {
            this._205980803btnLeft = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnLeft",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRight() : Button
      {
         return this._2096098592btnRight;
      }
      
      public function set btnRight(param1:Button) : void
      {
         var _loc2_:Object = this._2096098592btnRight;
         if(_loc2_ !== param1)
         {
            this._2096098592btnRight = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRight",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnUp() : Button
      {
         return this._94069271btnUp;
      }
      
      public function set btnUp(param1:Button) : void
      {
         var _loc2_:Object = this._94069271btnUp;
         if(_loc2_ !== param1)
         {
            this._94069271btnUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnUp",_loc2_,param1));
            }
         }
      }
   }
}
