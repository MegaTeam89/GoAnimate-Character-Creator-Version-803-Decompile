package
{
   import anifire.components.char_editor.TemplateCCSelector;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_char_editor_TemplateCCSelectorWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_char_editor_TemplateCCSelectorWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         TemplateCCSelector.watcherSetupUtil = new _anifire_components_char_editor_TemplateCCSelectorWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("_pager",{"propertyChange":true},[param4[0],param4[1],param4[2]],param2);
         param5[1] = new PropertyWatcher("pageNumber",{"propertyChange":true},[param4[0],param4[1],param4[2]],null);
         param5[2] = new PropertyWatcher("totalPages",null,[param4[1],param4[2]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[0].addChild(param5[2]);
      }
   }
}
