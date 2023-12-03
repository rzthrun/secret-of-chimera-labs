package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;

	public class RocketRoomBoard extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var Animating:Boolean = false;
		
		private var hit_01:Shape;
		private var hit_02:Shape;
		private var hit_03:Shape;
		private var hit_04:Shape;
		private var hit_05:Shape;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function RocketRoomBoard(_assets:AssetManager,_game:Game)
		{
			super();
			//	this.assets = new AssetManager();
			game = _game;
			assets = _assets;
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		public function onAddedToStage(event:starling.events.Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			if(game.CheckAsset('rocketRoomBoard_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomBoard/rocketRoomBoard_bg.jpg'));
				game.TrackAssets('rocketRoomBoard_01');
			}
			
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RocketRoomBoard","RocketRoomBoardObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('rocketRoomBoard_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomBoard != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomBoard['SeenIn'] == 'Yes'){
					
				}else{
					SaveArray['SeenIt'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomBoard',SaveArray);
				}
			}else {
				SaveArray['SeenIt'] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomBoard',SaveArray);
			}
			
			CreateStageHits();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('whiteboard');
		//	game.screenGamePlayHandler.NoteBookObj.AddToNoteBook('whiteboard');
		}
		
		/*
		
		*/
		private function CreateStageHits():void{
			
			hit_01 = new Shape();
			hit_01.touchable = false;
			hit_01.graphics.beginFill(0xff0000);
			
			hit_01.graphics.lineTo(183,408);	
			hit_01.graphics.lineTo(276,319);	
			hit_01.graphics.lineTo(413,432);	
			hit_01.graphics.lineTo(405,468);	
			hit_01.graphics.lineTo(207,463);	
		
			hit_01.graphics.endFill(false);
			hit_01.alpha = 0.0;
			
			hit_01.graphics.precisionHitTest = true;	
			
			hit_02 = new Shape();
			hit_02.touchable = false;
			hit_02.graphics.beginFill(0xff0000);
			
			hit_02.graphics.lineTo(145,408);	
			hit_02.graphics.lineTo(168,88);	
			hit_02.graphics.lineTo(307,54);	
			hit_02.graphics.lineTo(344,116);	
			hit_02.graphics.lineTo(306,169);	
			hit_02.graphics.lineTo(328,242);	
			hit_02.graphics.lineTo(231,316);	
			
			hit_02.graphics.endFill(false);
			hit_02.alpha = 0.0;
			
			hit_02.graphics.precisionHitTest = true;	
			
			hit_03 = new Shape();
			hit_03.touchable = false;
			hit_03.graphics.beginFill(0xff0000);
			
			hit_03.graphics.lineTo(328,144);	
			hit_03.graphics.lineTo(395,49);	
			hit_03.graphics.lineTo(573,54);	
			hit_03.graphics.lineTo(656,173);	
			hit_03.graphics.lineTo(354,178);	
					
			hit_03.graphics.endFill(false);
			hit_03.alpha = 0.0;
			
			hit_03.graphics.precisionHitTest = true;	
			
			hit_04 = new Shape();
			hit_04.touchable = false;
			hit_04.graphics.beginFill(0xff0000);
			
			hit_04.graphics.lineTo(289,306);	
			hit_04.graphics.lineTo(294,266);	
			hit_04.graphics.lineTo(385,202);	
			hit_04.graphics.lineTo(511,174);	
			hit_04.graphics.lineTo(565,189);	
			hit_04.graphics.lineTo(588,262);	
			hit_04.graphics.lineTo(355,380);	
		
			hit_04.graphics.endFill(false);
			hit_04.alpha = 0.0;
			
			hit_04.graphics.precisionHitTest = true;	
			
			hit_05 = new Shape();
			hit_05.touchable = false;
			hit_05.graphics.beginFill(0xff0000);
			
			hit_05.graphics.lineTo(415,400);	
			hit_05.graphics.lineTo(565,292);	
			hit_05.graphics.lineTo(634,335);	
			hit_05.graphics.lineTo(598,471);	
			hit_05.graphics.lineTo(435,458);	
		
			hit_05.graphics.endFill(false);
			hit_05.alpha = 0.0;
			
			hit_05.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_01);
			this.addChild(hit_02);
			this.addChild(hit_03);
			this.addChild(hit_04);
			this.addChild(hit_05);
		}
		
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((RocketRoomSatStation as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomSatStationObj,true
							);
						}else if(hit_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("5/1: The launch is successful...");

						}else if(hit_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("5/2: CUPID is deployed successfully into orbit...");
						}else if(hit_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("10/17: The satellite is impacted by an unidentified object...");
						}else if(hit_04.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("11/23: The UN's Space Station capture's the satellite...");
						}else if(hit_05.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("12/31: CUPID's descent capsule safely returns to Earth.");
						}
					}
				}
			}
		}
		private function FadeOut(loadClass:Class,loadObj:Object,Fade:Boolean = false):void{
			trace("FADE OUT");
			this.removeEventListener(TouchEvent.TOUCH,TouchHandler);
			
			//goBackButton.touchable = false;
			this.touchable = false;
			if(Fade === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.BlackOutRectangleFade(1,0.5,this.Exit);
				(stage.getChildAt(0) as Object).screenGamePlayHandler.
					LoadScene(
						loadClass, 
						loadObj
					);		
			}else{
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.
					LoadSceneAlphaFade(
						loadClass, 
						loadObj,
						this.Exit
					);				
			}
			
		}
		
		public function Exit(blackOut:Boolean = false):void{
			
			
			
			this.assets.removeTexture("rocketRoomBoard_bg",true);
			
			//	this.assets.removeTextureAtlas("Raft_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomBoard_01");
			
			// stage.getChildAt(0) as Object).falseAsset("coastSurf_02");
			
			if(blackOut === true){
				//		(stage.getChildAt(0) as Object).screenGamePlayHandler.BlackOutRectangleFade(0,0.5);
			}
			(stage.getChildAt(0) as Object).screenGamePlayHandler.
				UnloadScene(
					
				);			
			
			this.dispose();
			
		}
	}
}
