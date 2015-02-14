package 
{
	import AssetMgr.*;
	import com.google.analytics.AnalyticsTracker;
	import CoreGameEngine.GameEngine;
	import flash.display.Sprite;
	import GameUtility.*
	import Scenes.Gameplay;
	
	/**
	 * ...
	 * @author fakhir
	 */
	public class Registry 
	{
		public static var bgLayer:Sprite;
		public static var gameplay:Gameplay;
		public static var gameplayLayer:Sprite;
		public static var guiLayer:Sprite;
		public static var playerLayer:Sprite;
		public static var profiler:Profiler;
		public static var gameEngine:GameEngine;
		public static var soundMgr:SoundManager;
		public static var waveList:Array;
		public static var playingAgain:Boolean;
		public static var gaTracker:AnalyticsTracker;
		
		public function Registry()
		{
			
		}
	}
	
}