package
{
   import anifire.popups.UpdateAccount;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_popups_UpdateAccountWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_popups_UpdateAccountWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         UpdateAccount.watcherSetupUtil = new _anifire_popups_UpdateAccountWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_filterShadow",{"propertyChange":true},[param4[0]],param2);
         param5[0].updateParent(param1);
      }
   }
}
