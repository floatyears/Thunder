package cn.thunder.plane
{
	import Collision.CollisionEvent;
	
	import cn.thunder.base.MoveObject;
	import cn.thunder.util.BitmapDataLoader;
	import cn.thunder.util.ConstUtil;
	import cn.thunder.weapon.Bullets;
	
	import flash.display.Bitmap;
	import flash.events.*;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	
	public class Enemy extends Plane
	{
		//敌机图片模型
		private var enemyModel:Bitmap;
		
		//敌机的子弹数组
		//private var bullets:Array;
		
		protected var _maxForce:Number = 1;
		
		/**
		 * 构造器 
		 * 
		 */		
		public function Enemy()
		{
			
			super();
			maxSpeed = 2;
			enemyModel=new Bitmap();
			this.loadClips();
			//指定敌机在舞台上方出现
			this.position.y=-enemyModel.width;
			//随机指定敌机出现的水平位置
			this.position.x=Math.random()*(ConstUtil.BGWIDTH-(enemyModel.width/2));
			bullets=new Array();
			
			this.start();
		}
		
		
		
		public override function updatePos():void
		{
			super.updatePos();
			rotation = -90 + _velocity.angle * 180 / Math.PI;
		}
		
		/**
		 * 最大的外力 
		 * @param value
		 * 
		 */		
		public function set maxForce(value:Number):void
		{
			_maxForce = value;
		}
		public function get maxForce():Number
		{
			return _maxForce;
		}
		/**
		 * 加载敌机图片模型 
		 * 
		 */
		protected override function loadClips():void{
			enemyModel.bitmapData=BitmapDataLoader.getBitmapData("EnemyNormal1",24,33);
			this.addChild(enemyModel);
		}
		
		
		/*public override function fire():void{
			var tempBullets:Bullets=new Bullets(false);
			bullets.push(tempBullets);
		}*/
		
		public override function start():void
		{
			super.start();
			this.openFire();
			
		}
	}
}