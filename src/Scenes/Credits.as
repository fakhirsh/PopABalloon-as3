package Scenes 
{
	import AssetMgr.*;
	import CoreGameEngine.GameEngine;
	import CoreGameEngine.GameState;
	import flash.display.*;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.geom.Point;
	import flash.net.*;
	import GameUtility.Utility;
	
	/**
	 * ...
	 * @author fakhir
	 */
	public class Credits extends GameState 
	{
		private var backBtn:Sprite;
		
		public function Credits() 
		{
			
		}
		
		override public function Load():void 
		{ 
						
			// Credits label
			var b:Bitmap = new AssetManager.CreditsLblGFX();
			b.x = -b.width / 2;
			b.y = -b.height / 2;
			var creditsLbl:Sprite = new Sprite();
			creditsLbl.addChild(b);
			creditsLbl.x = Registry.guiLayer.stage.stageWidth / 2;
			creditsLbl.y = 170;
			
			Registry.guiLayer.addChild(creditsLbl);
			creditsLbl.scaleX = 0.5;
			creditsLbl.scaleY = 0.5;
			creditsLbl.alpha = 0.0;
			creditsLbl.name = "CreditsLBL";
			TweenMax.to(creditsLbl, 0.6, {scaleX:1.0, scaleY:1.0, alpha:1.0, ease:Elastic.easeOut, delay:0.0});

			
			// Back BTN
			backBtn = Utility.CreateSpriteButton(new AssetManager.BackBtnGFX(), new Point(74,347), null, null, ButtonMouseClickFn);
			Registry.guiLayer.addChild(backBtn);
			backBtn.scaleX = 0.5;
			backBtn.scaleY = 0.5;
			backBtn.alpha = 0.0;
			backBtn.name = "BackBtnLBL";
			TweenMax.to(backBtn, 0.6, {scaleX:1.0, scaleY:1.0, alpha:1.0, ease:Elastic.easeOut, delay:0.6});
		}
		
		private function ButtonMouseClickFn(e:Event):void { 
			if(e.target.name == "BackBtnLBL"){
				GameEngine.ChangeState(new MainMenu());
			}
		}

		override public function UnLoad():void { 
			RemoveAllButtons();
			RemoveChildren(Registry.guiLayer);
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
		
		private function RemoveChildren(parent:Sprite):void {
			while (parent.numChildren > 0) {
				var child:Sprite = parent.getChildAt(0) as Sprite;
				RemoveChildFromParent(parent, child);
			}
		}
		
		private function RemoveChildFromParent(parent:Sprite, child:Sprite):void{
			
			if(child.hasEventListener(MouseEvent.CLICK)) child.removeEventListener(MouseEvent.CLICK, ButtonMouseClickFn);
			
			parent.removeChild(child);
		}
		
		private function RemoveAllButtons():void
		{
			Utility.RemoveSpriteButtonFromParent(Registry.guiLayer, backBtn, null, null, ButtonMouseClickFn);
		}
	}

}