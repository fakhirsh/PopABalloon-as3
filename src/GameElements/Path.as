package GameElements
{
	import AssetMgr.SoundManager;
	import com.greensock.easing.*;
	import com.greensock.*;
	import flash.display.DisplayObjectContainer;
	import flash.geom.Point;
	import GameUtility.Utility;
	
	/**
	 * ...
	 * @author fakhir
	 */
	public class Path 
	{
		protected var pointArray:Array;				// Array of Points
		protected var balloonTrailFn:Function;		// Array of Function pointers describing what balloons are inserted in trail and how
		protected var container:DisplayObjectContainer;
		protected var segments:int;
		protected var numBalloons:int;
		protected var balloonSpawnDelay:Number;
		protected var initialDelay:Number;
		protected var pathTraversalTime:Number;
		protected var timeline:TimelineLite
		
		public function Path(numBalloons:int, pathTraversalTime_:Number, initialDelay:Number, spawnDelay:Number, translate:Point, balloonTrainFnNumber:int, autoRotate:Boolean, pathDesc:String)
		{
			Init(container, pathDesc, translate, -1, numBalloons, pathTraversalTime_, initialDelay, spawnDelay);
			RunBalloonTrailFunction(balloonTrainFnNumber, autoRotate);
		}
		
		public function Init(containerParam:DisplayObjectContainer, pathString:String, translation:Point, segParam:int, numBalloonsParam:int, pathTraversalTimeParam:Number, initialDelayParam:Number, balloonSpawnDelayParam:Number):void
		{
			//pointArray = Utility.StringToPointList(pathString, translation, segParam);
			pointArray = Utility.StringToBezierCurveList(pathString, translation);
			container = Registry.gameplayLayer;
			segments = segParam;
			numBalloons = numBalloonsParam;
			initialDelay = initialDelayParam;
			balloonSpawnDelay = balloonSpawnDelayParam;
			pathTraversalTime = pathTraversalTimeParam;
		}
		
		public function DumpPathData():void
		{
			for (var i:int = 0; i < pointArray.length; i++ ) 
			{
				trace("x: " + pointArray[i].x + "  - y: " + pointArray[i].y);
			}
		}

		public function DeleteBalloon(b:Balloon):void
		{
			// sprite is still on the sage, meaning it escaped the saw 
			if (b.collisionMask != null)
			{
				// Make sure it's a Good balloon before taking a life
				if(b.type == Balloon.GOODBALLOON){
					Registry.gameplay.lives--;
					SoundManager.PlayLoseALifeSFX();
					//trace("Going outside");
				}
				BalloonManager.RemoveBalloon(b);
			}
			else
			{
				// The saw has already deleted the balloon. No need to delete it again
			}
			
		}
		
		/*
		public function GenerateBalloons(BalloonClassArray:Array):void
		{
			var timePerSeg:Number = pathTraversalTime / segments;

			for (var i:int = 0; i < numBalloons; i++)
			{
				var b:Balloon = new BalloonClassArray[i](Registry.gameplayLayer);
				b.sprite.x = pointArray[0].x;
				b.sprite.y = pointArray[0].y;
				BalloonManager.AddBalloon(b);
				
				timeline = new TimelineLite({onComplete:DeleteBalloon, onCompleteParams:[b], delay:initialDelay + balloonSpawnDelay*i});
				
				for (var j:int = 0; j < pointArray.length; j++ ) {
					timeline.append(new TweenLite(b.sprite,timePerSeg , { x:pointArray[j].x, y:pointArray[j].y , ease:Linear.easeIn} ));
				}
			}
		}
		*/
		
		public function GenerateBalloons(BalloonTypes:Array, autoRotate:Boolean=false):void
		{
			var timePerSeg:Number = pathTraversalTime / (pointArray.length - 1);

			for (var i:int = 0; i < numBalloons; i++)
			{
				//var b:Balloon = new BalloonClassArray[i](Registry.gameplayLayer, autoRotate);
				var b:Balloon  = new Balloon(BalloonTypes[i], 1, 0, autoRotate);
				b.x = pointArray[0].x;
				b.y = pointArray[0].y;
				BalloonManager.AddBalloon(b);
				
				timeline = new TimelineLite({onComplete:DeleteBalloon, onCompleteParams:[b], delay:initialDelay + balloonSpawnDelay*i});
				
				for (var j:int = 1; j < pointArray.length; j++ ) {
					//timeline.append(new TweenLite(b.sprite,timePerSeg , { x:pointArray[j].x, y:pointArray[j].y , ease:Linear.easeIn} ));
					
					var p1:Point = pointArray[j][0];
					var p2:Point = pointArray[j][1];
					var p3:Point = pointArray[j][2];
					
					timeline.append(new TweenMax(b, timePerSeg, {bezier:[{x:p1.x, y:p1.y}, {x:p2.x, y:p2.y}, {x:p3.x, y:p3.y}], orientToBezier:autoRotate} ));
				}
			}
		}
		
		public function BalloonTrail1(autoRotate:Boolean = false):void
		{
			var BalloonTypes:Array = new Array();
			
			for (var i:int = 0; i < numBalloons; i++ )
			{
				BalloonTypes.push(Balloon.GOODBALLOON);
			}
			
			GenerateBalloons(BalloonTypes, autoRotate);
		}
		

		public function BalloonTrail2(autoRotate:Boolean = false):void
		{
			var BalloonTypes:Array = new Array();
			
			for (var i:int = 0; i < numBalloons; i++ )
			{
				BalloonTypes.push(Balloon.BADBALLOON);
			}
			
			GenerateBalloons(BalloonTypes, autoRotate);
		}
		
		public function BalloonTrail3(autoRotate:Boolean = false):void
		{
			var BalloonTypes:Array = new Array();
			
			// Make sure there is ATLEAST one bad balloon
			BalloonTypes.push(Balloon.BADBALLOON);
			
			for (var i:int = 0; i < numBalloons-1; i++ )
			{
				var r:int = Math.random() * 5;
				switch(r) 
				{
					case 0:
					case 1:
					case 2:
						BalloonTypes.push(Balloon.GOODBALLOON);
						break;
					case 3:
					case 4:
						BalloonTypes.push(Balloon.BADBALLOON);
						break;
					default:
						break;
				}
			}
			
			GenerateBalloons(BalloonTypes, autoRotate);
		}

		public function BalloonTrail4(autoRotate:Boolean = false):void
		{
			var BalloonTypes:Array = new Array();
			
			// Make sure there is ATLEAST one bad balloon
			BalloonTypes.push(Balloon.BADBALLOON);
			
			var switchBalloonClass:Boolean = false;
			for (var i:int = 0; i < numBalloons; i++ )
			{
				if (switchBalloonClass)
				{
					BalloonTypes.push(Balloon.BADBALLOON);
					switchBalloonClass = false;
				}
				else
				{
					BalloonTypes.push(Balloon.GOODBALLOON);
					switchBalloonClass = true;
				}
			}
			
			GenerateBalloons(BalloonTypes, autoRotate);
		}
		
		public function BalloonTrail5(autoRotate:Boolean = false):void
		{
			var BalloonTypes:Array = new Array();
			
			// Make sure there is ATLEAST one bad balloon
			BalloonTypes.push(Balloon.BADBALLOON);
			
			for (var i:int = 0; i < numBalloons-1; i++ )
			{
				var r:int = Math.random() * 10;
				switch(r) 
				{
					case 0:
					case 1:
					case 2:
					case 3:
					case 4:
					case 5:
					case 6:
					case 7:
						BalloonTypes.push(Balloon.GOODBALLOON);
						break;
					case 8:
					case 9:
						BalloonTypes.push(Balloon.BADBALLOON);
						break;
					default:
						BalloonTypes.push(Balloon.GOODBALLOON);
						break;
				}
			}
			
			GenerateBalloons(BalloonTypes, autoRotate);
		}
		
		public function RunBalloonTrailFunction(n:int, autoRotate:Boolean = false):void
		{
			switch(n)
			{
				case 1:
					BalloonTrail1(autoRotate);
					break;
				case 2:
					BalloonTrail2(autoRotate);
					break;
				case 3:
					BalloonTrail3(autoRotate);
					break;
				case 4:
					BalloonTrail4(autoRotate);
					break;
				case 5:
					BalloonTrail5(autoRotate);
					break;
					
				default:
					break;
			}
		}
		
	}
	
}