package aerys.minko.example.core.solarsystem
{
	import aerys.minko.render.geometry.primitive.SphereGeometry;
	import aerys.minko.render.material.basic.*;
	import aerys.minko.scene.node.Group;
	import aerys.minko.scene.node.Mesh;
	import aerys.minko.type.math.Vector4;
		import aerys.minko.scene.node.Scene;
	import flash.events.Event;

	[Live]
	public class SolarSystemExample extends MinkoExampleApplication
	{
		private var _sun		: Mesh;
		private var _mercury	: Mesh;
		private var _venus		: Mesh;
		private var _earth		: Mesh;
		private var _mars		: Mesh;
		private var _neptune	: Mesh;
		private var _jupiter	: Mesh;
		private var _uranus		: Mesh;
		
		[LiveCodeDisable]
		override protected function initializeScene() : void
		{
			super.initializeScene();
			initializeSceneImpl();
		}
		
		[LiveCodeUpdateListener(method="initializeSceneImpl",weak="false")]
		private function initializeSceneImpl():void {
			
			trace("---> initializeSceneImpl called <---");
			
			if(_sun!=null){scene.removeChild(_sun);_sun=null;}
			if(_mercury!=null){scene.removeChild(_mercury);_mercury=null;}
			if(_venus!=null){scene.removeChild(_venus);_venus=null;}
			if(_earth!=null){scene.removeChild(_earth);_earth=null;}
			if(_mars!=null){scene.removeChild(_mars);_mars=null;}
			if(_neptune!=null){scene.removeChild(_neptune);_neptune=null;}
			if(_jupiter!=null){scene.removeChild(_jupiter);_jupiter=null;}
			if(_uranus!=null){scene.removeChild(_uranus);_uranus=null;}
			
			cameraController.distance = 60;
			cameraController.pitch = 1.3;
			
			viewport.backgroundColor = 0;
			
			var sphere : SphereGeometry = new SphereGeometry(30);
			
			_sun = new Mesh(sphere, new BasicMaterial({diffuseColor:0xffff00ff}));
			_sun.transform.appendUniformScale(10);
			
			_mercury = new Mesh(sphere, new BasicMaterial({diffuseColor:0x7f7f7fff}));
			_mercury.transform
				.lock()
				.appendUniformScale(.5)
				.appendTranslation(7)
				.unlock();
			
			_venus = new Mesh(sphere, new BasicMaterial({diffuseColor:0x7f7f7fff}));
			_venus.transform
				.lock()
				.appendUniformScale(.7)
				.appendTranslation(9)
				.unlock();
			
			_earth = new Mesh(sphere, new BasicMaterial({diffuseColor:0x0000ffff}));
			_earth.transform
				.lock()
				.appendUniformScale(1)
				.appendTranslation(11)
				.unlock();
			
			_mars = new Mesh(sphere, new BasicMaterial({diffuseColor:0xff7f00ff}));
			_mars.transform
				.lock()
				.appendUniformScale(0.6)
				.appendTranslation(14)
				.unlock();
			
			_neptune = new Mesh(sphere, new BasicMaterial({diffuseColor:0x7F7F7Fff}));
			_neptune.transform.appendTranslation(20);
			
			_jupiter = new Mesh(sphere, new BasicMaterial({diffuseColor:0x7fffffff}));
			_jupiter.transform
				.lock()
				.appendUniformScale(3.2)
				.appendTranslation(-23)
				.unlock();
			
			_uranus = new Mesh(sphere, new BasicMaterial({diffuseColor:0xddffffff}));
			_uranus.transform
				.lock()
				.appendUniformScale(2.2)
				.appendTranslation(29)
				.unlock();
			
			if(_sun)scene.addChild(_sun);
			if(_mercury)scene.addChild(_mercury);
			if(_venus)scene.addChild(_venus);
			if(_earth)scene.addChild(_earth);
			if(_mars)scene.addChild(_mars);
			if(_neptune)scene.addChild(_neptune);
			if(_jupiter)scene.addChild(_jupiter);
			if(_uranus)scene.addChild(_uranus);
		}
		
		override protected function enterFrameHandler(event:Event):void
		{
			_mercury.transform.appendRotation(.025, Vector4.Y_AXIS);
			_venus.transform.appendRotation(.015, Vector4.Y_AXIS);
			_earth.transform.appendRotation(.02, Vector4.Y_AXIS);
			_mars.transform.appendRotation(.0125, Vector4.Y_AXIS);
			_neptune.transform.appendRotation(0.005, Vector4.Y_AXIS);
			_jupiter.transform.appendRotation(0.003, Vector4.Y_AXIS);
			_uranus.transform.appendRotation(0.002, Vector4.Y_AXIS);

			super.enterFrameHandler(event);
		}
	}
}