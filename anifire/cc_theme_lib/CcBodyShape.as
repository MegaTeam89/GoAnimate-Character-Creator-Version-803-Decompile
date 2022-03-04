package anifire.cc_theme_lib
{
   import anifire.util.Util;
   import anifire.util.UtilHashArray;
   
   public class CcBodyShape
   {
      
      public static const XML_NODE_NAME:String = "bodyshape";
       
      
      private var _id:String;
      
      private var _name:String;
      
      private var _thumbnailActionId:String;
      
      private var _thumbnailFacialId:String;
      
      private var _thumbnailPath:String;
      
      private var _enable:Boolean;
      
      private var _shapeType:String;
      
      private var _components:UtilHashArray;
      
      private var _componentsByType:UtilHashArray;
      
      private var _actions:UtilHashArray;
      
      private var _themeId:String;
      
      private var _bodyType:String;
      
      private var _defaultCharXml:XMLList;
      
      private var _libraries:UtilHashArray;
      
      public function CcBodyShape()
      {
         this._components = new UtilHashArray();
         this._componentsByType = new UtilHashArray();
         this._actions = new UtilHashArray();
         this._libraries = new UtilHashArray();
         super();
      }
      
      public function get thumbnailPath() : String
      {
         return this._thumbnailPath;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get thumbnailActionId() : String
      {
         return this._thumbnailActionId;
      }
      
      public function get thumbnailFacialId() : String
      {
         return this._thumbnailFacialId;
      }
      
      public function get themeId() : String
      {
         return this._themeId;
      }
      
      public function get bodyType() : String
      {
         return this._bodyType;
      }
      
      public function getDefaultCharXml() : XML
      {
         var _loc1_:String = Util.getFlashVar().getValueByKey("ft");
         var _loc2_:Vector.<XML> = new Vector.<XML>();
         var _loc3_:int = 0;
         while(_loc3_ < this._defaultCharXml.length())
         {
            if(_loc1_ && _loc1_ == this._defaultCharXml[_loc3_].child("tag"))
            {
               _loc2_.push(this._defaultCharXml[_loc3_]);
            }
            _loc3_++;
         }
         if(_loc2_.length > 0)
         {
            return _loc2_[0];
         }
         return this._defaultCharXml[0];
      }
      
      public function getActionNum() : Number
      {
         return this._actions.length;
      }
      
      public function getLibraryNum() : Number
      {
         return this._libraries.length;
      }
      
      public function getActionByIndex(param1:int) : CcAction
      {
         return this._actions.getValueByIndex(param1) as CcAction;
      }
      
      public function getActionById(param1:String) : CcAction
      {
         return this._actions.getValueByKey(param1) as CcAction;
      }
      
      private function addAction(param1:CcAction) : void
      {
         this._actions.push(param1.id,param1);
      }
      
      public function getLibraryByIndex(param1:int) : CcLibrary
      {
         return this._libraries.getValueByIndex(param1) as CcLibrary;
      }
      
      public function getLibraryById(param1:String) : CcLibrary
      {
         return this._libraries.getValueByKey(param1) as CcLibrary;
      }
      
      private function addLibrary(param1:CcLibrary) : void
      {
         this._libraries.push(param1.type,param1);
      }
      
      private function addComponentThumb(param1:CcComponentThumb) : void
      {
         this._components.push(param1.internalId,param1);
         var _loc2_:UtilHashArray = this._componentsByType.getValueByKey(param1.type);
         if(_loc2_ == null)
         {
            _loc2_ = new UtilHashArray();
            this._componentsByType.push(param1.type,_loc2_);
         }
         _loc2_.push(param1.internalId,param1);
      }
      
      public function getComponentThumbByType(param1:String) : UtilHashArray
      {
         return this._componentsByType.getValueByKey(param1);
      }
      
      public function deserialize(param1:XML, param2:String, param3:CcTheme = null) : void
      {
         var _loc4_:XML = null;
         var _loc5_:XML = null;
         var _loc6_:CcComponentThumb = null;
         var _loc7_:CcAction = null;
         this._themeId = param2;
         this._id = param1.@id;
         this._name = param1.@name;
         this._thumbnailActionId = param1.@action_thumb;
         this._thumbnailFacialId = param1.@facial_thumb;
         this._thumbnailPath = param1.@thumb_path;
         this._bodyType = param1.@tag;
         this._enable = param1.@enable == "N" ? false : true;
         this._defaultCharXml = param1.child("default_char");
         for each(_loc5_ in param1.child(CcComponentThumb.XML_NODE_NAME))
         {
            (_loc6_ = new CcComponentThumb()).deSerialize(_loc5_,this.themeId,CcComponentThumb.PARENT_TYPE_BODYSHAPE,this.id);
            this.addComponentThumb(_loc6_);
            param3.addComponentThumb(_loc6_);
         }
         for each(_loc5_ in param1.child(CcAction.XML_NODE_NAME))
         {
            (_loc7_ = new CcAction()).deserialize(_loc5_);
            this.addAction(_loc7_);
         }
         for each(_loc4_ in param1.child(CcAction.PACK_XML_NODE_NAME))
         {
            if(_loc4_.@is_premium != "Y")
            {
               for each(_loc5_ in _loc4_.child(CcAction.XML_NODE_NAME))
               {
                  if(!(_loc5_.hasOwnProperty("@group") && _loc5_.@name != "1"))
                  {
                     (_loc7_ = new CcAction()).deserialize(_loc5_);
                     this.addAction(_loc7_);
                  }
               }
            }
         }
         for each(_loc5_ in param1.child(CcLibrary.XML_NODE_NAME))
         {
            (_loc6_ = new CcComponentThumb()).deSerialize(_loc5_,this.themeId,CcComponentThumb.PARENT_TYPE_BODYSHAPE,this.id);
            this.addComponentThumb(_loc6_);
            param3.addComponentThumb(_loc6_);
         }
      }
   }
}
