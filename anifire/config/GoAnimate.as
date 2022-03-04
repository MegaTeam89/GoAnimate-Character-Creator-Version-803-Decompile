package anifire.config
{
   import anifire.cc_interface.IConfiguration;
   import anifire.cc_theme_lib.CcComponentThumb;
   import anifire.constant.ServerConstants;
   import anifire.constant.ThemeConstants;
   import anifire.util.ComponentThumbFilter;
   import anifire.util.Util;
   import anifire.util.UtilHashArray;
   import anifire.util.UtilUser;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class GoAnimate implements IConfiguration
   {
       
      
      public function GoAnimate()
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
         if(Util.getFlashVar().getValueByKey(ServerConstants.PARAM_THEME_ID) == ThemeConstants.ANIME_THEME_ID)
         {
            if(UtilUser.hasAdminFeatures)
            {
               return true;
            }
            return false;
         }
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
         return true;
      }
      
      public function toAddGoBucks() : void
      {
         navigateToURL(new URLRequest(ServerConstants.ACTION_BUY_BUCKS),ServerConstants.POPUP_WINDOW_NAME);
      }
      
      public function get defaultThumbFilter() : ComponentThumbFilter
      {
         var _loc1_:ComponentThumbFilter = new ComponentThumbFilter();
         _loc1_.filter = goTagFilter;
         return _loc1_;
      }
   }
}
