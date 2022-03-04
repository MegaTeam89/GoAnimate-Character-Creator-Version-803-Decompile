package
{
   import mx.binding.IWatcherSetupUtil2;
   import mx.binding.PropertyWatcher;
   import mx.core.IFlexModuleFactory;
   
   public class _ccWatcherSetupUtil implements IWatcherSetupUtil2
   {
       
      
      public function _ccWatcherSetupUtil()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         cc.watcherSetupUtil = new _ccWatcherSetupUtil();
      }
      
      public function setup(param1:Object, param2:Function, param3:Function, param4:Array, param5:Array) : void
      {
         param5[8] = new PropertyWatcher("height",{"heightChanged":true},[param4[5],param4[7]],param2);
         param5[5] = new PropertyWatcher("width",{"widthChanged":true},[param4[4],param4[6]],param2);
         param5[0] = new PropertyWatcher("_ce_statusPanel",{"propertyChange":true},[param4[0],param4[1],param4[2],param4[3]],param2);
         param5[4] = new PropertyWatcher("height",{"heightChanged":true},[param4[3]],null);
         param5[3] = new PropertyWatcher("width",{"widthChanged":true},[param4[2]],null);
         param5[2] = new PropertyWatcher("y",{"yChanged":true},[param4[1]],null);
         param5[1] = new PropertyWatcher("x",{"xChanged":true},[param4[0]],null);
         param5[6] = new PropertyWatcher("ps_charPreviewOptionBox",{"propertyChange":true},[param4[4],param4[5]],param2);
         param5[9] = new PropertyWatcher("height",{"heightChanged":true},[param4[5]],null);
         param5[7] = new PropertyWatcher("width",{"widthChanged":true},[param4[4]],null);
         param5[8].updateParent(param1);
         param5[5].updateParent(param1);
         param5[0].updateParent(param1);
         param5[0].addChild(param5[4]);
         param5[0].addChild(param5[3]);
         param5[0].addChild(param5[2]);
         param5[0].addChild(param5[1]);
         param5[6].updateParent(param1);
         param5[6].addChild(param5[9]);
         param5[6].addChild(param5[7]);
      }
   }
}
