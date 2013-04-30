package {
  
  import flash.display.*;
  import flash.events.*;
  
  [SWF(width="1024", height="768", frameRate="60", backgroundColor="#000000")]
  
  public class Main extends Sprite {
    public var brush : Brush ;
    public var canvas : BitmapData ;
    public var mouseDown : Boolean ;
    public function Main(  ){
      brush = new Brush();
      addChild(new Bitmap(canvas = new BitmapData(1024, 768, false, 0)));
      stage.addEventListener(Event.ENTER_FRAME, onFrame);
      stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouse);
      stage.addEventListener(MouseEvent.MOUSE_UP, onMouse);
    }
    private function onFrame ( e : Event ) : void {
      if ( mouseDown ) {
        brush.paint(canvas, mouseX, mouseY);
      }
    }
    private function onMouse ( e : MouseEvent ) : void {
      mouseDown = (e.type == MouseEvent.MOUSE_DOWN);
    }
  }
}




