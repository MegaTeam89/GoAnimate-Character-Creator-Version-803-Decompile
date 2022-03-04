package
{
   import anifire.components.previewAndSave.PurchaseBox;
   import mx.binding.IWatcherSetupUtil2;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_previewAndSave_PurchaseBoxWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_previewAndSave_PurchaseBoxWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         PurchaseBox.watcherSetupUtil = new _anifire_components_previewAndSave_PurchaseBoxWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
      }
   }
}
