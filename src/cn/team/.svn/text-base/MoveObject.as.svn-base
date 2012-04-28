/**
 * 所有可移动的物体的父类
 * 
 * @author：林孟涛 2012-04-23
 * @alter：
 * 
 */
package cn.team
{
	import Collision.*;
	
	import Steer.Vector2D;
	
	import cn.team.classes.Bullets;
	import cn.team.classes.Plane;
	import cn.team.constUtil.ConstUtil;
	
	import flash.display.Graphics;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	
	public class MoveObject extends Sprite
	{
		protected var disappeared:Boolean = false;
		protected var colEvt:CollisionEvent = new CollisionEvent();
		
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
		
		public function MoveObject()
		{
			
			_position = new Vector2D();
			_velocity = new Vector2D();
			colEvt.addListener(CollisionEvent.COLLIDE,collision);
			super();
		}
		
		
		protected function loadClips():void{
			
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
				disppear();
			}
			this.x = position.x;
			this.y = position.y;
			
		}
		
		protected function disppear():void
		{
			// TODO Auto Generated method stub
			
		}
		
		private function stop():void
		{
			if(position.x >= stage.stageWidth) position.x = stage.stageWidth;
			if(position.x <= 0) position.x = 0;
			if(position.y >= stage.stageHeight) position.y = stage.stageHeight;
			if(position.x <= 0) position.y = 0;
		}
		
		/**
		 * 
		 * @param isGood
		 * @param mvObj
		 * 
		 */
		public function move(direction:uint):void{
			
		}
		
		/**
		 * 
		 * @param g
		 * @param isGood
		 * @param mvObj
		 * 
		 */
/*		private function beginGraphic(g:Graphics,isGood:Boolean,mvObj:MoveObject):void{
			if(mvObj is Plane){
				this.width = 20;
				this.height = 35;
				if(isGood){
					this.x = ConstUtil.GOODX;
					this.y = ConstUtil.GOODY;
					g.beginFill(ConstUtil.GOODCOLOR);
					g.drawRect(ConstUtil.GOODX,ConstUtil.GOODY,20,35);
				}else{
					this.x = ConstUtil.BADX;
					this.y = Math.floor(Math.random()*ConstUtil.BGWIDTH);
					g.beginFill(ConstUtil.BADCOLOR);
					g.drawRect(0,0,20,35);
				}
			}else{
				g.beginFill(ConstUtil.BCOLOR);
			}
		}*/
		/**
		 * 定义每个运动对象从stage消失的方法 
		 * 
		 */		
		public function collision():void{
			
			trace(this);
			var b:MoveObject = this;
			function explode(evt:Event):void{
				//removeChild(this);
				b.disappeared = true;
				trace(b);
			}
		}
		
		
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
		
	}
}