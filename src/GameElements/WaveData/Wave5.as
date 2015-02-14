
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
	public class Wave5 extends Wave 
	{
		
		public function Wave5()
		{
			
		}

		override public function Init():void
		{
			//trace("Wave 5 initialized");
			
			DisplayNextWaveLbl(StartWave);
			
			waveStarted = false;

		}
		
		private function StartWave():void
		{
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			// Spell 1
			new Path(15, 12, 1.0, 1.5, new Point(0, 0), 5, true, AssetManager.PATH5);
			new Path(15, 12, 3.0, 1.7, new Point(0, 0), 5, true, AssetManager.PATH6);
			new Path(15, 12, 10, 1.6, new Point(440, 0), 5, false, AssetManager.PATH1);
			new Path(9, 13, 12, 3.0, new Point(200, 0), 5, true, AssetManager.PATH2);
			
			// Spell 2
			new Path(15, 10, 32.0, 1.3, new Point(0, 0), 5, true, AssetManager.PATH5);
			new Path(15, 10, 34.0, 1.5, new Point(0, 0), 5, true, AssetManager.PATH6);
			
			waveStarted = true;
		}
		
	}
	
}