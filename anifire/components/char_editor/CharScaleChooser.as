package anifire.components.char_editor
{
   import anifire.constant.CcLibConstant;
   import anifire.event.CcScaleChosenEvent;
   import anifire.event.CcThumbPropertyEvent;
   import anifire.event.CcThumbScaleEvent;
   import anifire.util.UtilDict;
   import anifire.util.UtilUser;
   import caurina.transitions.Tweener;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.controls.HSlider;
   import mx.controls.Text;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   use namespace mx_internal;
   
   public class CharScaleChooser extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CharScaleChooser_Button5:Button;
      
      public var _CharScaleChooser_Text10:Text;
      
      private var _94436_bg:Canvas;
      
      private var _1712925473_btnNextPage:Button;
      
      private var _116765665_btnPrevPage:Button;
      
      private var _1198932158_charPreview1:CharPreviewer;
      
      private var _1198932159_charPreview2:CharPreviewer;
      
      private var _1198932160_charPreview3:CharPreviewer;
      
      private var _1198932161_charPreview4:CharPreviewer;
      
      private var _1198932162_charPreview5:CharPreviewer;
      
      private var _985212102_content:HBox;
      
      private var _122652356_customize:HBox;
      
      private var _781452424_headPosControl:FourDirectionControl;
      
      private var _492813754_templates:HBox;
      
      private var _706938537_txtCurrent1:Text;
      
      private var _706938538_txtCurrent2:Text;
      
      private var _706938539_txtCurrent3:Text;
      
      private var _706938540_txtCurrent4:Text;
      
      private var _706938541_txtCurrent5:Text;
      
      private var _1373679106_txtTopic:Text;
      
      private var _645829225_txtUpdate1:Text;
      
      private var _645829224_txtUpdate2:Text;
      
      private var _645829223_txtUpdate3:Text;
      
      private var _645829222_txtUpdate4:Text;
      
      private var _1432568777bodyScaleSlider:HSlider;
      
      private var _2082343164btnClose:Button;
      
      private var _577459619btnScale1:Canvas;
      
      private var _577459620btnScale2:Canvas;
      
      private var _577459621btnScale3:Canvas;
      
      private var _577459622btnScale4:Canvas;
      
      private var _577459623btnScale5:Canvas;
      
      private var _818035915headScaleSlider:HSlider;
      
      private var _1248513367styleCurrent1:Canvas;
      
      private var _1248513366styleCurrent2:Canvas;
      
      private var _1248513365styleCurrent3:Canvas;
      
      private var _1248513364styleCurrent4:Canvas;
      
      private var _1248513363styleCurrent5:Canvas;
      
      private var _125384364styleOver1:Canvas;
      
      private var _125384365styleOver2:Canvas;
      
      private var _125384366styleOver3:Canvas;
      
      private var _125384367styleOver4:Canvas;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CharScaleChooser()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "events":{"initialize":"___CharScaleChooser_Canvas1_initialize"},
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "id":"_content",
                  "stylesFactory":function():void
                  {
                     this.horizontalGap = 0;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "horizontalScrollPolicy":"off",
                        "verticalScrollPolicy":"off",
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":50,
                                 "percentHeight":100,
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "id":"_bg",
                                    "stylesFactory":function():void
                                    {
                                       this.backgroundColor = 0;
                                       this.backgroundAlpha = 0.8;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "x":0,
                                          "y":0,
                                          "percentWidth":100,
                                          "percentHeight":100
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"btnClose",
                                    "events":{"click":"__btnClose_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"btnCloseCross",
                                          "top":10,
                                          "right":10,
                                          "width":11,
                                          "height":9,
                                          "buttonMode":true,
                                          "useHandCursor":true
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_txtTopic",
                                    "stylesFactory":function():void
                                    {
                                       this.textAlign = "center";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"lblWhiteTextBold",
                                          "top":38,
                                          "percentWidth":100
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_templates",
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalGap = 42;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {"childDescriptors":[new UIComponentDescriptor({
                                          "type":Canvas,
                                          "id":"btnScale1",
                                          "events":{
                                             "click":"__btnScale1_click",
                                             "mouseOver":"__btnScale1_mouseOver",
                                             "mouseOut":"__btnScale1_mouseOut"
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "width":160,
                                                "height":380,
                                                "buttonMode":true,
                                                "useHandCursor":true,
                                                "mouseChildren":false,
                                                "childDescriptors":[new UIComponentDescriptor({
                                                   "type":Canvas,
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "styleName":"bgCharScale1",
                                                         "width":160,
                                                         "height":380
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":CharPreviewer,
                                                   "id":"_charPreview1",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "x":0,
                                                         "y":0,
                                                         "width":160,
                                                         "height":340
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Canvas,
                                                   "id":"styleCurrent1",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "styleName":"overCurrentScale",
                                                         "width":160,
                                                         "height":380,
                                                         "visible":false,
                                                         "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"_txtCurrent1",
                                                            "stylesFactory":function():void
                                                            {
                                                               this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "styleName":"lblWhiteTextBold",
                                                                  "bottom":2,
                                                                  "percentWidth":100
                                                               };
                                                            }
                                                         })]
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Canvas,
                                                   "id":"styleOver1",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "styleName":"overUpdateScale",
                                                         "width":160,
                                                         "height":380,
                                                         "visible":false,
                                                         "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"_txtUpdate1",
                                                            "stylesFactory":function():void
                                                            {
                                                               this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "styleName":"lblWhiteTextBold",
                                                                  "bottom":2,
                                                                  "percentWidth":100
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
                                          "id":"btnScale2",
                                          "events":{
                                             "click":"__btnScale2_click",
                                             "mouseOver":"__btnScale2_mouseOver",
                                             "mouseOut":"__btnScale2_mouseOut"
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "width":160,
                                                "height":380,
                                                "buttonMode":true,
                                                "useHandCursor":true,
                                                "mouseChildren":false,
                                                "childDescriptors":[new UIComponentDescriptor({
                                                   "type":Canvas,
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "styleName":"bgCharScale2",
                                                         "width":160,
                                                         "height":380
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":CharPreviewer,
                                                   "id":"_charPreview2",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "x":0,
                                                         "y":0,
                                                         "width":160,
                                                         "height":340
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Canvas,
                                                   "id":"styleCurrent2",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "styleName":"overCurrentScale",
                                                         "width":160,
                                                         "height":380,
                                                         "visible":false,
                                                         "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"_txtCurrent2",
                                                            "stylesFactory":function():void
                                                            {
                                                               this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "styleName":"lblWhiteTextBold",
                                                                  "bottom":2,
                                                                  "percentWidth":100
                                                               };
                                                            }
                                                         })]
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Canvas,
                                                   "id":"styleOver2",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "styleName":"overUpdateScale",
                                                         "width":160,
                                                         "height":380,
                                                         "visible":false,
                                                         "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"_txtUpdate2",
                                                            "stylesFactory":function():void
                                                            {
                                                               this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "styleName":"lblWhiteTextBold",
                                                                  "bottom":2,
                                                                  "percentWidth":100
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
                                          "id":"btnScale3",
                                          "events":{
                                             "click":"__btnScale3_click",
                                             "mouseOver":"__btnScale3_mouseOver",
                                             "mouseOut":"__btnScale3_mouseOut"
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "width":160,
                                                "height":380,
                                                "buttonMode":true,
                                                "useHandCursor":true,
                                                "mouseChildren":false,
                                                "childDescriptors":[new UIComponentDescriptor({
                                                   "type":Canvas,
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "styleName":"bgCharScale3",
                                                         "width":160,
                                                         "height":380
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":CharPreviewer,
                                                   "id":"_charPreview3",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "x":0,
                                                         "y":0,
                                                         "width":160,
                                                         "height":340
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Canvas,
                                                   "id":"styleCurrent3",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "styleName":"overCurrentScale",
                                                         "width":160,
                                                         "height":380,
                                                         "visible":false,
                                                         "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"_txtCurrent3",
                                                            "stylesFactory":function():void
                                                            {
                                                               this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "styleName":"lblWhiteTextBold",
                                                                  "bottom":2,
                                                                  "percentWidth":100
                                                               };
                                                            }
                                                         })]
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Canvas,
                                                   "id":"styleOver3",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "styleName":"overUpdateScale",
                                                         "width":160,
                                                         "height":380,
                                                         "visible":false,
                                                         "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"_txtUpdate3",
                                                            "stylesFactory":function():void
                                                            {
                                                               this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "styleName":"lblWhiteTextBold",
                                                                  "bottom":2,
                                                                  "percentWidth":100
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
                                          "id":"btnScale4",
                                          "events":{
                                             "click":"__btnScale4_click",
                                             "mouseOver":"__btnScale4_mouseOver",
                                             "mouseOut":"__btnScale4_mouseOut"
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "width":160,
                                                "height":380,
                                                "buttonMode":true,
                                                "useHandCursor":true,
                                                "mouseChildren":false,
                                                "childDescriptors":[new UIComponentDescriptor({
                                                   "type":Canvas,
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "styleName":"bgCharScale4",
                                                         "width":160,
                                                         "height":380
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":CharPreviewer,
                                                   "id":"_charPreview4",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "x":0,
                                                         "y":0,
                                                         "width":160,
                                                         "height":340
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Canvas,
                                                   "id":"styleCurrent4",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "styleName":"overCurrentScale",
                                                         "width":160,
                                                         "height":380,
                                                         "visible":false,
                                                         "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"_txtCurrent4",
                                                            "stylesFactory":function():void
                                                            {
                                                               this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "styleName":"lblWhiteTextBold",
                                                                  "bottom":2,
                                                                  "percentWidth":100
                                                               };
                                                            }
                                                         })]
                                                      };
                                                   }
                                                }),new UIComponentDescriptor({
                                                   "type":Canvas,
                                                   "id":"styleOver4",
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "styleName":"overUpdateScale",
                                                         "width":160,
                                                         "height":380,
                                                         "visible":false,
                                                         "childDescriptors":[new UIComponentDescriptor({
                                                            "type":Text,
                                                            "id":"_txtUpdate4",
                                                            "stylesFactory":function():void
                                                            {
                                                               this.textAlign = "center";
                                                            },
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {
                                                                  "styleName":"lblWhiteTextBold",
                                                                  "bottom":2,
                                                                  "percentWidth":100
                                                               };
                                                            }
                                                         })]
                                                      };
                                                   }
                                                })]
                                             };
                                          }
                                       })]};
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_btnNextPage",
                                    "events":{"click":"___btnNextPage_click"},
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
                           "type":Canvas,
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "percentWidth":50,
                                 "percentHeight":100,
                                 "horizontalScrollPolicy":"off",
                                 "verticalScrollPolicy":"off",
                                 "childDescriptors":[new UIComponentDescriptor({
                                    "type":Canvas,
                                    "stylesFactory":function():void
                                    {
                                       this.backgroundColor = 0;
                                       this.backgroundAlpha = 0.8;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "x":0,
                                          "y":0,
                                          "percentWidth":100,
                                          "percentHeight":100
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "events":{"click":"___CharScaleChooser_Button3_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"btnCloseCross",
                                          "top":10,
                                          "right":10,
                                          "width":11,
                                          "height":9,
                                          "buttonMode":true,
                                          "useHandCursor":true
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Text,
                                    "id":"_CharScaleChooser_Text10",
                                    "stylesFactory":function():void
                                    {
                                       this.textAlign = "center";
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"lblWhiteTextBold",
                                          "top":32,
                                          "percentWidth":100
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":Button,
                                    "id":"_btnPrevPage",
                                    "events":{"click":"___btnPrevPage_click"},
                                    "propertiesFactory":function():Object
                                    {
                                       return {
                                          "styleName":"buttonBarLeft",
                                          "x":5,
                                          "buttonMode":true
                                       };
                                    }
                                 }),new UIComponentDescriptor({
                                    "type":HBox,
                                    "id":"_customize",
                                    "stylesFactory":function():void
                                    {
                                       this.horizontalGap = 20;
                                    },
                                    "propertiesFactory":function():Object
                                    {
                                       return {"childDescriptors":[new UIComponentDescriptor({
                                          "type":VBox,
                                          "stylesFactory":function():void
                                          {
                                             this.horizontalAlign = "center";
                                          },
                                          "propertiesFactory":function():Object
                                          {
                                             return {"childDescriptors":[new UIComponentDescriptor({
                                                "type":Canvas,
                                                "id":"btnScale5",
                                                "propertiesFactory":function():Object
                                                {
                                                   return {"childDescriptors":[new UIComponentDescriptor({
                                                      "type":Canvas,
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "styleName":"bgCharScale1",
                                                            "width":160,
                                                            "height":380
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":CharPreviewer,
                                                      "id":"_charPreview5",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "x":0,
                                                            "y":0,
                                                            "width":160,
                                                            "height":340
                                                         };
                                                      }
                                                   }),new UIComponentDescriptor({
                                                      "type":Canvas,
                                                      "id":"styleCurrent5",
                                                      "propertiesFactory":function():Object
                                                      {
                                                         return {
                                                            "styleName":"overCurrentScale",
                                                            "width":160,
                                                            "height":380,
                                                            "visible":false,
                                                            "childDescriptors":[new UIComponentDescriptor({
                                                               "type":Text,
                                                               "id":"_txtCurrent5",
                                                               "stylesFactory":function():void
                                                               {
                                                                  this.textAlign = "center";
                                                               },
                                                               "propertiesFactory":function():Object
                                                               {
                                                                  return {
                                                                     "styleName":"lblWhiteTextBold",
                                                                     "bottom":2,
                                                                     "percentWidth":100
                                                                  };
                                                               }
                                                            })]
                                                         };
                                                      }
                                                   })]};
                                                }
                                             }),new UIComponentDescriptor({
                                                "type":Button,
                                                "id":"_CharScaleChooser_Button5",
                                                "events":{"click":"___CharScaleChooser_Button5_click"},
                                                "propertiesFactory":function():Object
                                                {
                                                   return {
                                                      "styleName":"btnGoStudio",
                                                      "buttonMode":true
                                                   };
                                                }
                                             })]};
                                          }
                                       }),new UIComponentDescriptor({
                                          "type":Canvas,
                                          "propertiesFactory":function():Object
                                          {
                                             return {
                                                "verticalCenter":1,
                                                "percentHeight":100,
                                                "childDescriptors":[new UIComponentDescriptor({
                                                   "type":VBox,
                                                   "stylesFactory":function():void
                                                   {
                                                      this.verticalAlign = "middle";
                                                      this.verticalGap = 20;
                                                   },
                                                   "propertiesFactory":function():Object
                                                   {
                                                      return {
                                                         "verticalCenter":1,
                                                         "childDescriptors":[new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "stylesFactory":function():void
                                                            {
                                                               this.verticalAlign = "middle";
                                                            },
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {"childDescriptors":[new UIComponentDescriptor({
                                                                  "type":Canvas,
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {
                                                                        "styleName":"iconHeadSmall",
                                                                        "width":28,
                                                                        "height":28
                                                                     };
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":HSlider,
                                                                  "id":"headScaleSlider",
                                                                  "events":{"click":"__headScaleSlider_click"},
                                                                  "stylesFactory":function():void
                                                                  {
                                                                     this.dataTipPlacement = "top";
                                                                     this.showTrackHighlight = false;
                                                                  },
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {
                                                                        "styleName":"ccslider",
                                                                        "width":130,
                                                                        "minimum":60,
                                                                        "maximum":180,
                                                                        "snapInterval":1,
                                                                        "allowTrackClick":true,
                                                                        "liveDragging":true,
                                                                        "visible":true
                                                                     };
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":Canvas,
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {
                                                                        "styleName":"iconHeadBig",
                                                                        "width":40,
                                                                        "height":40
                                                                     };
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":FourDirectionControl,
                                                                  "id":"_headPosControl",
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {
                                                                        "scaleX":0.75,
                                                                        "scaleY":0.75
                                                                     };
                                                                  }
                                                               })]};
                                                            }
                                                         }),new UIComponentDescriptor({
                                                            "type":HBox,
                                                            "stylesFactory":function():void
                                                            {
                                                               this.verticalAlign = "middle";
                                                            },
                                                            "propertiesFactory":function():Object
                                                            {
                                                               return {"childDescriptors":[new UIComponentDescriptor({
                                                                  "type":Canvas,
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {
                                                                        "styleName":"iconBodySmall",
                                                                        "width":13,
                                                                        "height":32
                                                                     };
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":HSlider,
                                                                  "id":"bodyScaleSlider",
                                                                  "events":{"click":"__bodyScaleSlider_click"},
                                                                  "stylesFactory":function():void
                                                                  {
                                                                     this.dataTipPlacement = "top";
                                                                     this.showTrackHighlight = false;
                                                                  },
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {
                                                                        "styleName":"ccslider",
                                                                        "width":210,
                                                                        "minimum":60,
                                                                        "maximum":140,
                                                                        "snapInterval":1,
                                                                        "allowTrackClick":true,
                                                                        "liveDragging":true,
                                                                        "visible":true
                                                                     };
                                                                  }
                                                               }),new UIComponentDescriptor({
                                                                  "type":Canvas,
                                                                  "propertiesFactory":function():Object
                                                                  {
                                                                     return {
                                                                        "styleName":"iconBodyBig",
                                                                        "width":26,
                                                                        "height":62
                                                                     };
                                                                  }
                                                               })]};
                                                            }
                                                         })]
                                                      };
                                                   }
                                                })]
                                             };
                                          }
                                       })]};
                                    }
                                 })]
                              };
                           }
                        })]
                     };
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
         var bindings:Array = this._CharScaleChooser_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_char_editor_CharScaleChooserWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CharScaleChooser[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.percentWidth = 100;
         this.percentHeight = 100;
         this.horizontalScrollPolicy = "off";
         this.verticalScrollPolicy = "off";
         this.addEventListener("initialize",this.___CharScaleChooser_Canvas1_initialize);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CharScaleChooser._watcherSetupUtil = param1;
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
      
      private function onCustomScaleButtonClick() : void
      {
         var _loc1_:CcScaleChosenEvent = new CcScaleChosenEvent(CcScaleChosenEvent.SCALE_CHOSEN,this);
         _loc1_.head_scale = this._charPreview5.getHeadScale().x;
         _loc1_.body_scale = this._charPreview5.getBodyScale().x;
         _loc1_.head_pos = this._charPreview5.getHeadPos();
         dispatchEvent(_loc1_);
         this.startHide();
      }
      
      private function onScaleButtonClick(param1:Event) : void
      {
         var _loc2_:CcScaleChosenEvent = new CcScaleChosenEvent(CcScaleChosenEvent.SCALE_CHOSEN,this);
         switch(param1.currentTarget)
         {
            case this.btnScale1:
               _loc2_.head_scale = CcLibConstant.DEFAULT_HEADSCALES[0];
               _loc2_.body_scale = CcLibConstant.DEFAULT_BODYSCALES[0];
               _loc2_.head_pos = CcLibConstant.DEFAULT_HEADPOS[0];
               break;
            case this.btnScale2:
               _loc2_.head_scale = CcLibConstant.DEFAULT_HEADSCALES[1];
               _loc2_.body_scale = CcLibConstant.DEFAULT_BODYSCALES[1];
               _loc2_.head_pos = CcLibConstant.DEFAULT_HEADPOS[1];
               break;
            case this.btnScale3:
               _loc2_.head_scale = CcLibConstant.DEFAULT_HEADSCALES[2];
               _loc2_.body_scale = CcLibConstant.DEFAULT_BODYSCALES[2];
               _loc2_.head_pos = CcLibConstant.DEFAULT_HEADPOS[2];
               break;
            case this.btnScale4:
               _loc2_.head_scale = CcLibConstant.DEFAULT_HEADSCALES[3];
               _loc2_.body_scale = CcLibConstant.DEFAULT_BODYSCALES[3];
               _loc2_.head_pos = CcLibConstant.DEFAULT_HEADPOS[3];
         }
         dispatchEvent(_loc2_);
         this.startHide();
      }
      
      public function pickCurrentScale(param1:Number) : void
      {
         this.styleCurrent1.visible = this.styleCurrent2.visible = this.styleCurrent3.visible = this.styleCurrent4.visible = this.styleCurrent5.visible = false;
         switch(param1)
         {
            case 0:
               this.styleCurrent1.visible = true;
               break;
            case 1:
               this.styleCurrent2.visible = true;
               break;
            case 2:
               this.styleCurrent3.visible = true;
               break;
            case 3:
               this.styleCurrent4.visible = true;
               break;
            default:
               this.styleCurrent5.visible = true;
         }
      }
      
      public function show() : void
      {
         if(UtilUser.hasPlusFeatures())
         {
            this._btnNextPage.visible = true;
         }
         else
         {
            this._btnNextPage.visible = false;
         }
         this._content.width = this.width * 2;
         this.visible = true;
         Tweener.addTween(this,{
            "alpha":1,
            "time":0.5
         });
         this._headPosControl.addEventListener(CcThumbPropertyEvent.CCPROP_DOWN_BUTTON_CLICK,this.updateHeadPos);
         this._headPosControl.addEventListener(CcThumbPropertyEvent.CCPROP_UP_BUTTON_CLICK,this.updateHeadPos);
         this._headPosControl.addEventListener(CcThumbPropertyEvent.CCPROP_LEFT_BUTTON_CLICK,this.updateHeadPos);
         this._headPosControl.addEventListener(CcThumbPropertyEvent.CCPROP_RIGHT_BUTTON_CLICK,this.updateHeadPos);
      }
      
      public function startHide() : void
      {
         this.hide();
      }
      
      private function hide() : void
      {
         this.alpha = 0;
         this.visible = false;
      }
      
      private function slideContent(param1:Number) : void
      {
         var _loc2_:Number = this._content.x + param1 * this.width;
         Tweener.addTween(this._content,{
            "x":_loc2_,
            "time":0.5
         });
      }
      
      private function changeHeadSize() : void
      {
         var _loc1_:CcThumbScaleEvent = new CcThumbScaleEvent(CcThumbScaleEvent.CCTHUMB_SCALE_UPDATE,this);
         _loc1_.part = CcLibConstant.COMPONENT_CAT_HEAD;
         _loc1_.scale = this.headScaleSlider.value;
         var _loc2_:Number = _loc1_.scale / 100;
         if(_loc1_.part == CcLibConstant.COMPONENT_CAT_HEAD)
         {
            this._charPreview5.setHeadScale(_loc2_,_loc2_);
         }
         else if(_loc1_.part == CcLibConstant.COMPONENT_CAT_BODY)
         {
            this._charPreview5.setBodyScale(_loc2_,_loc2_);
         }
      }
      
      private function changeBodySize() : void
      {
         var _loc1_:CcThumbScaleEvent = new CcThumbScaleEvent(CcThumbScaleEvent.CCTHUMB_SCALE_UPDATE,this);
         _loc1_.part = CcLibConstant.COMPONENT_CAT_BODY;
         _loc1_.scale = this.bodyScaleSlider.value;
         var _loc2_:Number = _loc1_.scale / 100;
         if(_loc1_.part == CcLibConstant.COMPONENT_CAT_HEAD)
         {
            this._charPreview5.setHeadScale(_loc2_,_loc2_);
         }
         else if(_loc1_.part == CcLibConstant.COMPONENT_CAT_BODY)
         {
            this._charPreview5.setBodyScale(_loc2_,_loc2_);
         }
      }
      
      private function updateHeadPos(param1:Event) : void
      {
         var _loc2_:Number = 0;
         var _loc3_:Number = 0;
         switch(param1.type)
         {
            case CcThumbPropertyEvent.CCPROP_UP_BUTTON_CLICK:
               _loc3_ = -1;
               break;
            case CcThumbPropertyEvent.CCPROP_DOWN_BUTTON_CLICK:
               _loc3_ = 1;
               break;
            case CcThumbPropertyEvent.CCPROP_LEFT_BUTTON_CLICK:
               _loc2_ = 1;
               break;
            case CcThumbPropertyEvent.CCPROP_RIGHT_BUTTON_CLICK:
               _loc2_ = -1;
         }
         this._charPreview5.setHeadPos(_loc2_,_loc3_);
      }
      
      public function ___CharScaleChooser_Canvas1_initialize(param1:FlexEvent) : void
      {
         this.hide();
      }
      
      public function __btnClose_click(param1:MouseEvent) : void
      {
         this.startHide();
      }
      
      public function __btnScale1_click(param1:MouseEvent) : void
      {
         this.onScaleButtonClick(param1);
      }
      
      public function __btnScale1_mouseOver(param1:MouseEvent) : void
      {
         this.styleOver1.visible = true;
      }
      
      public function __btnScale1_mouseOut(param1:MouseEvent) : void
      {
         this.styleOver1.visible = false;
      }
      
      public function __btnScale2_click(param1:MouseEvent) : void
      {
         this.onScaleButtonClick(param1);
      }
      
      public function __btnScale2_mouseOver(param1:MouseEvent) : void
      {
         this.styleOver2.visible = true;
      }
      
      public function __btnScale2_mouseOut(param1:MouseEvent) : void
      {
         this.styleOver2.visible = false;
      }
      
      public function __btnScale3_click(param1:MouseEvent) : void
      {
         this.onScaleButtonClick(param1);
      }
      
      public function __btnScale3_mouseOver(param1:MouseEvent) : void
      {
         this.styleOver3.visible = true;
      }
      
      public function __btnScale3_mouseOut(param1:MouseEvent) : void
      {
         this.styleOver3.visible = false;
      }
      
      public function __btnScale4_click(param1:MouseEvent) : void
      {
         this.onScaleButtonClick(param1);
      }
      
      public function __btnScale4_mouseOver(param1:MouseEvent) : void
      {
         this.styleOver4.visible = true;
      }
      
      public function __btnScale4_mouseOut(param1:MouseEvent) : void
      {
         this.styleOver4.visible = false;
      }
      
      public function ___btnNextPage_click(param1:MouseEvent) : void
      {
         this.slideContent(-1);
      }
      
      public function ___CharScaleChooser_Button3_click(param1:MouseEvent) : void
      {
         this.startHide();
      }
      
      public function ___btnPrevPage_click(param1:MouseEvent) : void
      {
         this.slideContent(1);
      }
      
      public function ___CharScaleChooser_Button5_click(param1:MouseEvent) : void
      {
         this.onCustomScaleButtonClick();
      }
      
      public function __headScaleSlider_click(param1:MouseEvent) : void
      {
         this.changeHeadSize();
      }
      
      public function __bodyScaleSlider_click(param1:MouseEvent) : void
      {
         this.changeBodySize();
      }
      
      private function _CharScaleChooser_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Choose a different scale for your character");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtTopic.text");
         result[1] = new Binding(this,function():Number
         {
            return (this.width - _templates.width) / 2;
         },null,"_templates.x");
         result[2] = new Binding(this,function():Number
         {
            return this.height - _templates.height - 28;
         },null,"_templates.y");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Current");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtCurrent1.text");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Update");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtUpdate1.text");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Current");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtCurrent2.text");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Update");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtUpdate2.text");
         result[7] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Current");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtCurrent3.text");
         result[8] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Update");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtUpdate3.text");
         result[9] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Current");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtCurrent4.text");
         result[10] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Update");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtUpdate4.text");
         result[11] = new Binding(this,function():Number
         {
            return _bg.width - _btnNextPage.width - 5;
         },null,"_btnNextPage.x");
         result[12] = new Binding(this,function():Number
         {
            return (_bg.height - _btnNextPage.height) / 2;
         },null,"_btnNextPage.y");
         result[13] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Customize the size of your character");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CharScaleChooser_Text10.text");
         result[14] = new Binding(this,function():Number
         {
            return (this.height - _btnPrevPage.height) / 2;
         },null,"_btnPrevPage.y");
         result[15] = new Binding(this,function():Number
         {
            return (this.width - _customize.width) / 2;
         },null,"_customize.x");
         result[16] = new Binding(this,function():Number
         {
            return this.height - _customize.height - 28;
         },null,"_customize.y");
         result[17] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Current");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_txtCurrent5.text");
         result[18] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Done");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CharScaleChooser_Button5.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get _bg() : Canvas
      {
         return this._94436_bg;
      }
      
      public function set _bg(param1:Canvas) : void
      {
         var _loc2_:Object = this._94436_bg;
         if(_loc2_ !== param1)
         {
            this._94436_bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_bg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnNextPage() : Button
      {
         return this._1712925473_btnNextPage;
      }
      
      public function set _btnNextPage(param1:Button) : void
      {
         var _loc2_:Object = this._1712925473_btnNextPage;
         if(_loc2_ !== param1)
         {
            this._1712925473_btnNextPage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnNextPage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _btnPrevPage() : Button
      {
         return this._116765665_btnPrevPage;
      }
      
      public function set _btnPrevPage(param1:Button) : void
      {
         var _loc2_:Object = this._116765665_btnPrevPage;
         if(_loc2_ !== param1)
         {
            this._116765665_btnPrevPage = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_btnPrevPage",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _charPreview1() : CharPreviewer
      {
         return this._1198932158_charPreview1;
      }
      
      public function set _charPreview1(param1:CharPreviewer) : void
      {
         var _loc2_:Object = this._1198932158_charPreview1;
         if(_loc2_ !== param1)
         {
            this._1198932158_charPreview1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_charPreview1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _charPreview2() : CharPreviewer
      {
         return this._1198932159_charPreview2;
      }
      
      public function set _charPreview2(param1:CharPreviewer) : void
      {
         var _loc2_:Object = this._1198932159_charPreview2;
         if(_loc2_ !== param1)
         {
            this._1198932159_charPreview2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_charPreview2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _charPreview3() : CharPreviewer
      {
         return this._1198932160_charPreview3;
      }
      
      public function set _charPreview3(param1:CharPreviewer) : void
      {
         var _loc2_:Object = this._1198932160_charPreview3;
         if(_loc2_ !== param1)
         {
            this._1198932160_charPreview3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_charPreview3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _charPreview4() : CharPreviewer
      {
         return this._1198932161_charPreview4;
      }
      
      public function set _charPreview4(param1:CharPreviewer) : void
      {
         var _loc2_:Object = this._1198932161_charPreview4;
         if(_loc2_ !== param1)
         {
            this._1198932161_charPreview4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_charPreview4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _charPreview5() : CharPreviewer
      {
         return this._1198932162_charPreview5;
      }
      
      public function set _charPreview5(param1:CharPreviewer) : void
      {
         var _loc2_:Object = this._1198932162_charPreview5;
         if(_loc2_ !== param1)
         {
            this._1198932162_charPreview5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_charPreview5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _content() : HBox
      {
         return this._985212102_content;
      }
      
      public function set _content(param1:HBox) : void
      {
         var _loc2_:Object = this._985212102_content;
         if(_loc2_ !== param1)
         {
            this._985212102_content = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_content",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _customize() : HBox
      {
         return this._122652356_customize;
      }
      
      public function set _customize(param1:HBox) : void
      {
         var _loc2_:Object = this._122652356_customize;
         if(_loc2_ !== param1)
         {
            this._122652356_customize = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_customize",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _headPosControl() : FourDirectionControl
      {
         return this._781452424_headPosControl;
      }
      
      public function set _headPosControl(param1:FourDirectionControl) : void
      {
         var _loc2_:Object = this._781452424_headPosControl;
         if(_loc2_ !== param1)
         {
            this._781452424_headPosControl = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_headPosControl",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _templates() : HBox
      {
         return this._492813754_templates;
      }
      
      public function set _templates(param1:HBox) : void
      {
         var _loc2_:Object = this._492813754_templates;
         if(_loc2_ !== param1)
         {
            this._492813754_templates = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_templates",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtCurrent1() : Text
      {
         return this._706938537_txtCurrent1;
      }
      
      public function set _txtCurrent1(param1:Text) : void
      {
         var _loc2_:Object = this._706938537_txtCurrent1;
         if(_loc2_ !== param1)
         {
            this._706938537_txtCurrent1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtCurrent1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtCurrent2() : Text
      {
         return this._706938538_txtCurrent2;
      }
      
      public function set _txtCurrent2(param1:Text) : void
      {
         var _loc2_:Object = this._706938538_txtCurrent2;
         if(_loc2_ !== param1)
         {
            this._706938538_txtCurrent2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtCurrent2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtCurrent3() : Text
      {
         return this._706938539_txtCurrent3;
      }
      
      public function set _txtCurrent3(param1:Text) : void
      {
         var _loc2_:Object = this._706938539_txtCurrent3;
         if(_loc2_ !== param1)
         {
            this._706938539_txtCurrent3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtCurrent3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtCurrent4() : Text
      {
         return this._706938540_txtCurrent4;
      }
      
      public function set _txtCurrent4(param1:Text) : void
      {
         var _loc2_:Object = this._706938540_txtCurrent4;
         if(_loc2_ !== param1)
         {
            this._706938540_txtCurrent4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtCurrent4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtCurrent5() : Text
      {
         return this._706938541_txtCurrent5;
      }
      
      public function set _txtCurrent5(param1:Text) : void
      {
         var _loc2_:Object = this._706938541_txtCurrent5;
         if(_loc2_ !== param1)
         {
            this._706938541_txtCurrent5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtCurrent5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtTopic() : Text
      {
         return this._1373679106_txtTopic;
      }
      
      public function set _txtTopic(param1:Text) : void
      {
         var _loc2_:Object = this._1373679106_txtTopic;
         if(_loc2_ !== param1)
         {
            this._1373679106_txtTopic = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtTopic",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtUpdate1() : Text
      {
         return this._645829225_txtUpdate1;
      }
      
      public function set _txtUpdate1(param1:Text) : void
      {
         var _loc2_:Object = this._645829225_txtUpdate1;
         if(_loc2_ !== param1)
         {
            this._645829225_txtUpdate1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtUpdate1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtUpdate2() : Text
      {
         return this._645829224_txtUpdate2;
      }
      
      public function set _txtUpdate2(param1:Text) : void
      {
         var _loc2_:Object = this._645829224_txtUpdate2;
         if(_loc2_ !== param1)
         {
            this._645829224_txtUpdate2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtUpdate2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtUpdate3() : Text
      {
         return this._645829223_txtUpdate3;
      }
      
      public function set _txtUpdate3(param1:Text) : void
      {
         var _loc2_:Object = this._645829223_txtUpdate3;
         if(_loc2_ !== param1)
         {
            this._645829223_txtUpdate3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtUpdate3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get _txtUpdate4() : Text
      {
         return this._645829222_txtUpdate4;
      }
      
      public function set _txtUpdate4(param1:Text) : void
      {
         var _loc2_:Object = this._645829222_txtUpdate4;
         if(_loc2_ !== param1)
         {
            this._645829222_txtUpdate4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"_txtUpdate4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get bodyScaleSlider() : HSlider
      {
         return this._1432568777bodyScaleSlider;
      }
      
      public function set bodyScaleSlider(param1:HSlider) : void
      {
         var _loc2_:Object = this._1432568777bodyScaleSlider;
         if(_loc2_ !== param1)
         {
            this._1432568777bodyScaleSlider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bodyScaleSlider",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnClose() : Button
      {
         return this._2082343164btnClose;
      }
      
      public function set btnClose(param1:Button) : void
      {
         var _loc2_:Object = this._2082343164btnClose;
         if(_loc2_ !== param1)
         {
            this._2082343164btnClose = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnClose",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnScale1() : Canvas
      {
         return this._577459619btnScale1;
      }
      
      public function set btnScale1(param1:Canvas) : void
      {
         var _loc2_:Object = this._577459619btnScale1;
         if(_loc2_ !== param1)
         {
            this._577459619btnScale1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnScale1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnScale2() : Canvas
      {
         return this._577459620btnScale2;
      }
      
      public function set btnScale2(param1:Canvas) : void
      {
         var _loc2_:Object = this._577459620btnScale2;
         if(_loc2_ !== param1)
         {
            this._577459620btnScale2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnScale2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnScale3() : Canvas
      {
         return this._577459621btnScale3;
      }
      
      public function set btnScale3(param1:Canvas) : void
      {
         var _loc2_:Object = this._577459621btnScale3;
         if(_loc2_ !== param1)
         {
            this._577459621btnScale3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnScale3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnScale4() : Canvas
      {
         return this._577459622btnScale4;
      }
      
      public function set btnScale4(param1:Canvas) : void
      {
         var _loc2_:Object = this._577459622btnScale4;
         if(_loc2_ !== param1)
         {
            this._577459622btnScale4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnScale4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnScale5() : Canvas
      {
         return this._577459623btnScale5;
      }
      
      public function set btnScale5(param1:Canvas) : void
      {
         var _loc2_:Object = this._577459623btnScale5;
         if(_loc2_ !== param1)
         {
            this._577459623btnScale5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnScale5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get headScaleSlider() : HSlider
      {
         return this._818035915headScaleSlider;
      }
      
      public function set headScaleSlider(param1:HSlider) : void
      {
         var _loc2_:Object = this._818035915headScaleSlider;
         if(_loc2_ !== param1)
         {
            this._818035915headScaleSlider = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"headScaleSlider",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get styleCurrent1() : Canvas
      {
         return this._1248513367styleCurrent1;
      }
      
      public function set styleCurrent1(param1:Canvas) : void
      {
         var _loc2_:Object = this._1248513367styleCurrent1;
         if(_loc2_ !== param1)
         {
            this._1248513367styleCurrent1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"styleCurrent1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get styleCurrent2() : Canvas
      {
         return this._1248513366styleCurrent2;
      }
      
      public function set styleCurrent2(param1:Canvas) : void
      {
         var _loc2_:Object = this._1248513366styleCurrent2;
         if(_loc2_ !== param1)
         {
            this._1248513366styleCurrent2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"styleCurrent2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get styleCurrent3() : Canvas
      {
         return this._1248513365styleCurrent3;
      }
      
      public function set styleCurrent3(param1:Canvas) : void
      {
         var _loc2_:Object = this._1248513365styleCurrent3;
         if(_loc2_ !== param1)
         {
            this._1248513365styleCurrent3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"styleCurrent3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get styleCurrent4() : Canvas
      {
         return this._1248513364styleCurrent4;
      }
      
      public function set styleCurrent4(param1:Canvas) : void
      {
         var _loc2_:Object = this._1248513364styleCurrent4;
         if(_loc2_ !== param1)
         {
            this._1248513364styleCurrent4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"styleCurrent4",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get styleCurrent5() : Canvas
      {
         return this._1248513363styleCurrent5;
      }
      
      public function set styleCurrent5(param1:Canvas) : void
      {
         var _loc2_:Object = this._1248513363styleCurrent5;
         if(_loc2_ !== param1)
         {
            this._1248513363styleCurrent5 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"styleCurrent5",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get styleOver1() : Canvas
      {
         return this._125384364styleOver1;
      }
      
      public function set styleOver1(param1:Canvas) : void
      {
         var _loc2_:Object = this._125384364styleOver1;
         if(_loc2_ !== param1)
         {
            this._125384364styleOver1 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"styleOver1",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get styleOver2() : Canvas
      {
         return this._125384365styleOver2;
      }
      
      public function set styleOver2(param1:Canvas) : void
      {
         var _loc2_:Object = this._125384365styleOver2;
         if(_loc2_ !== param1)
         {
            this._125384365styleOver2 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"styleOver2",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get styleOver3() : Canvas
      {
         return this._125384366styleOver3;
      }
      
      public function set styleOver3(param1:Canvas) : void
      {
         var _loc2_:Object = this._125384366styleOver3;
         if(_loc2_ !== param1)
         {
            this._125384366styleOver3 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"styleOver3",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get styleOver4() : Canvas
      {
         return this._125384367styleOver4;
      }
      
      public function set styleOver4(param1:Canvas) : void
      {
         var _loc2_:Object = this._125384367styleOver4;
         if(_loc2_ !== param1)
         {
            this._125384367styleOver4 = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"styleOver4",_loc2_,param1));
            }
         }
      }
   }
}
