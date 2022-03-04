package anifire.cc_interface
{
   import anifire.util.ComponentThumbFilter;
   
   public interface IConfiguration
   {
       
      
      function goPointsEnabled() : Boolean;
      
      function toAddGoBucks() : void;
      
      function scalingCharacterEnabled() : Boolean;
      
      function templateSelectorEnabled() : Boolean;
      
      function loadPreMadeCharsEnabled() : Boolean;
      
      function get defaultThumbFilter() : ComponentThumbFilter;
   }
}
