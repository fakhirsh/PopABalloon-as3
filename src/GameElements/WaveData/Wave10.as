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
	public class Wave10 extends Wave 
	{
		
		public function Wave10() 
		{
			
		}
		
		override public function Init():void
		{
			//trace("Wave 10 initialized");
			
			DisplayNextWaveLbl(StartWave);
			
			waveStarted = false;
			
		}
		
		private function StartWave():void
		{
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			// Spell 1
			new Path(70, 18, 1.0, 0.45, new Point(0, 0), 5, true, AssetManager.PATH14);

			// Spell 2
			new Path(90, 16, 45.0, 0.45, new Point(0, 0), 5, false, AssetManager.PATH14);
			
			waveStarted = true;
		}
		
	}

}