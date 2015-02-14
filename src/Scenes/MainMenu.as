package Scenes 
{
	import AssetMgr.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	import CoreGameEngine.*;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import GameUtility.Utility;
	import flash.net.*;

	
	/**
	 * ...
	 * @author fakhir
	 */
	public class MainMenu extends GameState 
	{
		private var playBtn:Sprite;
		private var creditsBtn:Sprite;
		private var moreGamesBtn:Sprite;
		private var balloonArray:Array;
		private var title:Sprite;
		private var muteMsg:Sprite;
		
		public function MainMenu() 
		{

		}
		
		override public function Load():void 
		{
			trace("MainMenu.Load()");
			MainMenuLoaded();
			
			balloonArray = new Array();
			
			var sWidth:Number = Registry.guiLayer.stage.stageWidth;
			
			// Main Title
			AddTitle();
			
			InitMenuButtons();
			InitBalloons();
		}
		
		override public function UnLoad():void 
		{ 
			Registry.guiLayer.removeChild(muteMsg);
			RemoveMenuButtons();
			RemoveBalloons();
			RemoveTitle();
		}
		
		override public function Init():void { 
			//trace("MainMenu.Init()");
		}
		
		override public function Free():void { 
			//trace("MainMenu.Free()");
		}
		
		override public function Update(dt:Number):void { 
			//trace("MainMenu.Update()");
		}
		
		override public function Draw():void { 
			//trace("MainMenu.Draw()");
		}
		
		private function InitMenuButtons():void{
			
			var sWidth:Number = Registry.guiLayer.stage.stageWidth;
			
			// Play BTN
			playBtn = Utility.CreateSpriteButton(new AssetManager.PlayBtnGFX(), new Point(sWidth/2,263), null, null, ButtonMouseClickFn);
			Registry.guiLayer.addChild(playBtn);
			playBtn.scaleX = 0.5;
			playBtn.scaleY = 0.5;
			playBtn.alpha = 0.0;
			playBtn.name = "PlayBtnLBL";
			TweenMax.to(playBtn, 0.6, {scaleX:1.0, scaleY:1.0, alpha:1.0, ease:Elastic.easeOut, delay:0.6});
			
			// Credits BTN
			//creditsBtn = Utility.CreateSpriteButton(new AssetManager.CreditsBtnGFX(), new Point(sWidth/2,306), null, null, ButtonMouseClickFn);
			//Registry.guiLayer.addChild(creditsBtn);
			//creditsBtn.scaleX = 0.5;
			//creditsBtn.scaleY = 0.5;
			//creditsBtn.alpha = 0.0;
			//creditsBtn.name = "CreditsBtnLBL";
			//TweenMax.to(creditsBtn, 0.6, {scaleX:1.0, scaleY:1.0, alpha:1.0, ease:Elastic.easeOut, delay:0.8});

			// more games BTN
			moreGamesBtn = Utility.CreateSpriteButton(new AssetManager.MoreGamesBtnGFX(), new Point(sWidth/2,312), null, null, ButtonMouseClickFn);
			Registry.guiLayer.addChild(moreGamesBtn);
			moreGamesBtn.scaleX = 0.5;
			moreGamesBtn.scaleY = 0.5;
			moreGamesBtn.alpha = 0.0;
			moreGamesBtn.name = "MoreGamesBtnLBL";
			TweenMax.to(moreGamesBtn, 0.6, {scaleX:1.0, scaleY:1.0, alpha:1.0, ease:Elastic.easeOut, delay:0.8});

			var b:Bitmap = new AssetManager.HelpMsg4GFX();
			b.x = -b.width / 2;
			b.y = -b.height / 2;
			muteMsg = new Sprite();
			muteMsg.addChild(b);
			muteMsg.x = sWidth / 2;
			muteMsg.y = 375;
			Registry.guiLayer.addChild(muteMsg);
			
		}
		
		private function RemoveMenuButtons():void
		{
			// First remove the buttons
			Utility.RemoveSpriteButtonFromParent(Registry.guiLayer, playBtn, null, null, ButtonMouseClickFn);
			Utility.RemoveSpriteButtonFromParent(Registry.guiLayer, creditsBtn, null, null, ButtonMouseClickFn);
			Utility.RemoveSpriteButtonFromParent(Registry.guiLayer, moreGamesBtn, null, null, ButtonMouseClickFn);
			
		}
		
		private function InitBalloons():void
		{
			var b:Bitmap;
			for (var i:int; i < 10; i++ )
			{
				var r:Number = Math.random() * 10;
				if (r <= 3)
				{
					b = new AssetManager.BalloonRedGFX();	
				}
				else 
				{
					b = new AssetManager.BalloonGreenGFX();	
				}
				
				b.x = Math.random() * (Registry.gameplayLayer.stage.stageWidth - b.width) + b.width / 2
				b.y = Registry.gameplayLayer.stage.stageHeight + b.height;
				Registry.gameplayLayer.addChild(b);
				var t:Number = Math.random() * 10 + 15;
				TweenMax.to(b, t, { x:b.x, y: -b.height, ease:Linear.easeNone, repeat: -1 } );
				balloonArray.push(b);
			}
		}
		
		private function RemoveBalloons():void
		{
			for (var i:int = 0; i < balloonArray.length; i++ )
			{
				TweenMax.killTweensOf(balloonArray[i]);
				Registry.gameplayLayer.removeChild(balloonArray[i]);
			}
		}
		
		private function AddTitle():void
		{
			var sWidth:Number = Registry.guiLayer.stage.stageWidth;
			title = Utility.BitmapToSprite(new AssetManager.MainTitleGFX());
			Registry.guiLayer.addChild(title);
			title.x = sWidth/2;
			title.y = 141;
			TweenMax.to(title, 2.5, { y:141 + 5, repeat: -1, yoyo:true } );
		}
		
		private function RemoveTitle():void
		{
			TweenMax.killTweensOf(title);
			Registry.guiLayer.removeChild(title);
		}
		
		/**
		 * Called when ever the mouse hovers over a sprite/button.
		 * @param event The event data structure containing the reference to the caller sprite/object.
		*/
		
		private function ButtonMouseClickFn(e:Event):void { 
			
			if(e.target.name == "logoSmall"){
				navigateToURL(new URLRequest("https://www.facebook.com/gamesbyfakhir"), "_blank");
			}
			else if(e.target.name == "CreditsBtnLBL"){
				GameEngine.ChangeState(new Credits);
			}
			else if (e.target.name == "PlayBtnLBL") {
				PlayClicked();
				GameEngine.ChangeState(new Gameplay);
			}
			else if (e.target.name == "MoreGamesBtnLBL") {
				MoreGamesCLicked();
				navigateToURL(new URLRequest("https://www.facebook.com/gamesbyfakhir"), "_blank");
			}
		}
		
		private function MainMenuLoaded():void{
			Registry.gaTracker.trackPageview( "/MainMenuLoaded");
		}
		
		private function PlayClicked():void{
			Registry.gaTracker.trackPageview( "/MainMenuPlayBtnClick");
		}

		private function MoreGamesCLicked():void{
			Registry.gaTracker.trackPageview( "/MainMenuMoreGamesClick");
		}
		
	}

}