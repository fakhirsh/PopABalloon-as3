package GameElements 
{
	import AssetMgr.*;
	import com.greensock.easing.*;
	import com.greensock.*;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	
	/**
	 * ...
	 * @author fakhir
	 */
	public class Background 
	{
		private var container:Sprite;
		
		public function Background(pContainer:Sprite) 
		{
			container = pContainer;
			
			var b:Bitmap = new AssetManager.BGGFX();
			var s:Number = container.stage.stageWidth / b.width;
			b.scaleX = s;
			b.scaleY = s;
			container.addChild(b);
			
			var c:Bitmap;
			var r:Sprite = new Sprite();
			var timeLine:TimelineMax;
			
			c = new AssetManager.RayGFX();
			c.smoothing = true;
			c.x = -c.width / 2;
			c.y = -c.height / 2;
			r.addChild(c);
			r.x = container.stage.stageWidth / 2;
			r.y = container.stage.stageHeight + 110;
			r.scaleX = 3.8;
			r.scaleY = 3.8;
			container.addChild(r);
			timeLine = new TimelineMax({repeat:-1});
			timeLine.append(new TweenMax(r, 65, {rotation:360, ease:Linear.easeIn } ));
			
			c = new AssetManager.Cloud1GFX();
			c.smoothing = true;
			c.x = container.stage.stageWidth + 100;
			c.y = 50;
			container.addChild(c);
			
			timeLine = new TimelineMax({repeat:-1});
			timeLine.append(new TweenMax(c, 15, {x:-c.width, y:c.y, ease:Linear.easeIn } ));

			c = new AssetManager.Cloud2GFX();
			c.smoothing = true;
			c.x = container.stage.stageWidth;
			c.y = 150;
			container.addChild(c);
			timeLine = new TimelineMax({repeat:-1});
			timeLine.append(new TweenMax(c, 25, {x:-c.width, y:c.y, ease:Linear.easeIn } ));
			
			c = new AssetManager.Cloud3GFX();
			c.smoothing = true;
			c.x = container.stage.stageWidth + 50;
			c.y = 280;
			container.addChild(c);
			timeLine = new TimelineMax({repeat:-1});
			timeLine.append(new TweenMax(c, 19, {x:-c.width, y:c.y, ease:Linear.easeIn } ));
			
		}
		
		public function Update(dt:Number):void
		{

		}
		
	}

}