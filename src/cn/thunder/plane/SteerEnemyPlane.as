package cn.thunder.plane
{
	import Collision.CollisionEvent;
	
	import Steer.Vector2D;
	
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * 漫游的敌机 
	 * @author Administrator
	 * 
	 */	
	public class SteerEnemyPlane extends Enemy
	{
		private var _steeringForce:Vector2D;
			
		//private var vehicle:Vehicle = new Vehicle();
		private var _wanderDistance:Number = 5;
		private var _wanderAngle:Number = 45/Math.PI;
		private var _wanderRadius:Number = 5;
		private var _wanderRange:Number = 15/Math.PI;
		private var _frameCount:Number = 3;
		
		public function SteerEnemyPlane()
		{
			super();
			_steeringForce = new Vector2D();
			
			edgeBehavior = BOUNCE;	
			maxSpeed = 3;
		}
		
/*		protected override function handleCollision(evt:CollisionEvent):void
		{
			
		}*/
		
		
		override public function updatePos():void
		{
			this.count++;
			if(this.count >=3){
				_steeringForce.truncate(_maxForce);
				_steeringForce = _steeringForce.divide(_mass);
				_velocity = _velocity.add(_steeringForce);
				
				//trace("steeringforce:"+_steeringForce);
				
				
				//rotation = -90 +_velocity.angle * 180 / Math.PI;
				//trace(rotation)
				this.count = 0;
			}
			super.updatePos();
			
		}
		
		
		public override function move(evt:Event):void
		{
			//这里真让人吐槽。。mouseX得到的不是在stage中的坐标，所以开始的时候很不准。
			
			//vehicle.position.x = stage.mouseX;
			//vehicle.position.y = stage.mouseY;
			//this.pursue(vehicle);
			this.wander();
			this.updatePos();
		}
		
		public function set wanderDistance(value:Number):void
		{
			_wanderDistance = value;
			
		}
		public function get wanderDistance():Number
		{
			return _wanderDistance;
		}
		
		public function set wanderRadius(value:Number):void
		{
			_wanderRadius = value;
			
		}
		public function get wanderRadius():Number
		{
			return _wanderRadius;
		}
		
		public function set wanderRange(value:Number):void
		{
			_wanderRange = value;
			
		}
		public function get wanderRange():Number
		{
			return _wanderRange;
		}
		
		public function wander():void
		{                                                                                                                                                                                                                                                                                                            
			var center:Vector2D = velocity.clone().normalizeY().multiply(_wanderDistance);
			var offset:Vector2D = new Vector2D();
			offset.length = _wanderRadius;
			offset.angle = _wanderAngle;
			_wanderAngle += Math.random()* _wanderRange - _wanderRange * .5;
			var force:Vector2D = center.add(offset);
			_steeringForce = _steeringForce.add(force);
		}
	}
}