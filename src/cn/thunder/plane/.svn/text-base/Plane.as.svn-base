/**
 * 飞机类，继承了MoveObject基类，用于绘画出飞机，控制飞机等等功能
 * @author：林孟涛 2012-04-23
 * @alter：周小钢 2012-04-25
 * @modified: 陈来 2012-04-26
 */

package cn.thunder.plane
{
	import Collision.CollisionEvent;
	
	import Steer.Vector2D;
	
	import cn.thunder.base.MoveObject;
	import cn.thunder.util.ClassLoader;
	import cn.thunder.util.ConstUtil;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.*;
	import flash.events.KeyboardEvent;
	import flash.system.ApplicationDomain;
	import flash.ui.Keyboard;
	import flash.utils.*;
	import flash.utils.Dictionary;
	import cn.thunder.weapon.Bullets;
	import cn.thunder.explode.Explode;
	
	public class Plane extends MoveObject
	{
		//是否为我方true为我方，false为敌方
		protected var isPlayer:Boolean;
		//游戏者的名字
		private var userName:String;
		//该飞机的id
		private var id:Number;
		//该飞机的生命值
		protected var life:Number;
		//该飞机是否还存活着，用于判断是否应该移除掉此飞机
		private var isLive:Boolean = true;

		//判断是否按了向上的按键
		private var bU:Boolean = false;
		//判断是否按了向右的按键
		private var bR:Boolean = false;
		//判断是否按了向下的按键
		private var bD:Boolean = false;
		//判断是否按了向左的按键
		private var bL:Boolean = false;
		//素材加载器
		private var loader:ClassLoader;
		//飞机素材的dictionary
		public var units:Dictionary;
		
		//飞机模型Bitmap
		public var playerModel:Bitmap;
		
		//子弹数组
		public var bullets:Array;
		
		//当前的方向
		private var dir:String = "STOP";
		
		//判断当前是否正在发射子弹
		public var firing:Boolean = false;
		
		//发射子弹的间隔时间
		public var fireInterval:Number = 30;
		
		//子弹的计时器
		private var fireTimer:Timer = new Timer(fireInterval);
		
		private var explode:Explode;
		
		public var count:Number = 0;
		
		public var countB:Number = 0;
		/**
		 * 飞机的构造方法
		 * @param _isPlayer：判断构造的是敌机还是我机，敌机传入false，我机传入true
		 * @param _life：传入生命值
		 * @param game：传入一个this值
		 * 
		 */
		public function Plane()
		{
			//this.init(_isPlayer,_life);
			super();
			this.init(life);
		}
		/**
		 *  
		 * @param evt
		 * 
		 */		
		protected override function handleCollision(evt:CollisionEvent):void
		{
			// TODO Auto Generated method stub
			
			if(this.mid == evt.id1 || this.mid == evt.id2){
				//var _this = this;
				//var _super = super;
				explode = new Explode(-30,-30);
				this.addChild(explode);
				var timer:Timer = new Timer(200,1)
				timer.addEventListener(TimerEvent.TIMER,function():void{
					removeSelf();
					//super.handleCollision(evt);
				})
				timer.start();
			}

		}
		
		private function removeSelf():void
		{
			//this.removeChild(explode);
			try{
				this.parent.removeChild(this)
			}catch(e:Error){
				
			}
			
		}
		
		/**
		 * 设置游戏玩家的名字
		 * @param userName 传入游戏玩家的名字
		 * 
		 */
		private function set _userName(userName:String):void{
			this.userName = userName;
		}
		
		private function get _isPlayer():Boolean{
			return this.isPlayer;
		}
		private function get _life():Number{
			return this.life;
		}
		private function set _isLive(isLive:Boolean):void{
			this.isLive = isLive;
		}
		
		protected function init(life:Number):void{
/*			units=new Dictionary();
			this.loadClips();
			bullets=new Array();
			this.isPlayer = _isPlayer;
			this.life = _life;*/
		}
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function fire(evt:Event):void{
			countB++;
			if(countB >= fireInterval){
				var b:Bullets = new Bullets();
				b.x=this.x+(this.width/2);
				b.y=this.y;
				b.velocity.angle = this.velocity.angle;
				b.rotation = -90+b.velocity.angle * 180 / Math.PI;
				this.bullets.push(b);
				stage.addChild(b);
				b.start();
				countB = 0;
			}

		}
		
		
		public function openFire():void
		{
			this.addEventListener(Event.ENTER_FRAME,fire);
		}
		
		public function stopFire():void
		{
			this.removeEventListener(Event.ENTER_FRAME,fire);
		}
		
	}
}