package anifire.managers
{
   import anifire.util.UtilSite;
   
   public class FeatureManager
   {
       
      
      public function FeatureManager()
      {
         super();
      }
      
      public static function get shouldActionPackBeShown() : Boolean
      {
         if(UtilSite.siteId == UtilSite.YOUTUBE)
         {
            return true;
         }
         return false;
      }
      
      public static function get shouldFacebookShareBeShown() : Boolean
      {
         if(UtilSite.siteId == UtilSite.YOUTUBE)
         {
            return false;
         }
         return true;
      }
   }
}
