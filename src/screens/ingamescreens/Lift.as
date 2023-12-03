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
	
	
	public class Lift extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var door:Image;
		private var crowbar:Image;
		private var handler:Image;
		private var elevator_mc:MovieClip;
		private var elevatorClose_mc:MovieClip;
		
		private var hit_door:Shape;
		private var hit_crowbar:Shape;
		private var hit_handler:Shape;
		private var hit_button:Shape;
		private var hit_elevator:Shape;
		private var hit_wall:Shape;
		
		private var hit_gears:Shape;
		private var hit_hole:Shape;
		private var hit_void:Shape;
		private var hit_frame_00:Shape;
		private var hit_frame_01:Shape;
		
		private var RONum:int = 0;
		
		private var DoorOpen:Boolean = false;
		private var ElevatorUp:Boolean = false;
		
		private var CrowbarPickedUp:Boolean = false;
		private var HandlerPickedUp:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function Lift(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('lift_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Lift/lift_bg.jpg'));
				game.TrackAssets('lift_01');
			}
		/*	if(game.CheckAsset('lift_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Lift/Lift_Sprite_01.png'));
				game.TrackAssets('lift_02');
			}
			if(game.CheckAsset('lift_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Lift/Lift_Sprite_01.xml'));
				game.TrackAssets('lift_03');
			}
		*/
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("Lift","LiftObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		/*
		
		private var hit_door:Shape;
		private var hit_crowbar:Shape;
		private var hit_handler:Shape;
		private var hit_button:Shape;
		*/
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('lift_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			elevator_mc = new MovieClip(this.assets.getTextures("lift_frame_"),12);
			elevator_mc.x = 406;
			elevator_mc.y = 0;
			elevator_mc.alpha = 1;
			elevator_mc.touchable = false;
			elevator_mc.loop = false; 
			elevator_mc.stop();
			
			elevatorClose_mc= new MovieClip(this.assets.getTextures("lift_frame_").reverse(),12);
			elevatorClose_mc.x = 406;
			elevatorClose_mc.y = 0;
			elevatorClose_mc.alpha = 1;
			elevatorClose_mc.touchable = false;
			elevatorClose_mc.loop = false; 
			elevatorClose_mc.stop();
			
			
			crowbar = new Image(this.assets.getTexture('crowbar'));
			crowbar.touchable = false;
			crowbar.x = 360;
			crowbar.y = 397;		
			
			handler = new Image(this.assets.getTexture('handler'));
			handler.touchable = false;
			handler.x = 72;
			handler.y = 235;		
			
			door = new Image(this.assets.getTexture('door_open'));
			door.touchable = false;
			door.x = 462;
			door.y = 142;		
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift['Crowbar'] == 'PickedUp'){	
					CrowbarPickedUp = true;
					crowbar.alpha = 0;
				}else{
					crowbar.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift['Handler'] == 'PickedUp'){	
					HandlerPickedUp = true;
					handler.alpha = 0;
				}else{
					
					handler.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift['ElevatorUp'] == 'Yes'){	
					ElevatorUp = true;
					elevator_mc.alpha = 0;
					elevatorClose_mc.alpha = 1;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift['Door'] == 'Open'){	
						DoorOpen = true;
						door.alpha = 1;
						CreateElevatorHit();
					}else{
						door.alpha = 0;
					}
					
					CreateDoorHit(DoorOpen);
				}else{
					
					elevator_mc.alpha = 1;
					elevatorClose_mc.alpha = 0;	
					door.alpha = 0;
				}
			}else{
				crowbar.alpha = 1;
				handler.alpha = 1;
				door.alpha = 0;
				elevator_mc.alpha = 1;
				elevatorClose_mc.alpha = 0;
			}
		
			
					
			this.addChildAt(elevator_mc,1);
			this.addChildAt(elevatorClose_mc,2);
			this.addChildAt(crowbar,3);
			this.addChildAt(handler,4);
			this.addChildAt(door,5);
			
			CreateFrame00Hit();
			CreateFrame01Hit();
			CreateHoleHit();			
			CreateGearsHit();
			CreateVoidHit();
			CreateHandlerHit();
			CreateCrowbarHit();
			CreateButtonHit();
			CreateWallHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			Starling.juggler.add(elevator_mc);
			Starling.juggler.add(elevatorClose_mc);
			
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadBasementBongs(true,999);
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ShipGroansOne",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Darkness",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BuildingHum",0,0.5,'stop');
		//	(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BasementBongs",0,0.5,'stop');
		//	(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("CityHum",0,0.5,'stop');
		}
		//hit_button
		private function CreateDoorHit(open:Boolean = false):void{
			hit_door = new Shape();		
			hit_door.x = 0;
			hit_door.y = 0;
			hit_door.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_door.graphics.lineTo(453,147);					
				hit_door.graphics.lineTo(588,144);					
				hit_door.graphics.lineTo(584,289);					
				hit_door.graphics.lineTo(566,291);					
				hit_door.graphics.lineTo(567,372);					
				hit_door.graphics.lineTo(453,359);					
					
				
			}else{
				
				hit_door.graphics.lineTo(459,151);
				hit_door.graphics.lineTo(502,151);
				hit_door.graphics.lineTo(502,364);
				hit_door.graphics.lineTo(454,359);
			
				
			}				
			hit_door.graphics.endFill(false);			
			hit_door.alpha = 0.0;			
			hit_door.graphics.precisionHitTest = true;	
			hit_door.touchable = false
			this.addChild(hit_door);
			
			
		}
	/*
		
		
		
		private var hit_frame_00:Shape;
		private var hit_frame_01:Shape;
		
		*/
		private function CreateFrame01Hit():void{
			hit_frame_01 = new Shape();
			hit_frame_01.touchable = false;
			hit_frame_01.graphics.beginFill(0xff0000);
			
			hit_frame_01.graphics.lineTo(645,7);	
			hit_frame_01.graphics.lineTo(677,5);	
			hit_frame_01.graphics.lineTo(796,144);	
			hit_frame_01.graphics.lineTo(685,406);	
			hit_frame_01.graphics.lineTo(643,177);	
		
			
			hit_frame_01.graphics.endFill(false);
			hit_frame_01.alpha = 0.0;
			
			hit_frame_01.graphics.precisionHitTest = true;	
			this.addChild(hit_frame_01);
		}
		
		private function CreateFrame00Hit():void{
			hit_frame_00 = new Shape();
			hit_frame_00.touchable = false;
			hit_frame_00.graphics.beginFill(0xff0000);
			
			hit_frame_00.graphics.lineTo(183,12);	
			hit_frame_00.graphics.lineTo(217,0);	
			hit_frame_00.graphics.lineTo(406,0);	
			hit_frame_00.graphics.lineTo(399,373);	
			hit_frame_00.graphics.lineTo(353,368);	
			hit_frame_00.graphics.lineTo(161,367);	
			hit_frame_00.graphics.lineTo(195,318);	
			
			hit_frame_00.graphics.endFill(false);
			hit_frame_00.alpha = 0.0;
			
			hit_frame_00.graphics.precisionHitTest = true;	
			this.addChild(hit_frame_00);
		}
		private function CreateGearsHit():void{
			hit_gears = new Shape();
			hit_gears.touchable = false;
			hit_gears.graphics.beginFill(0xff0000);
			
			hit_gears.graphics.lineTo(419,9);	
			hit_gears.graphics.lineTo(480,0);	
			hit_gears.graphics.lineTo(640,37);	
			hit_gears.graphics.lineTo(409,63);	
				
			hit_gears.graphics.endFill(false);
			hit_gears.alpha = 0.0;
			
			hit_gears.graphics.precisionHitTest = true;	
			this.addChild(hit_gears);
		}
		private function CreateVoidHit():void{
			hit_void = new Shape();
			hit_void.touchable = false;
			hit_void.graphics.beginFill(0xff0000);
			
			hit_void.graphics.lineTo(423,79);	
			hit_void.graphics.lineTo(635,53);	
			hit_void.graphics.lineTo(633,293);	
			hit_void.graphics.lineTo(425,279);	
		
			hit_void.graphics.endFill(false);
			hit_void.alpha = 0.0;
			
			hit_void.graphics.precisionHitTest = true;	
			this.addChild(hit_void);
		}
		
		private function CreateHoleHit():void{
			hit_hole = new Shape();
			hit_hole.touchable = false;
			hit_hole.graphics.beginFill(0xff0000);
			
			hit_hole.graphics.lineTo(430,286);	
			hit_hole.graphics.lineTo(573,305);	
			hit_hole.graphics.lineTo(631,391);	
			hit_hole.graphics.lineTo(419,371);	
		
			hit_hole.graphics.endFill(false);
			hit_hole.alpha = 0.0;
			
			hit_hole.graphics.precisionHitTest = true;	
			this.addChild(hit_hole);
		}
		
		private function CreateWallHit():void{
			hit_wall = new Shape();
			hit_wall.touchable = false;
			hit_wall.graphics.beginFill(0xff0000);
			
			hit_wall.graphics.lineTo(0,82);	
			hit_wall.graphics.lineTo(165,112);	
			hit_wall.graphics.lineTo(161,244);	
			hit_wall.graphics.lineTo(0,244);	
			
			
			hit_wall.graphics.endFill(false);
			hit_wall.alpha = 0.0;
			
			hit_wall.graphics.precisionHitTest = true;	
			this.addChild(hit_wall);
		}
		
		private function CreateElevatorHit():void{
			hit_elevator = new Shape();
			hit_elevator.touchable = false;
			hit_elevator.graphics.beginFill(0xff0000);
			
			hit_elevator.graphics.lineTo(506,147);	
			hit_elevator.graphics.lineTo(579,145);	
			hit_elevator.graphics.lineTo(576,366);	
			hit_elevator.graphics.lineTo(505,361);	
			
			hit_elevator.graphics.endFill(false);
			hit_elevator.alpha = 0.0;
			
			hit_elevator.graphics.precisionHitTest = true;	
			this.addChild(hit_elevator);
		}
		
		private function CreateButtonHit():void{
			hit_button = new Shape();
			hit_button.touchable = false;
			hit_button.graphics.beginFill(0xff0000);
			
			hit_button.graphics.lineTo(198,113);	
			hit_button.graphics.lineTo(249,115);	
			hit_button.graphics.lineTo(249,202);	
			hit_button.graphics.lineTo(192,191);	
			
			hit_button.graphics.endFill(false);
			hit_button.alpha = 0.0;
			
			hit_button.graphics.precisionHitTest = true;	
			this.addChild(hit_button);
		}
		private function CreateHandlerHit():void{
			hit_handler = new Shape();
			hit_handler.touchable = false;
			hit_handler.graphics.beginFill(0xff0000);
			
			hit_handler.graphics.lineTo(65,248);	
			hit_handler.graphics.lineTo(114,250);	
			hit_handler.graphics.lineTo(146,397);	
			hit_handler.graphics.lineTo(87,411);	
			
			hit_handler.graphics.endFill(false);
			hit_handler.alpha = 0.0;
			
			hit_handler.graphics.precisionHitTest = true;	
			this.addChild(hit_handler);
		}
		
		private function CreateCrowbarHit():void{
			hit_crowbar = new Shape();
			hit_crowbar.touchable = false;
			hit_crowbar.graphics.beginFill(0xff0000);
			
			hit_crowbar.graphics.lineTo(338,414);	
			hit_crowbar.graphics.lineTo(379,376);	
			hit_crowbar.graphics.lineTo(402,383);	
			hit_crowbar.graphics.lineTo(488,444);	
			hit_crowbar.graphics.lineTo(463,478);	
			hit_crowbar.graphics.lineTo(349,439);	
			
			hit_crowbar.graphics.endFill(false);
			hit_crowbar.alpha = 0.0;
			
			hit_crowbar.graphics.precisionHitTest = true;	
			this.addChild(hit_crowbar);
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
							FadeOut((BuildingOfficeBack as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeBackObj,false
							);
							return;
						}else if(hit_button.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ButtonHandler();
							return;
						}else if(hit_handler.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							HandlerHandler();
							return;
						}else if(hit_crowbar.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CrowbarHandler();
							return;
						}else if(hit_wall.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((LiftWall as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LiftWallObj,true
							);
							return;
						}else if(hit_gears.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The elevator's gear-box.");
						}else if(hit_frame_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Large steel beams form supports for the elevator shaft.");	
						}else if(hit_frame_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Cables of woven metal distribute tension and provide support to the structure...");	
						}else if(ElevatorUp === true){
							if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								DoorHandler();
								return;
							}else if(DoorOpen === true){
								if(hit_elevator.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									FadeOut((LiftElevator as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.LiftElevatorObj,true
									);
									return;
								}
							}
							return;
						}else{
							if(hit_hole.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								HoldeHandler();
								return;
							}else if(hit_void.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This is the top of an elevator shaft.");	
							}
							
						}
						
							
					}
				}
			}
		}
	
		
		private function HoldeHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I should be careful... the elevator shaft goes deep underground...");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't see much toward the bottom of the elevator shaft; the light becomes too dim...");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Whooaa.... careful... I almost slipped.");
			}
			
		}
		
		private function DoorHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift;	
			}
			if(DoorOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyClose();
				DoorOpen = true;
				hit_door._graphics.clear();
				door.alpha = 1;
				CreateDoorHit(true);
				CreateElevatorHit();
				SaveArray['Door'] = "Open";
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpen();
				DoorOpen = false;
				hit_door._graphics.clear();
				hit_elevator._graphics.clear();
				door.alpha = 0;
				CreateDoorHit(false);
				SaveArray['Door'] = "Closed";
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lift',SaveArray);
			
		}
		
		private function HandlerHandler():void{
			if(HandlerPickedUp === false){
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Handler,
					'item_Handler',
					'inven_handler_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift;	
				}
				HandlerPickedUp = true;
				handler.alpha = 0;
				SaveArray['Handler'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lift',SaveArray);
				
			}
			
		}
		
		private function CrowbarHandler():void{
			if(CrowbarPickedUp === false){
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Crowbar,
					'item_Crowbar',
					'inven_crowbar_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift;	
				}
				CrowbarPickedUp = true;
				crowbar.alpha = 0;
				SaveArray['Crowbar'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lift',SaveArray);
				
			}
				
		}
		
		private function ButtonHandler():void{
			
			
		
			
			if(ElevatorUp === false){
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BigElevator();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift;	
				}
				Animating = true;
				ElevatorUp = true;
				elevator_mc.addEventListener(Event.COMPLETE, OnElevatorUpComplete);
				CreateDoorHit(false);
				Starling.juggler.delayCall(function():void{
					elevator_mc.play();
				},1);
					
				
				SaveArray['ElevatorUp'] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lift',SaveArray);
				
			}else{
				if(DoorOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BigElevator();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lift;	
					}
					Animating = true;
					ElevatorUp = false;
					elevatorClose_mc.addEventListener(Event.COMPLETE, OnElevatorDownComplete);
					hit_door.graphics.clear();
					elevatorClose_mc.play();
				
					SaveArray['ElevatorUp'] = "No";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lift',SaveArray);
					
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The elevator won't go down if the door is open.");
					
				}
			}
		}
		private function OnElevatorDownComplete():void{
			Animating = false;
			elevatorClose_mc.removeEventListener(Event.COMPLETE, OnElevatorDownComplete);
			elevatorClose_mc.stop();
			elevator_mc.stop();
			elevator_mc.alpha = 1; 			
			elevatorClose_mc.alpha = 0;
			elevatorClose_mc.currentFrame = 0;
			elevator_mc.currentFrame = 0;
		
			
		}
		private function OnElevatorUpComplete():void{
			Animating = false;
			elevator_mc.removeEventListener(Event.COMPLETE, OnElevatorUpComplete);
			elevator_mc.alpha = 0;
			elevatorClose_mc.alpha = 1;
			elevatorClose_mc.stop();
			elevator_mc.stop();
			elevatorClose_mc.currentFrame = 0;
			elevator_mc.currentFrame = 0;
		
			
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
			
					
			this.assets.removeTexture("lift_bg",true);
		//	this.assets.removeTexture("Lift_Sprite_01",true);
		//	this.assets.removeTextureAtlas("Lift_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("lift_01");
		//	(stage.getChildAt(0) as Object).falseAsset("lift_02");
		//	(stage.getChildAt(0) as Object).falseAsset("lift_03");
			
			// stage.getChildAt(0) as Object).falseAsset("coastSurf_02");
			
			if(blackOut === true){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.BlackOutRectangleFade(0,0.5);
			}
			(stage.getChildAt(0) as Object).screenGamePlayHandler.
				UnloadScene(
					
				);			
			
			this.dispose();
			
		}
	}
}
