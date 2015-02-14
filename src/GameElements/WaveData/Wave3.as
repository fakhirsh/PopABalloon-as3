
package GameElements.WaveData
{

	import AssetMgr.AssetManager;
	import AssetMgr.SoundManager;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import GameElements.*;
	import GameUtility.*;
	import flash.geom.Point;

	import com.greensock.*; 
	import com.greensock.easing.*;


	/**
	 * ...
	 * @author fakhir
	 */
	public class Wave3 extends Wave 
	{
		[Embed(source = "../../../assets/artwork/text/helpMsg3.png")] private var HelpMsg3GFX:Class;
		public function Wave3()
		{
		}
		
		override public function Init():void
		{
			
			//trace("Wave 3 initialized");
		
			SoundManager.PlayNextWaveSFX();
			
			var b:Bitmap = new HelpMsg3GFX();
			b.smoothing = true;
			b.x = -b.width / 2;
			b.y = -b.height / 2;
			var s:Sprite = new Sprite();
			s.addChild(b);
			s.x = Registry.bgLayer.stage.stageWidth / 2;
			s.y = 186;
			s.alpha = 0;
			s.scaleX = 0.4;
			s.scaleY = 0.4;
			Registry.guiLayer.addChild(s);
			
			TweenMax.to(s, 0.8 , { scaleX:1.0, scaleY:1.0, alpha:1.0, ease:Elastic.easeOut } );
			TweenMax.to(s, 0.1, { scaleX:0.4, scaleY:0.4, alpha:0.0, ease:Cubic.easeIn, delay:2.5, onComplete:DeleteLbl, onCompleteParams:[s] } );
			TweenMax.to(s, 0.1 , { delay:1.5, onComplete:StartWave } );
			
			waveStarted = false;
		
		}
		
		private function StartWave():void
		{
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			new Path(5, 8, 2.3, 1.2, new Point( 97, 0), 1, false, AssetManager.PATH1);
			new Path(5, 7, 2.6, 1.0, new Point(236 , 0), 5, false, AssetManager.PATH1);
			new Path(5, 8, 2.9, 1.2, new Point(383, 0), 1, false, AssetManager.PATH1);
			new Path(5, 8, 2.9, 1.2, new Point(587, 0), 2, false, AssetManager.PATH1);

			waveStarted = true;
		}
		
	}
	
}