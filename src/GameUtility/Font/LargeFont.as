package GameUtility.Font 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author fakhir
	 */
	public class LargeFont extends Font 
	{
		
		[Embed(source = "../../../assets/artwork/text/font/large/0.png")] private var D0GFX:Class;
		[Embed(source = "../../../assets/artwork/text/font/large/1.png")] private var D1GFX:Class;
		[Embed(source = "../../../assets/artwork/text/font/large/2.png")] private var D2GFX:Class;
		[Embed(source = "../../../assets/artwork/text/font/large/3.png")] private var D3GFX:Class;
		[Embed(source = "../../../assets/artwork/text/font/large/4.png")] private var D4GFX:Class;
		[Embed(source = "../../../assets/artwork/text/font/large/5.png")] private var D5GFX:Class;
		[Embed(source = "../../../assets/artwork/text/font/large/6.png")] private var D6GFX:Class;
		[Embed(source = "../../../assets/artwork/text/font/large/7.png")] private var D7GFX:Class;
		[Embed(source = "../../../assets/artwork/text/font/large/8.png")] private var D8GFX:Class;
		[Embed(source = "../../../assets/artwork/text/font/large/9.png")] private var D9GFX:Class;
		[Embed(source = "../../../assets/artwork/text/font/large/X.png")] private var DXGFX:Class;
		
		public function LargeFont(parent:Sprite, pos:Point, _size:int, gap:int, _trailingX:Boolean = false) 
		{
			fontClassArray = new Array();
			fontClassArray.push(D0GFX);
			fontClassArray.push(D1GFX);
			fontClassArray.push(D2GFX);
			fontClassArray.push(D3GFX);
			fontClassArray.push(D4GFX);
			fontClassArray.push(D5GFX);
			fontClassArray.push(D6GFX);
			fontClassArray.push(D7GFX);
			fontClassArray.push(D8GFX);
			fontClassArray.push(D9GFX);
			fontClassArray.push(DXGFX);
			
			Init(parent, pos, _size, gap, _trailingX);
		}
	
	}

}