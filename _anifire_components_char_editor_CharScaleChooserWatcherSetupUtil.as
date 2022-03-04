package
{
   import anifire.components.char_editor.CharScaleChooser;
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _anifire_components_char_editor_CharScaleChooserWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _anifire_components_char_editor_CharScaleChooserWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         CharScaleChooser.watcherSetupUtil = new _anifire_components_char_editor_CharScaleChooserWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[1] = new PropertyWatcher("width",{"widthChanged":true},[param4[1],param4[15]],param2);
         param5[23] = new PropertyWatcher("_customize",{"propertyChange":true},[param4[15],param4[16]],param2);
         param5[25] = new PropertyWatcher("height",{"heightChanged":true},[param4[16]],null);
         param5[24] = new PropertyWatcher("width",{"widthChanged":true},[param4[15]],null);
         param5[4] = new PropertyWatcher("height",{"heightChanged":true},[param4[2],param4[14],param4[16]],param2);
         param5[16] = new PropertyWatcher("_btnNextPage",{"propertyChange":true},[param4[11],param4[12]],param2);
         param5[19] = new PropertyWatcher("height",{"heightChanged":true},[param4[12]],null);
         param5[17] = new PropertyWatcher("width",{"widthChanged":true},[param4[11]],null);
         param5[14] = new PropertyWatcher("_bg",{"propertyChange":true},[param4[11],param4[12]],param2);
         param5[18] = new PropertyWatcher("height",{"heightChanged":true},[param4[12]],null);
         param5[15] = new PropertyWatcher("width",{"widthChanged":true},[param4[11]],null);
         param5[2] = new PropertyWatcher("_templates",{"propertyChange":true},[param4[1],param4[2]],param2);
         param5[5] = new PropertyWatcher("height",{"heightChanged":true},[param4[2]],null);
         param5[3] = new PropertyWatcher("width",{"widthChanged":true},[param4[1]],null);
         param5[21] = new PropertyWatcher("_btnPrevPage",{"propertyChange":true},[param4[14]],param2);
         param5[22] = new PropertyWatcher("height",{"heightChanged":true},[param4[14]],null);
         param5[1].updateParent(param1);
         param5[23].updateParent(param1);
         param5[23].addChild(param5[25]);
         param5[23].addChild(param5[24]);
         param5[4].updateParent(param1);
         param5[16].updateParent(param1);
         param5[16].addChild(param5[19]);
         param5[16].addChild(param5[17]);
         param5[14].updateParent(param1);
         param5[14].addChild(param5[18]);
         param5[14].addChild(param5[15]);
         param5[2].updateParent(param1);
         param5[2].addChild(param5[5]);
         param5[2].addChild(param5[3]);
         param5[21].updateParent(param1);
         param5[21].addChild(param5[22]);
      }
   }
}
