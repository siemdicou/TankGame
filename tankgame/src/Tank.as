package  
{
	import flash.display.MorphShape;
	import flash.display.MovieClip;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.ui.Keyboard;
	import flash.events.MouseEvent
	
	/**
	 * ...
	 * @author Siem Dicou
	 */
	public class Tank extends TankBase
	{
		//private var tankBody:TankBodyArt;
		//private var tankTurret:TankTurretArt;
		
		private var controlDir:Point;
		private var speed:Number = 0;
		
		//public var turretAngle:Number = 0;
		
		
		public function Tank() 
		{
			this.addEventListener(Event.ADDED_TO_STAGE, init);
			
			/*
			tankBody = new TankBodyArt();
			this.addChild(tankBody);
			
			tankTurret = new TankTurretArt();
			this.addChild(tankTurret);
			*/
			
			controlDir = new Point(0, 0);
			
			
		}
		
		private function init(e:Event):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			//this.addEventListener(Event.ENTER_FRAME, loop);
			stage.addEventListener(MouseEvent.CLICK, onClick);
		}
		
		private function onClick(e:MouseEvent):void 
		{
			var se:ShootEvent = new ShootEvent("onShoot")
			se.shooter = this;
			dispatchEvent(se);
		}
		
		override public function loop(e:Event):void 
		{
			//trace(controlDir)
			//this.x += controlDir.x * 5;
			//this.y += controlDir.y * 5;
			speed = controlDir.y * -5; 
			
			this.rotation += controlDir.x * 3;
			
			var radian:Number = this.rotation * Math.PI / 180; //van graden naar radians
			var xMove:Number = Math.cos(radian);
			var yMove:Number = Math.sin(radian);
			
			this.x += xMove * speed;
			this.y += yMove * speed;
			
			targetPosition.x = mouseX;
			targetPosition.y = mouseY;
			
			super.loop(e);
			
			/*
			var dx:Number = mouseX;
			var dy:Number = mouseY;
			
			radian = Math.atan2(dy, dx);
			var angle:Number = radian * 180 / Math.PI; //van radians naar graden
			
			tankTurret.rotation = angle;
			turretAngle = tankTurret.rotation;
			*/
		}
		
		private function onKeyUp(e:KeyboardEvent):void 
		{
			//trace(e.keyCode)
			if (e.keyCode == Keyboard.D)
			{
				controlDir.x = 0;
			}
			if (e.keyCode == Keyboard.A)
			{
				controlDir.x = 0;
			}
			if (e.keyCode == Keyboard.W)
			{
				controlDir.y = 0;
			}
			if (e.keyCode == Keyboard.S)
			{
				controlDir.y = 0;
			}
		}
		
		private function onKeyDown(e:KeyboardEvent):void
		{
			//trace(e.keyCode)
			if (e.keyCode == Keyboard.D)
			{
				controlDir.x = 1;    
			}
			
			if (e.keyCode == Keyboard.A)
			{
				controlDir.x = -1;    
			}
			
			if (e.keyCode == Keyboard.W)
			{
				controlDir.y = -1;    
			}
			
			if (e.keyCode == Keyboard.S)
			{
				controlDir.y = 1;    
			}
			
			//trace(controlDir)
		}
		
		override public function destroy():void
		{
			stage.removeEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.removeEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.removeEventListener(MouseEvent.CLICK, onClick);
			
			super.destroy();
		}
		
		
	}
	
	
	
	
}


