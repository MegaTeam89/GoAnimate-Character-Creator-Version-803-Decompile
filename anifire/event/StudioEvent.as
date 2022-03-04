package anifire.event
{
   import flash.events.Event;
   
   public class StudioEvent extends Event
   {
      
      public static const BODY_MODEL_COMPLETE:String = "bodyModelComplete";
      
      public static const LOAD_THEME_ERROR:String = "loadThemeError";
      
      public static const UPGRADE_PENDING:String = "upgradePending";
      
      public static const UPGRADE_COMPLETE:String = "upgradeComplete";
      
      public static const UPGRADE_ERROR:String = "upgradeError";
       
      
      public function StudioEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
