package GameElements.WaveData 
{
	import AssetMgr.*;
	import flash.display.*;
	import GameElements.*;
	import GameUtility.*;
	import flash.geom.Point;
	
	import com.greensock.*; 
	import com.greensock.easing.*;

	
	/**
	 * ...
	 * @author fakhir
	 */
	public class Wave14 extends Wave 
	{
		
		public function Wave14() 
		{
			
		}
		
		override public function Init():void
		{
			//trace("Wave 14 initialized");
			
			DisplayNextWaveLbl(StartWave);
			
			waveStarted = false;

		}
		
		private function StartWave():void
		{
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			// Spell 1
			new Path(30, 7, 1.0, 1.0, new Point(0, 0), 5, true, AssetManager.PATH5);
			new Path(30, 7, 3.0, 1.0, new Point(0, 0), 5, true, AssetManager.PATH6);
			new Path(30, 7, 10, 1.0, new Point(440, 0), 5, false, AssetManager.PATH1);
			new Path(18, 7, 12, 1.7, new Point(200, 0), 5, true, AssetManager.PATH2);
			
			// Spell 2
			new Path(15, 6, 32.0, 1.0, new Point(0, 0), 5, true, AssetManager.PATH5);
			new Path(15, 6, 34.0, 1.0, new Point(0, 0), 5, true, AssetManager.PATH6);
			
			waveStarted = true;
		}
	}

}