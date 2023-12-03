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
	
	
	public class BuildingOffice extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		private var backOfficeDoor:Image;
		private var roboticsDoor:Image;
		private var pushBox:Image;
		private var desk_drawer_lower:Image;
		private var desk_drawer_lower_cover:Image;
		private var desk_drawer_middle:Image;
		private var desk_drawer_middle_cover:Image;
		private var desk_drawer_upper:Image;
		private var desk_box_open:Image;
		private var desk_screen:Image;
		private var desk_fuse:Image;
		private var copier_lid:Image;
	
		private var hit_shelf_00:Shape;
		private var hit_shelf_01:Shape;
		private var hit_computer:Shape;
		private var hit_gabage:Shape;
		private var hit_coffee:Shape;
		private var hit_clock:Shape;
		private var hit_lights:Shape;
		private var hit_board:Shape;
		
		private var hit_back_office_door:Shape;
		private var hit_back_office:Shape;
		private var hit_desk:Shape;
		private var hit_robotics_door:Shape;
		private var hit_robotics:Shape;
		private var hit_push_box:Shape;
		private var hit_copier:Shape;
		
		private var RONum:int = 0;
		
		private var Animating:Boolean = false;
		private var BackOfficeDoorUnlocked:Boolean = false;
		private var BackOfficeDoorOpen:Boolean = false;
		private var RoboticsDoorUnlocked:Boolean = false;
		private var RoboticsDoorOpen:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function BuildingOffice(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('buildingOffice_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOffice/buildingOffice_bg.jpg'));
				game.TrackAssets('buildingOffice_01');
			}
			if(game.CheckAsset('buildingOffice_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOffice/BuildingOffice_Sprite_01.png'));
				game.TrackAssets('buildingOffice_02');
			}
			if(game.CheckAsset('buildingOffice_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOffice/BuildingOffice_Sprite_01.xml'));
				game.TrackAssets('buildingOffice_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BuildingOffice","BuildingOfficeObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('buildingOffice_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
		
			copier_lid = new Image(this.assets.getTexture('copier_lid'));
			copier_lid.touchable = false;
			copier_lid.x = 0;
			copier_lid.y = 139;
			
			backOfficeDoor = new Image(this.assets.getTexture('door_security'));
			backOfficeDoor.touchable = false;
			backOfficeDoor.x = 199;
			backOfficeDoor.y = 85;
						
			roboticsDoor = new Image(this.assets.getTexture('door_maintainence'));
			roboticsDoor.touchable = false;
			roboticsDoor.x = 664;
			roboticsDoor.y = 95;
			
			pushBox = new Image(this.assets.getTexture('puzzle_switch'));
			pushBox.touchable = false;
			pushBox.x = 328;
			pushBox.y = 148;
						
			
			desk_drawer_lower = new Image(this.assets.getTexture('desk_drawer_lower'));
			desk_drawer_lower.touchable = false;
			desk_drawer_lower.x = 442;
			desk_drawer_lower.y = 346;
			
			desk_drawer_middle = new Image(this.assets.getTexture('desk_drawer_middle'));
			desk_drawer_middle.touchable = false;
			desk_drawer_middle.x = 444;
			desk_drawer_middle.y = 315;
			
			desk_drawer_upper = new Image(this.assets.getTexture('desk_drawer_top'));
			desk_drawer_upper.touchable = false;
			desk_drawer_upper.x = 445;
			desk_drawer_upper.y = 282;
			
			desk_drawer_lower_cover = new Image(this.assets.getTexture('desk_drawer_lower_cover'));
			desk_drawer_lower_cover.touchable = false;
			desk_drawer_lower_cover.x = 444;
			desk_drawer_lower_cover.y = 358;
			
			desk_drawer_middle_cover = new Image(this.assets.getTexture('desk_drawer_middle_cover'));
			desk_drawer_middle_cover.touchable = false;
			desk_drawer_middle_cover.x = 439;
			desk_drawer_middle_cover.y = 322;
			
			desk_box_open = new Image(this.assets.getTexture('desk_box_open'));
			desk_box_open.touchable = false;
			desk_box_open.x = 522;
			desk_box_open.y = 226;
			
			desk_screen = new Image(this.assets.getTexture('desk_screen'));
			desk_screen.touchable = false;
			desk_screen.x = 378;
			desk_screen.y = 186;
			
		//	desk_fuse = new Image(this.assets.getTexture('desk_fuse'));
		//	desk_fuse.touchable = false;
		//	desk_fuse.x = 559;
		//	desk_fuse.y = 221;
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier['Lid'] == 'Open'){
					copier_lid.alpha = 1;
				}else{
					copier_lid.alpha = 0;
				}
			}else{
				copier_lid.alpha = 0;
			}
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice['BackOfficeDoorUnlocked'] == 'Yes'){
					BackOfficeDoorUnlocked = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice['RoboticsDoorUnlocked'] == 'Yes'){
					RoboticsDoorUnlocked = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice['BackOfficeDoor'] == 'Open'){
					BackOfficeDoorOpen = true;
					backOfficeDoor.alpha = 0;
					CreateBackOfficeHit();
				}else{
					backOfficeDoor.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice['RoboticsDoor'] == 'Open'){
					RoboticsDoorOpen = true;
					roboticsDoor.alpha = 0;
					CreateRoboticsHit();
				}else{
					roboticsDoor.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOffice',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadDarkDance(true,3);
							
						},0.5);
					}
				}
				
			}else{
				backOfficeDoor.alpha = 1;
				roboticsDoor.alpha = 1;
				
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					//	SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOffice',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadDarkDance(true,3);
					},0.5);
				}
			}
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['DrawerLower'] == 'open'){
					desk_drawer_lower.alpha = 1;
				}else{
					desk_drawer_lower.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['DrawerMiddle'] == 'open'){
					desk_drawer_middle.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['DrawerLower'] == 'open'){
						desk_drawer_lower_cover.alpha = 1;
					}else{
						desk_drawer_lower_cover.alpha = 0;
					}
					
				}else{
					desk_drawer_middle.alpha = 0;
					desk_drawer_lower_cover.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['DrawerUpper'] == 'open'){
					desk_drawer_upper.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['DrawerMiddle'] == 'open'){
						desk_drawer_middle_cover.alpha = 1;
					}else{
						desk_drawer_middle_cover.alpha = 0;
					}
				}else{
					desk_drawer_upper.alpha = 0;
					desk_drawer_middle_cover.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['Box'] == 'open'){
					
					desk_box_open.alpha = 1;
				}else{
					desk_box_open.alpha = 0;
				//	desk_fuse.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['Computer'] == 'On'){
					desk_screen.alpha = 1;
				}else{
					desk_screen.alpha = 0;
				}
			}else{
				desk_box_open.alpha = 0;
			//	desk_fuse.alpha = 0;
				desk_drawer_lower.alpha = 0;
				desk_drawer_middle.alpha = 0;
				desk_drawer_upper.alpha = 0;
				
				desk_drawer_lower_cover.alpha = 0;
				desk_drawer_middle_cover.alpha = 0;
				desk_screen.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['PushBox'] == 'Attached'){	
					pushBox.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['Solved'] == 'Yes'){	
						if(BackOfficeDoorUnlocked === false){
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice != undefined){	
								SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice;
							}
							Animating = true;
							BackOfficeDoorUnlocked = true;
							BackOfficeDoorOpen = true;
							SaveArray['BackOfficeDoorUnlocked'] = 'Yes';
							SaveArray['BackOfficeDoor'] = 'Open';
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOffice',SaveArray);
							
							Starling.juggler.delayCall(UnlockBuildingOfficeDoor,2);
						}else{
							
						}
					}
				}else{
					pushBox.alpha = 0;
				}
			}else{
				pushBox.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){	
				
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['Solved'] == 'Yes'){	
						if(RoboticsDoorUnlocked === false){
							Animating = true;
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){	
								SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle;
							}
							RoboticsDoorUnlocked = true;
							RoboticsDoorOpen = true;
							SaveArray['RoboticsDoorUnlocked'] = 'Yes';
							SaveArray['RoboticsDoor'] = 'Open';
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOffice',SaveArray);
							
							Starling.juggler.delayCall(UnlockRoboticsDoor,2.5);
						}else{
							
						}
					}
				
			}else{
				
			}
			
			
			this.addChildAt(backOfficeDoor,1);
			this.addChildAt(roboticsDoor,2);
			this.addChildAt(pushBox,3);
			
			this.addChildAt(desk_drawer_lower,4);
			this.addChildAt(desk_drawer_middle,5);
			this.addChildAt(desk_drawer_upper,6);
			this.addChildAt(desk_drawer_lower_cover,7);
			this.addChildAt(desk_drawer_middle_cover,8);
			this.addChildAt(desk_box_open,9);
			this.addChildAt(copier_lid,10);
			this.addChildAt(desk_screen,10);
		//	this.addChildAt(desk_fuse,10);
			
			CreateShelf00Hit();
			CreateShelf01Hit();
			CreateComputerHit();
			CreateGarbageHit();
			CreateCoffeeHit();
			CreateClockHit();
			CreateLightHit();
			CreateBoardHit();
			
			CreateBackOfficeDoorHit(BackOfficeDoorOpen);
			CreateRoboticsDoorHit(RoboticsDoorOpen);
			CreateDesksHit();
			CreatePushBoxHit();
			CreateCopierHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BasementBongs",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BuildingHum",0,0.5,'stop');
		}
		//hit_robotics_door
		//hit_push_box
		
		private function UnlockRoboticsDoor():void{
			//DoorThreeOpen
			Animating = false;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HeavyMetalDoorOpen();
			roboticsDoor.alpha = 0;
			CreateRoboticsHit();
		}
		
		private function UnlockBuildingOfficeDoor():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CreakyDoor();
			backOfficeDoor.alpha = 0;
			CreateBackOfficeHit();
			Animating = false;
		}
		
		
		private function CreateBoardHit():void{
			hit_board = new Shape();
			hit_board.touchable = false;
			hit_board.graphics.beginFill(0xff0000);
			
			hit_board.graphics.lineTo(587,117);	
			hit_board.graphics.lineTo(660,117);	
			hit_board.graphics.lineTo(655,178);	
			hit_board.graphics.lineTo(585,174);	
		
			hit_board.alpha = 0.0;
			
			hit_board.graphics.precisionHitTest = true;	
			this.addChild(hit_board);
		}
		
		private function CreateLightHit():void{
			hit_lights = new Shape();
			hit_lights.touchable = false;
			hit_lights.graphics.beginFill(0xff0000);
			
			hit_lights.graphics.lineTo(128,7);	
			hit_lights.graphics.lineTo(148,3);	
			hit_lights.graphics.lineTo(576,3);	
			hit_lights.graphics.lineTo(683,28);	
			hit_lights.graphics.lineTo(661,52);	
			hit_lights.graphics.lineTo(529,59);	
			hit_lights.graphics.lineTo(290,37);	
		
			hit_lights.graphics.endFill(false);
			hit_lights.alpha = 0.0;
			
			hit_lights.graphics.precisionHitTest = true;	
			this.addChild(hit_lights);
		}
		
		private function CreateClockHit():void{
			hit_clock = new Shape();
			hit_clock.touchable = false;
			hit_clock.graphics.beginFill(0xff0000);
			
			hit_clock.graphics.lineTo(604,92);	
			hit_clock.graphics.lineTo(608,76);	
			hit_clock.graphics.lineTo(634,67);	
			hit_clock.graphics.lineTo(650,85);	
			hit_clock.graphics.lineTo(636,113);	
			hit_clock.graphics.lineTo(614,110);	
		
			hit_clock.graphics.endFill(false);
			hit_clock.alpha = 0.0;
			
			hit_clock.graphics.precisionHitTest = true;	
			this.addChild(hit_clock);
		}
		
		private function CreateCoffeeHit():void{
			hit_coffee = new Shape();
			hit_coffee.touchable = false;
			hit_coffee.graphics.beginFill(0xff0000);
			
			hit_coffee.graphics.lineTo(123,426);	
			hit_coffee.graphics.lineTo(149,400);	
			hit_coffee.graphics.lineTo(190,408);	
			hit_coffee.graphics.lineTo(235,472);	
			hit_coffee.graphics.lineTo(215,494);	
			hit_coffee.graphics.lineTo(140,490);	
		
			hit_coffee.graphics.endFill(false);
			hit_coffee.alpha = 0.0;
			
			hit_coffee.graphics.precisionHitTest = true;	
			this.addChild(hit_coffee);
		}
		
		private function CreateGarbageHit():void{
			hit_gabage = new Shape();
			hit_gabage.touchable = false;
			hit_gabage.graphics.beginFill(0xff0000);
			
			hit_gabage.graphics.lineTo(206,425);	
			hit_gabage.graphics.lineTo(251,369);	
			hit_gabage.graphics.lineTo(313,353);	
			hit_gabage.graphics.lineTo(348,362);	
			hit_gabage.graphics.lineTo(345,412);	
			hit_gabage.graphics.lineTo(310,439);	
			hit_gabage.graphics.lineTo(224,442);	
			
			hit_gabage.graphics.endFill(false);
			hit_gabage.alpha = 0.0;
			
			hit_gabage.graphics.precisionHitTest = true;	
			this.addChild(hit_gabage);
		}
		
		private function CreateComputerHit():void{
			hit_computer = new Shape();
			hit_computer.touchable = false;
			hit_computer.graphics.beginFill(0xff0000);
			
			hit_computer.graphics.lineTo(338,332);	
			hit_computer.graphics.lineTo(361,305);	
			hit_computer.graphics.lineTo(430,342);	
			hit_computer.graphics.lineTo(430,448);	
			hit_computer.graphics.lineTo(380,454);	
			hit_computer.graphics.lineTo(338,423);	
		
			hit_computer.graphics.endFill(false);
			hit_computer.alpha = 0.0;
			
			hit_computer.graphics.precisionHitTest = true;	
			this.addChild(hit_computer);
		}
		
		private function CreateShelf01Hit():void{
			hit_shelf_01 = new Shape();
			hit_shelf_01.touchable = false;
			hit_shelf_01.graphics.beginFill(0xff0000);
			
			hit_shelf_01.graphics.lineTo(370,54);	
			hit_shelf_01.graphics.lineTo(493,68);	
			hit_shelf_01.graphics.lineTo(570,67);	
			hit_shelf_01.graphics.lineTo(570,190);	
			hit_shelf_01.graphics.lineTo(358,172);	
			
			hit_shelf_01.graphics.endFill(false);
			hit_shelf_01.alpha = 0.0;
			
			hit_shelf_01.graphics.precisionHitTest = true;	
			this.addChild(hit_shelf_01);
		}
		private function CreateShelf00Hit():void{
			hit_shelf_00 = new Shape();
			hit_shelf_00.touchable = false;
			hit_shelf_00.graphics.beginFill(0xff0000);
			
			hit_shelf_00.graphics.lineTo(6,16);	
			hit_shelf_00.graphics.lineTo(156,35);	
			hit_shelf_00.graphics.lineTo(156,138);	
			hit_shelf_00.graphics.lineTo(10,136);	
		
			hit_shelf_00.graphics.endFill(false);
			hit_shelf_00.alpha = 0.0;
			
			hit_shelf_00.graphics.precisionHitTest = true;	
			this.addChild(hit_shelf_00);
		}
		
		private function CreateCopierHit():void{
			hit_copier = new Shape();
			hit_copier.touchable = false;
			hit_copier.graphics.beginFill(0xff0000);
			
			hit_copier.graphics.lineTo(0,160);	
			hit_copier.graphics.lineTo(114,154);	
			hit_copier.graphics.lineTo(188,213);	
			hit_copier.graphics.lineTo(188,330);	
			hit_copier.graphics.lineTo(90,354);	
			hit_copier.graphics.lineTo(0,289);	
			
			hit_copier.graphics.endFill(false);
			hit_copier.alpha = 0.0;
			
			hit_copier.graphics.precisionHitTest = true;	
			this.addChild(hit_copier);
		}
		
		private function CreatePushBoxHit():void{
			hit_push_box = new Shape();
			hit_push_box.touchable = false;
			hit_push_box.graphics.beginFill(0xff0000);
			
			hit_push_box.graphics.lineTo(294,124);	
			hit_push_box.graphics.lineTo(357,124);	
			hit_push_box.graphics.lineTo(355,179);	
			hit_push_box.graphics.lineTo(298,188);	
		
			
			hit_push_box.graphics.endFill(false);
			hit_push_box.alpha = 0.0;
			
			hit_push_box.graphics.precisionHitTest = true;	
			this.addChild(hit_push_box);
		}
		
		
		private function CreateRoboticsHit():void{
			hit_robotics = new Shape();
			hit_robotics.touchable = false;
			hit_robotics.graphics.beginFill(0xff0000);
			
			hit_robotics.graphics.lineTo(673,99);	
			hit_robotics.graphics.lineTo(738,106);	
			hit_robotics.graphics.lineTo(722,300);	
			hit_robotics.graphics.lineTo(664,298);	
			
			hit_robotics.graphics.endFill(false);
			hit_robotics.alpha = 0.0;
			
			hit_robotics.graphics.precisionHitTest = true;	
			this.addChild(hit_robotics);
		}
		private function CreateRoboticsDoorHit(open:Boolean = false):void{
			hit_robotics_door = new Shape();		
			hit_robotics_door.x = 0;
			hit_robotics_door.y = 0;
			hit_robotics_door.graphics.beginFill(0x0000FF);
			if(open === false){	
				hit_robotics_door.graphics.lineTo(671,85);	
				hit_robotics_door.graphics.lineTo(785,108);	
				hit_robotics_door.graphics.lineTo(771,257);	
				hit_robotics_door.graphics.lineTo(726,268);	
				hit_robotics_door.graphics.lineTo(706,296);	
				hit_robotics_door.graphics.lineTo(700,310);	
				hit_robotics_door.graphics.lineTo(661,300);	
				hit_robotics_door.graphics.lineTo(661,300);	
				
			}else{
				
				hit_robotics_door.graphics.lineTo(725,296);
				hit_robotics_door.graphics.lineTo(738,107);
				hit_robotics_door.graphics.lineTo(788,108);
				hit_robotics_door.graphics.lineTo(775,256);
				hit_robotics_door.graphics.lineTo(756,261);
				hit_robotics_door.graphics.lineTo(736,280);
				
				
			}				
			hit_robotics_door.graphics.endFill(false);			
			hit_robotics_door.alpha = 0.0;			
			hit_robotics_door.graphics.precisionHitTest = true;	
			hit_robotics_door.touchable = false
			this.addChild(hit_robotics_door);
		}
		
	
		
		
		
		private function CreateDesksHit():void{
			hit_desk = new Shape();
			hit_desk.touchable = false;
			hit_desk.graphics.beginFill(0xff0000);
			
			hit_desk.graphics.lineTo(336,257);	
			hit_desk.graphics.lineTo(368,176);	
			hit_desk.graphics.lineTo(436,173);	
			hit_desk.graphics.lineTo(559,197);	
			hit_desk.graphics.lineTo(656,242);	
			hit_desk.graphics.lineTo(641,346);	
			hit_desk.graphics.lineTo(438,406);	
			hit_desk.graphics.lineTo(433,338);	
			hit_desk.graphics.lineTo(340,286);	
			
			hit_desk.graphics.endFill(false);
			hit_desk.alpha = 0.0;
			
			hit_desk.graphics.precisionHitTest = true;	
			this.addChild(hit_desk);
		}
		private function CreateBackOfficeHit():void{
			hit_back_office = new Shape();
			hit_back_office.touchable = false;
			hit_back_office.graphics.beginFill(0xff0000);
			
			hit_back_office.graphics.lineTo(240,90);	
			hit_back_office.graphics.lineTo(295,90);	
			hit_back_office.graphics.lineTo(299,311);	
			hit_back_office.graphics.lineTo(248,313);	
			
			hit_back_office.graphics.endFill(false);
			hit_back_office.alpha = 0.0;
			
			hit_back_office.graphics.precisionHitTest = true;	
			this.addChild(hit_back_office);
		}
		private function CreateBackOfficeDoorHit(open:Boolean = false):void{
			hit_back_office_door = new Shape();		
			hit_back_office_door.x = 0;
			hit_back_office_door.y = 0;
			hit_back_office_door.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_back_office_door.graphics.lineTo(197,84);
				hit_back_office_door.graphics.lineTo(296,90);
				hit_back_office_door.graphics.lineTo(300,309);
				hit_back_office_door.graphics.lineTo(230,322);
				hit_back_office_door.graphics.lineTo(228,294);
				hit_back_office_door.graphics.lineTo(209,290);
				
				
			}else{
				
				hit_back_office_door.graphics.lineTo(198,81);
				hit_back_office_door.graphics.lineTo(231,87);
				hit_back_office_door.graphics.lineTo(240,311);
				hit_back_office_door.graphics.lineTo(229,316);
				hit_back_office_door.graphics.lineTo(228,296);
				hit_back_office_door.graphics.lineTo(209,291);
				
			}				
			hit_back_office_door.graphics.endFill(false);			
			hit_back_office_door.alpha = 0.0;			
			hit_back_office_door.graphics.precisionHitTest = true;	
			hit_back_office_door.touchable = false
			this.addChild(hit_back_office_door);
			
			
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(BackOfficeDoorOpen === true){
							if(hit_back_office.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((BuildingOfficeBack as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeBackObj,false
								);
								return;
							}
							
						}
						if(RoboticsDoorOpen === true){
							if(hit_robotics.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((RoboticsRoom as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.RoboticsRoomObj,false
								);
								return;
							}
						}
						
						if(targ == goback.SourceImage){
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((Lobby as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyObj,false
							);
						}else if(hit_push_box.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(BackOfficeDoorUnlocked === false){
								FadeOut((BuildingOfficePushBox as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficePushBoxObj,true
								);
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think I'm done with the security panel.");
							}
							
							
						}else if(hit_back_office_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(BackOfficeDoorUnlocked === false){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedTwo();
								if(RONum == 0){
									RONum = 1;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The door is locked. There's a security panel to the right...");			
								}else if(RONum == 1){
									RONum = 2;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The door is held firmly in place by an invisible series of locks.");				
								}else if(RONum == 2){
									RONum = 0;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't open it. I should investigate the nearby electronic security panel.");
									
								}
								
							}else{
								BackOfficeDoorHandler();
							}
						}else if(hit_robotics_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
							if(RoboticsDoorUnlocked === false){
								FadeOut((BuildingOfficeShapePuzzle as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeShapePuzzleObj,false
								);
							}else{
								RoboticsDoorHandler();
							}
						}else if(hit_desk.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((BuildingOfficeDesk as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeDeskObj,true
							);
					//	}else 
						}else if(hit_copier.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((BuildingOfficeCopier as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeCopierObj,true
							);
							//	}else 
						}else if(hit_shelf_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The shelf is lined with technical books and manuals.");	
						}else if(hit_shelf_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ShelfHandler();
						}else if(hit_computer.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A desktop computer and some construction diagrams.");	
						}else if(hit_gabage.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An overturned waste bin.");	
						}else if(hit_clock.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A clock. It has stopped ticking.");	
						}else if(hit_coffee.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The overturned coffee cup has stained the carpet.");	
						}else if(hit_lights.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The overturned coffee cup has stained the carpet.");	
						}else if(hit_board.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A cork push-pin board with notes and papers attached.");	
						}
						
						
						/*
						
						private var hit_shelf_00:Shape;
						private var hit_shelf_01:Shape;
						private var hit_computer:Shape;
						private var hit_gabage:Shape;
						private var hit_coffee:Shape;
						private var hit_clock:Shape;
						private var hit_lights:Shape;
						hit_board
						*/
					}
				}
			}
		}
		private function LightsHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The fluorescent lights hum steadily.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The fluorescent lights emit a soft greenish light.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The fluorescent lights hum steadily.");	
			}
		}
		
		private function ShelfHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The shelf is filled with stacks of blueprints and supply boxes.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a semi-organized jumble of supplies on the shelf.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Many of the items look like they're related to day-to-day operations of the building.");	
			}
		}
		
		private function RoboticsDoorHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice;
			}			
			if(RoboticsDoorOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HeavyMetalDoorOpen();
				RoboticsDoorOpen = true;
				roboticsDoor.alpha = 0;
				SaveArray['RoboticsDoor'] = 'Open';
				hit_robotics_door.graphics.clear();
				CreateRoboticsDoorHit(true);
				CreateRoboticsHit();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HeavyMetalDoorClose();
				RoboticsDoorOpen = false;
				roboticsDoor.alpha = 1;
				SaveArray['RoboticsDoor'] = 'Closed';
				hit_robotics_door.graphics.clear();
				hit_robotics.graphics.clear();
				CreateRoboticsDoorHit(false);
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOffice',SaveArray);
		}
		
		private function BackOfficeDoorHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice;
			}			
			if(BackOfficeDoorOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CreakyOpen();
				BackOfficeDoorOpen = true;
				backOfficeDoor.alpha = 0;
				SaveArray['BackOfficeDoor'] = 'Open';
				hit_back_office_door.graphics.clear();
				CreateBackOfficeDoorHit(true);
				CreateBackOfficeHit();
			}else{
				BackOfficeDoorOpen = false;
				backOfficeDoor.alpha = 1;
				SaveArray['BackOfficeDoor'] = 'Closed';
				hit_back_office_door.graphics.clear();
				hit_back_office.graphics.clear();
				CreateBackOfficeDoorHit(false);
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CreakyClose();
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOffice',SaveArray);
			
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
			
			
			
			this.assets.removeTexture("buildingOffice_bg",true);
			this.assets.removeTexture("BuildingOffice_Sprite_01",true);
			this.assets.removeTextureAtlas("BuildingOffice_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("buildingOffice_01");
			(stage.getChildAt(0) as Object).falseAsset("buildingOffice_02");
			(stage.getChildAt(0) as Object).falseAsset("buildingOffice_03");
			
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
