package cn.team.classes
{
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import cn.team.classes.*;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;
	
	import cn.team.constUtil.ClassLoader;
	import cn.team.constUtil.ConstUtil;
	
	public class Player extends Plane
	{
		public function Player(_isPlayer:Boolean,_life:Number):void
		{
			//super();
			isPlayer = true;
			this.init(_life);
			
		}
		
		protected override function loadClips():void{
			var tempClass:Class=ApplicationDomain.currentDomain.getDefinition("PlayerNormal") as Class;
			units["normal"]=new tempClass(30,50);
			tempClass=ApplicationDomain.currentDomain.getDefinition("PlayerLeft") as Class;
			units["left"]=new tempClass(30,50);
			tempClass=ApplicationDomain.currentDomain.getDefinition("PlayerRight") as Class;
			units["right"]=new tempClass(30,50);
			playerModel=new Bitmap(units["normal"]);
			this.addChild(playerModel);
		}
		
		protected override function init(_life:Number):void{
			units=new Dictionary();
			this.loadClips();
			bullets=new Array();
			this.isPlayer = isPlayer;
			this.life = _life;
		}
		
		/**
		 * 飞机移动方法
		 * @param direction 移动方向
		 * 
		 */ 
		public override function move(direction:uint):void{
			
			switch(direction){
				case 0://left
					if(this.x>=(this.width/2)){
						this.x=this.x-speed;
					}else{
						this.x=0;
					}
					playerModel.bitmapData=units["left"];
					break;
				case 1://up
					if(this.y>=(this.height/2)){
						this.y=this.y-speed;
					}else{
						this.y=0;
					}
					playerModel.bitmapData=units["normal"];
					break;
				case 2://right
					if(this.x<(ConstUtil.BGWIDTH-(this.width/2))){
						this.x=this.x+speed;
					}else{
						this.x=ConstUtil.BGWIDTH-(this.width/2);
					}
					playerModel.bitmapData=units["right"];
					break;
				case 3://down
					if(this.y<(ConstUtil.BGHEIGHT-(this.height/2))){
						this.y=this.y+speed;
					}else{
						this.y=ConstUtil.BGHEIGHT-(this.height/2);
					}
					playerModel.bitmapData=units["normal"];
					break;				
			}
		}
		
	}
}





