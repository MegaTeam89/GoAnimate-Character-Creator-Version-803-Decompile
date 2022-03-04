package
{
   import anifire.components.char_editor.ButtonBar;
   import anifire.constant.CcLibConstant;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.StaticPropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_char_editor_ButtonBarWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_char_editor_ButtonBarWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ButtonBar.watcherSetupUtil = new _anifire_components_char_editor_ButtonBarWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[4] = new StaticPropertyWatcher("CHANGE_CHAR_SCALE",null,[param4[4]],null);
         param5[4].updateParent(CcLibConstant);
      }
   }
}
