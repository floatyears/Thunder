/**
 * 子弹类
 * @author：林孟涛 2012-04-23
 * @alter：
 * 
 */

package cn.thunder.weapon
{
	import Steer.Vector2D;
	
	import cn.thunder.base.MoveObject;
	import cn.thunder.util.BitmapDataLoader;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.*;
	import flash.geom.Point;
	import flash.system.ApplicationDomain;
	
	public class Bullets extends MoveObject
	{
		private var belong:Boolean;
		private var bulletModel:Bitmap;
		
		/**
		 * 构造器,完成子弹的初始化操作
		 * @param belong 子弹从属
		 * 
		 */
		public function Bullets()
		{
			
			bulletModel=new Bitmap();
			loadBullet();
			super();
			this.belong = belong;
			this.start();
			edgeBehavior = DISAPPEAR;
			this.velocity = new Vector2D(0,-1).multiply(maxSpeed);
			maxSpeed = 7;
		}
		
		
		/**
		 * 加载子弹的图片模型 
		 * 
		 */		
		private function loadBullet():void{
			bulletModel.bitmapData=BitmapDataLoader.getBitmapData("PBullet",5,20);
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

		protected override function disappear():void
		{
			try{
				if(this.x < 0 || this.x > stage.width || this.y < 0 || this.y > stage.height){
					this.dispose();
				}
			}
			catch(e:Error){
			
			}
		}
		
		public override function move(evt:Event):void
		{
			super.move(evt);
			//trace(this.y);
			//trace(this.parent.y);
			//removeEventListener(Event.ENTER_FRAME,onEnterFrame);
//			if(this.y + this.parent.y < 0){
//				this.parent.removeChild(this);
//			} 
		}
		
		
	}
}