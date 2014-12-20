package
{
	import flash.events.MouseEvent;
	import flash.events.KeyboardEvent;
	import flash.events.Event;
	import flash.ui.Keyboard;
	
	import flash.geom.*;
	import flash.display.*;
	import flash.net.*;
	
	public class FlashChallenge3 extends Sprite
	{
		private var myXML:XML; //declare instance of XML class
		private var myLoader:URLLoader = new URLLoader();//construct URL loader
		
		private var myArray = [[0,0,0,0,[0x0000FF,0xFF0000]], [0,0,0,0,[0x0000FF,0xFF0000]], [0,0,0,0,[0x0000FF,0xFF0000]]];
		
		public function FlashChallenge3()
		{
			//optional stage allignment code
			/*import flash.display.StageAlign;
			import flash.display.StageScaleMode;
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;*/
		
			myLoader.load(new URLRequest("data.xml"));//load the file
			myLoader.addEventListener(Event.COMPLETE, processXML);//add an event listener that triggers when loading is complete
			
			
			//array of values for the rectangles
			//var myArray = [[0,stage.stageHeight-100,20,100,[0x0000FF,0xFF0000]], [stage.stageWidth/2,stage.stageHeight-50,20,50,[0x0000FF,0xFF0000]], [stage.stageWidth-20,stage.stageHeight-80,20,80,[0x0000FF,0xFF0000]]];
		}
		
		function processXML(e:Event):void
		{
			//instatiate XML variable with the data from the XML file
			myXML = new XML(e.target.data);
			//trace(myXML.square[0].x);
	
			//trace(myXML); //output all data in file
			//trace(myXML.*);//output all children of a node //.children() does the same thing
			//trace(myXML.IMAGE);//output only image nodes
			//trace(myXML.IMAGE.*);//output the text value of image nodes
			//trace(myXML.IMAGE[0]);//output the text value of a specific node
			//trace(myXML.IMAGE.@TITLE);//output the attribute value of a group of nodes
			//trace(myXML.IMAGE[0].@TITLE);//output the attribute value of a specific node
			//trace(myXML.IMAGE.(@TITLE=="school"));//output the value of the image node that has the title "school"
			//trace(myXML.IMAGE.length());//number of image nodes
			
			for (var i:int = 0 ; i < myXML.square.length(); i++)
			{
				myArray[i][0] = myXML.square[i].x;
				myArray[i][1] = myXML.square[i].y;
				myArray[i][2] = myXML.square[i].width;
				myArray[i][3] = myXML.square[i].height;
				myArray[i][4][0] = myXML.square[i].colour;
				
				/*trace(myXML.square[i].x);
				trace(myXML.square[i].y);
				trace(myXML.square[i].width);
				trace(myXML.square[i].height);
				trace(myXML.square[i].colour);*/
			}
			
			//create sprites
			var squares:Array = new Array();
			for (var i:int = 0; i < myArray.length; i++)
			{
				squares[i] = new Sprite();
				addChild(squares[i]);
			}
			
			//draw rectangles with properties from first array
			for (var i:int = 0; i < myArray.length; i++)
			{
				//trace("creating square " + i + " at " + myArray[i][0] + "," + myArray[i][1] + " with colour " + myArray[i][4][1]);
				squares[i].graphics.beginFill(myArray[i][4][1]); //colour e.g. 0xFF0000
				squares[i].graphics.drawRect(myArray[i][0],myArray[i][1],myArray[i][2], myArray[i][3]);//int,int,int,int
				squares[i].graphics.endFill();
			}
			//trace("myXML.square.length() is " + myXML.square.length());
			//trace("myArray length is " + myArray.length);
		}
	}
}
