package screens.notebook
{
	import screens.hud.GoBackButton;
	
	import starling.display.Image;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.utils.AssetManager;

	public class NoteBookDetails extends Sprite
	{
		
		public var assets:AssetManager;
		
		public var bg:Shape;
		public var openbookBg:Image;
		
		public var game:Game;
		
		public var currentPos:int = 0;
		
		public var sideLeft:Image;
		public var sideRight:Image;
		
	//	public var goback:GoBackButton;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;	
		
		public function NoteBookDetails(_assets:AssetManager,_game:Game)
		{
			super();
			this.game = _game;
			this.assets = _assets;
			
			onLoadAssets();
			this.assets.loadQueue(function(n:Number):void{
				trace("GRIPMORES GRIPMORES 0000");
				
				if(n==1){
					trace("GRIPMORES GRIPMORES 0001");
					//		(stage.getChildAt(0) as Object).screenGamePlayHandler.hud.toggleGoBack(FrontDoorObj,true);
					onLoadAssets();
					
				}				
			});	
		}
		
		private function onLoadAssets():void{
			//	CreateBg();
			
			bg = new Shape();
			this.addChildAt(bg,0);
			bg.graphics.beginFill(0x000000);
			bg.graphics.lineTo(0,0);	
			bg.graphics.lineTo(800,0);	
			bg.graphics.lineTo(800,512);	
			bg.graphics.lineTo(0,512);	
			bg.touchable = true;
			bg.graphics.endFill(false);
			bg.alpha = 0.5;
			
			openbookBg = new Image(this.assets.getTexture('notebook_bg'));
			openbookBg.alpha = 1;
			openbookBg.x = 0;
			openbookBg.y = 0;
			openbookBg.touchable = false;
			
			
			sideLeft  = new Image(game.NoteBookOneImages.assets.getTexture("chimerdyne"));
			sideLeft.alpha = 0;
			sideLeft.x = 27;
			sideLeft.y = 7;
			sideLeft.touchable = false;
			
			sideRight  = new Image(game.NoteBookOneImages.assets.getTexture("morse_book_page_00"));
			sideRight.alpha = 0;
			sideRight.x = 400;
			sideRight.y = 7;
			sideRight.touchable = false;
			
			this.addChildAt(openbookBg,1);
			this.addChild(sideLeft);
	//		this.addChildAt(sideLeft,2);
			this.addChild(sideRight);
	//		this.addChildAt(sideRight,3);
			
			
			
			
		//	goback.touchable = false;
			
//			CreateBg();
			
			
	//		goback = new GoBackButton(this.assets);	
		//	goback.alpha = 1;
	//		this.addChild(goback);
			
		}		
		
		public function ChangePage(LeftImg:String,RightImg:String):void{
			if(LeftImg != null){
				trace(LeftImg);
				trace("LI SET");
				if(LeftImg == 'greekchart'){
					SetLeftFromColor(LeftImg);
				}else if(LeftImg == 'hex_notes'){
					SetLeftFromColor(LeftImg);
				}else if(LeftImg == 'hex_painting'){
					SetLeftFromColor(LeftImg);
				}else if(LeftImg == 'adimmzzz'){
					SetLeftFromColor(LeftImg);
				}else if(LeftImg == 'pal'){
					SetLeftFromColor(LeftImg);
				}else if(LeftImg == 'rorschach'){
					SetLeftFromColor(LeftImg);
				}else if(LeftImg == 'loman'){
					SetLeftFromColor(LeftImg);
				}else if(LeftImg == 'periodic_page_00'){
					SetLeftFromColor(LeftImg);
				}else if(LeftImg == 'periodic_page_01'){
					SetLeftFromColor(LeftImg);
				}else if(LeftImg == 'gatc'){	
					SetLeftFromColor(LeftImg);
				}else{
					sideLeft.texture = game.NoteBookOneImages.assets.getTexture(LeftImg);
					sideLeft.alpha = 1;
				}
				
			}else{
				trace("LI NULL");
				sideLeft.alpha = 0;
			}
			if(RightImg != null){
				trace(RightImg);
				trace("RI SET");
				
				if(RightImg == 'greekchart'){
					SetRightFromColor(RightImg);
				}else if(RightImg == 'hex_notes'){
					SetRightFromColor(RightImg);
				}else if(RightImg == 'hex_painting'){
					SetRightFromColor(RightImg);
				}else if(RightImg == 'adimmzzz'){
					SetRightFromColor(RightImg);
				}else if(RightImg == 'pal'){
					SetRightFromColor(RightImg);
				}else if(RightImg == 'rorschach'){
					SetRightFromColor(RightImg);
				}else if(RightImg == 'loman'){
					SetRightFromColor(RightImg);
				}else if(RightImg == 'periodic_page_00'){
					SetRightFromColor(RightImg);
				}else if(RightImg == 'periodic_page_01'){
					SetRightFromColor(RightImg);
				}else if(RightImg == 'gatc'){	
					SetRightFromColor(RightImg);
				}else{
					sideRight.texture = game.NoteBookOneImages.assets.getTexture(RightImg);
					sideRight.alpha = 1;
				}
				
				
			}else{
				trace("RI NULL");
				sideRight.alpha = 0;
			}
			
			
			trace("getChildIndex(openbookBg): "+getChildIndex(openbookBg));
			trace("getChildIndex(sideRight): "+getChildIndex(sideRight));
			trace("getChildIndex(sideLeft): "+getChildIndex(sideLeft));
		}
		private function SetRightFromColor(RightImg:String):void{
			sideRight.texture = game.NoteBookTwoImages.assets.getTexture(RightImg);
			sideRight.alpha = 1;
		}
		
		private function SetLeftFromColor(LeftImg:String):void{
			sideLeft.texture = game.NoteBookTwoImages.assets.getTexture(LeftImg);
			sideLeft.alpha = 1;
		}
		
		private function CreateBg():void{
		
			//	openBookbg.graphics.precisionHitTest = true;				
			
		}
		
		
	
			
		
	}
}