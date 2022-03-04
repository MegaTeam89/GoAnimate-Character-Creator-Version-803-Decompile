package anifire.event
{
   public class CcCoreEvent extends ExtraDataEvent
   {
      
      public static const LOAD_THEME_COMPLETE:String = "load_theme_complete";
      
      public static const LOAD_EXISTING_CHAR_COMPLETE:String = "load_existing_char_complete";
      
      public static const LOAD_PRE_MADE_CHARACTER_COMPLETE:String = "load_pre_made_character_complete";
      
      public static const LOAD_CHARACTER_THUMB_COMPLETE:String = "load_char_thumb_complete";
      
      public static const LOAD_CHARACTER_THUMB_ALL_COMPLETE:String = "load_char_thumb_all_complete";
      
      public static const LOAD_EVERYTHING_COMPLETE:String = "load_all_complete";
      
      public static const USER_WANT_TO_HIDE_WELCOMESCREEN:String = "user_want_to_hide_welcomescreen";
      
      public static const USER_WANT_TO_SAVE:String = "user_want_to_save";
      
      public static const USER_WANT_TO_CONFIRM:String = "user_want_to_confirm";
      
      public static const USER_WANT_TO_PREVIEW:String = "user_want_to_preview";
      
      public static const USER_WANT_TO_CANCEL:String = "user_want_to_cancel";
      
      public static const USER_WANT_TO_SIGNUP:String = "user_want_to_signup";
      
      public static const USER_WANT_TO_SUBSCRIBE:String = "user_want_to_subscribe";
      
      public static const USER_WANT_TO_GO_TO_STUDIO:String = "user_want_to_go_to_studio";
      
      public static const USER_WANT_TO_LEARN_ACTION:String = "user_want_to_learn_action";
      
      public static const USER_WANT_TO_START:String = "user_want_to_start";
      
      public static const USER_WANT_TO_GO_TO_CHAR_CREATOR:String = "user_want_to_go_to_char_creator";
      
      public static const USER_WANT_TO_KNOW_HIS_MONEY_STATUS:String = "user_want_to_know_his_money_status";
      
      public static const USER_WANT_TO_LEARN_MORE:String = "user_want_to_learn_more";
      
      public static const USER_WANT_TO_BUY_GOPOINTS:String = "user_want_to_buy_gopoint";
      
      public static const USER_WANT_TO_BUY_POINT:String = "user_want_to_buy_point";
      
      public static const USER_WANT_TO_REFRESH:String = "user_want_to_refresh";
      
      public static const SHOW_FACEBOOK_SHARER:String = "show_fb_sharer";
       
      
      public function CcCoreEvent(param1:String, param2:Object, param3:Object = null, param4:Boolean = false, param5:Boolean = false)
      {
         super(param1,param2,param3,param4,param5);
      }
   }
}
