/**
 * 功能：Explode类实现爆炸效果，它由21张图片组成，以40的帧率播放。
 * @author: 彭奇文
 * Time:2012.04.26 18:52
 */
package cn.thunder.explode
{
	import cn.thunder.util.BitmapDataLoader;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	
	public class Explode extends Sprite
	{
		private var array:Array;   //定义存放爆炸效果每一帧数据的数组
		private var bitMap:Bitmap;
		
		public function Explode(x:Number = 0,y:Number = 0)
		{
			this.init(x,y); 
		}
		
		private function init(x:Number,y:Number):void  //初始化方法
		{
			bitMap = new Bitmap();
			array=new Array();
			var count:uint=0;  
			var c:Class;
			for(var i:uint=1;i<22;i++)
			{
				array.push(BitmapDataLoader.getBitmapData("Explode_"+i,84,83)); //把获得的图片数据（BitmatData)存进数组
			}
			bitMap.bitmapData=array[0]; 
			/*bitMap.x=100;
			bitMap.y=100;*/
			this.x = x;
			this.y = y;
			this.addChild(bitMap); //显示第一帧图片
			this.addEventListener(Event.ENTER_FRAME,loopGame);//添加Event.ENTER_FRAME事件
		}
		
		private var Pic_counts:uint=0; //定义变量，表示要显示的图片数
		private function loopGame(evt:Event):void
		{
			if(Pic_counts>21) //大于21时表示所有图片播放完毕，移除掉事件侦听器
			{
				this.removeEventListener(Event.ENTER_FRAME,loopGame);//移除掉事件侦听器
			}
			bitMap.bitmapData=array[Pic_counts];
			Pic_counts++;//开始下一张图片的播放
		}
	}
}