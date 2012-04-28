/**
 * 雷电项目的主程序，所有显示运行等都在此程序中进行
 * @author：林孟涛 2012-04-23
 * @alter：
 * 
 */
package
{
	import Collision.*;
	
	import cn.thunder.clips.GameBackground;
	import cn.thunder.plane.Enemy;
	import cn.thunder.plane.FirstBoss;
	import cn.thunder.plane.Player;
	import cn.thunder.plane.SeekEnemyPlane;
	import cn.thunder.plane.SteerEnemyPlane;
	import cn.thunder.util.ConstUtil;
	import cn.thunder.weapon.Bullets;
	
	import flash.display.Graphics;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.URLRequest;
	import flash.system.ApplicationDomain;
	import flash.system.LoaderContext;
	import flash.ui.Keyboard;
	import flash.utils.Dictionary;

	[SWF(width=400,height=500)]
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
		
		private var colEvt:CollisionEvent = new CollisionEvent();
		
		private var collision1:Collision = new Collision();
		private var dic:Dictionary = new Dictionary();
		
		private var keyArr:Array = [];
		
		public function Lightning()
		{
			//this.stage.color = 0x000000;
			this.x = ConstUtil.BGX;
			this.y = ConstUtil.BGY;
			this.bArray = new Array();
			this.pArray = new Array();
			this.init();
			addEventListener(Event.ENTER_FRAME,checkCollision);
			addEventListener(Event.ADDED_TO_STAGE,addCollisionArr)
			colEvt.addListener(CollisionEvent.COLLIDE,handleCollision)
		}
		
		private function handleCollision(evt:CollisionEvent):void
		{
			// TODO Auto Generated method stub
			dic[evt.id1] = null;
			dic[evt.id2] = null;
		}
		
		protected function addCollisionArr(evt:Event):void
		{
			// TODO Auto-generated method stub
			/*if(evt.target.mid){
				
			}*/
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
			//this.drawStage();
			this.stage.addEventListener(KeyboardEvent.KEY_DOWN,keyPress);
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
			//trace("hello");
			addChild(new GameBackground());
			var firstBoss:FirstBoss = new FirstBoss();
			dic[firstBoss.mid] = firstBoss;
			addChild(firstBoss);
			collision1.colArrA.push(firstBoss);
			
			plane = new Player(true,100);
			ePlane = new Enemy();
			var ePlane2:SteerEnemyPlane = new SteerEnemyPlane();
			this.addChild(plane);
			dic[plane.mid] = plane;
			
			this.addChild(ePlane);
			collision1.colArrA.push(ePlane);
			dic[ePlane.mid] = ePlane;
			
			this.addChild(ePlane2);
			collision1.colArrA.push(ePlane2);
			dic[ePlane2.mid] = ePlane2;
			
			var ePlane3:SeekEnemyPlane = new SeekEnemyPlane();
			ePlane3.target = plane;
			collision1.colArrA.push(ePlane3);
			this.addChild(ePlane3);
			
			dic[ePlane3.mid] = ePlane3;
			
			
			
			//plane.disappear();
		}
		
		/**
		 * 当按键时触发的事件
		 * @param event:键盘事件
		 * 
		 */
		protected function keyPress(event:KeyboardEvent):void
		{
			var key:int = event.keyCode;
			/*if(key == Keyboard.SPACE){
				plane.addChild(plane.fire());
			}*/
			switch(key){
				case Keyboard.CONTROL:
					if(keyArr.indexOf('C') < 0){
						keyArr.push('C');
					}
					break;
				case Keyboard.UP:
					if(keyArr.indexOf('U') < 0){
						keyArr.push('U');
					}
					break;
				case Keyboard.RIGHT:
					if(keyArr.indexOf('R') < 0){
						keyArr.push('R');
					}
					break;
				case Keyboard.DOWN:
					if(keyArr.indexOf('D') < 0){
						keyArr.push('D');
					}
					break;
				case Keyboard.LEFT:
					if(keyArr.indexOf('L') < 0){
						keyArr.push('L');
					}
					break;
					
					//this.stage.addEventListener(Event.ENTER_FRAME,fire);
			}
			//this.locationDirect();
			plane.control(keyArr);
		}
		
		protected function keyRelease(event:KeyboardEvent):void
		{
			var key:int = event.keyCode;
			switch(key){
				case Keyboard.UP:
						keyArr.splice(keyArr.indexOf('U'),1);
					break;
				case Keyboard.RIGHT:
					keyArr.splice(keyArr.indexOf('R'),1);
					break;
				case Keyboard.DOWN:
					keyArr.splice(keyArr.indexOf('D'),1);
					break;
				case Keyboard.LEFT:
					keyArr.splice(keyArr.indexOf('L'),1);
					break;
				case Keyboard.CONTROL:
					keyArr.splice(keyArr.indexOf('C'),1);
					break;
				
			}
			plane.control(keyArr);
		}
		

		
		
		
		/**
		 * 
		 * @return 
		 * 
		 */
		public function get _bArray():Array{
			return bArray;
		}
		
		public function checkCollision(evt:Event):void
		{
			collision1.checkCollision();
			//colEvt.addListener(CollisionEvent.COLLIDE,explode)
			//return collision1;
		}
		
	}
}