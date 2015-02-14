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
	public class Wave8 extends Wave 
	{
		
		public function Wave8() 
		{
			
		}
		
		override public function Init():void
		{
			//trace("Wave 8 initialized");

			DisplayNextWaveLbl(StartWave);
			
			waveStarted = false;

		}
		
		private function StartWave():void
		{
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			// Spell 1
			new Path(25, 8, 1.0, 0.65, new Point(0, 0), 5, false, AssetManager.PATH12);
			new Path(25, 8, 2.5, 0.65, new Point(0, 0), 5, false, AssetManager.PATH13);
			
			// Spell 2
			new Path(25, 6, 24.0, 0.65, new Point(0, 100), 5, false, AssetManager.PATH12);
			new Path(25, 6, 25.0, 0.65, new Point(0, 0), 5, true, AssetManager.PATH6);
			
			
			waveStarted = true;
		}

	}

}