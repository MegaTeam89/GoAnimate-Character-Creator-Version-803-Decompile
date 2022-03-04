package
{
   import anifire.components.char_editor.StatusPanel;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_char_editor_StatusPanelWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_char_editor_StatusPanelWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         StatusPanel.watcherSetupUtil = new _anifire_components_char_editor_StatusPanelWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("panel",{"propertyChange":true},[param4[0]],param2);
         param5[2] = new PropertyWatcher("width",{"widthChanged":true},[param4[0]],null);
         param5[3] = new PropertyWatcher("_showGP",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[1].updateParent(param1);
         param5[1].addChild(param5[2]);
         param5[3].updateParent(param1);
      }
   }
}
