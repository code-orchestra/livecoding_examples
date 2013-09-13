package com.example{
  
	import feathers.themes.MetalWorksMobileTheme;
	import feathers.controls.Button;
	import feathers.controls.TabBar;
	import feathers.controls.Header;
	import feathers.controls.List;
	import starling.events.Event;
	import feathers.display.Sprite;
	import feathers.data.ListCollection;
	
	[Live]
	public class Main extends Sprite {
		private var _theme : MetalWorksMobileTheme ;
		private var _button : Button ;
		private var _tabBar : TabBar ;
		private var _header : Header ;
		private var _list : List ;
		
		public function Main(){
			addEventListener(Event.ADDED_TO_STAGE, addedToStageHandler);
		}
		
		public function addedToStageHandler ( e : Event ) : void {
			create();
		}
		
    	[LiveCodeUpdateListener(method="create")]
		public function create () : void {
			trace("create");
			
			_theme = new MetalWorksMobileTheme(stage);
			
			_header = new Header();
			addChild(_header);
			initHeader();
			
			_tabBar = new TabBar();
			addChild(_tabBar);
			initBar();
      
			_list = new List();
			addChild(_list);
      
			_list.dataProvider = new ListCollection([]);
			
			for ( var i : int  = 1 ; i < 10 ; i++ ) {
				_list.dataProvider.addItemAt({label:"Item " + i}, i);
			}
      
			initList();
		}
    
		[LiveCodeUpdateListener(method="initBar")]
		private function initBar () : void {
			trace("initBar");
			_tabBar.dataProvider = new ListCollection([{label:"First"}, {label:"Second"}, {label:"Label"}]);
			_tabBar.width = stage.stageWidth;
			_tabBar.validate();
			_tabBar.y = stage.stageHeight - _tabBar.height;
		}
		
		[LiveCodeUpdateListener(method="initHeader")]
		private function initHeader () : void {
			trace("initHeader")
			_header.title = "LiveCoding is Cool!!!";
			_header.width = stage.stageWidth;
		}
		
		[LiveCodeUpdateListener(method="initList")]
		private function initList () : void {
			trace("initList")
			_list.y = _header.height;
			_list.width = stage.stageWidth;
			_list.height = stage.stageHeight - _header.height - _tabBar.height;
		}
		
		[LiveCodeUpdateListener(method="create", priority="1")]
		public function clear () : void {
			trace("clear")
			while ( numChildren > 0 ) {
				removeChildAt(0);
			}
		}
	}
}




