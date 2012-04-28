package cn.team.classes
{
	import Steer.Vector2D;
	
	import flash.events.Event;

	public class SeekEnemyPlane extends Enemy
	{
		private var _steeringForce:Vector2D;
		private var target:Vector2D;
		
		public function SeekEnemyPlane(x:Number,y:Number)
		{
			_steeringForce = new Vector2D();
			//velocity = new Vector2D(1,0);
			super();
			edgeBehavior = BOUNCE;
			//addEventListener(Event.ENTER_FRAME,onEnterFrame);
			//addChild(vehicle);
			target = new Vector2D(x,y);
		}
		
		public override function collision():void
		{
			
		}
		
		protected override function onEnterFrame(evt:Event):void
		{
			//这里真让人吐槽。。mouseX得到的不是在stage中的坐标，所以开始的时候很不准。
			
			//vehicle.position.x = stage.mouseX;
			//vehicle.position.y = stage.mouseY;
			//this.pursue(vehicle);
			this.seek(target);
			this.updatePos();
		}
		
		override public function updatePos():void
		{
			_steeringForce.truncate(_maxForce);
			_steeringForce = _steeringForce.divide(_mass);
			_velocity = _velocity.add(_steeringForce);
			
			//trace("steeringforce:"+_steeringForce);
			
			super.updatePos();
			rotation = -90 +_velocity.angle * 180 / Math.PI;
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