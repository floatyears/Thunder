/**
 * 加载Bitmap素材的工具类
 * @author：周小钢   2012-04-28
 */
package cn.thunder.util
{
	import flash.display.BitmapData;
	import flash.display.DisplayObject;
	import flash.system.ApplicationDomain;

	public class BitmapDataLoader
	{
		/**
		 * 构造器 
		 * 
		 */		
		public function BitmapDataLoader()
		{
			
		}
		
		/**
		 * 从全局应用域中获取类定义 
		 * @param className
		 * @return Class
		 * 
		 */		
		public static function getDefinition(className:String):Class{
			return ApplicationDomain.currentDomain.getDefinition(className) as Class;
		}
		
		/**
		 * 判断全局应用于域中是否存在某一类定义 
		 * @param className
		 * @return Boolean
		 * 
		 */		
		public static function hasDefinition(className:String):Boolean{
			return ApplicationDomain.currentDomain.hasDefinition(className);
		}
		
		/**
		 * 获取素材的BitmapData 
		 * @param name 素材链接的类名
		 * @param width 素材宽度
		 * @param height 素材高度
		 * @return BitmapData
		 * 
		 */		
		public static function getBitmapData(name:String,width:Number,height:Number):BitmapData{
			if(hasDefinition(name)){
				var tempClass:Class=getDefinition(name);
				return new tempClass(width,height) as BitmapData;
			}else{
				return null;
			}
			
		}
	}
}