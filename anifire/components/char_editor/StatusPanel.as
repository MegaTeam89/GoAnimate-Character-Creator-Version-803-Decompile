package anifire.components.char_editor
{
   import anifire.constant.CcLibConstant;
   import anifire.util.UtilDict;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.Label;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.utils.StringUtil;
   
   use namespace mx_internal;
   
   public class StatusPanel extends VBox implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _StatusPanel_Canvas1:Canvas;
      
      public var _StatusPanel_HBox2:HBox;
      
      private var _1240618781gobuck:Label;
      
      private var _1789892366gocoupon:Text;
      
      private var _208279976gopoint:Label;
      
      private var _106433028panel:HBox;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _isUsDollarShown:Boolean;
      
      private var _1805325765_showGP:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function StatusPanel()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":VBox,
            "events":{"creationComplete":"___StatusPanel_VBox1_creationComplete"},
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"_StatusPanel_Canvas1",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "horizontalScrollPolicy":"off",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Text,
                           "id":"gocoupon",
                           "stylesFactory":function():void
                           {
                              this.fontSize = 14;
                              this.color = 6710886;
                              this.textAlign = "center";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "text":"",
                                 "truncateToFit":true,
                                 "percentWidth":100,
                                 "height":42,
                                 "selectable":false
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":HBox,
                  "id":"panel",
                  "stylesFactory":function():void
                  {
                     this.horizontalAlign = "center";
                     this.verticalAlign = "middle";
                     this.horizontalGap = 8;
                     this.paddingLeft = 8;
                     this.paddingRight = 8;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {"childDescriptors":[new UIComponentDescriptor({
                        "type":HBox,
                        "id":"_StatusPanel_HBox2",
                        "propertiesFactory":function():Object
                        {
                           return {"childDescriptors":[new UIComponentDescriptor({
                              "type":Canvas,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "styleName":"imgGoPoint",
                                    "width":36,
                                    "height":36,
                                    "clipContent":false,
                                    "scaleX":0.8,
                                    "scaleY":0.8
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Label,
                              "id":"gopoint",
                              "stylesFactory":function():void
                              {
                                 this.fontSize = 18;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "text":"gopoint",
                                    "truncateToFit":false
                                 };
                              }
                           })]};
                        }
                     }),new UIComponentDescriptor({
                        "type":Canvas,
                        "propertiesFactory":function():Object
                        {
                           return {
                              "styleName":"imgGoBuck",
                              "width":36,
                              "height":36,
                              "clipContent":false,
                              "scaleX":0.8,
                              "scaleY":0.8
                           };
                        }
                     }),new UIComponentDescriptor({
                        "type":Label,
                        "id":"gobuck",
                        "stylesFactory":function():void
                        {
                           this.fontSize = 18;
                        },
                        "propertiesFactory":function():Object
                        {
                           return {
                              "text":"gobuck",
                              "truncateToFit":false
                           };
                        }
                     })]};
                  }
               })]};
            }
         });
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._StatusPanel_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_char_editor_StatusPanelWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return StatusPanel[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.clipContent = true;
         this.addEventListener("creationComplete",this.___StatusPanel_VBox1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         StatusPanel._watcherSetupUtil = param1;
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
      
      public function set isUsDollarShown(param1:Boolean) : void
      {
         this._isUsDollarShown = param1;
      }
      
      public function get isUsDollarShown() : Boolean
      {
         return this._isUsDollarShown;
      }
      
      public function set goPointsShown(param1:Boolean) : void
      {
         this._showGP = param1;
      }
      
      public function get goPointsShown() : Boolean
      {
         return this._showGP;
      }
      
      public function init() : void
      {
         this.setGobuck(0);
         this.setGopoint(0);
      }
      
      public function setGopoint(param1:Number, param2:int = 0, param3:Boolean = false) : void
      {
         this.gopoint.text = param1.toString();
         if(!param3 && param2 == CcLibConstant.MONEY_MODE_FREE)
         {
            this.gopoint.text = "0";
         }
         if(param2 == CcLibConstant.MONEY_MODE_DONT_NEED_MONEY)
         {
            this.panel.visible = false;
         }
         this.gopoint.invalidateSize();
      }
      
      public function setGobuck(param1:Number, param2:int = 0, param3:Boolean = false, param4:int = 0) : void
      {
         var _loc5_:int = param1;
         if(param4 > 0)
         {
            _loc5_ = Math.max(param1 - param4,0);
         }
         if(this.isUsDollarShown)
         {
            this.gobuck.text = _loc5_.toString() + " (US$" + (Math.round(_loc5_) / 100).toString() + ")";
         }
         else
         {
            this.gobuck.text = _loc5_.toString();
         }
         if(!param3 && param2 == CcLibConstant.MONEY_MODE_FREE)
         {
            this.gobuck.text = "0";
         }
         if(param2 == CcLibConstant.MONEY_MODE_DONT_NEED_MONEY)
         {
            this.panel.visible = false;
         }
         var _loc6_:int = 0;
         if(param4 > 0)
         {
            _loc6_ = Math.max(param4 - param1,0);
            if(!param3)
            {
               if(param1 <= 0)
               {
                  this.gocoupon.text = UtilDict.toDisplay("cc","Coupon unused");
               }
               else
               {
                  this.gocoupon.text = StringUtil.substitute(UtilDict.toDisplay("cc","Coupon value left \n{0} GoBucks"),_loc6_.toString());
               }
               this.gocoupon.height = 42;
            }
            else
            {
               this.gocoupon.text = "";
               this.gocoupon.height = 0;
            }
            if(_loc5_ <= 0)
            {
               this.gobuck.text = UtilDict.toDisplay("cc","cc_keyword_free");
            }
         }
         else
         {
            this.gocoupon.text = "";
            this.gocoupon.height = 0;
         }
         this.gobuck.invalidateSize();
      }
      
      public function updateGoPointStyle(param1:String, param2:Object, param3:int = 0) : void
      {
         switch(param3)
         {
            case CcLibConstant.MONEY_MODE_NORMAL:
               this.gopoint.setStyle(param1,param2);
               break;
            case CcLibConstant.MONEY_MODE_DONT_NEED_MONEY:
               this.panel.visible = false;
         }
      }
      
      public function updateGoBuckStyle(param1:String, param2:Object, param3:int = 0) : void
      {
         switch(param3)
         {
            case CcLibConstant.MONEY_MODE_NORMAL:
               this.gobuck.setStyle(param1,param2);
               break;
            case CcLibConstant.MONEY_MODE_DONT_NEED_MONEY:
               this.panel.visible = false;
         }
      }
      
      public function ___StatusPanel_VBox1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _StatusPanel_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return Math.max(panel.width,140);
         },null,"_StatusPanel_Canvas1.width");
         result[1] = new Binding(this,function():Boolean
         {
            return this._showGP;
         },null,"_StatusPanel_HBox2.includeInLayout");
         result[2] = new Binding(this,function():Boolean
         {
            return this._showGP;
         },null,"_StatusPanel_HBox2.visible");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get gobuck() : Label
      {
         return this._1240618781gobuck;
      }
      
      public function set gobuck(param1:Label) : void
      {
         var _loc2_:Object = this._1240618781gobuck;
         if(_loc2_ !== param1)
         {
            this._1240618781gobuck = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gobuck",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gocoupon() : Text
      {
         return this._1789892366gocoupon;
      }
      
      public function set gocoupon(param1:Text) : void
      {
         var _loc2_:Object = this._1789892366gocoupon;
         if(_loc2_ !== param1)
         {
            this._1789892366gocoupon = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gocoupon",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get gopoint() : Label
      {
         return this._208279976gopoint;
      }
      
      public function set gopoint(param1:Label) : void
      {
         var _loc2_:Object = this._208279976gopoint;
         if(_loc2_ !== param1)
         {
            this._208279976gopoint = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"gopoint",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get panel() : HBox
      {
         return this._106433028panel;
      }
      
      public function set panel(param1:HBox) : void
      {
         var _loc2_:Object = this._106433028panel;
         if(_loc2_ !== param1)
         {
            this._106433028panel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"panel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get _showGP() : Boolean
      {
         return this._1805325765_showGP;
      }
      
      private function set _showGP(param1:Boolean) : void
      {
         var _loc2_:Object = this._1805325765_showGP;
         if(_loc2_ !== param1)
         {
            this._1805325765_showGP = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_showGP",_loc2_,param1));
            }
         }
      }
   }
}
