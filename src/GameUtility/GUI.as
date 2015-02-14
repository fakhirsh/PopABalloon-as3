package GameUtility
{
	import AssetMgr.*;
	import flash.display.*;
	import flash.geom.Point;
	import GameUtility.Font.*;
	import com.greensock.*; 
	import com.greensock.easing.*;
	
	/**
	 * ...
	 * @author fakhir
	 */
	public class GUI 
	{
		private static var scoreFont:Font;
		private static var livesFont:Font;
		private static var comboFont:Font;
		private static var wavesFont:Font;
		
		public function GUI()
		{
			scoreFont = new LargeFont(Registry.guiLayer, new Point(218, 6), 7, -3);
			livesFont = new SmallFont(Registry.guiLayer, new Point(581, 10-5), 1, -3);
			comboFont = new SmallFont(Registry.guiLayer, new Point(581, 39-5), 2, -4, true);
			wavesFont = new SmallFont(Registry.guiLayer, new Point(123, 8-4), 3, -4);
			
			var b:Bitmap;
			b = new AssetManager.LivesLblGFX();
			b.x = 517-2;
			b.y = 12-8;
			Registry.guiLayer.addChild(b);
			
			b = new AssetManager.ComboLblGFX();
			b.x = 504+3;
			b.y = 41-6;
			Registry.guiLayer.addChild(b);

			b = new AssetManager.WaveLblGFX();
			b.x = 61;
			b.y = 5;
			Registry.guiLayer.addChild(b);
  
		}

		public static function UpdateWaveNumber(wave:int):void
		{
			wavesFont.SetLabel(wave);
		}

		public static function UpdateScore(score:int):void
		{
			if (score > 9999999) score = 9999999;
			
			scoreFont.SetLabel(score);
		}

		public static function UpdateLives(lives:int):void
		{
			if (lives < 0) lives = 0;
			livesFont.SetLabel(lives);
		}

		public static function UpdateCombo(combo:int):void
		{
			if (combo > 99) combo = 99;
			
			comboFont.SetLabel(combo);
		}

		
		//public static function DisplayGoodLbl():void
		//{
			//var b:Bitmap;
			//b = new AssetManager.GreatLblGFX();
		//}
		
		/*
		public static function UpdateScore(score:int):void
		{
			scoreLbl.text = "Score: " + score;
		}
		
		public static function UpdateLives(lives:int):void
		{
			livesLbl.text = "Lives: " + lives;
		}
		
		public static function UpdateCombo(combo:int):void
		{
			comboLbl.text = "Combo: " + combo;
		}
		
		public static function UpdateExtraLbl(string:String, scaleParam:Number=2.0):void
		{
			extraLbl.scaleX = scaleParam;
			extraLbl.scaleY = scaleParam;
			extraLbl.text = string;
		}
		*/
		
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//		TBD :: ONLY FOR TESTING...
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/*
		public static function MakeLabel(text:String, fontSize:int = 10):Sprite
		{
			var lbl:TextField = new TextField();
			lbl.mouseEnabled = false;
			lbl.text = text;
			lbl.width = 320;
			lbl.height = 200;
			//lbl.x = -320/2;
			
			var format:TextFormat = new TextFormat(); 
			format.size = fontSize; 
			//format.align = TextFormatAlign.CENTER;
			format.font = "Sansation_Regular";
			lbl.setTextFormat(format);  
			
			var s:Sprite = new Sprite();
			s.addChild(lbl);
			return s;
		}

		public static function DisplayAnimatedLabel(text:String, fontSize:Number, x:int, y:int, initialDelay:Number, delay:Number):void
		{
			var s:Sprite = MakeLabel(text, fontSize);
			s.x = x;
			s.y = y;
			s.alpha = 0;
			Registry.guiLayer.addChild(s);
			
			//TweenLite.to(s, 1, { scaleX:1.7, scaleY:1.7, ease:Elastic.easeOut, delay:3 } );
			
			var timeline:TimelineLite = new TimelineLite({onComplete:DeleteLbl, onCompleteParams:[s], delay:initialDelay});
				
			timeline.append(new TweenLite(s, 1, {alpha:1.0, scaleX:1.7, scaleY:1.7, ease:Elastic.easeOut } ));
			timeline.append(new TweenLite(s, delay, { scaleX:1.7, scaleY:1.7} ));
			
		}
		
		private static function DeleteLbl(s:Sprite):void
		{
			TweenLite.killTweensOf(s);
			Registry.guiLayer.removeChild(s);
			
		}
		*/
	}
	
}