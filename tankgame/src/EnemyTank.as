package  
{
	import flash.events.Event;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	/**
	 * ...
	 * @author Siem Dicou
	 */
	public class EnemyTank extends TankBase
	{
		private var shootTimer:Timer;
		
		public function EnemyTank() 
		{
			shootTimer = new Timer(1500+Math.random()*1000);
			shootTimer.addEventListener(TimerEvent.TIMER, shoot);
			shootTimer.start();
		}
		
		private function shoot(e:TimerEvent):void 
		{
			var se:ShootEvent = new ShootEvent("onShoot")
			se.shooter = this;
			dispatchEvent(se);
		}
		
		override public function loop(e:Event):void
		{
			if (Main.tank1 != null)
			{
				targetPosition.x = Main.tank1.x - this.x;
				targetPosition.y = Main.tank1.y - this.y;
				
				super.loop(e);
			}
		}
		
		override public function destroy():void
		{
			shootTimer.removeEventListener(TimerEvent.TIMER, shoot);
			shootTimer.stop();
			shootTimer = null;
			
			super.destroy();
			
		}
	}
	
}