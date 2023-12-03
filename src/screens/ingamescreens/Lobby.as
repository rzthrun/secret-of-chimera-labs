package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.DelayedCall;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.TextureSmoothing;
	import starling.utils.AssetManager;
	
	public class Lobby extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		public var SaveArray2:Array = new Array();
		public var SaveArray3:Array = new Array();
		
		private var bg:Image;
		
		private var elevator_mc:MovieClip;
		private var elevator_close_mc:MovieClip;
		
		private var office_door:Image;
		private var secondFloor_door:Image;
		private var secondFloor_door_knub:Image;
		
		private var hit_LobbyLeft:Shape;
		private var hit_LobbyCounter:Shape;
		private var hit_LobbyElevator:Shape;
		private var hit_Stairs:Shape;
		
		private var hit_floor:Shape;
		private var hit_logo:Shape;
		private var hit_name:Shape;
		private var hit_window:Shape;
		
		private var delayedCall:DelayedCall;
		
		
		private var ElevatorOpen:Boolean = false;
		private var ManagementDoorUnlocked:Boolean = false;
		private var ManagementDoorOpen:Boolean = false;
		private var Animating:Boolean = false;
		private var ElevatorUnlocked:Boolean = false;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		public function Lobby(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('lobby_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Lobby/lobby_bg.jpg'));
				game.TrackAssets('lobby_01');
			}
			if(game.CheckAsset('lobby_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Lobby/Lobby_Sprite_01.png'));
				game.TrackAssets('lobby_02');
			}
			if(game.CheckAsset('lobby_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Lobby/Lobby_Sprite_01.xml'));
				game.TrackAssets('lobby_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("Lobby","LobbyObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('lobby_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			elevator_mc = new MovieClip(this.assets.getTextures('elevator_frame_0'),12);
		//	elevator_mc.smoothing = TextureSmoothing.NONE;
			elevator_mc.x = 508;
			elevator_mc.y = 228;
			elevator_mc.touchable = false;
			elevator_mc.loop = false; 
		//	elevator_mc.play();
			
			
			
			
			
			elevator_close_mc = new MovieClip(this.assets.getTextures('elevator_frame_0').reverse(),12);
			//elevator_mc.smoothing = TextureSmoothing.NONE;
			elevator_close_mc.x = 508;
			elevator_close_mc.y = 228;
			elevator_close_mc.touchable = false;
			elevator_close_mc.loop = false; 
			
			secondFloor_door = new Image(this.assets.getTexture('secondFloorHall_doorBothChains'));
			secondFloor_door.x = 264;
			secondFloor_door.y = 24;
			secondFloor_door.touchable = false;
			
			secondFloor_door_knub = new Image(this.assets.getTexture('secondFloorHall_leftDoorKnub'));
			secondFloor_door_knub.x = 210;
			secondFloor_door_knub.y = 27;
			secondFloor_door_knub.touchable = false;
			
			office_door = new Image(this.assets.getTexture('office_door'));
			office_door.x = 7;
			office_door.y = 164;
			office_door.touchable = false;
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['mgnt'] == 'Yes'){
					ManagementDoorUnlocked = true;
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby['OfficeDoor'] == 'open'){
					ManagementDoorOpen = true;
					office_door.alpha = 0;
				}else{
					office_door.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby['ComingFromElevator'] == 'Yes'){
					elevator_mc.alpha = 0;
					elevator_close_mc.alpha = 1;
					
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
				
				
					SaveArray['ComingFromElevator'] = 'No';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lobby',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						trace('ANGER');
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorClose();
						Animating = true;
						ElevatorOpen = false;
						elevator_close_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onElevatorCloseEnterFrame);
						elevator_close_mc.alpha = 1;
						
						elevator_close_mc.play();
						Starling.juggler.add(elevator_close_mc);
						//	Starling.juggler.add(elevator_mc);
					},1.25);
				}else{
					elevator_mc.alpha = 1;
					elevator_close_mc.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lobby',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadSoulSearch(true,3);
							
						},0.5);
					}
				}
				
				
			}else{
				office_door.alpha = 1;
				elevator_mc.alpha = 1;
				elevator_close_mc.alpha = 0;
				
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
				//	SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lobby',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadSoulSearch(true,3);
						
					},0.5);
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['elevator'] == 'Yes'){
					ElevatorUnlocked = true;
				}else{
					
				}
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall['chains'] == 'PickedUp'){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall['door_left'] == 'open'){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall['door_right'] == 'open'){
							secondFloor_door.alpha = 0;
							secondFloor_door_knub.alpha = 1;
						}else{
							secondFloor_door.texture = this.assets.getTexture('secondFloorHall_doorLeftOpen');
							secondFloor_door.alpha = 1;
							secondFloor_door_knub.alpha = 1;
						}
					}else{
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall['door_right'] == 'open'){
							secondFloor_door.texture = this.assets.getTexture('secondFloorHall_doorRightOpen');
							secondFloor_door.alpha = 1;
							secondFloor_door_knub.alpha = 0;
						}else{
							secondFloor_door.texture = this.assets.getTexture('secondFloorHall_doorBothClosed');
							secondFloor_door.alpha = 1;
							secondFloor_door_knub.alpha = 0;
						}
					}
				}else{
					secondFloor_door.alpha = 1;
					secondFloor_door_knub.alpha = 0;
				}
				
			}else{
				secondFloor_door.alpha = 1;
				secondFloor_door_knub.alpha = 0;
			}
			//secondFloor_door
			

			this.addChildAt(elevator_mc,1);	
			this.addChildAt(elevator_close_mc,2);	
			this.addChildAt(office_door,3);
			this.addChildAt(secondFloor_door,4);
			this.addChildAt(secondFloor_door_knub,5);
			
			CreateWindowHit();
			CreateNameHit();
			CreateLogoHit();
			CreateFloorHit();
			
			CreateStairsHit();
			CreateLobbyElevatorHit();
			CreateLobbyCounterHit();
			CreateLobbyLeftHit();
		
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadBuildingHum(true,999);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BasementBongs",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("CityHum",0,0.5,'stop');
			
		//	Starling.juggler.add(elevator_mc);
		}
		/*
		private var hit_floor:Shape;
		private var hit_logo:Shape;
		private var hit_name:Shape;
		private var hit_window:Shape;
		*/
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0xff0000);
			
			hit_floor.graphics.lineTo(78,408);
			hit_floor.graphics.lineTo(140,392);
			hit_floor.graphics.lineTo(341,396);
			hit_floor.graphics.lineTo(426,382);
			hit_floor.graphics.lineTo(465,356);
			hit_floor.graphics.lineTo(638,365);
			hit_floor.graphics.lineTo(651,410);
			hit_floor.graphics.lineTo(601,505);
			hit_floor.graphics.lineTo(72,506);
			
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		private function CreateLogoHit():void{
			hit_logo = new Shape();
			hit_logo.touchable = false;
			hit_logo.graphics.beginFill(0xff0000);
			
			hit_logo.graphics.lineTo(318,215);
			hit_logo.graphics.lineTo(351,187);
			hit_logo.graphics.lineTo(398,215);
			hit_logo.graphics.lineTo(395,251);
			hit_logo.graphics.lineTo(368,272);
			hit_logo.graphics.lineTo(318,266);
			
			hit_logo.graphics.endFill(false);
			hit_logo.alpha = 0.0;
			
			hit_logo.graphics.precisionHitTest = true;	
			this.addChild(hit_logo);
		}
		
		private function CreateNameHit():void{
			hit_name = new Shape();
			hit_name.touchable = false;
			hit_name.graphics.beginFill(0xff0000);
			
			hit_name.graphics.lineTo(126,209);
			hit_name.graphics.lineTo(255,231);
			hit_name.graphics.lineTo(257,273);
			hit_name.graphics.lineTo(124,268);
			
			hit_name.graphics.endFill(false);
			hit_name.alpha = 0.0;
			
			hit_name.graphics.precisionHitTest = true;	
			this.addChild(hit_name);
		}
		
		private function CreateWindowHit():void{
			hit_window = new Shape();
			hit_window.touchable = false;
			hit_window.graphics.beginFill(0xff0000);
			
			hit_window.graphics.lineTo(52,0);
			hit_window.graphics.lineTo(241,0);
			hit_window.graphics.lineTo(242,149);
			hit_window.graphics.lineTo(51,71);
			
			
			hit_window.graphics.endFill(false);
			hit_window.alpha = 0.0;
			
			hit_window.graphics.precisionHitTest = true;	
			this.addChild(hit_window);
		}
		
		
		private function CreateStairsHit():void{
			hit_Stairs  = new Shape();
			hit_Stairs.touchable = false;
			hit_Stairs.graphics.beginFill(0xff0000);
			
			hit_Stairs.graphics.lineTo(256,19);
			hit_Stairs.graphics.lineTo(281,0);
			hit_Stairs.graphics.lineTo(690,0);	
			hit_Stairs.graphics.lineTo(703,64);	
			hit_Stairs.graphics.lineTo(754,118);	
			hit_Stairs.graphics.lineTo(796,247);	
			hit_Stairs.graphics.lineTo(794,352);	
			hit_Stairs.graphics.lineTo(651,376);	
			hit_Stairs.graphics.lineTo(621,133);	
			hit_Stairs.graphics.lineTo(620,133);	
			hit_Stairs.graphics.lineTo(250,151);	
			
			hit_Stairs.graphics.endFill(false);
			hit_Stairs.alpha = 0.0;
			
			hit_Stairs.graphics.precisionHitTest = true;	
			this.addChild(hit_Stairs);
		}
		
		private function CreateLobbyElevatorHit():void{
			hit_LobbyElevator = new Shape();
			hit_LobbyElevator.touchable = false;
			hit_LobbyElevator.graphics.beginFill(0xff0000);
			
			hit_LobbyElevator.graphics.lineTo(482,200);	
			hit_LobbyElevator.graphics.lineTo(622,196);	
			hit_LobbyElevator.graphics.lineTo(624,369);	
			hit_LobbyElevator.graphics.lineTo(478,359);	
	
			hit_LobbyElevator.graphics.endFill(false);
			hit_LobbyElevator.alpha = 0.0;
			
			hit_LobbyElevator.graphics.precisionHitTest = true;	
			this.addChild(hit_LobbyElevator);
		}
		
		
		private function CreateLobbyCounterHit():void{
			hit_LobbyCounter = new Shape();
			hit_LobbyCounter.touchable = false;
			hit_LobbyCounter.graphics.beginFill(0xff0000);
			
			hit_LobbyCounter.graphics.lineTo(145,285);	
			hit_LobbyCounter.graphics.lineTo(261,255);	
			hit_LobbyCounter.graphics.lineTo(420,258);	
			hit_LobbyCounter.graphics.lineTo(441,295);	
			hit_LobbyCounter.graphics.lineTo(440,323);	
			hit_LobbyCounter.graphics.lineTo(365,351);	
			hit_LobbyCounter.graphics.lineTo(233,390);	
			hit_LobbyCounter.graphics.lineTo(142,385);	
			
			
			hit_LobbyCounter.graphics.endFill(false);
			hit_LobbyCounter.alpha = 0.0;
			
			hit_LobbyCounter.graphics.precisionHitTest = true;	
			this.addChild(hit_LobbyCounter);
		}
		
		private function CreateLobbyLeftHit():void{
			hit_LobbyLeft = new Shape();
			hit_LobbyLeft.touchable = false;
			hit_LobbyLeft.graphics.beginFill(0xff0000);
			
			hit_LobbyLeft.graphics.lineTo(15,158);	
			hit_LobbyLeft.graphics.lineTo(113,181);	
			hit_LobbyLeft.graphics.lineTo(108,396);	
			hit_LobbyLeft.graphics.lineTo(6,422);	
			
			
			hit_LobbyLeft.graphics.endFill(false);
			hit_LobbyLeft.alpha = 0.0;
			
			hit_LobbyLeft.graphics.precisionHitTest = true;	
			this.addChild(hit_LobbyLeft);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Exterior != undefined){
								SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Exterior;
							}
							
							SaveArray2['ComingFromLobby'] = 'Yes';
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Exterior',SaveArray2);
							

							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((Exterior as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorObj,true
							);
							
						}else if(hit_LobbyElevator.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(ElevatorUnlocked === false){
								
								LockedElevatorHandler();
								
							}else{
								LobbyElevatorHandler();
							}
						}
						else if(hit_LobbyLeft.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							OfficeDoorHandler();
						}
						else if(hit_name.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("\"Chimera,\"... sounds friendly-ish.");
						}
						else if(hit_logo.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LogoHandlerHandler();
						}
						else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FloorHandler();
						}
						else if(hit_window.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Offices are on the next floor.");
						}
						else if(hit_LobbyCounter.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((LobbyCounter as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyCounterObj,true
							);
						}
						else if(hit_Stairs.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Steps();
							FadeOut((SecondFloorHall as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.SecondFloorHallObj,true
							);
						}
						/*
						private var hit_floor:Shape;
						private var hit_logo:Shape;
						private var hit_name:Shape;
						private var hit_window:Shape;
						*/
				/*		
						if(hit_LobbyElevator.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((LobbyElevator as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyElevatorObj,true
							);
						}else if(hit_LobbyCounter.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((LobbyCounter as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyCounterObj,true
							);
						}
						else if(hit_LobbyLeft.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((LobbyLeft as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyLeftObj,true
							);
						}
				*/
					}
				}
			}
		}
	
		private function LockedElevatorHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorBeepsAccessDenied();
		
			
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The elevator doors won't open...");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Nothing happens when I press the call button.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The elevator appears to be locked or offline.");
			}
		}
		
		private function FloorHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The floor is made from large tiles of dark slate stone.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The floor is clean, as though recently mopped.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("My footsteps echo softly on cold stone floor.");
			}
		}
		private function LogoHandlerHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An image of the company logo is emblazoned on the wall.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The logo resembles the sculpture outside.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The symbol is rendered in deep red.");
			}
		}
		
		private function OfficeDoorHandler():void{
			if(ManagementDoorUnlocked === true){
				if(ManagementDoorOpen === true){
					FadeOut((BuildingOffice as Class), 
						(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeObj,false
					)
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Unlock();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
					ManagementDoorOpen = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
					}
					office_door.alpha = 0;
					SaveArray['OfficeDoor'] = 'open';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lobby',SaveArray);
				}
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedTwo();
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The door is locked.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The handle won't budge; it is held forcefully in place.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The symbol is rendered in deep red.");
				}
				

			}
			
			/*
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby['OfficeDoor'] == 'open'){
					FadeOut((BuildingOffice as Class), 
						(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeObj,true
					)
				}else{
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
					}
					office_door.alpha = 0;
					SaveArray['OfficeDoor'] = 'open';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lobby',SaveArray);
				}
			}else{
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
				}
				
				office_door.alpha = 0;
				SaveArray['OfficeDoor'] = 'open';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lobby',SaveArray);
			}
			*/
		}
		
		
		private function LobbyElevatorHandler():void{
			if(ElevatorOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorOpen();
				ElevatorOpen = true;
				Animating = true;
				elevator_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onElevatorEnterFrame);
				
				elevator_mc.play();
				Starling.juggler.add(elevator_mc);
			}else{
				//Starling.juggler.remove(elevator_close_mc);
				Starling.juggler.remove(delayedCall);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel != undefined){
					SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel;
				}
				SaveArray2['Floor'] = 1;
				SaveArray2['PrevFloor'] = 1;
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElevatorPanel',SaveArray2);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator != undefined){
					
					SaveArray3 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator;
				}
				SaveArray3['ComingFrom'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Elevator',SaveArray3);
				
				FadeOut((Elevator as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ElevatorObj,true
				);
			}
		}
		
		private function onElevatorEnterFrame():void{
			trace('FIRE ON FRAME');
			trace('elevator_mc.currentFrame: '+elevator_mc.currentFrame);
			if(elevator_mc.currentFrame == 3){
				trace('FRAME THREE');
				elevator_mc.alpha = 0;
		
				delayedCall = new DelayedCall(CloseElevator,4);
				elevator_mc.stop();
				Animating = false;
				elevator_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onElevatorEnterFrame);
				Starling.juggler.add(delayedCall);
				
			//	Starling.juggler.delayCall(function():void{
					
				//	Starling.juggler.add(elevator_mc);
			//	},4);
				
			}
		}
		
		private function CloseElevator():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorClose();
			
			trace('ANGER');
			Animating = true;
			ElevatorOpen = false;
			elevator_close_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onElevatorCloseEnterFrame);
			elevator_close_mc.alpha = 1;
			
			elevator_close_mc.play();
			Starling.juggler.add(elevator_close_mc);
			//	Starling.juggler.add(elevator_mc);
		}
		
		private function onElevatorCloseEnterFrame():void{
			trace("E CLOSE ENTER FRAME");
			if(elevator_close_mc.currentFrame == 3){
				trace('close frame 3');
				elevator_mc.alpha = 1;
				elevator_close_mc.alpha = 0;
				
				elevator_close_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onElevatorCloseEnterFrame);
				elevator_close_mc.stop();
				Animating = false;
			}
			if(elevator_close_mc.currentFrame == 4){
				trace('close frame 4');
			}
		}
		private function FadeOut(loadClass:Class,loadObj:Object,Fade:Boolean = false):void{
			trace("FADE OUT");
			Starling.juggler.remove(delayedCall);
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
			
			
			
			this.assets.removeTexture("lobby_bg",true);
			this.assets.removeTexture("Lobby_Sprite_01",true);
			this.assets.removeTextureAtlas("Lobby_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("lobby_01");
			(stage.getChildAt(0) as Object).falseAsset("lobby_02");
			(stage.getChildAt(0) as Object).falseAsset("lobby_03");
	
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
