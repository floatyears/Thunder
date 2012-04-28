/**
 * 所有可移动的物体的父类
 * 
 * @author：林孟涛 2012-04-23
 * @alter：
 * 
 */
package cn.thunder.base
{
	import Collision.*;
	
	import Steer.Vector2D;
	
	import cn.thunder.plane.Plane;
	import cn.thunder.util.ConstUtil;
	import cn.thunder.weapon.Bullets;
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.globalization.Collator;
	
	public class MoveObject extends Sprite
	{
		protected var disappeared:Boolean = false;
		
		//定义碰撞事件
		protected var colEvt:CollisionEvent = new CollisionEvent();
		
		//每个物体的id
		private static var uuid:Number = 1;
		
		//全局唯一ID
		public var _mid:Number = -1;
		
		//速度
		public var _velocity:Vector2D;
		
		//质量
		public var _mass:Number = 1.0;
		
		//位置
		public var _position:Vector2D;
		
		protected var _edgeBehavior:String = BOUNCE;
		protected var _maxSpeed:Number = 4;
		
		public static const WRAP:String = 'wrap';
		public static const BOUNCE:String = 'bounce';
		public static const STOP:String = 'stop';
		public static const DISAPPEAR:String = 'disappear';
		
		
		/**
		 * 
		 * 
		 */
		//物体的移动速度
		protected var speed:uint=10;
		
		/**
		 * MoveObject构造函数，获取一个初始的位置和速度，并获取一个唯一的ID 
		 * 
		 */		
		public function MoveObject()
		{
			super();
			_position = new Vector2D();
			_velocity = new Vector2D();
			this.addEventListener(Event.ADDED_TO_STAGE,onAddToStage);
			this.addEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
			mid = uuid++;
			
		}
		
		
		/**
		 * 当对象从舞台被移除的处理函数 
		 * @param evt
		 * 
		 */		
		protected function onRemoveFromStage(evt:Event):void
		{
			// TODO Auto-generated method stub
			this.removeEventListener(Event.REMOVED_FROM_STAGE,onRemoveFromStage);
			colEvt.removeListener(CollisionEvent.COLLIDE,handleCollision);
		}
		
		/**
		 * 当对象被添加到舞台的处理函数 
		 * @param evt
		 * 
		 */		
		protected function onAddToStage(evt:Event):void
		{
			// TODO Auto-generated method stub
			this.removeEventListener(Event.REMOVED_FROM_STAGE,onAddToStage);
			colEvt.addListener(CollisionEvent.COLLIDE,handleCollision);
			
		}		
		
		/**
		 * 处理碰撞的事件 
		 * @param evt
		 * 
		 */		
		protected function handleCollision(evt:CollisionEvent):void
		{
			// TODO Auto Generated method stub
			if(this.mid == evt.id1 || this.mid == evt.id2){
				try{
					this.parent.removeChild(this);
				}catch(e:Error){
				
				}
				
			}
		}
		
		protected function loadClips():void{
			
		}
		
		/**
		 * 开始移动
		 * 
		 */		
		public function start():void
		{
			this.addEventListener(Event.ENTER_FRAME,move);
		}
		
		/**
		 * 停止移动
		 * 
		 */		
		public function stop():void
		{
			this.removeEventListener(Event.ENTER_FRAME,move);
		}
		
		/**
		 * 移动每一步的改变，移动之后更新位置
		 * 
		 */
		public function move(evt:Event):void{
			updatePos();
		}
		
		/**
		 * 当前的位置向量加上速度向量，得到一个新的位置向量。 此速度是根据帧频来计算。
		 * 并且会检查到达边界时的处理情况。
		 * 
		 */	
		public function updatePos():void
		{
			_velocity.truncate(_maxSpeed);
			
			_position = _position.add(_velocity);
			
			//trace(_velocity);
			
			//trace(_position.x,_position.y);
			
			if(_edgeBehavior == WRAP)
			{
				wrap();
			}
			else if(_edgeBehavior == BOUNCE){
				bounce();
			}
			else if(_edgeBehavior == STOP){
				stop();
			}else if(_edgeBehavior == DISAPPEAR)
			{
				disappear();
			}
			this.x = position.x;
			this.y = position.y;
			
		}
		
		protected function disappear():void
		{
			// TODO Auto Generated method stub
			
		}
		
		
		/**
		 * 定义每个运动对象从stage消失的方法 
		 * 
		 */		
		protected function dispose():void{
			//this.removeEventListener(Event.ENTER_FRAME,
			colEvt.removeListener(CollisionEvent.COLLIDE,handleCollision);
			try{
				this.parent.removeChild(this);
			}catch(e:Error){
				
			}
		}
			
		
		/**
		 * 到达边界时的将其中达到临界的值处理为另一个临界值
		 * 
		 */		
		private function wrap():void
		{
			if(stage != null)
			{
				if(position.x > stage.stageWidth) position.x = 0;
				if(position.x < 0) position.x = stage.stageWidth;
				if(position.y > stage.stageHeight) position.y = 0;
				if(position.x < 0) position.y = stage.stageHeight;
				
			}
			
		}
		
		/**
		 * 到达边界时反弹
		 * 
		 */		
		private function bounce():void
		{
			if(stage != null)
			{
				if(position.x > stage.stageWidth){
					position.x = stage.stageWidth;
					velocity.x *= -1;
					//trace(position.y)
				}else if(position.x < 0){
					position.x = 0;
					velocity.x *= -1;
					//trace(position.y)
				}
					
				else if(position.y > stage.stageHeight)
				{
					position.y = stage.stageHeight;
					velocity.y *= -1;
					//trace(position.x)
				}
				else if(position.y < 0){
					position.y = 0;
					//trace(position.x)
					velocity.y *= -1;
				}
			}
			
		}
		
		public function set edgeBehavior(value:String):void
		{
			_edgeBehavior = value;
		}
		
		public function get edgeBehavior():String
		{
			return _edgeBehavior;
		}
		
		public function set mass(value:Number):void
		{
			_mass = value;
		}
		/**
		 * 质量 
		 * @return 
		 * 
		 */		
		public function get mass():Number
		{
			return _mass;
		}
		
		public function set maxSpeed(value:Number):void
		{
			_maxSpeed = value;
		}
		
		public function get maxSpeed():Number
		{
			return _maxSpeed;
		}
		
		public function set position(value:Vector2D):void
		{
			_position = value;
			x = _position.x;
			y = _position.y;
		}
		
		public function get position():Vector2D
		{
			return _position;
		}
		
		
		public function set velocity(value:Vector2D):void
		{
			_velocity = value;
		}
		
		public function get velocity():Vector2D
		{
			return _velocity;
		}
		
		override public function set x(value:Number):void
		{
			super.x = value;
			_position.x = x;
		}
		
		override public function set y(value:Number):void
		{
			super.y = value;
			_position.y = y;
		}
		
		public function get mid():Number{
			return _mid;
		}
		public function set mid(value:Number):void
		{
			_mid = value;
		}
		
	}
}