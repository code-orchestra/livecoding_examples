package com.codeorchestra{
	
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.KeyboardEvent;
	import flash.filters.GlowFilter;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.geom.Point;
	import codeOrchestra.actionScript.logging.logUtil.LogUtil;

	[SWF(width="1024", height="768", backgroundColor="#7fbfff")]
	[Live]
	public class Tree extends Sprite {
		
		private var generations : int ;
		private var branches : Array ;
		private var leaves : Array ;
		private var sun : Sun ;
		
		public function Tree(){
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.SHOW_ALL;
			Mountain.HEIGHT = stage.stageHeight;
			
			sun = new Sun();
			sun.x = 200;
			sun.y = 550;
			sun.filters = [new GlowFilter(sun.color, 1, 128, 128, 2, 3)];
			addChild(sun);
      
			addChild(new Mountain(0.75 * stage.stageHeight - 100, 0x7F7F8F));
			addChild(new Mountain(0.75 * stage.stageHeight, 0x5F6F5F));
			init();
		}
		
		[LiveCodeUpdateListener(classFqn="*")]
		private function init () : void {
			clear();
			
			Branch.ANGLE_VARIANCE = -1e-2;
			Branch.LENGTH_FACTOR = .8;
			
			generations = 7;//1..12
			branches = [];
			leaves = [];
			var w : Number  = stage.stageWidth / 2;
			var h : Number  = stage.stageHeight;
			var mstep : int  = 2;
			var p : Point  = new Point(w, h);
			
			branches[0] = new com.codeorchestra.Branch(0, mstep, p, Math.PI / 2);
			
			grow();
			
			//sun.color = 0xffbfbf;
			sun.y = 300;
			sun.radius = 100;
		}
		
		private function grow () : void {
			var branch : com.codeorchestra.Branch;
			var branchPoint : Point;
			var nextSlot : int  = 1;
			var leaf : com.codeorchestra.Leaf;

			var i : int  = 0;
			var slots : int  = (Math.pow(2, generations + 1) >> 0) - 1;
			for ( i = 0 ; i < slots ; i++ ) {
				branch = branches[i] as com.codeorchestra.Branch;
				if ( branch != null ) {
					branch.draw();
					addChild(branch);
				}
				if ( nextSlot <= slots - 2 ) {
					branches[nextSlot++] = branch.createChild(0);
					branches[nextSlot++] = branch.createChild(1);
				}
				if ( branch.generation >= generations-2 ) {
					branchPoint = branch.endPoint;
					leaf = new com.codeorchestra.Leaf(branchPoint.x, branchPoint.y);
					addChild(leaf);
					leaves.push(leaf);
				}
			}
		}
		
		private function clear () : void {
			while ( branches && (branches.length > 0) ) {
				(removeChild(branches.pop()) as com.codeorchestra.Branch).clear();
			}
			while ( leaves && (leaves.length > 0) ) {
				(removeChild(leaves.pop()) as com.codeorchestra.Leaf).clear();
			}
		}
	}
}




