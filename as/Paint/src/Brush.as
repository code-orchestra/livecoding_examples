package {
  
  import flash.display.Shape;
  import flash.utils.getTimer;
  import flash.display.BitmapData;
  [Live]
  public class Brush {
    private var shape : Shape  = new Shape() ;
    public function paint ( canvas : BitmapData, x : Number, y : Number ) : void {
      
      shape.graphics.clear();
      shape.graphics.beginFill(0x7f00);
      shape.graphics.drawCircle(x, y, 20);
//      shape.graphics.drawCircle(x+20*Math.random(), y+20*Math.random(), 10);
//      shape.graphics.beginFill(0);
//      shape.graphics.drawCircle(x, y, 100);
      shape.graphics.endFill();
      
      canvas.draw(shape);
      
    }
  }
}
