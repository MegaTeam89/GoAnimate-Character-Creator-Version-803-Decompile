package
{
   import anifire.components.char_editor.ComponentTypeChooser;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_char_editor_ComponentTypeChooserWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_char_editor_ComponentTypeChooserWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         ComponentTypeChooser.watcherSetupUtil = new _anifire_components_char_editor_ComponentTypeChooserWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[0] = new PropertyWatcher("canQuickBar",{"propertyChange":true},[param4[0]],param2);
         param5[1] = new PropertyWatcher("x",{"xChanged":true},[param4[0]],null);
         param5[2] = new PropertyWatcher("tagSteps",{"propertyChange":true},[param4[0]],param2);
         param5[3] = new PropertyWatcher("width",{"widthChanged":true},[param4[0]],null);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[1]);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[3]);
      }
   }
}
