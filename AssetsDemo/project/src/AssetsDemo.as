package {
	import alternativa.engine3d.core.*;
	import alternativa.engine3d.materials.*;
	import alternativa.engine3d.primitives.*;
	import alternativa.engine3d.resources.*;
	import flash.display.*;
	import flash.events.*;

	[SWF(width="1024",height="768")]
	[Live]
	public class AssetsDemo extends Sprite {
		[Embed(source='rocket.png')]
		private var Map:Class;
		
		[LiveAssetUpdateListener(field="Map")]
		private function onMapUpdate() : void {
			material.diffuseMap = new BitmapTextureResource ((new Map).bitmapData);
		}

		public var stage3D:Stage3D;
		public var camera:Camera3D;
		public var material:TextureMaterial;
		public var box:Object3D;

		public function AssetsDemo () {
			stage.scaleMode = "noScale";
			stage.align = "TL";
			stage3D = stage.stage3Ds [0];
			stage3D.addEventListener (Event.CONTEXT3D_CREATE, goOn);
			stage3D.requestContext3D ();
		}
		public function goOn (e:Event):void {
			stage3D.removeEventListener (Event.CONTEXT3D_CREATE, goOn);
			(new Object3D).addChild (camera = new Camera3D (1, 1234));
			camera.y = -250; camera.rotationX = -1.57;
			addChild (camera.view = new View (stage.stageWidth, stage.stageHeight));
			camera.parent.addChild (box = new Box());
			box.setMaterialToAllSurfaces(
				material = new TextureMaterial (new BitmapTextureResource ((new Map).bitmapData))
			);
			addEventListener (Event.ENTER_FRAME, render);
		}
		public function render (e:Event):void {
			for each (var r:Resource in box.getResources (true)) if(!r.isUploaded) r.upload (stage3D.context3D);

			box.rotationX += 1e-2; box.rotationY -= 2e-2; box.rotationZ += 3e-2;
			camera.render (stage3D);
		}
	}
}