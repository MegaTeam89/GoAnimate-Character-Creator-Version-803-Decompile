package anifire.cc_interface
{
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public interface IPurchaseBox extends IEventDispatcher
   {
       
      
      function get loggedIn() : Boolean;
      
      function set loggedIn(param1:Boolean) : void;
      
      function get premiumMode() : Boolean;
      
      function set premiumMode(param1:Boolean) : void;
      
      function get hasEnoughPoints() : Boolean;
      
      function set hasEnoughPoints(param1:Boolean) : void;
      
      function get hasEnoughBucks() : Boolean;
      
      function set hasEnoughBucks(param1:Boolean) : void;
      
      function set locked(param1:Boolean) : void;
      
      function set userCannotSave(param1:Boolean) : void;
      
      function showUnableToSaveMsg(param1:String) : void;
      
      function updateButtonText(param1:int) : void;
      
      function dispatchUserWantToSubscribe(param1:Event = null) : void;
   }
}
