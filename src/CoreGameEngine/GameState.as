package CoreGameEngine
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author fakhir
	 */
	public class GameState
	{
		public function GameState() 
		{
		}
		
		public function Load():void { 
			//trace("GameState.Load()");
			throw new Error("GameState.Load() : Override me!");
		}
		
		public function UnLoad():void { 
			trace("GameState.Unload()");
		}
		
		public function Init():void { 
			trace("GameState.Init()");
		}
		
		public function Free():void { 
			trace("GameState.Free()");
		}
		
		public function Update(dt:Number):void { 
			trace("GameState.Update()");
		}
		
		public function Draw():void { 
			trace("GameState.Draw()");
		}
		
		public function KeyUp(e:KeyboardEvent):void
		{
			trace("GameState.KeyUp()");
		}
		
		public function KeyDown(e:KeyboardEvent):void
		{
			trace("GameState.KeyDown()");
		}
		
		public function MouseClick(e:MouseEvent):void
		{
			trace("GameState.MouseClick()");
		}
				
	}

}