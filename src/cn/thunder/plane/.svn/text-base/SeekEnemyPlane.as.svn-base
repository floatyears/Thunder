package cn.thunder.plane
{
	import Collision.CollisionEvent;
	
	import Steer.Vector2D;
	
	import cn.thunder.base.MoveObject;
	
	import flash.events.Event;

	public class SeekEnemyPlane extends Enemy
	{
		private var _steeringForce:Vector2D;
		public var target:MoveObject;
		private var targetVec:Vector2D;
		
		public function SeekEnemyPlane(x:Number = 0,y:Number = 0)
		{
			_steeringForce = new Vector2D();
			//velocity = new Vector2D(1,0);
			super();
			edgeBehavior = BOUNCE;
			//addEventListener(Event.ENTER_FRAME,onEnterFrame);
			//addChild(vehicle);
			targetVec = new Vector2D();
			maxSpeed = 2;
		}
		
		/*protected override function handleCollision(evt:CollisionEvent):void
		{
			
		}*/
		
		public override function move(evt:Event):void
		{
			//这里真让人吐槽。。mouseX得到的不是在stage中的坐标，所以开始的时候很不准。
			
			//vehicle.position.x = stage.mouseX;
			//vehicle.position.y = stage.mouseY;
			//this.pursue(vehicle);
			targetVec.x = target.x;
			targetVec.y = target.y
			
			this.seek(targetVec);
			this.updatePos();
		}
		
		public override function updatePos():void
		{
			this.count++;
			if(this.count >=1){
				_steeringForce.truncate(_maxForce);
				_steeringForce = _steeringForce.divide(_mass);
				_velocity = _velocity.add(_steeringForce);
				
				//trace("steeringforce:"+_steeringForce);
				
				super.updatePos();
				this.rotation = -90 +_velocity.angle * 180 / Math.PI;
				this.count = 0;
			}
			
			//trace(rotation)
		}
		
		public function seek(target:Vector2D):void
		{
			var desiredVelocity:Vector2D = target.subtract(_position);
			desiredVelocity.normalize();
			desiredVelocity = desiredVelocity.multiply(_maxSpeed);
			var force:Vector2D = desiredVelocity.subtract(_velocity);
			//trace('_position'+_position);
			//trace(_velocity);
			_steeringForce = new Vector2D();
			_steeringForce = _steeringForce.add(force);
		}
		
		public function pursue(target:Plane):void
		{
			var lookAheahTime:Number= position.dist(target.position) / _maxSpeed;
			var predictedTarget:Vector2D = target.position.add(target.velocity.multiply(lookAheahTime));
			seek(predictedTarget);
		}
	}
}