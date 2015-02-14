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
	public class Wave16 extends Wave 
	{
		
		public function Wave16() 
		{
			
		}
		
		override public function Init():void
		{
			//trace("Wave 16 initialized");
			
			DisplayNextWaveLbl(StartWave);
			
			waveStarted = false;

		}

		private function StartWave():void
		{
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			// Spell 1
			new Path(25, 8, 1.0, 0.65, new Point(0, 0), 5, true, AssetManager.PATH10);
			new Path(25, 8, 1.5, 0.65, new Point(0, 0), 5, true, AssetManager.PATH11);
			new Path(8, 8, 8.5, 1.3, new Point(300, 0), 5, true, AssetManager.PATH2);
			
			//Spell 2
			new Path(25, 6, 23.5, 1.0, new Point(0, 0), 5, true, AssetManager.PATH5);
			new Path(25, 6, 23.5, 1.0, new Point(0, 0), 5, true, AssetManager.PATH6);
			new Path(25, 6, 26.5, 1.0, new Point(300, 0), 5, true, AssetManager.PATH2);
			
			waveStarted = true;
		}
		
	}

}