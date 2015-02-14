package 
{
	import AssetMgr.SoundManager;
	import com.google.analytics.AnalyticsTracker;
	import com.google.analytics.GATracker;
	import CoreGameEngine.*;
	import flash.ui.Keyboard;
	import GameElements.*;
	import GameUtility.*;
	import Scenes.*;
	import flash.display.Sprite;
	import flash.events.*;
	import com.greensock.plugins.*;
	
	/**
	 * ...
	 * @author fakhir
	 */
	
	[SWF(width="640", height="400", frameRate="30")]
	public class Main extends Sprite 
	{
		private var prevFrame:Date; // The time of the previous frame rendered.
		private var nextFrame:Date; // The present time.
		private var bg:Background;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			initTracking();
			
			prevFrame = new Date();
			
			Registry.gameEngine = new GameEngine();
			Registry.bgLayer = new Sprite();
			Registry.gameplayLayer = new Sprite();
			Registry.guiLayer = new Sprite();
			Registry.playerLayer = new Sprite();
			Registry.playingAgain = false;
			
			this.addChild(Registry.bgLayer);
			this.addChild(Registry.gameplayLayer);
			this.addChild(Registry.guiLayer);
			this.addChild(Registry.playerLayer);
			
			bg = new Background(Registry.bgLayer);
			
			TweenPlugin.activate([BezierPlugin]);			
			this.addEventListener(Event.ENTER_FRAME, Update);
			//this.stage.addEventListener(KeyboardEvent.KEY_DOWN, KeyDown);
			this.stage.addEventListener(KeyboardEvent.KEY_UP, KeyUp);
			//this.stage.addEventListener(MouseEvent.MOUSE_MOVE, MouseMove);
			
			Registry.soundMgr = new SoundManager();

			//Registry.profiler = new Profiler(10, 10, Registry.playerLayer);
			
			var gs:GameState = new SplashScreen1();
			//var gs:GameState = new Gameplay();
			//var gs:GameState = new MainMenu();
			GameEngine.ChangeState(gs);
		}
		
		private function onNewAchievement(e:Event):void 
		{
			
		}
		
		private function onUserAchievements(e:Event):void 
		{
			
		}
		
		private function onGameAchievements(e:Event):void 
		{
			
		}
		
		private function KeyUp(e:KeyboardEvent):void 
		{
			var key:uint = e.keyCode;
			switch (key) {
				case Keyboard.M:
					
					if (SoundManager.isSoundOn)
					{
						TrackSoundMuteOff();
						SoundManager.SoundOff();
						SoundManager.MusicOff();
					}
					else
					{
						TrackSoundMuteOn();
						SoundManager.SoundOn();
						SoundManager.MusicOn();
					}
					break;
			}
			
		}
		
		//private function MouseMove(e:MouseEvent):void 
		//{
		//}
		
		private function Update(e:Event):void 
		{
			nextFrame = new Date();
			var dt:Number = (nextFrame.time - prevFrame.time) / 1000;
			// Do your stuff here.
			
			GameEngine.Update(dt);
			GameEngine.Draw();
			
			prevFrame = nextFrame;
			
			//Registry.profiler.Update();
			
		}
		

		private function initTracking():void{
			Registry.gaTracker = new GATracker( this, "UA-00000000-1", "AS3", false );
			Registry.gaTracker.trackPageview( "/tracker-initated" );
		}

		private function TrackSoundMuteOn():void{
			Registry.gaTracker.trackPageview( "/TrackSoundMuteOn");
		}

		private function TrackSoundMuteOff():void{
			Registry.gaTracker.trackPageview( "/TrackSoundMuteOff");
		}
		
	}
	
}