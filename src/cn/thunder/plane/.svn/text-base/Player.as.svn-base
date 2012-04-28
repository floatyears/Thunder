package cn.thunder.plane
{
	import Steer.Vector2D;
	
	import cn.thunder.util.BitmapDataLoader;
	import cn.thunder.util.ClassLoader;
	import cn.thunder.util.ConstUtil;
	import cn.thunder.weapon.Bullets;
	
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	
	public class Player extends Plane
	{
		
		public var direction:String;
		
		
		public function Player(_isPlayer:Boolean,_life:Number):void
		{
			maxSpeed = 5;
			fireInterval = 10;
			//super();
			isPlayer = true;
			this.init(_life);
			this.velocity = new Vector2D();
			this.control([]);
			
		}
		
		protected override function loadClips():void{
			units["normal"]=BitmapDataLoader.getBitmapData("PlayerNormal",30,50);
			units["left"]=BitmapDataLoader.getBitmapData("PlayerLeft",30,50);
			units["right"]=BitmapDataLoader.getBitmapData("PlayerRight",30,50);
			playerModel=new Bitmap(units["normal"]);
			this.addChild(playerModel);
		}
		
		protected override function init(_life:Number):void{
			units=new Dictionary();
			this.loadClips();
			bullets=new Array();

			this.life = _life;

		}
		
		
		public function control(keyArr:Array):void
		{
			var n:Number = 3;
			//trace(keyArr);
			this.stop();
			// TODO Auto Generated method stub
			if(keyArr.indexOf('C') >= 0){
				this.openFire();
				n++;
			}else if(keyArr.indexOf('C') < 0){
				this.stopFire();
				n--;
			}
			
			if(keyArr.length >=4 || keyArr.length == 0){
				this.playerModel.bitmapData = this.units["normal"];
				return;
			}
			
			this.velocity = new Vector2D();
			//this.playerModel.bitmapData = this.units["normal"];
			
			if(keyArr.indexOf('U') >= 0){
				this.velocity = this.velocity.add(new Vector2D(0,-1)); 
				
			}
			if(keyArr.indexOf('L') >= 0){
				this.velocity = this.velocity.add(new Vector2D(-1,0));
				if(keyArr.indexOf('R') < 0){
					this.playerModel.bitmapData = this.units["right"];
				}
			}
			if(keyArr.indexOf('R') >= 0){
				this.velocity = this.velocity.add(new Vector2D(1,0));
				if(keyArr.indexOf('L') < 0){
					this.playerModel.bitmapData = this.units["left"];
				}
			}
			if(keyArr.indexOf('D') >= 0){
				this.velocity = this.velocity.add(new Vector2D(0,1));
			}
			
			this.velocity = this.velocity.multiply(maxSpeed);
			
			this.start();
		}
		
		public override function fire(evt:Event):void{
			this.count++;
			if(this.count >= fireInterval){
				var b:Bullets = new Bullets();
				b.position.x=this.x+(this.width/2);
				b.position.y=this.y;
				this.bullets.push(b);
				stage.addChild(b);
				b.start();
				this.count = 0;
			}
			
		}
	}
}





