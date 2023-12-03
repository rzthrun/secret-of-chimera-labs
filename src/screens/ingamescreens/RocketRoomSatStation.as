package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;
	
	public class RocketRoomSatStation extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var drill:Image;
		private var sat_cover:Image;
		private var screens_mc:MovieClip;
		
		private var hit_sat:Shape;
		private var hit_drill:Shape;
		private var hit_board:Shape;
		
		private var hit_pullie:Shape;
		private var hit_gurney:Shape;
		private var hit_stool:Shape;
		private var hit_box:Shape;
		private var hit_screens:Shape;
		private var hit_dish:Shape;
		
		private var Animating:Boolean = false;
		private var DrillPickedUp:Boolean = false;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function RocketRoomSatStation(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('rocketRoomSatStation_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomSatStation/rocketRoomSatStation_bg.jpg'));
				game.TrackAssets('rocketRoomSatStation_01');
			}
			if(game.CheckAsset('rocketRoomSatStation_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomSatStation/RocketRoomSatStation_Sprite_01.png'));
				game.TrackAssets('rocketRoomSatStation_02');
			}
			if(game.CheckAsset('rocketRoomSatStation_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomSatStation/RocketRoomSatStation_Sprite_01.xml'));
				game.TrackAssets('rocketRoomSatStation_03');
			}
			//RocketRoomSatStation_Sprite_01
		
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RocketRoomSatStation","RocketRoomSatStationObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('rocketRoomSatStation_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			drill = new Image(this.assets.getTexture('drill'));
			drill.touchable = false;
			drill.x = 408;
			drill.y = 334;
			
			sat_cover = new Image(this.assets.getTexture('sat_cover'));
			sat_cover.touchable = false;
			sat_cover.x = 149;
			sat_cover.y = 217;
			
			screens_mc = new MovieClip(this.assets.getTextures('screen_0'),1);
			//elevator_mc.smoothing = TextureSmoothing.NONE;
			screens_mc.x = 0;
			screens_mc.y = 0;
			screens_mc.touchable = false;
			screens_mc.loop = true; 
			screens_mc.play();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSatStation != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSatStation['DrillPickedUp'] == 'Yes'){
					drill.alpha = 0;
					DrillPickedUp = true;
				}else{
					drill.alpha = 1;
				}
			}else{
				drill.alpha = 1;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat['CoverRemoved'] == 'Yes'){
					sat_cover.alpha = 0;
				}else{
					sat_cover.alpha = 1;
				}
			}else{
				sat_cover.alpha = 1;
			}
			
			
			
			screens_mc.alpha = 1;
			
			/*
			private var drill:Image;
			private var sat_cover:Image;
			private var screens:MovieClip;
			*/
			
			this.addChildAt(drill,1);
			this.addChildAt(sat_cover,2);
			this.addChildAt(screens_mc,3);
			
			CreateBoxHit();
			CreatePullieHit();
			CreateGurneyHit();
			CreateStoolHit();
			CreateDishHit();
			CreateScreensHit();
			
			CreateSatHit();
			CreateBoardHit();
			CreateDrillHit();
		
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			Starling.juggler.add(screens_mc);
		}
		//hit_sat
		/*
		
		
		private var hit_pullie:Shape;
		private var hit_gurney:Shape;
		private var hit_stool:Shape;
		private var hit_box:Shape;
		private var hit_screens:Shape;
		private var hit_dish:Shape;
		*/
		private function CreateScreensHit():void{
			hit_screens = new Shape();
			hit_screens.touchable = false;
			hit_screens.graphics.beginFill(0x00ff00);
			
			hit_screens.graphics.lineTo(0,0);	
			hit_screens.graphics.lineTo(363,0);	
			hit_screens.graphics.lineTo(365,31);	
			hit_screens.graphics.lineTo(0,62);	
			
			hit_screens.graphics.endFill(false);
			hit_screens.alpha = 0.0;
			
			hit_screens.graphics.precisionHitTest = true;	
			this.addChild(hit_screens);
		}
		
		private function CreateDishHit():void{
			hit_dish = new Shape();
			hit_dish.touchable = false;
			hit_dish.graphics.beginFill(0x00ff00);
			
			hit_dish.graphics.lineTo(274,188);	
			hit_dish.graphics.lineTo(306,148);	
			hit_dish.graphics.lineTo(356,146);	
			hit_dish.graphics.lineTo(370,210);	
			hit_dish.graphics.lineTo(364,290);	
			hit_dish.graphics.lineTo(342,352);	
			hit_dish.graphics.lineTo(305,350);	
			hit_dish.graphics.lineTo(270,287);	
		
			hit_dish.graphics.endFill(false);
			hit_dish.alpha = 0.0;
			
			hit_dish.graphics.precisionHitTest = true;	
			this.addChild(hit_dish);
		}
		
		private function CreateBoxHit():void{
			hit_box = new Shape();
			hit_box.touchable = false;
			hit_box.graphics.beginFill(0x00ff00);
			
			hit_box.graphics.lineTo(0,0);	
			hit_box.graphics.lineTo(472,0);	
			hit_box.graphics.lineTo(468,371);	
			hit_box.graphics.lineTo(351,401);	
			hit_box.graphics.lineTo(351,512);	
			hit_box.graphics.lineTo(0,512);	
			
			hit_box.graphics.endFill(false);
			hit_box.alpha = 0.0;
			
			hit_box.graphics.precisionHitTest = true;	
			this.addChild(hit_box);
		}
		
		private function CreateGurneyHit():void{
			hit_gurney = new Shape();
			hit_gurney.touchable = false;
			hit_gurney.graphics.beginFill(0x00ff00);
			
			hit_gurney.graphics.lineTo(91,439);	
			hit_gurney.graphics.lineTo(130,350);	
			hit_gurney.graphics.lineTo(170,348);	
			hit_gurney.graphics.lineTo(231,411);	
			hit_gurney.graphics.lineTo(354,430);	
			hit_gurney.graphics.lineTo(353,470);	
			hit_gurney.graphics.lineTo(307,504);	
			hit_gurney.graphics.lineTo(100,462);	
			
			hit_gurney.graphics.endFill(false);
			hit_gurney.alpha = 0.0;
			
			hit_gurney.graphics.precisionHitTest = true;	
			this.addChild(hit_gurney);
		}
		
		private function CreateStoolHit():void{
			hit_stool = new Shape();
			hit_stool.touchable = false;
			hit_stool.graphics.beginFill(0x00ff00);
			
			hit_stool.graphics.lineTo(139,420);	
			hit_stool.graphics.lineTo(185,410);	
			hit_stool.graphics.lineTo(230,426);	
			hit_stool.graphics.lineTo(231,508);	
			hit_stool.graphics.lineTo(137,505);	
				
			hit_stool.graphics.endFill(false);
			hit_stool.alpha = 0.0;
			
			hit_stool.graphics.precisionHitTest = true;	
			this.addChild(hit_stool);
		}
		
		private function CreatePullieHit():void{
			hit_pullie = new Shape();
			hit_pullie.touchable = false;
			hit_pullie.graphics.beginFill(0x00ff00);
			
			hit_pullie.graphics.lineTo(90,65);	
			hit_pullie.graphics.lineTo(313,53);	
			hit_pullie.graphics.lineTo(303,134);	
			hit_pullie.graphics.lineTo(97,125);	
		
			hit_pullie.graphics.endFill(false);
			hit_pullie.alpha = 0.0;
			
			hit_pullie.graphics.precisionHitTest = true;	
			this.addChild(hit_pullie);
		}
		
		
		private function CreateBoardHit():void{
			hit_board = new Shape();
			hit_board.touchable = false;
			hit_board.graphics.beginFill(0x00ff00);
			
			hit_board.graphics.lineTo(545,152);	
			hit_board.graphics.lineTo(790,142);	
			hit_board.graphics.lineTo(775,387);	
			hit_board.graphics.lineTo(601,368);	
			hit_board.graphics.lineTo(530,307);	
			
			hit_board.graphics.endFill(false);
			hit_board.alpha = 0.0;
			
			hit_board.graphics.precisionHitTest = true;	
			this.addChild(hit_board);
		}
		
		private function CreateDrillHit():void{
			hit_drill = new Shape();
			hit_drill.touchable = false;
			hit_drill.graphics.beginFill(0x00ff00);
			
			hit_drill.graphics.lineTo(397,339);	
			hit_drill.graphics.lineTo(407,320);	
			hit_drill.graphics.lineTo(540,321);	
			hit_drill.graphics.lineTo(556,357);	
			hit_drill.graphics.lineTo(538,435);	
			hit_drill.graphics.lineTo(472,429);	
			
			hit_drill.graphics.endFill(false);
			hit_drill.alpha = 0.0;
			
			hit_drill.graphics.precisionHitTest = true;	
			this.addChild(hit_drill);
		}
		private function CreateSatHit():void{
			hit_sat = new Shape();
			hit_sat.touchable = false;
			hit_sat.graphics.beginFill(0x00ff00);
			
			hit_sat.graphics.lineTo(101,242);	
			hit_sat.graphics.lineTo(138,176);	
			hit_sat.graphics.lineTo(257,191);	
			hit_sat.graphics.lineTo(249,270);	
			hit_sat.graphics.lineTo(249,297);	
			hit_sat.graphics.lineTo(116,292);	
		
			
			hit_sat.graphics.endFill(false);
			hit_sat.alpha = 0.0;
			
			hit_sat.graphics.precisionHitTest = true;	
			this.addChild(hit_sat);
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
							FadeOut((RocketRoom as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomObj,true
							);
						}else if(hit_sat.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((RocketRoomSat as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomSatObj,true
							);
						}else if(hit_drill.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DrillHandler();
							
						}else if(hit_board.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((RocketRoomBoard as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomBoardObj,true
							);
						}else if(hit_pullie.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A pulley and cable system holds the hulking satellite floating above the ground.");
						}else if(hit_stool.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A work stool is placed beside the satellite.");
						}else if(hit_gurney.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("On the floor is the gurney the satellite was rolled into place with.");
						}else if(hit_dish.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DishHandler();
						}else if(hit_screens.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ScreenHandler();
						
						}else if(hit_box.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BoxHandler();
						}
						
						
						/*
						
						
						private var hit_pullie:Shape;
						private var hit_gurney:Shape;
						private var hit_stool:Shape;
						private var hit_box:Shape;
						private var hit_screens:Shape;
						private var hit_dish:Shape;
						*/
					}
				}
			}
		}
		private function ScreenHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A stream of data pour over the two flat-panel screens.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I assume this information has something to do with the satellite or its mission.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I really have no idea how to interpret the data on these screens.");
			}
		}
		
		private function BoxHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The steel beam enclosure houses the wrecked body of the satellite.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Sterilizing florescent lights shine brightly inside the small enclosure.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The beams form a large reinforced box.");
			}
		}
		
		private function DishHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The satellite dish is damaged beyond use...");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The dish is badly cracked with various burn, impact, and blast marks scarring it.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder what could have happened to have caused this much damage?");
			}
		}
		
		private function DrillHandler():void{
			if(DrillPickedUp === false){
				drill.alpha = 0;
				DrillPickedUp = true;
					
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Drill,
						'item_Drill',
						'inven_drill_sm'
				);	
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrillQuick();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSatStation != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSatStation;
				}
				
				SaveArray['DrillPickedUp'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomSatStation',SaveArray);
				
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
			
			
			
			this.assets.removeTexture("rocketRoomSatStation_bg",true);
			this.assets.removeTexture("RocketRoomSatStation_Sprite_01",true);
			this.assets.removeTextureAtlas("RocketRoomSatStation_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomSatStation_01");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomSatStation_02");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomSatStation_03");
			
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
