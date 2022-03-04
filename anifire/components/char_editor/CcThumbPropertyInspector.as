package anifire.components.char_editor
{
   import anifire.cc_theme_lib.CcComponent;
   import anifire.constant.CcLibConstant;
   import anifire.event.CcThumbPropertyEvent;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.events.PropertyChangeEvent;
   
   public class CcThumbPropertyInspector extends HBox
   {
       
      
      private var _204767493bgCross:FourDirectionControl;
      
      private var _349934417btnOffsetDown:Button;
      
      private var _1023827210btnOffsetUp:Button;
      
      private var _923101209btnRotateDown:Button;
      
      private var _1739506642btnRotateUp:Button;
      
      private var _1756165648btnScaleDown:Button;
      
      private var _721380233btnScaleUp:Button;
      
      private var _978900240btnXScaleDown:Button;
      
      private var _255766423btnXScaleUp:Button;
      
      private var _1175413745btnYScaleDown:Button;
      
      private var _1487043912btnYScaleUp:Button;
      
      private var _1347049836controlBothScale:VBox;
      
      private var _1634564627controlScale:ViewStack;
      
      private var _996522863controlXScale:VBox;
      
      private var _984485580controlXYScale:HBox;
      
      private var _1025152014controlYScale:VBox;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _component:CcComponent;
      
      private var _timer:Timer;
      
      private var _type:String;
      
      public function CcThumbPropertyInspector()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":HBox,
            "stylesFactory":function():void
            {
               this.horizontalAlign = "left";
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":FourDirectionControl,
                  "id":"bgCross"
               }),new UIComponentDescriptor({
                  "type":ViewStack,
                  "id":"controlScale",
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":VBox,
                        "id":"controlBothScale",
                        "propertiesFactory":function():Object
                        {
                           return {"childDescriptors":[new UIComponentDescriptor({
                              "type":Button,
                              "id":"btnScaleUp",
                              "events":{
                                 "mouseDown":"__btnScaleUp_mouseDown",
                                 "mouseOut":"__btnScaleUp_mouseOut",
                                 "mouseUp":"__btnScaleUp_mouseUp"
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "styleName":"btnPropertyScaleUp",
                                    "buttonMode":true
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Button,
                              "id":"btnScaleDown",
                              "events":{
                                 "mouseDown":"__btnScaleDown_mouseDown",
                                 "mouseOut":"__btnScaleDown_mouseOut",
                                 "mouseUp":"__btnScaleDown_mouseUp"
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "styleName":"btnPropertyScaleDown",
                                    "buttonMode":true
                                 };
                              }
                           })]};
                        }
                     }),new UIComponentDescriptor({
                        "type":HBox,
                        "id":"controlXYScale",
                        "propertiesFactory":function():Object
                        {
                           return {
                              "horizontalScrollPolicy":"off",
                              "verticalScrollPolicy":"off",
                              "childDescriptors":[new UIComponentDescriptor({
                                 "type":VBox,
                                 "id":"controlXScale",
                                 "propertiesFactory":function():Object
                                 {
                                    return {"childDescriptors":[new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"btnXScaleUp",
                                       "events":{
                                          "mouseDown":"__btnXScaleUp_mouseDown",
                                          "mouseOut":"__btnXScaleUp_mouseOut",
                                          "mouseUp":"__btnXScaleUp_mouseUp"
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "styleName":"btnPropertyXScaleUp",
                                             "buttonMode":true
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"btnXScaleDown",
                                       "events":{
                                          "mouseDown":"__btnXScaleDown_mouseDown",
                                          "mouseOut":"__btnXScaleDown_mouseOut",
                                          "mouseUp":"__btnXScaleDown_mouseUp"
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "styleName":"btnPropertyXScaleDown",
                                             "buttonMode":true
                                          };
                                       }
                                    })]};
                                 }
                              }),new UIComponentDescriptor({
                                 "type":VBox,
                                 "id":"controlYScale",
                                 "propertiesFactory":function():Object
                                 {
                                    return {"childDescriptors":[new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"btnYScaleUp",
                                       "events":{
                                          "mouseDown":"__btnYScaleUp_mouseDown",
                                          "mouseOut":"__btnYScaleUp_mouseOut",
                                          "mouseUp":"__btnYScaleUp_mouseUp"
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "styleName":"btnPropertyYScaleUp",
                                             "buttonMode":true
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Button,
                                       "id":"btnYScaleDown",
                                       "events":{
                                          "mouseDown":"__btnYScaleDown_mouseDown",
                                          "mouseOut":"__btnYScaleDown_mouseOut",
                                          "mouseUp":"__btnYScaleDown_mouseUp"
                                       },
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "styleName":"btnPropertyYScaleDown",
                                             "buttonMode":true
                                          };
                                       }
                                    })]};
                                 }
                              })]
                           };
                        }
                     })]};
                  }
               }),new UIComponentDescriptor({
                  "type":VBox,
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnRotateUp",
                        "events":{
                           "mouseDown":"__btnRotateUp_mouseDown",
                           "mouseOut":"__btnRotateUp_mouseOut",
                           "mouseUp":"__btnRotateUp_mouseUp"
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "styleName":"btnPropertyRotateUp",
                              "buttonMode":true
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnRotateDown",
                        "events":{
                           "mouseDown":"__btnRotateDown_mouseDown",
                           "mouseOut":"__btnRotateDown_mouseOut",
                           "mouseUp":"__btnRotateDown_mouseUp"
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "styleName":"btnPropertyRotateDown",
                              "buttonMode":true
                           };
                        }
                     })]};
                  }
               }),new UIComponentDescriptor({
                  "type":VBox,
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnOffsetUp",
                        "events":{
                           "mouseDown":"__btnOffsetUp_mouseDown",
                           "mouseOut":"__btnOffsetUp_mouseOut",
                           "mouseUp":"__btnOffsetUp_mouseUp"
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "styleName":"btnPropertyOffsetUp",
                              "buttonMode":true
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":Button,
                        "id":"btnOffsetDown",
                        "events":{
                           "mouseDown":"__btnOffsetDown_mouseDown",
                           "mouseOut":"__btnOffsetDown_mouseOut",
                           "mouseUp":"__btnOffsetDown_mouseUp"
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "styleName":"btnPropertyOffsetDown",
                              "buttonMode":true
                           };
                        }
                     })]};
                  }
               })]};
            }
         });
         super();
         mx_internal::_document = this;
         this.percentWidth = 100;
         this.verticalScrollPolicy = "off";
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         var factory:IFlexModuleFactory = param1;
         super.moduleFactory = factory;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
         if(!this.styleDeclaration)
         {
            this.styleDeclaration = new CSSStyleDeclaration(null,styleManager);
         }
         this.styleDeclaration.defaultFactory = function():void
         {
            this.horizontalAlign = "left";
         };
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function init(param1:CcComponent, param2:int = 0) : void
      {
         if(!CcLibConstant.HAS_DETAIL_CONTROL)
         {
            return;
         }
         this._timer = new Timer(200,1);
         this._component = param1;
         if(CcLibConstant.ALL_HEAD_COMPONENT_TYPES.indexOf(this._component.componentThumb.type) > -1)
         {
            this.visible = true;
         }
         else
         {
            this.visible = false;
         }
         if(CcLibConstant.ALL_OFFSETABLE_COMPONENT_TYPES.indexOf(this._component.componentThumb.type) > -1)
         {
            this.btnOffsetUp.visible = true;
            this.btnOffsetDown.visible = true;
         }
         else
         {
            this.btnOffsetUp.visible = false;
            this.btnOffsetDown.visible = false;
         }
         if(param2 == 0)
         {
            this.controlScale.selectedChild = this.controlBothScale;
            this.controlScale.width = this.btnScaleUp.width;
         }
         else
         {
            this.controlScale.selectedChild = this.controlXYScale;
            this.controlScale.width = this.btnXScaleUp.width + this.btnYScaleUp.width + 7;
         }
         this.bgCross.addEventListener(CcThumbPropertyEvent.CCPROP_UP_BUTTON_CLICK,this.onCrossDown);
         this.bgCross.addEventListener(CcThumbPropertyEvent.CCPROP_DOWN_BUTTON_CLICK,this.onCrossDown);
         this.bgCross.addEventListener(CcThumbPropertyEvent.CCPROP_LEFT_BUTTON_CLICK,this.onCrossDown);
         this.bgCross.addEventListener(CcThumbPropertyEvent.CCPROP_RIGHT_BUTTON_CLICK,this.onCrossDown);
      }
      
      private function onCrossDown(param1:Event) : void
      {
         CcThumbPropertyEvent(param1).component = this._component;
         this.dispatch(param1);
      }
      
      private function onMouseDown(param1:Event) : void
      {
         var _loc2_:CcThumbPropertyEvent = null;
         this._type = this.getTypeByEventTarget(param1.currentTarget);
         _loc2_ = new CcThumbPropertyEvent(this._type,this);
         _loc2_.component = this._component;
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
         _loc3_.component = this._component;
         this.dispatch(_loc3_);
      }
      
      private function onClick(param1:Event) : void
      {
         var _loc3_:CcThumbPropertyEvent = null;
         var _loc2_:String = this.getTypeByEventTarget(param1.currentTarget);
         _loc3_ = new CcThumbPropertyEvent(_loc2_,this);
         _loc3_.component = this._component;
         this.dispatch(_loc3_);
      }
      
      public function destroy() : void
      {
         this.visible = false;
      }
      
      private function dispatch(param1:Event) : void
      {
         var _loc2_:CcThumbPropertyEvent = CcThumbPropertyEvent(param1).clone() as CcThumbPropertyEvent;
         _loc2_.component = this._component;
         this.dispatchEvent(_loc2_);
      }
      
      private function getTypeByEventTarget(param1:Object) : String
      {
         var _loc2_:String = "";
         switch(param1)
         {
            case this.btnRotateUp:
               _loc2_ = CcThumbPropertyEvent.CCPROP_ROTATEUP_BUTTON_CLICK;
               break;
            case this.btnRotateDown:
               _loc2_ = CcThumbPropertyEvent.CCPROP_ROTATEDOWN_BUTTON_CLICK;
               break;
            case this.btnScaleUp:
               _loc2_ = CcThumbPropertyEvent.CCPROP_SCALEUP_BUTTON_CLICK;
               break;
            case this.btnScaleDown:
               _loc2_ = CcThumbPropertyEvent.CCPROP_SCALEDOWN_BUTTON_CLICK;
               break;
            case this.btnXScaleUp:
               _loc2_ = CcThumbPropertyEvent.CCPROP_SCALEXUP_BUTTON_CLICK;
               break;
            case this.btnXScaleDown:
               _loc2_ = CcThumbPropertyEvent.CCPROP_SCALEXDOWN_BUTTON_CLICK;
               break;
            case this.btnYScaleUp:
               _loc2_ = CcThumbPropertyEvent.CCPROP_SCALEYUP_BUTTON_CLICK;
               break;
            case this.btnYScaleDown:
               _loc2_ = CcThumbPropertyEvent.CCPROP_SCALEYDOWN_BUTTON_CLICK;
               break;
            case this.btnOffsetUp:
               _loc2_ = CcThumbPropertyEvent.CCPROP_OFFSETUP_BUTTON_CLICK;
               break;
            case this.btnOffsetDown:
               _loc2_ = CcThumbPropertyEvent.CCPROP_OFFSETDOWN_BUTTON_CLICK;
         }
         return _loc2_;
      }
      
      public function __btnScaleUp_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnScaleUp_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnScaleUp_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnScaleDown_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnScaleDown_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnScaleDown_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnXScaleUp_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnXScaleUp_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnXScaleUp_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnXScaleDown_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnXScaleDown_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnXScaleDown_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnYScaleUp_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnYScaleUp_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnYScaleUp_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnYScaleDown_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnYScaleDown_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnYScaleDown_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnRotateUp_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnRotateUp_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnRotateUp_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnRotateDown_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnRotateDown_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnRotateDown_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnOffsetUp_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnOffsetUp_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnOffsetUp_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnOffsetDown_mouseDown(param1:MouseEvent) : void
      {
         this.onMouseDown(param1);
      }
      
      public function __btnOffsetDown_mouseOut(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      public function __btnOffsetDown_mouseUp(param1:MouseEvent) : void
      {
         this.onMouseUp(param1);
      }
      
      [Bindable(event="propertyChange")]
      public function get bgCross() : FourDirectionControl
      {
         return this._204767493bgCross;
      }
      
      public function set bgCross(param1:FourDirectionControl) : void
      {
         var _loc2_:Object = this._204767493bgCross;
         if(_loc2_ !== param1)
         {
            this._204767493bgCross = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bgCross",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOffsetDown() : Button
      {
         return this._349934417btnOffsetDown;
      }
      
      public function set btnOffsetDown(param1:Button) : void
      {
         var _loc2_:Object = this._349934417btnOffsetDown;
         if(_loc2_ !== param1)
         {
            this._349934417btnOffsetDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOffsetDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnOffsetUp() : Button
      {
         return this._1023827210btnOffsetUp;
      }
      
      public function set btnOffsetUp(param1:Button) : void
      {
         var _loc2_:Object = this._1023827210btnOffsetUp;
         if(_loc2_ !== param1)
         {
            this._1023827210btnOffsetUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnOffsetUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRotateDown() : Button
      {
         return this._923101209btnRotateDown;
      }
      
      public function set btnRotateDown(param1:Button) : void
      {
         var _loc2_:Object = this._923101209btnRotateDown;
         if(_loc2_ !== param1)
         {
            this._923101209btnRotateDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRotateDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRotateUp() : Button
      {
         return this._1739506642btnRotateUp;
      }
      
      public function set btnRotateUp(param1:Button) : void
      {
         var _loc2_:Object = this._1739506642btnRotateUp;
         if(_loc2_ !== param1)
         {
            this._1739506642btnRotateUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRotateUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnScaleDown() : Button
      {
         return this._1756165648btnScaleDown;
      }
      
      public function set btnScaleDown(param1:Button) : void
      {
         var _loc2_:Object = this._1756165648btnScaleDown;
         if(_loc2_ !== param1)
         {
            this._1756165648btnScaleDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnScaleDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnScaleUp() : Button
      {
         return this._721380233btnScaleUp;
      }
      
      public function set btnScaleUp(param1:Button) : void
      {
         var _loc2_:Object = this._721380233btnScaleUp;
         if(_loc2_ !== param1)
         {
            this._721380233btnScaleUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnScaleUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnXScaleDown() : Button
      {
         return this._978900240btnXScaleDown;
      }
      
      public function set btnXScaleDown(param1:Button) : void
      {
         var _loc2_:Object = this._978900240btnXScaleDown;
         if(_loc2_ !== param1)
         {
            this._978900240btnXScaleDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnXScaleDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnXScaleUp() : Button
      {
         return this._255766423btnXScaleUp;
      }
      
      public function set btnXScaleUp(param1:Button) : void
      {
         var _loc2_:Object = this._255766423btnXScaleUp;
         if(_loc2_ !== param1)
         {
            this._255766423btnXScaleUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnXScaleUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYScaleDown() : Button
      {
         return this._1175413745btnYScaleDown;
      }
      
      public function set btnYScaleDown(param1:Button) : void
      {
         var _loc2_:Object = this._1175413745btnYScaleDown;
         if(_loc2_ !== param1)
         {
            this._1175413745btnYScaleDown = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYScaleDown",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnYScaleUp() : Button
      {
         return this._1487043912btnYScaleUp;
      }
      
      public function set btnYScaleUp(param1:Button) : void
      {
         var _loc2_:Object = this._1487043912btnYScaleUp;
         if(_loc2_ !== param1)
         {
            this._1487043912btnYScaleUp = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnYScaleUp",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get controlBothScale() : VBox
      {
         return this._1347049836controlBothScale;
      }
      
      public function set controlBothScale(param1:VBox) : void
      {
         var _loc2_:Object = this._1347049836controlBothScale;
         if(_loc2_ !== param1)
         {
            this._1347049836controlBothScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlBothScale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get controlScale() : ViewStack
      {
         return this._1634564627controlScale;
      }
      
      public function set controlScale(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1634564627controlScale;
         if(_loc2_ !== param1)
         {
            this._1634564627controlScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlScale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get controlXScale() : VBox
      {
         return this._996522863controlXScale;
      }
      
      public function set controlXScale(param1:VBox) : void
      {
         var _loc2_:Object = this._996522863controlXScale;
         if(_loc2_ !== param1)
         {
            this._996522863controlXScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlXScale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get controlXYScale() : HBox
      {
         return this._984485580controlXYScale;
      }
      
      public function set controlXYScale(param1:HBox) : void
      {
         var _loc2_:Object = this._984485580controlXYScale;
         if(_loc2_ !== param1)
         {
            this._984485580controlXYScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlXYScale",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get controlYScale() : VBox
      {
         return this._1025152014controlYScale;
      }
      
      public function set controlYScale(param1:VBox) : void
      {
         var _loc2_:Object = this._1025152014controlYScale;
         if(_loc2_ !== param1)
         {
            this._1025152014controlYScale = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"controlYScale",_loc2_,param1));
            }
         }
      }
   }
}
