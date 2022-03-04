package anifire.components.char_editor
{
   import anifire.cc_theme_lib.CcAction;
   import anifire.cc_theme_lib.CcCharacter;
   import anifire.cc_theme_lib.CcColor;
   import anifire.cc_theme_lib.CcComponent;
   import anifire.cc_theme_lib.CcComponentThumb;
   import anifire.cc_theme_lib.CcFacial;
   import anifire.cc_theme_lib.CcLibrary;
   import anifire.cc_theme_lib.CcSelection;
   import anifire.cc_theme_lib.CcState;
   import anifire.component.CustomCharacterMaker;
   import anifire.constant.AnimeConstants;
   import anifire.constant.CcLibConstant;
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.event.CcCharPreviewerEvent;
   import anifire.event.CcComponentLoadEvent;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.event.LoadMgrEvent;
   import anifire.util.ExtraDataLoader;
   import anifire.util.Util;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilLicense;
   import anifire.util.UtilLoadMgr;
   import anifire.util.UtilNetwork;
   import anifire.util.UtilPlain;
   import caurina.transitions.Tweener;
   import flash.display.BitmapData;
   import flash.display.DisplayObjectContainer;
   import flash.display.LoaderInfo;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getDefinitionByName;
   import flash.utils.setTimeout;
   import mx.binding.Binding;
   import mx.binding.IBindingClient;
   import mx.binding.IWatcherSetupUtil2;
   import mx.containers.Canvas;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponent;
   import mx.core.UIComponentDescriptor;
   import mx.core.mx_internal;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   import mx.managers.CursorManager;
   import nochump.util.zip.ZipFile;
   
   use namespace mx_internal;
   
   public class CharPreviewer extends Canvas implements IBindingClient
   {
      
      private static var _watcherSetupUtil:IWatcherSetupUtil2;
       
      
      private var _3141bg:Canvas;
      
      private var _1081277359maskBg:Canvas;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var myUI:UIComponent;
      
      private const LOADER:String = "loader";
      
      private var _customColor:UtilHashArray;
      
      private var _orgX:Number;
      
      private var _tarX:Number;
      
      private var _orgY:Number;
      
      private var _tarY:Number;
      
      private var _orgRatio:Number = 1;
      
      private var _zoomRatio:Number = 2;
      
      private var _orgHeight:Number = 240;
      
      private const MC:String = "MC";
      
      private var _isBuilding:int = 0;
      
      public var ccPosDy:Number = 0;
      
      private var _shouldPauseOnLoadByteComplete:Boolean = false;
      
      private var _charCanvasHeight:Number;
      
      mx_internal var _bindings:Array;
      
      mx_internal var _watchers:Array;
      
      mx_internal var _bindingsByDestination:Object;
      
      mx_internal var _bindingsBeginWithWord:Object;
      
      public function CharPreviewer()
      {
         var target:Object = null;
         var watcherSetupUtilClass:Object = null;
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "events":{"creationComplete":"___CharPreviewer_Canvas1_creationComplete"},
            "stylesFactory":function():void
            {
               this.backgroundColor = 16777215;
               this.backgroundAlpha = 0;
            },
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"bg",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":80,
                        "styleName":"bgCharPreviewerZoom",
                        "percentWidth":100,
                        "percentHeight":100
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"maskBg",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "x":80,
                        "percentWidth":100,
                        "percentHeight":100
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
         var bindings:Array = this._CharPreviewer_bindingsSetup();
         var watchers:Array = [];
         target = this;
         if(_watcherSetupUtil == null)
         {
            watcherSetupUtilClass = getDefinitionByName("_anifire_components_char_editor_CharPreviewerWatcherSetupUtil");
            watcherSetupUtilClass["init"](null);
         }
         _watcherSetupUtil.setup(this,function(param1:String):*
         {
            return target[param1];
         },function(param1:String):*
         {
            return CharPreviewer[param1];
         },bindings,watchers);
         mx_internal::_bindings = mx_internal::_bindings.concat(bindings);
         mx_internal::_watchers = mx_internal::_watchers.concat(watchers);
         this.verticalScrollPolicy = "off";
         this.clipContent = false;
         this.addEventListener("creationComplete",this.___CharPreviewer_Canvas1_creationComplete);
         var i:uint = 0;
         while(i < bindings.length)
         {
            Binding(bindings[i]).execute();
            i++;
         }
      }
      
      public static function set watcherSetupUtil(param1:IWatcherSetupUtil2) : void
      {
         CharPreviewer._watcherSetupUtil = param1;
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
            this.backgroundColor = 16777215;
            this.backgroundAlpha = 0;
         };
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      public function hide() : void
      {
         this.visible = false;
      }
      
      public function get zoomRatio() : Number
      {
         return this._zoomRatio;
      }
      
      public function set zoomRatio(param1:Number) : void
      {
         this._zoomRatio = param1;
      }
      
      public function get charCanvasHeight() : Number
      {
         return this._charCanvasHeight;
      }
      
      public function set charCanvasHeight(param1:Number) : void
      {
         this._charCanvasHeight = param1;
      }
      
      public function get shouldPauseOnLoadBytesComplete() : Boolean
      {
         return this._shouldPauseOnLoadByteComplete;
      }
      
      public function set shouldPauseOnLoadBytesComplete(param1:Boolean) : void
      {
         this._shouldPauseOnLoadByteComplete = param1;
      }
      
      public function CharPreview() : void
      {
         this._customColor = new UtilHashArray();
         if(!this.ccPosDy)
         {
            this.ccPosDy = CcLibConstant.CC_PREVIEW_DY;
         }
         var _loc1_:CustomCharacterMaker = new CustomCharacterMaker();
         _loc1_.name = this.LOADER;
         _loc1_.scaleX = -1;
         this._orgX = this.width * 0.5;
         this._orgY = this.height * 0.5;
         this._tarX = this.width * 0.6;
         this._tarY = this.height * 0.8;
         this.myUI = new UIComponent();
         this.myUI.addChild(_loc1_);
         this.myUI.x = this._orgX;
         this.myUI.y = this._orgY;
         this._orgRatio = CcLibConstant.DEFAULT_PREVIEW_SCALE;
         this.myUI.scaleX = this.myUI.scaleY = this._orgRatio;
         this.addChild(this.myUI);
         this.maskBg.graphics.clear();
         this.maskBg.graphics.beginFill(16711680,1);
         if(UtilLicense.getCurrentLicenseId() == "8")
         {
            this.maskBg.graphics.moveTo(40,14);
            this.maskBg.graphics.lineTo(40,326);
            this.maskBg.graphics.lineTo(308,326);
            this.maskBg.graphics.lineTo(290,307);
            this.maskBg.graphics.lineTo(271,4);
            this.maskBg.graphics.lineTo(40,14);
         }
         else
         {
            this.maskBg.graphics.drawRoundRect(40,25,270,325,15,15);
         }
         this.maskBg.graphics.endFill();
         this.swapChildren(this.myUI,this.maskBg);
         this.zoomOutFacial();
         this.charCanvasHeight = this.height;
      }
      
      private function loadCCCharComplete(param1:Event) : void
      {
      }
      
      public function initByCcChar(param1:CcCharacter, param2:String, param3:String = "") : void
      {
         var _loc9_:CcColor = null;
         var _loc10_:CcLibrary = null;
         var _loc11_:ExtraDataLoader = null;
         var _loc12_:Object = null;
         if(this._isBuilding != 1)
         {
            this._isBuilding = 1;
            CursorManager.setBusyCursor();
            CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).destroy();
            CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).ver = param1.ver;
            var _loc4_:Number = param1.getUserChosenColorNum();
            var _loc5_:int = 0;
            while(_loc5_ < _loc4_)
            {
               _loc9_ = param1.getUserChosenColorByIndex(_loc5_);
               CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).addColor(_loc9_.ccColorThumb.colorReference,_loc9_.ccColorThumb.originalColor,_loc9_.colorValue);
               _loc5_++;
            }
            var _loc6_:Number = param1.getUserChosenLibraryNum();
            var _loc7_:UtilLoadMgr;
            (_loc7_ = new UtilLoadMgr()).setExtraData({
               "ccChar":param1,
               "actionId":param2,
               "facialId":param3
            });
            _loc7_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onCompleteLibrary);
            var _loc8_:int = 0;
            while(_loc8_ < _loc6_)
            {
               if((_loc10_ = param1.getUserChosenLibraryByIndex(_loc8_)) != null)
               {
                  _loc11_ = new ExtraDataLoader();
                  (_loc12_ = new Object())["library"] = _loc10_;
                  _loc11_.extraData = _loc12_;
                  _loc7_.addEventDispatcher(_loc11_.contentLoaderInfo,Event.COMPLETE);
                  _loc11_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadLibrary);
                  _loc11_.load(UtilNetwork.getGetCcLibraryFileRequest(_loc10_.theme_id,_loc10_.type,_loc10_.component_id));
               }
               _loc8_++;
            }
            _loc7_.commit();
            return;
         }
      }
      
      private function onLoadLibrary(param1:Event) : void
      {
         var _loc2_:LoaderInfo = LoaderInfo(param1.currentTarget);
         var _loc3_:Object = ExtraDataLoader(_loc2_.loader).extraData;
         var _loc4_:CcLibrary = CcLibrary(_loc3_["library"]);
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).CCM.addStyle(_loc4_.type,_loc2_);
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).addLibrary(_loc4_.type,_loc4_.component_id,"");
         this.reloadCharSkin();
      }
      
      private function reloadCharSkin(param1:Event = null) : void
      {
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).reloadSkin();
      }
      
      private function onCompleteLibrary(param1:Event) : void
      {
         var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
         var _loc3_:Object = _loc2_.getExtraData();
         this.initComponents(_loc3_["ccChar"],_loc3_["actionId"],_loc3_["facialId"]);
      }
      
      private function initComponents(param1:CcCharacter, param2:String, param3:String = "") : void
      {
         var _loc5_:int = 0;
         var _loc6_:CcComponent = null;
         var _loc7_:UtilLoadMgr = null;
         var _loc8_:CcAction = null;
         var _loc9_:CcSelection = null;
         var _loc10_:CcState = null;
         var _loc11_:CcComponentThumb = null;
         var _loc4_:Number = param1.getUserChosenComponentSize();
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1.getUserChosenComponentByIndex(_loc5_);
            _loc7_ = new UtilLoadMgr();
            if(_loc6_ != null)
            {
               _loc8_ = param1.bodyShape.getActionById(param2);
               if(_loc6_.componentThumb.type == CcLibConstant.COMPONENT_TYPE_FREEACTION)
               {
                  _loc7_.setExtraData({
                     "component":_loc6_,
                     "ccChar":param1,
                     "actionId":param2,
                     "facialId":param3
                  });
                  if(_loc8_.imageData == null)
                  {
                     _loc7_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onLoadSkeletonImageData);
                     _loc7_.addEventDispatcher(_loc8_,CcComponentLoadEvent.LOAD_ACTION_IMAGE_DATA_COMPLETE);
                     _loc8_.loadImageData(UtilNetwork.getGetCcComponentStateFileRequest(_loc6_.componentThumb.themeId,_loc6_.componentThumb.type,_loc6_.componentThumb.path,_loc8_.filename));
                  }
                  else
                  {
                     _loc7_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onReadySkeleton);
                     this.changeComponent(_loc6_,param2,param3,param1,_loc7_);
                  }
               }
               else if(_loc6_.componentThumb.type == CcLibConstant.COMPONENT_TYPE_SKELETON)
               {
                  if((_loc9_ = _loc8_.getSelectionByComponentType(_loc6_.componentThumb.type)) != null)
                  {
                     _loc10_ = _loc6_.componentThumb.getStateByStateId(_loc9_.stateId);
                     _loc11_ = _loc6_.componentThumb;
                     _loc7_.setExtraData({
                        "component":_loc6_,
                        "ccChar":param1,
                        "actionId":param2,
                        "facialId":param3
                     });
                     if(_loc10_.imageData == null)
                     {
                        _loc7_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onLoadSkeletonImageData);
                        _loc7_.addEventDispatcher(_loc10_,CcComponentLoadEvent.LOAD_STATE_IMAGE_DATA_COMPLETE);
                        _loc10_.loadImageData(UtilNetwork.getGetCcComponentStateFileRequest(_loc6_.componentThumb.themeId,_loc6_.componentThumb.type,_loc6_.componentThumb.path,_loc10_.filename));
                     }
                     else
                     {
                        _loc7_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onReadySkeleton);
                        this.changeComponent(_loc6_,param2,param3,param1,_loc7_);
                     }
                  }
               }
            }
            _loc7_.commit();
            _loc5_++;
         }
      }
      
      public function switchLibrary(param1:CcComponent, param2:CcCharacter) : void
      {
         var _loc3_:CcLibrary = new CcLibrary();
         _loc3_.type = param1.componentThumb.type;
         _loc3_.component_id = param1.componentThumb.componentId;
         _loc3_.theme_id = param1.componentThumb.themeId;
         var _loc4_:ExtraDataLoader = new ExtraDataLoader();
         var _loc5_:Object;
         (_loc5_ = new Object())["library"] = _loc3_;
         _loc4_.extraData = _loc5_;
         _loc4_.contentLoaderInfo.addEventListener(Event.COMPLETE,this.onLoadLibrary);
         _loc4_.load(UtilNetwork.getGetCcLibraryFileRequest(_loc3_.theme_id,_loc3_.type,_loc3_.component_id));
      }
      
      public function switchComponent(param1:CcComponent, param2:CcCharacter, param3:String, param4:String = "") : void
      {
         var _loc5_:CcAction = null;
         var _loc6_:CcSelection = null;
         var _loc7_:CcState = null;
         var _loc8_:CcFacial = null;
         var _loc9_:CcSelection = null;
         var _loc10_:CcSelection = null;
         var _loc11_:CcComponentThumb = null;
         var _loc12_:UtilLoadMgr = null;
         if(param1 != null && param1.componentThumb.type != CcLibConstant.COMPONENT_TYPE_FREEACTION && param1.componentThumb.type != CcLibConstant.COMPONENT_TYPE_SKELETON && param1.componentThumb.type != CcLibConstant.COMPONENT_TYPE_BODYSHAPE)
         {
            _loc6_ = (_loc5_ = param2.bodyShape.getActionById(param3)).getSelectionByComponentType(param1.componentThumb.type);
            _loc7_ = null;
            if(_loc6_ != null)
            {
               _loc7_ = param1.componentThumb.getStateByStateId(_loc6_.stateId);
            }
            else if(param4 == "")
            {
               _loc10_ = _loc5_.getSelectionByComponentType("facial");
               _loc9_ = (_loc8_ = param2.getFacialByFacialId(_loc10_.facialId)).selections.getValueByKey(param1.componentThumb.type) as CcSelection;
               _loc7_ = param1.componentThumb.getStateByStateId(_loc9_.stateId);
            }
            else
            {
               _loc9_ = (_loc8_ = param2.getFacialByFacialId(param4)).selections.getValueByKey(param1.componentThumb.type) as CcSelection;
               _loc7_ = param1.componentThumb.getStateByStateId(_loc9_.stateId);
            }
            if(_loc7_ != null)
            {
               _loc11_ = param1.componentThumb;
               (_loc12_ = new UtilLoadMgr()).setExtraData({
                  "component":param1,
                  "ccChar":param2,
                  "actionId":param3,
                  "facialId":param4
               });
               if(_loc7_.imageData == null)
               {
                  _loc12_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onLoadStateImageData);
                  _loc12_.addEventDispatcher(_loc7_,CcComponentLoadEvent.LOAD_STATE_IMAGE_DATA_COMPLETE);
                  _loc7_.loadImageData(UtilNetwork.getGetCcComponentStateFileRequest(param1.componentThumb.themeId,param1.componentThumb.type,param1.componentThumb.path,_loc7_.filename));
               }
               else
               {
                  _loc12_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onReadyComponent);
                  this.changeComponent(param1,param3,param4,param2,_loc12_);
               }
               _loc12_.commit();
            }
         }
      }
      
      public function initByCcCharAfterSkeleton(param1:CcCharacter, param2:String, param3:String = "") : void
      {
         var _loc8_:int = 0;
         var _loc9_:Sprite = null;
         var _loc10_:CcComponent = null;
         var _loc4_:DisplayObjectContainer = UtilPlain.getInstance(this.myUI,AnimeConstants.MOVIECLIP_DEFAULT_HEAD);
         var _loc5_:Array = CcLibConstant.GET_COMPONENT_ORDER_IN_HEAD;
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).updateBodyScale(param1.bodyScale.x,param1.bodyScale.y);
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).updateHeadScale(param1.headScale.x,param1.headScale.y);
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).updateHeadPos(param1.headShift.x,param1.headShift.y);
         if(_loc4_ != null)
         {
            _loc8_ = 0;
            while(_loc8_ < _loc5_.length)
            {
               (_loc9_ = new Sprite()).name = _loc5_[_loc8_] + this.MC;
               _loc4_.addChild(_loc9_);
               _loc8_++;
            }
         }
         var _loc6_:Number = param1.getUserChosenComponentSize();
         var _loc7_:int = 0;
         while(_loc7_ < _loc6_)
         {
            _loc10_ = param1.getUserChosenComponentByIndex(_loc7_);
            if(CcLibConstant.ALL_LIBRARY_TYPES.indexOf(_loc10_.componentThumb.type) == -1)
            {
               this.switchComponent(_loc10_,param1,param2,param3);
            }
            _loc7_++;
         }
      }
      
      private function onLoadSkeletonImageData(param1:LoadMgrEvent) : void
      {
         var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
         var _loc3_:Object = _loc2_.getExtraData();
         var _loc4_:UtilLoadMgr;
         (_loc4_ = new UtilLoadMgr()).setExtraData(_loc3_);
         _loc4_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onReadySkeleton);
         this.changeComponent(_loc3_["component"],_loc3_["actionId"],_loc3_["facialId"],_loc3_["ccChar"],_loc4_);
         _loc4_.commit();
      }
      
      private function onReadySkeleton(param1:LoadMgrEvent) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onReadySkeleton);
         CursorManager.removeBusyCursor();
         var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
         var _loc3_:Object = _loc2_.getExtraData();
         this.initByCcCharAfterSkeleton(_loc3_["ccChar"],_loc3_["actionId"],_loc3_["facialId"]);
      }
      
      private function onLoadStateImageData(param1:LoadMgrEvent) : void
      {
         IEventDispatcher(param1.target).removeEventListener(param1.type,this.onLoadStateImageData);
         var _loc2_:UtilLoadMgr = param1.target as UtilLoadMgr;
         var _loc3_:Object = _loc2_.getExtraData();
         var _loc4_:UtilLoadMgr;
         (_loc4_ = new UtilLoadMgr()).setExtraData(_loc3_);
         _loc4_.addEventListener(LoadMgrEvent.ALL_COMPLETE,this.onReadyComponent);
         this.changeComponent(_loc3_["component"],_loc3_["actionId"],_loc3_["facialId"],_loc3_["ccChar"],_loc4_);
         _loc4_.commit();
      }
      
      private function onReadyComponent(param1:LoadMgrEvent) : void
      {
         try
         {
            CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).shouldPauseOnLoadBytesComplete = this.shouldPauseOnLoadBytesComplete;
            CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).onReady();
            this.updateCCPosition();
            CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).visible = true;
            this._isBuilding = 2;
            this.dispatchEvent(new LoadEmbedMovieEvent(LoadEmbedMovieEvent.COMPLETE_EVENT));
         }
         catch(e:Error)
         {
         }
      }
      
      public function updateColor(param1:CcColor) : void
      {
         var _loc2_:Object = null;
         try
         {
            _loc2_ = new Object();
            _loc2_["colorReference"] = param1.ccColorThumb.colorReference;
            _loc2_["originalColor"] = !!param1.ccColorThumb.isOriginalColorExist ? param1.ccColorThumb.originalColor : uint.MAX_VALUE;
            _loc2_["colorValue"] = param1.colorValue;
            _loc2_["targetComponentId"] = param1.ccComponent == null ? "" : param1.ccComponent.id;
            CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).updateColor(_loc2_);
         }
         catch(e:Error)
         {
         }
      }
      
      public function removeColorOfThumb(param1:CcComponent, param2:CcCharacter) : void
      {
         var _loc5_:CcColor = null;
         var _loc3_:Number = param2.getUserChosenColorNum();
         var _loc4_:int = _loc3_ - 1;
         while(_loc4_ >= 0)
         {
            if((_loc5_ = param2.getUserChosenColorByIndex(_loc4_)).ccColorThumb.componentType == param1.componentThumb.type)
            {
               param2.removeUserChosenColorByIndex(_loc4_);
               CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).deleteColorByArea(_loc5_.ccColorThumb.colorReference);
            }
            _loc4_--;
         }
      }
      
      private function zoomEffectCompleted() : void
      {
         dispatchEvent(new CcCharPreviewerEvent(CcCharPreviewerEvent.ZOOM_EFFECT_COMPLETED,this));
      }
      
      public function zoomInFacialWithoutDisplacement() : void
      {
         var _loc1_:Number = this.myUI.height;
         var _loc2_:Number = this.myUI.width;
         var _loc3_:Number = this.myUI.x;
         var _loc4_:Number = this.myUI.y;
         this.myUI.scaleX = this._zoomRatio;
         this.myUI.scaleY = this._zoomRatio;
         this.myUI.y *= this._zoomRatio;
         this.zoomEffectCompleted();
      }
      
      public function zoomInFacial() : void
      {
         var _loc1_:Number = NaN;
         var _loc2_:Point = null;
         if(this.myUI.scaleX == this._orgRatio && this.myUI.scaleY == this._orgRatio)
         {
            _loc1_ = this.getZoomedScale();
            if(_loc1_ && _loc1_ != this._orgRatio)
            {
               _loc2_ = this.getZoomedPosition(_loc1_);
               Tweener.addTween(this.bg,{
                  "alpha":1,
                  "time":0,
                  "transition":"easeOut"
               });
               Tweener.addTween(this.myUI,{
                  "scaleX":_loc1_,
                  "scaleY":_loc1_,
                  "x":_loc2_.x,
                  "y":_loc2_.y,
                  "time":0,
                  "transition":"easeOut"
               });
               this.myUI.mask = this.maskBg;
            }
         }
      }
      
      private function getZoomedScale() : Number
      {
         var _loc1_:Number = NaN;
         var _loc2_:Number = NaN;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(UtilLicense.getCurrentLicenseId() == "8")
         {
            _loc1_ = 0.9;
         }
         else if(Util.getFlashVar().getValueByKey(ServerConstants.PARAM_THEME_ID) == ThemeConstants.ANIME_THEME_ID)
         {
            _loc1_ = 1.2;
         }
         else if(Util.getFlashVar().getValueByKey(ServerConstants.PARAM_THEME_ID) == ThemeConstants.NINJAANIME_THEME_ID)
         {
            _loc1_ = 1.2;
         }
         else
         {
            _loc1_ = 1;
         }
         try
         {
            _loc2_ = this.maskBg.getBounds(this.maskBg).width * _loc1_ / this.headRect.width;
            _loc3_ = this.maskBg.getBounds(this.maskBg).height * _loc1_ / this.headRect.height;
            return Number(_loc2_ > _loc3_ ? Number(_loc3_) : Number(_loc2_));
         }
         catch(e:Error)
         {
            return _loc1_;
         }
      }
      
      private function getZoomedPosition(param1:Number) : Point
      {
         var _loc2_:Number = this.myUI.y - (this.headRect.y + this.headRect.height / 2);
         _loc2_ /= this._orgRatio;
         var _loc3_:Number = this.bg.x + this.bg.width / 2;
         _loc2_ *= param1;
         var _loc4_:Number = this.bg.y + this.bg.height / 2 + _loc2_ + this.ccPosDy;
         return new Point(_loc3_,_loc4_);
      }
      
      public function zoomOutFacial() : void
      {
         Tweener.addTween(this.myUI,{
            "scaleX":this._orgRatio,
            "scaleY":this._orgRatio,
            "x":this._orgX,
            "y":this._orgY,
            "time":0,
            "transition":"easeOut"
         });
         Tweener.addTween(this.bg,{
            "alpha":0,
            "time":0,
            "transition":"easeOut",
            "onComplete":this.zoomEffectCompleted
         });
         this.maskBg.alpha = 0;
         this.myUI.mask = null;
         setTimeout(this.updateCCPosition,0);
      }
      
      public function changeComponent(param1:CcComponent, param2:String, param3:String, param4:CcCharacter, param5:UtilLoadMgr) : void
      {
         var stateId:String = null;
         var selection:CcSelection = null;
         var state:CcState = null;
         var facialSelection:CcSelection = null;
         var facial:CcFacial = null;
         var fSelection:CcSelection = null;
         var color:CcColor = null;
         var colorObj:Object = null;
         var ccComponent:CcComponent = param1;
         var actionId:String = param2;
         var facialId:String = param3;
         var ccChar:CcCharacter = param4;
         var loadMgr:UtilLoadMgr = param5;
         var action:CcAction = ccChar.bodyShape.getActionById(actionId);
         if(ccComponent.componentThumb.type != CcLibConstant.COMPONENT_TYPE_FREEACTION)
         {
            selection = action.getSelectionByComponentType(ccComponent.componentThumb.type);
            if(selection == null)
            {
               facialSelection = action.getSelectionByComponentType("facial");
               if(facialId != null && facialId.length > 0)
               {
                  facial = ccChar.getFacialByFacialId(facialId);
               }
               else
               {
                  facial = ccChar.getFacialByFacialId(facialSelection.facialId);
               }
               fSelection = facial.selections.getValueByKey(ccComponent.componentThumb.type) as CcSelection;
               state = ccComponent.componentThumb.getStateByStateId(fSelection.stateId);
               stateId = state.stateId;
            }
            else
            {
               stateId = selection.stateId;
            }
         }
         var properties:Object = {
            "x":ccComponent.x,
            "y":ccComponent.y,
            "xscale":ccComponent.xscale,
            "yscale":ccComponent.yscale,
            "offset":ccComponent.offset,
            "rotation":ccComponent.rotation,
            "split":ccComponent.split
         };
         var colors:Array = new Array();
         var num:Number = ccChar.getUserChosenColorNum();
         var i:int = 0;
         while(i < num)
         {
            color = ccChar.getUserChosenColorByIndex(i);
            if(color.ccColorThumb.componentType == ccComponent.componentThumb.type || color.ccColorThumb.colorReference == "ccSkinColor" || color.ccColorThumb.colorReference == "ccFaceHairColor")
            {
               colorObj = new Object();
               colorObj["colorReference"] = color.ccColorThumb.colorReference;
               colorObj["originalColor"] = !!color.ccColorThumb.isOriginalColorExist ? color.ccColorThumb.originalColor : uint.MAX_VALUE;
               colorObj["colorValue"] = color.colorValue;
               colorObj["targetComponentId"] = color.ccComponent == null ? "" : color.ccComponent.id;
               colors.push(colorObj);
            }
            i++;
         }
         try
         {
            if(stateId == null)
            {
               CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).updateComponentImageData(ccComponent.componentThumb.type,action.imageData,properties,loadMgr,colors,ccComponent.id);
            }
            else
            {
               CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).updateComponentImageData(ccComponent.componentThumb.type,ccComponent.componentThumb.getStateByStateId(stateId).imageData,properties,loadMgr,colors,ccComponent.id);
            }
         }
         catch(e:Error)
         {
         }
      }
      
      public function highlightComponent(param1:CcComponent) : void
      {
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).highlightComponent(param1.id);
      }
      
      public function removeHighlightComponent(param1:CcComponent) : void
      {
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).removeHighlight(param1.id);
      }
      
      public function removeComponent(param1:CcComponent) : void
      {
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).removeComponentById(param1.id);
      }
      
      public function updateLocation(param1:CcComponent) : void
      {
         var _loc2_:Object = {
            "x":param1.x,
            "y":param1.y,
            "xscale":param1.xscale,
            "yscale":param1.yscale,
            "offset":param1.offset,
            "rotation":param1.rotation
         };
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).updateLocation(param1.componentThumb.type,_loc2_,CcLibConstant.ALL_MULTIPLE_COMPONENT_TYPES.indexOf(param1.componentThumb.type) > -1 ? param1.id : "");
         if(param1.componentThumb.type == CcLibConstant.COMPONENT_TYPE_HAIR)
         {
            CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).updateLocation(CcLibConstant.COMPONENT_TYPE_FRONT_HAIR,_loc2_,"");
            CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).updateLocation(CcLibConstant.COMPONENT_TYPE_BACK_HAIR,_loc2_,"");
         }
      }
      
      public function capCharAsBitmap() : BitmapData
      {
         var _loc1_:BitmapData = null;
         return CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).getBitmap();
      }
      
      public function setHeadScale(param1:Number, param2:Number) : void
      {
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).updateHeadScale(param1,param2);
      }
      
      public function setBodyScale(param1:Number, param2:Number) : void
      {
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).updateBodyScale(param1,param2);
         this.updateCCPosition();
      }
      
      public function resetHeadPos() : void
      {
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).resetHeadPos();
      }
      
      public function setHeadPos(param1:Number = 0, param2:Number = 0) : void
      {
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).updateHeadPos(param1,param2);
      }
      
      public function getHeadScale() : Point
      {
         return new Point(CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).head.scaleX,CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).head.scaleY);
      }
      
      public function getBodyScale() : Point
      {
         return new Point(CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).bodyScale,CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).bodyScale);
      }
      
      public function getHeadPos() : Point
      {
         return CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).headPos;
      }
      
      private function updateCCPosition() : void
      {
         if(this.myUI.scaleX == this._orgRatio && this.myUI.scaleY == this._orgRatio)
         {
            this._orgY = this.charCanvasHeight - this._orgHeight * this.ccMaker.bodyScale / 2 + this.ccPosDy;
            this.myUI.y = this._orgY;
         }
      }
      
      public function get headRect() : Rectangle
      {
         var _loc2_:Rectangle = null;
         var _loc1_:DisplayObjectContainer = CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).head;
         if(_loc1_ != null)
         {
            _loc2_ = _loc1_.getRect(this);
            _loc2_.height *= 1.3;
            return _loc2_;
         }
         return null;
      }
      
      public function get ccMaker() : CustomCharacterMaker
      {
         return CustomCharacterMaker(this.myUI.getChildByName(this.LOADER));
      }
      
      public function capFaceAsBitmap() : BitmapData
      {
         var _loc1_:BitmapData = null;
         return CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).getHeadBitmap();
      }
      
      public function reset() : void
      {
      }
      
      public function initByCharZip(param1:ZipFile) : void
      {
      }
      
      public function get withBackground() : Boolean
      {
         return this.bg.styleName == "bgCharPreviewerZoom";
      }
      
      public function set withBackground(param1:Boolean) : void
      {
         this.bg.styleName = !!param1 ? "bgCharPreviewerZoom" : "";
      }
      
      public function reloadSkin() : void
      {
         CustomCharacterMaker(this.myUI.getChildByName(this.LOADER)).reloadSkin();
      }
      
      public function ___CharPreviewer_Canvas1_creationComplete(param1:FlexEvent) : void
      {
         this.CharPreview();
      }
      
      private function _CharPreviewer_bindingsSetup() : Array
      {
         var result:Array = [];
         result[0] = new Binding(this,function():Rectangle
         {
            return new Rectangle(0,0,this.width,this.height);
         },null,"this.scrollRect");
         result[1] = new Binding(this,function():Number
         {
            return 1 / 1.1;
         },null,"bg.scaleX");
         result[2] = new Binding(this,function():Number
         {
            return 1 / 1.19;
         },null,"bg.scaleY");
         return result;
      }
      
      [Bindable(event="propertyChange")]
      public function get bg() : Canvas
      {
         return this._3141bg;
      }
      
      public function set bg(param1:Canvas) : void
      {
         var _loc2_:Object = this._3141bg;
         if(_loc2_ !== param1)
         {
            this._3141bg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"bg",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get maskBg() : Canvas
      {
         return this._1081277359maskBg;
      }
      
      public function set maskBg(param1:Canvas) : void
      {
         var _loc2_:Object = this._1081277359maskBg;
         if(_loc2_ !== param1)
         {
            this._1081277359maskBg = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"maskBg",_loc2_,param1));
            }
         }
      }
   }
}
