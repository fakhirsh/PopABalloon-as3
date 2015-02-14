package GameElements 
{
	import com.greensock.TweenLite;
	/**
	 * ...
	 * @author fakhir
	 */
	public class BalloonManager 
	{
		private static var balloonArray:Array;

		public function BalloonManager() 
		{
			balloonArray = new Array();
		}
		
		public static function AddBalloon(b:Balloon):void
		{
			balloonArray.push(b);
		}
		
		public static function RemoveBalloon(b:Balloon, playAnimation:Boolean=false):void
		{
			for (var i:int = 0; i < balloonArray.length; i++ )
			{
				if(b == balloonArray[i])
				{
					RemoveBalloonAtIndex(i, playAnimation);
				}
			}
		}
		
		public static function RemoveBalloonAtIndex(i:int, playAnimation:Boolean=false):void
		{
			var b:Balloon = balloonArray[i];
			b.Destroy(playAnimation);
			balloonArray.splice(i, 1);
			
		}
		
		public static function RemoveAllBalloons(playAnimation:Boolean):void
		{
			for (var i:int = 0; i < balloonArray.length; i++ )
			{
				var b:Balloon = balloonArray[i];
				b.Destroy(playAnimation);
			}

			for (i = 0; i < balloonArray.length; i++ )
			{
				balloonArray.splice(0,1);
			}
		}
		
		public static function Reset():void
		{
			for (var i:int = balloonArray.length - 1; i >= 0; i-- )
			{
				RemoveBalloonAtIndex(i, false);
			}
		}
		
		public static function GetLength():int
		{
			return balloonArray.length;
		}
		
		public static function GetBalloonAt(i:int):Balloon
		{
			return balloonArray[i];
		}
		
	}

}