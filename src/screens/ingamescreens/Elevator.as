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
	import starling.utils.AssetManager;
	
	public class Elevator extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		public var SaveArray2:Array = new Array();
		
		private var bg:Image;
		private var exterior_bg:Image;
		private var elevator_hood:Image;
		private var top_light:Image;
		private var fuse_panel:Image;
		private var panel_fuse_red:Image;
		private var panel_fuse_green:Image;
		private var panel_fuse_blue:Image;
		private var fuse_lights_red:Image;
		private var fuse_lights_green:Image;
		private var fuse_lights_blue:Image;
		
		private var button_panel:Image;
		private var button_01:Image;
		private var button_02:Image;
		private var button_03:Image;
		
		private var floor_panel:Image;
		private var screen:Image;
		
		
		private var doorsOpen_mc:MovieClip;
		private var doorsClose_mc:MovieClip;
		
		
		private var hit_door:Shape;
		private var hit_panel:Shape;
		private var hit_fusebox:Shape;
		private var hit_floor_panel:Shape;
		private var hit_emergency:Shape;
		
		private var SelectedFloor:int = 1;
		private var PrevFloor:int = 1;
		
		private var DoorOpen:Boolean = false;
		private var FuseBoxUnlocked:Boolean = false;
		private var FuseBoxOpen:Boolean = false;
		private var Animating:Boolean = false;
		private var FuseSolved:Boolean = false;
		private var SwitchedOn:Boolean = false;
		
		private var openBookbg:Shape;
		
		
		private var EmergencyIsOpen:Boolean = false;
		private var openEmergency:Sprite;
		private var openEmergencyPages:Image;
		private var soundWave:Image;
		private var hit_openEmergency:Shape;
		private var hit_openHeadSet:Shape;
		public var OpenEmergencyTween:Tween;
		public var soundWaveTween:Tween;
		
		private var delayedCall:DelayedCall;
		
		private var GreenHouseDoorOpen:Boolean = false;
		
		private var goback:GoBackButton;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
	
		public function Elevator(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('elevator_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Elevator/Elevator_Sprite_01.png'));
				game.TrackAssets('elevator_01');
			}
			if(game.CheckAsset('elevator_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Elevator/Elevator_Sprite_01.xml'));
				game.TrackAssets('elevator_02');
			}
			if(game.CheckAsset('elevator_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Elevator/Elevator_Sprite_02.jpg'));
				game.TrackAssets('elevator_03');
			}
			if(game.CheckAsset('elevator_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Elevator/Elevator_Sprite_02.xml'));
				game.TrackAssets('elevator_04');
			}
			if(game.CheckAsset('elevator_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Elevator/Elevator_Sprite_03.png'));
				game.TrackAssets('elevator_05');
			}
			if(game.CheckAsset('elevator_06') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Elevator/Elevator_Sprite_03.xml'));
				game.TrackAssets('elevator_06');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("Elevator","ElevatorObj");
				} 				
			});	
				
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ThirdFloorHall',SaveArray);
			
			bg = new Image(this.assets.getTexture('elevator_bg'));
			bg.x = 0;
			bg.y = 0;
			bg.width = 800;
			bg.height = 512;
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			exterior_bg = new Image(this.assets.getTexture('bg_1st_floor'));
			exterior_bg.touchable = false;
			exterior_bg.x = 183;
			exterior_bg.y = 100;
			
			doorsOpen_mc = new MovieClip(this.assets.getTextures('e_door_frame_0'),12);
			//	elevator_mc.smoothing = TextureSmoothing.NONE;
			doorsOpen_mc.x = 178;
			doorsOpen_mc.y = 100;
			doorsOpen_mc.touchable = false;
			doorsOpen_mc.loop = false; 
			
			
			doorsClose_mc = new MovieClip(this.assets.getTextures('e_door_frame_0').reverse(),12);
			//	elevator_mc.smoothing = TextureSmoothing.NONE;
			doorsClose_mc.x = 178;
			doorsClose_mc.y = 100;
			doorsClose_mc.touchable = false;
			doorsClose_mc.loop = false; 
			
			
			elevator_hood = new Image(this.assets.getTexture('elevator_hood_bg'));
			elevator_hood.touchable = false;
			elevator_hood.x = 0;
			elevator_hood.y = 0;
			
			top_light = new Image(this.assets.getTexture('top_light'));
			top_light.touchable = false;
			top_light.x = 297;
			top_light.y = 45;
			/*
			private var fuse_fuse_red:Image;
			private var fuse_fuse_green:Image;
			private var fuse_fuse_blue:Image;
			*/
			
			panel_fuse_red = new Image(this.assets.getTexture('panel_fuse_red'));
			panel_fuse_red.touchable = false;
			panel_fuse_red.x = 480;
			panel_fuse_red.y = 340;
			
			panel_fuse_green = new Image(this.assets.getTexture('panel_fuse_green'));
			panel_fuse_green.touchable = false;
			panel_fuse_green.x = 516;
			panel_fuse_green.y = 326;
			
			panel_fuse_blue = new Image(this.assets.getTexture('panel_fuse_blue'));
			panel_fuse_blue.touchable = false;
			panel_fuse_blue.x = 552;
			panel_fuse_blue.y = 355;
			
			fuse_lights_red = new Image(this.assets.getTexture('fuse_lights_red'));
			fuse_lights_red.touchable = false;
			fuse_lights_red.x = 486;
			fuse_lights_red.y = 328;
			
			fuse_lights_green = new Image(this.assets.getTexture('fuse_lights_green'));
			fuse_lights_green.touchable = false;
			fuse_lights_green.x = 521;
			fuse_lights_green.y = 328;
			
			fuse_lights_blue = new Image(this.assets.getTexture('fuse_lights_blue'));
			fuse_lights_blue.touchable = false;
			fuse_lights_blue.x = 552;
			fuse_lights_blue.y = 327;
			
			
			fuse_panel = new Image(this.assets.getTexture('fuse_panel'));
			fuse_panel.touchable = false;
			fuse_panel.x = 479;
			fuse_panel.y = 312;
			
			button_panel = new Image(this.assets.getTexture('button_panel'));
			button_panel.touchable = false;
			button_panel.x = 480;
			button_panel.y = 194;
			
			button_01 = new Image(this.assets.getTexture('button_panel_1st'));
			button_01.touchable = false;
			button_01.x = 493;
			button_01.y = 256;
			
			button_02 = new Image(this.assets.getTexture('button_panel_2nd'));
			button_02.touchable = false;
			button_02.x = 493;
			button_02.y = 229;
			
			button_03 = new Image(this.assets.getTexture('button_panel_3rd'));
			button_03.touchable = false;
			button_03.x = 493;
			button_03.y = 202;
			
			floor_panel = new Image(this.assets.getTexture('off_panel_fuse'));
			floor_panel.touchable = false;
			floor_panel.x = 543;
			floor_panel.y = 360;
			
			screen = new Image(this.assets.getTexture('screen_1st'));
			screen.touchable = false;
			screen.x = 482;
			screen.y = 105;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){
				trace("MARSH HOUSE 00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall['GreenHouseDoorOpen'] == 'Yes'){
					trace("MARSH HOUSE 01");
					GreenHouseDoorOpen = true;
				}
			}
		
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['RedAttached'] == 'Yes'){
					fuse_lights_red.alpha = 1;
					panel_fuse_red.alpha = 1;
				}else{
					fuse_lights_red.alpha = 0;
					panel_fuse_red.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['GreenAttached'] == 'Yes'){
					fuse_lights_green.alpha = 1;
					panel_fuse_green.alpha = 1;
				}else{
					fuse_lights_green.alpha = 0;
					panel_fuse_green.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['BlueAttached'] == 'Yes'){
					fuse_lights_blue.alpha = 1;
					panel_fuse_blue.alpha = 1;
				}else{
					fuse_lights_blue.alpha = 0;
					panel_fuse_blue.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Solved'] == 'Yes'){
					FuseSolved = true;
				}
				
			}else{
				panel_fuse_blue.alpha = 0;
				panel_fuse_red.alpha = 0;
				panel_fuse_green.alpha = 0;
				fuse_lights_blue.alpha = 0;
				fuse_lights_red.alpha = 0;
				fuse_lights_green.alpha = 0;
			}
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel['Floor'] != undefined){
					SelectedFloor = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel['Floor'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel['PrevFloor'] != undefined){
					PrevFloor = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel['PrevFloor'];
				}
			}else{
				
			}
			
			if(SelectedFloor == 2){
				exterior_bg.texture = this.assets.getTexture('bg_2nd_floor');
				screen.texture = this.assets.getTexture('screen_2nd');
			}else if(SelectedFloor == 3){
				trace("MARSH HOUSE 02");
				if(GreenHouseDoorOpen === false){
					exterior_bg.texture = this.assets.getTexture('bg_3rd_floor_doorClosed');
					trace("MARSH HOUSE 03");
				}else{
					exterior_bg.texture = this.assets.getTexture('bg_3rd_floor');
					trace("MARSH HOUSE 04");
				}
				
				screen.texture = this.assets.getTexture('screen_3rd');
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator != undefined){			
				
				//SwitchedOn
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator['ComingFrom'] == 'Yes'){
					top_light.alpha = 1;
					doorsOpen_mc.alpha = 0;	
					doorsClose_mc.alpha = 1;
					
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator;
					SaveArray['ComingFrom'] = 'No';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Elevator',SaveArray);
					Animating = true;
					Starling.juggler.delayCall(function():void{
						trace('ANGER');
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorOpen();
						DoorOpen = false;
						doorsClose_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onDoorCloseEnterFrame);
						doorsClose_mc.alpha = 1;
						doorsOpen_mc.alpha = 0;
						
						doorsClose_mc.play();
						Starling.juggler.add(doorsClose_mc);
						//	Starling.juggler.add(elevator_mc);
					},1.25);
					
					
					
				}else{
					top_light.alpha = 0;
					doorsOpen_mc.alpha = 1;	
					doorsClose_mc.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator['FusePanelUnlocked'] == 'Yes'){
					FuseBoxUnlocked = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator['FusePanel'] == 'open'){
						FuseBoxOpen= true;
						fuse_panel.alpha = 0;
						floor_panel.alpha = 1;
					}else{
						
						fuse_panel.alpha = 1;
						floor_panel.alpha = 0;
					}
				}else{
					fuse_panel.alpha = 1;
					floor_panel.alpha = 0;
					
				
				}
				
				if(FuseSolved === true){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator['SwitchedOn'] == 'Yes'){
						SwitchedOn = true;
						button_panel.alpha = 1;
						button_01.alpha = 1;
						button_02.alpha = 1;
						button_03.alpha = 1;
						
						screen.alpha = 1;
						
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator['WorkFirstTime'] == 'Yes'){
							
						}else{
							if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
								SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator;
								SaveArray['WorkFirstTime'] = 'Yes';
								
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Elevator',SaveArray);
								
								Starling.juggler.delayCall(function():void{
									(stage.getChildAt(0) as Object).MusicObj.LoadJamLoop(true,4);
									
								},0.5);
							}
						}
						
					}else{
						button_panel.alpha = 1;
						button_01.alpha = 0;
						button_02.alpha = 0;
						button_03.alpha = 0;
						
						screen.alpha = 0;
						Animating = true;
						SwitchedOn = true;
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator;
						SaveArray['SwitchedOn'] = 'Yes';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Elevator',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							SwitchOnElevator();
						},2);
					}
				}else{
					button_panel.alpha = 1;
					button_01.alpha = 0;
					button_02.alpha = 0;
					button_03.alpha = 0;
					
					screen.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator['MoveElevator'] == 'Yes'){
					
				}
				//FusePanelUnlocked
				
					//FusePanel
			}else{			
				trace("SMART");
				top_light.alpha = 1;
				doorsOpen_mc.alpha = 0;	
				doorsClose_mc.alpha = 1;
				fuse_panel.alpha = 1;
				floor_panel.alpha = 0;
				
				button_panel.alpha = 1;
				button_01.alpha = 0;
				button_02.alpha = 0;
				button_03.alpha = 0;
				
				screen.alpha = 0;
				
				SaveArray['ComingFrom'] = 'None';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Elevator',SaveArray);
				Animating = true;
				Starling.juggler.delayCall(function():void{
					trace('ANGER');
					
					DoorOpen = false;
					doorsClose_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onDoorCloseEnterFrame);
					doorsClose_mc.alpha = 1;
					doorsOpen_mc.alpha = 0;
					
					doorsClose_mc.play();
					Starling.juggler.add(doorsClose_mc);
					//	Starling.juggler.add(elevator_mc);
				},1.25);
			}
			
			
		
			if(SelectedFloor != PrevFloor){
				if(PrevFloor == 1){
					screen.texture = this.assets.getTexture('screen_up');
				}else if(PrevFloor == 2){
					if(SelectedFloor == 1){
						screen.texture = this.assets.getTexture('screen_down');
					}else{
						screen.texture = this.assets.getTexture('screen_up');						
					}
				}else if(PrevFloor == 3){
					screen.texture = this.assets.getTexture('screen_down');
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel != undefined){
					SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel;
				}
				SaveArray2['PrevFloor'] = SelectedFloor;
				
				
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElevatorPanel',SaveArray2);
				
				PrevFloor = SelectedFloor;
				Animating = true;
				
				Starling.juggler.delayCall(function():void{
					MoveElevator();
				},3);
				
			}
			
		
			//GreenHouseDoorOpen
			
			this.addChildAt(exterior_bg,1);
			this.addChildAt(doorsOpen_mc,2);	
			this.addChildAt(doorsClose_mc,3);	
			this.addChildAt(elevator_hood,4);
			this.addChildAt(top_light,5);
			this.addChildAt(panel_fuse_blue,6);
			this.addChildAt(panel_fuse_red,7);
			this.addChildAt(panel_fuse_green,8);
			this.addChildAt(fuse_lights_blue,9);
			this.addChildAt(fuse_lights_red,10);
			this.addChildAt(fuse_lights_green,11);			
			this.addChildAt(fuse_panel,12);
			this.addChildAt(button_panel,13);
			this.addChildAt(button_01,14);
			this.addChildAt(button_02,15);
			this.addChildAt(button_03,16);
			this.addChildAt(floor_panel,17);
			this.addChildAt(screen,18);
			
			CreateFloorPanelHit();
			CreateFuseBoxHit();
			CreatePanelHit();
			CreateEmergencyHit();
			CreateDoorHit();
			
		//	goback = new GoBackButton(this.assets);
			goback = new GoBackButton(this.assets);
			
		
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator["Emergency"] == "open"){
					trace("SURF 3");
					EmergencyIsOpen = true;
					OpenEmergency();
					
				//	this.addChild(goback);
				}else{
					trace("SURF 1");
				}
			}else{
				trace("SURF 2");
			}
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadBasementBongs(true,999);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BuildingHum",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
			
		}
		
		private function MoveElevator():void{
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorOpen();
			if(SelectedFloor == 1){
				screen.texture = this.assets.getTexture('screen_1st');
			}else if(SelectedFloor == 2){
				screen.texture = this.assets.getTexture('screen_2nd');
			}else if(SelectedFloor == 3){
				screen.texture = this.assets.getTexture('screen_3rd');
				
					
			
			}
			
			trace('ANGER');
			top_light.alpha = 1;
			Animating = true;
			DoorOpen = true;
			
			doorsOpen_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onDoorOpenEnterFrame);
			doorsOpen_mc.alpha = 1;
			doorsClose_mc.alpha = 0;
			
			doorsOpen_mc.play();
			Starling.juggler.add(doorsOpen_mc);
			//	Starling.juggler.add(elevator_mc);
		}
		
		
		private function SwitchOnElevator():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator['WorkFirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator;
						SaveArray['WorkFirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Elevator',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadJamLoop(true,4);
							
						},0.5);
					}
				}
			}
			Animating = false;
			button_panel.alpha = 1;
			button_01.alpha = 1;
			button_02.alpha = 1;
			button_03.alpha = 1;
			
			screen.alpha = 1;
		}
		
		private function CreateEmergencyHit():void{
			hit_emergency = new Shape();
			hit_emergency.touchable = false;
			hit_emergency.graphics.beginFill(0xff0000);
			
			hit_emergency.graphics.lineTo(629,190);	
			hit_emergency.graphics.lineTo(692,183);	
			hit_emergency.graphics.lineTo(690,289);	
			hit_emergency.graphics.lineTo(633,284);	
			
			
			hit_emergency.graphics.endFill(false);
			hit_emergency.alpha = 0.0;
			
			hit_emergency.graphics.precisionHitTest = true;	
			this.addChild(hit_emergency);
		}
		
		private function CreateFloorPanelHit():void{
			hit_floor_panel = new Shape();
			hit_floor_panel.touchable = false;
			hit_floor_panel.graphics.beginFill(0xff0000);
			
			hit_floor_panel.graphics.lineTo(538,489);	
			hit_floor_panel.graphics.lineTo(554,404);	
			hit_floor_panel.graphics.lineTo(600,354);	
			hit_floor_panel.graphics.lineTo(686,373);	
			hit_floor_panel.graphics.lineTo(697,392);	
			hit_floor_panel.graphics.lineTo(697,512);	
			hit_floor_panel.graphics.lineTo(584,512);	
			
			hit_floor_panel.graphics.endFill(false);
			hit_floor_panel.alpha = 0.0;
			
			hit_floor_panel.graphics.precisionHitTest = true;	
			this.addChild(hit_floor_panel);
		}
		
		private function CreateFuseBoxHit():void{
			hit_fusebox = new Shape();
			hit_fusebox.touchable = false;
			hit_fusebox.graphics.beginFill(0xff0000);
			
			hit_fusebox.graphics.lineTo(474,307);	
			hit_fusebox.graphics.lineTo(589,308);	
			hit_fusebox.graphics.lineTo(588,402);	
			hit_fusebox.graphics.lineTo(475,408);	
			
			hit_fusebox.graphics.endFill(false);
			hit_fusebox.alpha = 0.0;
			
			hit_fusebox.graphics.precisionHitTest = true;	
			this.addChild(hit_fusebox);
		}
		
		private function CreatePanelHit():void{
			hit_panel = new Shape();
			hit_panel.touchable = false;
			hit_panel.graphics.beginFill(0xff0000);
			
			hit_panel.graphics.lineTo(475,188);	
			hit_panel.graphics.lineTo(588,192);	
			hit_panel.graphics.lineTo(588,288);	
			hit_panel.graphics.lineTo(476,288);	
			
			hit_panel.graphics.endFill(false);
			hit_panel.alpha = 0.0;
			
			hit_panel.graphics.precisionHitTest = true;	
			this.addChild(hit_panel);
		}
		
		private function CreateDoorHit():void{
			hit_door = new Shape();
			hit_door.touchable = false;
			hit_door.graphics.beginFill(0xff0000);
			
			hit_door.graphics.lineTo(181,98);	
			hit_door.graphics.lineTo(431,110);	
			hit_door.graphics.lineTo(429,465);	
			hit_door.graphics.lineTo(182,477);	
			
			hit_door.graphics.endFill(false);
			hit_door.alpha = 0.0;
			
			hit_door.graphics.precisionHitTest = true;	
			this.addChild(hit_door);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if(touches.length > 0){			
				if(touches[0].phase == TouchPhase.ENDED) {
					trace(touches[0].globalX+" ,"+touches[0].globalY);
					if(Animating === false){
						if(EmergencyIsOpen === false){
							
							if(hit_panel.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((ElevatorPanel as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ElevatorPanelObj,true
								);
							}else if(hit_fusebox.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(FuseBoxUnlocked === false){
									FuseBoxHandler();
								}else{
									if(FuseBoxOpen === false){
										OpenFuseBox();
									}else{
										if(FuseSolved === false){
											FadeOut((ElevatorFuse as Class), 
												(stage.getChildAt(0) as Object).screenGamePlayHandler.ElevatorFuseObj,true
											);
										}else{
											(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'm think I'm done with the elevator's fuses.");
											
										}
										
									}
									
								}
							}else if(hit_floor_panel.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(FuseBoxOpen === false){
									
								}else{
									CloseFuseBox();
								}
								
							}else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(DoorOpen === false){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorOpen();
									trace('ANGER');
									top_light.alpha = 1;
									Animating = true;
									DoorOpen = true;
									doorsOpen_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onDoorOpenEnterFrame);
									doorsOpen_mc.alpha = 1;
									doorsClose_mc.alpha = 0;
									
									doorsOpen_mc.play();
									Starling.juggler.add(doorsOpen_mc);
								}else{
									if(SelectedFloor == 1){
										GoToFloorLobbyHandler();
									}else if(SelectedFloor == 2){
										GoToSecondFloorHandler();
										
									}else if(SelectedFloor == 3){
										GoToThirdFloorHandler();
									}
								}
							}else if(hit_emergency.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								EmergencyIsOpen = true;
								OpenEmergency(true, 0)
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator;
								}		
								SaveArray['Emergency'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Elevator',SaveArray);
							}
						}else{
							if(targ == goback.SourceImage){
								//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();									
								RemoveEmergency();
								Animating = true;
								EmergencyIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator;
								}		
								SaveArray['Emergency'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Elevator',SaveArray);
							}else if(hit_openEmergency.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Repeating tones are coming from the speaker...");	
							}else if(hit_openHeadSet.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();									
								RemoveEmergency();
								Animating = true;
								EmergencyIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator;
								}		
								SaveArray['Emergency'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Elevator',SaveArray);
							}
						}
					
					} 
				}
			}
		}
		
		private function CloseFuseBox():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxTwo_Close();
			FuseBoxOpen = false;
			fuse_panel.alpha = 1;
			floor_panel.alpha = 0;
		}
		
		private function OpenFuseBox():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxTwo_Open();
			FuseBoxOpen = true;
			fuse_panel.alpha = 0;
			floor_panel.alpha = 1;
		}
		
		private function FuseBoxHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_AllenWrench)
			{
				Animating = true;
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RemoveNail3x();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ScrewDropX4();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator;
				}
				SaveArray['FusePanelUnlocked'] = 'Yes';
				SaveArray['FusePanel'] = 'open';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Elevator',SaveArray);
				
				FuseBoxUnlocked = true;
				FuseBoxOpen = true;
			//	fuse_panel.alpha = 0;
			//	floor_panel.alpha = 1;
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_AllenWrench,
						"item_AllenWrench"
					);
				Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
					OpenFuseBox();
					Animating = false;
				},3);
				
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The panel is attached by four bolts with six-sided hollows.");
				
			}
		}
		
		
		private function GoToThirdFloorHandler():void{ 
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){
				SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall;
			}
			
			SaveArray2['ComingFromElevator'] = 'Yes';
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ThirdFloorHall',SaveArray2);
			
			FadeOut((ThirdFloorHall as Class), 
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ThirdFloorHallObj,true
			);
		}
		
		private function GoToSecondFloorHandler():void{ 
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
				SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall;
			}
			
			SaveArray2['ComingFromElevator'] = 'Yes';
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorHall',SaveArray2);
			
			FadeOut((SecondFloorHall as Class), 
				(stage.getChildAt(0) as Object).screenGamePlayHandler.SecondFloorHallObj,true
			);
		}
		private function GoToFloorLobbyHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby != undefined){
				SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
			}
			
			SaveArray2['ComingFromElevator'] = 'Yes';
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lobby',SaveArray2);
			
			FadeOut((Lobby as Class), 
				(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyObj,true
			);
		}
		private function onDoorOpenEnterFrame():void{
			trace("E Open ENTER FRAME");
			if(doorsOpen_mc.currentFrame == 3){
				trace('open frame 3');
			//	top_light.alpha = 0;
				doorsOpen_mc.alpha = 0;
				doorsClose_mc.alpha = 1;
				
				doorsOpen_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onDoorOpenEnterFrame);
				doorsOpen_mc.stop();
				Animating = false;
				trace('open frame 4');
				
				delayedCall = new DelayedCall(PlayClose,3)
				
				Starling.juggler.add(delayedCall);
			/*	if(SelectedFloor == 1){
					GoToFloorLobbyHandler();
				}else if(SelectedFloor == 2){
					FadeOut((SecondFloorHall as Class), 
						(stage.getChildAt(0) as Object).screenGamePlayHandler.SecondFloorHallObj,true
					);
				}else if(SelectedFloor == 3){
					FadeOut((ThirdFloorHall as Class), 
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ThirdFloorHallObj,true
					);
				}
			*/
					
			}
			if(doorsOpen_mc.currentFrame == 4){				
				
			}
		}
		private function PlayClose():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorClose();
			trace('ANGER');
			top_light.alpha = 1;
			Animating = true;
			DoorOpen = false;
			doorsClose_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onDoorCloseEnterFrame);
			doorsClose_mc.alpha = 1;
			
			doorsClose_mc.play();
			Starling.juggler.add(doorsClose_mc);
		}
		
		private function onDoorCloseEnterFrame():void{
			trace("E CLOSE ENTER FRAME");
			if(doorsClose_mc.currentFrame == 3){
				trace('close frame 3');
				top_light.alpha = 0;
				doorsOpen_mc.alpha = 1;
				doorsClose_mc.alpha = 0;
				doorsClose_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onDoorCloseEnterFrame);
				
				doorsClose_mc.stop();
				Animating = false;
				trace('close frame 4');
			
			}
			if(doorsClose_mc.currentFrame == 4){				
				
			}
		}
		/*
		
		private var openBookbg:Shape;
		private var EmergencyIsOpen:Boolean = false;
		private var openEmergency:Sprite;
		private var openEmergencyPages:Image;
		private var soundWave:Image;
		private var hit_openEmergency:Shape;
		private var hit_openHeadSet:Shape;
		public var OpenEmergencyTween:Tween;
		public var soundWaveTween:Tween;
		*/
		private function OpenEmergency(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openEmergency = new Sprite();
			openEmergency.alpha = 0;
			CreateOpenBookBg();
			openEmergencyPages = new Image(this.assets.getTexture('emergency_panel'));
			openEmergencyPages.x = 457;
			openEmergencyPages.y = 45;
			
			soundWave = new Image(this.assets.getTexture('waves'));
			soundWave.x = 0;
			soundWave.y = 36;
			soundWave.alpha = 0;
			
			this.openEmergency.addChildAt(openBookbg,0);
			this.openEmergency.addChildAt(openEmergencyPages,1);
			this.openEmergency.addChildAt(soundWave,2);
			this.openEmergency.addChildAt(goback,3);
			openEmergencyPages.touchable = false;
			
			this.addChildAt(openEmergency,19);
			
			
			
			if(Fade === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MorseTwo();	
				openEmergencyPages.alpha = 1;
				soundWave.alpha = 1;
				CreateOpenEmergencyHit();
				CreateOpenHeadSetHit();
				openEmergency.alpha = 1;
				Animating = false;
				//	CreateOpenNotePadHit();
			}else{
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('morse_two');
				OpenEmergencyTween = new Tween(openEmergency, 0.5, Transitions.LINEAR);
				OpenEmergencyTween.fadeTo(1);
				OpenEmergencyTween.onComplete = function():void{
					//		CreateOpenNotePadHit();
					
					FadeInSoundWave();
					
				};
				Starling.juggler.add(OpenEmergencyTween);	
				
			}
			//	CreateOpenBookHit(page);
		}
		
		public function FadeInSoundWave():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MorseTwo();	
			soundWaveTween = new Tween(soundWave, 1, Transitions.LINEAR);
			soundWaveTween.fadeTo(1);
			soundWaveTween.onComplete = function():void{
				//		CreateOpenNotePadHit();
				CreateOpenEmergencyHit();
				CreateOpenHeadSetHit();
				Animating = false; 
			};
			
			Starling.juggler.add(soundWaveTween);	
		}
		//hit_openHeadSet
		private function CreateOpenHeadSetHit():void{
			hit_openHeadSet = new Shape();
			this.addChild(hit_openHeadSet);
			hit_openHeadSet.graphics.beginFill(0x0000FF);
			hit_openHeadSet.graphics.lineTo(458,62);	
			hit_openHeadSet.graphics.lineTo(655,48);	
			hit_openHeadSet.graphics.lineTo(772,131);	
			hit_openHeadSet.graphics.lineTo(770,376);	
			hit_openHeadSet.graphics.lineTo(602,432);	
			hit_openHeadSet.graphics.lineTo(456,417);	
			
			
			hit_openHeadSet.graphics.endFill(false);
			hit_openHeadSet.alpha = 0.0;
			hit_openHeadSet.touchable = false;
			hit_openHeadSet.graphics.precisionHitTest = true;	
		}
		
		private function CreateOpenEmergencyHit():void{
			hit_openEmergency = new Shape();
			this.addChild(hit_openEmergency);
			hit_openEmergency.graphics.beginFill(0x00ff00);
			hit_openEmergency.graphics.lineTo(5,85);	
			hit_openEmergency.graphics.lineTo(65,32);	
			hit_openEmergency.graphics.lineTo(463,32);	
			hit_openEmergency.graphics.lineTo(523,81);	
			hit_openEmergency.graphics.lineTo(627,387);	
			hit_openEmergency.graphics.lineTo(556,454);	
			hit_openEmergency.graphics.lineTo(150,455);	
			hit_openEmergency.graphics.lineTo(70,384);	
		
			
			hit_openEmergency.graphics.endFill(false);
			hit_openEmergency.alpha = 0.0;
			hit_openEmergency.touchable = false;
			hit_openEmergency.graphics.precisionHitTest = true;	
		}
		private function RemoveEmergency():void{
			(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("MorseTwo");
			
			Animating = true;
			hit_openEmergency.graphics.clear();
			hit_openHeadSet.graphics.clear();
			//	Starling.juggler.purge();
			OpenEmergencyTween = new Tween(openEmergency, 0.5, Transitions.LINEAR);
			OpenEmergencyTween.fadeTo(0);
			OpenEmergencyTween.onComplete = function():void{
				
				CloseEmergency();
				Animating = false;
				
			};
			Starling.juggler.add(OpenEmergencyTween);		
		}
		
		public function CloseEmergency():void{
			this.removeChild(openEmergency);
			openEmergency.dispose();
		}
		
		private function CreateOpenBookBg():void{
			openBookbg = new Shape();
			openBookbg.graphics.beginFill(0x000000);
			openBookbg.graphics.lineTo(0,0);	
			openBookbg.graphics.lineTo(800,0);	
			openBookbg.graphics.lineTo(800,512);	
			openBookbg.graphics.lineTo(0,512);	
			openBookbg.touchable = false;
			openBookbg.graphics.endFill(false);
			openBookbg.alpha = 0.5;
			//	openBookbg.graphics.precisionHitTest = true;				
			
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
			
			
			
			this.assets.removeTexture("Elevator_Sprite_01",true);				
			this.assets.removeTexture("Elevator_Sprite_02",true);
			this.assets.removeTexture("Elevator_Sprite_03",true);
			
			this.assets.removeTextureAtlas("Elevator_Sprite_01",true);
			this.assets.removeTextureAtlas("Elevator_Sprite_02",true);
			this.assets.removeTextureAtlas("Elevator_Sprite_03",true);
			
			(stage.getChildAt(0) as Object).falseAsset("elevator_01");
			(stage.getChildAt(0) as Object).falseAsset("elevator_02");
			(stage.getChildAt(0) as Object).falseAsset("elevator_03");
			(stage.getChildAt(0) as Object).falseAsset("elevator_04");
			(stage.getChildAt(0) as Object).falseAsset("elevator_05");
			(stage.getChildAt(0) as Object).falseAsset("elevator_06");
			
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
