package anifire.core
{
   import anifire.cc_interface.ICcPreviewAndSaveContainer;
   import anifire.cc_interface.IConfiguration;
   import anifire.cc_theme_lib.CcCharacter;
   import anifire.cc_theme_lib.CcTheme;
   import anifire.constant.CcLibConstant;
   import anifire.event.CcActionChosenEvent;
   import anifire.event.CcCoreEvent;
   import anifire.event.LoadEmbedMovieEvent;
   import anifire.util.Util;
   import anifire.util.UtilDict;
   import anifire.util.UtilNetwork;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.IEventDispatcher;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.SecurityErrorEvent;
   import flash.external.ExternalInterface;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.utils.ByteArray;
   import mx.graphics.codec.PNGEncoder;
   
   public class CcPreviewAndSaveController extends EventDispatcher
   {
       
      
      private var ui_ps_container:ICcPreviewAndSaveContainer;
      
      private var _ccChar:CcCharacter;
      
      private var _ccTheme:CcTheme;
      
      private var _moneyMode:int;
      
      private var _isUserLogined:Boolean;
      
      private var _coupon:int;
      
      private var _assetId:String;
      
      private var _cfg:IConfiguration;
      
      private var _lastSavedAssetId:String = null;
      
      public function CcPreviewAndSaveController(param1:IEventDispatcher = null)
      {
         super(param1);
      }
      
      public function get assetId() : String
      {
         return this._assetId;
      }
      
      private function get coupon() : int
      {
         return this._coupon;
      }
      
      public function get configuration() : IConfiguration
      {
         return this._cfg;
      }
      
      public function set configuration(param1:IConfiguration) : void
      {
         this._cfg = param1;
      }
      
      public function get userLogined() : Boolean
      {
         return this._isUserLogined;
      }
      
      public function set userLogined(param1:Boolean) : void
      {
         this._isUserLogined = param1;
         this.ui_ps_container.ui_ps_charPurchaseBox.loggedIn = param1;
      }
      
      private function get moneyMode() : int
      {
         return this._moneyMode;
      }
      
      public function get ccChar() : CcCharacter
      {
         return this._ccChar;
      }
      
      public function get ccTheme() : CcTheme
      {
         return this._ccTheme;
      }
      
      public function initUi(param1:ICcPreviewAndSaveContainer) : void
      {
         this.ui_ps_container = param1;
         this.ui_ps_container.ui_ps_charPurchaseBox.addEventListener(CcCoreEvent.USER_WANT_TO_BUY_GOPOINTS,this.onUserWantToBuyGoPoints);
         this.ui_ps_container.ui_ps_charPurchaseBox.addEventListener(CcCoreEvent.USER_WANT_TO_BUY_POINT,this.onUserWantToBuyPoint);
         this.ui_ps_container.ui_ps_charPurchaseBox.addEventListener(CcCoreEvent.USER_WANT_TO_CONFIRM,this.onUserWantToConfirm);
         this.ui_ps_container.ui_ps_charPurchaseBox.addEventListener(CcCoreEvent.USER_WANT_TO_REFRESH,this.onUserWantToKnowMoneyStatus);
         this.ui_ps_container.ui_ps_charPurchaseBox.addEventListener(CcCoreEvent.USER_WANT_TO_CANCEL,this.onUserWantToEditAgain);
         this.ui_ps_container.ui_ps_charPurchaseBox.addEventListener(CcCoreEvent.USER_WANT_TO_SIGNUP,this.onUserWantToSignup);
         this.ui_ps_container.ui_ps_charPurchaseBox.addEventListener(CcCoreEvent.USER_WANT_TO_SUBSCRIBE,this.onUserWantToSubscribe);
         this.ui_ps_container.ui_ps_charPreviewOptionBox.addEventListener(CcActionChosenEvent.ACTION_CHOSEN,this.onUserChooseAction);
         this.ui_ps_container.ui_ps_charPreviewOptionBox.addEventListener(CcActionChosenEvent.FACIAL_CHOSEN,this.onUserChooseFacial);
         this.ui_ps_container.ui_ps_purchaseCompleteBox.addEventListener(CcCoreEvent.USER_WANT_TO_GO_TO_CHAR_CREATOR,this.onUserWantToGoToCharCreator);
         this.ui_ps_container.ui_ps_purchaseCompleteBox.addEventListener(CcCoreEvent.USER_WANT_TO_GO_TO_STUDIO,this.onUserWantToGoToStudio);
         this.ui_ps_container.ui_ps_purchaseCompleteBox.addEventListener(CcCoreEvent.USER_WANT_TO_LEARN_ACTION,this.onUserWantToLearnAction);
         if(this.ui_ps_container.ui_ps_setavatarbutton)
         {
            this.ui_ps_container.ui_ps_setavatarbutton.addEventListener(MouseEvent.CLICK,this.onUserWantToSaveAvatar);
         }
         addEventListener(CcCoreEvent.SHOW_FACEBOOK_SHARER,this.showFacebookSharer);
         this.ui_ps_container.ui_ps_charPreviewer.charCanvasHeight = 280;
      }
      
      private function showFacebookSharer(param1:CcCoreEvent) : void
      {
         ExternalInterface.call("fbShare",this._lastSavedAssetId);
         Util.gaTracking("/creator/fbshare",param1.getData() as DisplayObject);
      }
      
      private function onUserWantToBuyGoPoints(param1:Event) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_BUY_GOPOINTS,this);
         this.dispatchEvent(_loc2_);
      }
      
      private function onUserWantToSignup(param1:Event) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_SIGNUP,this);
         this.dispatchEvent(_loc2_);
      }
      
      private function onUserWantToSubscribe(param1:Event) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_SUBSCRIBE,this);
         this.dispatchEvent(_loc2_);
      }
      
      public function tellUserCannotSave() : void
      {
         this.ui_ps_container.ui_ps_charPurchaseBox.userCannotSave = true;
      }
      
      private function onUserWantToBuyPoint(param1:Event) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_BUY_POINT,this);
         this.dispatchEvent(_loc2_);
      }
      
      private function onUserWantToGoToStudio(param1:Event) : void
      {
         var _loc4_:Object = null;
         var _loc2_:String = null;
         if(param1 is CcCoreEvent)
         {
            if((_loc4_ = (param1 as CcCoreEvent).getData()) != null && String(_loc4_) != "")
            {
               _loc2_ = String(_loc4_);
            }
         }
         var _loc3_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_GO_TO_STUDIO,this,_loc2_);
         this.dispatchEvent(_loc3_);
      }
      
      private function onUserWantToLearnAction(param1:Event) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_LEARN_ACTION,this);
         this.dispatchEvent(_loc2_);
      }
      
      private function onUserWantToGoToCharCreator(param1:Event) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_GO_TO_CHAR_CREATOR,this);
         this.dispatchEvent(_loc2_);
      }
      
      private function onUserWantToKnowMoneyStatus(param1:Event) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_KNOW_HIS_MONEY_STATUS,this);
         this.dispatchEvent(_loc2_);
      }
      
      private function onUserWantToLearnMore(param1:Event) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_LEARN_MORE,this);
         this.dispatchEvent(_loc2_);
      }
      
      private function onUserWantToSave(param1:Event) : void
      {
         this.ui_ps_container.ui_ps_charPurchaseBox.locked = true;
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_SAVE,this);
         this.dispatchEvent(_loc2_);
      }
      
      private function onUserWantToCancelConfirm(param1:Event) : void
      {
         this.proceedToShow();
      }
      
      public function onUserWantToScribe() : void
      {
         this.ui_ps_container.ui_ps_charPurchaseBox.dispatchUserWantToSubscribe();
      }
      
      private function onUserWantToConfirm(param1:Event) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_CONFIRM,this);
         this.dispatchEvent(_loc2_);
      }
      
      private function onUserWantToEditAgain(param1:Event) : void
      {
         var _loc2_:CcCoreEvent = new CcCoreEvent(CcCoreEvent.USER_WANT_TO_CANCEL,this);
         this.dispatchEvent(_loc2_);
      }
      
      public function initChar(param1:CcCharacter) : void
      {
         this._ccChar = param1;
      }
      
      public function initTheme(param1:CcTheme) : void
      {
         this._ccTheme = param1;
      }
      
      public function initMode(param1:int, param2:Boolean, param3:int = 0) : void
      {
         this.userLogined = param2;
         this._moneyMode = param1;
         this._coupon = param3;
      }
      
      public function proceedToShow() : void
      {
         Util.gaTracking("/creator/Preview",this.ui_ps_container.ui_ps_interactionViewStack);
         this.ui_ps_container.ui_ps_charPreviewer.initByCcChar(this.ccChar,this.ccChar.bodyShape.thumbnailActionId,this.ccChar.bodyShape.thumbnailFacialId);
         if(this.ui_ps_container.ui_ps_statusPanel)
         {
            this.ui_ps_container.ui_ps_statusPanel.setGobuck(this.ccChar.calculateGobuck(),this.moneyMode,true,this.coupon);
            this.ui_ps_container.ui_ps_statusPanel.setGopoint(this.ccChar.calculateGoPoint(),this.moneyMode);
            this.ui_ps_container.ui_ps_statusPanel.goPointsShown = this._cfg.goPointsEnabled();
         }
         this.ui_ps_container.ui_ps_interactionViewStack.selectedChild = this.ui_ps_container.ui_ps_charPreviewCanvas;
         this.ui_ps_container.ui_ps_charPreviewOptionBox.init(this.ccChar,this.ccTheme);
         this.ui_ps_container.ui_ps_charPreviewOptionBox.action = this.ccChar.bodyShape.thumbnailActionId;
         this.ui_ps_container.ui_ps_charPreviewOptionBox.facial = this.ccChar.bodyShape.thumbnailFacialId;
         if(this.moneyMode == CcLibConstant.MONEY_MODE_SCHOOL)
         {
            this.ui_ps_container.ui_ps_charPurchaseBox.premiumMode = false;
         }
         if(this.userLogined)
         {
            this.ui_ps_container.ui_ps_charPreviewOptionBox.saveEnabled = true;
         }
      }
      
      public function onUserPointUpdate(param1:Number, param2:Number, param3:int, param4:Boolean = false) : void
      {
         var _loc9_:String = null;
         this._coupon = param3;
         if(this.ui_ps_container.ui_ps_userPointStatusPanel)
         {
            this.ui_ps_container.ui_ps_userPointStatusPanel.setGobuck(param1,this.moneyMode,true);
            this.ui_ps_container.ui_ps_userPointStatusPanel.setGopoint(param2,this.moneyMode,true);
            this.ui_ps_container.ui_ps_userPointStatusPanel.goPointsShown = this._cfg.goPointsEnabled();
         }
         if(this.ui_ps_container.ui_ps_statusPanel)
         {
            this.ui_ps_container.ui_ps_statusPanel.setGobuck(this.ccChar.calculateGobuck(),this.moneyMode,true,this.coupon);
            this.ui_ps_container.ui_ps_statusPanel.setGopoint(this.ccChar.calculateGoPoint(),this.moneyMode);
            this.ui_ps_container.ui_ps_statusPanel.updateGoBuckStyle("color","0x00000",this.moneyMode);
            this.ui_ps_container.ui_ps_statusPanel.updateGoPointStyle("color","0x000000",this.moneyMode);
         }
         var _loc5_:Boolean = false;
         var _loc6_:Boolean = false;
         var _loc7_:Number = 0;
         var _loc8_:Number = 0;
         if(this.coupon > 0)
         {
            _loc7_ = Math.max(this.ccChar.calculateGobuck() - this.coupon,0);
         }
         else
         {
            _loc7_ = this.ccChar.calculateGobuck();
         }
         _loc8_ = this.ccChar.calculateGoPoint();
         if(param2 >= _loc8_)
         {
            _loc6_ = true;
         }
         if(param1 >= _loc7_)
         {
            _loc5_ = true;
         }
         if(_loc5_ && _loc6_ || this.moneyMode != CcLibConstant.MONEY_MODE_NORMAL)
         {
            this.ui_ps_container.ui_ps_charPurchaseBox.hasEnoughBucks = true;
            this.ui_ps_container.ui_ps_charPurchaseBox.hasEnoughPoints = true;
            if(param4)
            {
               this.onUserWantToSave(new Event(Event.COMPLETE));
            }
         }
         else
         {
            if(!_loc5_)
            {
               this.ui_ps_container.ui_ps_charPurchaseBox.hasEnoughBucks = false;
               _loc9_ = UtilDict.toDisplay("cc","<p ><font size=\'16\'><b><font color=\'#FF0000\'>Hey!</font></b><br><font size=\'14\'>You need {0} more GoBucks to get me.</font></p>");
            }
            if(!_loc6_ && this.ui_ps_container.ui_ps_statusPanel)
            {
               this.ui_ps_container.ui_ps_charPurchaseBox.hasEnoughPoints = false;
            }
            if(param4)
            {
               this.proceedToSaveNotEnoughMoney(_loc8_,_loc7_);
               Util.gaTracking("/creator/SaveFail/NeedGB",this.ui_ps_container.ui_ps_interactionViewStack);
            }
         }
      }
      
      public function goConfirmBox(param1:Number, param2:Number) : void
      {
      }
      
      private function onUserChooseAction(param1:CcActionChosenEvent) : void
      {
         this.ui_ps_container.ui_ps_charPreviewer.initByCcChar(this.ccChar,param1.action_id,param1.facial_id);
      }
      
      private function onUserChooseFacial(param1:CcActionChosenEvent) : void
      {
         this.ui_ps_container.ui_ps_charPreviewer.initByCcChar(this.ccChar,param1.action_id,param1.facial_id);
      }
      
      public function proceedToSaveComplete(param1:Number, param2:Number, param3:String) : void
      {
         this._assetId = param3;
         this.ui_ps_container.ui_ps_charPurchaseBox.locked = false;
         this._lastSavedAssetId = param3;
         this.ui_ps_container.ui_ps_interactionViewStack.selectedChild = this.ui_ps_container.ui_ps_purChaseCompleteContainer;
         this.ui_ps_container.ui_ps_charPreviewer.hide();
         this.ui_ps_container.ui_ps_charFrame.visible = true;
      }
      
      public function proceedToSaveNotEnoughMoney(param1:Number, param2:Number) : void
      {
         var _loc3_:String = UtilDict.toDisplay("cc","<p ><font size=\'16\'><b><font color=\'#FF0000\'>Hey!</font></b><br><font size=\'14\'>You need {0} more GoBucks to get me.</font></p>");
         this.ui_ps_container.ui_ps_charPurchaseBox.locked = false;
      }
      
      public function proceedToSaveError() : void
      {
         this.ui_ps_container.ui_ps_charPurchaseBox.locked = false;
      }
      
      public function resetCCAction() : void
      {
         this.ui_ps_container.ui_ps_charPreviewer.addEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onResetCCActionComplete);
         this.ui_ps_container.ui_ps_charPreviewer.initByCcChar(this.ccChar,this.ccChar.bodyShape.thumbnailActionId);
      }
      
      private function onResetCCActionComplete(param1:Event) : void
      {
         this.ui_ps_container.ui_ps_charPreviewer.removeEventListener(LoadEmbedMovieEvent.COMPLETE_EVENT,this.onResetCCActionComplete);
         this.dispatchEvent(param1);
      }
      
      public function saveSnapShot(param1:Boolean = false) : ByteArray
      {
         var _loc2_:BitmapData = null;
         if(!param1)
         {
            _loc2_ = this.ui_ps_container.ui_ps_charPreviewer.capFaceAsBitmap();
         }
         else
         {
            _loc2_ = this.ui_ps_container.ui_ps_charPreviewer.capCharAsBitmap();
         }
         var _loc3_:PNGEncoder = new PNGEncoder();
         return _loc3_.encode(_loc2_);
      }
      
      private function onUserWantToSaveAvatar(param1:MouseEvent) : void
      {
         var _loc2_:URLRequest = UtilNetwork.getSaveAvatarRequest(this._lastSavedAssetId);
         var _loc3_:URLLoader = new URLLoader();
         this.ui_ps_container.ui_ps_setavatarbutton.enabled = false;
         _loc3_.dataFormat = URLLoaderDataFormat.TEXT;
         _loc3_.addEventListener(Event.COMPLETE,this.onSaveAvatarComplete);
         _loc3_.addEventListener(IOErrorEvent.IO_ERROR,this.onSaveAvatarError);
         _loc3_.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.onSaveAvatarError);
         _loc3_.load(_loc2_);
      }
      
      private function onSaveAvatarComplete(param1:Event) : void
      {
         ExternalInterface.call("updateUserThumbnail");
         this.ui_ps_container.ui_ps_setavatarbutton.styleName = "btnAvatarUpdated";
      }
      
      private function onSaveAvatarError(param1:Event) : void
      {
         this.ui_ps_container.ui_ps_setavatarbutton.enabled = true;
      }
      
      public function saveAvatarInFrame(param1:ByteArray) : void
      {
         this.ui_ps_container.ui_ps_charFrame.myImage.data = param1;
      }
      
      public function showNotAbleSave(param1:String) : void
      {
         this.ui_ps_container.ui_ps_charPurchaseBox.showUnableToSaveMsg(param1);
         this.ui_ps_container.ui_ps_charPurchaseBox.locked = false;
      }
      
      public function updatePurchaseBoxButton(param1:int) : void
      {
         this.ui_ps_container.ui_ps_charPurchaseBox.updateButtonText(param1);
      }
   }
}
