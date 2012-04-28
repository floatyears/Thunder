/**
 * 游戏背景层，实现游戏背景图片的移动 
 * @author:周小钢 2012-04-26
 * @alter:
 */
package cn.thunder.clips
{
	import cn.thunder.util.BitmapDataLoader;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	
	public class GameBackground extends Sprite
	{
		//存放背景素材的数组
		private var bgs:Array;
		//舞台上方图片
		private var upBitmap:Bitmap;
		//舞台下方图片
		private var downBitmap:Bitmap;
		//循环计数器
		private var count:uint=2;
		
		/**
		 * 构造器 
		 * 
		 */		
		public function GameBackground()
		{
			this.init();
		}
		
		/**
		 * 初始化方法，加载图片素材并存入素材数组中 
		 * 
		 */		
		private function init():void{
			bgs=new Array();
			//加载背景图片
			bgs.push(BitmapDataLoader.getBitmapData("Grass",400,240));
			bgs.push(BitmapDataLoader.getBitmapData("ForestStart",400,240));
			bgs.push(BitmapDataLoader.getBitmapData("ForestEnd",400,240));
			bgs.push(BitmapDataLoader.getBitmapData("Hill",400,240));
			bgs.push(BitmapDataLoader.getBitmapData("BeachStart",400,240));
			bgs.push(BitmapDataLoader.getBitmapData("Sea",400,240));
			bgs.push(BitmapDataLoader.getBitmapData("BeachEnd",400,240));
			upBitmap=new Bitmap();
			downBitmap=new Bitmap();
			upBitmap.bitmapData=bgs[1];
			downBitmap.bitmapData=bgs[0];
			upBitmap.x=0;
			//让upBitmap在舞台上方等待
			upBitmap.y=-500;
			downBitmap.x=0;
			downBitmap.y=0;
			//将图片高度设置为与舞台同高
			upBitmap.height=500;
			downBitmap.height=500;
			this.addChild(upBitmap);
			this.addChild(downBitmap);
			this.addEventListener(Event.ENTER_FRAME,loopBg);
		}
		
		/**
		 * 移动背景，通过改变上下图片垂直坐标实现移动效果，当舞台下方图片完全移出舞台时，上下两图进行一次交换，并加载一张新图 
		 * @param evt
		 * 
		 */		
		private function loopBg(evt:Event):void{
			if(downBitmap.y<500){
				downBitmap.y=downBitmap.y+1;
				upBitmap.y=upBitmap.y+1;
			}else{
				downBitmap.bitmapData=upBitmap.bitmapData;
				downBitmap.y=0;
				upBitmap.y=-500;
				upBitmap.bitmapData=bgs[count];
				upBitmap.y=-500;
				count++;
				if(count==bgs.length){
					count=0;
				}
			}
		}
	}
}