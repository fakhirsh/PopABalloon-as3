
package GameElements.WaveData
{
	import AssetMgr.*;
	import com.greensock.*;
	import flash.display.*;
	import flash.geom.Point;
	import GameElements.*;
	import GameUtility.*;
	import com.greensock.easing.*;

	/**
	 * ...
	 * @author fakhir
	 */
	public class Wave1 extends Wave 
	{
		[Embed(source = "../../../assets/artwork/text/helpMsg1.png")] private var HelpMsg1GFX:Class;
		
		public function Wave1()
		{
			
		}

		override public function Init():void
		{
			//trace("Wave 1 initialized");
			
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			//var p1:Path = new Path(4, 15, 2.0, 2.2, new Point( -30, 0), 1, false, AssetManager.PATH1);
			//var p2:Path = new Path(4, 16, 3.2, 2.2, new Point( 70, 0), 1, false, AssetManager.PATH1);
			
			SoundManager.PlayNextWaveSFX();
			
			var b:Bitmap = new HelpMsg1GFX();
			b.smoothing = true;
			b.x = -b.width / 2;
			b.y = -b.height / 2;
			var s:Sprite = new Sprite();
			s.addChild(b);
			s.x = Registry.bgLayer.stage.stageWidth / 2;
			s.y = 126;
			s.alpha = 0;
			s.scaleX = 0.4;
			s.scaleY = 0.4;
			Registry.guiLayer.addChild(s);
			
			TweenMax.to(s, 0.8 , { scaleX:1.0, scaleY:1.0, alpha:1.0, ease:Elastic.easeOut } );
			TweenMax.to(s, 0.1, { scaleX:0.4, scaleY:0.4, alpha:0.0, ease:Cubic.easeIn, delay:2.5, onComplete:DeleteLbl, onCompleteParams:[s] } );
			TweenMax.to(s, 0.1 , { delay:1.5, onComplete:StartWave } );
			
			
			b = new AssetManager.HelpMsg5GFX();
			b.smoothing = true;
			b.x = -b.width / 2;
			b.y = -b.height / 2;
			s = new Sprite();
			s.addChild(b);
			s.x = Registry.bgLayer.stage.stageWidth / 2;
			s.y = 210;
			s.alpha = 0;
			s.scaleX = 0.4;
			s.scaleY = 0.4;
			Registry.guiLayer.addChild(s);
			
			TweenMax.to(s, 0.8 , { scaleX:1.0, scaleY:1.0, alpha:1.0, ease:Elastic.easeOut, delay:1} );
			TweenMax.to(s, 0.1, { scaleX:0.4, scaleY:0.4, alpha:0.0, ease:Cubic.easeIn, delay:5.5, onComplete:DeleteLbl, onCompleteParams:[s] } );
			
			waveStarted = false;
		}
		
		private function StartWave():void
		{
			//trace("Wave 1 started");
			
			// Path1 args:--> numBalloons,  time to traverse Path, initialDelay to start path, balloon spawn delay, Balloon Trail function
			new Path(3, 10, 2.0, 3.2, new Point( 130, 0), 1, false, AssetManager.PATH1);
			new Path(3, 10, 3.2, 3.0, new Point( 330, 0), 1, false, AssetManager.PATH1);
			new Path(3, 10, 2.8, 3.5, new Point( 530, 0), 1, false, AssetManager.PATH1);
			
			waveStarted = true;
		}
		
	}
	
}