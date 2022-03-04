package anifire.components.previewAndSave
{
   import anifire.cc_theme_lib.CcAction;
   import anifire.cc_theme_lib.CcCharacter;
   import anifire.cc_theme_lib.CcComponent;
   import anifire.cc_theme_lib.CcFacial;
   import anifire.cc_theme_lib.CcRequireComponent;
   import anifire.cc_theme_lib.CcTheme;
   import anifire.event.CcActionChosenEvent;
   import anifire.event.CcCoreEvent;
   import anifire.util.UtilDict;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.collections.ArrayCollection;
   import mx.collections.ICollectionView;
   import mx.collections.IViewCursor;
   import mx.collections.Sort;
   import mx.collections.SortField;
   import mx.containers.HBox;
   import mx.controls.ComboBox;
   import mx.controls.Label;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   use namespace mx_internal;
   
   public class CharPreviewOptionBox extends HBox implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _CharPreviewOptionBox_Label1:Label;
      
      public var _CharPreviewOptionBox_Label2:Label;
      
      private var _523537547cbAction:ComboBox;
      
      private var _382745717cbFacial:ComboBox;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CharPreviewOptionBox()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":HBox,
            "events":{"creationComplete":"___CharPreviewOptionBox_HBox1_creationComplete"},
            "stylesFactory":function():void
            {
               this.paddingLeft = 10;
               this.paddingTop = 5;
               this.paddingRight = 10;
               this.paddingBottom = 5;
               this.verticalGap = 6;
               this.verticalAlign = "middle";
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Label,
                  "id":"_CharPreviewOptionBox_Label1",
                  "propertiesFactory":function():Object
                  {
                     return {"styleName":"lblCommon"};
                  }
               }),new UIComponentDescriptor({
                  "type":ComboBox,
                  "id":"cbAction",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "styleName":"comboBoxCharPreview",
                        "buttonMode":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Label,
                  "id":"_CharPreviewOptionBox_Label2",
                  "propertiesFactory":function():Object
                  {
                     return {"styleName":"lblCommon"};
                  }
               }),new UIComponentDescriptor({
                  "type":ComboBox,
                  "id":"cbFacial",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "styleName":"comboBoxCharPreview",
                        "buttonMode":true
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
         var bindings:Array = this._CharPreviewOptionBox_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_previewAndSave_CharPreviewOptionBoxWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CharPreviewOptionBox[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.verticalScrollPolicy = "off";
         this.addEventListener("creationComplete",this.___CharPreviewOptionBox_HBox1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CharPreviewOptionBox._watcherSetupUtil = param1;
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
            this.paddingLeft = 10;
            this.paddingTop = 5;
            this.paddingRight = 10;
            this.paddingBottom = 5;
            this.verticalGap = 6;
            this.verticalAlign = "middle";
         };
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function creationcomplete(param1:Event) : void
      {
      }
      
      public function init(param1:CcCharacter, param2:CcTheme) : void
      {
         var _loc11_:CcAction = null;
         var _loc12_:String = null;
         var _loc13_:CcFacial = null;
         var _loc3_:Number = param1.bodyShape.getActionNum();
         var _loc4_:ArrayCollection = new ArrayCollection();
         this.cbAction.dataProvider = _loc4_;
         _loc4_.disableAutoUpdate();
         var _loc5_:int = 0;
         while(_loc5_ < _loc3_)
         {
            if((_loc11_ = param1.bodyShape.getActionByIndex(_loc5_)).requireComponents.length <= 0 || this.checkIfRequiredComponentExist(param1,_loc11_.requireComponents))
            {
               if(_loc11_.enable)
               {
                  _loc12_ = _loc11_.name;
                  if(_loc11_.group)
                  {
                     _loc12_ = _loc11_.group;
                  }
                  else if(_loc11_.category)
                  {
                     _loc12_ = _loc11_.category + " - " + _loc12_;
                  }
                  _loc4_.addItem({
                     "label":UtilDict.toDisplay("store",_loc12_),
                     "data":_loc11_.id
                  });
               }
            }
            _loc5_++;
         }
         var _loc6_:Number = param2.getFacialNum();
         var _loc7_:ArrayCollection;
         (_loc7_ = new ArrayCollection()).disableAutoUpdate();
         this.cbFacial.dataProvider = _loc7_;
         var _loc8_:int = 0;
         while(_loc8_ < _loc6_)
         {
            if((_loc13_ = param2.getFacialByIndex(_loc8_)).requireComponents.length <= 0 || this.checkIfRequiredComponentExist(param1,_loc13_.requireComponents))
            {
               _loc7_.addItem({
                  "label":UtilDict.toDisplay("store",_loc13_.name),
                  "data":_loc13_.facialId
               });
            }
            _loc8_++;
         }
         var _loc9_:SortField;
         (_loc9_ = new SortField()).name = "label";
         _loc9_.caseInsensitive = true;
         var _loc10_:Sort;
         (_loc10_ = new Sort()).fields = [_loc9_];
         _loc4_.sort = _loc10_;
         _loc4_.refresh();
         _loc7_.sort = _loc10_;
         _loc7_.refresh();
         _loc4_.enableAutoUpdate();
         _loc7_.enableAutoUpdate();
         this.cbAction.addEventListener(Event.CHANGE,this.actionSelected);
         this.cbFacial.addEventListener(Event.CHANGE,this.facialSelected);
      }
      
      override protected function updateDisplayList(param1:Number, param2:Number) : void
      {
         var _loc3_:Number = 0;
         var _loc4_:Number = 0;
         var _loc5_:Number = 0;
         var _loc6_:Number = 0;
         clipContent = false;
         graphics.clear();
         graphics.beginFill(16777215,0.5);
         graphics.drawRoundRectComplex(0 + _loc3_,-5 + _loc4_,param1 + _loc5_,param2 + 15 + _loc6_,10,10,0,0);
         graphics.endFill();
         super.updateDisplayList(param1,param2);
      }
      
      private function checkIfRequiredComponentExist(param1:CcCharacter, param2:Array) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:Boolean = false;
         var _loc6_:CcRequireComponent = null;
         var _loc7_:Array = null;
         var _loc8_:CcComponent = null;
         var _loc9_:Boolean = false;
         _loc3_ = 0;
         while(true)
         {
            if(_loc3_ >= param2.length)
            {
               return true;
            }
            _loc6_ = param2[_loc3_] as CcRequireComponent;
            if((_loc7_ = param1.getUserChosenComponentByComponentType(_loc6_.componentType)) == null || _loc7_.length <= 0)
            {
               return false;
            }
            _loc9_ = false;
            _loc4_ = 0;
            while(_loc4_ < _loc7_.length)
            {
               _loc8_ = _loc7_[_loc4_] as CcComponent;
               if(_loc6_.componentIds.indexOf(_loc8_.componentThumb.componentId) >= 0)
               {
                  _loc9_ = true;
                  break;
               }
               _loc4_++;
            }
            if(!_loc9_)
            {
               break;
            }
            _loc3_++;
         }
         return false;
      }
      
      public function set action(param1:String) : void
      {
         var _loc2_:ICollectionView = this.cbAction.dataProvider as ICollectionView;
         var _loc3_:IViewCursor = _loc2_.createCursor();
         while(!_loc3_.afterLast)
         {
            if(_loc3_.current.data == param1)
            {
               this.cbAction.selectedItem = _loc3_.current;
               return;
            }
            _loc3_.moveNext();
         }
      }
      
      public function set facial(param1:String) : void
      {
         var _loc2_:ICollectionView = this.cbFacial.dataProvider as ICollectionView;
         var _loc3_:IViewCursor = _loc2_.createCursor();
         while(!_loc3_.afterLast)
         {
            if(_loc3_.current.data == param1)
            {
               this.cbFacial.selectedItem = _loc3_.current;
               return;
            }
            _loc3_.moveNext();
         }
      }
      
      public function set saveEnabled(param1:Boolean) : void
      {
      }
      
      private function actionSelected(param1:Event) : void
      {
         var _loc2_:CcActionChosenEvent = new CcActionChosenEvent(CcActionChosenEvent.ACTION_CHOSEN,this);
         _loc2_.action_id = this.cbAction.selectedItem.data;
         _loc2_.facial_id = this.cbFacial.selectedItem.data;
         this.dispatchEvent(_loc2_);
      }
      
      private function facialSelected(param1:Event) : void
      {
         var _loc2_:CcActionChosenEvent = new CcActionChosenEvent(CcActionChosenEvent.FACIAL_CHOSEN,this);
         _loc2_.action_id = this.cbAction.selectedItem.data;
         _loc2_.facial_id = this.cbFacial.selectedItem.data;
         this.dispatchEvent(_loc2_);
      }
      
      private function onSaveButtonClick() : void
      {
         var _loc1_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_SAVE,this);
         this.dispatchEvent(_loc1_);
      }
      
      private function onModifyButtonClick(param1:Event = null) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_CANCEL,this);
         this.dispatchEvent(_loc2_);
      }
      
      public function ___CharPreviewOptionBox_HBox1_creationComplete(param1:FlexEvent) : void
      {
         this.creationcomplete(param1);
      }
      
      private function _CharPreviewOptionBox_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","cc_keyword_action");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CharPreviewOptionBox_Label1.text");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","cc_keyword_facial");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_CharPreviewOptionBox_Label2.text");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get cbAction() : ComboBox
      {
         return this._523537547cbAction;
      }
      
      public function set cbAction(param1:ComboBox) : void
      {
         var _loc2_:Object = this._523537547cbAction;
         if(_loc2_ !== param1)
         {
            this._523537547cbAction = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cbAction",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get cbFacial() : ComboBox
      {
         return this._382745717cbFacial;
      }
      
      public function set cbFacial(param1:ComboBox) : void
      {
         var _loc2_:Object = this._382745717cbFacial;
         if(_loc2_ !== param1)
         {
            this._382745717cbFacial = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"cbFacial",_loc2_,param1));
            }
         }
      }
   }
}
