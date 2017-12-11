package 
{
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.BitmapData;
	import flash.display.Graphics;
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	/**
	 * ...
	 * @author 
	 */
	public class tes extends Sprite
	{
		private var shape:Shape;
		private var X:Number=0;
		private var Y:Number = 0;
		private var w:Number=stage.stageWidth/2;
		private var h:Number=stage.stageHeight/2;
		public function tes() 
		{
			
			//drawxx();
			drawxc();
			//drawtc();
 			
		}
		//画虚线
		public function drawxx(){
			var bmd:BitmapData = new BitmapData(2, 1, true, 0x0);
			bmd.fillRect(new Rectangle(0, 0, 5, 1), 0xFF0000000);
			bmd.setPixel32(0,0,0xFFFF00);
			
			var pen:Sprite = new Sprite();
			addChild(pen);
			pen.x = 50;
			pen.y = 50;
			
			pen.graphics.lineStyle(1);
			pen.graphics.lineBitmapStyle(bmd);
			pen.graphics.moveTo(0, 0);
			pen.graphics.lineTo(200, 0);
		}
		//画虚线圆
		public function drawxc(){
			shape = new Shape();
			var bitmapfill:BitmapData = new BitmapData(2, 1, true, 0);
			bitmapfill.fillRect(new Rectangle(0, 0, 5, 1), 0xFF0000000);
			bitmapfill.setPixel32(0, 0, 0xFFCC00);
			shape.x = 100;
			shape.y = 100;
			var g:Graphics = this.shape.graphics;
			g.clear();
			g.beginBitmapFill(bitmapfill);
			g.drawCircle(0,0,50);
			g.endFill();
			stage.addChild(shape);
		}
		//画多个圆
		public function drawmx(){
			var bmd:BitmapData = new BitmapData(50, 50, false, 0x0);
			var sprite:Sprite = new Sprite();
			sprite.graphics.beginFill(0xff0000);
			sprite.graphics.drawCircle(15,15,15);
			sprite.graphics.endFill();
			bmd.draw(sprite);	
			for(var i:int=0;i<9;i++){
 				var bm:Bitmap=new Bitmap(bmd);
				bm.x=Math.round(i%3) * 50;
				bm.y=int(i/3) *50
				this.addChild(bm);
			} 
		}
		//用时间函数虚线画圆
		private function drawtc(){
			var drawC:Timer = new Timer(1, 360);
			var j1:uint = 100;//开始画圆的位置
			var drawc:Sprite= new Sprite();
			addChild(drawc);
			drawC.start();
			drawC.addEventListener(TimerEvent.TIMER, function(e:TimerEvent):void{
				X = Math.cos(j1 / 90 * Math.PI) *100 + w;//60代表每个点直接的角度，100表示大小和密度
				Y = Math.sin(j1 / 90 * Math.PI) *100 + h;
				j1++;
				drawc.graphics.beginFill(0x0);
				drawc.graphics.drawCircle(X, Y, 1);//表示小圆点的大小
				drawc.graphics.endFill();
			});
			
		}
		
	}

}
