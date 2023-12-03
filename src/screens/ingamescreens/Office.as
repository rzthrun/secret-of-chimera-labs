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
	
	
	public class Office extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		public var SaveArray2:Array = new Array();
		
		private var bg:Image;
		
		private var door_bathroom:Image;
		private var door_server:Image;
		private var door_rocket:Image;
		
		private var kitchenCabinetLeft:Image;
		private var kitchenCabinetRight:Image;
		private var kitchenCabinetMicrowave:Image;
		
		private var programmerDrawer:Image;
		private var programmerLid:Image;
		private var programmerScreen:Image;
		
		private var desk_screwdriver:Image;
		private var desk_spider:Image;
		private var desk_screen:Image;
		
	//	private var hit_officeCorner:Shape;
		private var hit_desk:Shape;
		private var hit_programmer:Shape;
		private var hit_robotics:Shape;
		private var hit_kitchen:Shape;
		private var hit_server:Shape;
		//	private var hit_elevator_door:Shape;
		
		private var hit_floor:Shape;
		private var hit_cubical:Shape;
		private var hit_garbage:Shape;
		private var hit_light:Shape;
		private var hit_shelf:Shape;
		private var hit_waterFountain:Shape;
		private var hit_board:Shape;
		
		private var RONum:int = 0;
		
		private var Animating:Boolean = false;
		private var RocketRoomDoorOpen:Boolean = false;
		private var ServerRoomDoorUnlocked:Boolean = false;
		private var ServerRoomDoorOpen:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function Office(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('office_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Office/office_bg.jpg'));
				game.TrackAssets('office_01');
			}
			if(game.CheckAsset('office_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Office/Office_Sprite_01.png'));
				game.TrackAssets('office_02');
			}
			if(game.CheckAsset('office_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Office/Office_Sprite_01.xml'));
				game.TrackAssets('office_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("Office","OfficeObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		//	(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
		//		(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Cube,
		//		'item_Cube',
		//		'inven_cube_sm'
		//	);
			
			bg = new Image(this.assets.getTexture('office_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			
			door_server = new Image(this.assets.getTexture('door_server_closed'));
			door_server.touchable = false;
			door_server.x = 560;
			door_server.y = 125;
			
			door_rocket = new Image(this.assets.getTexture('door_robots_closed'));
			door_rocket.touchable = false;
			door_rocket.x = 736;
			door_rocket.y = 92;
			
			door_bathroom = new Image(this.assets.getTexture('door_bathroom_closed'));
			door_bathroom.touchable = false;
			door_bathroom.x = 19;
			door_bathroom.y = 111;
			
			kitchenCabinetRight = new Image(this.assets.getTexture('kitchen_cabinet_right_closed'));
			kitchenCabinetRight.touchable = false;
			kitchenCabinetRight.x = 163;
			kitchenCabinetRight.y = 107;
			
			kitchenCabinetLeft = new Image(this.assets.getTexture('kitchen_cabinet_left_closed'));
			kitchenCabinetLeft.touchable = false;
			kitchenCabinetLeft.x = 134;
			kitchenCabinetLeft.y = 103;
			
			kitchenCabinetMicrowave = new Image(this.assets.getTexture('kitchen_microwave_closed'));
			kitchenCabinetMicrowave.touchable = false;
			kitchenCabinetMicrowave.x = 213;
			kitchenCabinetMicrowave.y = 144;
			
			
			programmerDrawer = new Image(this.assets.getTexture('programmer_drawer_upper'));
			programmerDrawer.touchable = false;
			programmerDrawer.x = 70;
			programmerDrawer.y = 293;
			
			programmerLid = new Image(this.assets.getTexture('programmer_lid'));
			programmerLid.touchable = false;
			programmerLid.x = 87;
			programmerLid.y = 248;
			
			programmerScreen = new Image(this.assets.getTexture('desk_programmer_screen_on'));
			programmerScreen.touchable = false;
			programmerScreen.x = 14;
			programmerScreen.y = 236;
			
			desk_screwdriver = new Image(this.assets.getTexture('desk_keys'));
			desk_screwdriver.touchable = false;
			desk_screwdriver.x = 273;
			desk_screwdriver.y = 323;
			
			desk_spider = new Image(this.assets.getTexture('desk_spider'));
			desk_spider.touchable = false;
			desk_spider.x = 310;
			desk_spider.y = 292;
			
			desk_screen = new Image(this.assets.getTexture('desk_drafter_screen_on'));
			desk_screen.touchable = false;
			desk_screen.x = 398;
			desk_screen.y = 229;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Office != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Office['RocketRoomDoor'] == 'Open'){
					door_rocket.alpha = 0;
					RocketRoomDoorOpen = true;
				}else{
					door_rocket.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Office['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Office;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Office',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadSubBop(true,3);
							
						},0.5);
					}
				}
				
			}else{
				door_rocket.alpha = 1;
				
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
				
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Office',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadSubBop(true,3);
						
					},0.5);
				}
			}
		
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['Door'] == 'Open'){	
					ServerRoomDoorOpen = true;
					ServerRoomDoorUnlocked = true;
					door_server.alpha = 0;
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['Door'] != undefined){
					ServerRoomDoorUnlocked = true;
					door_server.alpha = 1;
				}else{
					door_server.alpha = 1;
				}
			}else{
				door_server.alpha = 1;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['Door'] == 'Open'){	
					door_bathroom.alpha = 0;
				}else{
					door_bathroom.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['UpperCabLeftOpen'] == 'Open'){	
					kitchenCabinetLeft.texture = this.assets.getTexture('kitchen_cabinet_left_open');
					kitchenCabinetLeft.readjustSize();
						//kitchen_cabinet_left_open
					kitchenCabinetLeft.x = 133;
					kitchenCabinetLeft.y = 103;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['UpperCabRightOpen'] == 'Open'){
					kitchenCabinetRight.texture = this.assets.getTexture('kitchen_cabinet_right_open');
					kitchenCabinetRight.readjustSize();
					//kitchen_cabinet_left_open
					kitchenCabinetRight.x = 190;
					kitchenCabinetRight.y = 111;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['MicrowaveOpen'] == 'Open'){
					kitchenCabinetMicrowave.texture = this.assets.getTexture('kitchen_microwave_open');
					kitchenCabinetMicrowave.readjustSize();
					//kitchen_cabinet_left_open
					kitchenCabinetMicrowave.x = 213;
					kitchenCabinetMicrowave.y = 143;
				}
			}else{
				door_bathroom.alpha = 1;
				
				
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['Lid'] == 'Open'){
					programmerLid.alpha = 1;
				}else{
					programmerLid.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['LowerDrawer'] == 'Open'){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['UpperDrawer'] == 'Open'){
						programmerDrawer.texture = this.assets.getTexture('programmer_drawer_both');
						programmerDrawer.alpha = 1;
					}else{
						programmerDrawer.texture = this.assets.getTexture('programmer_drawer_lower');
						programmerDrawer.alpha = 1;
					}
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['UpperDrawer'] == 'Open'){
					programmerDrawer.texture = this.assets.getTexture('programmer_drawer_upper');
					programmerDrawer.alpha = 1;
				}else{
					programmerDrawer.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['ComputerOn'] == 'Yes'){
					programmerScreen.alpha = 1;
				}else{
					programmerScreen.alpha = 0;
				}
			}else{
				programmerDrawer.alpha = 0;
				programmerLid.alpha = 0;
				programmerScreen.alpha =0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDeskDraftsman != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDeskDraftsman['ComputerOn'] == 'Yes'){
					desk_screen.alpha = 1;
				}else{
					desk_screen.alpha = 0;
				}
			}else{
				desk_screen.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Spider'] == 'PickedUp'){
					desk_spider.alpha = 0;
				}else{
					desk_spider.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Screwdriver'] == 'PickedUp'){	
					desk_screwdriver.alpha = 0;
				}else{
					desk_screwdriver.alpha = 1;
				}
			}else{
				
				desk_screwdriver.alpha = 1;
				desk_spider.alpha = 1;
			}
			
			kitchenCabinetRight.alpha = 1;
			kitchenCabinetLeft.alpha = 1;
			kitchenCabinetMicrowave.alpha = 1;
			
		
		
		
			
			
			this.addChildAt(door_server,1);
			this.addChildAt(door_rocket,2);
			this.addChildAt(door_bathroom,3);
			this.addChildAt(kitchenCabinetMicrowave,4);
			this.addChildAt(kitchenCabinetRight,5);
			this.addChildAt(kitchenCabinetLeft,6);
			
			this.addChildAt(programmerDrawer,7);
			this.addChildAt(programmerLid,8);
			this.addChildAt(programmerScreen,9);
			this.addChildAt(desk_screwdriver,10);
			this.addChildAt(desk_spider,11);
			this.addChildAt(desk_screen,12);
			
			//	CreateElevatorDoorHit();
			
			CreateFloorHit();
			CreateCubicalHit();
			CreateGarbageHit();
			CreateWaterFountainHit();
			CreateShelfHit();
			CreateBoardHit();
			
			CreateProgrammerHit();
			CreateDeskHit();
			CreateRoboticsHit();
			CreateKitchenHit();
			CreateLightHit();
			CreateServerHit();
		
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BuildingHum",0,0.5,'stop');
			
		}
		
		private function CreateBoardHit():void{
			hit_board = new Shape();
			hit_board.touchable = false;
			hit_board.graphics.beginFill(0x00ff00);
			
			hit_board.graphics.lineTo(306,115);	
			hit_board.graphics.lineTo(381,114);	
			hit_board.graphics.lineTo(380,165);	
			hit_board.graphics.lineTo(303,168);	
			
			hit_board.graphics.endFill(false);
			hit_board.alpha = 0.0;
			
			hit_board.graphics.precisionHitTest = true;	
			this.addChild(hit_board);
		}
		
		private function CreateShelfHit():void{
			hit_shelf = new Shape();
			hit_shelf.touchable = false;
			hit_shelf.graphics.beginFill(0x00ff00);
			
			hit_shelf.graphics.lineTo(425,106);	
			hit_shelf.graphics.lineTo(517,110);	
			hit_shelf.graphics.lineTo(515,177);	
			hit_shelf.graphics.lineTo(423,176);	
			
			hit_shelf.graphics.endFill(false);
			hit_shelf.alpha = 0.0;
			
			hit_shelf.graphics.precisionHitTest = true;	
			this.addChild(hit_shelf);
		}
		
		private function CreateLightHit():void{
			hit_light = new Shape();
			hit_light.touchable = false;
			hit_light.graphics.beginFill(0x00ff00);
			
			hit_light.graphics.lineTo(0,0);	
			hit_light.graphics.lineTo(680,0);	
			hit_light.graphics.lineTo(658,69);	
			hit_light.graphics.lineTo(221,80);	
			hit_light.graphics.lineTo(0,21);	
		
			hit_light.graphics.endFill(false);
			hit_light.alpha = 0.0;
			
			hit_light.graphics.precisionHitTest = true;	
			this.addChild(hit_light);
		}
		
		
		private function CreateWaterFountainHit():void{
			hit_waterFountain = new Shape();
			hit_waterFountain.touchable = false;
			hit_waterFountain.graphics.beginFill(0x00ff00);
			
			hit_waterFountain.graphics.lineTo(690,160);	
			hit_waterFountain.graphics.lineTo(733,163);	
			hit_waterFountain.graphics.lineTo(724,290);	
			hit_waterFountain.graphics.lineTo(675,291);	
			
			hit_waterFountain.graphics.endFill(false);
			hit_waterFountain.alpha = 0.0;
			
			hit_waterFountain.graphics.precisionHitTest = true;	
			this.addChild(hit_waterFountain);
		}
		
		
		private function CreateGarbageHit():void{
			hit_garbage = new Shape();
			hit_garbage.touchable = false;
			hit_garbage.graphics.beginFill(0x00ff00);
			
			hit_garbage.graphics.lineTo(658,356);	
			hit_garbage.graphics.lineTo(677,288);	
			hit_garbage.graphics.lineTo(725,290);	
			hit_garbage.graphics.lineTo(723,363);	
			
			hit_garbage.graphics.endFill(false);
			hit_garbage.alpha = 0.0;
			
			hit_garbage.graphics.precisionHitTest = true;	
			this.addChild(hit_garbage);
		}
		
		
		private function CreateCubicalHit():void{
			hit_cubical = new Shape();
			hit_cubical.touchable = false;
			hit_cubical.graphics.beginFill(0x00ff00);
			
			hit_cubical.graphics.lineTo(166,257);	
			hit_cubical.graphics.lineTo(261,261);	
			hit_cubical.graphics.lineTo(266,457);	
			hit_cubical.graphics.lineTo(172,451);	
		
			hit_cubical.graphics.endFill(false);
			hit_cubical.alpha = 0.0;
			
			hit_cubical.graphics.precisionHitTest = true;	
			this.addChild(hit_cubical);
		}
		
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0x00ff00);
			
			hit_floor.graphics.lineTo(282,454);	
			hit_floor.graphics.lineTo(552,319);	
			hit_floor.graphics.lineTo(665,327);	
			hit_floor.graphics.lineTo(765,395);	
			hit_floor.graphics.lineTo(583,510);	
			hit_floor.graphics.lineTo(271,499);	
			
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		private function CreateServerHit():void{
			hit_server = new Shape();
			hit_server.touchable = false;
			hit_server.graphics.beginFill(0x00ff00);
			
			hit_server.graphics.lineTo(558,122);	
			hit_server.graphics.lineTo(665,121);	
			hit_server.graphics.lineTo(657,307);	
			hit_server.graphics.lineTo(557,304);	
			
			
			hit_server.graphics.endFill(false);
			hit_server.alpha = 0.0;
			
			hit_server.graphics.precisionHitTest = true;	
			this.addChild(hit_server);
		}
		
		private function CreateKitchenHit():void{
			hit_kitchen = new Shape();
			hit_kitchen.touchable = false;
			hit_kitchen.graphics.beginFill(0x00ff00);
			
			hit_kitchen.graphics.lineTo(0,65);	
			hit_kitchen.graphics.lineTo(91,64);	
			hit_kitchen.graphics.lineTo(225,85);	
			hit_kitchen.graphics.lineTo(300,114);	
			hit_kitchen.graphics.lineTo(300,165);	
			hit_kitchen.graphics.lineTo(230,195);	
			hit_kitchen.graphics.lineTo(136,191);	
			hit_kitchen.graphics.lineTo(0,166);	
			
			hit_kitchen.graphics.endFill(false);
			hit_kitchen.alpha = 0.0;
			
			hit_kitchen.graphics.precisionHitTest = true;	
			this.addChild(hit_kitchen);
		}
		
		private function CreateRoboticsHit():void{
			hit_robotics = new Shape();
			hit_robotics.touchable = false;
			hit_robotics.graphics.beginFill(0x00ff00);
			
			hit_robotics.graphics.lineTo(739,106);	
			hit_robotics.graphics.lineTo(788,104);	
			hit_robotics.graphics.lineTo(777,383);	
			hit_robotics.graphics.lineTo(750,385);	
			hit_robotics.graphics.lineTo(726,362);	
			
			hit_robotics.graphics.endFill(false);
			hit_robotics.alpha = 0.0;
			
			hit_robotics.graphics.precisionHitTest = true;	
			this.addChild(hit_robotics);
		}
		
		
		
		private function CreateProgrammerHit():void{
			hit_programmer = new Shape();
			hit_programmer.touchable = false;
			hit_programmer.graphics.beginFill(0x00ff00);
			
			hit_programmer.graphics.lineTo(0,172);	
			hit_programmer.graphics.lineTo(130,176);	
			hit_programmer.graphics.lineTo(133,198);	
			hit_programmer.graphics.lineTo(228,202);	
			hit_programmer.graphics.lineTo(208,247);	
			hit_programmer.graphics.lineTo(163,255);	
			hit_programmer.graphics.lineTo(167,408);	
			hit_programmer.graphics.lineTo(0,423);	
					
			hit_programmer.graphics.endFill(false);
			hit_programmer.alpha = 0.0;
			
			hit_programmer.graphics.precisionHitTest = true;	
			this.addChild(hit_programmer);
		}
		
		
		private function CreateDeskHit():void{
			hit_desk = new Shape();
			hit_desk.touchable = false;
			hit_desk.graphics.beginFill(0xff0000);
			
			hit_desk.graphics.lineTo(220,241);	
			hit_desk.graphics.lineTo(235,203);	
			hit_desk.graphics.lineTo(281,173);	
			hit_desk.graphics.lineTo(354,168);	
			hit_desk.graphics.lineTo(455,195);	
			hit_desk.graphics.lineTo(535,231);	
			hit_desk.graphics.lineTo(529,357);	
			hit_desk.graphics.lineTo(440,391);	
			hit_desk.graphics.lineTo(414,435);	
			hit_desk.graphics.lineTo(285,448);	
			hit_desk.graphics.lineTo(275,454);	
			hit_desk.graphics.lineTo(266,259);	
			hit_desk.graphics.lineTo(213,253);	
		
			hit_desk.graphics.endFill(false);
			hit_desk.alpha = 0.0;
			
			hit_desk.graphics.precisionHitTest = true;	
			this.addChild(hit_desk);
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
						}else if(hit_desk.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((OfficeDesk as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeDeskObj,true
							);
						}else if(hit_programmer.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((OfficeProgrammer as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeProgrammerObj,true
							);
						}else if(hit_robotics.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							RocketRoomDoorHandler();
							
							
						}else if(hit_kitchen.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((OfficeKitchen as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeKitchenObj,true
							);
						}else if(hit_server.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ServerRoomDoorHandler();
						}else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FloorHandler();
						}else if(hit_cubical.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CubicalHandler();
						}else if(hit_garbage.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A waste-paper recycling bin.");	
						}else if(hit_light.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The lights hum quietly overhead.");	
						}else if(hit_waterFountain.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							WaterHandler();
						}else if(hit_shelf.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small bookshelf with various texts and items.");	
						}else if(hit_board.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Nothing of interest is on the push-board.");	
						}
						/*
						private var hit_floor:Shape;
						private var hit_cubical:Shape;
						private var hit_garbage:Shape;
						private var hit_light:Shape;
						private var hit_shelf:Shape;
						private var hit_waterFountain:Shape;
						private var hit_board:Shape;
						*/
					}
				}
			}
		}
		
		private function WaterHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A water dispenser.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'm not thirsty right now.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The water dispenser is nearly empty.");	
			}
		}
		
		private function CubicalHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A cubicle wall.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The cubicle wall is a cerulean blue, like a cloudless sky.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("With some imagination, cubicles can actually be a lot of fun... hmm...");	
			}
		}
		
		private function FloorHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Crumbled and loose sheets of paper litter the floor.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The carpet is made from a spongy blue synthetic material.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder if it's always this messy...");	
			}
		}
		
		private function ServerRoomDoorHandler():void{
			if(ServerRoomDoorUnlocked === true){
				if(ServerRoomDoorOpen === true){
					FadeOut((ServerRoom as Class), 
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ServerRoomObj,false
					);
				}else{
					
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorThreeOpen();
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CreakyDoorTwo();
					
					door_server.alpha = 0;
					ServerRoomDoorOpen = true;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom != undefined){	
						SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom;	
					}
					
					SaveArray['Door'] = "Open";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray2);
				}
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedTwo();
				
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The door is locked firmly in place.");				
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't see much through the door's window. It's dark on the other side.");				
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmm... maybe there's another way in...");
					
				}
				
				
				
			}
		}
		
		private function RocketRoomDoorHandler():void{
			if(RocketRoomDoorOpen === false){
				RocketRoomDoorOpen = true;
				door_rocket.alpha =  0;
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CreakyDoorTwo();
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Office != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Office;	
				}
				
				SaveArray['RocketRoomDoor'] = "Open";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Office',SaveArray);
				
			}else{
				FadeOut((RocketRoom as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomObj,false
				);
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
			
			
			
			this.assets.removeTexture("office_bg",true);
			this.assets.removeTexture("Office_Sprite_01",true);
			this.assets.removeTextureAtlas("Office_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("office_01");
			(stage.getChildAt(0) as Object).falseAsset("office_02");
			(stage.getChildAt(0) as Object).falseAsset("office_03");
			
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
