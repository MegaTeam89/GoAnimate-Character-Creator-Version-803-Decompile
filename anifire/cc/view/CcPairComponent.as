package anifire.cc.view
{
   import anifire.cc.interfaces.ICcPairComponent;
   import anifire.constant.CcLibConstant;
   import anifire.util.UtilErrorLogger;
   import flash.display.DisplayObjectContainer;
   import flash.display.LoaderInfo;
   
   public class CcPairComponent extends CcComponent
   {
       
      
      private var _leftSide:DisplayObjectContainer;
      
      private var _rightSide:DisplayObjectContainer;
      
      public function CcPairComponent()
      {
         super();
      }
      
      public function get leftSide() : DisplayObjectContainer
      {
         return this._leftSide;
      }
      
      public function get rightSide() : DisplayObjectContainer
      {
         return this._rightSide;
      }
      
      override protected function addLoader() : void
      {
         if(this.model is ICcPairComponent)
         {
            if(ICcPairComponent(model).split)
            {
               this._leftSide = this.addDefinition(loader.contentLoaderInfo,this.name + CcLibConstant.LIB_LEFT);
               this._rightSide = this.addDefinition(loader.contentLoaderInfo,this.name + CcLibConstant.LIB_RIGHT);
            }
            else
            {
               this._leftSide = this._rightSide = this.addDefinition(loader.contentLoaderInfo,this.name);
            }
         }
         if(this._leftSide && this._rightSide)
         {
            this.addChild(this._leftSide);
            this.addChild(this._rightSide);
         }
      }
      
      override protected function setProperties() : void
      {
         if(this.model)
         {
            if(this._leftSide)
            {
               this._leftSide.x = this.model.x;
               this._leftSide.y = this.model.y;
               if(this._leftSide.numChildren > 0)
               {
                  this._leftSide.getChildAt(0).scaleX = this.model.xscale;
                  this._leftSide.getChildAt(0).scaleY = this.model.yscale;
                  this._leftSide.getChildAt(0).rotation = -this.model.rotation;
               }
            }
            if(this._rightSide)
            {
               this._rightSide.x = this.model.x;
               this._rightSide.y = this.model.y;
               if(this._rightSide.numChildren > 0)
               {
                  this._rightSide.getChildAt(0).scaleX = this.model.xscale;
                  this._rightSide.getChildAt(0).scaleY = this.model.yscale;
                  this._rightSide.getChildAt(0).rotation = this.model.rotation;
               }
            }
            if(this.model is ICcPairComponent)
            {
               if(this._leftSide)
               {
                  this._leftSide.x += ICcPairComponent(model).offset / 2;
               }
               if(this._rightSide)
               {
                  this._rightSide.x -= ICcPairComponent(model).offset / 2;
               }
            }
         }
      }
      
      protected function addDefinition(param1:LoaderInfo, param2:String) : DisplayObjectContainer
      {
         var definition:Class = null;
         var mc:DisplayObjectContainer = null;
         var loaderinfo:LoaderInfo = param1;
         var className:String = param2;
         try
         {
            definition = loaderinfo.applicationDomain.getDefinition(className) as Class;
            if(definition)
            {
               mc = new definition();
               mc.name = className;
               return mc;
            }
         }
         catch(e:ReferenceError)
         {
         }
         catch(e:Error)
         {
            UtilErrorLogger.getInstance().appendCustomError("CcPairComponent:addDefinition",e);
         }
         return null;
      }
   }
}
