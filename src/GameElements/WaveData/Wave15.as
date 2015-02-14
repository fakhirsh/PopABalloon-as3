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
	public class Wave15 extends Wave 
	{
		
		public function Wave15() 
		{
			
		}
		
		override public function Init():void
		{
			//trace("Wave 15 initialized");
			
			DisplayNextWaveLbl(StartWave);
			
			waveStarted = false;
			
		}
		
		private function StartWave():void
		{
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			// Spell 1
			new Path(20, 6, 0.9, 1.5, new Point(0, 0), 5, true, AssetManager.PATH7);
			new Path(20, 6, 1.1, 1.5, new Point(0, 0), 3, true, AssetManager.PATH8);
			new Path(20, 6, 1.1, 1.5, new Point(0, 0), 5, true, AssetManager.PATH11);
			
			// Spell 2
			new Path(15, 6, 32.0, 0.9, new Point(0, 0), 5, false, AssetManager.PATH5);
			new Path(15, 6, 34.0, 0.9, new Point(0, 0), 5, true, AssetManager.PATH6);
			new Path(15, 6, 34.0, 0.9, new Point(0, 0), 5, true, AssetManager.PATH9);
			
			// Spell 3
			new Path(25, 5, 51.0, 1.0, new Point(0, 0), 5, false, AssetManager.PATH9);
			new Path(25, 5, 51.0, 1.0, new Point(73, 0), 1, false, AssetManager.PATH1);
			new Path(25, 5, 51.0, 1.0, new Point(436, 0), 4, false, AssetManager.PATH1);
			
			waveStarted = true;
		}
		
	}

}