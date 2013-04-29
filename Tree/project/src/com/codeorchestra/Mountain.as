package com.codeorchestra{

	import flash.display.Shape;
	import flash.display.Graphics;

	public class Mountain extends Shape {
		public static var HEIGHT : Number  = 400 ;

		private var heightMap : Vector.<Number>  = new Vector.<Number>() ;
		private var segmentLength : Number ;
		private var baseHeight : Number ;
		private var color : uint ;
    
		public function Mountain( baseHeight : Number, color : uint ){
			segmentLength = HEIGHT / 40;
			this.baseHeight = baseHeight;
			this.color = color;
			generateHeightMap();
			createShape();
		}
    
		private function generateHeightMap () : void {
			divide(baseHeight, baseHeight, 0, 150);
      
			function divide ( left : Number, right : Number, depth : int, offset : Number ) : void {
				if ( depth < 6 ) {
					var half : Number  = (left + right) / 2 + Util.getRandomRange(-offset / 2, offset / 2);
          
					divide(left, half, depth + 1, offset / 2);
					divide(half, right, depth + 1, offset / 2);
				}else{
					heightMap.push(left);
				}
			}
		}
    
		private function createShape () : void {
			var g : Graphics  = graphics;
			
			g.clear();
			g.beginFill(color);
			g.moveTo(0, HEIGHT);
			for ( var i : int  = 0 ; i < heightMap.length ; i++ ) {
				g.lineTo(i * segmentLength, heightMap[i]);
			}
			g.lineTo((i - 1) * segmentLength, HEIGHT);
			g.endFill();
			
			g.lineStyle(1, color);
			g.moveTo(0, heightMap[0]);
			g.lineTo(0, HEIGHT * 2);
		}
	}
}




