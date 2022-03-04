package anifire.cc_interface
{
   import flash.events.IEventDispatcher;
   import mx.containers.ViewStack;
   import mx.controls.SWFLoader;
   import mx.core.Container;
   
   public interface ICcMainUiContainer extends IEventDispatcher
   {
       
      
      function get ui_main_ViewStack() : ViewStack;
      
      function get actionShopLoader() : SWFLoader;
      
      function get ui_main_ccCharEditor() : Container;
      
      function get ui_main_ccCharPreviewAndSaveScreen() : Container;
   }
}
