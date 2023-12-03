package screens.ingamescreens
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	public class SpinWheelArm extends Sprite
	{
		public var assets:AssetManager;
		
		public var ballHolder:Sprite;
		public var visCount:int = 0;
		
		public var ball_00:Image;
		public var ball_01:Image;
		public var ball_02:Image;
		public var ball_03:Image;
		public var ball_04:Image;
		public var ball_05:Image;
		public var ball_06:Image;
		public var ball_07:Image;
		public var ball_08:Image;
		public var ball_09:Image;
		public var ball_10:Image;
	//	public var ball_11:Image;
		
		public function SpinWheelArm(_assets:AssetManager,_visCount:int = 0)
		{
			super();
			this.assets = _assets;
			visCount = _visCount;
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(e:Event):void{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		
			onLoadAssets();
							
			
		}		
		private function onLoadAssets():void{
			ballHolder = new Sprite();
			ballHolder.touchable = false;
		//	ballHolder.height = 36;
			//ballHolder.pivotY = 9;
			ballHolder.x = 100;
			ballHolder.y = 0;
			
			ballHolder.alpha = 1;
					
			ball_00 = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			ball_00.touchable = false;
			ball_00.x = 0*9;
			ball_00.y = -18*1;
			if(visCount > 0){
				ball_00.alpha = 1;
			}else{
				ball_00.alpha = 0;
			}
			
			
			ball_01 = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			ball_01.touchable = false;
			ball_01.x = 1*9;
			ball_01.y = -18*0;
			if(visCount > 1){
				ball_01.alpha = 1;
			}else{
				ball_01.alpha = 0;
			}

			ball_02 = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			ball_02.touchable = false;
			ball_02.x = 2*9;
			ball_02.y = -18*1;
			if(visCount > 2){
				ball_02.alpha = 1;
			}else{
				ball_02.alpha = 0;
			}
			
			ball_03 = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			ball_03.touchable = false;
			ball_03.x = 3*9;
			ball_03.y = -18*0;			
			if(visCount > 3){
				ball_03.alpha = 1;
			}else{
				ball_03.alpha = 0;
			}
			
			ball_04 = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			ball_04.touchable = false;
			ball_04.x = 4*9;
			ball_04.y = -18*1;
			if(visCount > 4){
				ball_04.alpha = 1;
			}else{
				ball_04.alpha = 0;
			}
		
			ball_05 = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			ball_05.touchable = false;
			ball_05.x = 5*9;
			ball_05.y = -18*0;
			if(visCount > 5){
				ball_05.alpha = 1;
			}else{
				ball_05.alpha = 0;
			}
			
			ball_06 = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			ball_06.touchable = false;
			ball_06.x = 6*9;
			ball_06.y = -18*1;
			if(visCount > 6){
				ball_06.alpha = 1;
			}else{
				ball_06.alpha = 0;
			}
			
			ball_07 = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			ball_07.touchable = false;
			ball_07.x = 7*9;
			ball_07.y = -18*0;
			if(visCount > 7){
				ball_07.alpha = 1;
			}else{
				ball_07.alpha = 0;
			}
			
			ball_08 = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			ball_08.touchable = false;
			ball_08.x = 8*9;
			ball_08.y = -18*1;
			if(visCount > 8){
				ball_08.alpha = 1;
			}else{
				ball_08.alpha = 0;
			}

			ball_09 = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			ball_09.touchable = false;
			ball_09.x = 9*9;
			ball_09.y = -18*0;
			if(visCount > 9){
				ball_09.alpha = 1;
			}else{
				ball_09.alpha = 0;
			}

			ball_10 = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			ball_10.touchable = false;
			ball_10.x = 10*9;
			ball_10.y = -18*1;
			if(visCount > 10){
				ball_10.alpha = 1;
			}else{
				ball_10.alpha = 0;
			}

			ballHolder.addChild(ball_00);
			ballHolder.addChild(ball_01);
			ballHolder.addChild(ball_02);
			ballHolder.addChild(ball_03);
			ballHolder.addChild(ball_04);
			ballHolder.addChild(ball_05);
			ballHolder.addChild(ball_05);
			ballHolder.addChild(ball_06);
			ballHolder.addChild(ball_07);
			ballHolder.addChild(ball_08);
			ballHolder.addChild(ball_09);
			ballHolder.addChild(ball_10);
			
			
			
			this.addChild(ballHolder);
			trace("SPLASH");
		}
	}
}