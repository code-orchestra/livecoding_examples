package com.codeorchestra{
  
  import flash.display.Shape;
  [Live]
  public class Sun extends Shape {
    public var color : uint  = 0xff3f00 ;
    public var radius : Number  = 100 ;
    
	public function Sun(){
		draw();
    }
    
	[LiveCodeUpdateListener(classFqn="*")]
	public function draw () : void {
		trace("draw");
		graphics.clear();
		graphics.beginFill(color);
		graphics.drawCircle(0, 0, radius);
		graphics.endFill();
    }
  }
}




