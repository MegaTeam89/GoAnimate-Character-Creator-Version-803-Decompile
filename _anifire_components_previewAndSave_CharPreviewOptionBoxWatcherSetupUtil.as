package
{
   import anifire.components.previewAndSave.CharPreviewOptionBox;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_previewAndSave_CharPreviewOptionBoxWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_previewAndSave_CharPreviewOptionBoxWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CharPreviewOptionBox.watcherSetupUtil = new _anifire_components_previewAndSave_CharPreviewOptionBoxWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
