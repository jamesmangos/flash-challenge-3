package
{
	import flash.geom.*
	import flash.display.*
	
	public class FlashChallenge3 extends Sprite
	{
		public function FlashChallenge3()
		{
			//border
			graphics.lineStyle(1,0x00FF00);
			graphics.moveTo(200,200);
			graphics.lineTo(400,200);
			graphics.lineTo(400,350);
			graphics.lineTo(200,350);
			graphics.lineTo(200,200);
			
			//gradient background
			var matr:Matrix = new Matrix();
			matr.createGradientBox(200,150,0,200,200);
			var spreadMethod:String = SpreadMethod.PAD;
			graphics.beginGradientFill(GradientType.LINEAR,[0xFFFFFF,0x000000], [1, 1], [0x00, 0xFF], matr, spreadMethod);
			graphics.drawRect(200,200,200,150);
			graphics.endFill();
		}
	}
}