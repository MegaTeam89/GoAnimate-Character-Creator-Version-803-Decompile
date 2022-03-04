package
{
   import anifire.components.previewAndSave.PurchaseCompleteBox;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_previewAndSave_PurchaseCompleteBoxWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_previewAndSave_PurchaseCompleteBoxWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         PurchaseCompleteBox.watcherSetupUtil = new _anifire_components_previewAndSave_PurchaseCompleteBoxWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("displayLearnAction",{"propertyChange":true},[param4[0],param4[1]],param2);
         param5[0].updateParent(param1);
      }
   }
}
