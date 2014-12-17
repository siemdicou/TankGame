package  
{
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Siem Dicou
	 */
	public class ShootEvent extends Event 
	{
		public var shooter:TankBase;
		
		public function ShootEvent(type:String, bubbles:Boolean=false, cancelable:Boolean=false) 
		{
			super(type, bubbles, cancelable);
			
		}
		
	}
	
}