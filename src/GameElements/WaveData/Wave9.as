package GameElements.WaveData 
{
	import AssetMgr.*;
	import flash.display.*;
	import GameElements.*;
	import GameUtility.*;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author fakhir
	 */
	public class Wave9 extends Wave 
	{
		
		public function Wave9() 
		{
			
		}
		
		override public function Init():void
		{
			//trace("Wave 9 initialized");
			
			DisplayNextWaveLbl(StartWave);
			
			waveStarted = false;
			
		}
		
		private function StartWave():void
		{
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			// Spell 1
			new Path(30, 8, 1.0, 0.65, new Point(0, -20), 5, false, AssetManager.PATH12);
			new Path(30, 8, 2.5, 0.65, new Point(0, 20), 5, false, AssetManager.PATH13);
			
			// Spell 2
			new Path(30, 8, 21.0, 1.65, new Point(0, -20), 5, true, AssetManager.PATH12);
			new Path(30, 8, 21.2, 1.60, new Point(0, 40), 5, true, AssetManager.PATH12);
			new Path(30, 8, 22.5, 1.60, new Point(0, 00), 5, true, AssetManager.PATH13);
			new Path(30, 8, 22.7, 1.65, new Point(0, 70), 5, true, AssetManager.PATH13);
			
			waveStarted = true;
		}
		
	}

}