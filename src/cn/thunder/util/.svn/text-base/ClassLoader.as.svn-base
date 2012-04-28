/**
 * 外部素材加载类，可加载外部swf素材库，并获得其内的元件
 * @author:周小钢    2012-04-25
 * @alter:
 * 
 */ 

package cn.thunder.util {
	
	import flash.display.Loader;
	import flash.net.URLRequest;
	import flash.utils.ByteArray;
	import flash.events.Event;
	import flash.events.ProgressEvent;
	import flash.events.EventDispatcher;
	import flash.system.LoaderContext;
	
	public class ClassLoader extends EventDispatcher{
		
		//素材URL地址
		public var url:String;
		public var loader:Loader;
		
		/**
		 * 构造器
		 * @param obj 传入URL或二进制数组,默认为null
		 * @param lc: 加载器的上下文，默认为null
		 *
		 */
		public function ClassLoader(obj:Object = null,lc:LoaderContext = null) {
			if(obj != null){
				if(obj is ByteArray){
					loadBytes(obj as ByteArray,lc);
				}else if(obj is String){
					load(obj as String,lc);
				}else{
					throw new Error("参数错误，构造函数第一参数只接受ByteArray或String");
				}
			}
		}
		
		/**
		 * URL地址加载方式
		 * @param _url
		 * @param lc
		 * 
		 */ 
		public function load(_url:String,lc:LoaderContext = null):void{
			url = _url;
			loader = new Loader;
			loader.load(new URLRequest(url),lc);
			addEvent();
		}
		
		/**
		 * 字节数组加载方式
		 * @param bytes 欲加载的字节数组
		 * @param lc
		 * 
		 */ 
		public function loadBytes(bytes:ByteArray,lc:LoaderContext = null):void{
			loader = new Loader;
			loader.loadBytes(bytes,lc);
			addEvent();
		}
		
		/**
		 * 给loader添加进度监听事件和加载完成事件
		 * 
		 */ 
		private function addEvent():void{
			loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS,progressFun);
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,completeFun);
		}
		
		/**
		 * 移除loader的监听事件
		 * 
		 */ 
		private function delEvent():void{
			loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS,progressFun);
			loader.contentLoaderInfo.removeEventListener(Event.COMPLETE,completeFun);
		}
		
		
		/**
		 * 加载成功时，发布监听事件
		 * @param evt
		 * 
		 */ 
		private function completeFun(evt:Event):void {
			delEvent();
			dispatchEvent(evt);
		}
		
		/**
		 * 正在进行加载时发布事件
		 * @param evt
		 * 
		 */ 
		private function progressFun(evt:ProgressEvent):void{
			dispatchEvent(evt);
		}
		
		/**
		 * 获取外部素材中元件的类定义
		 * @param className 欲获取的类名称
		 * 
		 */ 
		public function getClass(className:String):Object {
			return loader.contentLoaderInfo.applicationDomain.getDefinition(className);
		}
		
		/**
		 * 检查是否存在某一类定义
		 * @param className
		 */ 
		public function hasClass(className:String):Boolean {
			return loader.contentLoaderInfo.applicationDomain.hasDefinition(className);
		}
		
		/**
		 * 清除加载器loader
		 * 
		 */ 
		public function clear():void{
			loader.unload();
			loader = null;
		}
	}
}
