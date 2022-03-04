package anifire.cc_interface
{
   import anifire.components.char_editor.CharHeadFrame;
   import anifire.components.char_editor.CharPreviewer;
   import anifire.components.char_editor.StatusPanel;
   import anifire.components.previewAndSave.CharPreviewOptionBox;
   import flash.events.IEventDispatcher;
   import mx.containers.ViewStack;
   import mx.controls.Button;
   import mx.core.Container;
   
   public interface ICcPreviewAndSaveContainer extends IEventDispatcher
   {
       
      
      function get ui_ps_charFrame() : CharHeadFrame;
      
      function get ui_ps_charPreviewer() : CharPreviewer;
      
      function get ui_ps_interactionViewStack() : ViewStack;
      
      function get ui_ps_charPreviewCanvas() : Container;
      
      function get ui_ps_charPreviewOptionBox() : CharPreviewOptionBox;
      
      function get ui_ps_statusPanel() : StatusPanel;
      
      function get ui_ps_userPointStatusPanel() : StatusPanel;
      
      function get ui_ps_charPurchaseBox() : IPurchaseBox;
      
      function get ui_ps_setavatarbutton() : Button;
      
      function get ui_ps_purchaseCompleteBox() : IPurchaseCompleteBox;
      
      function get ui_ps_purChaseCompleteContainer() : Container;
   }
}
