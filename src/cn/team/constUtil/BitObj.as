/**
 * 该类用来将displayObject转换为BitmapData。
 * @Author : 陈来 2012-04-24
 * @Modified:
 */
package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.display.IBitmapDrawable;
	import flash.geom.Matrix;
	
	/**
	 * 公共属性：
	 * bmp: 位图
	 * bmpd: 位图数据
	 * 
	 * @author 陈来
	 * 
	 */	
	public class BitObj extends Bitmap
	{
		public var bmp:Bitmap;
		public var bmpd:BitmapData;
		private var _height:int;
		private var _width:int;
		private var _transparent:Boolean;
		private var _fillColor:uint;
		private var _source:IBitmapDrawable;
		private var _matrix:Matrix;
		private var _disObj:DisplayObject;
		
		/**
		 *  
		 * @param disObj 传递一个显示对象，将此对象转化为位图。
		 * 
		 */
		public function BitObj(disObj:DisplayObject)
		{
			_disObj = disObj;
			init();
			//bmpd = new BitmapData(_height,_width,_transparent,_fillColor);
			bmpd.draw(disObj);
		}
		/**
		 * 初始化显示对象 
		 * 
		 */		
		private function init():void
		{
			if(_disObj.height && _disObj.width)
			{
				bmpd = new BitmapData(_disObj.width,_disObj.height,true,0xffffff)
			}
			else
			{
				bmpd = new BitmapData(100,100,true,0xfffff);
			}
		}
		
		public function draw(disObj,matrix):void
		{
			
		}
	}

}