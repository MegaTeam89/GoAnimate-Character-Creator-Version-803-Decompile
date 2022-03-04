package anifire.components.previewAndSave
{
   import anifire.cc_interface.IPurchaseCompleteBox;
   import anifire.component.TextButton;
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.event.CcCoreEvent;
   import anifire.managers.FeatureManager;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilSite;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import mx.binding.Binding;
   import mx.binding.BindingManager;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.controls.Button;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.graphics.SolidColor;
   import mx.graphics.SolidColorStroke;
   import spark.components.Group;
   import spark.components.Label;
   import spark.components.VGroup;
   import spark.primitives.Rect;
   
   use namespace mx_internal;
   
   public class PurchaseCompleteBox extends Group implements IPurchaseCompleteBox, IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      public var _PurchaseCompleteBox_TextButton1:TextButton;
      
      private var _1178723494btnGoStudio:Button;
      
      private var _221236638btnLearnAction:Button;
      
      private var _1766135109messageDisplay:Label;
      
      private var _1893287094titleDisplay:Label;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var _66049912displayLearnAction:Boolean = false;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function PurchaseCompleteBox()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._bindings = [];
         this._watchers = [];
         this._bindingsByDestination = {};
         this._bindingsBeginWithWord = {};
         super();
         mx_internal::_document = this;
         var bindings:Array = this._PurchaseCompleteBox_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_previewAndSave_PurchaseCompleteBoxWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return PurchaseCompleteBox[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.mxmlContent = [this._PurchaseCompleteBox_Rect1_c(),this._PurchaseCompleteBox_VGroup1_c()];
         this.addEventListener("creationComplete",this.___PurchaseCompleteBox_Group1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         PurchaseCompleteBox._watcherSetupUtil = param1;
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
         super.initialize();
      }
      
      private function init() : void
      {
         var _loc2_:String = null;
         var _loc3_:* = null;
         if(FeatureManager.shouldActionPackBeShown)
         {
            if(this.themeId == "cc2" || this.themeId == ThemeConstants.CHIBI_THEME_ID || this.themeId == ThemeConstants.NINJA_THEME_ID)
            {
               this.displayLearnAction = true;
            }
         }
         if(UtilSite.siteId == UtilSite.YOUTUBE || UtilSite.siteId == UtilSite.SKOLETUBE)
         {
            this.btnGoStudio.label = UtilDict.toDisplay("cc","Create Videos");
         }
         var _loc1_:Boolean = UtilSite.isSchoolSite;
         this.titleDisplay.text = UtilDict.toDisplay("cc","Your character has been successfully created");
         switch(this.themeId)
         {
            case "chibi":
               _loc2_ = "Chibi Peepz";
               break;
            case "anime":
               _loc2_ = "Anime";
               break;
            case "spacecitizen":
               _loc2_ = "Space Citizens";
               break;
            case "family":
               _loc2_ = "Comedy World";
               break;
            case "cc2":
               _loc2_ = "Lil\' Peepz";
               break;
            case "business":
               _loc2_ = "Business Friendly";
               break;
            case "ninjaanime":
               _loc2_ = "Ninja Anime";
               break;
            case "ninja":
               _loc2_ = "Chibi Ninjas";
         }
         if(_loc2_)
         {
            _loc3_ = "It is now available in the Video Maker.\nSimply browse the custom characters in the \"" + _loc2_ + "\" theme to find it.";
            this.messageDisplay.text = UtilDict.toDisplay("cc",_loc3_);
         }
      }
      
      private function tellEveryoneUserGoToStudio() : void
      {
         var _loc1_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_GO_TO_STUDIO,this);
         this.dispatchEvent(_loc1_);
      }
      
      private function tellEveryoneUserGoToCc() : void
      {
         var _loc1_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_GO_TO_CHAR_CREATOR,this);
         this.dispatchEvent(_loc1_);
      }
      
      private function get themeId() : String
      {
         return Util.getFlashVar().getValueByKey(ServerConstants.PARAM_THEME_ID) as String;
      }
      
      private function onLearnActionBtnClick() : void
      {
         var _loc1_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_LEARN_ACTION,this);
         this.dispatchEvent(_loc1_);
      }
      
      private function _PurchaseCompleteBox_Rect1_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 10;
         _loc1_.radiusY = 10;
         _loc1_.fill = this._PurchaseCompleteBox_SolidColor1_c();
         _loc1_.stroke = this._PurchaseCompleteBox_SolidColorStroke1_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PurchaseCompleteBox_SolidColor1_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 15132390;
         return _loc1_;
      }
      
      private function _PurchaseCompleteBox_SolidColorStroke1_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 13421772;
         return _loc1_;
      }
      
      private function _PurchaseCompleteBox_VGroup1_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.paddingBottom = 20;
         _loc1_.paddingLeft = 20;
         _loc1_.paddingRight = 20;
         _loc1_.paddingTop = 15;
         _loc1_.horizontalAlign = "center";
         _loc1_.gap = 15;
         _loc1_.width = 360;
         _loc1_.mxmlContent = [this._PurchaseCompleteBox_Label1_i(),this._PurchaseCompleteBox_Group2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PurchaseCompleteBox_Label1_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.setStyle("color",5460819);
         _loc1_.setStyle("fontSize",16);
         _loc1_.id = "titleDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.titleDisplay = _loc1_;
         BindingManager.executeBindings(this,"titleDisplay",this.titleDisplay);
         return _loc1_;
      }
      
      private function _PurchaseCompleteBox_Group2_c() : Group
      {
         var _loc1_:Group = new Group();
         _loc1_.percentWidth = 100;
         _loc1_.percentHeight = 100;
         _loc1_.mxmlContent = [this._PurchaseCompleteBox_Rect2_c(),this._PurchaseCompleteBox_VGroup2_c()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PurchaseCompleteBox_Rect2_c() : Rect
      {
         var _loc1_:Rect = new Rect();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.radiusX = 5;
         _loc1_.radiusY = 5;
         _loc1_.fill = this._PurchaseCompleteBox_SolidColor2_c();
         _loc1_.stroke = this._PurchaseCompleteBox_SolidColorStroke2_c();
         _loc1_.initialized(this,null);
         return _loc1_;
      }
      
      private function _PurchaseCompleteBox_SolidColor2_c() : SolidColor
      {
         var _loc1_:SolidColor = new SolidColor();
         _loc1_.color = 16777215;
         return _loc1_;
      }
      
      private function _PurchaseCompleteBox_SolidColorStroke2_c() : SolidColorStroke
      {
         var _loc1_:SolidColorStroke = new SolidColorStroke();
         _loc1_.color = 14079432;
         return _loc1_;
      }
      
      private function _PurchaseCompleteBox_VGroup2_c() : VGroup
      {
         var _loc1_:VGroup = new VGroup();
         _loc1_.left = 0;
         _loc1_.right = 0;
         _loc1_.top = 0;
         _loc1_.bottom = 0;
         _loc1_.gap = 12;
         _loc1_.paddingBottom = 20;
         _loc1_.paddingLeft = 20;
         _loc1_.paddingRight = 20;
         _loc1_.paddingTop = 15;
         _loc1_.horizontalAlign = "center";
         _loc1_.mxmlContent = [this._PurchaseCompleteBox_Label2_i(),this._PurchaseCompleteBox_Button1_i(),this._PurchaseCompleteBox_Button2_i(),this._PurchaseCompleteBox_TextButton1_i()];
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         return _loc1_;
      }
      
      private function _PurchaseCompleteBox_Label2_i() : Label
      {
         var _loc1_:Label = new Label();
         _loc1_.percentWidth = 80;
         _loc1_.setStyle("fontSize",13);
         _loc1_.setStyle("color",2434341);
         _loc1_.setStyle("textAlign","center");
         _loc1_.id = "messageDisplay";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.messageDisplay = _loc1_;
         BindingManager.executeBindings(this,"messageDisplay",this.messageDisplay);
         return _loc1_;
      }
      
      private function _PurchaseCompleteBox_Button1_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.height = 40;
         _loc1_.styleName = "btnGoStudio";
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__btnLearnAction_click);
         _loc1_.id = "btnLearnAction";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnLearnAction = _loc1_;
         BindingManager.executeBindings(this,"btnLearnAction",this.btnLearnAction);
         return _loc1_;
      }
      
      public function __btnLearnAction_click(param1:MouseEvent) : void
      {
         this.onLearnActionBtnClick();
      }
      
      private function _PurchaseCompleteBox_Button2_i() : Button
      {
         var _loc1_:Button = new Button();
         _loc1_.horizontalCenter = 0;
         _loc1_.verticalCenter = 1;
         _loc1_.styleName = "btnConfirmPurchase";
         _loc1_.width = 180;
         _loc1_.height = 45;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.__btnGoStudio_click);
         _loc1_.id = "btnGoStudio";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this.btnGoStudio = _loc1_;
         BindingManager.executeBindings(this,"btnGoStudio",this.btnGoStudio);
         return _loc1_;
      }
      
      public function __btnGoStudio_click(param1:MouseEvent) : void
      {
         this.tellEveryoneUserGoToStudio();
      }
      
      private function _PurchaseCompleteBox_TextButton1_i() : TextButton
      {
         var _loc1_:TextButton = new TextButton();
         _loc1_.color = 0;
         _loc1_.txtSize = 12;
         _loc1_.buttonMode = true;
         _loc1_.addEventListener("click",this.___PurchaseCompleteBox_TextButton1_click);
         _loc1_.id = "_PurchaseCompleteBox_TextButton1";
         if(!_loc1_.document)
         {
            _loc1_.document = this;
         }
         this._PurchaseCompleteBox_TextButton1 = _loc1_;
         BindingManager.executeBindings(this,"_PurchaseCompleteBox_TextButton1",this._PurchaseCompleteBox_TextButton1);
         return _loc1_;
      }
      
      public function ___PurchaseCompleteBox_TextButton1_click(param1:MouseEvent) : void
      {
         this.tellEveryoneUserGoToCc();
      }
      
      public function ___PurchaseCompleteBox_Group1_creationComplete(param1:FlexEvent) : void
      {
         this.init();
      }
      
      private function _PurchaseCompleteBox_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Boolean
         {
            return displayLearnAction;
         },null,"btnLearnAction.includeInLayout");
         result[1] = new Binding(this,function():Boolean
         {
            return displayLearnAction;
         },null,"btnLearnAction.visible");
         result[2] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Learn more actions");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnLearnAction.label");
         result[3] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Make a video >");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"btnGoStudio.label");
         result[4] = new Binding(this,function():String
         {
            var _loc1_:* = UtilDict.toDisplay("cc","Create more characters");
            return _loc1_ == undefined ? null : String(_loc1_);
         },null,"_PurchaseCompleteBox_TextButton1.label");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get btnGoStudio() : Button
      {
         return this._1178723494btnGoStudio;
      }
      
      public function set btnGoStudio(param1:Button) : void
      {
         var _loc2_:Object = this._1178723494btnGoStudio;
         if(_loc2_ !== param1)
         {
            this._1178723494btnGoStudio = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnGoStudio",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get btnLearnAction() : Button
      {
         return this._221236638btnLearnAction;
      }
      
      public function set btnLearnAction(param1:Button) : void
      {
         var _loc2_:Object = this._221236638btnLearnAction;
         if(_loc2_ !== param1)
         {
            this._221236638btnLearnAction = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"btnLearnAction",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get messageDisplay() : Label
      {
         return this._1766135109messageDisplay;
      }
      
      public function set messageDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1766135109messageDisplay;
         if(_loc2_ !== param1)
         {
            this._1766135109messageDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"messageDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get titleDisplay() : Label
      {
         return this._1893287094titleDisplay;
      }
      
      public function set titleDisplay(param1:Label) : void
      {
         var _loc2_:Object = this._1893287094titleDisplay;
         if(_loc2_ !== param1)
         {
            this._1893287094titleDisplay = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"titleDisplay",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      private function get displayLearnAction() : Boolean
      {
         return this._66049912displayLearnAction;
      }
      
      private function set displayLearnAction(param1:Boolean) : void
      {
         var _loc2_:Object = this._66049912displayLearnAction;
         if(_loc2_ !== param1)
         {
            this._66049912displayLearnAction = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"displayLearnAction",_loc2_,param1));
            }
         }
      }
   }
}
