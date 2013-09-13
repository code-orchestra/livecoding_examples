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
      addChild(new Bitmap());
      stage.addEventListener(Event.ENTER_FRAME, onFrame);
      stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouse);
      stage.addEventListener(MouseEvent.MOUSE_UP, onMouse);
      stage.addEventListener(Event.RESIZE, onResize);
      stage.scaleMode = StageScaleMode.NO_SCALE;
      stage.align = StageAlign.TOP_LEFT;
      onResize();
    }
    private function onResize ( e : Event = null ) : void {
      var bitmap : Bitmap = getChildAt (0) as Bitmap;
      bitmap.bitmapData = new BitmapData(stage.stageWidth, stage.stageHeight, false, 0);
      if ( canvas ) {
        bitmap.bitmapData.draw(canvas); canvas.dispose();
      }
      canvas = bitmap.bitmapData;
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




