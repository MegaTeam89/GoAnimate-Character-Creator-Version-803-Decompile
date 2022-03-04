package anifire.components.char_editor
{
   import anifire.cc_theme_lib.CcCharacter;
   import anifire.cc_theme_lib.CcColor;
   import anifire.cc_theme_lib.CcColorThumb;
   import anifire.cc_theme_lib.CcComponent;
   import anifire.cc_theme_lib.CcComponentThumb;
   import anifire.cc_theme_lib.CcLibrary;
   import anifire.cc_theme_lib.CcTheme;
   import anifire.event.CcColorPickerEvent;
   import mx.containers.Tile;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   
   public class CcColorPicker extends Tile
   {
       
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var colorThumb:CcColorThumb;
      
      private var _biggerElementWidth:Number;
      
      private var _smallerElementWidth:Number;
      
      private const DELAY_BETWEEN_LOADING_EACH_THUMB:Number = 200;
      
      public function CcColorPicker()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Tile,
            "stylesFactory":function():void
            {
               this.backgroundColor = 7878228;
               this.backgroundAlpha = 0;
               this.horizontalGap = 4;
            }
         });
         super();
         mx_internal::_document = this;
         this.horizontalScrollPolicy = "off";
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
            this.backgroundColor = 7878228;
            this.backgroundAlpha = 0;
            this.horizontalGap = 4;
         };
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function set biggerElementWidth(param1:Number) : void
      {
         this._biggerElementWidth = param1;
      }
      
      public function set smallerElementWidth(param1:Number) : void
      {
         this._smallerElementWidth = param1;
      }
      
      public function addLibraryType(param1:CcLibrary, param2:CcTheme, param3:CcCharacter) : void
      {
         var _loc5_:CcColorThumb = null;
         var _loc7_:int = 0;
         var _loc4_:Array = new Array();
         var _loc6_:int = 0;
         while(_loc6_ < param2.getColorThumbNum())
         {
            if((_loc5_ = param2.getColorThumbByIndex(_loc6_)).componentType == param1.type)
            {
               _loc4_.push(_loc5_);
            }
            _loc6_++;
         }
         if(_loc4_.length > 0)
         {
            _loc7_ = 0;
            while(_loc7_ < _loc4_.length)
            {
               _loc5_ = _loc4_[_loc7_] as CcColorThumb;
               this.addColorPicker(_loc5_,null,param2,param3);
               _loc7_++;
            }
         }
      }
      
      public function addComponentType(param1:CcComponent, param2:String, param3:CcTheme, param4:CcCharacter) : void
      {
         var _loc6_:CcColorThumb = null;
         var _loc8_:CcColorPickerElement = null;
         var _loc9_:int = 0;
         var _loc5_:Array = new Array();
         var _loc7_:int = 0;
         while(_loc7_ < param3.getColorThumbNum())
         {
            if((_loc6_ = param3.getColorThumbByIndex(_loc7_)).componentType == param2)
            {
               _loc5_.push(_loc6_);
            }
            _loc7_++;
         }
         if(_loc5_.length > 0)
         {
            _loc9_ = 0;
            while(_loc9_ < _loc5_.length)
            {
               _loc6_ = _loc5_[_loc9_] as CcColorThumb;
               this.addColorPicker(_loc6_,param1,param3,param4);
               _loc9_++;
            }
         }
      }
      
      public function addComponentThumb(param1:CcComponent, param2:CcComponentThumb, param3:CcTheme, param4:CcCharacter) : void
      {
         var _loc5_:CcColorPickerElement = null;
         var _loc6_:int = 0;
         var _loc7_:CcColorThumb = null;
         if(param2.getMyOwnColorNum() > 0)
         {
            _loc6_ = 0;
            while(_loc6_ < param2.getMyOwnColorNum())
            {
               _loc7_ = param2.getMyOwnColorByIndex(_loc6_);
               this.addColorPicker(_loc7_,param1,param3,param4);
               _loc6_++;
            }
         }
      }
      
      private function addColorPicker(param1:CcColorThumb, param2:CcComponent, param3:CcTheme, param4:CcCharacter) : void
      {
         var _loc5_:CcColorPickerElement = null;
         if(!param1.enable)
         {
            return;
         }
         _loc5_ = new CcColorPickerElement();
         if(param1.colorChoices.length > 4)
         {
            _loc5_.width = this._biggerElementWidth;
         }
         else
         {
            _loc5_.width = this._smallerElementWidth;
         }
         _loc5_.percentHeight = 100;
         _loc5_.addEventListener(CcColorPickerEvent.COLOR_CHOSEN,this.onUserChooseColor);
         _loc5_.callLater(_loc5_.initByColorThumb,[param2,param1,param3,param4]);
         this.addChild(_loc5_);
      }
      
      private function onUserChooseColor(param1:CcColorPickerEvent) : void
      {
         this.tellEveryBodyColorChosen(param1.colorChosen);
      }
      
      private function tellEveryBodyColorChosen(param1:CcColor) : void
      {
         var _loc2_:CcColor = param1;
         var _loc3_:CcColorPickerEvent = new CcColorPickerEvent(CcColorPickerEvent.COLOR_CHOSEN,this);
         _loc3_.colorChosen = _loc2_;
         this.dispatchEvent(_loc3_);
      }
      
      public function destroy() : void
      {
         var _loc1_:int = 0;
         var _loc2_:CcColorPickerElement = null;
         while(_loc1_ < this.numChildren)
         {
            _loc2_ = this.getChildAt(_loc1_) as CcColorPickerElement;
            _loc2_.removeEventListener(CcColorPickerEvent.COLOR_CHOSEN,this.onUserChooseColor);
            _loc1_++;
         }
         this.removeAllChildren();
      }
   }
}
