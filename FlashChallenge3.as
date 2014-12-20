package
{
	import flash.events.Event;
	import flash.geom.*;
	import flash.display.*;
	import flash.net.*;
	
	public class FlashChallenge3 extends Sprite
	{
		private var myXML:XML; //declare instance of XML class
		private var myLoader:URLLoader = new URLLoader();//construct URL loader
		
		public function FlashChallenge3()
		{
			//optional stage allignment code
			/*this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;*/
		
			myLoader.load(new URLRequest("data.xml"));//load the file
			myLoader.addEventListener(Event.COMPLETE, processXML);//add an event listener that triggers when loading is complete
		}
		
		function processXML(e:Event):void
		{
			//instatiate XML variable with the data from the XML file
			myXML = new XML(e.target.data);
			
			//create sprites
			var squares:Array = new Array();
			for (var i:int = 0; i < myXML.square.length(); i++)
			{
				squares[i] = new Sprite();
				addChild(squares[i]);
			}
			
			//draw rectangles
			for (var i:int = 0; i < myXML.square.length(); i++)
			{
				squares[i].graphics.beginFill(myXML.square[i].colour); //colour e.g. 0xFF0000
				squares[i].graphics.drawRect((stage.stageWidth-myXML.square[i].width)*(i/(myXML.square.length()-1)), 300-myXML.square[i].height, myXML.square[i].width, myXML.square[i].height);//int,int,int,int
				squares[i].graphics.endFill();
			}
		}
	}
}