package anifire.components.previewAndSave
{
   import anifire.cc_interface.IPurchaseBox;
   import anifire.component.TextButton;
   import anifire.components.char_editor.StatusPanel;
   import anifire.constant.CcLibConstant;
   import anifire.event.CcCoreEvent;
   import anifire.util.UtilDict;
   import anifire.util.UtilUser;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.DropShadowFilter;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.Label;
   import mx.controls.Spacer;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   use namespace mx_internal;
   
   public class PurchaseBox extends VBox implements IPurchaseBox, IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _47713414_boxStatusPanel:HBox;
      
      private var _1464924181_canAddBuck:Canvas;
      
      private var _1352587475_canAddPoints:Canvas;
      
      private var _635300463_canConfirm:Canvas;
      
      private var _1793705886_canNeedLogin:Canvas;
      
      private var _769627786_canRefresh:Canvas;
      
      private var _1957343545_canSubscribe:Canvas;
      
      private var _403552034_haveMoneyBg:Canvas;
      
      private var _1754793715_linkModify:TextButton;
      
      private var _167267856_needMoneyBg:Canvas;
      
      private var _1155746401_vsControl:ViewStack;
      
      private var _1956347456btnAddBuck:Button;
      
      private var _529985515btnAddPoint:Button;
      
      private var _238395196btnConfirm:Button;
      
      private var _398355831btnNeedLogin:Button;
      
      private var _104067873btnRefresh:Button;
      
      private var _145562034btnSubscribe:Button;
      
      private var _1601394826lblCannotSave:Text;
      
      private var _1878334242lblHaveMoney:Label;
      
      private var _68526260lblNeedMoney:Label;
      
      private var _1697255178ps_statusPanel:StatusPanel;
      
      private var _2010652631ps_userPointStatusPanel:StatusPanel;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var showPremium:Boolean = true;
      
      private var enoughBucks:Boolean = true;
      
      private var enoughPoints:Boolean = true;
      
      private var _loggedIn:Boolean = true;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function PurchaseBox()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":VBox,
            "events":{"creationComplete":"___PurchaseBox_VBox1_creationComplete"},
            "stylesFactory":function():void
            {
               this.horizontalAlign = "center";
               this.verticalGap = 12;
            },
            "propertiesFactory":function():Object
            {
               return {
                  "width":400,
                  "height":195,
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":Spacer,
                     "propertiesFactory":function():Object
                     {
                        return {"height":18};
                     }
                  }),new UIComponentDescriptor({
                     "type":HBox,
                     "id":"_boxStatusPanel",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":80,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":VBox,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Label,
                                       "id":"lblHaveMoney",
                                       "events":{"creationComplete":"__lblHaveMoney_creationComplete"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {"styleName":"lblYouHaveYouNeed"};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"_haveMoneyBg",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "width":177,
                                             "height":35,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":StatusPanel,
                                                "id":"ps_userPointStatusPanel",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "scaleX":0.82,
                                                      "scaleY":0.82,
                                                      "width":215,
                                                      "height":42,
                                                      "isUsDollarShown":false
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":VBox,
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Label,
                                       "id":"lblNeedMoney",
                                       "events":{"creationComplete":"__lblNeedMoney_creationComplete"},
                                       "propertiesFactory":function():Object
                                       {
                                          return {"styleName":"lblYouHaveYouNeed"};
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"_needMoneyBg",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "width":177,
                                             "height":35,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":StatusPanel,
                                                "id":"ps_statusPanel",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "scaleX":0.82,
                                                      "scaleY":0.82,
                                                      "width":215,
                                                      "height":42,
                                                      "isUsDollarShown":false
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    })]
                                 };
                              }
                           })]
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":VBox,
                     "stylesFactory":function():void
                     {
                        this.horizontalAlign = "center";
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentHeight":100,
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":Text,
                              "id":"lblCannotSave",
                              "stylesFactory":function():void
                              {
                                 this.color = 16711680;
                                 this.textAlign = "center";
                                 this.fontSize = 14;
                              },
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "horizontalCenter":0,
                                    "text":"Please upgrade your account",
                                    "visible":false,
                                    "percentWidth":80,
                                    "height":50,
                                    "selectable":false
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":ViewStack,
                              "id":"_vsControl",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "width":350,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"_canConfirm",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentHeight":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnConfirm",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "horizontalCenter":0,
                                                      "verticalCenter":1,
                                                      "styleName":"btnConfirmPurchase",
                                                      "width":220,
                                                      "height":45,
                                                      "buttonMode":true
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"_canNeedLogin",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentHeight":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnNeedLogin",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "horizontalCenter":0,
                                                      "verticalCenter":1,
                                                      "styleName":"btnConfirmPurchase",
                                                      "width":220,
                                                      "height":45,
                                                      "buttonMode":true
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"_canAddBuck",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentHeight":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnAddBuck",
                                                "stylesFactory":function():void
                                                {
                                                   this.paddingLeft = 20;
                                                   this.paddingRight = 20;
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "horizontalCenter":0,
                                                      "verticalCenter":1,
                                                      "styleName":"btnConfirmPurchase",
                                                      "height":45,
                                                      "buttonMode":true
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"_canAddPoints",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentHeight":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnAddPoint",
                                                "stylesFactory":function():void
                                                {
                                                   this.paddingLeft = 20;
                                                   this.paddingRight = 20;
                                                },
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "horizontalCenter":0,
                                                      "verticalCenter":1,
                                                      "styleName":"btnConfirmPurchase",
                                                      "height":45,
                                                      "buttonMode":true
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"_canRefresh",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentHeight":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnRefresh",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "horizontalCenter":0,
                                                      "verticalCenter":1,
                                                      "styleName":"btnConfirmPurchase",
                                                      "width":220,
                                                      "height":45,
                                                      "buttonMode":true
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"_canSubscribe",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentHeight":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"btnSubscribe",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "horizontalCenter":0,
                                                      "verticalCenter":1,
                                                      "styleName":"btnConfirmPurchase",
                                                      "width":220,
                                                      "height":45,
                                                      "buttonMode":true
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    })]
                                 };
                              }
                           })]
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":TextButton,
                     "id":"_linkModify"
                  })]
               };
            }
         });
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._PurchaseBox_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_previewAndSave_PurchaseBoxWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PurchaseBox[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 400;
         this.height = 195;
         this.addEventListener("creationComplete",this.___PurchaseBox_VBox1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         PurchaseBox._watcherSetupUtil = param1;
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
            this.horizontalAlign = "center";
            this.verticalGap = 12;
         };
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function get loggedIn() : Boolean
      {
         return this._loggedIn;
      }
      
      public function set loggedIn(param1:Boolean) : void
      {
         this._loggedIn = param1;
         invalidateProperties();
      }
      
      public function get premiumMode() : Boolean
      {
         return this.showPremium;
      }
      
      public function set premiumMode(param1:Boolean) : void
      {
         var _loc2_:* = param1 != this.showPremium;
         this.showPremium = param1;
         if(_loc2_)
         {
            invalidateProperties();
         }
      }
      
      public function get hasEnoughBucks() : Boolean
      {
         return this.enoughBucks;
      }
      
      public function set hasEnoughBucks(param1:Boolean) : void
      {
         var _loc2_:* = param1 != this.enoughBucks;
         this.enoughBucks = param1;
         if(_loc2_)
         {
            invalidateProperties();
         }
      }
      
      public function get hasEnoughPoints() : Boolean
      {
         return this.enoughPoints;
      }
      
      public function set hasEnoughPoints(param1:Boolean) : void
      {
         var _loc2_:* = param1 != this.enoughPoints;
         this.enoughPoints = param1;
         if(_loc2_)
         {
            invalidateProperties();
         }
      }
      
      public function set locked(param1:Boolean) : void
      {
         this.btnConfirm.enabled = !param1;
      }
      
      override protected function commitProperties() : void
      {
         super.commitProperties();
         this._boxStatusPanel.visible = this.showPremium;
         this._boxStatusPanel.includeInLayout = this.showPremium;
         if(!this.loggedIn)
         {
            this.updateButtonText(CcLibConstant.MODE_NEEDLOGIN);
         }
         else if(this.enoughBucks && this.enoughPoints)
         {
            this.updateButtonText(CcLibConstant.MODE_SAVE);
         }
         else if(!this.enoughBucks)
         {
            this.updateButtonText(CcLibConstant.MODE_ADDBUCKS);
         }
         else
         {
            this.updateButtonText(CcLibConstant.MODE_ADDPOINTS);
         }
         if(CcLibConstant.IS_BUSINESS_THEME && !UtilUser.hasBusinessFeatures)
         {
            this.updateButtonText(CcLibConstant.MODE_NEEDSUBSCRIBE);
         }
         else if(UtilUser.userType == UtilUser.BASIC_USER)
         {
            this.updateButtonText(CcLibConstant.MODE_NEEDSUBSCRIBE);
         }
         invalidateDisplayList();
      }
      
      private function onCreationComplete() : void
      {
         var _loc1_:DropShadowFilter = new DropShadowFilter(5,90,0,0.5);
         var _loc2_:Array = new Array();
         _loc2_.push(_loc1_);
         this.filters = _loc2_;
         this.btnConfirm.addEventListener(MouseEvent.CLICK,this.dispatchUserWantToSave);
         this.btnAddBuck.addEventListener(MouseEvent.CLICK,this.dispatchUserWantToAddBucks);
         this.btnAddPoint.addEventListener(MouseEvent.CLICK,this.dispatchUserWantToAddPoints);
         this.btnRefresh.addEventListener(MouseEvent.CLICK,this.dispatchUserWantToRefresh);
         this.btnNeedLogin.addEventListener(MouseEvent.CLICK,this.dispatchUserWantToLogin);
         this.btnSubscribe.addEventListener(MouseEvent.CLICK,this.dispatchUserWantToSubscribe);
         this._linkModify.label = UtilDict.toDisplay("cc","modify");
         this._linkModify.clickFunc = this.onModifyButtonClick;
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         super.updateDisplayList(param1,param2);
         this.graphics.beginFill(15132390,1);
         this.graphics.drawRoundRect(0,0,param1,param2,20,20);
         this.graphics.endFill();
         this._haveMoneyBg.graphics.clear();
         this._needMoneyBg.graphics.clear();
         if(this.enoughBucks && this.enoughPoints)
         {
            this._haveMoneyBg.graphics.lineStyle(1,12303291);
            this._haveMoneyBg.graphics.beginFill(16777215);
         }
         else
         {
            this._haveMoneyBg.graphics.lineStyle(2,16711680);
            this._haveMoneyBg.graphics.beginFill(16169128);
         }
         this._haveMoneyBg.graphics.drawRoundRect(0,0,this._haveMoneyBg.width,this._haveMoneyBg.height,20,20);
         this._haveMoneyBg.graphics.endFill();
         this._needMoneyBg.graphics.beginFill(16777215);
         this._needMoneyBg.graphics.lineStyle(1,12303291);
         this._needMoneyBg.graphics.drawRoundRect(0,0,this._needMoneyBg.width,this._needMoneyBg.height,20,20);
         this._needMoneyBg.graphics.endFill();
      }
      
      public function updateButtonText(param1:int) : void
      {
         if(param1 == CcLibConstant.MODE_SAVE)
         {
            this.btnConfirm.addEventListener(MouseEvent.CLICK,this.dispatchUserWantToSave);
            this._vsControl.selectedChild = this._canConfirm;
         }
         else if(param1 == CcLibConstant.MODE_ADDBUCKS)
         {
            this._vsControl.selectedChild = this._canAddBuck;
         }
         else if(param1 == CcLibConstant.MODE_ADDPOINTS)
         {
            this._vsControl.selectedChild = this._canAddPoints;
         }
         else if(param1 == CcLibConstant.MODE_NEEDLOGIN)
         {
            this._vsControl.selectedChild = this._canNeedLogin;
         }
         else if(param1 == CcLibConstant.MODE_NEEDSUBSCRIBE)
         {
            this._vsControl.selectedChild = this._canSubscribe;
         }
         else
         {
            this._vsControl.selectedChild = this._canRefresh;
         }
      }
      
      public function showCannotSaveText(param1:Event) : void
      {
         this.lblCannotSave.visible = true;
      }
      
      private function dispatchUserWantToSave(param1:Event) : void
      {
         this.btnConfirm.removeEventListener(MouseEvent.CLICK,this.dispatchUserWantToSave);
         this.dispatchEvent(new CcCoreEvent(CcCoreEvent.USER_WANT_TO_CONFIRM,this));
      }
      
      private function dispatchUserWantToAddPoints(param1:Event) : void
      {
         this.dispatchEvent(new CcCoreEvent(CcCoreEvent.USER_WANT_TO_BUY_GOPOINTS,this));
      }
      
      private function dispatchUserWantToAddBucks(param1:Event) : void
      {
         this.updateButtonText(CcLibConstant.MODE_REFRESH);
         this.dispatchEvent(new CcCoreEvent(CcCoreEvent.USER_WANT_TO_BUY_POINT,this));
      }
      
      private function dispatchUserWantToRefresh(param1:Event) : void
      {
         this.dispatchEvent(new CcCoreEvent(CcCoreEvent.USER_WANT_TO_REFRESH,this));
      }
      
      private function dispatchUserWantToLogin(param1:Event) : void
      {
         this.dispatchEvent(new CcCoreEvent(CcCoreEvent.USER_WANT_TO_SIGNUP,this));
      }
      
      public function dispatchUserWantToSubscribe(param1:Event = null) : void
      {
         this.updateButtonText(CcLibConstant.MODE_SAVE);
         this.locked = false;
         this.dispatchEvent(new CcCoreEvent(CcCoreEvent.USER_WANT_TO_SUBSCRIBE,this));
      }
      
      private function onModifyButtonClick(param1:Event = null) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_CANCEL,this);
         this.dispatchEvent(_loc2_);
      }
      
      public function set userCannotSave(param1:Boolean) : void
      {
         this.lblCannotSave.visible = true;
      }
      
      public function showUnableToSaveMsg(param1:String) : void
      {
         this.lblCannotSave.text = param1;
         this.lblCannotSave.visible = true;
      }
      
      public function ___PurchaseBox_VBox1_creationComplete(param1:FlexEvent) : void
      {
         this.onCreationComplete();
      }
      
      public function __lblHaveMoney_creationComplete(param1:FlexEvent) : void
      {
         this.lblHaveMoney.text = UtilDict.toDisplay("cc","cc_label_you_have");
      }
      
      public function __lblNeedMoney_creationComplete(param1:FlexEvent) : void
      {
         this.lblNeedMoney.text = UtilDict.toDisplay("cc","cc_label_you_need");
      }
      
      private function _PurchaseBox_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Save Character");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnConfirm.label");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Signup to Save");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnNeedLogin.label");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Add GoBucks to Save");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnAddBuck.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","How do I get GoPoints?");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnAddPoint.label");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Refresh Balance");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnRefresh.label");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Subscribe to Save");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnSubscribe.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _boxStatusPanel() : HBox
      {
         return this._47713414_boxStatusPanel;
      }
      
      public function set _boxStatusPanel(param1:HBox) : void
      {
         var _loc2_:Object = this._47713414_boxStatusPanel;
         if(_loc2_ !== param1)
         {
            this._47713414_boxStatusPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_boxStatusPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _canAddBuck() : Canvas
      {
         return this._1464924181_canAddBuck;
      }
      
      public function set _canAddBuck(param1:Canvas) : void
      {
         var _loc2_:Object = this._1464924181_canAddBuck;
         if(_loc2_ !== param1)
         {
            this._1464924181_canAddBuck = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_canAddBuck",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _canAddPoints() : Canvas
      {
         return this._1352587475_canAddPoints;
      }
      
      public function set _canAddPoints(param1:Canvas) : void
      {
         var _loc2_:Object = this._1352587475_canAddPoints;
         if(_loc2_ !== param1)
         {
            this._1352587475_canAddPoints = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_canAddPoints",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _canConfirm() : Canvas
      {
         return this._635300463_canConfirm;
      }
      
      public function set _canConfirm(param1:Canvas) : void
      {
         var _loc2_:Object = this._635300463_canConfirm;
         if(_loc2_ !== param1)
         {
            this._635300463_canConfirm = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_canConfirm",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _canNeedLogin() : Canvas
      {
         return this._1793705886_canNeedLogin;
      }
      
      public function set _canNeedLogin(param1:Canvas) : void
      {
         var _loc2_:Object = this._1793705886_canNeedLogin;
         if(_loc2_ !== param1)
         {
            this._1793705886_canNeedLogin = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_canNeedLogin",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _canRefresh() : Canvas
      {
         return this._769627786_canRefresh;
      }
      
      public function set _canRefresh(param1:Canvas) : void
      {
         var _loc2_:Object = this._769627786_canRefresh;
         if(_loc2_ !== param1)
         {
            this._769627786_canRefresh = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_canRefresh",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _canSubscribe() : Canvas
      {
         return this._1957343545_canSubscribe;
      }
      
      public function set _canSubscribe(param1:Canvas) : void
      {
         var _loc2_:Object = this._1957343545_canSubscribe;
         if(_loc2_ !== param1)
         {
            this._1957343545_canSubscribe = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_canSubscribe",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _haveMoneyBg() : Canvas
      {
         return this._403552034_haveMoneyBg;
      }
      
      public function set _haveMoneyBg(param1:Canvas) : void
      {
         var _loc2_:Object = this._403552034_haveMoneyBg;
         if(_loc2_ !== param1)
         {
            this._403552034_haveMoneyBg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_haveMoneyBg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _linkModify() : TextButton
      {
         return this._1754793715_linkModify;
      }
      
      public function set _linkModify(param1:TextButton) : void
      {
         var _loc2_:Object = this._1754793715_linkModify;
         if(_loc2_ !== param1)
         {
            this._1754793715_linkModify = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_linkModify",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _needMoneyBg() : Canvas
      {
         return this._167267856_needMoneyBg;
      }
      
      public function set _needMoneyBg(param1:Canvas) : void
      {
         var _loc2_:Object = this._167267856_needMoneyBg;
         if(_loc2_ !== param1)
         {
            this._167267856_needMoneyBg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_needMoneyBg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _vsControl() : ViewStack
      {
         return this._1155746401_vsControl;
      }
      
      public function set _vsControl(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1155746401_vsControl;
         if(_loc2_ !== param1)
         {
            this._1155746401_vsControl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_vsControl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnAddBuck() : Button
      {
         return this._1956347456btnAddBuck;
      }
      
      public function set btnAddBuck(param1:Button) : void
      {
         var _loc2_:Object = this._1956347456btnAddBuck;
         if(_loc2_ !== param1)
         {
            this._1956347456btnAddBuck = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnAddBuck",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnAddPoint() : Button
      {
         return this._529985515btnAddPoint;
      }
      
      public function set btnAddPoint(param1:Button) : void
      {
         var _loc2_:Object = this._529985515btnAddPoint;
         if(_loc2_ !== param1)
         {
            this._529985515btnAddPoint = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnAddPoint",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnConfirm() : Button
      {
         return this._238395196btnConfirm;
      }
      
      public function set btnConfirm(param1:Button) : void
      {
         var _loc2_:Object = this._238395196btnConfirm;
         if(_loc2_ !== param1)
         {
            this._238395196btnConfirm = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnConfirm",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNeedLogin() : Button
      {
         return this._398355831btnNeedLogin;
      }
      
      public function set btnNeedLogin(param1:Button) : void
      {
         var _loc2_:Object = this._398355831btnNeedLogin;
         if(_loc2_ !== param1)
         {
            this._398355831btnNeedLogin = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNeedLogin",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRefresh() : Button
      {
         return this._104067873btnRefresh;
      }
      
      public function set btnRefresh(param1:Button) : void
      {
         var _loc2_:Object = this._104067873btnRefresh;
         if(_loc2_ !== param1)
         {
            this._104067873btnRefresh = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRefresh",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnSubscribe() : Button
      {
         return this._145562034btnSubscribe;
      }
      
      public function set btnSubscribe(param1:Button) : void
      {
         var _loc2_:Object = this._145562034btnSubscribe;
         if(_loc2_ !== param1)
         {
            this._145562034btnSubscribe = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnSubscribe",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lblCannotSave() : Text
      {
         return this._1601394826lblCannotSave;
      }
      
      public function set lblCannotSave(param1:Text) : void
      {
         var _loc2_:Object = this._1601394826lblCannotSave;
         if(_loc2_ !== param1)
         {
            this._1601394826lblCannotSave = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lblCannotSave",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lblHaveMoney() : Label
      {
         return this._1878334242lblHaveMoney;
      }
      
      public function set lblHaveMoney(param1:Label) : void
      {
         var _loc2_:Object = this._1878334242lblHaveMoney;
         if(_loc2_ !== param1)
         {
            this._1878334242lblHaveMoney = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lblHaveMoney",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get lblNeedMoney() : Label
      {
         return this._68526260lblNeedMoney;
      }
      
      public function set lblNeedMoney(param1:Label) : void
      {
         var _loc2_:Object = this._68526260lblNeedMoney;
         if(_loc2_ !== param1)
         {
            this._68526260lblNeedMoney = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"lblNeedMoney",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_statusPanel() : StatusPanel
      {
         return this._1697255178ps_statusPanel;
      }
      
      public function set ps_statusPanel(param1:StatusPanel) : void
      {
         var _loc2_:Object = this._1697255178ps_statusPanel;
         if(_loc2_ !== param1)
         {
            this._1697255178ps_statusPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_statusPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_userPointStatusPanel() : StatusPanel
      {
         return this._2010652631ps_userPointStatusPanel;
      }
      
      public function set ps_userPointStatusPanel(param1:StatusPanel) : void
      {
         var _loc2_:Object = this._2010652631ps_userPointStatusPanel;
         if(_loc2_ !== param1)
         {
            this._2010652631ps_userPointStatusPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_userPointStatusPanel",_loc2_,param1));
            }
         }
      }
   }
}
