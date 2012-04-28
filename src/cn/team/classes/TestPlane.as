package cn.team.classes
{
	import cn.team.MoveObject;
	
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.net.URLRequest;

	public class TestPlane extends MovieClip
	{
		private var movieClip:MovieClip;
		private var loader:Loader;
		private var speed:uint;
		public function TestPlane()
		{
			loadingImg("player.swf");
		}
		
		private function loadingImg(src:String):void{
			loader=new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE,loadedImg);
			loader.load(new URLRequest(src));
		}
		
		private function loadedImg(evt:Event):void{
			if(loader.content is MovieClip){
				movieClip=movieClip(loader.content);
				this.addChild(movieClip);
			}
		}
		
		
		
		
	}
}