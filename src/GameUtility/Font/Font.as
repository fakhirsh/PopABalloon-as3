package GameUtility.Font 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Point;
	/**
	 * ...
	 * @author fakhir
	 */
	public class Font 
	{
		protected var fontClassArray:Array;
		protected var fontArray:Array;
		private var container:Sprite;
		private var parent:Sprite;
		private var trailingX:Boolean;
		protected var SIZE:int;
		
		public function Font() 
		{
			
		}
		
		public function Init(parent_:Sprite, pos:Point, _size:int, _gap:int, _trailingX:Boolean = false):void
		{
			SIZE = _size;
			parent = parent_;
			trailingX = _trailingX;
			fontArray = new Array();
			container = new Sprite();
			parent.addChild(container);
			container.x = pos.x;
			container.y = pos.y;
			
			var i:int;
			var b:Bitmap;
			var width:int = 0;
			for(i = 1; i <= SIZE; i++)
			{
				b = new fontClassArray[0]();
				b.x = width;
				width = i * (b.width + _gap);
				container.addChild(b);
				fontArray.push(b);
			}
			
			if(trailingX)
			{
				b = new fontClassArray[10]();
				b.x = width;
				b.y = 5;
				container.addChild(b);
				fontArray.push(b);
			}
		}
		
		public function SetLabel(n:int):void
		{
			if (n < 0) return;
			
			ResetLabel();
			
			var s:String = "" + n;
			
			var length:int;
			if(trailingX)
			{
				length = fontArray.length - 1;
			}
			else {
				length = fontArray.length;
			}
			
			for (var i:int = s.length - 1; i >= 0; i-- )
			{
				var bs:Bitmap = new fontClassArray[int(s.charAt(i))]();
				var bd:Bitmap = fontArray[length - 1];
				length--;
				bd.bitmapData = bs.bitmapData;
				bd.smoothing = true;
			}
		}
		
		public function ResetLabel():void
		{
			var length:int;
			if(trailingX)
			{
				length = fontArray.length - 1;
			}
			else {
				length = fontArray.length;
			}

			for (var i:int = 0; i < length; i++ )
			{
				var bs:Bitmap = new fontClassArray[0]();
				var bd:Bitmap = fontArray[i];
				bd.bitmapData = bs.bitmapData;
				bd.smoothing = true;
			}
		}
		
		public function set scaleX(sx:Number):void
		{
			container.scaleX = sx;
		}
		
		public function set scaleY(sy:Number):void
		{
			container.scaleY = sy;
		}
		
		public function set alpha(a:Number):void
		{
			container.alpha = a;
		}

		public function get scaleX():Number
		{
			return container.scaleX;
		}
		
		public function get scaleY():Number
		{
			return container.scaleY;
		}
		
		public function get alpha():Number
		{
			return container.alpha;
		}

	}

}