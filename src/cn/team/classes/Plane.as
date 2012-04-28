/**
 * 飞机类，继承了MoveObject基类，用于绘画出飞机，控制飞机等等功能
 * @author：林孟涛 2012-04-23
 * @alter：周小钢 2012-04-25
 * @modified: 陈来 2012-04-26
 */

package cn.team.classes
{
	import Steer.Vector2D;
	
	import cn.team.MoveObject;
	import cn.team.constUtil.ClassLoader;
	import cn.team.constUtil.ConstUtil;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.events.*;
	import flash.events.KeyboardEvent;
	import flash.system.ApplicationDomain;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	
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
		private var fireInterval:Number = 100;
		
		//子弹的计时器
		private var fireTimer:Timer = new Timer(fireInterval);
		
		
		
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
			this.init(life);
		}
		
		
		
		/**
		 * 得到当前飞机的id值 
		 * @return 返回该飞机的id值
		 * 
		 */
		private function get _id():Number{
			return this.id;
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
		 * @param event
		 * 
		 */
		protected function keyPressed(event:KeyboardEvent):void
		{
			var key:int = event.charCode;
			if(this.isLive){
				switch(key){
					case Keyboard.CONTROL:
						//this.myGame._bArray.push(this.fire());
						break;
					case Keyboard.UP:
						this.bU = true;
						break;
					case Keyboard.RIGHT:
						this.bR = true;
						break;
					case Keyboard.DOWN:
						this.bD = true;
						break;
					case Keyboard.LEFT:
						this.bL = true;
						break;
				}
				this.locationDirect();
			}
		}
		
		/**
		 * 
		 * 
		 */
		private function locationDirect():void
		{
			if(bL && !bR && !bU && !bD)
				dir = "L";
			else if(bL && !bR && bU && !bD)
				dir = "LU";
			else if(bL && !bR && !bU && bD)
				dir = "DL";
			else if(!bL && bR && !bU && !bD)
				dir = "R";
			else if(!bL && bR && bU && !bD)
				dir = "UR";
			else if(!bL && bR && !bU && bD)
				dir = "RD";
			else if(!bL && !bR && bU && !bD)
				dir = "U";
			else if(!bL && !bR && !bU && bD)
				dir = "D";
			else if(!bL && !bR && !bU && !bD)
				dir = "STOP";
		}
		
		/**
		 * 
		 * @param event
		 * 
		 */
		protected function keyRelease(event:KeyboardEvent):void
		{
			var key:int = event.charCode;
			switch(key){
				case Keyboard.UP:
					this.bU = false;
					break;
				case Keyboard.RIGHT:
					this.bR = false;
					break;
				case Keyboard.DOWN:
					this.bD = false;
					break;
				case Keyboard.LEFT:
					this.bL = false;
					break;
			}
			this.locationDirect();
		}		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function fire():Bullets{
			var _this:Plane = this;
			//trace(this.firing,fireTimer.running);

			var b:Bullets = new Bullets(this.isPlayer);
			b.x=this.x+(this.width/2);
			b.y=this.y;
			if(this.firing){
				
				fireTimer.addEventListener(TimerEvent.TIMER,addBullet);
				fireTimer.start();
				//trace('1');
			}else{
				fireTimer.stop();
				fireTimer.removeEventListener(TimerEvent.TIMER,addBullet)
				//fireTimer = null;
				//trace('2');
			}
			
			function addBullet():void
			{
				_this.bullets.push(b);
				//_this.addChild(b);
			}
			return b;
		}
		
	}
}