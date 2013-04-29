package com.codeorchestra{

	import flash.display.Shape;
	import flash.geom.Point;
	import flash.display.Graphics;
	//import codeOrchestra.actionScript.liveCoding.util.LiveCodingCodeFlowUtil;
	[Live]
	public class Branch extends Shape {
		public static var ANGLE_VARIANCE : Number  = 0 ;
		public static var LENGTH_FACTOR : Number = .5 ;

		private var maxSteps : int ;
		private var stepLength : Number ;
		private var angle : Number ;
		private var startPoint : Point ;
		public var endPoint : Point ;
		public var generation : int ;
		public var steps : int ;
		
		public function Branch( gen : int, mstep : int, p : Point, ang : Number ){
			generation = gen;
			maxSteps = mstep;
			steps = mstep;
			stepLength = 100.0 / (generation + 1);
			startPoint = new Point(p.x, p.y);
			endPoint = new Point(p.x, p.y);
			angle = ang;
		}
		
		public function draw () : void {

			while ( steps > 0 ) {
				angle += ANGLE_VARIANCE;
				stepLength *= LENGTH_FACTOR;
				endPoint.x += stepLength * Math.cos(angle);
				endPoint.y -= stepLength * Math.sin(angle);
        
				var g : Graphics  = this.graphics;
				g.clear();
				g.beginFill(0x000000);
				g.lineStyle(Math.floor(20 / (generation + 1)), 0x332010);
				g.moveTo(startPoint.x, startPoint.y);
				g.lineTo(endPoint.x, endPoint.y);
				g.endFill();
        
				steps -= 1;
			}
		}
		
		public function createChild ( cnt : int ) : Branch {
			var newGen : int  = generation + 1;
			var newMstep : int  = 2 + 0 * Math.floor(Util.getRandomRange(1, 4));
			var angleShift : Number  = 0.6;
			if ( cnt == 1 ) {
				angleShift = -1 * angleShift;
			}
			var childAngle : Number  = angle + angleShift;
			var parentPoint : Point  = new Point(endPoint.x, endPoint.y);
			return new Branch(newGen, newMstep, parentPoint, childAngle);
		}
		
		public function clear () : void {
			//LiveCodingCodeFlowUtil.checkRecursion(Math.random().toString());
			graphics.clear();
			
			endPoint.x = startPoint.x;
			endPoint.y = startPoint.y;
			
			steps = maxSteps;
			stepLength = 100.0 / (generation + 1);
		}
	}
}




