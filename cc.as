package
{
   import anifire.cc_interface.ICcCharEditorContainer;
   import anifire.cc_interface.ICcMainUiContainer;
   import anifire.cc_interface.ICcPreviewAndSaveContainer;
   import anifire.cc_interface.IConfiguration;
   import anifire.cc_interface.IPurchaseBox;
   import anifire.cc_interface.IPurchaseCompleteBox;
   import anifire.components.char_editor.BodyShapeChooser;
   import anifire.components.char_editor.BodyShapeMegaChooser;
   import anifire.components.char_editor.ButtonBar;
   import anifire.components.char_editor.CcColorPicker;
   import anifire.components.char_editor.CcThumbPropertyInspector;
   import anifire.components.char_editor.CharHeadFrame;
   import anifire.components.char_editor.CharPreviewer;
   import anifire.components.char_editor.CharScaleChooser;
   import anifire.components.char_editor.ClothesChooser;
   import anifire.components.char_editor.ComponentThumbChooser;
   import anifire.components.char_editor.ComponentTypeChooser;
   import anifire.components.char_editor.SelectedDecoration;
   import anifire.components.char_editor.StatusPanel;
   import anifire.components.previewAndSave.CharPreviewOptionBox;
   import anifire.components.previewAndSave.PurchaseBox;
   import anifire.components.previewAndSave.PurchaseCompleteBox;
   import anifire.config.GoAnimate;
   import anifire.config.YouTube;
   import anifire.constant.ServerConstants;
   import anifire.core.CcConsole;
   import anifire.event.CcCoreEvent;
   import anifire.managers.FeatureManager;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilHashArray;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.system.Security;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.controls.SWFLoader;
   import mx.core.Application;
   import mx.core.Container;
   import mx.core.FlexGlobals;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.IndexChangedEvent;
   import mx.events.PropertyChangeEvent;
   import mx.events.ResizeEvent;
   import mx.styles.CSSCondition;
   import mx.styles.CSSSelector;
   import mx.styles.CSSStyleDeclaration;
   
   use namespace mx_internal;
   
   public class cc extends Application implements ICcCharEditorContainer, ICcMainUiContainer, ICcPreviewAndSaveContainer, IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
      
      {
         Security.allowDomain("*.goanimate.org","*.goanimate.com","goanimate.com","demo.cdn.goanimate.com","demo.goanimate.com","es.goanimate.com","fr.goanimate.com","de.goanimate.com","br.goanimate.com","tooncreator.cartoonnetworkhq.com","prelaunch.tooncreator.cartoonnetworkhq.com","staging.goanimate.org","staging.goanimate.com","cn.goanimate.com","goanimate.cartoonnetworkhq.org","lightspeed.goanimate.com","staging.school.goanimate.org","*.goanimate4schools.com","goanimate4schools.com","lightspeed.goanimate4schools.com","staging-school-cdn.com","lightspeed.youtube.goanimate.com","youtube.goanimate.org","youtube.goanimate.com","demo.youtube.goanimate.com","demo.cdn.youtube.goanimate.com","lightspeed.youtube.goanimate.com","skoletube.goanimate.org","skoletube.goanimate.com");
      }
      
      private var _1502809610_bgStatus:Canvas;
      
      private var _267076680_ce_bodyShapeMegaChooser:BodyShapeMegaChooser;
      
      private var _495053373_ce_buttonBar:ButtonBar;
      
      private var _1163196673_ce_charPreviewer:CharPreviewer;
      
      private var _1041579653_ce_charScaleChooser:CharScaleChooser;
      
      private var _931590865_ce_clothesChooser:ClothesChooser;
      
      private var _627432557_ce_colorPicker:CcColorPicker;
      
      private var _1243488953_ce_componentChooserViewStack:ViewStack;
      
      private var _740228964_ce_componentThumbChooser:ComponentThumbChooser;
      
      private var _309190686_ce_componentTypeChooser:ComponentTypeChooser;
      
      private var _678855911_ce_mainEditorComponentsContainer:Canvas;
      
      private var _164421228_ce_mainViewStack:ViewStack;
      
      private var _580013481_ce_selectedDecoration:SelectedDecoration;
      
      private var _1876215540_ce_statusPanel:StatusPanel;
      
      private var _614936982_ce_thumbPropertyInspector:CcThumbPropertyInspector;
      
      private var _1851834956actionShop:SWFLoader;
      
      private var _361540722ccCharPreviewAndSaveScreen:Canvas;
      
      private var _1703153366mainViewStack:ViewStack;
      
      private var _1362478691ps_btnFBShare:Button;
      
      private var _588295033ps_btnavatar:Button;
      
      private var _1132162171ps_charFrame:CharHeadFrame;
      
      private var _1262756942ps_charPreviewCanvas:Canvas;
      
      private var _1970784ps_charPreviewOptionBox:CharPreviewOptionBox;
      
      private var _1263293821ps_charPreviewer:CharPreviewer;
      
      private var _920644200ps_charPurchaseBox:PurchaseBox;
      
      private var _1995015763ps_interactionViewStack:ViewStack;
      
      private var _1122792149ps_purChaseCompleteContainer:Canvas;
      
      private var _806339029ps_purchaseCompleteBox:PurchaseCompleteBox;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _ccConsole:CcConsole;
      
      mx_internal var _cc_StylesInit_done:Boolean = false;
      
      private var _embed__font_StudioSparkMain_medium_normal_480331214:Class;
      
      private var _embed__font_StudioSparkMain_bold_normal_706083324:Class;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function cc()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Application,
            "events":{
               "preinitialize":"___cc_Application1_preinitialize",
               "applicationComplete":"___cc_Application1_applicationComplete"
            },
            "stylesFactory":function():void
            {
               this.backgroundAlpha = 0;
               this.backgroundColor = 16777215;
            },
            "propertiesFactory":function():Object
            {
               return {
                  "width":954,
                  "height":500,
                  "creationPolicy":"none",
                  "childDescriptors":[new UIComponentDescriptor({
                     "type":ViewStack,
                     "id":"mainViewStack",
                     "stylesFactory":function():void
                     {
                        this.paddingBottom = 0;
                        this.paddingLeft = 0;
                        this.paddingRight = 0;
                        this.paddingTop = 0;
                     },
                     "propertiesFactory":function():Object
                     {
                        return {
                           "x":0,
                           "y":0,
                           "percentWidth":100,
                           "percentHeight":100,
                           "creationPolicy":"all",
                           "childDescriptors":[new UIComponentDescriptor({
                              "type":ViewStack,
                              "id":"_ce_mainViewStack",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":BodyShapeMegaChooser,
                                       "id":"_ce_bodyShapeMegaChooser",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":100,
                                             "percentHeight":100
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":Canvas,
                                       "id":"_ce_mainEditorComponentsContainer",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "percentWidth":100,
                                             "percentHeight":100,
                                             "verticalScrollPolicy":"off",
                                             "horizontalScrollPolicy":"off",
                                             "styleName":"bgCharEditor",
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":CharPreviewer,
                                                "id":"_ce_charPreviewer",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "x":-93,
                                                      "y":0,
                                                      "width":428,
                                                      "height":374,
                                                      "ccPosDy":45
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":ComponentTypeChooser,
                                                "id":"_ce_componentTypeChooser",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "x":407,
                                                      "y":12,
                                                      "width":547,
                                                      "height":76,
                                                      "styleName":"componentTypeChooserMain"
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":CcColorPicker,
                                                "id":"_ce_colorPicker",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "x":430,
                                                      "y":350,
                                                      "width":500,
                                                      "height":121,
                                                      "biggerElementWidth":142,
                                                      "smallerElementWidth":80
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":ButtonBar,
                                                "id":"_ce_buttonBar",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "x":8,
                                                      "y":450,
                                                      "width":300,
                                                      "height":38
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"_bgStatus",
                                                "events":{"resize":"___bgStatus_resize"}
                                             }),new UIComponentDescriptor({
                                                "type":StatusPanel,
                                                "id":"_ce_statusPanel",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "right":16,
                                                      "bottom":10,
                                                      "isUsDollarShown":false
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":CcThumbPropertyInspector,
                                                "id":"_ce_thumbPropertyInspector",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "x":430,
                                                      "y":272,
                                                      "width":463,
                                                      "height":77
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":SelectedDecoration,
                                                "id":"_ce_selectedDecoration",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "x":407,
                                                      "y":183,
                                                      "width":463,
                                                      "height":72
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":ViewStack,
                                                "id":"_ce_componentChooserViewStack",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "x":407,
                                                      "y":103,
                                                      "width":463,
                                                      "height":157,
                                                      "creationPolicy":"all",
                                                      "clipContent":false,
                                                      "childDescriptors":[new UIComponentDescriptor({
                                                         "type":ComponentThumbChooser,
                                                         "id":"_ce_componentThumbChooser",
                                                         "propertiesFactory":function():Object
                                                         {
                                                            return {
                                                               "clipContent":false,
                                                               "biggerHeight":157,
                                                               "smallerHeight":65
                                                            };
                                                         }
                                                      }),new UIComponentDescriptor({
                                                         "type":ClothesChooser,
                                                         "id":"_ce_clothesChooser",
                                                         "stylesFactory":function():void
                                                         {
                                                            this.verticalGap = 50;
                                                         },
                                                         "propertiesFactory":function():Object
                                                         {
                                                            return {
                                                               "y":10,
                                                               "percentWidth":100,
                                                               "height":250,
                                                               "clipContent":false,
                                                               "thumbChooserWidth":463,
                                                               "biggerHeight":70,
                                                               "smallerHeight":70,
                                                               "creationPolicy":"all"
                                                            };
                                                         }
                                                      })]
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":CharScaleChooser,
                                                "id":"_ce_charScaleChooser",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "x":0,
                                                      "y":0,
                                                      "percentWidth":100,
                                                      "percentHeight":100
                                                   };
                                                }
                                             })]
                                          };
                                       }
                                    })]
                                 };
                              }
                           }),new UIComponentDescriptor({
                              "type":Canvas,
                              "id":"ccCharPreviewAndSaveScreen",
                              "propertiesFactory":function():Object
                              {
                                 return {
                                    "percentWidth":100,
                                    "percentHeight":100,
                                    "styleName":"bgCharEditor",
                                    "childDescriptors":[new UIComponentDescriptor({
                                       "type":ViewStack,
                                       "id":"ps_interactionViewStack",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":0,
                                             "y":0,
                                             "percentWidth":100,
                                             "percentHeight":100,
                                             "childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"ps_charPreviewCanvas",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "horizontalScrollPolicy":"off",
                                                      "verticalScrollPolicy":"off",
                                                      "childDescriptors":[new UIComponentDescriptor({
                                                         "type":CharPreviewOptionBox,
                                                         "id":"ps_charPreviewOptionBox",
                                                         "propertiesFactory":function():Object
                                                         {
                                                            return {
                                                               "percentWidth":80,
                                                               "height":40
                                                            };
                                                         }
                                                      }),new UIComponentDescriptor({
                                                         "type":PurchaseBox,
                                                         "id":"ps_charPurchaseBox"
                                                      })]
                                                   };
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"ps_purChaseCompleteContainer",
                                                "events":{"creationComplete":"__ps_purChaseCompleteContainer_creationComplete"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "styleName":"bgSaveScreen",
                                                      "percentWidth":100,
                                                      "percentHeight":100,
                                                      "childDescriptors":[new UIComponentDescriptor({
                                                         "type":HBox,
                                                         "stylesFactory":function():void
                                                         {
                                                            this.verticalAlign = "middle";
                                                            this.horizontalGap = 20;
                                                         },
                                                         "propertiesFactory":function():Object
                                                         {
                                                            return {
                                                               "horizontalCenter":0,
                                                               "verticalCenter":0,
                                                               "childDescriptors":[new UIComponentDescriptor({
                                                                  "type":Canvas,
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {
                                                                        "width":400,
                                                                        "height":200,
                                                                        "childDescriptors":[new UIComponentDescriptor({
                                                                           "type":Button,
                                                                           "id":"ps_btnavatar",
                                                                           "propertiesFactory":function():Object
                                                                           {
                                                                              return {
                                                                                 "buttonMode":true,
                                                                                 "styleName":"btnSetProfilePic",
                                                                                 "visible":false
                                                                              };
                                                                           }
                                                                        }),new UIComponentDescriptor({
                                                                           "type":Button,
                                                                           "id":"ps_btnFBShare",
                                                                           "events":{"click":"__ps_btnFBShare_click"},
                                                                           "propertiesFactory":function():Object
                                                                           {
                                                                              return {
                                                                                 "horizontalCenter":-20,
                                                                                 "bottom":0,
                                                                                 "styleName":"btnFBShare",
                                                                                 "buttonMode":true
                                                                              };
                                                                           }
                                                                        })]
                                                                     };
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":PurchaseCompleteBox,
                                                                  "id":"ps_purchaseCompleteBox",
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {"minWidth":400};
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
                                       "type":CharHeadFrame,
                                       "id":"ps_charFrame",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "horizontalCenter":-230,
                                             "y":100,
                                             "visible":false,
                                             "scaleX":1,
                                             "scaleY":1
                                          };
                                       }
                                    }),new UIComponentDescriptor({
                                       "type":CharPreviewer,
                                       "id":"ps_charPreviewer",
                                       "propertiesFactory":function():Object
                                       {
                                          return {
                                             "x":-93,
                                             "y":0,
                                             "width":428,
                                             "height":374,
                                             "ccPosDy":45,
                                             "clipContent":false
                                          };
                                       }
                                    })]
                                 };
                              }
                           })]
                        };
                     }
                  }),new UIComponentDescriptor({
                     "type":SWFLoader,
                     "id":"actionShop",
                     "propertiesFactory":function():Object
                     {
                        return {
                           "percentWidth":100,
                           "percentHeight":100
                        };
                     }
                  })]
               };
            }
         });
         this._embed__font_StudioSparkMain_medium_normal_480331214 = cc__embed__font_StudioSparkMain_medium_normal_480331214;
         this._embed__font_StudioSparkMain_bold_normal_706083324 = cc__embed__font_StudioSparkMain_bold_normal_706083324;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._cc_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_ccWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return cc[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.width = 954;
         this.height = 500;
         this.verticalScrollPolicy = "off";
         this.layout = "absolute";
         this.creationPolicy = "none";
         this.addEventListener("preinitialize",this.___cc_Application1_preinitialize);
         this.addEventListener("applicationComplete",this.___cc_Application1_applicationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         cc._watcherSetupUtil = param1;
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
            this.backgroundAlpha = 0;
            this.backgroundColor = 16777215;
         };
         mx_internal::_cc_StylesInit();
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function loadClientLocale() : void
      {
         Util.loadClientLocale("cc",this.onClientLocaleComplete);
      }
      
      private function onClientLocaleComplete(param1:Event) : void
      {
         this.loadClientTheme();
      }
      
      private function loadClientTheme() : void
      {
         var _loc1_:UtilHashArray = Util.getFlashVar();
         var _loc2_:String = _loc1_.getValueByKey(ServerConstants.FLASHVAR_CLIENT_THEME_CODE);
         var _loc3_:String = _loc1_.getValueByKey(ServerConstants.FLASHVAR_CLIENT_THEME_LANG_CODE) || "en_US";
         var _loc4_:Array = new Array();
         var _loc5_:Array = new Array();
         var _loc6_:Array = new Array();
         _loc4_.push("cc");
         _loc5_.push(_loc3_);
         _loc6_.push(_loc2_);
         _loc4_.push("cc");
         _loc5_.push("lang_common");
         _loc6_.push(_loc2_);
         Util.loadClientTheming(_loc4_,_loc5_,_loc6_,this.onClientThemeComplete);
      }
      
      private function onClientThemeComplete(param1:Event) : void
      {
         (param1.target as IEventDispatcher).removeEventListener(param1.type,this.onClientThemeComplete);
         createComponentsFromDescriptors();
      }
      
      private function initialConsole() : void
      {
         Util.gaTracking("/gostudio/initialCCConsole",this.stage);
         var _loc1_:UtilHashArray = Util.getFlashVar();
         var _loc2_:String = _loc1_.getValueByKey(ServerConstants.FLASHVAR_SITE_ID);
         CcConsole.setConfiguration(_loc2_ == "youtube" ? new YouTube() : new GoAnimate());
         CcConsole.initializeCcConsole(this,this,this);
         this._ce_charPreviewer.scaleX = this._ce_charPreviewer.scaleY = 1.2;
         this.ps_charPreviewer.scaleX = this.ps_charPreviewer.scaleY = 1.2;
         this._ccConsole = CcConsole.getCcConsole();
      }
      
      public function get actionShopLoader() : SWFLoader
      {
         return this.actionShop;
      }
      
      public function get ui_main_ViewStack() : ViewStack
      {
         return this.mainViewStack;
      }
      
      public function get ui_main_ccCharEditor() : Container
      {
         return this._ce_mainViewStack;
      }
      
      public function get ui_main_ccCharPreviewAndSaveScreen() : Container
      {
         return this.ccCharPreviewAndSaveScreen;
      }
      
      public function get ui_ps_charFrame() : CharHeadFrame
      {
         return this.ps_charFrame;
      }
      
      public function get ui_ps_charPreviewer() : CharPreviewer
      {
         return this.ps_charPreviewer;
      }
      
      public function get ui_ps_interactionViewStack() : ViewStack
      {
         return this.ps_interactionViewStack;
      }
      
      public function get ui_ps_charPreviewCanvas() : Container
      {
         return this.ps_charPreviewCanvas;
      }
      
      public function get ui_ps_charPreviewOptionBox() : CharPreviewOptionBox
      {
         return this.ps_charPreviewOptionBox;
      }
      
      public function get ui_ps_charPurchaseBox() : IPurchaseBox
      {
         return this.ps_charPurchaseBox;
      }
      
      public function get ui_ps_statusPanel() : StatusPanel
      {
         return this.ps_charPurchaseBox.ps_statusPanel;
      }
      
      public function get ui_ps_userPointStatusPanel() : StatusPanel
      {
         return this.ps_charPurchaseBox.ps_userPointStatusPanel;
      }
      
      public function get ui_ps_purChaseCompleteContainer() : Container
      {
         return this.ps_purChaseCompleteContainer;
      }
      
      public function get ui_ps_purchaseCompleteBox() : IPurchaseCompleteBox
      {
         return this.ps_purchaseCompleteBox;
      }
      
      public function get ui_ce_componentTypeChooser() : ComponentTypeChooser
      {
         return this._ce_componentTypeChooser;
      }
      
      public function get ui_ce_charPreviewer() : CharPreviewer
      {
         return this._ce_charPreviewer;
      }
      
      public function get ui_ce_colorPicker() : CcColorPicker
      {
         return this._ce_colorPicker;
      }
      
      public function get ui_ce_buttonBar() : ButtonBar
      {
         return this._ce_buttonBar;
      }
      
      public function get ui_ce_statusPanel() : StatusPanel
      {
         return this._ce_statusPanel;
      }
      
      public function get ui_ce_componentChooserViewStack() : ViewStack
      {
         return this._ce_componentChooserViewStack;
      }
      
      public function get ui_ce_componentThumbChooser() : ComponentThumbChooser
      {
         return this._ce_componentThumbChooser;
      }
      
      public function get ui_ce_clothesChooser() : ClothesChooser
      {
         return this._ce_clothesChooser;
      }
      
      public function get ui_ce_bodyShapeMegaChooser() : BodyShapeMegaChooser
      {
         return this._ce_bodyShapeMegaChooser;
      }
      
      public function get ui_ce_bodyShapeChooser() : BodyShapeChooser
      {
         return this._ce_bodyShapeMegaChooser.bodyShapeChooser;
      }
      
      public function get ui_ce_thumbPropertyInspector() : CcThumbPropertyInspector
      {
         return this._ce_thumbPropertyInspector;
      }
      
      public function get ui_ce_selectedDecoration() : SelectedDecoration
      {
         return this._ce_selectedDecoration;
      }
      
      public function get ui_ce_mainViewStack() : ViewStack
      {
         return this._ce_mainViewStack;
      }
      
      public function get ui_ce_mainEditorComponentsContainer() : Canvas
      {
         return this._ce_mainEditorComponentsContainer;
      }
      
      public function get ui_ce_charScaleChooser() : CharScaleChooser
      {
         return this._ce_charScaleChooser;
      }
      
      public function get ui_ps_setavatarbutton() : Button
      {
         return this.ps_btnavatar;
      }
      
      private function onBgReady(param1:Event) : void
      {
         var _loc3_:Canvas = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc2_:String = Util.getFlashVar().getValueByKey(ServerConstants.FLASHVAR_MONEY_MODE) as String;
         if(_loc2_ != "school")
         {
            _loc3_ = Canvas(param1.currentTarget);
            _loc4_ = 0;
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc3_.clipContent = false;
            _loc3_.graphics.clear();
            _loc3_.graphics.beginFill(16777215,0.5);
            _loc3_.graphics.drawRoundRectComplex(0 + _loc4_,-5 + _loc5_,_loc3_.width + _loc6_,_loc3_.height + 15 + _loc7_,10,10,0,0);
            _loc3_.graphics.endFill();
         }
         else
         {
            this._ce_statusPanel.visible = false;
         }
      }
      
      private function onInteractionViewStackChange(param1:IndexChangedEvent) : void
      {
         if(param1.relatedObject == this.ps_purChaseCompleteContainer)
         {
         }
      }
      
      private function showFBSharer() : void
      {
         var _loc1_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.SHOW_FACEBOOK_SHARER,this,FlexGlobals.topLevelApplication);
         CcConsole.getCcConsole().dispatchEvent(_loc1_);
      }
      
      private function hideFBShareAsNeeded(param1:Event) : void
      {
         var _loc2_:String = Util.getFlashVar().getValueByKey(ServerConstants.FLASHVAR_SITE_ID) as String;
         this.ps_btnFBShare.visible = !_loc2_ || _loc2_ != "school";
         if(!FeatureManager.shouldFacebookShareBeShown)
         {
            this.ps_btnFBShare.visible = false;
            this.ps_charFrame.y = 180;
         }
      }
      
      public function ___cc_Application1_preinitialize(param1:FlexEvent) : void
      {
         this.loadClientLocale();
      }
      
      public function ___cc_Application1_applicationComplete(param1:FlexEvent) : void
      {
         this.initialConsole();
      }
      
      public function ___bgStatus_resize(param1:ResizeEvent) : void
      {
         this.onBgReady(param1);
      }
      
      public function __ps_purChaseCompleteContainer_creationComplete(param1:FlexEvent) : void
      {
         this.hideFBShareAsNeeded(param1);
      }
      
      public function __ps_btnFBShare_click(param1:MouseEvent) : void
      {
         this.showFBSharer();
      }
      
      private function _cc_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Number
         {
            return _ce_statusPanel.x;
         },null,"_bgStatus.x");
         result[1] = new Binding(this,function():Number
         {
            return _ce_statusPanel.y;
         },null,"_bgStatus.y");
         result[2] = new Binding(this,function():Number
         {
            return _ce_statusPanel.width;
         },null,"_bgStatus.width");
         result[3] = new Binding(this,function():Number
         {
            return _ce_statusPanel.height;
         },null,"_bgStatus.height");
         result[4] = new Binding(this,function():Number
         {
            return (this.width - ps_charPreviewOptionBox.width) / 2;
         },null,"ps_charPreviewOptionBox.x");
         result[5] = new Binding(this,function():Number
         {
            return this.height - ps_charPreviewOptionBox.height;
         },null,"ps_charPreviewOptionBox.y");
         result[6] = new Binding(this,function():Number
         {
            return this.width / 2 - 50;
         },null,"ps_charPurchaseBox.x");
         result[7] = new Binding(this,function():Number
         {
            return this.height / 2 - 110;
         },null,"ps_charPurchaseBox.y");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Share it on Facebook");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"ps_btnFBShare.label");
         return result;
      }
      
      mx_internal function _cc_StylesInit() : void
      {
         var style:CSSStyleDeclaration = null;
         var effects:Array = null;
         var conditions:Array = null;
         var condition:CSSCondition = null;
         var selector:CSSSelector = null;
         if(mx_internal::_cc_StylesInit_done)
         {
            return;
         }
         mx_internal::_cc_StylesInit_done = true;
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("global",conditions,selector);
         style = styleManager.getStyleDeclaration("global");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.layoutDirection = "ltr";
            };
         }
         selector = null;
         conditions = null;
         conditions = null;
         selector = new CSSSelector("spark.components.Label",conditions,selector);
         style = styleManager.getStyleDeclaration("spark.components.Label");
         if(!style)
         {
            style = new CSSStyleDeclaration(selector,styleManager);
         }
         if(style.factory == null)
         {
            style.factory = function():void
            {
               this.fontLookup = "embeddedCFF";
               this.color = 0;
               this.fontStyle = "normal";
               this.fontFamily = "StudioSparkMain";
            };
         }
         styleManager.initProtoChainRoots();
      }
      
      [Bindable(event="propertyChange")]
      public function get _bgStatus() : Canvas
      {
         return this._1502809610_bgStatus;
      }
      
      public function set _bgStatus(param1:Canvas) : void
      {
         var _loc2_:Object = this._1502809610_bgStatus;
         if(_loc2_ !== param1)
         {
            this._1502809610_bgStatus = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bgStatus",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_bodyShapeMegaChooser() : BodyShapeMegaChooser
      {
         return this._267076680_ce_bodyShapeMegaChooser;
      }
      
      public function set _ce_bodyShapeMegaChooser(param1:BodyShapeMegaChooser) : void
      {
         var _loc2_:Object = this._267076680_ce_bodyShapeMegaChooser;
         if(_loc2_ !== param1)
         {
            this._267076680_ce_bodyShapeMegaChooser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_bodyShapeMegaChooser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_buttonBar() : ButtonBar
      {
         return this._495053373_ce_buttonBar;
      }
      
      public function set _ce_buttonBar(param1:ButtonBar) : void
      {
         var _loc2_:Object = this._495053373_ce_buttonBar;
         if(_loc2_ !== param1)
         {
            this._495053373_ce_buttonBar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_buttonBar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_charPreviewer() : CharPreviewer
      {
         return this._1163196673_ce_charPreviewer;
      }
      
      public function set _ce_charPreviewer(param1:CharPreviewer) : void
      {
         var _loc2_:Object = this._1163196673_ce_charPreviewer;
         if(_loc2_ !== param1)
         {
            this._1163196673_ce_charPreviewer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_charPreviewer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_charScaleChooser() : CharScaleChooser
      {
         return this._1041579653_ce_charScaleChooser;
      }
      
      public function set _ce_charScaleChooser(param1:CharScaleChooser) : void
      {
         var _loc2_:Object = this._1041579653_ce_charScaleChooser;
         if(_loc2_ !== param1)
         {
            this._1041579653_ce_charScaleChooser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_charScaleChooser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_clothesChooser() : ClothesChooser
      {
         return this._931590865_ce_clothesChooser;
      }
      
      public function set _ce_clothesChooser(param1:ClothesChooser) : void
      {
         var _loc2_:Object = this._931590865_ce_clothesChooser;
         if(_loc2_ !== param1)
         {
            this._931590865_ce_clothesChooser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_clothesChooser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_colorPicker() : CcColorPicker
      {
         return this._627432557_ce_colorPicker;
      }
      
      public function set _ce_colorPicker(param1:CcColorPicker) : void
      {
         var _loc2_:Object = this._627432557_ce_colorPicker;
         if(_loc2_ !== param1)
         {
            this._627432557_ce_colorPicker = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_colorPicker",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_componentChooserViewStack() : ViewStack
      {
         return this._1243488953_ce_componentChooserViewStack;
      }
      
      public function set _ce_componentChooserViewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1243488953_ce_componentChooserViewStack;
         if(_loc2_ !== param1)
         {
            this._1243488953_ce_componentChooserViewStack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_componentChooserViewStack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_componentThumbChooser() : ComponentThumbChooser
      {
         return this._740228964_ce_componentThumbChooser;
      }
      
      public function set _ce_componentThumbChooser(param1:ComponentThumbChooser) : void
      {
         var _loc2_:Object = this._740228964_ce_componentThumbChooser;
         if(_loc2_ !== param1)
         {
            this._740228964_ce_componentThumbChooser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_componentThumbChooser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_componentTypeChooser() : ComponentTypeChooser
      {
         return this._309190686_ce_componentTypeChooser;
      }
      
      public function set _ce_componentTypeChooser(param1:ComponentTypeChooser) : void
      {
         var _loc2_:Object = this._309190686_ce_componentTypeChooser;
         if(_loc2_ !== param1)
         {
            this._309190686_ce_componentTypeChooser = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_componentTypeChooser",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_mainEditorComponentsContainer() : Canvas
      {
         return this._678855911_ce_mainEditorComponentsContainer;
      }
      
      public function set _ce_mainEditorComponentsContainer(param1:Canvas) : void
      {
         var _loc2_:Object = this._678855911_ce_mainEditorComponentsContainer;
         if(_loc2_ !== param1)
         {
            this._678855911_ce_mainEditorComponentsContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_mainEditorComponentsContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_mainViewStack() : ViewStack
      {
         return this._164421228_ce_mainViewStack;
      }
      
      public function set _ce_mainViewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._164421228_ce_mainViewStack;
         if(_loc2_ !== param1)
         {
            this._164421228_ce_mainViewStack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_mainViewStack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_selectedDecoration() : SelectedDecoration
      {
         return this._580013481_ce_selectedDecoration;
      }
      
      public function set _ce_selectedDecoration(param1:SelectedDecoration) : void
      {
         var _loc2_:Object = this._580013481_ce_selectedDecoration;
         if(_loc2_ !== param1)
         {
            this._580013481_ce_selectedDecoration = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_selectedDecoration",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_statusPanel() : StatusPanel
      {
         return this._1876215540_ce_statusPanel;
      }
      
      public function set _ce_statusPanel(param1:StatusPanel) : void
      {
         var _loc2_:Object = this._1876215540_ce_statusPanel;
         if(_loc2_ !== param1)
         {
            this._1876215540_ce_statusPanel = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_statusPanel",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _ce_thumbPropertyInspector() : CcThumbPropertyInspector
      {
         return this._614936982_ce_thumbPropertyInspector;
      }
      
      public function set _ce_thumbPropertyInspector(param1:CcThumbPropertyInspector) : void
      {
         var _loc2_:Object = this._614936982_ce_thumbPropertyInspector;
         if(_loc2_ !== param1)
         {
            this._614936982_ce_thumbPropertyInspector = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_ce_thumbPropertyInspector",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get actionShop() : SWFLoader
      {
         return this._1851834956actionShop;
      }
      
      public function set actionShop(param1:SWFLoader) : void
      {
         var _loc2_:Object = this._1851834956actionShop;
         if(_loc2_ !== param1)
         {
            this._1851834956actionShop = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"actionShop",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ccCharPreviewAndSaveScreen() : Canvas
      {
         return this._361540722ccCharPreviewAndSaveScreen;
      }
      
      public function set ccCharPreviewAndSaveScreen(param1:Canvas) : void
      {
         var _loc2_:Object = this._361540722ccCharPreviewAndSaveScreen;
         if(_loc2_ !== param1)
         {
            this._361540722ccCharPreviewAndSaveScreen = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ccCharPreviewAndSaveScreen",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get mainViewStack() : ViewStack
      {
         return this._1703153366mainViewStack;
      }
      
      public function set mainViewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1703153366mainViewStack;
         if(_loc2_ !== param1)
         {
            this._1703153366mainViewStack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"mainViewStack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_btnFBShare() : Button
      {
         return this._1362478691ps_btnFBShare;
      }
      
      public function set ps_btnFBShare(param1:Button) : void
      {
         var _loc2_:Object = this._1362478691ps_btnFBShare;
         if(_loc2_ !== param1)
         {
            this._1362478691ps_btnFBShare = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_btnFBShare",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_btnavatar() : Button
      {
         return this._588295033ps_btnavatar;
      }
      
      public function set ps_btnavatar(param1:Button) : void
      {
         var _loc2_:Object = this._588295033ps_btnavatar;
         if(_loc2_ !== param1)
         {
            this._588295033ps_btnavatar = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_btnavatar",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_charFrame() : CharHeadFrame
      {
         return this._1132162171ps_charFrame;
      }
      
      public function set ps_charFrame(param1:CharHeadFrame) : void
      {
         var _loc2_:Object = this._1132162171ps_charFrame;
         if(_loc2_ !== param1)
         {
            this._1132162171ps_charFrame = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_charFrame",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_charPreviewCanvas() : Canvas
      {
         return this._1262756942ps_charPreviewCanvas;
      }
      
      public function set ps_charPreviewCanvas(param1:Canvas) : void
      {
         var _loc2_:Object = this._1262756942ps_charPreviewCanvas;
         if(_loc2_ !== param1)
         {
            this._1262756942ps_charPreviewCanvas = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_charPreviewCanvas",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_charPreviewOptionBox() : CharPreviewOptionBox
      {
         return this._1970784ps_charPreviewOptionBox;
      }
      
      public function set ps_charPreviewOptionBox(param1:CharPreviewOptionBox) : void
      {
         var _loc2_:Object = this._1970784ps_charPreviewOptionBox;
         if(_loc2_ !== param1)
         {
            this._1970784ps_charPreviewOptionBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_charPreviewOptionBox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_charPreviewer() : CharPreviewer
      {
         return this._1263293821ps_charPreviewer;
      }
      
      public function set ps_charPreviewer(param1:CharPreviewer) : void
      {
         var _loc2_:Object = this._1263293821ps_charPreviewer;
         if(_loc2_ !== param1)
         {
            this._1263293821ps_charPreviewer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_charPreviewer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_charPurchaseBox() : PurchaseBox
      {
         return this._920644200ps_charPurchaseBox;
      }
      
      public function set ps_charPurchaseBox(param1:PurchaseBox) : void
      {
         var _loc2_:Object = this._920644200ps_charPurchaseBox;
         if(_loc2_ !== param1)
         {
            this._920644200ps_charPurchaseBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_charPurchaseBox",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_interactionViewStack() : ViewStack
      {
         return this._1995015763ps_interactionViewStack;
      }
      
      public function set ps_interactionViewStack(param1:ViewStack) : void
      {
         var _loc2_:Object = this._1995015763ps_interactionViewStack;
         if(_loc2_ !== param1)
         {
            this._1995015763ps_interactionViewStack = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_interactionViewStack",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_purChaseCompleteContainer() : Canvas
      {
         return this._1122792149ps_purChaseCompleteContainer;
      }
      
      public function set ps_purChaseCompleteContainer(param1:Canvas) : void
      {
         var _loc2_:Object = this._1122792149ps_purChaseCompleteContainer;
         if(_loc2_ !== param1)
         {
            this._1122792149ps_purChaseCompleteContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_purChaseCompleteContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ps_purchaseCompleteBox() : PurchaseCompleteBox
      {
         return this._806339029ps_purchaseCompleteBox;
      }
      
      public function set ps_purchaseCompleteBox(param1:PurchaseCompleteBox) : void
      {
         var _loc2_:Object = this._806339029ps_purchaseCompleteBox;
         if(_loc2_ !== param1)
         {
            this._806339029ps_purchaseCompleteBox = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ps_purchaseCompleteBox",_loc2_,param1));
            }
         }
      }
   }
}
