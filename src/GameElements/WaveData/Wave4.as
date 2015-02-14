
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
	public class Wave4 extends Wave 
	{
		//[Embed(source = "../../../assets/artwork/text/goodLuck.png")] private var GoodLuckLblGFX:Class;
	
		public function Wave4()
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
			new Path(15, 12, 3.0, 1.5, new Point(79, 0), 1, false, AssetManager.PATH1);
			new Path(15, 11, 3.5, 1.7, new Point(310, 0), 1, false, AssetManager.PATH1);
			new Path(15, 12, 3.2, 1.6, new Point(556, 0), 1, false, AssetManager.PATH1);
			new Path(9, 13, 3.2, 3.0, new Point(200, 0), 2, true, AssetManager.PATH2);
			new Path(9, 12, 3.2, 3.0, new Point(436, 0), 2, true, AssetManager.PATH2);
			
			// Spell 2
			new Path(18, 12, 30, 1.5, new Point(0, 0), 1, true, AssetManager.PATH3);
			new Path(15, 11, 31, 1.7, new Point(310, 0), 4, false, AssetManager.PATH1);
			new Path(18, 12, 33, 1.5, new Point(0, 0), 1, true, AssetManager.PATH4);
			
			
			waveStarted = true;
		}

		
	}
	
}