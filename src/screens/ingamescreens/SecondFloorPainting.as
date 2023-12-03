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
	
	
	public class SecondFloorPainting extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var hit_walls:Shape;
		private var hit_canvas:Shape;
		private var hit_pos_00:Shape;
		private var hit_pos_01:Shape;
		private var hit_pos_02:Shape;
		private var hit_pos_03:Shape;
		private var hit_pos_04:Shape;
		private var hit_pos_05:Shape;
		
		//	private var hit_elevator_door:Shape;
		private var RONum:int = 0;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function SecondFloorPainting(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('secondFloorPainting_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/SecondFloorPainting/secondFloorPainting_bg.jpg'));
				game.TrackAssets('secondFloorPainting_01');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("SecondFloorPainting","SecondFloorPaintingObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('secondFloorPainting_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			//	CreateElevatorDoorHit();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorPainting != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorPainting['SeenIn'] == 'Yes'){
					
				}else{
					SaveArray['SeenIt'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorPainting',SaveArray);
				}
			}else {
				SaveArray['SeenIt'] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorPainting',SaveArray);
			}
			
			
			
			
			
			
			
			CreateWallsHit();
			CreateCanvasHit();
			CreatePosHits();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadBuildingHum(true,999);
			
			
			game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('hex_painting');
		//	game.screenGamePlayHandler.NoteBookObj.AddToNoteBook('hex_painting');
			
		}
	
		private function CreatePosHits():void{
			hit_pos_00 = new Shape();
			hit_pos_00.touchable = false;
			hit_pos_00.graphics.beginFill(0xff0000);
			
			hit_pos_00.graphics.lineTo(196,402);	
			hit_pos_00.graphics.lineTo(235,345);	
			hit_pos_00.graphics.lineTo(303,347);	
			hit_pos_00.graphics.lineTo(349,408);	
			hit_pos_00.graphics.lineTo(310,476);	
			hit_pos_00.graphics.lineTo(220,474);				
			
			hit_pos_00.graphics.endFill(false);
			hit_pos_00.alpha = 0.0;
			
			hit_pos_00.graphics.precisionHitTest = true;	
			

			hit_pos_01 = new Shape();
			hit_pos_01.touchable = false;
			hit_pos_01.graphics.beginFill(0xff0000);
			
			hit_pos_01.graphics.lineTo(192,166);	
			hit_pos_01.graphics.lineTo(228,108);	
			hit_pos_01.graphics.lineTo(300,108);	
			hit_pos_01.graphics.lineTo(336,172);	
			hit_pos_01.graphics.lineTo(303,242);	
			hit_pos_01.graphics.lineTo(231,239);	
			
			hit_pos_01.graphics.endFill(false);
			hit_pos_01.alpha = 0.0;
			
			hit_pos_01.graphics.precisionHitTest = true;	
			
			
			hit_pos_02 = new Shape();
			hit_pos_02.touchable = false;
			hit_pos_02.graphics.beginFill(0xff0000);
			
			hit_pos_02.graphics.lineTo(341,165);	
			hit_pos_02.graphics.lineTo(375,108);	
			hit_pos_02.graphics.lineTo(456,112);	
			hit_pos_02.graphics.lineTo(483,175);	
			hit_pos_02.graphics.lineTo(443,243);	
			hit_pos_02.graphics.lineTo(373,239);	
			
			hit_pos_02.graphics.endFill(false);
			hit_pos_02.alpha = 0.0;
			
			hit_pos_02.graphics.precisionHitTest = true;	
			
			
			hit_pos_03 = new Shape();
			hit_pos_03.touchable = false;
			hit_pos_03.graphics.beginFill(0xff0000);
			
			hit_pos_03.graphics.lineTo(343,305);	
			hit_pos_03.graphics.lineTo(376,255);	
			hit_pos_03.graphics.lineTo(453,259);	
			hit_pos_03.graphics.lineTo(475,312);	
			hit_pos_03.graphics.lineTo(450,372);	
			hit_pos_03.graphics.lineTo(379,371);	
			
			hit_pos_03.graphics.endFill(false);
			hit_pos_03.alpha = 0.0;
			
			hit_pos_03.graphics.precisionHitTest = true;	
			
			
			hit_pos_04 = new Shape();
			hit_pos_04.touchable = false;
			hit_pos_04.graphics.beginFill(0xff0000);
			
			hit_pos_04.graphics.lineTo(498,311);	
			hit_pos_04.graphics.lineTo(529,255);	
			hit_pos_04.graphics.lineTo(600,264);	
			hit_pos_04.graphics.lineTo(624,318);	
			hit_pos_04.graphics.lineTo(595,370);	
			hit_pos_04.graphics.lineTo(521,371);	
			
			hit_pos_04.graphics.endFill(false);
			hit_pos_04.alpha = 0.0;
			
			hit_pos_04.graphics.precisionHitTest = true;	
			
			
			
			hit_pos_05 = new Shape();
			hit_pos_05.touchable = false;
			hit_pos_05.graphics.beginFill(0xff0000);
			
			hit_pos_05.graphics.lineTo(487,72);	
			hit_pos_05.graphics.lineTo(531,23);	
			hit_pos_05.graphics.lineTo(606,32);	
			hit_pos_05.graphics.lineTo(636,93);	
			hit_pos_05.graphics.lineTo(593,147);	
			hit_pos_05.graphics.lineTo(526,144);	
		
			hit_pos_05.graphics.endFill(false);
			hit_pos_05.alpha = 0.0;
			
			hit_pos_05.graphics.precisionHitTest = true;	
			
			this.addChild(hit_pos_00);
			this.addChild(hit_pos_01);
			this.addChild(hit_pos_02);
			this.addChild(hit_pos_03);
			this.addChild(hit_pos_04);
			this.addChild(hit_pos_05);
		}
		
		private function CreateCanvasHit():void{
			hit_canvas = new Shape();
			hit_canvas.touchable = false;
			hit_canvas.graphics.beginFill(0xff0000);
			
			hit_canvas.graphics.lineTo(175,14);	
			hit_canvas.graphics.lineTo(654,14);	
			hit_canvas.graphics.lineTo(651,398);	
			hit_canvas.graphics.lineTo(583,491);	
			hit_canvas.graphics.lineTo(176,491);	
			
			hit_canvas.graphics.endFill(false);
			hit_canvas.alpha = 0.0;
			
			hit_canvas.graphics.precisionHitTest = true;	
			this.addChild(hit_canvas);
		}
		
		
		private function CreateWallsHit():void{
			hit_walls = new Shape();
			hit_walls.touchable = false;
			hit_walls.graphics.beginFill(0xff0000);
			
			hit_walls.graphics.lineTo(0,0);	
			hit_walls.graphics.lineTo(800,0);	
			hit_walls.graphics.lineTo(800,512);	
			hit_walls.graphics.lineTo(0,512);	
		
			hit_walls.graphics.endFill(false);
			hit_walls.alpha = 0.0;
			
			hit_walls.graphics.precisionHitTest = true;	
			this.addChild(hit_walls);
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
							FadeOut((SecondFloorHall as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.SecondFloorHallObj,true
							);
							//		}else if(hit_elevator_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							//			FadeOut((Elevator as Class), 
							//				(stage.getChildAt(0) as Object).screenGamePlayHandler.ElevatorObj,true
							//			);
						}else if(hit_pos_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A blue hexagon is in the lower left corner of the painting.");
						}else if(hit_pos_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("One of two distinct red shapes.");
						}else if(hit_pos_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A green hexagon; it's connected to two red hexagons");
						}else if(hit_pos_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Red.");
						}else if(hit_pos_04.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("One of the two blue hexagons. This one connects to yellow.");
						}else if(hit_pos_05.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A yellow shape in the upper right corner of the composition.");
						}else if(hit_canvas.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CanvasHandler();
						}else if(hit_walls.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The walls are made of thick concrete blocks; a single red stripe adorns them.");
						}
					}
				}
			}
		}
		private function CanvasHandler():void{
		
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An oil painting made with rich earth tones and several bright colors.");				
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Ahh... Art... it is filled with... uh... meaning.");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder what message the artist was trying to convey?");
				
			}
		}
		
		/*
		
		private var hit_walls:Shape;
		private var hit_canvas:Shape;
		private var hit_pos_00:Shape;
		private var hit_pos_01:Shape;
		private var hit_pos_02:Shape;
		private var hit_pos_03:Shape;
		private var hit_pos_04:Shape;
		private var hit_pos_05:Shape;
		
		*/
		
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
			
			
			
			this.assets.removeTexture("secondFloorPainting_bg",true);
			
			//	this.assets.removeTextureAtlas("Raft_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("secondFloorPainting_01");
			
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
