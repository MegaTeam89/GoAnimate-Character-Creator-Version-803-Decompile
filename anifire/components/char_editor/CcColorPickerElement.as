package anifire.components.char_editor
{
   import anifire.cc_theme_lib.CcCharacter;
   import anifire.cc_theme_lib.CcColor;
   import anifire.cc_theme_lib.CcColorThumb;
   import anifire.cc_theme_lib.CcComponent;
   import anifire.cc_theme_lib.CcComponentThumb;
   import anifire.cc_theme_lib.CcTheme;
   import anifire.component.TextButton;
   import anifire.constant.CcLibConstant;
   import anifire.event.CcColorPickerEvent;
   import anifire.util.ExtraDataTimer;
   import anifire.util.UtilDict;
   import anifire.util.UtilDraw;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import mx.containers.Canvas;
   import mx.containers.Tile;
   import mx.containers.VBox;
   import mx.controls.ColorPicker;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.events.ColorPickerEvent;
   import mx.events.PropertyChangeEvent;
   
   public class CcColorPickerElement extends VBox
   {
       
      
      private var _909525442cpCustom:ColorPicker;
      
      private var _104085ico:Canvas;
      
      private var _876844715tileColor:Tile;
      
      private var _110371416title:Canvas;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var component:CcComponent;
      
      private var colorThumb:CcColorThumb;
      
      private var char:CcCharacter;
      
      public function CcColorPickerElement()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":VBox,
            "stylesFactory":function():void
            {
               this.verticalGap = 2;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"title",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "height":28,
                        "percentWidth":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Canvas,
                           "id":"ico",
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "width":34,
                                 "height":28
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Tile,
                  "id":"tileColor",
                  "stylesFactory":function():void
                  {
                     this.horizontalGap = 5;
                     this.verticalGap = 5;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "height":70,
                        "direction":"vertical"
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":ColorPicker,
                  "id":"cpCustom",
                  "stylesFactory":function():void
                  {
                     this.focusThickness = 0;
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "height":0,
                        "width":0,
                        "visible":false,
                        "focusEnabled":false
                     };
                  }
               })]};
            }
         });
         super();
         mx_internal::_document = this;
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
            this.verticalGap = 2;
         };
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function init(param1:CcComponent, param2:CcComponentThumb, param3:CcTheme, param4:CcCharacter) : void
      {
         var _loc6_:CcColorThumb = null;
         var _loc5_:int = 0;
         while(_loc5_ < param3.getColorThumbNum())
         {
            if((_loc6_ = param3.getColorThumbByIndex(_loc5_)).componentType == param2.type)
            {
               this.colorThumb = _loc6_;
            }
            _loc5_++;
         }
         this.initByColorThumb(param1,this.colorThumb,param3,param4);
      }
      
      public function initByColorThumb(param1:CcComponent, param2:CcColorThumb, param3:CcTheme, param4:CcCharacter) : void
      {
         var _loc8_:Canvas = null;
         var _loc9_:TextButton = null;
         this.component = param1;
         this.colorThumb = param2;
         this.ico.styleName = "sico" + this.colorThumb.colorReference;
         this.char = param4;
         var _loc5_:Array = new Array();
         _loc5_ = this.colorThumb.colorChoices;
         this.destroy();
         var _loc6_:int = 0;
         while(_loc6_ < _loc5_.length)
         {
            this.insertColor(_loc5_[_loc6_]);
            _loc6_++;
         }
         var _loc7_:TextButton;
         (_loc7_ = new TextButton()).styleName = "btnMore";
         _loc7_.label = UtilDict.toDisplay("cc","More") + ">";
         _loc7_.txtSize = 12;
         _loc7_.txtAlign = "left";
         _loc7_.clickFunc = this.showColorPicker;
         this.addChildAt(_loc7_,this.getChildIndex(this.cpCustom));
         if(this.colorThumb.parentComponentColorRef() != null)
         {
            (_loc8_ = new Canvas()).width = 34;
            _loc8_.height = 28;
            _loc8_.styleName = "sico" + this.colorThumb.parentComponentColorRef();
            _loc8_.scaleX = _loc8_.scaleY = 0.6;
            _loc8_.x = 114;
            _loc8_.y = 8;
            this.title.addChild(_loc8_);
            (_loc9_ = new TextButton()).styleName = "btnCopyColor";
            _loc9_.height = 28;
            _loc9_.width = 66;
            _loc9_.y = 10;
            _loc9_.x = 124 - _loc9_.width;
            _loc9_.label = UtilDict.toDisplay("cc","Copy from:");
            _loc9_.clickFunc = this.followColor;
            _loc9_.txtSize = 10;
            this.title.addChild(_loc9_);
         }
      }
      
      private function insertColorTimer(param1:TimerEvent) : void
      {
         var _loc2_:ExtraDataTimer = param1.currentTarget as ExtraDataTimer;
         var _loc3_:Object = _loc2_.getData();
         var _loc4_:Array = _loc3_["colorThumbs"] as Array;
         this.insertColor(_loc4_[_loc2_.currentCount]);
      }
      
      private function onTimerDone(param1:TimerEvent) : void
      {
         var _loc2_:ExtraDataTimer = param1.currentTarget as ExtraDataTimer;
         _loc2_.stop();
         (param1.currentTarget as IEventDispatcher).removeEventListener(param1.type,this.onTimerDone);
      }
      
      private function showColorPicker(param1:Event) : void
      {
         this.cpCustom.addEventListener(ColorPickerEvent.CHANGE,this.onPickColor);
         this.cpCustom.open();
      }
      
      private function onPickColor(param1:ColorPickerEvent) : void
      {
         this.tellEveryBodyColorChosen(param1.color);
      }
      
      private function onPickDefaultColor(param1:MouseEvent) : void
      {
         this.tellEveryBodyColorChosen(uint(Canvas(param1.currentTarget).data));
      }
      
      private function insertColor(param1:uint) : void
      {
         var _loc2_:Canvas = new Canvas();
         _loc2_.width = _loc2_.height = 30;
         _loc2_.data = param1;
         _loc2_.graphics.clear();
         _loc2_.graphics.lineStyle(2,16777215);
         _loc2_.graphics.beginFill(uint(_loc2_.data));
         _loc2_.graphics.drawRect(0,0,_loc2_.width,_loc2_.height);
         _loc2_.graphics.endFill();
         _loc2_.buttonMode = true;
         _loc2_.name = "button" + param1.toString();
         _loc2_.addEventListener(MouseEvent.MOUSE_OVER,this.doColorOver);
         _loc2_.addEventListener(MouseEvent.MOUSE_OUT,this.doColorOut);
         _loc2_.addEventListener(MouseEvent.CLICK,this.onPickDefaultColor);
         this.tileColor.addChild(_loc2_);
      }
      
      private function doColorOver(param1:Event) : void
      {
         var _loc2_:Canvas = param1.currentTarget as Canvas;
         _loc2_.graphics.clear();
         _loc2_.graphics.lineStyle(0,16777215,0);
         _loc2_.graphics.beginFill(uint(_loc2_.data));
         _loc2_.graphics.drawRect(0,0,_loc2_.width,_loc2_.height);
         _loc2_.graphics.endFill();
         _loc2_.graphics.lineStyle(2,16488452);
         UtilDraw.drawDashRect(_loc2_,0,0,_loc2_.width,_loc2_.height);
      }
      
      private function doColorOut(param1:Event) : void
      {
         var _loc2_:Canvas = param1.currentTarget as Canvas;
         _loc2_.graphics.clear();
         _loc2_.graphics.lineStyle(2,16777215);
         _loc2_.graphics.beginFill(uint(_loc2_.data));
         _loc2_.graphics.drawRect(0,0,_loc2_.width,_loc2_.height);
         _loc2_.graphics.endFill();
      }
      
      private function tellEveryBodyColorChosen(param1:uint) : void
      {
         var _loc2_:CcColor = new CcColor();
         _loc2_.ccColorThumb = this.colorThumb;
         if(CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(_loc2_.ccColorThumb.componentType) > -1)
         {
            _loc2_.ccComponent = this.component;
         }
         _loc2_.colorValue = param1;
         var _loc3_:CcColorPickerEvent = new CcColorPickerEvent(CcColorPickerEvent.COLOR_CHOSEN,this);
         _loc3_.colorChosen = _loc2_;
         this.dispatchEvent(_loc3_);
      }
      
      private function destroy() : void
      {
         var _loc1_:int = 0;
         var _loc2_:Canvas = null;
         while(_loc1_ < this.tileColor.numChildren)
         {
            _loc2_ = this.tileColor.getChildAt(_loc1_) as Canvas;
            _loc2_.removeEventListener(MouseEvent.MOUSE_OVER,this.doColorOver);
            _loc2_.removeEventListener(MouseEvent.MOUSE_OUT,this.doColorOut);
            _loc2_.removeEventListener(MouseEvent.CLICK,this.onPickDefaultColor);
            _loc1_++;
         }
         this.tileColor.removeAllChildren();
      }
      
      private function followColor(param1:Event) : void
      {
         var _loc2_:CcColor = null;
         if(this.colorThumb.parentComponentColorRef() != null)
         {
            _loc2_ = this.char.getUserChosenColorByColorReference(this.colorThumb.parentComponentColorRef());
            this.tellEveryBodyColorChosen(_loc2_.colorValue);
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cpCustom() : ColorPicker
      {
         return this._909525442cpCustom;
      }
      
      public function set cpCustom(param1:ColorPicker) : void
      {
         var _loc2_:Object = this._909525442cpCustom;
         if(_loc2_ !== param1)
         {
            this._909525442cpCustom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cpCustom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get ico() : Canvas
      {
         return this._104085ico;
      }
      
      public function set ico(param1:Canvas) : void
      {
         var _loc2_:Object = this._104085ico;
         if(_loc2_ !== param1)
         {
            this._104085ico = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"ico",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get tileColor() : Tile
      {
         return this._876844715tileColor;
      }
      
      public function set tileColor(param1:Tile) : void
      {
         var _loc2_:Object = this._876844715tileColor;
         if(_loc2_ !== param1)
         {
            this._876844715tileColor = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"tileColor",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get title() : Canvas
      {
         return this._110371416title;
      }
      
      public function set title(param1:Canvas) : void
      {
         var _loc2_:Object = this._110371416title;
         if(_loc2_ !== param1)
         {
            this._110371416title = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"title",_loc2_,param1));
            }
         }
      }
   }
}
