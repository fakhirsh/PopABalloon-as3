package GameElements.WaveData 
{
	import AssetMgr.AssetManager;
	import flash.geom.Point;
	import GameElements.*;
	import GameUtility.*;
	
	/**
	 * ...
	 * @author fakhir
	 */
	public class Wave11 extends Wave 
	{
		
		public function Wave11() 
		{
			
		}
		
		override public function Init():void
		{
			//trace("Wave 11 initialized");
			
			DisplayNextWaveLbl(StartWave);
			
			waveStarted = false;
			
		}
		
		private function StartWave():void
		{
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			// Spell 1
			new Path(100, 18, 1.0, 0.45, new Point(0, 0), 5, true, AssetManager.PATH15);
			new Path(10, 12, 30.0, 2.45, new Point(0, 0), 1, true, AssetManager.PATH8);
			
			waveStarted = true;
		}
		
	}

}