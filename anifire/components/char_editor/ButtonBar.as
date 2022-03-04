package anifire.components.char_editor
{
   import anifire.constant.CcLibConstant;
   import anifire.event.CcButtonBarEvent;
   import anifire.util.UtilDict;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Box;
   import mx.controls.Button;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.PropertyChangeEvent;
   
   use namespace mx_internal;
   
   public class ButtonBar extends Box implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _547363391btnRandom:Button;
      
      private var _206159482btnRedo:Button;
      
      private var _2095990867btnReset:Button;
      
      private var _206185977btnSave:Button;
      
      private var _721384843btnScaling:Button;
      
      private var _206257504btnUndo:Button;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function ButtonBar()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Box,
            "stylesFactory":function():void
            {
               this.backgroundColor = 2310708;
               this.backgroundAlpha = 0;
               this.horizontalGap = 5;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Button,
                  "id":"btnUndo",
                  "events":{"click":"__btnUndo_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"btnBarUndo",
                        "buttonMode":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"btnRedo",
                  "events":{"click":"__btnRedo_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"btnBarRedo",
                        "buttonMode":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"btnReset",
                  "events":{"click":"__btnReset_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"btnBarReset",
                        "buttonMode":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"btnRandom",
                  "events":{"click":"__btnRandom_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"btnBarRandom",
                        "buttonMode":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"btnScaling",
                  "events":{"click":"__btnScaling_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"btnBarScale",
                        "buttonMode":true
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Button,
                  "id":"btnSave",
                  "events":{"click":"__btnSave_click"},
                  "propertiesFactory":function():Object
                  {
                     return {
                        "styleName":"btnBarSave",
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
         var bindings:Array = this._ButtonBar_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_char_editor_ButtonBarWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return ButtonBar[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.direction = "horizontal";
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         ButtonBar._watcherSetupUtil = param1;
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
            this.backgroundColor = 2310708;
            this.backgroundAlpha = 0;
            this.horizontalGap = 5;
         };
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function __btnUndo_click(param1:MouseEvent) : void
      {
         this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.UNDO_BUTTON_CLICK,this));
      }
      
      public function __btnRedo_click(param1:MouseEvent) : void
      {
         this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.REDO_BUTTON_CLICK,this));
      }
      
      public function __btnReset_click(param1:MouseEvent) : void
      {
         this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.RESET_BUTTON_CLICK,this));
      }
      
      public function __btnRandom_click(param1:MouseEvent) : void
      {
         this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.RANDOMIZE_BUTTON_CLICK,this));
      }
      
      public function __btnScaling_click(param1:MouseEvent) : void
      {
         this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.SCALE_BUTTON_CLICK,this));
      }
      
      public function __btnSave_click(param1:MouseEvent) : void
      {
         this.dispatchEvent(new CcButtonBarEvent(CcButtonBarEvent.SAVE_BUTTON_CLICK,this));
      }
      
      private function _ButtonBar_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Undo");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnUndo.toolTip");
         result[1] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Redo");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnRedo.toolTip");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Reset");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnReset.toolTip");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Random");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnRandom.toolTip");
         result[4] = new Binding(this,function():Boolean
         {
            return CcLibConstant.CHANGE_CHAR_SCALE;
         },null,"btnScaling.includeInLayout");
         result[5] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Scale");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnScaling.toolTip");
         result[6] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Save");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnSave.toolTip");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRandom() : Button
      {
         return this._547363391btnRandom;
      }
      
      public function set btnRandom(param1:Button) : void
      {
         var _loc2_:Object = this._547363391btnRandom;
         if(_loc2_ !== param1)
         {
            this._547363391btnRandom = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRandom",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnRedo() : Button
      {
         return this._206159482btnRedo;
      }
      
      public function set btnRedo(param1:Button) : void
      {
         var _loc2_:Object = this._206159482btnRedo;
         if(_loc2_ !== param1)
         {
            this._206159482btnRedo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnRedo",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnReset() : Button
      {
         return this._2095990867btnReset;
      }
      
      public function set btnReset(param1:Button) : void
      {
         var _loc2_:Object = this._2095990867btnReset;
         if(_loc2_ !== param1)
         {
            this._2095990867btnReset = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnReset",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnSave() : Button
      {
         return this._206185977btnSave;
      }
      
      public function set btnSave(param1:Button) : void
      {
         var _loc2_:Object = this._206185977btnSave;
         if(_loc2_ !== param1)
         {
            this._206185977btnSave = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnSave",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnScaling() : Button
      {
         return this._721384843btnScaling;
      }
      
      public function set btnScaling(param1:Button) : void
      {
         var _loc2_:Object = this._721384843btnScaling;
         if(_loc2_ !== param1)
         {
            this._721384843btnScaling = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnScaling",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnUndo() : Button
      {
         return this._206257504btnUndo;
      }
      
      public function set btnUndo(param1:Button) : void
      {
         var _loc2_:Object = this._206257504btnUndo;
         if(_loc2_ !== param1)
         {
            this._206257504btnUndo = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnUndo",_loc2_,param1));
            }
         }
      }
   }
}
