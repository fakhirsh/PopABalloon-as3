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
	public class Wave12 extends Wave 
	{
		
		public function Wave12() 
		{
			
		}
		
		override public function Init():void
		{
			//trace("Wave 4 initialized");

			DisplayNextWaveLbl(StartWave);
			
			waveStarted = false;

		}
		
		private function StartWave():void
		{
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			// Spell 1
			new Path(30, 6, 3.0, 1.0, new Point(79, 0), 4, false, AssetManager.PATH1);
			new Path(30, 6, 3.5, 1.2, new Point(310, 0), 4, false, AssetManager.PATH1);
			new Path(30, 6, 3.2, 1.1, new Point(556, 0), 4, false, AssetManager.PATH1);
			new Path(15, 6, 3.2, 2.5, new Point(200, 0), 4, true, AssetManager.PATH2);
			new Path(15, 6, 3.2, 2.5, new Point(436, 0), 4, true, AssetManager.PATH2);
			
			// Spell 2
			new Path(30, 6, 40, 1.5, new Point(0, 0), 4, true, AssetManager.PATH3);
			new Path(25, 6, 41, 1.7, new Point(310, 0), 4, false, AssetManager.PATH1);
			new Path(30, 6, 43, 1.5, new Point(0, 0), 4, true, AssetManager.PATH4);
			new Path(30, 6, 43, 1.5, new Point(80, 0), 5, true, AssetManager.PATH2);
			new Path(30, 6, 43, 1.5, new Point(560, 0), 5, true, AssetManager.PATH2);
			
			waveStarted = true;
		}
	}

}