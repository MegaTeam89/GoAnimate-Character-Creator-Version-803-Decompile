package anifire.models.creator
{
   public class CCActionModel
   {
       
      
      public var id:String;
      
      public var name:String;
      
      public var isMotion:Boolean;
      
      public var componentStates:Object;
      
      public var category:String;
      
      public var defaultFacialId:String;
      
      public var isLoop:Boolean;
      
      public var totalframe:Number;
      
      public var propXML:XMLList;
      
      public var nextActionId:String;
      
      public var enabled:Boolean;
      
      public function CCActionModel()
      {
         super();
         this.componentStates = {};
         this.enabled = true;
      }
      
      public function addComponent(param1:String, param2:String) : void
      {
         this.componentStates[param1] = param2;
      }
   }
}
