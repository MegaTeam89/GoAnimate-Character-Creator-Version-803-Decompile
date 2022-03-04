package anifire.components.char_editor
{
   import anifire.cc_theme_lib.CcBodyShape;
   import anifire.cc_theme_lib.CcTheme;
   import anifire.constant.CcLibConstant;
   import anifire.event.CcBodyShapeChooserEvent;
   import anifire.util.Util;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import mx.containers.HBox;
   import mx.containers.VBox;
   import mx.controls.Button;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.events.PropertyChangeEvent;
   
   public class BodyShapeChooser extends VBox
   {
       
      
      private var _207474244bodyShapeBtnContainer:HBox;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _ccTheme:CcTheme;
      
      private var _defaultShape:String;
      
      public function BodyShapeChooser()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":VBox,
            "stylesFactory":function():void
            {
               this.verticalAlign = "middle";
               this.horizontalAlign = "center";
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "id":"bodyShapeBtnContainer",
                  "stylesFactory":function():void
                  {
                     this.verticalAlign = "middle";
                     this.horizontalAlign = "center";
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
            this.verticalAlign = "middle";
            this.horizontalAlign = "center";
         };
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function get ccTheme() : CcTheme
      {
         return this._ccTheme;
      }
      
      public function init(param1:CcTheme, param2:int) : void
      {
         var _loc3_:Button = null;
         var _loc4_:Button = null;
         var _loc5_:Button = null;
         var _loc6_:Button = null;
         var _loc7_:int = 0;
         var _loc8_:CcBodyShape = null;
         var _loc9_:Button = null;
         this._ccTheme = param1;
         if(CcLibConstant.CHOOSE_TAG_TYPE_SEX)
         {
            this._defaultShape = param1.getBodyShapeByIndex(0).id;
            _loc3_ = new Button();
            _loc3_.styleName = "btnBodyShape" + "tom";
            _loc3_.buttonMode = true;
            _loc3_.id = "_sticky_filter_guy";
            _loc3_.addEventListener(MouseEvent.CLICK,this.onDefaultButtonClick);
            this.bodyShapeBtnContainer.addChild(_loc3_);
            (_loc4_ = new Button()).styleName = "btnBodyShape" + "emma";
            _loc4_.buttonMode = true;
            _loc4_.id = "_sticky_filter_girl";
            _loc4_.addEventListener(MouseEvent.CLICK,this.onDefaultButtonClick);
            this.bodyShapeBtnContainer.addChild(_loc4_);
            if(param1.getBodyShapeByShapeId("kid"))
            {
               (_loc5_ = new Button()).styleName = "btnBodyShape" + "tom";
               _loc5_.buttonMode = true;
               _loc5_.id = "_sticky_filter_littleboy";
               _loc5_.addEventListener(MouseEvent.CLICK,this.onKidButtonClick);
               this.bodyShapeBtnContainer.addChild(_loc5_);
               (_loc6_ = new Button()).styleName = "btnBodyShape" + "emma";
               _loc6_.buttonMode = true;
               _loc6_.id = "_sticky_filter_littlegirl";
               _loc6_.addEventListener(MouseEvent.CLICK,this.onKidButtonClick);
               this.bodyShapeBtnContainer.addChild(_loc6_);
            }
         }
         else
         {
            if(param1.getBodyShapeNum() == 1)
            {
               callLater(this.tellEveryoneBodyShape_choosen,[param1.getBodyShapeByIndex(0).id]);
               return;
            }
            _loc7_ = 0;
            _loc7_ = 0;
            while(_loc7_ < param1.getBodyShapeNum())
            {
               _loc8_ = param1.getBodyShapeByIndex(_loc7_);
               (_loc9_ = new Button()).styleName = "btnBodyShape" + _loc8_.id;
               _loc9_.buttonMode = true;
               _loc9_.id = _loc8_.id;
               _loc9_.addEventListener(MouseEvent.CLICK,this.onButtonClick);
               this.bodyShapeBtnContainer.addChild(_loc9_);
               _loc7_++;
            }
         }
      }
      
      private function onDefaultButtonClick(param1:Event) : void
      {
         var _loc2_:Button = param1.target as Button;
         var _loc3_:String = _loc2_.id;
         Util.setFlashVar("ft",_loc3_);
         this.tellEveryoneBodyShape_choosen("default");
      }
      
      private function onKidButtonClick(param1:Event) : void
      {
         var _loc2_:Button = param1.target as Button;
         var _loc3_:String = _loc2_.id;
         Util.setFlashVar("ft",_loc3_);
         this.tellEveryoneBodyShape_choosen("kid");
      }
      
      private function onButtonClick(param1:Event) : void
      {
         var _loc2_:Button = param1.target as Button;
         var _loc3_:String = _loc2_.id;
         this.tellEveryoneBodyShape_choosen(_loc3_);
      }
      
      private function tellEveryoneBodyShape_choosen(param1:String) : void
      {
         var _loc2_:CcBodyShape = this.ccTheme.getBodyShapeByShapeId(param1);
         var _loc3_:CcBodyShapeChooserEvent = new CcBodyShapeChooserEvent(CcBodyShapeChooserEvent.BODY_SHAPE_CHOSEN,this);
         _loc3_.bodyShapeChosen = _loc2_;
         this.dispatchEvent(_loc3_);
      }
      
      [Bindable(event="propertyChange")]
      public function get bodyShapeBtnContainer() : HBox
      {
         return this._207474244bodyShapeBtnContainer;
      }
      
      public function set bodyShapeBtnContainer(param1:HBox) : void
      {
         var _loc2_:Object = this._207474244bodyShapeBtnContainer;
         if(_loc2_ !== param1)
         {
            this._207474244bodyShapeBtnContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bodyShapeBtnContainer",_loc2_,param1));
            }
         }
      }
   }
}
