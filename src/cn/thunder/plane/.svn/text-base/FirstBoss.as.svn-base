/**
 *
 * Boss类，Boss自动移动，Boss自动发射炮弹
 * @author:周小钢     2012-04-26
 * @alter:
 */
package cn.thunder.plane
{
	import cn.thunder.util.BitmapDataLoader;
	import cn.thunder.weapon.Bullets;
	import cn.thunder.weapon.BulletsA;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.filters.DropShadowFilter;
	import flash.system.ApplicationDomain;
	import flash.utils.Dictionary;

	public class FirstBoss extends Enemy
	{
		private var bossModel:Bitmap;
		private var bossUnits:Dictionary;
		private var direction:uint=0;
		private var timeDiff:uint=0;
		
		/**
		 *构造器 
		 * 
		 */		
		public function FirstBoss()
		{
			super();
			init(10000);
			speed = 1;
		}
		
		/**
		 * Boss模型加载器 
		 * 
		 */		
		private function loadModel():void{
			bossUnits["normal"]=BitmapDataLoader.getBitmapData("BossNormal",88,107);
			bossUnits["left"]=BitmapDataLoader.getBitmapData("BossLeft",88,107);
			bossUnits["right"]=BitmapDataLoader.getBitmapData("BossRight",88,107);
			bossModel.bitmapData=bossUnits["normal"];
			bossModel.x=-(bossModel.width/2);
			bossModel.y=-(bossModel.height/2);
			this.addChild(bossModel);
			
		}
		
		/**
		 * Boss初始化操作 
		 * 
		 */		
		protected override function init(life:Number):void{
			bossModel=new Bitmap();
			bossUnits=new Dictionary();
			loadModel();
			//当Boss添加到舞台时触发事件
			//this.addEventListener(Event.ADDED_TO_STAGE,bossStart);
		}
		
		
		/**
		 * Boss执行动作：移动、发射导弹 
		 * @param evt
		 * 
		 */		
		public override function move(evt:Event):void{
			bossMove();
			timeDiff++;
			if(timeDiff>=60){
				timeDiff=0;
				this.openFire();
			}
		}
		
		/**
		 * Boss移动方法，移动方向有八个 
		 * 0:left; 1:up; 2:right; 3:down; 4:left-up; 5:left-down; 6:right-up; 7:right-down
		 * 当Boss移动到边界时，随机产生新方向
		 */		
		private function bossMove():void{
			switch(direction){
				case 0://left
					if(this.x>(this.width/2)){
						this.x-=speed;
						this.bossModel.bitmapData=bossUnits["left"];
					}else{
						this.x=this.width/2;
						this.direction=Math.random()*8;
					}break;
				case 1://up
					if(this.y>(this.height/2)){
						this.y-=speed;
						this.bossModel.bitmapData=bossUnits["normal"];
					}else{
						this.y=this.height/2;
						this.direction=Math.random()*8;
					}break;
				case 2://right
					if(this.x<(400-(this.width/2))){
						this.x+=speed;
						//改变飞行状态
						this.bossModel.bitmapData=bossUnits["right"];
					}else{
						this.x=400-(this.width/2);
						//随机生成新方向
						this.direction=Math.random()*8;
					}break;
				case 3://down
					if(this.y<(500/2)){
						this.y+=speed;
						this.bossModel.bitmapData=bossUnits["normal"];
					}else{
						this.y=500/2;
						this.direction=Math.random()*8;
					}break;
				case 4://left-up
					if(this.x>(this.width/2) && this.y>(this.height/2)){
						this.x-=speed;
						this.y-=speed;
						this.bossModel.bitmapData=bossUnits["left"];
					}else{
						this.direction=Math.random()*8;
					}break;
				case 5://left-down
					if(this.x>(this.width/2) && this.y<(500/2)){
						this.x-=speed;
						this.y+=speed;
						this.bossModel.bitmapData=bossUnits["left"];
					}else{
						this.direction=Math.random()*8;
					}break;
				case 6://right-up
					if(this.x<(400-(this.width/2)) && this.y>(this.height/2)){
						this.x+=speed;
						this.y-=speed;
						this.bossModel.bitmapData=bossUnits["right"];
					}else{
						this.direction=Math.random()*8;
					}break;
				case 7://right-down
					if(this.x<(400-(this.width/2)) && this.y<(500/2)){
						this.x+=speed;
						this.y+=speed;
						this.bossModel.bitmapData=bossUnits["right"];
					}else{
						this.direction=Math.random()*8;
					}break;
			}
		}
		
		/**
		 * Boss开火 
		 * 
		 */		
		public override function fire(evt:Event):void{
			count++;
			if(count >= fireInterval){
				this.parent.addChild(new BulletsA(this.x,(this.y+this.height/4),Math.PI/4));
				this.parent.addChild(new BulletsA(this.x,this.y+this.height/4,Math.PI*0.375));
				this.parent.addChild(new BulletsA(this.x,this.y+(this.height/4),Math.PI/2));
				this.parent.addChild(new BulletsA(this.x,this.y+this.height/4,0.625*Math.PI));
				this.parent.addChild(new BulletsA(this.x,(this.y+this.height/4),(3*Math.PI)/4));
				count = 0;
			}
		}
		
	}
}