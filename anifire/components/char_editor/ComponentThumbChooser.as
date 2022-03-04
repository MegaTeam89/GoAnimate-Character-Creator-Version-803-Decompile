package anifire.components.char_editor
{
   import anifire.cc_theme_lib.CcCharacter;
   import anifire.cc_theme_lib.CcComponentThumb;
   import anifire.cc_theme_lib.CcTheme;
   import anifire.constant.CcLibConstant;
   import anifire.event.CcComponentThumbChooserEvent;
   import anifire.event.CcComponentThumbnailMouseEvent;
   import anifire.util.ComponentThumbFilter;
   import anifire.util.UtilHashArray;
   import caurina.transitions.Tweener;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import mx.containers.Canvas;
   import mx.containers.HBox;
   import mx.containers.Tile;
   import mx.controls.Button;
   import mx.core.IFlexModuleFactory;
   import mx.core.UIComponentDescriptor;
   import mx.events.FlexEvent;
   import mx.events.PropertyChangeEvent;
   
   public class ComponentThumbChooser extends Canvas
   {
      
      private static const EVENT_TAG_FILTER_CHANGED:String = "evt_tag_changed";
      
      public static const THUMB_INIT:String = "Init";
      
      public static const THUMB_OVER:String = "Over";
       
      
      private var _55416058leftBut:Button;
      
      private var _1436107067rightBut:Button;
      
      private var _1049247517thumbnailOverlayContainer:Canvas;
      
      private var _1825292730thumbnailTile:Tile;
      
      private var _documentDescriptor_:UIComponentDescriptor;
      
      private var __moduleFactoryInitialized:Boolean = false;
      
      private var componentThumbs:UtilHashArray;
      
      private var componentType:String;
      
      private var currentPageNum:int = 0;
      
      private var moneyMode:int;
      
      private var timeoutId:int = -1;
      
      private var _biggerHeight:Number;
      
      private var _smallerHeight:Number;
      
      private var _filter:ComponentThumbFilter = null;
      
      private var _filteredThumbs:UtilHashArray;
      
      private const DELAY_BETWEEN_LOADING_EACH_THUMB:Number = 200;
      
      public function ComponentThumbChooser()
      {
         this._documentDescriptor_ = new UIComponentDescriptor({
            "type":Canvas,
            "propertiesFactory":function():Object
            {
               return {"childDescriptors":[new UIComponentDescriptor({
                  "type":HBox,
                  "stylesFactory":function():void
                  {
                     this.verticalAlign = "middle";
                  },
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "childDescriptors":[new UIComponentDescriptor({
                           "type":Button,
                           "id":"leftBut",
                           "events":{"click":"__leftBut_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "buttonMode":true,
                                 "styleName":"btnThumbChooserLeft"
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Tile,
                           "id":"thumbnailTile",
                           "events":{"creationComplete":"__thumbnailTile_creationComplete"},
                           "stylesFactory":function():void
                           {
                              this.verticalAlign = "middle";
                           },
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "direction":"horizontal",
                                 "percentWidth":100,
                                 "percentHeight":100
                              };
                           }
                        }),new UIComponentDescriptor({
                           "type":Button,
                           "id":"rightBut",
                           "events":{"click":"__rightBut_click"},
                           "propertiesFactory":function():Object
                           {
                              return {
                                 "buttonMode":true,
                                 "styleName":"btnThumbChooserRight"
                              };
                           }
                        })]
                     };
                  }
               }),new UIComponentDescriptor({
                  "type":Canvas,
                  "id":"thumbnailOverlayContainer",
                  "propertiesFactory":function():Object
                  {
                     return {
                        "percentWidth":100,
                        "percentHeight":100,
                        "horizontalScrollPolicy":"off",
                        "verticalScrollPolicy":"off",
                        "clipContent":false
                     };
                  }
               })]};
            }
         });
         super();
         mx_internal::_document = this;
      }
      
      override public function set moduleFactory(param1:IFlexModuleFactory) : void
      {
         super.moduleFactory = param1;
         if(this.__moduleFactoryInitialized)
         {
            return;
         }
         this.__moduleFactoryInitialized = true;
      }
      
      override public function initialize() : void
      {
         mx_internal::setDocumentDescriptor(this._documentDescriptor_);
         super.initialize();
      }
      
      private function initTagFilter() : void
      {
         this.addEventListener(EVENT_TAG_FILTER_CHANGED,function(param1:Event):void
         {
            var _loc2_:UtilHashArray = new UtilHashArray();
            var _loc3_:int = 0;
            while(_loc3_ < componentThumbs.length)
            {
               if(!_filter || _filter.filter(componentThumbs.getValueByIndex(_loc3_) as CcComponentThumb))
               {
                  _loc2_.push(componentThumbs.getKey(_loc3_),componentThumbs.getValueByIndex(_loc3_));
               }
               _loc3_++;
            }
            _filteredThumbs = _loc2_;
            var _loc4_:int = calculateTileColNum() * calculateTileRowNum();
            if(_filteredThumbs.length + (!!CcLibConstant.OPTIONAL_COMPONENTS.containsKey(componentType) ? 1 : 0) <= _loc4_)
            {
               leftBut.alpha = 0;
               rightBut.alpha = 0;
            }
            else
            {
               leftBut.alpha = 1;
               rightBut.alpha = 1;
            }
            initPage(0);
         });
      }
      
      public function set thumbFilter(param1:ComponentThumbFilter) : void
      {
         var _loc2_:* = this._filter != param1;
         this._filter = param1;
         if(_loc2_)
         {
            this.dispatchEvent(new Event(EVENT_TAG_FILTER_CHANGED));
         }
      }
      
      public function set biggerHeight(param1:Number) : void
      {
         this._biggerHeight = param1;
      }
      
      public function set smallerHeight(param1:Number) : void
      {
         this._smallerHeight = param1;
      }
      
      public function init(param1:CcCharacter, param2:CcTheme, param3:String, param4:int, param5:Boolean) : void
      {
         var item:Object = null;
         var ccChar:CcCharacter = param1;
         var ccTheme:CcTheme = param2;
         var componentType:String = param3;
         var moneyMode:int = param4;
         var shouldUseBiggerHeight:Boolean = param5;
         this.doClearTimeOut();
         this.thumbnailTile.removeAllChildren();
         if(shouldUseBiggerHeight)
         {
            this.height = this._biggerHeight;
            this.thumbnailTile.height = this._biggerHeight;
         }
         else
         {
            this.height = this._smallerHeight;
            this.thumbnailTile.height = this._smallerHeight;
         }
         this.initTile();
         this.componentType = componentType;
         this.moneyMode = moneyMode;
         if(CcLibConstant.USER_CHOOSE_ABLE_HEAD_COMPONENT_TYPES.indexOf(componentType) >= 0)
         {
            this.componentThumbs = ccTheme.getComponentThumbByType(componentType);
         }
         else if(CcLibConstant.USER_CHOOSE_ABLE_BODY_COMPONENT_TYPES.indexOf(componentType) >= 0)
         {
            this.componentThumbs = ccChar.bodyShape.getComponentThumbByType(componentType);
         }
         if(this.componentThumbs == null)
         {
            this.componentThumbs = new UtilHashArray();
         }
         this.initTagFilter();
         var _componentThumbs:Array = [];
         var enabledComponentThumbs:UtilHashArray = new UtilHashArray();
         var i:int = 0;
         while(i < this.componentThumbs.length)
         {
            if((this.componentThumbs.getValueByIndex(i) as CcComponentThumb).enable)
            {
               if(!this._filter || this._filter.filter(this.componentThumbs.getValueByIndex(i) as CcComponentThumb))
               {
                  _componentThumbs.push({
                     "key":this.componentThumbs.getKey(i),
                     "data":this.componentThumbs.getValueByIndex(i),
                     "order":i
                  });
               }
            }
            i++;
         }
         _componentThumbs.sort(function(param1:Object, param2:Object):Number
         {
            var _loc3_:int = (param1.data as CcComponentThumb).displayOrder - (param2.data as CcComponentThumb).displayOrder;
            return _loc3_ == 0 ? Number(param1.order - param2.order) : Number(_loc3_);
         });
         for each(item in _componentThumbs)
         {
            enabledComponentThumbs.push(item.key,item.data);
         }
         this.componentThumbs = enabledComponentThumbs;
         _componentThumbs = null;
         this.dispatchEvent(new Event(EVENT_TAG_FILTER_CHANGED));
      }
      
      private function initPage(param1:int) : void
      {
         var _loc2_:int = 0;
         this.doClearTimeOut();
         this.currentPageNum = param1;
         this.thumbnailOverlayContainer.removeAllChildren();
         this.thumbnailTile.removeAllChildren();
         var _loc3_:Boolean = CcLibConstant.OPTIONAL_COMPONENTS.containsKey(this.componentType);
         if(this.currentPageNum == 0 && _loc3_)
         {
            this.addThumbnail(null,this.componentType);
         }
         var _loc4_:int = this.calculateTileColNum() * this.calculateTileRowNum();
         var _loc5_:int;
         var _loc6_:int = (_loc5_ = this.currentPageNum * _loc4_ - (!!_loc3_ ? 1 : 0)) + _loc4_ - 1;
         _loc5_ = Math.max(_loc5_,0);
         this.leftBut.enabled = _loc5_ > 0 ? true : false;
         this.rightBut.enabled = _loc6_ < this._filteredThumbs.length - 1 ? true : false;
         this.timeoutId = setTimeout(this.doAddThumbnail,this.DELAY_BETWEEN_LOADING_EACH_THUMB,_loc5_,_loc6_,this._filteredThumbs);
      }
      
      private function doClearTimeOut() : void
      {
         if(this.timeoutId >= 0)
         {
            clearTimeout(this.timeoutId);
         }
         this.timeoutId = -1;
      }
      
      private function doAddThumbnail(param1:int, param2:int, param3:UtilHashArray) : void
      {
         var _loc5_:CcComponentThumb = null;
         var _loc4_:int = param1;
         while(_loc4_ < param3.length && _loc4_ <= param2)
         {
            _loc5_ = param3.getValueByIndex(_loc4_) as CcComponentThumb;
            this.addThumbnail(_loc5_,this.componentType);
            _loc4_++;
         }
      }
      
      private function getThumbnailStyleName(param1:CcComponentThumb, param2:String) : String
      {
         var _loc3_:String = null;
         if(param1 == null)
         {
            _loc3_ = "Free";
         }
         else if(param1.money > 0)
         {
            _loc3_ = "Bucks";
         }
         else if(param1.sharingPoint > 0)
         {
            _loc3_ = "Points";
         }
         else
         {
            _loc3_ = "Free";
         }
         if(param2 != THUMB_INIT && param2 != THUMB_OVER)
         {
            param2 = THUMB_INIT;
         }
         return ["bgComponentThumb",_loc3_,param2].join("");
      }
      
      private function addThumbnail(param1:CcComponentThumb, param2:String) : void
      {
         var _loc5_:String = null;
         var _loc3_:CcComponentThumbThumbnail = new CcComponentThumbThumbnail();
         var _loc4_:CcComponentThumbDetailThumbnail = new CcComponentThumbDetailThumbnail();
         if(param1 != null)
         {
            _loc3_.init(_loc4_,CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_WIDTH,CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_HEIGHT,param1,this.getThumbnailStyleName(param1,THUMB_INIT));
         }
         else
         {
            _loc3_.initNullThumbnail(_loc4_,CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_WIDTH,CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_HEIGHT,param2,"bgComponentNullThumb");
         }
         _loc3_.addEventListener(MouseEvent.MOUSE_DOWN,this.onThumbDown);
         _loc3_.addEventListener(MouseEvent.MOUSE_OVER,this.onThumbMouseOver);
         _loc3_.buttonMode = true;
         this.thumbnailTile.addChild(_loc3_);
         if(param1 != null)
         {
            _loc5_ = this.moneyMode != CcLibConstant.MONEY_MODE_SCHOOL ? this.getThumbnailStyleName(param1,THUMB_OVER) : "bgComponentNullThumbDetail";
            _loc4_.init(_loc3_,CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_WIDTH,CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_HEIGHT,_loc3_.componentThumb,_loc5_,this.moneyMode);
         }
         else
         {
            _loc4_.initNullThumbnail(_loc3_,CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_WIDTH,CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_HEIGHT,param2,"bgComponentNullThumbDetail",this.moneyMode);
         }
         _loc4_.x = _loc3_.x;
         _loc4_.y = _loc3_.y;
         _loc4_.clipContent = false;
         _loc4_.visible = false;
         this.thumbnailOverlayContainer.addChild(_loc4_);
      }
      
      private function onThumbMouseOver(param1:Event) : void
      {
         var _loc2_:CcComponentThumbThumbnail = param1.currentTarget as CcComponentThumbThumbnail;
         this.addThumbnailOverlay(_loc2_);
      }
      
      private function onThumbMouseOut(param1:Event) : void
      {
         var _loc2_:CcComponentThumbDetailThumbnail = param1.currentTarget as CcComponentThumbDetailThumbnail;
         this.removeThumbnailOverlay(_loc2_);
      }
      
      private function addThumbnailOverlay(param1:CcComponentThumbThumbnail) : void
      {
         var _loc2_:CcComponentThumbDetailThumbnail = param1.componentThumbDetailThumbnail;
         _loc2_.addEventListener(MouseEvent.MOUSE_DOWN,this.onThumbDown);
         _loc2_.addEventListener(CcComponentThumbnailMouseEvent.MOUSE_REALLY_OUT,this.onThumbMouseOut);
         _loc2_.startMouseOutChecking(this.stage);
         _loc2_.buttonMode = true;
         this.thumbnailOverlayContainer.addChild(_loc2_);
         var _loc3_:Point = this.thumbnailOverlayContainer.globalToLocal(this.thumbnailTile.localToGlobal(new Point(param1.x,param1.y)));
         _loc2_.x = _loc3_.x;
         _loc2_.y = _loc3_.y;
         if(this.moneyMode != CcLibConstant.MONEY_MODE_SCHOOL)
         {
            _loc2_.setBgStyleName(this.getThumbnailStyleName(_loc2_.componentThumb,THUMB_OVER));
         }
         else
         {
            _loc2_.setBgStyleName("bgComponentNullThumbDetail");
         }
         _loc2_.visible = true;
         _loc2_.showGoBuck(true);
         this.playOverEffect(_loc2_,false);
      }
      
      private function removeThumbnailOverlay(param1:CcComponentThumbDetailThumbnail) : void
      {
         param1.removeEventListener(MouseEvent.MOUSE_DOWN,this.onThumbDown);
         param1.removeEventListener(CcComponentThumbnailMouseEvent.MOUSE_REALLY_OUT,this.onThumbMouseOut);
         this.playOverEffect(param1,true);
      }
      
      private function onThumbDown(param1:Event) : void
      {
         var _loc3_:CcComponentThumbChooserEvent = null;
         var _loc2_:CcComponentThumbDetailThumbnail = param1.currentTarget as CcComponentThumbDetailThumbnail;
         if(!_loc2_.isNullThumbnail)
         {
            _loc3_ = new CcComponentThumbChooserEvent(CcComponentThumbChooserEvent.COMPONENT_THUMB_CHOSEN,this);
            _loc3_.componentThumb = _loc2_.componentThumb;
            this.dispatchEvent(_loc3_);
         }
         else
         {
            _loc3_ = new CcComponentThumbChooserEvent(CcComponentThumbChooserEvent.NONE_COMPONENT_THUMB_CHOSEN,this);
            _loc3_.noneComponentThumbType = _loc2_.componentType;
            this.dispatchEvent(_loc3_);
         }
      }
      
      private function playOverEffect(param1:CcComponentThumbDetailThumbnail, param2:Boolean) : void
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Point = this.thumbnailOverlayContainer.globalToLocal(this.thumbnailTile.localToGlobal(new Point(param1.ccComponentThumbThumbnail.x,param1.ccComponentThumbThumbnail.y)));
         if(!param2)
         {
            _loc3_ = _loc7_.x + CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_WIDTH * (1 - CcLibConstant.COMPONENT_THUMB_CHOOSER_BIGGER_THUMBNAIL_ENLARGE_RATIO) / 2;
            _loc4_ = _loc7_.y + CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_HEIGHT * (1 - CcLibConstant.COMPONENT_THUMB_CHOOSER_BIGGER_THUMBNAIL_ENLARGE_RATIO) / 2;
            _loc5_ = CcLibConstant.COMPONENT_THUMB_CHOOSER_BIGGER_THUMBNAIL_ENLARGE_RATIO;
            _loc6_ = CcLibConstant.COMPONENT_THUMB_CHOOSER_BIGGER_THUMBNAIL_ENLARGE_RATIO;
         }
         else
         {
            _loc3_ = _loc7_.x;
            _loc4_ = _loc7_.y;
            _loc5_ = 1;
            _loc6_ = 1;
         }
         if(!param2)
         {
            Tweener.addTween(param1,{
               "x":_loc3_,
               "y":_loc4_,
               "scaleX":_loc5_,
               "scaleY":_loc6_,
               "delay":0,
               "time":0.7,
               "transition":"easeOutBounce"
            });
         }
         else
         {
            Tweener.addTween(param1,{
               "x":_loc3_,
               "y":_loc4_,
               "scaleX":_loc5_,
               "scaleY":_loc6_,
               "delay":0,
               "time":0.4,
               "transition":"easeOutBounce",
               "onComplete":this.doRemoveThumbnailOverlayFromStage,
               "onCompleteParams":[param1]
            });
         }
      }
      
      private function doRemoveThumbnailOverlayFromStage(param1:CcComponentThumbDetailThumbnail) : void
      {
         this.thumbnailOverlayContainer.removeChild(param1);
      }
      
      private function calculateTileRowNum() : int
      {
         var _loc1_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_PADDING_SIZE;
         var _loc2_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_GAP_SIZE;
         var _loc3_:Number = this.thumbnailTile.height;
         var _loc4_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_HEIGHT;
         return Math.floor((_loc3_ + _loc2_ - _loc1_ * 2) / (_loc4_ + _loc2_));
      }
      
      private function calculateTileColNum() : int
      {
         var _loc1_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_PADDING_SIZE;
         var _loc2_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_GAP_SIZE;
         var _loc3_:Number = this.thumbnailTile.width;
         var _loc4_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_WIDTH;
         return Math.floor((_loc3_ + _loc2_ - _loc1_ * 2) / (_loc4_ + _loc2_));
      }
      
      private function initTile() : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc1_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_PADDING_SIZE;
         var _loc2_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_PADDING_SIZE;
         var _loc3_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_GAP_SIZE;
         var _loc4_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_GAP_SIZE;
         var _loc7_:Number = this.thumbnailTile.width;
         var _loc8_:Number = this.thumbnailTile.height;
         var _loc9_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_HEIGHT;
         var _loc10_:Number = CcLibConstant.COMPONENT_THUMB_CHOOSER_THUMBNAIL_WIDTH;
         _loc6_ = this.calculateTileColNum();
         _loc5_ = this.calculateTileRowNum();
         _loc3_ = (_loc7_ - CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_PADDING_SIZE * 2 - _loc10_ * _loc6_) / (_loc6_ - 1);
         _loc4_ = (_loc8_ - CcLibConstant.COMPONENT_THUMB_CHOOSER_TILE_PADDING_SIZE * 2 - _loc9_ * _loc5_) / (_loc5_ - 1);
         this.thumbnailTile.tileHeight = _loc9_;
         this.thumbnailTile.tileWidth = _loc10_;
         this.thumbnailTile.setStyle("paddingBottom",_loc2_);
         this.thumbnailTile.setStyle("paddingTop",_loc2_);
         this.thumbnailTile.setStyle("paddingLeft",_loc1_);
         this.thumbnailTile.setStyle("paddingRight",_loc1_);
         this.thumbnailTile.setStyle("horizontalGap",_loc3_);
         this.thumbnailTile.setStyle("verticalGap",_loc4_);
      }
      
      private function onScrollRight() : void
      {
      }
      
      private function onScrollLeft() : void
      {
      }
      
      public function __leftBut_click(param1:MouseEvent) : void
      {
         this.initPage(this.currentPageNum - 1);
      }
      
      public function __thumbnailTile_creationComplete(param1:FlexEvent) : void
      {
         this.initTile();
      }
      
      public function __rightBut_click(param1:MouseEvent) : void
      {
         this.initPage(this.currentPageNum + 1);
      }
      
      [Bindable(event="propertyChange")]
      public function get leftBut() : Button
      {
         return this._55416058leftBut;
      }
      
      public function set leftBut(param1:Button) : void
      {
         var _loc2_:Object = this._55416058leftBut;
         if(_loc2_ !== param1)
         {
            this._55416058leftBut = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"leftBut",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get rightBut() : Button
      {
         return this._1436107067rightBut;
      }
      
      public function set rightBut(param1:Button) : void
      {
         var _loc2_:Object = this._1436107067rightBut;
         if(_loc2_ !== param1)
         {
            this._1436107067rightBut = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"rightBut",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumbnailOverlayContainer() : Canvas
      {
         return this._1049247517thumbnailOverlayContainer;
      }
      
      public function set thumbnailOverlayContainer(param1:Canvas) : void
      {
         var _loc2_:Object = this._1049247517thumbnailOverlayContainer;
         if(_loc2_ !== param1)
         {
            this._1049247517thumbnailOverlayContainer = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbnailOverlayContainer",_loc2_,param1));
            }
         }
      }
      
      [Bindable(event="propertyChange")]
      public function get thumbnailTile() : Tile
      {
         return this._1825292730thumbnailTile;
      }
      
      public function set thumbnailTile(param1:Tile) : void
      {
         var _loc2_:Object = this._1825292730thumbnailTile;
         if(_loc2_ !== param1)
         {
            this._1825292730thumbnailTile = param1;
            if(this.hasEventListener("propertyChange"))
            {
               this.dispatchEvent(PropertyChangeEvent.createUpdateEvent(this,"thumbnailTile",_loc2_,param1));
            }
         }
      }
   }
}
