package
{
   import flash.net.getClassByAlias;
   import flash.net.registerClassAlias;
   import flash.system.Capabilities;
   import mx.accessibility.AlertAccImpl;
   import mx.accessibility.ButtonAccImpl;
   import mx.accessibility.ColorPickerAccImpl;
   import mx.accessibility.ComboBaseAccImpl;
   import mx.accessibility.ComboBoxAccImpl;
   import mx.accessibility.LabelAccImpl;
   import mx.accessibility.ListAccImpl;
   import mx.accessibility.ListBaseAccImpl;
   import mx.accessibility.PanelAccImpl;
   import mx.accessibility.SliderAccImpl;
   import mx.accessibility.TabBarAccImpl;
   import mx.accessibility.UIComponentAccProps;
   import mx.collections.ArrayCollection;
   import mx.collections.ArrayList;
   import mx.core.IFlexModuleFactory;
   import mx.core.mx_internal;
   import mx.effects.EffectManager;
   import mx.managers.systemClasses.ChildManager;
   import mx.styles.IStyleManager2;
   import mx.styles.StyleManagerImpl;
   import mx.utils.ObjectProxy;
   import spark.accessibility.TextBaseAccImpl;
   
   public class _cc_FlexInit
   {
       
      
      public function _cc_FlexInit()
      {
         super();
      }
      
      public static function init(param1:IFlexModuleFactory) : void
      {
         var styleManager:IStyleManager2 = null;
         var fbs:IFlexModuleFactory = param1;
         new ChildManager(fbs);
         styleManager = new StyleManagerImpl(fbs);
         EffectManager.mx_internal::registerEffectTrigger("addedEffect","added");
         EffectManager.mx_internal::registerEffectTrigger("completeEffect","complete");
         EffectManager.mx_internal::registerEffectTrigger("creationCompleteEffect","creationComplete");
         EffectManager.mx_internal::registerEffectTrigger("focusInEffect","focusIn");
         EffectManager.mx_internal::registerEffectTrigger("focusOutEffect","focusOut");
         EffectManager.mx_internal::registerEffectTrigger("hideEffect","hide");
         EffectManager.mx_internal::registerEffectTrigger("itemsChangeEffect","itemsChange");
         EffectManager.mx_internal::registerEffectTrigger("mouseDownEffect","mouseDown");
         EffectManager.mx_internal::registerEffectTrigger("mouseUpEffect","mouseUp");
         EffectManager.mx_internal::registerEffectTrigger("moveEffect","move");
         EffectManager.mx_internal::registerEffectTrigger("removedEffect","removed");
         EffectManager.mx_internal::registerEffectTrigger("resizeEffect","resize");
         EffectManager.mx_internal::registerEffectTrigger("resizeEndEffect","resizeEnd");
         EffectManager.mx_internal::registerEffectTrigger("resizeStartEffect","resizeStart");
         EffectManager.mx_internal::registerEffectTrigger("rollOutEffect","rollOut");
         EffectManager.mx_internal::registerEffectTrigger("rollOverEffect","rollOver");
         EffectManager.mx_internal::registerEffectTrigger("showEffect","show");
         if(Capabilities.hasAccessibility)
         {
            ComboBoxAccImpl.enableAccessibility();
            ColorPickerAccImpl.enableAccessibility();
            PanelAccImpl.enableAccessibility();
            TabBarAccImpl.enableAccessibility();
            ListBaseAccImpl.enableAccessibility();
            ListAccImpl.enableAccessibility();
            AlertAccImpl.enableAccessibility();
            LabelAccImpl.enableAccessibility();
            TextBaseAccImpl.enableAccessibility();
            SliderAccImpl.enableAccessibility();
            ButtonAccImpl.enableAccessibility();
            UIComponentAccProps.enableAccessibility();
            ComboBaseAccImpl.enableAccessibility();
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ArrayCollection") != ArrayCollection)
            {
               registerClassAlias("flex.messaging.io.ArrayCollection",ArrayCollection);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ArrayCollection",ArrayCollection);
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ArrayList") != ArrayList)
            {
               registerClassAlias("flex.messaging.io.ArrayList",ArrayList);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ArrayList",ArrayList);
         }
         try
         {
            if(getClassByAlias("flex.messaging.io.ObjectProxy") != ObjectProxy)
            {
               registerClassAlias("flex.messaging.io.ObjectProxy",ObjectProxy);
            }
         }
         catch(e:Error)
         {
            registerClassAlias("flex.messaging.io.ObjectProxy",ObjectProxy);
         }
         var styleNames:Array = ["lineHeight","unfocusedTextSelectionColor","highlightColor","kerning","iconColor","showErrorSkin","textRollOverColor","digitCase","shadowCapColor","inactiveTextSelectionColor","listAutoPadding","justificationRule","textDecoration","showErrorTip","dominantBaseline","fontThickness","trackingRight","textShadowColor","blockProgression","leadingModel","selectionDisabledColor","listStylePosition","textAlignLast","textShadowAlpha","textAlpha","letterSpacing","chromeColor","rollOverColor","fontSize","shadowColor","baselineShift","focusedTextSelectionColor","paragraphEndIndent","fontWeight","breakOpportunity","leading","renderingMode","symbolColor","fontSharpness","barColor","modalTransparencyDuration","paragraphStartIndent","justificationStyle","layoutDirection","footerColors","wordSpacing","listStyleType","contentBackgroundColor","paragraphSpaceAfter","contentBackgroundAlpha","textRotation","fontAntiAliasType","cffHinting","direction","errorColor","locale","digitWidth","backgroundDisabledColor","modalTransparencyColor","ligatureLevel","touchDelay","firstBaselineOffset","textIndent","clearFloats","themeColor","tabStops","fontLookup","modalTransparency","paragraphSpaceBefore","headerColors","textAlign","fontFamily","textSelectedColor","lineThrough","interactionMode","whiteSpaceCollapse","fontGridFitType","alignmentBaseline","trackingLeft","fontStyle","dropShadowColor","accentColor","disabledColor","selectionColor","dropdownBorderColor","disabledIconColor","modalTransparencyBlur","downColor","textJustify","focusColor","color","alternatingItemColors","typographicCase"];
         var i:int = 0;
         while(i < styleNames.length)
         {
            styleManager.registerInheritingStyle(styleNames[i]);
            i++;
         }
      }
   }
}
