package com.example{
  
	import starling.core.Starling;
	import flash.display.StageScaleMode;
	import flash.display.StageAlign;
	import feathers.system.DeviceCapabilities;
	import flash.events.Event;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
  
	[SWF(width="960", height="640", frameRate="30", backgroundColor="#333333")]
	public class Example extends Sprite {
		private var _starling : Starling ;
		public function Example(  ){
			if ( stage ) {
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			mouseEnabled = mouseChildren = false;
      
			// pretends to be an iPhone Retina screen
			DeviceCapabilities.dpi = 326;
			DeviceCapabilities.screenPixelWidth = 960;
			DeviceCapabilities.screenPixelHeight = 640;
      
			loaderInfo.addEventListener(Event.COMPLETE, onComplete);
		}
		public function onComplete ( e : Event ) : void {
			Starling.handleLostContext = true;
			Starling.multitouchEnabled = true;
			_starling = new Starling(Main, stage);
			_starling.enableErrorChecking = true;
			_starling.start();
			
			stage.addEventListener(Event.RESIZE, onResize, false, int.MAX_VALUE, false);
		}
		public function onResize ( e : Event ) : void {
			_starling.stage.stageWidth = stage.stageWidth;
			_starling.stage.stageHeight = stage.stageHeight;
      
			const viewPort : Rectangle  = _starling.viewPort;
			viewPort.width = stage.stageWidth;
			viewPort.height = stage.stageHeight;
			try {
				_starling.viewPort = viewPort;
			} catch ( e : Error ) {
				trace(e)
			}
		}
	}
}




