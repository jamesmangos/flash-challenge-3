package
{	
	import flash.geom.*
	import flash.display.*
	
	public class FlashChallenge3 extends Sprite
	{
		
		public function FlashChallenge3()
		{
			//optional stage allignment code
			/*import flash.display.StageAlign;
			import flash.display.StageScaleMode;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;*/
			
			//array of values for the rectangles
			var myArray = [[0,stage.stageHeight-100,20,100,[0x0000FF,0xFF0000]], [stage.stageWidth/2,stage.stageHeight-50,20,50,[0x0000FF,0xFF0000]], [stage.stageWidth-20,stage.stageHeight-80,20,80,[0x0000FF,0xFF0000]]];
			
			//create sprites
			var squares:Array = new Array();
			for (var i:int = 0; i<myArray.length; i++)
			{
				squares[i] = new Sprite();
				addChild(squares[i]);
			}
			
			//draw rectangles with properties from first array
			for (var i:int = 0; i<myArray.length; i++)
			{
				squares[i].graphics.beginFill(myArray[i][4][1]);
				squares[i].graphics.drawRect(myArray[i][0],myArray[i][1],myArray[i][2], myArray[i][3]);
				squares[1].graphics.endFill();
			}
		}
	}
}