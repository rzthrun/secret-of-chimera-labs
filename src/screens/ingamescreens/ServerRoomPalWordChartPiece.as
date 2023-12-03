package screens.ingamescreens
{
	import starling.display.Sprite;
	
	import starling.display.Image;
	import starling.events.Event;
	import starling.utils.AssetManager;
	
	public class ServerRoomPalWordChartPiece extends Sprite
	{
		
		public var assets:AssetManager;
		public var word_type:String;
		public var bg_outline:Image;
		public var word_image:Image;
		
		
		public function ServerRoomPalWordChartPiece(_assets:AssetManager,_word_type:String)
		{
			super();
			this.assets = _assets;
			this.word_type = _word_type;
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(e:Event):void{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
			onLoadAssets();
							
			
		}
		private function onLoadAssets():void{
			trace('word_type: '+word_type);
			
			word_image = new Image(this.assets.getTexture(''+word_type));
			word_image.touchable = false;			
			word_image.x = 62;
			word_image.y = 8;
			word_image.pivotX = word_image.width / 2;
			//word_image.pivotY = word_image.height / 2;
			
			bg_outline = new Image(this.assets.getTexture('wordchart_outline'));
			bg_outline.touchable = false;			
			bg_outline.x = 0;
			bg_outline.y = 0;
			this.addChildAt(bg_outline,0);
			this.addChildAt(word_image,1);
			//Rotate(pos);
		}
	}
}