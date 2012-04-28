/**
 * 子弹类
 * @author：林孟涛 2012-04-23
 * @alter：
 * 
 */

package cn.team.classes
{
	import cn.team.MoveObject;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.system.ApplicationDomain;
	import flash.events.*;
	import flash.geom.Point;
	
	public class Bullets extends MoveObject
	{
		private var belong:Boolean;
		private var bulletModel:Bitmap;
		
		
		/**
		 * 构造器,完成子弹的初始化操作
		 * @param belong 子弹从属
		 * 
		 */
		public function Bullets(belong:Boolean)
		{
			bulletModel=new Bitmap();
			loadBullet();
			super();
			this.belong = belong;
			this.move(0);
		}
		
		
		/**
		 * 加载子弹的图片模型 
		 * 
		 */		
		private function loadBullet():void{
			var temp:Class=ApplicationDomain.currentDomain.getDefinition("PNormalBullet") as Class;
			bulletModel.bitmapData=new temp(5,17);
			this.addChild(bulletModel);
			
		}
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get _belong():Boolean{
			return this.belong;
			
			
		}
		
		/**
		 * 子弹的移动方法，暂时只往上移动
		 * @param direction 子弹移动方向
		 * 
		 */		
		public override function move(direction:uint):void{
			/*var point:Point = this.localToGlobal(new Point(this.x,this.y));
			this.x = point.x;
			this.y = point.y;*/
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
			 
		}
		
		protected function onEnterFrame(event:Event):void
		{
			this.y=this.y-this.speed;
			//trace(this.y);
			//trace(this.parent.y);
			//removeEventListener(Event.ENTER_FRAME,onEnterFrame);
//			if(this.y + this.parent.y < 0){
//				this.parent.removeChild(this);
//			} 
		}
		
	}
}