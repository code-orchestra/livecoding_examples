package com.codeorchestra{

	import flash.display.Shape;
	import flash.display.Graphics;
	[Live]
	public class Leaf extends Shape {
		private var _x : Number ;
		private var _y : Number ;
    
		public function Leaf( dx : Number, dy : Number ){
			_x = dx;
			_y = dy;
			
			draw();
		}
    
		[LiveCodeUpdateListener(method="draw")]
		private function draw () : void {
			var g : Graphics  = this.graphics;
			g.clear();
			g.beginFill(0xf2afc1);
			g.drawEllipse(_x + 1.5, _y, Util.getRandomRange(2, 10), Util.getRandomRange(2, 10));
			g.endFill();
			
			g.beginFill(0xed719e);
			g.drawEllipse(_x, _y + 1.5, Util.getRandomRange(2, 10), Util.getRandomRange(2, 10));
			g.endFill();
			
			g.beginFill(0xe54c7c);
			g.drawEllipse(_x - 1.5, _y, Util.getRandomRange(2, 10), Util.getRandomRange(2, 10));
			g.endFill();
			
			g.beginFill(0xf64c7c);
			g.drawEllipse(_x - 1.5, _y, Util.getRandomRange(2, 10), Util.getRandomRange(2, 10));
			g.endFill();
		}
    
		[LiveCodeUpdateListener(method="draw", priority="1")]
		public function clear () : void {
			graphics.clear();
		}
	}
}




