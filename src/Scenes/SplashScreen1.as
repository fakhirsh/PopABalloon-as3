package Scenes 
{
	import AssetMgr.*;
	import com.greensock.TweenMax;
	import com.greensock.easing.*;
	import CoreGameEngine.*;
	import flash.display.*;
	import flash.events.*;
	import flash.net.*;
	import flash.ui.Mouse;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author fakhir
	 */
	public class SplashScreen1 extends GameState
	{
		private var splashTimer:Timer;
		private var container:Sprite;
		
		public function SplashScreen1() 
		{
		}

		override public function Load():void 
		{ 
			splashTimer = new Timer(4000, 1);
			splashTimer.addEventListener(TimerEvent.TIMER, RunOnce);
			splashTimer.start();
			
			var logo:Bitmap = new AssetManager.LogoLargeGFX();
			logo.smoothing = true;
			logo.x = -logo.width / 2;
			logo.y = -logo.height / 2;
			container = new Sprite();
			container.alpha = 0;
			container.addChild(logo);
			container.x = Registry.gameplayLayer.stage.stageWidth / 2;
			container.y = Registry.gameplayLayer.stage.stageHeight / 2;
			Registry.gameplayLayer.addChild(container);
			
			TweenMax.to(container, 2, {alpha:1.0, delay:0.0});
			
			container.addEventListener(MouseEvent.MOUSE_OVER, ButtonMouseOverFn);
			container.addEventListener(MouseEvent.MOUSE_OUT, ButtonMouseOutFn);
			container.addEventListener(MouseEvent.CLICK, ButtonMouseClickFn);
			
			var b:Bitmap = new AssetManager.InfoMsgGFX();
			b.x = -b.width / 2;
			b.y = -b.height / 2;
			var s:Sprite = new Sprite();
			s.addChild(b);
			s.x = Registry.gameplayLayer.stage.stageWidth / 2;
			s.y = 350;
			s.alpha = 0;
			s.name = "InfoLBLGFX";
			Registry.gameplayLayer.addChild(s);
			TweenMax.to(s, 1, { alpha:1.0, delay:1.0 } );
			
			//trace("Hello from splash screen1...");
			
			SoundManager.PlayMusic();
		}
		
		private function ButtonMouseClickFn(e:MouseEvent):void 
		{
			navigateToURL(new URLRequest("https://www.facebook.com/gamesbyfakhir"), "_blank");
			LogoClicked();
		}
		
		private function ButtonMouseOutFn(e:MouseEvent):void 
		{
			//Mouse.cursor="arrow";
			TweenMax.to(e.target, 0.4, {scaleX:1.0, scaleY:1.0, ease:Elastic.easeOut});
		}
		
		private function ButtonMouseOverFn(e:MouseEvent):void 
		{
			//Mouse.cursor="button";
			TweenMax.to(e.target, 0.6, {scaleX:1.1, scaleY:1.1, ease:Elastic.easeOut});
		}
		
		private function RunOnce(e:TimerEvent):void 
		{
			//trace("Changing to main menu...");
			
			GameEngine.ChangeState(new MainMenu());
		}

		override public function UnLoad():void { 
			splashTimer.stop();
			splashTimer.reset();
			//Registry.gameplayLayer.removeChild(container);
			RemoveChildren(Registry.gameplayLayer);
			
		}
		
		override public function Init():void { 
			//trace("SplashScreen1.Init()");
		}
		
		override public function Free():void { 
			//trace("SplashScreen1.Free()");
		}
		
		override public function Update(dt:Number):void { 
			//trace("SplashScreen1.Update()");
		}
		
		override public function Draw():void { 
			//trace("SplashScreen1.Draw()");
		}
		
		private function RemoveChildren(parent:DisplayObjectContainer):void {
			while (parent.numChildren > 0) {
				RemoveChildFromParent(parent, parent.getChildAt(0));
			}
		}
		
		private function RemoveChildFromParent(parent:DisplayObjectContainer, child:DisplayObject):void{
			
			if(child.hasEventListener(MouseEvent.MOUSE_OVER)) child.removeEventListener(MouseEvent.MOUSE_OVER, ButtonMouseOverFn);
			if(child.hasEventListener(MouseEvent.MOUSE_OUT)) child.removeEventListener(MouseEvent.MOUSE_OUT, ButtonMouseOutFn);
			if(child.hasEventListener(MouseEvent.CLICK)) child.removeEventListener(MouseEvent.CLICK, ButtonMouseClickFn);
			
			parent.removeChild(child);
		}
		
		private function LogoClicked():void{
			Registry.gaTracker.trackPageview( "/SplashLogoClicked");
		}
		
	}

}