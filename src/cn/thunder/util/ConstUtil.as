/**
 * 常量类，用于项目中子弹，飞机等的各种常量
 * @author：林孟涛 2012-04-23
 * @alter：
 * 
 */

package cn.thunder.util
{
	public class ConstUtil
	{
		//初始化背景时的XY值
		public static const BGX:uint = 10;
		public static const BGY:uint = 10;
		//界面的框和高
		public static const BGWIDTH:Number = 500;
		public static const BGHEIGHT:Number = 600;
		//玩家飞机的方向
		public static const direction:Array = ["U","UR","R","RD","D","DL","L","LU","STOP"];
		//玩家飞机初始化的X,Y坐标
		public static const GOODX:uint = 450;
		public static const GOODY:uint = 150;
		//敌人飞机初始化的X坐标
		public static const BADX:uint = 0;
		
		//飞机XY轴方向上的速度
		public static const RXSPEED:Number = 10;
		public static const RYSPEED:Number = 10;
		//子弹XY轴方向上的速度
		public static const BXSPEED:Number = 10;
		public static const BYSPEED:Number = 10;
		//玩家飞机速度
		public static const PXSPEED:Number = 10;
		public static const PYSPEED:Number = 10;
		//我方飞机颜色值
		public static const GOODCOLOR:uint = 0xE2801F;
		//敌方飞机颜色值
		public static const BADCOLOR:uint = 0x69B61A;
		//子弹的颜色值
		public static const BCOLOR:uint = 0x010E06;
		//子弹的杀伤力和飞机相撞的杀伤力
		public static const DAMAGE:Number = 10;
		//
		public static const USERSPEED:uint=5;
		
		
		
		public function ConstUtil()
		{
		}
	}
}