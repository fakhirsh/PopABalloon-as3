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
	public class Wave7 extends Wave 
	{
		
		public function Wave7()
		{
			
		}
		
		override public function Init():void
		{
			//trace("Wave 7 initialized");
			
			DisplayNextWaveLbl(StartWave);
			
			waveStarted = false;

		}

		private function StartWave():void
		{
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			// Spell 1
			new Path(25, 10, 1.0, 0.65, new Point(0, 0), 5, true, AssetManager.PATH10);
			new Path(25, 10, 1.5, 0.65, new Point(0, 0), 5, true, AssetManager.PATH11);
			new Path(8, 10, 8.5, 1.5, new Point(300, 0), 5, true, AssetManager.PATH2);
			
			//Spell 2
			new Path(25, 7, 23.5, 1.0, new Point(0, 0), 5, true, AssetManager.PATH5);
			new Path(25, 7, 23.5, 1.0, new Point(0, 0), 5, true, AssetManager.PATH6);
			new Path(25, 7, 26.5, 1.0, new Point(300, 0), 5, true, AssetManager.PATH2);
			
			waveStarted = true;
		}
		
	}

}