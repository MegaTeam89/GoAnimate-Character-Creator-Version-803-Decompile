package anifire.config
{
   import anifire.cc_interface.IConfiguration;
   import anifire.cc_theme_lib.CcComponentThumb;
   import anifire.util.ComponentThumbFilter;
   import anifire.util.Util;
   import anifire.util.UtilHashArray;
   import flash.external.ExternalInterface;
   
   public class YouTube implements IConfiguration
   {
       
      
      public function YouTube()
      {
         super();
      }
      
      private static function goTagFilter(param1:CcComponentThumb) : Boolean
      {
         var _loc2_:UtilHashArray = Util.getFlashVar();
         var _loc3_:int = parseInt(_loc2_.getValueByKey("ut"));
         var _loc4_:String = _loc2_.getValueByKey("siteId");
         var _loc5_:String = _loc2_.getValueByKey("userId");
         var _loc6_:String = _loc2_.getValueByKey("ft");
         return _loc3_ >= 60 || param1.hasTag("_userrole_admin") && _loc4_ == "go" && _loc5_ == "05tTaNSLLJ8A" || !param1.hasTag("_userrole_admin") && (param1.hasTag("_goplus") && _loc3_ >= 20 || !param1.hasTag("_goplus")) && (!_loc6_ || param1.hasTag(_loc6_));
      }
      
      public function scalingCharacterEnabled() : Boolean
      {
         return true;
      }
      
      public function templateSelectorEnabled() : Boolean
      {
         return true;
      }
      
      public function loadPreMadeCharsEnabled() : Boolean
      {
         return true;
      }
      
      public function goPointsEnabled() : Boolean
      {
         return false;
      }
      
      public function toAddGoBucks() : void
      {
         ExternalInterface.call("popBuyBucks");
      }
      
      public function get defaultThumbFilter() : ComponentThumbFilter
      {
         var _loc1_:ComponentThumbFilter = new ComponentThumbFilter();
         _loc1_.filter = goTagFilter;
         return _loc1_;
      }
   }
}
