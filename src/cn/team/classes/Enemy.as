package cn.team.classes
{
	import cn.team.MoveObject;
	import cn.team.constUtil.ConstUtil;
	
	import flash.display.Bitmap;
	import flash.events.Event;
	import flash.system.ApplicationDomain;
	import flash.events.*;
	
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
			enemyModel=new Bitmap();
			this.loadClips();
			//指定敌机在舞台上方出现
			this.y=-enemyModel.width;
			//随机指定敌机出现的水平位置
			this.x=Math.random()*(ConstUtil.BGWIDTH-(enemyModel.width/2));
			bullets=new Array();
			
			addEventListener(Event.ENTER_FRAME,onEnterFrame);
		}
		
		protected function onEnterFrame(event:Event):void
		{
			// TODO Auto-generated method stub
			super.updatePos();
			
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
			var temp:Class=ApplicationDomain.currentDomain.getDefinition("EnemyNormal1") as Class;
			enemyModel.bitmapData=new temp(24,33);
			this.addChild(enemyModel);
		}
		
		
		override public function fire():Bullets{
			var tempBullets:Bullets=new Bullets(false);
			bullets.push(tempBullets);
			return tempBullets;
		}
		
	}
}