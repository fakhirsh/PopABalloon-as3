package GameUtility
{
	import AssetMgr.*;
	import com.greensock.*;
	import com.greensock.easing.*;
	import flash.display.*;
	import flash.events.*;
	import flash.geom.Point;
	import flash.ui.Mouse;
	
	/**
	 * ...
	 * @author fakhir
	 */
	public class Utility 
	{
		public static function CubicBezier(u:Number, anchor1:Point, control1:Point, control2:Point, anchor2:Point):Point
		{
			
			var x:Number = Math.pow(u,3)*(anchor2.x+3*(control1.x-control2.x)-anchor1.x)
           +3*Math.pow(u,2)*(anchor1.x-2*control1.x+control2.x)
           +3*u*(control1.x-anchor1.x)+anchor1.x;
 
			var y:Number = Math.pow(u,3)*(anchor2.y+3*(control1.y-control2.y)-anchor1.y)
          +3*Math.pow(u,2)*(anchor1.y-2*control1.y+control2.y)
          +3*u*(control1.y-anchor1.y)+anchor1.y;
			
			return new Point(x, y);
		}
		/*
		 * The Numbers in the string MUST comtain '.' and trailing decimal digits or it WONT work
		 * eg: M 40 50 will NOT work. Correct is M 40.0 50.989
		 */
		public static function StringToPointList(curveString:String, transform:Point, SEGS:Number):Array
		{
			var pointList:Array = new Array();
			
			var p0:Point = new Point();
			var p1:Point = new Point();
			var p2:Point = new Point();
			var p3:Point = new Point();
			
			// first retrieve moveto: (m 87.98 89.87)
			var exp:RegExp = /(M (-*\d*\.*\d+),(-*\d*\.*\d+))/;
			var segs:Object = exp.exec( curveString );
			
			// First anchor point
			p0.x = Number(segs[2]) + transform.x;
			p0.y = Number(segs[3]) + transform.y;
			pointList.push(p0);
			
			// Now get all the curves in the string: (C 4.3,3.6 9.8,5.3 9.2,4.5)
			var segs2:Object;
			var exp2:RegExp = /((c|C) (-*\d*\.*\d+),(-*\d*\.*\d+) (-*\d*\.*\d+),(-*\d*\.*\d+) (-*\d*\.*\d+),(-*\d*\.*\d+))/g;
			//var segs2:Object = exp2.exec( curveString );
			while(segs2=exp2.exec(curveString))
			{
			  //trace(segs2[0] + ' = ' + segs2.index);
			  
			  p1.x = Number(segs2[3]) + transform.x;
			  p1.y = Number(segs2[4]) + transform.y;
			  p2.x = Number(segs2[5]) + transform.x;
			  p2.y = Number(segs2[6]) + transform.y;
			  p3.x = Number(segs2[7]) + transform.x;
			  p3.y = Number(segs2[8]) + transform.y;
			  
			  // Generate point list here
			  GetPointList(p0,p1,p2,p3,SEGS,pointList);
			  
			  p0 = new Point(p3.x, p3.y);

			}
			
			return pointList;
		}
		
		public static function GetPointList(p0:Point, p1:Point, p2:Point, p3:Point, SEGS:Number, pointList:Array):void
		{
			// Don't push first point, its already pushed 
			for (var i:Number = 1; i <= SEGS; i+=1 )
			{
				var p:Point = CubicBezier(i / SEGS, p0, p1, p2, p3);
				pointList.push(p);
			}
		}
		
		
		////////////////////////////////////////////////////////////////
		// WARNING HUUGE CODE REPETITION........ REFACTOR NOW............
		////////////////////////////////////////////////////////////////
		// curveList[0] --> Move TO
		// curveList[1]...[k] --> Curve definitions
		public static function StringToBezierCurveList(curveString:String, transform:Point):Array
		{
			var curveList:Array = new Array();
			
			// first retrieve moveto: (m 87.98 89.87)
			var exp:RegExp = /(M (-*\d*\.*\d+),(-*\d*\.*\d+))/;
			var segs:Object = exp.exec( curveString );
			
			var p0:Point = new Point();
			
			// First anchor point
			p0.x = Number(segs[2]) + transform.x;
			p0.y = Number(segs[3]) + transform.y;
			curveList.push(p0);
			
			// Now get all the curves in the string: (C 4.3,3.6 9.8,5.3 9.2,4.5)
			var segs2:Object;
			var exp2:RegExp = /((c|C) (-*\d*\.*\d+),(-*\d*\.*\d+) (-*\d*\.*\d+),(-*\d*\.*\d+) (-*\d*\.*\d+),(-*\d*\.*\d+))/g;
			//var segs2:Object = exp2.exec( curveString );
			while(segs2=exp2.exec(curveString))
			{
				
				var p1:Point = new Point();
				var p2:Point = new Point();
				var p3:Point = new Point();
			
				p1.x = Number(segs2[3]) + transform.x;
				p1.y = Number(segs2[4]) + transform.y;
				p2.x = Number(segs2[5]) + transform.x;
				p2.y = Number(segs2[6]) + transform.y;
				p3.x = Number(segs2[7]) + transform.x;
				p3.y = Number(segs2[8]) + transform.y;
				  
				var curveDef:Array = new Array(p1, p2, p3);
				
				curveList.push(curveDef);
			}
			
			return curveList;
		}
		
		
		
		public static function CreateSpriteButton(bitmapUp:Bitmap, pos:Point, mouseOverFn:Function, mouseOutFn:Function, mouseClickFn:Function):Sprite {
			
			var button:Sprite = BitmapToSprite(bitmapUp);
			button.x = pos.x;
			button.y = pos.y;
			
			if(mouseOverFn != null){
				button.addEventListener(MouseEvent.MOUSE_OVER, mouseOverFn);
			}
			else{
				button.addEventListener(MouseEvent.MOUSE_OVER, DefaultMouseOverFn);
			} 
			
			if(mouseOutFn != null){
				button.addEventListener(MouseEvent.MOUSE_OUT, mouseOutFn);
			}
			else{
				button.addEventListener(MouseEvent.MOUSE_OUT, DefaultMouseOutFn);
			} 
			
			if(mouseClickFn != null){
				button.addEventListener(MouseEvent.CLICK, mouseClickFn);
			}
			else{
				button.addEventListener(MouseEvent.CLICK, DefaultMouseClickFn);
			} 
			
			return button;
		}
		
		public static function RemoveSpriteButtonFromParent(parent:DisplayObjectContainer, child:DisplayObject, mouseOutFn:Function, mouseOverFn:Function, mouseClickFn:Function):void{
			if(child == null) return;
			
			if(mouseOverFn != null){
				child.removeEventListener(MouseEvent.MOUSE_OVER, mouseOverFn);
			}
			else{
				child.removeEventListener(MouseEvent.MOUSE_OVER, DefaultMouseOverFn);
			} 
			
			if(mouseOutFn != null){
				child.removeEventListener(MouseEvent.MOUSE_OUT, mouseOutFn);
			}
			else{
				child.removeEventListener(MouseEvent.MOUSE_OUT, DefaultMouseOutFn);
			} 
			
			if(mouseClickFn != null){
				child.removeEventListener(MouseEvent.CLICK, mouseClickFn);
			}
			else{
				child.removeEventListener(MouseEvent.CLICK, DefaultMouseClickFn);
			} 
			TweenMax.killTweensOf(child);
			parent.removeChild(child);
		}
		
		public static function RemoveSpriteChildrenFromParent(parent:DisplayObjectContainer):void {
			//trace("REMOVING " + parent.numChildren + " ITEMS");
			while (parent.numChildren > 0) {
				TweenMax.killTweensOf(parent.getChildAt(0));
				parent.removeChild(parent.getChildAt(0));
			}
		}

		public static function RemoveAllSpriteButtonsFromParent(parent:DisplayObjectContainer, mouseOutFn:Function, mouseOverFn:Function, mouseClickFn:Function):void{
			while (parent.numChildren > 0) {
				TweenMax.killTweensOf(parent.getChildAt(0));
				RemoveSpriteButtonFromParent(parent, parent.getChildAt(0), mouseOutFn, mouseOverFn, mouseClickFn); 
			}
		}
		
		/**
		 * Remove sprites with Animations
		*/
		//private function RemoveChildFromParentWithFadeOut(parent:DisplayObjectContainer, child:DisplayObject, duration:Number, delay:Number):void{
			//if(child.hasEventListener(MouseEvent.MOUSE_OVER)) child.removeEventListener(MouseEvent.MOUSE_OVER, ButtonMouseOverFn);
			//if(child.hasEventListener(MouseEvent.MOUSE_OUT)) child.removeEventListener(MouseEvent.MOUSE_OUT, ButtonMouseOutFn);
			//if(child.hasEventListener(MouseEvent.CLICK)) child.removeEventListener(MouseEvent.CLICK, ButtonMouseClickFn);
			
			//TweenMax.to(child, duration, {scaleX:0.6, scaleY:0.6, alpha:0.0, ease:Expo.easeOut, delay:delay,
			//	onComplete: function(_parent:DisplayObjectContainer, _child:DisplayObject):void {
			//		_parent.removeChild(_child);
			//	},
			
			//	onCompleteParams: [parent, child]
			//	}
			//);
		//}

		
		/**
		 * DEFAULT CALLBACKS: OVERRIDE !!!
		 * Called when ever the mouse hovers over a sprite/button.
		 * @param event The event data structure containing the reference to the caller sprite/object.
		*/
		private static function DefaultMouseOverFn(e:Event):void { 
			SoundManager.PlayMouseOverSFX();
			TweenMax.to(e.target, 0.6, {scaleX:1.1, scaleY:1.1, ease:Elastic.easeOut});
		}
		
		private static function DefaultMouseOutFn(e:Event):void { 
			TweenMax.to(e.target, 0.4, {scaleX:1.0, scaleY:1.0, ease:Elastic.easeOut});
		}
		
		private static function DefaultMouseClickFn(e:Event):void { 
						
		}
		
		
		public static function BitmapToSprite(bitmap:Bitmap):Sprite {
			bitmap.x = -bitmap.width / 2;
			bitmap.y = -bitmap.height / 2;
			bitmap.smoothing = true;
			var sprite:Sprite = new Sprite();
			sprite.addChild(bitmap);
			
			return sprite;
		}
		
		/*********************************************************
		*  Optimization... Convert sprite to raw bitmap
		* *******************************************************/
		public static function SpriteToBitmap(w:int, h:int, texture:Sprite):Bitmap {
			var bitmapData:BitmapData = new BitmapData(w, h, true, 0xFFFFFF);
			bitmapData.draw(texture);
			var bitmap:Bitmap = new Bitmap(bitmapData);
			bitmap.x = -bitmapData.width / 2;
			bitmap.y = -bitmapData.height / 2;
			bitmap.smoothing = true;
			return bitmap;
		}
	}
	
}