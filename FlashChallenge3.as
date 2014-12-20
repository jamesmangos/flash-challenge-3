package
{
	import flash.events.Event;
	import flash.geom.*;
	import flash.display.*;
	import flash.net.*;
	
	public class FlashChallenge3 extends Sprite
	{
		private var newWindow:containerWindow;
		
		public function FlashChallenge3()
		{
			newWindow = new containerWindow();
			addChild(newWindow);
			
			//optional stage allignment code
			/*this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;*/
		}
	}
}

import flash.events.*;
import flash.geom.*;
import flash.display.*;
import flash.net.*;
import flash.ui.*;
import flash.text.*; 
import fl.controls.*; 

class containerWindow extends MovieClip
{
	private var titleBar:Sprite;
	private var titleLabel:TextField = new TextField(); 
	private var myXML:XML; //declare instance of XML class
	private var myLoader:URLLoader = new URLLoader();//construct URL loader
	
	private var borderWidth:int = 1;
	
	public function containerWindow()
	{
		drawContainerWindow();
		
		myLoader.load(new URLRequest("data.xml"));//load the file
		myLoader.addEventListener(Event.COMPLETE, processXML);//add an event listener that triggers when loading is complete
	}
	
	function drawContainerWindow()
	{
		//border
		this.x = 100;
		this.y = 100;
		graphics.lineStyle(borderWidth,0x000000,1);
		graphics.moveTo(this.x, this.y);
		graphics.lineTo(this.x + 200 - borderWidth, this.y);
		graphics.lineTo(this.x + 200 - borderWidth, this.y + 200 - borderWidth);
		graphics.lineTo(this.x, this.y + 200 - borderWidth);
		graphics.lineTo(this.x, this.y);
		
		//draw titleBar
		titleBar = new Sprite();
		addChild(titleBar);
		titleBar.graphics.beginFill(0x0000FF);
		titleBar.graphics.drawRect(this.x, this.y, this.width, 20);
		titleBar.graphics.endFill();
		initDragger();
				
		//title words
		titleLabel.x = this.x;
		titleLabel.y = this.y;
		//titleLabel.width = this.width / 2 - this.x;
		titleLabel.height = 20;
		titleLabel.text = "Test Chart";
		titleLabel.textColor = 0xFFFFFF;
		titleLabel.selectable = false;
		addChild(titleLabel);
	}
	
	function initDragger():void
	{
		titleBar.addEventListener(MouseEvent.MOUSE_DOWN, mouseDownHandler);
		titleBar.addEventListener(MouseEvent.MOUSE_UP, mouseUpHandler);
	}

	function mouseDownHandler(e:MouseEvent):void
	{
		this.startDrag();
	}
	
	function mouseUpHandler(e:MouseEvent):void
	{
		this.stopDrag();
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
		for (i = 0; i < myXML.square.length(); i++)
		{
			squares[i].graphics.beginFill(myXML.square[i].colour); //colour e.g. 0xFF0000
			squares[i].graphics.drawRect(this.x + (this.width-myXML.square[i].width)*(i/(myXML.square.length()-1)), this.y + this.height- myXML.square[i].height, myXML.square[i].width, myXML.square[i].height);//int,int,int,int
			squares[i].graphics.endFill();
		}
	}
}