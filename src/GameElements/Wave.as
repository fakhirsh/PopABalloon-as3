package GameElements
{
	import AssetMgr.AssetManager;
	import AssetMgr.SoundManager;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import GameUtility.GUI;
	import com.greensock.*; 
	import com.greensock.easing.*;

	/**
	 * ...
	 * @author fakhir
	 */
	
	public class Wave 
	{
		private static var nextWave_:Wave;
		public static var waveStarted:Boolean;
		
		public function Wave()
		{

		}

		public function Init():void
		{
			
		}
		
		public function Update(dt:Number):void
		{
			
		}
		
		public function Stop():void
		{
			
		}

		public function get nextWave():Wave
		{
			return nextWave_;
		}
		
		public function set nextWave(nextWaveParam:Wave):void
		{
			nextWave_ = nextWaveParam;
		}
		
		public function DeleteLbl(lbl:Sprite):void
		{
			Registry.guiLayer.removeChild(lbl);
		}
	
		public function DisplayNextWaveLbl(waveStartFn:Function):void
		{
			SoundManager.PlayNextWaveSFX();
			
			var b:Bitmap = new AssetManager.NextWaveLblGFX();
			b.smoothing = true;
			b.x = -b.width / 2;
			b.y = -b.height / 2;
			var s:Sprite = new Sprite();
			s.addChild(b);
			s.x = Registry.guiLayer.stage.stageWidth / 2;
			s.y = 176;
			s.alpha = 0;
			s.scaleX = 0.4;
			s.scaleY = 0.4;
			Registry.guiLayer.addChild(s);
			
			TweenMax.to(s, 0.8 , { scaleX:1.0, scaleY:1.0, alpha:1.0, ease:Elastic.easeOut } );
			TweenMax.to(s, 0.1, { scaleX:0.4, scaleY:0.4, alpha:0.0, ease:Cubic.easeIn, delay:2.5, onComplete:DeleteLbl, onCompleteParams:[s] } );
			TweenMax.to(s, 0.1 , { delay:1.5, onComplete:waveStartFn } );

		}
		
	}

	
}