package GameElements
{
	import GameUtility.GUI;
	import GameUtility.Utility;

	
	/**
	 * ...
	 * @author fakhir
	 */
	public class WaveManager 
	{
		private static var currentWave:Wave;
		private static var wavesCompleted:int;
		private static var currentWaveNumber:int;
		
		public function WaveManager()
		{
			
		}
		
		public static function Init():void
		{
			currentWave = null;
			wavesCompleted = 0;
			currentWaveNumber = -1;
		}
		
		private static function ChangeWave(wave:Wave):void
		{
			if(currentWave != null)
			{
				currentWave.Stop();
			}
			wave.Init();
			currentWave = wave;
		}
		
		public static function ChangeNextWave():void
		{	
			Utility.RemoveSpriteChildrenFromParent(Registry.gameplayLayer);
			
			currentWaveNumber = (currentWaveNumber + 1) % 16;
			
			if (Registry.gameplay.waveCount > 16 - 1)  // There are total 16 waves, and first wave is at index 0
			{
				currentWaveNumber = Math.random() * (16 - 6) + 6
			}
	
			//CheckAchievements();
			
			ChangeWave(Registry.waveList[currentWaveNumber]);
			Registry.gameplay.waveCount++;
			TrackWaveChanged(Registry.gameplay.waveCount+1);
		}
		
		private static function TrackWaveChanged(n:int):void
		{
			trace("/wave?wave=" + n);
			Registry.gaTracker.trackPageview( "/wave?wave=" + n);
		}

		public static function get waveNumber():int
		{
			return currentWaveNumber;
		}
		
		private static function CheckAchievements():void
		{
			// Successfully finished wave 1, now just starting wave 2...
			if (currentWaveNumber == 2)
			{
				
			}
		}
		
//////////////////////////////////////////////////////////////////////////////////////////////
//		ONLY FOR DEBUGGING..........
		public static function ChangeWaveNumber(n:int):void
		{
			ChangeWave(Registry.waveList[n]);
			currentWaveNumber = n;
		}
//////////////////////////////////////////////////////////////////////////////////////////////

		//public static function GetNextWave():Wave
		//{
		//	return currentWave.nextWave;
		//}
		
		//public static function ChangeNextWave():void
		//{
		//	if(currentWave != null)
		//	{
		//		currentWave.Stop();
		//	}
		//	var wave:Wave = currentWave.nextWave;
		//	if (wave != null)
		//	{
		//		wave.Init();
		//	}
		//	currentWave = wave;
		//}
		
		
		public static function Update(dt:Number):void
		{
			currentWave.Update(dt);
		}
		
		

	}
	
}