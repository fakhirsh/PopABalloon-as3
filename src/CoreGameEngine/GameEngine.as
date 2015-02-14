package CoreGameEngine
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	//import flash.events.Event;
	/**
	 * ...
	 * @author fakhir
	 */
	public class GameEngine
	{
		private static var stateVector:Vector.<GameState>;

		function GameEngine() 
		{

		}

		public static function Init():void {
			stateVector = new Vector.<GameState>;
		}
		
		public static function PushState(gs:GameState):void {			
			stateVector.push(gs);
			gs.Load();
			gs.Init();
		}
		
		public static function PopState():void {
			var gs:GameState = stateVector.pop();
			gs.Free();
			gs.UnLoad();
		}
		
		public static function ChangeState(gs:GameState):void {
			if (!stateVector) {
				Init();
			}
			
			if (stateVector.length != 0) {
				PopState();
			}
			PushState(gs);
		}
		
		public static function Update(dt:Number):void { 
			stateVector[stateVector.length - 1].Update(dt);
		}
		
		public static function Draw():void { 
			stateVector[stateVector.length - 1].Draw();
		}
	
		public static function KeyUp(e:KeyboardEvent):void
		{
			stateVector[stateVector.length - 1].KeyUp(e);
		}
		
		public static function KeyDown(e:KeyboardEvent):void
		{
			stateVector[stateVector.length - 1].KeyDown(e);
		}
		
		public static function MouseClick(e:MouseEvent):void
		{
			stateVector[stateVector.length - 1].MouseClick(e);
		}

	}

}