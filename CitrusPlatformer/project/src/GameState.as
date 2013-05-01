package {
  
  import com.citrusengine.physics.box2d.Box2D;
  import com.citrusengine.objects.CitrusSprite;
  import com.citrusengine.objects.platformer.box2d.*;
  import com.citrusengine.core.CitrusObject;
  import com.citrusengine.core.StarlingState;
  import com.citrusengine.view.starlingview.AnimationSequence;
  import flash.display.Bitmap;
  import flash.display.BitmapData;
  import flash.display.Shape;
  import flash.geom.Matrix;
  import starling.textures.TextureAtlas;
  import starling.textures.Texture;
  [Live]
  public class GameState extends StarlingState {
    [Embed(source="assets/backdrop.jpg")]
    private static const bitmapAsset : Class ;
    [Embed(source="assets/muffin.png")]
    private static const bitmapAsset1 : Class ;
    [Embed(source="assets/platform.png")]
    private static const bitmapAsset2 : Class ;
    [Embed(source="assets/platform_end.png")]
    private static const bitmapAsset3 : Class ;
    [Embed(source="assets/Hero.png")]
    private static const bitmapAsset4 : Class ;
    [Embed(source="assets/Enemy.png")]
    private static const bitmapAsset5 : Class ;
    private var backdrop : Bitmap  = new bitmapAsset() ;
    private var muffin : Bitmap  = new bitmapAsset1() ;
    private var platform : Bitmap  = new bitmapAsset2() ;
    private var platformEnd : Bitmap  = new bitmapAsset3() ;
    private var hero : Bitmap  = new bitmapAsset4() ;
    [Embed(source="assets/Hero.xml", mimeType="application/octet-stream")]
    private var heroConfig : Class ;
    private var enemy : Bitmap  = new bitmapAsset5() ;
    [Embed(source="assets/Enemy.xml", mimeType="application/octet-stream")]
    private var enemyConfig : Class ;
    override public function initialize (  ) : void {
      super.initialize();
      
      createPhysics();
      
      createPlatforms();
      createHero();
      createEnemy();
      createCoin();
    }
    private function createPhysics (  ) : void {
      var physics : Box2D  = new Box2D("box2d");
      // physics.visible = true;
      add(physics);
    }
    [LiveCodeUpdateListener]
    private function test (  ) : void {
      /*
      removeObjects([CitrusSprite, Platform]);
      createPlatforms();
       */
      
      /*
      removeObjects([Hero]);
      createHero();
       */
      
      /*
      removeObjects([Enemy]);
      createEnemy();
       */
      
      /*
      removeObjects([Coin]);
      createCoin();
       */

      trace ("---> hello from test()");
    }
    private function createPlatforms (  ) : void {
      add(new CitrusSprite("backdrop", {x:0, y:318, view:backdrop}))
      
      add(new Platform("floor", {x:512, y:748, width:1024, height:95}))
      
      add(new Platform("p1", {x:874, y:170, width:300, height:95, view:createPlatformTexture(300, 95)}))
      
      add(new MovingPlatform("moving", {x:220, y:600, width:200, height:95, view:createPlatformTexture(200, 95), startX:220, startY:600, endX:500, endY:170}))
    }
    private function createHero (  ) : void {
      add(new Hero("hero", {x:50, y:50, width:60, height:135, view:new AnimationSequence(new TextureAtlas(Texture.fromBitmap(hero), XML(new heroConfig())), ["walk", "duck", "idle", "jump", "hurt"], "idle"), group:1}))
    }
    private function createEnemy (  ) : void {
      add(new Enemy("enemy", {x:900, y:660, width:46, height:68, leftBound:10, rightBound:1000, registration:"center", view:new AnimationSequence(new TextureAtlas(Texture.fromBitmap(enemy), XML(new enemyConfig())), ["walk", "die"], "walk"), group:1}))
    }
    private function createCoin (  ) : void {
      Coin(add(new Coin("muffin", {x:950, y:95, width:80, height:80, view:muffin, group:1}))).onBeginContact.add(onMuffinConsumed)
    }
    private function onMuffinConsumed ( ...args ) : void {
      trace("Delicious!");
    }
    private function removeObjects ( classes : Array ) : void {
      // we need this method to allow recreation of objects during livecoding session
      for each ( var objectClass : Class in classes ) {
        for each ( var object : CitrusObject in getObjectsByType(objectClass) ) {
          remove(object);
        }
      }
    }
	
    private function createPlatformTexture ( width : uint, height : uint ) : Bitmap {
      // platform tile is 160x107
      // platform end is 37x107, 1st 13 pixels blend in
      // thus, minimal possible platform width is 37 * 2 - 13
      width = Math.max(width, 37 * 2 - 13);
      
      // height is limited by texture height
      height = Math.min(height, 107);
      
      var bitmapData : BitmapData  = new BitmapData(width, height, true, 0);
      
      // we will use temporary shape to create tiled platform part
      var shape : Shape  = new Shape();
      shape.graphics.beginBitmapFill(platform.bitmapData);
      shape.graphics.drawRect(37 - 13, 0, width - 2 * (37 - 13), 107);
      shape.graphics.endFill();
      bitmapData.draw(shape);
      
      // right end
      bitmapData.draw(platformEnd, new Matrix(1, 0, 0, 1, width - 37));
      
      // left end (mirrored)
      bitmapData.draw(platformEnd, new Matrix(-1, 0, 0, 1, 37));
      
      return new Bitmap(bitmapData);
    }
  }
}




