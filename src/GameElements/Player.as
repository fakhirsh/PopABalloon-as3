package GameElements 
{
	import AssetMgr.*;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author fakhir
	 */
	public class Player 
	{
		public static const STATE_NORMAL:int = 1;
		public static const STATE_SHOCKED:int = 2;
		
		private var bitmapArray:Array;
		private var currentBitmap:Bitmap;
		
		private var bitmapContainer:Sprite;
		private var prevPoint:Point; //keeps up with last known mouse position
		private var _currentState:int;
		private var currentBitmapIndex:int;
		private var tmpCounter:int = 0;
		//private var tmpTimer:Timer;
		private var animationTimer:Timer;
		private var delayTimer:Timer;
		private var vx:Number = 10;
		private var vy:Number = 10;
		
		public function Player() 
		{
			
			bitmapArray = new Array();
			bitmapArray.push(new AssetManager.NailTiltGFX());
			bitmapArray.push(new AssetManager.NailShocked1TiltGFX());
			bitmapArray.push(new AssetManager.NailShocked2TiltGFX());
			
			currentBitmap = new Bitmap();
			ChangeFrame(0);
			
			bitmapContainer = new Sprite();
			bitmapContainer.addChild(currentBitmap);
			Registry.playerLayer.addChild(bitmapContainer);
			bitmapContainer.x = bitmapContainer.stage.mouseX;
			bitmapContainer.y = bitmapContainer.stage.mouseY;			
			prevPoint = new Point();
			
			_currentState = STATE_NORMAL;
			currentBitmapIndex = 0;
			
			//tmpTimer = new Timer(2000);
			//tmpTimer.addEventListener(TimerEvent.TIMER, StartShock);
			//tmpTimer.start();
			
			animationTimer = new Timer(1/20*1000);
			animationTimer.addEventListener(TimerEvent.TIMER, SwitchFrames);
			delayTimer = new Timer(1000);
			delayTimer.addEventListener(TimerEvent.TIMER, StopShock);
		}
		
		//private function StartShock(e:TimerEvent):void 
		//{
		//	GetShock();
		//}
		
		public function GetShock():void
		{
			_currentState = STATE_SHOCKED;
			animationTimer.start();
			delayTimer.start();
			SoundManager.PlayShockSFX();
		}
		
		private function StopShock(e:TimerEvent):void 
		{	
			delayTimer.stop();
			delayTimer.reset();
			animationTimer.stop();
			animationTimer.reset();
			
			ChangeFrame(0);
			currentBitmapIndex = 0;
			_currentState = STATE_NORMAL;
		}
		
		private function SwitchFrames(e:TimerEvent):void 
		{
			switch(currentBitmapIndex)
				{
					case 1:
						ChangeFrame(1);
						currentBitmapIndex = 2;
						break;
					case 2:
						ChangeFrame(2);
						currentBitmapIndex = 1;
						break;
					default:
						ChangeFrame(1);
						currentBitmapIndex = 2;						
						break;
				}
		}
		
		public function Update(dt:Number):void 
		{
			
		}
		
		public function MouseMove(e:MouseEvent):void
		{
			
			bitmapContainer.x = bitmapContainer.stage.mouseX;
			bitmapContainer.y = bitmapContainer.stage.mouseY;
 
			var newRotation:Number = Math.atan2(bitmapContainer.y - prevPoint.y, bitmapContainer.x - prevPoint.x) * 180 / Math.PI;
			if (newRotation - bitmapContainer.rotation > 180)
					newRotation -= 360;
			else if (bitmapContainer.rotation - newRotation > 180)
					newRotation += 360;
 
			if(_currentState == STATE_NORMAL)
				bitmapContainer.rotation -= (bitmapContainer.rotation - newRotation) / 10;
			
			prevPoint.x = bitmapContainer.x;
			prevPoint.y = bitmapContainer.y;
			
			//e.updateAfterEvent();
		}
		
		private function ChangeFrame(i:int):void
		{
			if (i < 0 || i > bitmapArray.length-1) return;

			currentBitmap.bitmapData = bitmapArray[i].bitmapData;
			currentBitmap.x = -bitmapArray[i].width / 2;
			currentBitmap.y = -bitmapArray[i].height / 2;
			currentBitmap.smoothing = true;
		}
		
		public function get collisionMask():Sprite
		{
			return bitmapContainer;
		}

		public function get state():int
		{
			return _currentState;
		}
		
		public function Destroy():void
		{
			Registry.playerLayer.removeChild(bitmapContainer);
		}
		
	}
}