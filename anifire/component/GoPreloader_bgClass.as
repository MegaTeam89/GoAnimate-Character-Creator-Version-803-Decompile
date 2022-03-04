package anifire.component
{
   import flash.utils.ByteArray;
   import mx.core.MovieClipLoaderAsset;
   
   public class GoPreloader_bgClass extends MovieClipLoaderAsset
   {
      
      private static var bytes:ByteArray = null;
       
      
      public var dataClass:Class;
      
      public function GoPreloader_bgClass()
      {
         this.dataClass = GoPreloader_bgClass_dataClass;
         super();
         initialWidth = 11000 / 20;
         initialHeight = 7200 / 20;
      }
      
      override public function get movieClipData() : ByteArray
      {
         if(bytes == null)
         {
            bytes = ByteArray(new this.dataClass());
         }
         return bytes;
      }
   }
}
