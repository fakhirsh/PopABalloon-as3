package Scenes 
{
	import AssetMgr.*;
	import com.coreyoneil.collision.CollisionList;
	import CoreGameEngine.*;
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	import GameElements.*;
	import GameUtility.Font.*;
	import GameUtility.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	import GameElements.WaveData.*;
	//import mochi.as3.*;
		
	/**
	 * ...
	 * @author fakhir
	 */
	public class Gameplay extends GameState 
	{
		private var player:Player;
		
		public var waveCount:int;
		public var lives:int;
		private var prev_score:int;
		public var score:int;
		private var gameRunning:Boolean;
		private var balloonManager:BalloonManager;
		private var comboState:int;
		private var comboCount:int;
		private var comboTimer:Timer;
		private var comboValid:Boolean = false;
		private const LIFE_INCREASE_INTERVAL:int = 2000;
		private var retryBtn:Sprite;
		
		public function Gameplay() 
		{
			
		}
		
		override public function Load():void 
		{
			trace("Gameplay.Load()");
			GameplayLoaded();
			
			InitWaveList();
			
			var giu:GUI = new GUI(); // Has a lot of static functions. This line just initializes the data.
			
			waveCount = 0;
			lives = 3;
			prev_score = 0;
			score = 0;
			comboCount = 0;
			comboState = 0;
			
			comboTimer = new Timer(500, 1);
			comboTimer.addEventListener(TimerEvent.TIMER, ComboTimerFn);
			//comboTimer.start();
			
			Registry.gameplay = this;
			WaveManager.Init();
			
			//if (Registry.playingAgain)
			//{
			//	WaveManager.ChangeWaveNumber(3);
			//}
			//else
			//{
				WaveManager.ChangeWaveNumber(0);
			//}
			
			player = new Player();
			balloonManager = new BalloonManager();
			
			Registry.gameplayLayer.stage.addEventListener(MouseEvent.MOUSE_MOVE, MouseMove);
			
			Mouse.hide(); //make the mouse disappear
			Registry.gameplayLayer.mouseEnabled = false;
			gameRunning = true;
			
		}
		
		private function ComboTimerFn(e:TimerEvent):void 
		{
			comboValid = false;
			DisplayComboLbl(comboCount);
			comboCount = 0;
			comboState = 0;
		}
		
		private function MouseMove(e:MouseEvent):void 
		{
			player.MouseMove(e);
		}
		
		override public function UnLoad():void 
		{ 
			Registry.gameplayLayer.stage.removeEventListener(MouseEvent.MOUSE_MOVE, MouseMove);
			Mouse.show(); //make the mouse re-appear
			Registry.gameplayLayer.mouseEnabled = true;

		}
		
		override public function Init():void 
		{ 
			//trace("Gameplay.Init()");
		}
		
		override public function Free():void 
		{ 
			//trace("Gameplay.Free()");
			
			Utility.RemoveAllSpriteButtonsFromParent(Registry.guiLayer, null, null, ButtonMouseClickFn);
			Utility.RemoveSpriteChildrenFromParent(Registry.gameplayLayer);
			Utility.RemoveSpriteChildrenFromParent(Registry.guiLayer);
			//Utility.RemoveSpriteChildrenFromParent(Registry.playerLayer);
			
			//Registry.profiler = new Profiler(10, 10, Registry.guiLayer);
		}
		
		override public function Update(dt:Number):void 
		{
			
			if (!gameRunning) return;
			
			WaveManager.Update(dt);
			player.Update(dt);
			
			// Check collisions with player
			if (player.state == Player.STATE_NORMAL)
			{
				for (var i:int = 0; i < BalloonManager.GetLength(); i++ ) 
				{
					var b:Balloon = BalloonManager.GetBalloonAt(i);
					if (CheckCollosionByCollisionList(b.collisionMask, player.collisionMask))
					{
						
						if(b.type == Balloon.GOODBALLOON)
						{
							score += 10;
							if(score - prev_score >= LIFE_INCREASE_INTERVAL)
							{
								lives++;
								prev_score = score;
								DisplayLifeLbl();
							}

						}
						else 
						{
							lives--;
							player.GetShock();
						}
						
						ComboFSM(b.type);
						
						BalloonManager.RemoveBalloonAtIndex(i, true);
						
					}
				}
			}
			
			if (lives <= 0)
			{
				trace("GAME OVER");
				gameRunning = false;
				GameOver();
			}
			
			if((BalloonManager.GetLength() ==  0) && (Wave.waveStarted) && gameRunning)
			{
				WaveManager.ChangeNextWave();
			}
			
			GUI.UpdateScore(score);
			GUI.UpdateLives(lives);
			GUI.UpdateWaveNumber(waveCount + 1);
			GUI.UpdateCombo(comboCount);
			
		}
		
		private function ComboFSM(balloonType:String):void
		{	
			switch(comboState)
			{
				case 0:
					if(balloonType == Balloon.GOODBALLOON)
					{
						comboValid = true;
						comboTimer.start();
						comboState = 1;
						comboCount = 1;
					}
					break;
				case 1:
					if (balloonType == Balloon.BADBALLOON) 
					{
						comboState = 2;
					}
					else if (comboValid == false) 
					{
						comboState = 2;
					}
					else {
						comboTimer.stop();
						comboTimer.reset();
						comboTimer.start();
						comboState = 1;
						comboCount++;
					}
					break;
				
				case 2:
					comboTimer.stop();
					comboTimer.reset();
					comboValid = false;
					comboState = 0;
					comboCount = 0;
					break;
					
				default:
					comboState = 2;
					break;
					
			}
		}
		
		override public function Draw():void 
		{ 
			//trace("Gameplay.Draw()");
			//scoreLbl.SetLabel(score);
		}
		
		private function CheckCollosionByHitTest(a:Sprite, b:Sprite):Boolean 
		{
			if (a.hitTestObject(b))
			{
				return true;
			}
			else
			{
				return false;
			}
		}
		
		private function CheckCollosionByCollisionList(a:Sprite, b:Sprite):Boolean 
		{
			var collisionList:CollisionList = new CollisionList(a);
			collisionList.addItem(b);

			var collisions:Array = collisionList.checkCollisions();
 
			if(collisions.length > 0) 
			{
				return true;
			}
			else 
			{
				return false;
			}

		}
		
		private function GameOver():void
		{
		
			TrackGameOver();
			
			BalloonManager.RemoveAllBalloons(false);
			Registry.gameplayLayer.stage.removeEventListener(MouseEvent.MOUSE_MOVE, MouseMove);
			player.Destroy();

			DisplayGameOverScreen();
			CreateRetryButton();
			Mouse.show();
			Registry.gameplayLayer.mouseEnabled = false;
			
		}
		
		private function DisplayGameOverScreen():void
		{
			SoundManager.PlayWin2SFX();
			
			var b:Bitmap;
			b = new AssetManager.GameOverBGGFX();
			b.x = 128+10;
			b.y = 78;
			b.alpha = 0.3;
			Registry.guiLayer.addChild(b);
			
			b = new AssetManager.EndMsgLblGFX();
			b.x = 168-08;
			b.y = 88-5;
			Registry.guiLayer.addChild(b);
			
			var lbl:LargeFont = new LargeFont(Registry.guiLayer, new Point(250-50, 150+50), 7, -3);
			lbl.SetLabel(score);

			SubmitScore();
			
		}
		
		private function CreateRetryButton():void
		{
			Registry.playingAgain = true;
			
			var sWidth:int = Registry.guiLayer.stage.stageWidth;
			
			retryBtn = Utility.CreateSpriteButton(new AssetManager.RetryBtnGFX, new Point(sWidth/2,320), null, null, ButtonMouseClickFn);
			Registry.guiLayer.addChild(retryBtn);
			retryBtn.scaleX = 0.5;
			retryBtn.scaleY = 0.5;
			retryBtn.alpha = 0.0;
			retryBtn.name = "RetryBtnLBL";
			TweenMax.to(retryBtn, 0.6, {scaleX:1.0, scaleY:1.0, alpha:1.0, ease:Elastic.easeOut, delay:0.6});	
		}
		
		private function ButtonMouseClickFn(e:Event):void { 
			GameEngine.ChangeState(new Gameplay);
			TrackRetryGame();
		}
		
		
		private function InitWaveList():void
		{
			Registry.waveList = new Array();
			
			Registry.waveList.push(new Wave1());
			Registry.waveList.push(new Wave2());
			Registry.waveList.push(new Wave3());
			Registry.waveList.push(new Wave4());
			Registry.waveList.push(new Wave5());
			Registry.waveList.push(new Wave6());
			Registry.waveList.push(new Wave7());
			Registry.waveList.push(new Wave8());
			Registry.waveList.push(new Wave9());
			Registry.waveList.push(new Wave10());
			Registry.waveList.push(new Wave11());
			Registry.waveList.push(new Wave12());
			Registry.waveList.push(new Wave13());
			Registry.waveList.push(new Wave14());
			Registry.waveList.push(new Wave15());
			Registry.waveList.push(new Wave16());
		}
		
		
		public function DeleteLbl(lbl:Sprite):void
		{
			Registry.guiLayer.removeChild(lbl);
		}
	
		public function DisplayLifeLbl():void
		{
			SoundManager.PlayCombo1SFX();	
			GenerateParticles(new Point(Registry.guiLayer.stage.stageWidth / 2, 130), 10, 50, 0.8);
			var s:Sprite = new Sprite();

			var b:Bitmap = new AssetManager.Life1MSGGFX();
			b.smoothing = true;
			b.x = -b.width / 2;
			b.y = -b.height / 2;
			
			s.addChild(b);
			s.x = Registry.guiLayer.stage.stageWidth/2;
			s.y = 160;
			s.alpha = 0;
			s.scaleX = 0.4;
			s.scaleY = 0.4;
			Registry.guiLayer.addChild(s);
			
			TweenMax.to(s, 0.4 , { scaleX:1.0, scaleY:1.0, alpha:1.0, ease:Elastic.easeOut } );
			TweenMax.to(s, 0.1, { scaleX:0.4, scaleY:0.4, alpha:0.0, ease:Cubic.easeIn, delay:2.0, onComplete:DeleteLbl, onCompleteParams:[s] } );

		}
		
		public function DisplayComboLbl(combo:int):void
		{
			if (combo < 4) return;
			
			TrackCombos(combo);
			
			SoundManager.PlayCombo1SFX();	
			GenerateParticles(new Point(Registry.guiLayer.stage.stageWidth/2, 100), 30, 140, 1.2);
			
			trace(prev_score)
			
			score += combo * combo * 4;
			if(score - prev_score >= LIFE_INCREASE_INTERVAL)
			{
				lives++;
				prev_score = score;
				DisplayLifeLbl();
			}
			
			var s:Sprite = new Sprite();
			var lbl:LargeFont = new LargeFont(s, new Point(-50, -55), 2, -4, true);
			lbl.SetLabel(combo);
			
			var b:Bitmap = new AssetManager.ComboLbl2GFX();
			b.smoothing = true;
			b.x = -b.width / 2;
			b.y = -b.height / 2;
			
			s.addChild(b);
			s.x = Registry.guiLayer.stage.stageWidth/2;
			s.y = 120;
			s.alpha = 0;
			s.scaleX = 0.4;
			s.scaleY = 0.4;
			Registry.guiLayer.addChild(s);
			
			TweenMax.to(s, 0.4 , { scaleX:1.0, scaleY:1.0, alpha:1.0, ease:Elastic.easeOut } );
			TweenMax.to(s, 0.1, { scaleX:0.4, scaleY:0.4, alpha:0.0, ease:Cubic.easeIn, delay:2.0, onComplete:DeleteLbl, onCompleteParams:[s] } );
			//TweenMax.to(b, 0.1 , { delay:1.5, onComplete:waveStartFn } );

		}
		
		private function GenerateParticles(pos:Point, NUM:int, DIST:Number, duration:Number):void
		{
			//var DIST:Number = 140;
			for (var i:int = 0; i < NUM; i++ )
			{
				var dist:Number = Math.random() * DIST/2 + DIST/2;
				var angle:Number = Math.random() * 360;
				var endP:Point = new Point(pos.x + dist * Math.cos(angle), pos.y + dist * Math.sin(angle));
				
				Registry.gameplayLayer.addChild(new Particle(pos, endP, duration));
			}
		}
		
		private function SubmitScore():void
		{
			var gameScore:int = score;
			
			var o:Object = { n: [8, 2, 15, 13, 5, 6, 12, 5, 4, 3, 8, 5, 13, 5, 10, 9], f: function (i:Number,s:String):String { if (s.length == 16) return s; return this.f(i+1,s + this.n[i].toString(16));}};
			var boardID:String = o.f(0,"82fd56c54385d5a9");
			//MochiScores.showLeaderboard( { boardID: boardID, score: gameScore } );	
			
		}
		
		private function GameplayLoaded():void{
			Registry.gaTracker.trackPageview( "/GameplayLoaded");
		}
		
		private function TrackGameOver():void{
			Registry.gaTracker.trackPageview( "/GameOver");
		}
		
		private function TrackRetryGame():void{
			Registry.gaTracker.trackPageview( "/RetryGame");
		}
		
		private function TrackCombos(n:int):void{
			Registry.gaTracker.trackPageview( "/combos?combo=" + n);
		}
	}

}