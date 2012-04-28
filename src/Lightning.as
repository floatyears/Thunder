/**
 * 雷电项目的主程序，所有显示运行等都在此程序中进行
 * @author：林孟涛 2012-04-23
 * @alter：
 * 
 */
package
{
	import Collision.*;
	
	import cn.team.classes.*;
	import cn.team.classes.Enemy;
	import cn.team.constUtil.ConstUtil;
	
	import flash.display.Graphics;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.ui.Keyboard;

	[SWF(width=500,height=600)]
	public class Lightning extends Sprite
	{
		
		//用来装子弹的Array
		private var bArray:Array;
		//用来装飞机的Array
		private var pArray:Array;
		//判断是否按了向上的按键
		private var bU:Boolean = false;
		//判断是否按了向右的按键
		private var bR:Boolean = false;
		//判断是否按了向下的按键
		private var bD:Boolean = false;
		//判断是否按了向左的按键
		private var bL:Boolean = false;
		//判断是否按了Ctrl键
		private var bC:Boolean = false;
		//当前的方向
		private var dir:String = "STOP";
		//玩家的飞机
		private var plane:Player;
		//加载资源的loader
		private var loader:Loader;
		//loader进来的资源放入的地方
		private var context:LoaderContext;
		
		private var count:uint=10;
		
		private var ePlane:Enemy;
		
		private var colEvt:CollisionEvent;
		
		public function Lightning()
		{
			//this.stage.color = 0x000000;
			this.x = ConstUtil.BGX;
			this.y = ConstUtil.BGY;
			this.bArray = new Array();
			this.pArray = new Array();
			this.init();
			checkCollision();
		}
		
		/**
		 * 整个程序初始化方法
		 * 
		 */
		private function init():void {
			this.stage.frameRate = 60;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
//			var g:Graphics = this.graphics;
//			g.beginFill(0xffff00);
//			g.drawRect(0,0,ConstUtil.BGWIDTH,ConstUtil.BGHEIGHT);
//			g.endFill();
			this.loadResource("../resource/resource.swf");
//			for(var i:int = 0;i<10;i++){
//				this.addChild(new Plane(false,10));
//			}
			this.drawStage();
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN,keyPressed);
			this.stage.addEventListener(KeyboardEvent.KEY_UP,keyRelease);
		}
		/**
		 * 
		 * 
		 */		
		private function drawStage():void{
			var g:Graphics = this.graphics;
			g.beginFill(0x00ccff);
			g.drawRect(this.stage.x,this.stage.y,ConstUtil.BGWIDTH,ConstUtil.BGHEIGHT);
			g.endFill();
			//g = null;
		}
		/**
		 * 
		 * @param resourceUrl:
		 * 
		 */
		private function loadResource(resourceUrl:String):void
		{
			context = new LoaderContext();
			context.applicationDomain = ApplicationDomain.currentDomain;
			loader = new Loader();
			loader.load(new URLRequest(resourceUrl),context);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,addPlane);
		}
		
		protected function addPlane(event:Event):void
		{
			trace("hello");
			plane = new Player(true,100);
			ePlane = new Enemy();
			var ePlane2:SteerEnemyPlane = new SteerEnemyPlane();
			this.addChild(plane);
			this.addChild(ePlane);
			this.addChild(ePlane2);
			this.addChild(new SeekEnemyPlane(plane.x,plane.y));
			
			//plane.disappear();
		}
		
		/**
		 * 当按键时触发的事件
		 * @param event:键盘事件
		 * 
		 */
		protected function keyPressed(event:KeyboardEvent):void
		{
			var key:int = event.keyCode;
			/*if(key == Keyboard.SPACE){
				plane.addChild(plane.fire());
			}*/
			switch(key){
				case Keyboard.CONTROL:
					this.bC = true;
//					plane.firing = true;
//					if(count>=10){
//						this.stage.addChild(plane.fire());
//						count=0;
//					}
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
					
					//this.stage.addEventListener(Event.ENTER_FRAME,fire);
			}
			this.locationDirect();
			this.stage.addEventListener(Event.ENTER_FRAME,nextMove);
		}
		
//		private function fire(evt:Event):void
//		{
//			
//			plane.fire();
//		}
		
		private function locationDirect():void
		{
			if(bL && !bR && !bU && !bD && bC){
				dir = "LC";
			}else if(bL && !bR && !bU && !bD && !bC){
				dir = "L";
			}else if(bL && !bR && bU && !bD && bC){
				dir = "LUC"
			}else if(bL && !bR && bU && !bD && !bC){
				dir = "LU";
			}else if(bL && !bR && !bU && bD && bC){
				dir = "DLC";
			}else if(bL && !bR && !bU && bD && !bC){
				dir = "DL";
			}else if(!bL && bR && !bU && !bD && bC){
				dir = "RC";
			}else if(!bL && bR && !bU && !bD && !bC){
				dir = "R";
			}else if(!bL && bR && bU && !bD && bC){
				dir = "URC";
			}else if(!bL && bR && bU && !bD && !bC){
				dir = "UR";
			}else if(!bL && bR && !bU && bD && bC){
				dir = "RDC";
			}else if(!bL && bR && !bU && bD && !bC){
				dir = "RD";
			}else if(!bL && !bR && bU && !bD && bC){
				dir = "UC";
			}else if(!bL && !bR && bU && !bD && !bC){
				dir = "U";
			}else if(!bL && !bR && !bU && bD && bC){
				dir = "DC";
			}else if(!bL && !bR && !bU && bD && !bC){
				dir = "D";
			}else if(!bL && !bR && !bU && !bD && bC){
				dir = "STOPC";
			}else if(!bL && !bR && !bU && !bD){
				dir = "STOP";
			}
		}
		
		private function nextMove(e:Event):void
		{
			if(count <=10)
				count++;
			this.removeEventListener(Event.ENTER_FRAME,nextMove);
			switch(dir){
				case "STOP":
					plane.playerModel.bitmapData = plane.units["normal"];
//					plane.firing = false;
//					plane.fire();
					break;
				case "STOPC":
					plane.playerModel.bitmapData = plane.units["normal"];
					plane.firing = true;
					if(count>=10){
						this.stage.addChild(plane.fire());
						count=0;
					}
					break;
				case "L":
					plane.x -= ConstUtil.USERSPEED;
					plane.playerModel.bitmapData = plane.units["left"];
//					plane.firing = false;
//					plane.fire();
					break;
				case "LC":
					plane.x -= ConstUtil.USERSPEED;
					plane.playerModel.bitmapData = plane.units["left"];
					plane.firing = true;
					if(count>=10){
						this.stage.addChild(plane.fire());
						count=0;
					}
					break;
				case "LU":
					plane.x -= ConstUtil.USERSPEED/Math.sqrt(2);
					plane.y -= ConstUtil.USERSPEED/Math.sqrt(2);
//					plane.firing = false;
//					plane.fire();
					plane.playerModel.bitmapData = plane.units["left"];
					break;
				case "LUC":
					plane.x -= ConstUtil.USERSPEED/Math.sqrt(2);
					plane.y -= ConstUtil.USERSPEED/Math.sqrt(2);
					plane.playerModel.bitmapData = plane.units["left"];
					plane.firing = true;
					if(count>=10){
						this.stage.addChild(plane.fire());
						count=0;
					}
					break;
				case "U":
					plane.y -= ConstUtil.USERSPEED;
					plane.playerModel.bitmapData = plane.units["normal"];
//					plane.firing = false;
//					plane.fire();
					break;
				case "UC":
					plane.y -= ConstUtil.USERSPEED;
					plane.playerModel.bitmapData = plane.units["normal"];
					plane.firing = true;
					if(count>=10){
						this.stage.addChild(plane.fire());
						count=0;
					}
					break;
				case "UR":
					plane.x += ConstUtil.USERSPEED/Math.sqrt(2);
					plane.y -= ConstUtil.USERSPEED/Math.sqrt(2);
					plane.playerModel.bitmapData = plane.units["right"];
					//plane.fire();
					break;
				case "URC":
					plane.x += ConstUtil.USERSPEED/Math.sqrt(2);
					plane.y -= ConstUtil.USERSPEED/Math.sqrt(2);
					plane.playerModel.bitmapData = plane.units["right"];
					plane.firing = true;
					if(count>=10){
						this.stage.addChild(plane.fire());
						count=0;
					}
					break;
				case "R":
					plane.x += ConstUtil.USERSPEED;
					plane.playerModel.bitmapData = plane.units["right"];
//					plane.fire();
					break;
				case "RC":
					plane.x += ConstUtil.USERSPEED;
					plane.playerModel.bitmapData = plane.units["right"];
					plane.firing = true;
					if(count>=10){
						this.stage.addChild(plane.fire());
						count=0;
					}
					break;
				case "RD":
					plane.x += ConstUtil.USERSPEED/Math.sqrt(2);
					plane.y += ConstUtil.USERSPEED/Math.sqrt(2);
					plane.playerModel.bitmapData = plane.units["right"];
//					plane.fire();
					break;
				case "RDC":
					plane.x += ConstUtil.USERSPEED/Math.sqrt(2);
					plane.y += ConstUtil.USERSPEED/Math.sqrt(2);
					plane.playerModel.bitmapData = plane.units["right"];
					plane.firing = true;
					if(count>=10){
						this.stage.addChild(plane.fire());
						count=0;
					}
					break;
				case "D":
					plane.y += ConstUtil.USERSPEED;
					plane.playerModel.bitmapData = plane.units["normal"];
//					plane.firing = false;
//					plane.fire();
					break;
				case "DC":
					plane.y += ConstUtil.USERSPEED;
					plane.playerModel.bitmapData = plane.units["normal"];
					plane.firing = true;
					if(count>=10){
						this.stage.addChild(plane.fire());
						count=0;
					}
					break;
				case "DL":
					plane.x -= ConstUtil.USERSPEED/Math.sqrt(2);
					plane.y += ConstUtil.USERSPEED/Math.sqrt(2);
					plane.playerModel.bitmapData = plane.units["left"];
//					plane.firing = false;
//					plane.fire();
					break;
				case "DLC":
					plane.x -= ConstUtil.USERSPEED/Math.sqrt(2);
					plane.y += ConstUtil.USERSPEED/Math.sqrt(2);
					plane.playerModel.bitmapData = plane.units["left"];
					plane.firing = true;
					if(count>=10){
						this.stage.addChild(plane.fire());
						count=0;
					}
					break;
			}
			if(plane.x<=this.stage.x)
				plane.x=this.stage.x;
			if(plane.y<=this.stage.x)
				plane.y=this.stage.x;
			if(plane.x>=ConstUtil.BGWIDTH-plane.width)
				plane.x =ConstUtil.BGWIDTH-plane.width;
			if(plane.y>=ConstUtil.BGHEIGHT-plane.height)
				plane.y = ConstUtil.BGHEIGHT-plane.height;
			for(var i:uint=0;i<plane.bullets.length;i++){
				plane.bullets[i].move(0);
			}
		}
		protected function keyRelease(event:KeyboardEvent):void
		{
			var key:int = event.keyCode;
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
				case Keyboard.CONTROL:
					this.bC = false;
					plane.firing = false;
					break;
				
			}
			this.locationDirect();
			this.nextMove(event);
		}
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get _bArray():Array{
			return bArray;
		}
		
		public function checkCollision():void
		{
			var collision:Collision = new Collision(plane.bullets,[ePlane]);
			collision.checkCollision();
			colEvt.addListener(CollisionEvent.COLLIDE,explode)
		}
		
		private function explode(evt:CollisionEvent):void
		{
			// TODO Auto Generated method stub
			var explode:Explode = new Explode(ePlane.x,ePlane.y);
			ePlane.addChild(explode);
		}
	}
}