package GameElements 
{
	import AssetMgr.*;
	import com.greensock.easing.*;
	import com.greensock.*;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	/**
	 * ...
	 * @author fakhir
	 */
	public class Balloon 
	{
		public static const GOODBALLOON:String = "GoodBalloon";
		public static const BADBALLOON:String = "BadBalloon";
		
		private var _score:int;
		private var _damage:int;
		private var _type:String;
		private var bitmapContainer:Sprite;
		private var goodies:Sprite;
		private var mainContainer:Sprite;
		private var _isAlive:Boolean;
		private var tmpTimer:Timer;
		
		public function Balloon(typeP:String, scoreP:int, damageP:int, autoRotate:Boolean = false) 
		{
			_score = scoreP;
			_type = typeP;
			_damage = damageP;
			
			bitmapContainer = new Sprite();
			goodies = new Sprite();
			
			var b:Bitmap;
			if(_type == GOODBALLOON)
			{
				CreateStars();
				b = new AssetManager.BalloonGreenGFX();
			}
			else
			{
				CreateBolt();
				b = new AssetManager.BalloonRedGFX();
			}

			b.x = -b.width / 2;
			b.y = -b.height / 2;
			b.smoothing = true;
			
			bitmapContainer.addChild(b);
			
			mainContainer = new Sprite();
			mainContainer.addChild(bitmapContainer);
			mainContainer.addChild(goodies);
			
			if(autoRotate == true)
			{
				mainContainer.rotation = 90;
			}
			
			Registry.gameplayLayer.addChild(mainContainer);
			//bitmapContainer.alpha = 0.5;
			goodies.alpha = 0.8;
			
			_isAlive = true;
			
			tmpTimer = new Timer(3000, 1);
			tmpTimer.addEventListener(TimerEvent.TIMER, TmpTimer);
			//tmpTimer.start();
			
			var timeLine:TimelineMax = new TimelineMax({repeat:-1});
			timeLine.append(new TweenMax(bitmapContainer, 0.5 , { scaleX:0.95, scaleY:0.95 , ease:Linear.easeIn} ));
			timeLine.append(new TweenMax(bitmapContainer, 0.5 , { scaleX:1.05, scaleY:1.05 , ease:Linear.easeIn} ));
		
		}
		
		private function TmpTimer(e:TimerEvent):void 
		{
			Destroy(true);
		}
		
		public function Update(dt:Number):void
		{
			
		}
		
		public function get x():Number 
		{
			return mainContainer.x;
		}
		
		public function get y():Number 
		{
			return mainContainer.y;
		}
		
		public function get rotation():Number 
		{
			return bitmapContainer.rotation;
		}
		
		public function set x(x_:Number):void
		{
			mainContainer.x = x_;
		}
		
		public function set y(y_:Number):void
		{
			mainContainer.y = y_;
		}
		
		public function set rotation(rot:Number):void
		{
			if(bitmapContainer != null)
				bitmapContainer.rotation = rot;
		}
		
		public function get type():String
		{
			return _type;
		}
		
		public function get collisionMask():Sprite
		{
			return bitmapContainer;
		}
		
		public function get isAlive():Boolean
		{
			return _isAlive;
		}
		
		public function CreateBolt():void
		{
			goodies.addChild(CreateBitmap(AssetManager.BoltGFX));
		}

		public function CreateStars():void
		{
			goodies.addChild(CreateBitmap(AssetManager.StarGFX));
		}
		
		private function CreateBitmap(BMPClass:Class):Bitmap
		{
			var b:Bitmap = new BMPClass();
			b.x = -b.width / 2;
			b.y = -b.height / 2;
			b.smoothing = true;
			return b;
		}
		
		public function Destroy(playAnimation:Boolean = false):void
		{
			if(playAnimation)
			{
				SoundManager.PlayPopSFX();
				
				var b:Bitmap = new AssetManager.PoofCloudGFX();
				b.x = -b.width / 2;
				b.y = -b.height / 2;
				b.smoothing = true;
				
				var s:Sprite = new Sprite();
				s.addChild(b);
				s.x = this.x;
				s.y = this.y;
				s.rotation = this.rotation;
				Registry.gameplayLayer.addChild(s);
				
				TweenMax.to(s, 0.5, { scaleX:2.0, scaleY:2.0, alpha:0 } );
				
				if(_type == GOODBALLOON)
				{
					GenerateParticles(new Point(s.x, s.y));
				}
			}
			
			_isAlive = false;
			
			TweenMax.killTweensOf(bitmapContainer);
			mainContainer.removeChild(bitmapContainer);
			bitmapContainer = null;
			TweenMax.killTweensOf(goodies);
			mainContainer.removeChild(goodies);
			TweenMax.killTweensOf(mainContainer);
			Registry.gameplayLayer.removeChild(mainContainer);
		}
		
		private function GenerateParticles(pos:Point):void
		{
			var DIST:Number = 65;
			for (var i:int = 0; i < 7; i++ )
			{
				var dist:Number = Math.random() * DIST/2 + DIST/2;
				var angle:Number = Math.random() * 360;
				var endP:Point = new Point(pos.x + dist * Math.cos(angle), pos.y + dist * Math.sin(angle));
				
				Registry.gameplayLayer.addChild(new Particle(pos, endP, 0.5));
			}
		}
	}

}