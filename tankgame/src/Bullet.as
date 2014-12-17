package  
{
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Siem Dicou
	 */
	public class Bullet extends Sprite
	{
		private var moveX:Number = 0;
		private var moveY:Number = 0;
		private var speed:Number = 8;
		
		public function Bullet(r:Number, tankPos:Point) 
		{
			super();
			addChild(new BulletArt());
			
			this.rotation = r;
			
			var radian:Number = r * Math.PI / 180;
			moveX = Math.cos(radian);
			moveY = Math.sin(radian);
			
			this.x = tankPos.x + (66 * moveX);
			this.y = tankPos.y + (66 * moveY);
			
			
		}
		
		public function update():void
		{
			this.x += moveX * speed;
			this.y += moveY * speed;
		}
		
	}
	
}