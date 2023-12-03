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
	
	
	public class ExteriorRear extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var van_door:Image;
		private var van_rear_door_closed:Image;
		private var van_rear_door_open:Image;
		private var lower_door:Image;
		private var lower_door_open:Image;
		private var upper_door:Image;
		private var upper_door_open:Image;
		private var grate:Image;
		private var garbage_left:Image;
		private var garbage_left_off:Image;		
		private var garbage_right:Image;
		private var garbage_right_off:Image;
		private var bin_lid:Image;
		private var bin_lid_off:Image;
		private var ladder:Image;
		
		
		
		private var hit_exterior:Shape;
		private var hit_grate:Shape;
		private var hit_car_front_door:Shape;
		private var hit_car_front_interior:Shape;
		private var hit_dumpster:Shape;
		private var hit_fire_escape:Shape;
		private var hit_door:Shape;			
		private var hit_trunk:Shape;
		private var hit_trunk_interior:Shape;
		
		private var hit_ground:Shape;
		private var hit_building:Shape;
		private var hit_sky:Shape;
		private var hit_lamp_00:Shape;
		private var hit_lamp_01:Shape;
		private var hit_steps:Shape;
		private var hit_car:Shape;
		private var hit_tire:Shape;
		
		private var hit_ladder:Shape;
		
		//	private var hit_elevator_door:Shape;
		private var RONum:int = 0;
		
		
		private var CarDoorOpen:Boolean = false;
		private var CarDoorUnlocked:Boolean = false;
		private var RoboticsDoorOpen:Boolean = false;
		private var Animating:Boolean = false;
		private var LadderDown:Boolean = false;
		private var TrunkUnlocked:Boolean = false;
		private var TrunkOpen:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
	//	private var goback:GoBackButton;		
		
		
		public function ExteriorRear(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('exteriorRear_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorRear/exteriorRear_bg.jpg'));
				game.TrackAssets('exteriorRear_01');
			}
			if(game.CheckAsset('exteriorRear_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorRear/ExteriorRear_Sprite_01.png'));
				game.TrackAssets('exteriorRear_02');
			}
			if(game.CheckAsset('exteriorRear_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorRear/ExteriorRear_Sprite_01.xml'));
				game.TrackAssets('exteriorRear_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ExteriorRear","ExteriorRearObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('exteriorRear_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			van_door = new Image(this.assets.getTexture('van_door_open'));
			van_door.touchable = false;
			van_door.x = 318;
			van_door.y = 243;
			
			van_rear_door_closed = new Image(this.assets.getTexture('van_rear_closed'));
			van_rear_door_closed.touchable = false;
			van_rear_door_closed.x = 97;
			van_rear_door_closed.y = 236;
			
			van_rear_door_open  = new Image(this.assets.getTexture('van_rear_open'));
			van_rear_door_open.touchable = false;
			van_rear_door_open.x = 28;
			van_rear_door_open.y = 189;
			
			lower_door = new Image(this.assets.getTexture('lower_door_closed'));
			lower_door.touchable = false;
			lower_door.x = 398;
			lower_door.y = 178;
			
			lower_door_open = new Image(this.assets.getTexture('lower_door_open'));
			lower_door_open.touchable = false;
			lower_door_open.x = 445;
			lower_door_open.y = 173;
			
			
			upper_door = new Image(this.assets.getTexture('upper_door_closed'));
			upper_door.touchable = false;
			upper_door.x = 396;
			upper_door.y = 19;
			
			upper_door_open = new Image(this.assets.getTexture('upper_door_open'));
			upper_door_open.touchable = false;
			upper_door_open.x = 332;
			upper_door_open.y = 1;
			
			ladder = new Image(this.assets.getTexture('ladder_down'));
			ladder.touchable = false;
			ladder.x = 542;
			ladder.y = 165;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate['Grate'] == 'Open'){	
					grate  = new Image(this.assets.getTexture('grate_grate_off'));
					grate.touchable = false;
					grate.x = 379;
					grate.y = 396;
				}else{
					grate  = new Image(this.assets.getTexture('grate_grate_on'));
					grate.touchable = false;
					grate.x = 434;
					grate.y = 406;
				}
			}else{
				grate  = new Image(this.assets.getTexture('grate_grate_on'));
				grate.touchable = false;
				grate.x = 434;
				grate.y = 406;
			}
			
			/*
			private var garbage_left_off:Image;		
			private var garbage_right:Image;
			private var garbage_right_off:Image;
			private var bin_lid:Image;
			private var bin_lid_off:Image;
			*/
			
			bin_lid = new Image(this.assets.getTexture('garbage_bio_on'));
			bin_lid.touchable = false;
			bin_lid.x = 581;
			bin_lid.y = 282;
			
			bin_lid_off = new Image(this.assets.getTexture('garbage_bio_off'));
			bin_lid_off.touchable = false;
			bin_lid_off.x = 558;
			bin_lid_off.y = 316;
			
			garbage_left = new Image(this.assets.getTexture('garbage_left_on'));
			garbage_left.touchable = false;
			garbage_left.x = 612;
			garbage_left.y = 269;
			
			garbage_left_off = new Image(this.assets.getTexture('garbage_left_off'));
			garbage_left_off.touchable = false;
			garbage_left_off.x = 648;
			garbage_left_off.y = 209;
			
			
			garbage_right = new Image(this.assets.getTexture('garbage_right_on'));
			garbage_right.touchable = false;
			garbage_right.x = 655;
			garbage_right.y = 265;
			
			garbage_right_off = new Image(this.assets.getTexture('garbage_right_off'));
			garbage_right_off.touchable = false;
			garbage_right_off.x = 687;
			garbage_right_off.y = 201;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear != undefined){
				//CarFrontUnlocked
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear['CarFrontUnlocked'] == 'Yes'){
					CarDoorUnlocked = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear['CarFrontDoor'] == 'Open'){
						CarDoorOpen = true;
						van_door.alpha = 1;
						
					}else{
						van_door.alpha = 0;
					}
				}else{
					van_door.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear['TrunkUnlocked'] == 'Yes'){
					van_rear_door_closed.texture = this.assets.getTexture('van_rear_unlocked')
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear['TrunkOpen'] == 'Yes'){
						TrunkUnlocked = true;
						TrunkOpen = true;
						
						van_rear_door_closed.alpha = 0;
						van_rear_door_open.alpha = 1;
						
					}else{
						TrunkUnlocked = true;
						
						van_rear_door_closed.alpha = 1;
						van_rear_door_open.alpha = 0;
						
					}
				}else{
					
					van_rear_door_closed.alpha = 1;
					van_rear_door_open.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorRear',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadErrieAlley(true,2);
							
						},0.5);
					}
				}
				
			}else{
				van_door.alpha = 0;
				van_rear_door_closed.alpha = 1;
				van_rear_door_open.alpha = 0;
				
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorRear',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadErrieAlley(true,2);
						
					},0.5);
				}
				
			}
			
		
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster['BioLid'] == 'Off'){						
					bin_lid.alpha = 0;
					bin_lid_off.alpha = 1;
				}else{					
					bin_lid.alpha = 1;
					bin_lid_off.alpha = 0;
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster['RightLid'] == 'Open'){	
					garbage_right.alpha = 0;
					garbage_right_off.alpha = 1;
				}else{
					
					garbage_right.alpha = 1;
					garbage_right_off.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster['LeftLid'] == 'Open'){	
					garbage_left.alpha = 0;
					garbage_left_off.alpha = 1;
				}else{					
					garbage_left.alpha = 1;
					garbage_left_off.alpha = 0;
				}
				
			}else{
				garbage_left.alpha = 1;
				garbage_right.alpha = 1;
				garbage_left_off.alpha = 0;
				garbage_right_off.alpha = 0;
				bin_lid.alpha = 1;
				bin_lid_off.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoom != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoom['Door'] == 'Open'){
					upper_door_open.alpha = 1;
					upper_door.alpha = 0;
				}else{
					upper_door.alpha = 1;
					upper_door_open.alpha = 0;
				}
			}else{
				upper_door_open.alpha = 0;
				upper_door.alpha = 1;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorFireEscape != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorFireEscape['LadderDown'] == 'Yes'){
					ladder.alpha = 1;
					LadderDown = true;
				}else{
					ladder.alpha = 0;
				}
			}else{
				ladder.alpha = 0;
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoom != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoom['Door'] == 'Open'){	
					RoboticsDoorOpen = true;
					lower_door_open.alpha = 1;
					lower_door.alpha = 0;
				}else{
					lower_door_open.alpha = 0;
					lower_door.alpha = 1;
				}
			}else{
				lower_door_open.alpha = 0;
				lower_door.alpha = 1;
			}
			
			
			
			grate.alpha = 1;
			
			/*
			private var :Image;		
			private var garbage_right:Image;
			private var :Image;
			private var bin_lid:Image;
			private var bin_lid_off:Image;
			*/
			
			this.addChildAt(van_door,1);
			this.addChildAt(van_rear_door_closed,2);
			this.addChildAt(van_rear_door_open,3);
			this.addChildAt(lower_door,4);
			this.addChildAt(lower_door_open,5);
			this.addChildAt(upper_door,6);
			this.addChildAt(upper_door_open,7);
			this.addChildAt(grate,8);
			this.addChildAt(bin_lid,9);
			this.addChildAt(bin_lid_off,10);
			this.addChildAt(garbage_right_off,11);
			this.addChildAt(garbage_left_off,12);			
			this.addChildAt(garbage_left,13);
			this.addChildAt(garbage_right,14);
			this.addChildAt(ladder,15);
			
			//	CreateElevatorDoorHit();
			CreateGroundHit();
			CreateBuildingHit();
			CreateSkyHit();
			CreateCarHit();
			CreateTireHit();
			CreateLamp01Hit();
			CreateLamp00Hit();
			CreateStepsHit();
			
			CreateCarFrontDoorHit(CarDoorOpen);
			CreateExteriorHit();
			CreateGrateHit();
			CreateDumpsterHit();
			CreateFireEscapeHit();
			CreateDoorHit();
			CreateLadderHit();
			
			CreateTrunkHit(TrunkOpen);
			
			if(CarDoorOpen === true){
				CreateCarInteriorHit();
			}
			if(TrunkOpen === true){
				CreateTrunkInteriorHit();
			}
		//	goback = new GoBackButton(this.assets);
		//	this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
		
			(stage.getChildAt(0) as Object).AmbientObj.LoadCityHum(true,999);
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("WindHowl",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ShipGroansOne",0,0.5,'stop');
			//(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			
		
			
		}
		/*
		
		private var hit_ground:Shape;
		private var hit_pipes_00:Shape;
		private var hit_sky:Shape;
		private var hit_lamp_00:Shape;
		private var hit_lamp_01:Shape;
		private var hit_steps:Shape;
		private var hit_car:Shape;
		private var hit_tire:Shape;
		hit_ladder
		*/	
		
		private function CreateLadderHit():void{
			hit_ladder = new Shape();
			hit_ladder.touchable = false;
			hit_ladder.graphics.beginFill(0x00ff00);
			
			hit_ladder.graphics.lineTo(512,134);	
			hit_ladder.graphics.lineTo(512+59,134);	
			hit_ladder.graphics.lineTo(512+59,134+155);	
			hit_ladder.graphics.lineTo(512,134+155);	
		
			hit_ladder.graphics.endFill(false);
			hit_ladder.alpha = 0.0;
			
			hit_ladder.graphics.precisionHitTest = true;	
			this.addChild(hit_ladder);
		}
		
		
		private function CreateStepsHit():void{
			hit_steps = new Shape();
			hit_steps.touchable = false;
			hit_steps.graphics.beginFill(0x00ff00);
			
			hit_steps.graphics.lineTo(387,269);	
			hit_steps.graphics.lineTo(488,270);	
			hit_steps.graphics.lineTo(521,351);	
			hit_steps.graphics.lineTo(431,352);	
						
			hit_steps.graphics.endFill(false);
			hit_steps.alpha = 0.0;
			
			hit_steps.graphics.precisionHitTest = true;	
			this.addChild(hit_steps);
		}
		
		private function CreateLamp01Hit():void{
			hit_lamp_01 = new Shape();
			hit_lamp_01.touchable = false;
			hit_lamp_01.graphics.beginFill(0x00ff00);
			
			hit_lamp_01.graphics.lineTo(677,29);	
			hit_lamp_01.graphics.lineTo(708,23);	
			hit_lamp_01.graphics.lineTo(738,36);	
			hit_lamp_01.graphics.lineTo(738,88);	
			hit_lamp_01.graphics.lineTo(701,104);	
			hit_lamp_01.graphics.lineTo(666,78);	
			
			hit_lamp_01.graphics.endFill(false);
			hit_lamp_01.alpha = 0.0;
			
			hit_lamp_01.graphics.precisionHitTest = true;	
			this.addChild(hit_lamp_01);
		}
		private function CreateLamp00Hit():void{
			hit_lamp_00 = new Shape();
			hit_lamp_00.touchable = false;
			hit_lamp_00.graphics.beginFill(0x00ff00);
			
			hit_lamp_00.graphics.lineTo(230,32);	
			hit_lamp_00.graphics.lineTo(248,5);	
			hit_lamp_00.graphics.lineTo(292,10);	
			hit_lamp_00.graphics.lineTo(301,46);	
			hit_lamp_00.graphics.lineTo(289,90);	
			hit_lamp_00.graphics.lineTo(241,91);	
			
			hit_lamp_00.graphics.endFill(false);
			hit_lamp_00.alpha = 0.0;
			
			hit_lamp_00.graphics.precisionHitTest = true;	
			this.addChild(hit_lamp_00);
		}
		
		
		private function CreateTireHit():void{
			hit_tire = new Shape();
			hit_tire.touchable = false;
			hit_tire.graphics.beginFill(0x00ff00);
			
			hit_tire.graphics.lineTo(240,389);	
			hit_tire.graphics.lineTo(258,345);	
			hit_tire.graphics.lineTo(295,343);	
			hit_tire.graphics.lineTo(306,375);	
			hit_tire.graphics.lineTo(292,419);	
			hit_tire.graphics.lineTo(266,424);	
			
			hit_tire.graphics.endFill(false);
			hit_tire.alpha = 0.0;
			
			hit_tire.graphics.precisionHitTest = true;	
			this.addChild(hit_tire);
		}
		
		private function CreateCarHit():void{
			hit_car = new Shape();
			hit_car.touchable = false;
			hit_car.graphics.beginFill(0x00ff00);
			
			hit_car.graphics.lineTo(205,233);	
			hit_car.graphics.lineTo(307,234);	
			hit_car.graphics.lineTo(336,312);	
			hit_car.graphics.lineTo(210,329);	
			
			hit_car.graphics.endFill(false);
			hit_car.alpha = 0.0;
			
			hit_car.graphics.precisionHitTest = true;	
			this.addChild(hit_car);
		}
		
		private function CreateSkyHit():void{
			hit_sky = new Shape();
			hit_sky.touchable = false;
			hit_sky.graphics.beginFill(0x00ff00);
			
			hit_sky.graphics.lineTo(0,0);	
			hit_sky.graphics.lineTo(116,0);	
			hit_sky.graphics.lineTo(109,130);	
			hit_sky.graphics.lineTo(0,145);	
			
			hit_sky.graphics.endFill(false);
			hit_sky.alpha = 0.0;
			
			hit_sky.graphics.precisionHitTest = true;	
			this.addChild(hit_sky);
		}
		
		private function CreateBuildingHit():void{
			hit_building = new Shape();
			hit_building.touchable = false;
			hit_building.graphics.beginFill(0x00ff00);
			
			hit_building.graphics.lineTo(133,0);	
			hit_building.graphics.lineTo(800,0);	
			hit_building.graphics.lineTo(800,213);	
			hit_building.graphics.lineTo(533,270);	
			hit_building.graphics.lineTo(143,209);	
			
			hit_building.graphics.endFill(false);
			hit_building.alpha = 0.0;
			
			hit_building.graphics.precisionHitTest = true;	
			this.addChild(hit_building);
		}
		
		private function CreateGroundHit():void{
			hit_ground = new Shape();
			hit_ground.touchable = false;
			hit_ground.graphics.beginFill(0x00ff00);
			
			hit_ground.graphics.lineTo(0,380);	
			hit_ground.graphics.lineTo(567,360);	
			hit_ground.graphics.lineTo(800,387);	
			hit_ground.graphics.lineTo(600,512);	
			hit_ground.graphics.lineTo(0,512);	
		
			hit_ground.graphics.endFill(false);
			hit_ground.alpha = 0.0;
			
			hit_ground.graphics.precisionHitTest = true;	
			this.addChild(hit_ground);
		}
		
		private function CreateTrunkHit(open:Boolean = false):void{
			hit_trunk = new Shape();		
			hit_trunk.x = 0;
			hit_trunk.y = 0;
			hit_trunk.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				
				hit_trunk.graphics.lineTo(89,364);	
				hit_trunk.graphics.lineTo(106,289);	
				hit_trunk.graphics.lineTo(134,231);	
				hit_trunk.graphics.lineTo(196,231);	
				hit_trunk.graphics.lineTo(210,392);	
				hit_trunk.graphics.lineTo(95,385);	
				
				
			}else{
				
				hit_trunk.graphics.lineTo(19,198);	
				hit_trunk.graphics.lineTo(51,183);	
				hit_trunk.graphics.lineTo(121,177);	
				hit_trunk.graphics.lineTo(191,216);	
				hit_trunk.graphics.lineTo(193,242);	
				hit_trunk.graphics.lineTo(108,244);	
				
				
			}
			
			hit_trunk.graphics.endFill(false);			
			hit_trunk.alpha = 0.0;			
			hit_trunk.graphics.precisionHitTest = true;	
			hit_trunk.touchable = false
			this.addChild(hit_trunk);
			
		}
		private function CreateFireEscapeHit(open:Boolean = false):void{
			hit_fire_escape = new Shape();		
			hit_fire_escape.x = 0;
			hit_fire_escape.y = 0;
			hit_fire_escape.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				
				hit_fire_escape.graphics.lineTo(341,1);	
				hit_fire_escape.graphics.lineTo(525,1);	
				hit_fire_escape.graphics.lineTo(573,79);	
				hit_fire_escape.graphics.lineTo(563,190);	
				hit_fire_escape.graphics.lineTo(538,190);	
				hit_fire_escape.graphics.lineTo(513,133);	
				hit_fire_escape.graphics.lineTo(338,118);	
				
				
			}else{
				
				hit_fire_escape.graphics.lineTo(341,1);	
				hit_fire_escape.graphics.lineTo(525,1);	
				hit_fire_escape.graphics.lineTo(573,79);	
				hit_fire_escape.graphics.lineTo(563,190);
				hit_fire_escape.graphics.lineTo(565,240);
				hit_fire_escape.graphics.lineTo(533,255);
				
				hit_fire_escape.graphics.lineTo(538,190);	
				hit_fire_escape.graphics.lineTo(513,133);	
				hit_fire_escape.graphics.lineTo(338,118);	
			
				
			}
			
			hit_fire_escape.graphics.endFill(false);			
			hit_fire_escape.alpha = 0.0;			
			hit_fire_escape.graphics.precisionHitTest = true;	
			hit_fire_escape.touchable = false
			this.addChild(hit_fire_escape);
			
		}
		
		private function CreateCarFrontDoorHit(open:Boolean = false):void{
			hit_car_front_door = new Shape();		
			hit_car_front_door.x = 0;
			hit_car_front_door.y = 0;
			hit_car_front_door.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				
				hit_car_front_door.graphics.lineTo(315,238);	
				hit_car_front_door.graphics.lineTo(348,239);	
				hit_car_front_door.graphics.lineTo(382,269);	
				hit_car_front_door.graphics.lineTo(402,327);	
				hit_car_front_door.graphics.lineTo(389,364);	
				hit_car_front_door.graphics.lineTo(353,369);	
				hit_car_front_door.graphics.lineTo(345,319);	
				
			}else{
				
				hit_car_front_door.graphics.lineTo(369,240);
				hit_car_front_door.graphics.lineTo(385,241);
				hit_car_front_door.graphics.lineTo(413,305);
				hit_car_front_door.graphics.lineTo(412,358);
				hit_car_front_door.graphics.lineTo(390,344);
				hit_car_front_door.graphics.lineTo(389,305);
				hit_car_front_door.graphics.lineTo(371,272);
				
			}
			
			hit_car_front_door.graphics.endFill(false);			
			hit_car_front_door.alpha = 0.0;			
			hit_car_front_door.graphics.precisionHitTest = true;	
			hit_car_front_door.touchable = false
			this.addChild(hit_car_front_door);
		}
		//hit_car_front_interior
		////hit_trunk_interior
		private function CreateTrunkInteriorHit():void{
			hit_trunk_interior = new Shape();
			hit_trunk_interior.touchable = false;
			hit_trunk_interior.graphics.beginFill(0x00ff00);
			
			hit_trunk_interior.graphics.lineTo(89,352);	
			hit_trunk_interior.graphics.lineTo(88,347);	
			hit_trunk_interior.graphics.lineTo(123,249);	
			hit_trunk_interior.graphics.lineTo(198,251);	
			hit_trunk_interior.graphics.lineTo(199,356);	
			
			
			hit_trunk_interior.graphics.endFill(false);
			hit_trunk_interior.alpha = 0.0;
			
			hit_trunk_interior.graphics.precisionHitTest = true;	
			this.addChild(hit_trunk_interior);
		}
		
		private function CreateDoorHit():void{
			hit_door = new Shape();
			hit_door.touchable = false;
			hit_door.graphics.beginFill(0x00ff00);
			
			hit_door.graphics.lineTo(386,166);	
			hit_door.graphics.lineTo(463,176);	
			hit_door.graphics.lineTo(468,286);	
			hit_door.graphics.lineTo(407,286);	
			hit_door.graphics.lineTo(390,250);	
			
			hit_door.graphics.endFill(false);
			hit_door.alpha = 0.0;
			
			hit_door.graphics.precisionHitTest = true;	
			this.addChild(hit_door);
		}

		
		private function CreateDumpsterHit():void{
			hit_dumpster = new Shape();
			hit_dumpster.touchable = false;
			hit_dumpster.graphics.beginFill(0x00ff00);
			
			hit_dumpster.graphics.lineTo(548,267);	
			hit_dumpster.graphics.lineTo(598,217);	
			hit_dumpster.graphics.lineTo(680,205);	
			hit_dumpster.graphics.lineTo(772,213);	
			hit_dumpster.graphics.lineTo(782,300);	
			hit_dumpster.graphics.lineTo(753,371);	
			hit_dumpster.graphics.lineTo(705,380);	
			hit_dumpster.graphics.lineTo(568,359);	
			
			hit_dumpster.graphics.endFill(false);
			hit_dumpster.alpha = 0.0;
			
			hit_dumpster.graphics.precisionHitTest = true;	
			this.addChild(hit_dumpster);
		}

		private function CreateCarInteriorHit():void{
			hit_car_front_interior = new Shape();
			hit_car_front_interior.touchable = false;
			hit_car_front_interior.graphics.beginFill(0x00ff00);
			
			hit_car_front_interior.graphics.lineTo(316,237);	
			hit_car_front_interior.graphics.lineTo(360,239);	
			hit_car_front_interior.graphics.lineTo(398,353);	
			hit_car_front_interior.graphics.lineTo(353,366);	
			hit_car_front_interior.graphics.lineTo(335,290);	
			
			hit_car_front_interior.graphics.endFill(false);
			hit_car_front_interior.alpha = 0.0;
			
			hit_car_front_interior.graphics.precisionHitTest = true;	
			this.addChild(hit_car_front_interior);
		}
		
		private function CreateExteriorHit():void{
			hit_exterior = new Shape();
			hit_exterior.touchable = false;
			hit_exterior.graphics.beginFill(0xff0000);
			
			hit_exterior.graphics.lineTo(0,195);	
			hit_exterior.graphics.lineTo(114,152);	
			hit_exterior.graphics.lineTo(121,236);	
			hit_exterior.graphics.lineTo(80,371);	
			hit_exterior.graphics.lineTo(0,373);	
			
			hit_exterior.graphics.endFill(false);
			hit_exterior.alpha = 0.0;
			
			hit_exterior.graphics.precisionHitTest = true;	
			this.addChild(hit_exterior);
		}
		
		private function CreateGrateHit():void{
			hit_grate = new Shape();
			hit_grate.touchable = false;
			hit_grate.graphics.beginFill(0xff0000);
			
			hit_grate.graphics.lineTo(395,399);	
			hit_grate.graphics.lineTo(538,383);	
			hit_grate.graphics.lineTo(623,416);	
			hit_grate.graphics.lineTo(593,439);	
			hit_grate.graphics.lineTo(476,451);	
			
			hit_grate.graphics.endFill(false);
			hit_grate.alpha = 0.0;
			
			hit_grate.graphics.precisionHitTest = true;	
			this.addChild(hit_grate);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						
						if(hit_trunk.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							TrunkHandler();
							return;
						}
						else if(hit_exterior.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WetSteps();
							FadeOut((Exterior as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorObj,true
							);
							return;
						}else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(RoboticsDoorOpen === false){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The door is locked.");
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoor();
							}else{
								FadeOut((RoboticsRoom as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.RoboticsRoomObj,true
								);
							}
							return;
						}else if(hit_dumpster.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WetSteps();
							FadeOut((ExteriorRearDumpster as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorRearDumpsterObj,true
							);
							return;
						}else if(hit_grate.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WetSteps();
							FadeOut((ExteriorGrate as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorGrateObj,true
							);
							return;
						}else if(hit_car_front_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CarFrontDoorHandler();
							return;
							hit_ladder
						}else if(hit_ladder.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(LadderDown === true){
								//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BarrelKickDeep();
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpenTwo();
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ladder();
								trace("Bark 02x");
								FadeOut((ExteriorFireEscape as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorFireEscapeObj,true
								);
								return;
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The ladder to the fire escape is pulled up. I can't reach it.");
								return;
							}				
						}else if(hit_fire_escape.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(LadderDown === true){
								//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BarrelKickDeep();
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpenTwo();
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ladder();
								trace("Bark 02");
								FadeOut((ExteriorFireEscape as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorFireEscapeObj,true
								);
								return;
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The ladder to the fire escape is pulled up. I can't reach it.");
								return;
							}									
						}else if(hit_sky.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The darkness feels thick and oppressive this evening...");
							return;
						}else if(CarDoorOpen === true){
							if(hit_car_front_interior.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((ExteriorCarFront as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorCarFrontObj,true
								);
								return;
							}
						}
						if(TrunkOpen === true){
							if(hit_trunk_interior.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((ExteriorCarRear as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorCarRearObj,true
								);
								return;
							}
						}
						if(hit_car.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CarHandler();
							return;
						}
						else if(hit_lamp_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LampHandler();
							return;
						}else if(hit_lamp_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LampHandler();
							return;
						}
						else if(hit_tire.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The van has thick all-terrain tires.");
							return;
						}
						else if(hit_ground.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							GroundHandler();
							return;
						}else if(hit_building.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BuildingHandler();
							return;
						}else if(hit_steps.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The steps are slippery with mud and grime.");
							return;
						}
						
					}
				}
			}
		}
		private function LampHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The lamps hum quietly.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The yellow light scatters in the thick damp air.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The street lamp flickers gently.");
			}
		}
		
		
		private function CarHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'\Chimera\'... must be the name of the company that owns the facility.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The van is out-fitted with emergency lights and many small diodes.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The vehicle looks highly specialized.");
			}
		}
		
		private function BuildingHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The building appears to have a very solid construction.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Pipes and vents grope their way up the walls.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The walls are slick and damp.");
			}
		}
		
		private function GroundHandler():void{
			
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The pavement back here is severely cracked.");
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Gravel and bits of broken asphalt are strewn across the ground.");
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Small puddles dot the broken dirty pavement.");
				}
		}
		
		private function TrunkHandler():void{
			if(TrunkUnlocked === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_BoltCutters)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClinkOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CarDoorOpen();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear;
					}
					SaveArray['TrunkUnlocked'] = 'Yes';
					SaveArray['TrunkOpen'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorRear',SaveArray);	
					
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_BoltCutters,
							"item_BoltCutters"
						);
					
					TrunkUnlocked = true;
					TrunkOpen = true;
					van_rear_door_closed.texture = this.assets.getTexture('van_rear_unlocked')
					van_rear_door_closed.alpha = 0;
					van_rear_door_open.alpha = 1;
				
					hit_trunk.graphics.clear();
					CreateTrunkHit(true);
					CreateTrunkInteriorHit();
					
					
				
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoorTwo();
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The rear of the van is padlocked shut.");
				}
				
			}else{
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear;
				}
				
				if(TrunkOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CarDoorOpen();
					TrunkOpen = true;
					
					van_rear_door_closed.alpha = 0;
					van_rear_door_open.alpha = 1;
					
					hit_trunk.graphics.clear();
					CreateTrunkHit(true);
					
					SaveArray['TrunkOpen'] = 'Yes';
					CreateTrunkInteriorHit();
					
				
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CarDoorClose();
					
					TrunkOpen = false;
					
					van_rear_door_closed.alpha = 1;
					van_rear_door_open.alpha = 0;
					hit_trunk_interior.graphics.clear();
					hit_trunk_interior = null;
					hit_trunk.graphics.clear();
					CreateTrunkHit(false);
					SaveArray['TrunkOpen'] = 'No';
					
				}
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorRear',SaveArray);	
				
			}
		}
		
		private function CarFrontDoorHandler():void{
			if(CarDoorOpen === false){
				if(CarDoorUnlocked === false){
					if((stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.armedItem
						== 
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.inventoryBarObj
						.item_CarKeys)
					{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CarDoorOpen();
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
				/*		(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_CarKeys,
								"item_CarKeys"
							);
				*/		
						van_door.alpha = 1;
						hit_car_front_door.graphics.clear();
						CreateCarFrontDoorHit(true);
						CreateCarInteriorHit();
						CarDoorOpen = true;
						CarDoorUnlocked = true;
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear;
						}
						SaveArray['CarFrontDoor'] = 'Open';
						SaveArray['CarFrontUnlocked'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorRear',SaveArray);	
						
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CarLocked();
						
						

						if(RONum == 0){
							RONum = 1;
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The van is locked.");
						}else if(RONum == 1){
							RONum = 2;
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It's dark inside the car, I cannot see much through the window...");
						}else if(RONum == 2){
							RONum = 0;
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CarAlarm();
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Oops!");
						}
						
						
						
					}
					
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CarDoorOpen();
					van_door.alpha = 1;
					hit_car_front_door.graphics.clear();
					CreateCarFrontDoorHit(true);
					CarDoorOpen = true;
					
					CreateCarInteriorHit();
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear;
					}
					SaveArray['CarFrontDoor'] = 'Open';
				}
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CarDoorClose();
				van_door.alpha = 0;
				hit_car_front_door.graphics.clear();
				hit_car_front_interior.graphics.clear();
				CreateCarFrontDoorHit(false);
				CarDoorOpen = false;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear;
				}
				SaveArray['CarFrontDoor'] = 'Closed';
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
			
			
			
			this.assets.removeTexture("exteriorRear_bg",true);
			this.assets.removeTexture("ExteriorRear_Sprite_01",true);
			this.assets.removeTextureAtlas("ExteriorRear_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("exteriorRear_01");
			(stage.getChildAt(0) as Object).falseAsset("exteriorRear_02");
			(stage.getChildAt(0) as Object).falseAsset("exteriorRear_03");
			
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
