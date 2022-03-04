package anifire.cc_interface
{
   import anifire.components.char_editor.BodyShapeChooser;
   import anifire.components.char_editor.BodyShapeMegaChooser;
   import anifire.components.char_editor.ButtonBar;
   import anifire.components.char_editor.CcColorPicker;
   import anifire.components.char_editor.CcThumbPropertyInspector;
   import anifire.components.char_editor.CharPreviewer;
   import anifire.components.char_editor.CharScaleChooser;
   import anifire.components.char_editor.ClothesChooser;
   import anifire.components.char_editor.ComponentThumbChooser;
   import anifire.components.char_editor.ComponentTypeChooser;
   import anifire.components.char_editor.SelectedDecoration;
   import anifire.components.char_editor.StatusPanel;
   import mx.containers.Canvas;
   import mx.containers.ViewStack;
   
   public interface ICcCharEditorContainer
   {
       
      
      function get ui_ce_componentTypeChooser() : ComponentTypeChooser;
      
      function get ui_ce_charPreviewer() : CharPreviewer;
      
      function get ui_ce_colorPicker() : CcColorPicker;
      
      function get ui_ce_buttonBar() : ButtonBar;
      
      function get ui_ce_statusPanel() : StatusPanel;
      
      function get ui_ce_componentChooserViewStack() : ViewStack;
      
      function get ui_ce_componentThumbChooser() : ComponentThumbChooser;
      
      function get ui_ce_bodyShapeMegaChooser() : BodyShapeMegaChooser;
      
      function get ui_ce_bodyShapeChooser() : BodyShapeChooser;
      
      function get ui_ce_thumbPropertyInspector() : CcThumbPropertyInspector;
      
      function get ui_ce_selectedDecoration() : SelectedDecoration;
      
      function get ui_ce_mainViewStack() : ViewStack;
      
      function get ui_ce_mainEditorComponentsContainer() : Canvas;
      
      function get ui_ce_clothesChooser() : ClothesChooser;
      
      function get ui_ce_charScaleChooser() : CharScaleChooser;
   }
}
