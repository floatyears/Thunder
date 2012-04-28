package cn.thunder.weapon
{
	import cn.thunder.weapon.Bullets;
	
	import flash.display.Sprite;
	import flash.events.Event;
	
	public class BulletsA extends Bullets
	{
		private var angle:Number;
		
		public function BulletsA(x:uint,y:uint,angle:Number)
		{
			super();
			this.graphics.beginFill(0x0000FF);
			this.graphics.drawCircle(-5,-5,5);
			this.graphics.endFill();
			//this.addEventListener(Event.ADDED_TO_STAGE,startBullets);
			this.x=x;
			this.y=y;
			this.alpha=0.1;
			this.angle=angle;
			this.speed = 5;
			
		}
		
		/*private function startBullets(evt:Event):void{
			this.addEventListener(Event.ENTER_FRAME,playBullets);
		}*/
		
/*		private function move(evt:Event):void{
			
			
			move(evt);
		}*/
		
		public override function move(evt:Event):void{
			if(this.alpha<1){
				this.alpha+=0.02;
			}
			this.x+=speed*Math.cos(angle);
			this.y+=speed*Math.sin(angle);
		}
	}
}