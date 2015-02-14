package GameElements 
{
	import AssetMgr.AssetManager;
	import com.greensock.TweenMax;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author fakhir
	 */
	public class Particle extends Sprite 
	{
		private var texture:Bitmap;
		
		public function Particle(startPoint:Point, endPoint:Point, duration:Number) 
		{
			texture = new AssetManager.StarGFX();
			texture.x = -texture.width / 2;
			texture.y = -texture.height / 2;
			this.addChild(texture);
			
			this.x = startPoint.x;
			this.y = startPoint.y;
			
			TweenMax.to(this, duration, {alpha:0, x:endPoint.x, y:endPoint.y, onComplete:DeleteStar, onCompleteParams:[this] } );
			
		}
		
		public function DeleteStar(s:Sprite):void
		{
			Registry.gameplayLayer.removeChild(this);			
		}
		
		public function Update(dt:Number):void
		{
			
		}
		
	}

}