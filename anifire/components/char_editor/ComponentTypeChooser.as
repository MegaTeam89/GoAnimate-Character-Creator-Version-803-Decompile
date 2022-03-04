package anifire.components.char_editor
{
   import anifire.cc_theme_lib.CcCharacter;
   import anifire.cc_theme_lib.CcComponentThumb;
   import anifire.cc_theme_lib.CcTheme;
   import anifire.constant.CcLibConstant;
   import anifire.core.CcConsole;
   import anifire.event.CcButtonBarEvent;
   import anifire.event.CcComponentTypeChooserEvent;
   import anifire.util.UtilColor;
   import anifire.util.UtilHashArray;
   import caurina.transitions.Tweener;
   import flash.accessibility.*;
   import flash.debugger.*;
   import flash.display.*;
   import flash.errors.*;
   import flash.events.*;
   import flash.external.*;
   import flash.filters.*;
   import flash.geom.*;
   import flash.media.*;
   import flash.net.*;
   import flash.printing.*;
   import flash.profiler.*;
   import flash.system.*;
   import flash.text.*;
   import flash.ui.*;
   import flash.utils.*;
   import flash.xml.*;
   import mx.binding.*;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.controls.Button;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.styles.*;
   
   use namespace mx_internal;
   
   public class ComponentTypeChooser extends Canvas implements IBindingClient
   {
      
      private static var TRANSITION:String = "easeOut";
      
      private static var CAN_BG:String = "bg";
      
      private static var CAN_CIRCLE:String = "circle";
      
      private static var CAN_CURRENTICON:String = "currentIcon";
      
      private static var CAN_ICONIMAGE:String = "iconImage";
      
      private static var CAN_ICONPREVIOUS:String = "iconPrevious";
      
      private static var CAN_ICONNEXT:String = "iconNext";
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _224829824btnGoBehindBody:Button;
      
      private var _244181042btnGoFeet:Button;
      
      private var _244236902btnGoHair:Button;
      
      private var _1018586144btnGoHands:Button;
      
      private var _1014466307btnGoLower:Button;
      
      private var _1006131554btnGoUpper:Button;
      
      private var _206040943btnNext:Button;
      
      private var _506036595btnPrevious:Button;
      
      private var _2110750292btnbeard:Button;
      
      private var _1393249181btnbodyshape:Button;
      
      private var _1734943114btncomponentGroupClothes:Button;
      
      private var _1378804870btnear:Button;
      
      private var _1378804139btneye:Button;
      
      private var _149828109btneyebrow:Button;
      
      private var _1727648727btnfacedecoration:Button;
      
      private var _122760056btnfaceshape:Button;
      
      private var _1549469518btnglasses:Button;
      
      private var _206811198btnhair:Button;
      
      private var _235322236btnlower_body:Button;
      
      private var _2121226219btnmouth:Button;
      
      private var _1725816700btnmustache:Button;
      
      private var _207003695btnnose:Button;
      
      private var _1639443067btnupper_body:Button;
      
      private var _549556649canMain:Canvas;
      
      private var _1644785962canQuickBar:HBox;
      
      private var _94852023cover:Canvas;
      
      private var _3343801main:HBox;
      
      private var _774909011tagSteps:Button;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var components:Array;
      
      private var currentComponentIndex:int;
      
      private var STEP_BUTTONS:Object;
      
      private var _propChanged:Object;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ComponentTypeChooser()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "events":{"creationComplete":"___ComponentTypeChooser_Canvas1_creationComplete"},
            "stylesFactory":function():void
            {
               this.backgroundColor = 16711680;
               this.backgroundAlpha = 0;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "id":"main",
                  "stylesFactory":function():void
                  {
                     this.horizontalAlign = "center";
                     this.verticalAlign = "middle";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":85,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnPrevious",
                           "events":{"click":"__btnPrevious_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"buttonBarLeft",
                                 "buttonMode":true
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"canMain",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "height":76,
                                 "percentWidth":100,
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "clipContent":false
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnNext",
                           "events":{"click":"__btnNext_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "styleName":"buttonBarRight",
                                 "buttonMode":true
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"tagSteps",
                  "events":{
                     "mouseOver":"__tagSteps_mouseOver",
                     "mouseOut":"__tagSteps_mouseOut"
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"btnTypeChooserOpen",
                        "width":30,
                        "height":76
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":HBox,
                  "id":"canQuickBar",
                  "stylesFactory":function():void
                  {
                     this.horizontalGap = 12;
                     this.paddingLeft = 12;
                     this.verticalAlign = "middle";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":544,
                        "height":76,
                        "horizontalScrollPolicy":"off",
                        "visible":true,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnbodyshape",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnbodyshape"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btncomponentGroupClothes",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btncomponentGroupClothes"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnGoUpper",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnGoUpper"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnGoLower",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnGoLower"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnGoHands",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnGoHands"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnGoFeet",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnGoFeet"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnGoBehindBody",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnGoBehindBody"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnGoHair",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnGoHair"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnupper_body",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnupperbody"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnlower_body",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnlowerbody"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnfaceshape",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnfaceshape"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnhair",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnhair"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btneye",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btneye"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btneyebrow",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btneyebrow"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnnose",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnnose"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnmustache",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnmustache"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnbeard",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnbeard"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnmouth",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnmouth"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnear",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnear"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnglasses",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnglasses"};
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"btnfacedecoration",
                           "propertiesFactory":function():Object
                           {
                              return {"styleName":"btnfacedecoration"};
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"cover",
                  "stylesFactory":function():void
                  {
                     this.backgroundColor = 16777215;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "width":3,
                        "height":76,
                        "x":544,
                        "y":0
                     };
                  }
               })]};
            }
         });
         this.components = new Array();
         this._propChanged = {};
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._ComponentTypeChooser_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_char_editor_ComponentTypeChooserWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ComponentTypeChooser[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.verticalScrollPolicy = "off";
         this.horizontalScrollPolicy = "off";
         this.clipContent = false;
         this.addEventListener("creationComplete",this.___ComponentTypeChooser_Canvas1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ComponentTypeChooser._watcherSetupUtil = param1;
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
            this.backgroundColor = 16711680;
            this.backgroundAlpha = 0;
         };
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      override protected function createChildren() : void
      {
         super.createChildren();
         this.STEP_BUTTONS = {
            "GoUpper":this.btnGoUpper,
            "GoLower":this.btnGoLower,
            "GoHands":this.btnGoHands,
            "GoFeet":this.btnGoFeet,
            "GoBehindBody":this.btnGoBehindBody,
            "GoHair":this.btnGoFeet,
            "upper_body":this.btnupper_body,
            "lower_body":this.btnlower_body,
            "faceshape":this.btnfaceshape,
            "hair":this.btnhair,
            "eye":this.btneye,
            "eyebrow":this.btneyebrow,
            "nose":this.btnnose,
            "mustache":this.btnmustache,
            "beard":this.btnbeard,
            "mouth":this.btnmouth,
            "ear":this.btnear,
            "glasses":this.btnglasses,
            "facedecoration":this.btnfacedecoration
         };
      }
      
      private function hideAllStepButtons() : void
      {
         var i:int = 0;
         while(i < this.canQuickBar.numChildren)
         {
            with(this.canQuickBar.getChildAt(i))
            {
               
               visible = false;
               includeInLayout = false;
            }
            i++;
         }
      }
      
      public function init(param1:CcTheme, param2:CcCharacter, param3:Boolean = true) : void
      {
         var ordered:Array = null;
         var allLib:UtilHashArray = null;
         var compLib:UtilHashArray = null;
         var j:int = 0;
         var filter:Function = null;
         var ccTheme:CcTheme = param1;
         var ccChar:CcCharacter = param2;
         var shouldDispatchCompleteEvent:Boolean = param3;
         var hasMultipleBodyShape:Boolean = ccTheme.getBodyShapeNum() > 1;
         this.components = new Array();
         if(ccTheme.getLibraryNum() == 0)
         {
            ordered = CcLibConstant.COMPONENT_TYPE_CHOOSER_ORDERING_VER1;
         }
         else
         {
            ordered = CcLibConstant.COMPONENT_TYPE_CHOOSER_ORDERING_VER2;
         }
         this.hideAllStepButtons();
         var i:int = 0;
         while(i < ordered.length)
         {
            if(CcLibConstant.COMPONENT_TYPE_CHOOSER_COMPONENT_GROUP.indexOf(ordered[i]) >= 0 || ccTheme.getAvailableComponentTypes().indexOf(ordered[i]) > -1)
            {
               if(ordered[i] == CcLibConstant.COMPONENT_TYPE_BODYSHAPE)
               {
                  if(hasMultipleBodyShape && CcLibConstant.BODYSHAPE_CHOOSABLE || CcLibConstant.CHOOSE_TAG_TYPE_SEX)
                  {
                     this.components.push(ordered[i]);
                     this.btnbodyshape.visible = true;
                     this.btnbodyshape.includeInLayout = true;
                  }
                  else
                  {
                     this.btnbodyshape.visible = false;
                     this.btnbodyshape.includeInLayout = false;
                  }
               }
               else
               {
                  allLib = ccTheme.getComponentThumbByType(ordered[i]);
                  compLib = new UtilHashArray();
                  if(allLib)
                  {
                     j = 0;
                     while(j < allLib.length)
                     {
                        if(CcComponentThumb(allLib.getValueByIndex(j)).enable)
                        {
                           filter = CcConsole.getCcConsole().configuration.defaultThumbFilter.filter;
                           if(filter(CcComponentThumb(allLib.getValueByIndex(j))))
                           {
                              compLib.push(allLib.getKey(j),allLib.getValueByIndex(j));
                           }
                        }
                        j++;
                     }
                  }
                  else
                  {
                     compLib = null;
                  }
                  if(CcLibConstant.COMPONENT_TYPE_CHOOSER_COMPONENT_GROUP.indexOf(ordered[i]) >= 0)
                  {
                     this.components.push(ordered[i]);
                     with(this.STEP_BUTTONS[ordered[i]])
                     {
                        
                        visible = true;
                        includeInLayout = true;
                     }
                  }
                  else if(ccTheme.getAvailableComponentTypes().indexOf(ordered[i]) > -1 && compLib && compLib.length > 1)
                  {
                     this.components.push(ordered[i]);
                     with(this.STEP_BUTTONS[ordered[i]])
                     {
                        
                        visible = true;
                        includeInLayout = true;
                     }
                  }
               }
            }
            i++;
         }
         this.canQuickBar.validateNow();
         this.currentComponentIndex = 0;
         this.switchToComponentType(this.components[this.currentComponentIndex],shouldDispatchCompleteEvent);
         this.canQuickBar.width = this.canQuickBar.measuredMinWidth - 50;
         this.initQuickBar();
      }
      
      override public function styleChanged(param1:String) : void
      {
         var _loc3_:String = null;
         var _loc4_:* = undefined;
         super.styleChanged(param1);
         var _loc2_:Array = ["percentWidth","navMarginRight"];
         if(param1 == null || _loc2_.indexOf(param1) >= 0)
         {
            for each(_loc3_ in _loc2_)
            {
               if((_loc4_ = getStyle(_loc3_)) != undefined)
               {
                  this._propChanged[_loc3_] = _loc4_;
               }
            }
         }
      }
      
      override protected function commitProperties() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = undefined;
         super.commitProperties();
         for(_loc1_ in this._propChanged)
         {
            _loc2_ = this._propChanged[_loc1_];
            switch(_loc1_)
            {
               case "percentWidth":
                  this.main.percentWidth = uint(_loc2_);
                  delete this._propChanged[_loc1_];
                  break;
               case "navMarginRight":
                  this.main.setStyle("right",uint(_loc2_));
                  delete this._propChanged[_loc1_];
                  break;
            }
         }
      }
      
      private function prepare() : void
      {
         var _loc1_:Canvas = new Canvas();
         _loc1_.name = CAN_BG;
         _loc1_.graphics.clear();
         _loc1_.graphics.lineStyle();
         _loc1_.graphics.beginFill(uint(getStyle("navFillColor")));
         _loc1_.graphics.drawRoundRect(0,0,this.canMain.width,43,15,15);
         _loc1_.graphics.endFill();
         _loc1_.y = (this.canMain.height - 43) / 2;
         this.canMain.addChild(_loc1_);
         var _loc2_:Canvas = new Canvas();
         _loc2_.name = CAN_CIRCLE;
         _loc2_.graphics.clear();
         _loc2_.graphics.lineStyle();
         _loc2_.graphics.beginFill(uint(getStyle("navFillColor")));
         _loc2_.graphics.drawCircle(0,0,3.8);
         _loc2_.x = this.canMain.width / 2;
         _loc2_.y = this.canMain.height / 2;
         this.canMain.addChild(_loc2_);
         var _loc3_:Canvas = new Canvas();
         _loc3_.name = CAN_CURRENTICON;
         _loc3_.x = this.canMain.width / 2;
         _loc3_.y = this.canMain.height / 2;
         _loc3_.clipContent = false;
         UtilColor.setRGB(_loc3_,16488452);
         var _loc4_:Canvas;
         (_loc4_ = new Canvas()).name = CAN_ICONIMAGE;
         _loc4_.width = _loc4_.height = 76;
         _loc4_.x = _loc4_.y = -38;
         _loc3_.addChild(_loc4_);
         this.canMain.addChild(_loc3_);
         var _loc5_:Canvas;
         (_loc5_ = new Canvas()).name = CAN_ICONPREVIOUS;
         _loc5_.clipContent = false;
         _loc5_.width = _loc5_.height = 60;
         _loc5_.scaleX = _loc5_.scaleY = 0.8;
         _loc5_.x = _loc5_.y = 14;
         _loc5_.useHandCursor = true;
         _loc5_.buttonMode = true;
         _loc5_.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.canMain.addChild(_loc5_);
         var _loc6_:Canvas;
         (_loc6_ = new Canvas()).name = CAN_ICONNEXT;
         _loc6_.clipContent = false;
         _loc6_.width = _loc6_.height = 60;
         _loc6_.scaleX = _loc6_.scaleY = 0.8;
         _loc6_.x = this.canMain.width - _loc6_.width;
         _loc6_.y = 14;
         _loc6_.useHandCursor = true;
         _loc6_.buttonMode = true;
         _loc6_.addEventListener(MouseEvent.CLICK,this.onBtnClick);
         this.canMain.addChild(_loc6_);
         var _loc7_:GlowFilter = new GlowFilter(uint(getStyle("navGlowColor")));
         var _loc8_:Array;
         (_loc8_ = new Array()).push(_loc7_);
         this.canMain.filters = _loc8_;
      }
      
      public function switchToComponentType(param1:String = "", param2:Boolean = true) : void
      {
         var _loc3_:Canvas = Canvas(this.canMain.getChildByName(CAN_CURRENTICON));
         var _loc4_:Canvas;
         (_loc4_ = Canvas(_loc3_.getChildByName(CAN_ICONIMAGE))).styleName = "icon" + param1.replace("_","");
         _loc3_.scaleX = _loc3_.scaleY = 1.2;
         Tweener.addTween(_loc3_,{
            "scaleX":1.8,
            "scaleY":1.8,
            "time":0.4,
            "transition":TRANSITION
         });
         this.currentComponentIndex = this.components.indexOf(param1);
         var _loc5_:Canvas = Canvas(this.canMain.getChildByName(CAN_ICONPREVIOUS));
         var _loc6_:Canvas = Canvas(this.canMain.getChildByName(CAN_ICONNEXT));
         if(this.components.indexOf(param1) == 0)
         {
            this.btnPrevious.visible = false;
            _loc5_.visible = false;
         }
         else
         {
            this.btnPrevious.visible = true;
            _loc5_.visible = true;
            _loc5_.styleName = "icon" + String(this.components[this.currentComponentIndex - 1]).replace("_","");
            _loc5_.alpha = 0.5;
            Tweener.addTween(_loc5_,{
               "alpha":1,
               "time":0.2
            });
         }
         if(this.components.indexOf(param1) == this.components.length - 1)
         {
            this.btnNext.styleName = "buttonBarRightSave";
            _loc6_.visible = false;
         }
         else
         {
            this.btnNext.styleName = "buttonBarRight";
            _loc6_.visible = true;
            _loc6_.styleName = "icon" + String(this.components[this.currentComponentIndex + 1]).replace("_","");
            _loc6_.alpha = 0.5;
            Tweener.addTween(_loc6_,{
               "alpha":1,
               "time":0.2
            });
         }
         var _loc7_:Canvas;
         (_loc7_ = Canvas(this.canMain.getChildByName(CAN_CIRCLE))).scaleX = 10;
         _loc7_.scaleY = 5;
         Tweener.addTween(_loc7_,{
            "scaleX":20,
            "scaleY":10,
            "time":0.4,
            "transition":TRANSITION
         });
         if(param2)
         {
            this.callLater(this.toCallLater,[param1]);
         }
      }
      
      private function toCallLater(param1:String) : void
      {
         this.callLater(this.tellEverybodyComponentTypeChosen,[param1]);
      }
      
      private function tellEverybodyComponentTypeChosen(param1:String) : void
      {
         var _loc2_:CcComponentTypeChooserEvent = new CcComponentTypeChooserEvent(CcComponentTypeChooserEvent.COMPONENT_TYPE_CHOSEN,this);
         _loc2_.componentType = param1;
         this.dispatchEvent(_loc2_);
      }
      
      private function onBtnClick(param1:Event) : void
      {
         var _loc2_:int = 0;
         if(param1.currentTarget == this.btnPrevious || param1.currentTarget is Canvas && Canvas(param1.currentTarget).name == CAN_ICONPREVIOUS)
         {
            _loc2_ = this.currentComponentIndex - 1;
         }
         else if(param1.currentTarget == this.btnNext || param1.currentTarget is Canvas && Canvas(param1.currentTarget).name == CAN_ICONNEXT)
         {
            _loc2_ = this.currentComponentIndex + 1;
         }
         if(_loc2_ >= this.components.length)
         {
            this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.SAVE_BUTTON_CLICK,this));
         }
         else
         {
            this.switchToComponentType(this.components[_loc2_]);
         }
      }
      
      private function initQuickBar() : void
      {
         var _loc4_:Button = null;
         var _loc1_:int = 0;
         while(_loc1_ < this.canQuickBar.numChildren)
         {
            (_loc4_ = this.canQuickBar.getChildAt(_loc1_) as Button).addEventListener(MouseEvent.MOUSE_OVER,this.doMouseOver);
            _loc4_.addEventListener(MouseEvent.MOUSE_OUT,this.doMouseOut);
            _loc4_.addEventListener(MouseEvent.MOUSE_UP,this.doMouseUp);
            _loc4_.buttonMode = true;
            _loc4_.scaleX = _loc4_.scaleY = 0.7;
            _loc1_++;
         }
         this.canQuickBar.y = (this.canQuickBar.parent.height - this.canQuickBar.height) / 2;
         this.canQuickBar.graphics.clear();
         this.canQuickBar.graphics.lineStyle();
         this.canQuickBar.graphics.beginFill(uint(getStyle("navFillColor")));
         this.canQuickBar.graphics.drawRoundRect(0,0,this.canQuickBar.width,this.canQuickBar.height,15,15);
         this.canQuickBar.graphics.endFill();
         var _loc2_:GlowFilter = new GlowFilter(16777215);
         var _loc3_:Array = new Array();
         _loc3_.push(_loc2_);
         this.canQuickBar.filters = _loc3_;
         this.canQuickBar.addEventListener(MouseEvent.MOUSE_OUT,this.doQuickBarOut);
      }
      
      private function doQuickBarOut(param1:Event) : void
      {
         if(!(this.canQuickBar.width >= this.canQuickBar.mouseX && this.canQuickBar.mouseX >= 0 && this.canQuickBar.height - 2 >= this.canQuickBar.mouseY && this.canQuickBar.mouseY >= 0))
         {
            Tweener.addTween(this.canQuickBar,{
               "x":this.width - 3,
               "time":1
            });
            this.tagSteps.styleName = "btnTypeChooserOpen";
         }
      }
      
      private function doQuickBarIn() : void
      {
         Tweener.addTween(this.canQuickBar,{
            "x":this.width - this.canQuickBar.width - 3,
            "time":1
         });
         this.tagSteps.styleName = "btnTypeChooserClose";
      }
      
      private function doMouseOver(param1:Event) : void
      {
         var _loc2_:Button = param1.currentTarget as Button;
         UtilColor.setRGB(_loc2_,16488452);
      }
      
      private function doMouseOut(param1:Event) : void
      {
         var _loc2_:Button = param1.currentTarget as Button;
         UtilColor.setRGB(_loc2_,16777215);
      }
      
      private function doMouseUp(param1:Event) : void
      {
         var _loc2_:Button = param1.currentTarget as Button;
         var _loc3_:String = _loc2_.id.substring(3);
         this.currentComponentIndex = this.components.indexOf(_loc3_);
         this.switchToComponentType(this.components[this.currentComponentIndex]);
      }
      
      public function ___ComponentTypeChooser_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.prepare();
      }
      
      public function __btnPrevious_click(param1:MouseEvent) : void
      {
         this.onBtnClick(param1);
      }
      
      public function __btnNext_click(param1:MouseEvent) : void
      {
         this.onBtnClick(param1);
      }
      
      public function __tagSteps_mouseOver(param1:MouseEvent) : void
      {
         this.doQuickBarIn();
      }
      
      public function __tagSteps_mouseOut(param1:MouseEvent) : void
      {
         this.doQuickBarOut(param1);
      }
      
      private function _ComponentTypeChooser_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return canQuickBar.x - tagSteps.width + 2;
         },null,"tagSteps.x");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnGoBehindBody() : Button
      {
         return this._224829824btnGoBehindBody;
      }
      
      public function set btnGoBehindBody(param1:Button) : void
      {
         var _loc2_:Object = this._224829824btnGoBehindBody;
         if(_loc2_ !== param1)
         {
            this._224829824btnGoBehindBody = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnGoBehindBody",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnGoFeet() : Button
      {
         return this._244181042btnGoFeet;
      }
      
      public function set btnGoFeet(param1:Button) : void
      {
         var _loc2_:Object = this._244181042btnGoFeet;
         if(_loc2_ !== param1)
         {
            this._244181042btnGoFeet = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnGoFeet",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnGoHair() : Button
      {
         return this._244236902btnGoHair;
      }
      
      public function set btnGoHair(param1:Button) : void
      {
         var _loc2_:Object = this._244236902btnGoHair;
         if(_loc2_ !== param1)
         {
            this._244236902btnGoHair = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnGoHair",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnGoHands() : Button
      {
         return this._1018586144btnGoHands;
      }
      
      public function set btnGoHands(param1:Button) : void
      {
         var _loc2_:Object = this._1018586144btnGoHands;
         if(_loc2_ !== param1)
         {
            this._1018586144btnGoHands = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnGoHands",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnGoLower() : Button
      {
         return this._1014466307btnGoLower;
      }
      
      public function set btnGoLower(param1:Button) : void
      {
         var _loc2_:Object = this._1014466307btnGoLower;
         if(_loc2_ !== param1)
         {
            this._1014466307btnGoLower = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnGoLower",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnGoUpper() : Button
      {
         return this._1006131554btnGoUpper;
      }
      
      public function set btnGoUpper(param1:Button) : void
      {
         var _loc2_:Object = this._1006131554btnGoUpper;
         if(_loc2_ !== param1)
         {
            this._1006131554btnGoUpper = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnGoUpper",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnNext() : Button
      {
         return this._206040943btnNext;
      }
      
      public function set btnNext(param1:Button) : void
      {
         var _loc2_:Object = this._206040943btnNext;
         if(_loc2_ !== param1)
         {
            this._206040943btnNext = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnNext",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnPrevious() : Button
      {
         return this._506036595btnPrevious;
      }
      
      public function set btnPrevious(param1:Button) : void
      {
         var _loc2_:Object = this._506036595btnPrevious;
         if(_loc2_ !== param1)
         {
            this._506036595btnPrevious = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnPrevious",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnbeard() : Button
      {
         return this._2110750292btnbeard;
      }
      
      public function set btnbeard(param1:Button) : void
      {
         var _loc2_:Object = this._2110750292btnbeard;
         if(_loc2_ !== param1)
         {
            this._2110750292btnbeard = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnbeard",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnbodyshape() : Button
      {
         return this._1393249181btnbodyshape;
      }
      
      public function set btnbodyshape(param1:Button) : void
      {
         var _loc2_:Object = this._1393249181btnbodyshape;
         if(_loc2_ !== param1)
         {
            this._1393249181btnbodyshape = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnbodyshape",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btncomponentGroupClothes() : Button
      {
         return this._1734943114btncomponentGroupClothes;
      }
      
      public function set btncomponentGroupClothes(param1:Button) : void
      {
         var _loc2_:Object = this._1734943114btncomponentGroupClothes;
         if(_loc2_ !== param1)
         {
            this._1734943114btncomponentGroupClothes = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btncomponentGroupClothes",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnear() : Button
      {
         return this._1378804870btnear;
      }
      
      public function set btnear(param1:Button) : void
      {
         var _loc2_:Object = this._1378804870btnear;
         if(_loc2_ !== param1)
         {
            this._1378804870btnear = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnear",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btneye() : Button
      {
         return this._1378804139btneye;
      }
      
      public function set btneye(param1:Button) : void
      {
         var _loc2_:Object = this._1378804139btneye;
         if(_loc2_ !== param1)
         {
            this._1378804139btneye = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btneye",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btneyebrow() : Button
      {
         return this._149828109btneyebrow;
      }
      
      public function set btneyebrow(param1:Button) : void
      {
         var _loc2_:Object = this._149828109btneyebrow;
         if(_loc2_ !== param1)
         {
            this._149828109btneyebrow = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btneyebrow",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnfacedecoration() : Button
      {
         return this._1727648727btnfacedecoration;
      }
      
      public function set btnfacedecoration(param1:Button) : void
      {
         var _loc2_:Object = this._1727648727btnfacedecoration;
         if(_loc2_ !== param1)
         {
            this._1727648727btnfacedecoration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnfacedecoration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnfaceshape() : Button
      {
         return this._122760056btnfaceshape;
      }
      
      public function set btnfaceshape(param1:Button) : void
      {
         var _loc2_:Object = this._122760056btnfaceshape;
         if(_loc2_ !== param1)
         {
            this._122760056btnfaceshape = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnfaceshape",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnglasses() : Button
      {
         return this._1549469518btnglasses;
      }
      
      public function set btnglasses(param1:Button) : void
      {
         var _loc2_:Object = this._1549469518btnglasses;
         if(_loc2_ !== param1)
         {
            this._1549469518btnglasses = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnglasses",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnhair() : Button
      {
         return this._206811198btnhair;
      }
      
      public function set btnhair(param1:Button) : void
      {
         var _loc2_:Object = this._206811198btnhair;
         if(_loc2_ !== param1)
         {
            this._206811198btnhair = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnhair",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnlower_body() : Button
      {
         return this._235322236btnlower_body;
      }
      
      public function set btnlower_body(param1:Button) : void
      {
         var _loc2_:Object = this._235322236btnlower_body;
         if(_loc2_ !== param1)
         {
            this._235322236btnlower_body = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnlower_body",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnmouth() : Button
      {
         return this._2121226219btnmouth;
      }
      
      public function set btnmouth(param1:Button) : void
      {
         var _loc2_:Object = this._2121226219btnmouth;
         if(_loc2_ !== param1)
         {
            this._2121226219btnmouth = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnmouth",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnmustache() : Button
      {
         return this._1725816700btnmustache;
      }
      
      public function set btnmustache(param1:Button) : void
      {
         var _loc2_:Object = this._1725816700btnmustache;
         if(_loc2_ !== param1)
         {
            this._1725816700btnmustache = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnmustache",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnnose() : Button
      {
         return this._207003695btnnose;
      }
      
      public function set btnnose(param1:Button) : void
      {
         var _loc2_:Object = this._207003695btnnose;
         if(_loc2_ !== param1)
         {
            this._207003695btnnose = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnnose",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnupper_body() : Button
      {
         return this._1639443067btnupper_body;
      }
      
      public function set btnupper_body(param1:Button) : void
      {
         var _loc2_:Object = this._1639443067btnupper_body;
         if(_loc2_ !== param1)
         {
            this._1639443067btnupper_body = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnupper_body",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get canMain() : Canvas
      {
         return this._549556649canMain;
      }
      
      public function set canMain(param1:Canvas) : void
      {
         var _loc2_:Object = this._549556649canMain;
         if(_loc2_ !== param1)
         {
            this._549556649canMain = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"canMain",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get canQuickBar() : HBox
      {
         return this._1644785962canQuickBar;
      }
      
      public function set canQuickBar(param1:HBox) : void
      {
         var _loc2_:Object = this._1644785962canQuickBar;
         if(_loc2_ !== param1)
         {
            this._1644785962canQuickBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"canQuickBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cover() : Canvas
      {
         return this._94852023cover;
      }
      
      public function set cover(param1:Canvas) : void
      {
         var _loc2_:Object = this._94852023cover;
         if(_loc2_ !== param1)
         {
            this._94852023cover = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cover",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get main() : HBox
      {
         return this._3343801main;
      }
      
      public function set main(param1:HBox) : void
      {
         var _loc2_:Object = this._3343801main;
         if(_loc2_ !== param1)
         {
            this._3343801main = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"main",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tagSteps() : Button
      {
         return this._774909011tagSteps;
      }
      
      public function set tagSteps(param1:Button) : void
      {
         var _loc2_:Object = this._774909011tagSteps;
         if(_loc2_ !== param1)
         {
            this._774909011tagSteps = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tagSteps",_loc2_,param1));
            }
         }
      }
   }
}
