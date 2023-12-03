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
	import starling.utils.deg2rad;
	
	public class ThirdFloorHall extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		public var SaveArray2:Array = new Array();
		public var SaveArray3:Array = new Array();
		
		private var bg:Image;
		
		private var elevator_mc:MovieClip;
		private var elevator_close_mc:MovieClip;
		private var heavy_door_mc:MovieClip;
		private var greenhouse_door:Image;
		private var latch_open:Image;
		private var latch_closed:Image;
		
		private var heavy_door_locked:Image;
		private var red_disc:Image;
		
		private var ethernet:Image;
		
		private var smoke_01:Image;
		private var smoke_02:Image;
		private var smoke_03:Image;
		
		private var hit_elevator_door:Shape;
		private var hit_lab:Shape;
		private var hit_greenHouse:Shape;
		private var hit_ethernet:Shape;
		
		private var hit_ceiling:Shape;
		private var hit_sides:Shape;
		private var hit_ramp:Shape;
		private var hit_floor:Shape;
		
		private var DiscTween:Tween;
		private var Smoke_01_Tween:Tween;
		private var Smoke_02_Tween:Tween;
		private var Smoke_03_Tween:Tween;
		
		private var delayedCall:DelayedCall;
		
		private var Animating:Boolean = false;
		private var ElevatorOpen:Boolean = false;
		private var LabDoorOpen:Boolean = false;
		private var LabDoorUnlocked:Boolean = false;
		private var GreenHouseDoorOpen:Boolean = false;
		private var GasMaskAttached:Boolean = false;
		private var EthernetPickedUp:Boolean = false;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;
		
		public function ThirdFloorHall(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('thirdFloorHall_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ThirdFloorHall/thirdFloorHall_bg.jpg'));
				game.TrackAssets('thirdFloorHall_01');
			}
			if(game.CheckAsset('thirdFloorHall_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ThirdFloorHall/ThirdFloorHall_Sprite_01.png'));
				game.TrackAssets('thirdFloorHall_02');
			}
			if(game.CheckAsset('thirdFloorHall_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ThirdFloorHall/ThirdFloorHall_Sprite_01.xml'));
				game.TrackAssets('thirdFloorHall_03');
			}
			if(game.CheckAsset('thirdFloorHall_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ThirdFloorHall/ThirdFloorHall_Sprite_02.png'));
				game.TrackAssets('thirdFloorHall_04');
			}
			if(game.CheckAsset('thirdFloorHall_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ThirdFloorHall/ThirdFloorHall_Sprite_02.xml'));
				game.TrackAssets('thirdFloorHall_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ThirdFloorHall","ThirdFloorHallObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		//	if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){
		//		SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall;
		//		SaveArray['LabDoorOpen'] = 'no';
			
		//		(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ThirdFloorHall',SaveArray);
		//	}	
			bg = new Image(this.assets.getTexture('thirdFloorHall_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			elevator_mc = new MovieClip(this.assets.getTextures('elevator_frame_0'),12);
			//	elevator_mc.smoothing = TextureSmoothing.NONE;
			elevator_mc.x = 672;
			elevator_mc.y = 89;
			elevator_mc.touchable = false;
			elevator_mc.loop = false; 
			//	elevator_mc.play();
			
			elevator_close_mc = new MovieClip(this.assets.getTextures('elevator_frame_0').reverse(),12);
			//elevator_mc.smoothing = TextureSmoothing.NONE;
			elevator_close_mc.x = 672;
			elevator_close_mc.y = 89;
			elevator_close_mc.touchable = false;
			elevator_close_mc.loop = false; 
			
			heavy_door_mc = new MovieClip(this.assets.getTextures('heavy_mc_frame_0'),10);
			//elevator_mc.smoothing = TextureSmoothing.NONE;
			heavy_door_mc.x = 292;
			heavy_door_mc.y = 136;
			heavy_door_mc.touchable = false;
			heavy_door_mc.loop = false; 
			
			heavy_door_locked = new Image(this.assets.getTexture('heavy_door_locked'));
			heavy_door_locked.touchable = false;
			heavy_door_locked.x = 292;
			heavy_door_locked.y = 136;
			
			red_disc = new Image(this.assets.getTexture('red_disc'));
			red_disc.touchable = false;
			red_disc.pivotX = 31;
			red_disc.pivotY = 31.5;
			red_disc.x = 449;
			red_disc.y = 222;
						
			latch_closed = new Image(this.assets.getTexture('latch_closed'));
			latch_closed.touchable = false;
			latch_closed.x = 289;
			latch_closed.y = 210;
			
			
			latch_open = new Image(this.assets.getTexture('latch_open'));
			latch_open.touchable = false;
			latch_open.x = 265;
			latch_open.y = 208;
			
			greenhouse_door = new Image(this.assets.getTexture('lab_door'));
			greenhouse_door.touchable = false;
			greenhouse_door.x = 63;
			greenhouse_door.y = 105;
			
			ethernet = new Image(this.assets.getTexture('ethernet'));
			ethernet.touchable = false;
			ethernet.x = 367;
			ethernet.y = 408;
			
			smoke_01 = new Image(this.assets.getTexture('smoke_01'));
			smoke_01.touchable = false;
			smoke_01.x = 65;
			smoke_01.y = 143;
			
			smoke_02 = new Image(this.assets.getTexture('smoke_02'));
			smoke_02.touchable = false;
			smoke_02.x = 64;
			smoke_02.y = 136;
			
			smoke_03 = new Image(this.assets.getTexture('smoke_03'));
			smoke_03.touchable = false;
			smoke_03.x = 63;
			smoke_03.y = 269;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['AdimmFried'] == 'Yes'){
		//				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['AdimmActive'] == 'Yes'){
					LabDoorUnlocked = true;
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall['ComingFromElevator'] == 'Yes'){
					elevator_mc.alpha = 0;
					elevator_close_mc.alpha = 1;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall;
					}
					SaveArray['ComingFromElevator'] = 'No';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ThirdFloorHall',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorClose();
						trace('ANGER');
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
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall['GreenHouseDoorOpen'] == 'Yes'){
					GreenHouseDoorOpen = true;
					greenhouse_door.alpha = 0;
					smoke_03.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall['GasMaskAttached'] == 'Yes'){
						GasMaskAttached = true;
					}
					
				}else{
					greenhouse_door.alpha = 1;
					smoke_03.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall['LabDoorOpen'] == 'Yes'){
					LabDoorOpen = true;
					
					heavy_door_mc.alpha = 0;
					heavy_door_locked.alpha = 0;
					red_disc.alpha = 0;
					latch_closed.alpha = 0;
					latch_open.alpha = 1;
					

				}else{
					heavy_door_mc.alpha = 1;
					heavy_door_locked.alpha = 1;
					red_disc.alpha = 1;
					latch_closed.alpha = 1;
					latch_open.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall['Ethernet'] == 'PickedUp'){
					EthernetPickedUp = true;
					ethernet.alpha = 0;
				}else{
					ethernet.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ThirdFloorHall',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadDoom(true,3);
							
						},0.5);
					}
				}
				
			}else{elevator_mc.alpha = 1;
				elevator_close_mc.alpha = 0;
				greenhouse_door.alpha = 1;
				ethernet.alpha = 1;
				smoke_03.alpha = 0;
				heavy_door_mc.alpha = 1;
				heavy_door_locked.alpha = 1;
				red_disc.alpha = 1;
				latch_closed.alpha = 1;
				latch_open.alpha = 0;		
				
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ThirdFloorHall',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadDoom(true,3);
						
					},0.5);
				}
			}
			
			
			smoke_01.alpha = 0;
			smoke_02.alpha = 0;
			
			/*
			private var smoke_01:Image;
			private var smoke_02:Image;
			private var smoke_03:Image;
			*/
			
			this.addChildAt(elevator_mc,1);	
			this.addChildAt(elevator_close_mc,2);	
			this.addChildAt(heavy_door_mc,3);	
			this.addChildAt(heavy_door_locked,4);	
			this.addChildAt(latch_closed,5);	
			this.addChildAt(latch_open,6);	
			this.addChildAt(red_disc,7);	
			this.addChildAt(greenhouse_door,8);	
			this.addChildAt(ethernet,9);	
			this.addChildAt(smoke_01,10);	
			this.addChildAt(smoke_02,11);	
			this.addChildAt(smoke_03,12);	
			
		//	CreateRampHit();
			
			CreateFloorHit();
			CreateRampHit();
			CreateCeilingHit();
			CreateSideHit();
			
			CreateElevatorDoorHit();
			CreateLabHit();
			CreateGreenHouseHit();
			CreateEthernetHit();
			
		//	goback = new GoBackButton(this.assets);
		//	this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Drone",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BasementBongs",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("HorrorBreath",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SlipperyPlants",0,0.5,'stop');
					
		}
	
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0xff0000);
			
			hit_floor.graphics.lineTo(93,421);	
			hit_floor.graphics.lineTo(199,355);	
			hit_floor.graphics.lineTo(606,369);	
			hit_floor.graphics.lineTo(656,406);	
			hit_floor.graphics.lineTo(607,509);	
			hit_floor.graphics.lineTo(114,506);	
			
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		
		private function CreateRampHit():void{
			hit_ramp = new Shape();
			hit_ramp.touchable = false;
			hit_ramp.graphics.beginFill(0xff0000);
			
			hit_ramp.graphics.lineTo(273,334);	
			hit_ramp.graphics.lineTo(511,334);	
			hit_ramp.graphics.lineTo(530,383);	
			hit_ramp.graphics.lineTo(252,381);	
			
			hit_ramp.graphics.endFill(false);
			hit_ramp.alpha = 0.0;
			
			hit_ramp.graphics.precisionHitTest = true;	
			this.addChild(hit_ramp);
		}
		
		private function CreateSideHit():void{
			hit_sides = new Shape();
			hit_sides.touchable = false;
			hit_sides.graphics.beginFill(0xff0000);
			
			hit_sides.graphics.lineTo(207,120);	
			hit_sides.graphics.lineTo(252,99);	
			hit_sides.graphics.lineTo(543,106);	
			hit_sides.graphics.lineTo(579,121);	
			hit_sides.graphics.lineTo(581,363);	
			hit_sides.graphics.lineTo(197,360);	
			
			hit_sides.graphics.endFill(false);
			hit_sides.alpha = 0.0;
			
			hit_sides.graphics.precisionHitTest = true;	
			this.addChild(hit_sides);
		}
		
		private function CreateCeilingHit():void{
			hit_ceiling = new Shape();
			hit_ceiling.touchable = false;
			hit_ceiling.graphics.beginFill(0xff0000);
			
			hit_ceiling.graphics.lineTo(96,0);	
			hit_ceiling.graphics.lineTo(721,0);	
			hit_ceiling.graphics.lineTo(571,105);	
			hit_ceiling.graphics.lineTo(400,105);	
			hit_ceiling.graphics.lineTo(234,106);	
					
			hit_ceiling.graphics.endFill(false);
			hit_ceiling.alpha = 0.0;
			
			hit_ceiling.graphics.precisionHitTest = true;	
			this.addChild(hit_ceiling);
		}
		
		private function CreateEthernetHit():void{
			hit_ethernet = new Shape();
			hit_ethernet.touchable = false;
			hit_ethernet.graphics.beginFill(0xff0000);
			
			hit_ethernet.graphics.lineTo(343,410);	
			hit_ethernet.graphics.lineTo(391,392);	
			hit_ethernet.graphics.lineTo(435,410);	
			hit_ethernet.graphics.lineTo(513,417);	
			hit_ethernet.graphics.lineTo(520,451);	
			hit_ethernet.graphics.lineTo(410,449);	
			hit_ethernet.graphics.lineTo(356,435);	
			
			hit_ethernet.graphics.endFill(false);
			hit_ethernet.alpha = 0.0;
			
			hit_ethernet.graphics.precisionHitTest = true;	
			this.addChild(hit_ethernet);
		}
		
		private function CreateGreenHouseHit():void{
			hit_greenHouse = new Shape();
			hit_greenHouse.touchable = false;
			hit_greenHouse.graphics.beginFill(0xff0000);
			
			hit_greenHouse.graphics.lineTo(64,92);	
			hit_greenHouse.graphics.lineTo(169,140);	
			hit_greenHouse.graphics.lineTo(165,373);	
			hit_greenHouse.graphics.lineTo(66,424);	
			
			hit_greenHouse.graphics.endFill(false);
			hit_greenHouse.alpha = 0.0;
			
			hit_greenHouse.graphics.precisionHitTest = true;	
			this.addChild(hit_greenHouse);
		}
		
		private function CreateLabHit():void{
			hit_lab = new Shape();
			hit_lab.touchable = false;
			hit_lab.graphics.beginFill(0xff0000);
			
			hit_lab.graphics.lineTo(290,134);	
			hit_lab.graphics.lineTo(491,134);	
			hit_lab.graphics.lineTo(491,336);	
			hit_lab.graphics.lineTo(290,336);	
			
			hit_lab.graphics.endFill(false);
			hit_lab.alpha = 0.0;
			
			hit_lab.graphics.precisionHitTest = true;	
			this.addChild(hit_lab);
		}
		
		private function CreateElevatorDoorHit():void{
			hit_elevator_door = new Shape();
			hit_elevator_door.touchable = false;
			hit_elevator_door.graphics.beginFill(0xff0000);
			
			hit_elevator_door.graphics.lineTo(658,131);	
			hit_elevator_door.graphics.lineTo(757,88);	
			hit_elevator_door.graphics.lineTo(758,386);	
			hit_elevator_door.graphics.lineTo(672,407);	
					
			hit_elevator_door.graphics.endFill(false);
			hit_elevator_door.alpha = 0.0;
			
			hit_elevator_door.graphics.precisionHitTest = true;	
			this.addChild(hit_elevator_door);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						
						if(hit_elevator_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ElevatorHandler();
						}else if(hit_lab.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LabDoorHandler();
						}else if(hit_greenHouse.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							GreenHouseDoorHandler();
						}else if(hit_ethernet.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							EthernetHandler();
						}else if(hit_ramp.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(LabDoorOpen === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small ramp leads into the room.");	
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small ramp leads up to the door.");	
							}
							
						}else if(hit_sides.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Wires and machinery line the sides of the high-tech doorway.");	
						}else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(GreenHouseDoorOpen === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The green gas drifts and diffuses across the cold floor.");	
							}else{
								
							}
						}else if(hit_ceiling.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Fluorescent tubes and pipes cover the ceiling.");				
						}
						
						
						/*
						private var hit_ceiling:Shape;
						private var hit_sides:Shape;
						private var hit_ramp:Shape;
						private var hit_floor:Shape;
						*/
					}
				}
			}
		}
		/*
		
		
		if(RONum == 0){
		RONum = 1;
		(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A bizarre organic growth has covered the door.");				
		}else if(RONum == 1){
		RONum = 2;
		(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Under a soft outer layer, the growth appears to have a rigid structure.");
		
		}else if(RONum == 2){
		RONum = 0;	
		(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The spores appear to be somewhere between a plant and a mold.");
		}
		*/
		
		private function EthernetHandler():void{
			if(EthernetPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall;	
				}
				EthernetPickedUp = true;
				ethernet.alpha = 0;
				SaveArray['Ethernet'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ThirdFloorHall',SaveArray);
				
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Ethernet,
					'item_Ethernet',
					'inven_ethernet_sm'
				);
			}
		}
		
		private function GreenHouseDoorHandler():void{
			if(GreenHouseDoorOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpenTwo();
				Animating = true;
				GreenHouseDoorOpen = true;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall;
				}
				SaveArray['GreenHouseDoorOpen'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ThirdFloorHall',SaveArray);
				
				
				greenhouse_door.alpha = 0;
				FadeSmokeOne();
			}else{
				if(GasMaskAttached === true){
					FadeOut((GreenHouse as Class), 
						(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseObj,false
					);
				}else{
					if((stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.armedItem
						== 
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.inventoryBarObj
						.item_GasMask)
						
					{
						GasMaskAttached = true;
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall;
						}
						SaveArray['GasMaskAttached'] = 'Yes';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ThirdFloorHall',SaveArray);
						
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_GasMask,
								"item_GasMask"
							);
						
						
						FadeOut((GreenHouse as Class), 
							(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseObj,false
						);
					}else{
						if(RONum == 0){
							RONum = 1;
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("*Cough ... Cough* -- the smell is overpowering... I feel dizzy.");				
						}else if(RONum == 1){
							RONum = 2;
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A noxious green gas fills the room beyond; I can't enter without some type of protection.");

						}else if(RONum == 2){
							RONum = 0;
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't enter the room and breathe in the gases at the same time.");
							
						}
						
						
					}
				}
				
				
			}
		}
		
		private function FadeSmokeOne():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirLeak();
			//PlaySFX_AirLeak
			Smoke_01_Tween = new Tween(smoke_01, 1, Transitions.LINEAR);
			Smoke_01_Tween.fadeTo(1);
			Smoke_01_Tween.onComplete = function():void{
				FadeSmokeTwo();
				//	CreateOpenNotePadHit();
			};
			
			
			Smoke_02_Tween = new Tween(smoke_02, 2, Transitions.LINEAR);
			Smoke_02_Tween.fadeTo(1);
			Smoke_02_Tween.onComplete = function():void{
				FadeSmokeThree();
				//	CreateOpenNotePadHit();
			};
			Starling.juggler.add(Smoke_01_Tween);	
			Starling.juggler.add(Smoke_02_Tween);	
		}
		private function FadeSmokeTwo():void{
			Smoke_01_Tween = null;
			Smoke_01_Tween = new Tween(smoke_01, 1.5, Transitions.LINEAR);
			Smoke_01_Tween.fadeTo(0);
			Smoke_01_Tween.onComplete = function():void{
				Smoke_01_Tween = null;
				//	CreateOpenNotePadHit();
			};

			
			Starling.juggler.add(Smoke_01_Tween);	
	//		Starling.juggler.add(Smoke_02_Tween);				
		}
		private function FadeSmokeThree():void{
			Smoke_02_Tween = null;
			Smoke_02_Tween = new Tween(smoke_02, 2, Transitions.LINEAR);
			Smoke_02_Tween.fadeTo(0);
			Smoke_02_Tween.onComplete = function():void{
				Smoke_02_Tween = null;
				//	CreateOpenNotePadHit();
			};
			
			Smoke_03_Tween = new Tween(smoke_03, 2, Transitions.LINEAR);
			Smoke_03_Tween.fadeTo(1);
			Smoke_03_Tween.onComplete = function():void{
				Animating = false;
				//	CreateOpenNotePadHit();
			};
			Starling.juggler.add(Smoke_02_Tween);	
			Starling.juggler.add(Smoke_03_Tween);	
		}
		
		private function LabDoorHandler():void{
			if(LabDoorUnlocked === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorBeepsAccessDenied();
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The door is sealed... I can't see any way to open it.");				
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The door is large and thick - designed to keep people out... or something inside...");				
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder what's in there...");
					
				}
				
			}else{
				if(LabDoorOpen === false){
					Animating = true;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorBeepsAccessGranted();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ThirdFloorHall;
					}
					SaveArray['LabDoorOpen'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ThirdFloorHall',SaveArray);
		
					
					LabDoorOpen = true;
					AnimateDisc();
				
				}else{
				
						FadeOut((Lab as Class), 
							(stage.getChildAt(0) as Object).screenGamePlayHandler.LabObj,true
						);
					
				}
			}
		}
		
		private function AnimateDisc():void{
			Animating = true;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RotaryClicks();
			DiscTween = new Tween(red_disc, 3, Transitions.LINEAR);
			DiscTween.animate("rotation", deg2rad(360));
			DiscTween.onComplete = function():void{
				Animating = true;
				(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("RotaryClicks");
			//	(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("RotaryClicks");
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsThree();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_EnergyPulse();
				red_disc.alpha = 0;
				
				PushDoorBack();
				//CloseEmergency();
			//	Animating = false;
				
			};
			Starling.juggler.add(DiscTween);		
		}
		
		
		
		private function PushDoorBack():void{
			Animating = true;
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerUp();
				
				latch_closed.alpha = 0;
				latch_open.alpha = 1;
				heavy_door_locked.alpha = 0;
				PushDoorBackTwo();
			},1.25);
			
			
		}
		
		
		private function PushDoorBackTwo():void{
			Animating = true;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirRelease();
			Starling.juggler.delayCall(function():void{
				
				OpenDoor();
			},1.25);
		}
		
		private function OpenDoor():void{
			Animating = true;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicDoor();
			heavy_door_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onHeavyDoorEnterFrame);
			
			heavy_door_mc.play();
			Starling.juggler.add(heavy_door_mc);
			
		}
		
		private function onHeavyDoorEnterFrame():void{
			trace('BROOM: '+heavy_door_mc.currentFrame);
			if(heavy_door_mc.currentFrame == 8){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OhmTwo();
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicDoor();
				trace("SMART PLUG");
				heavy_door_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onHeavyDoorEnterFrame);
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					(stage.getChildAt(0) as Object).MusicObj.LoadStarryNight(true,1);
				}
				Animating = false;
			}
		}
		
		private function ElevatorHandler():void{
			
				if(ElevatorOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorOpen();
					ElevatorOpen = true;
					Animating = true;
					elevator_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onElevatorEnterFrame);
					
					elevator_mc.play();
					Starling.juggler.add(elevator_mc);
				}else{
					Starling.juggler.remove(elevator_close_mc);
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel != undefined){
						SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel;
					}
					SaveArray2['Floor'] = 3;
					SaveArray2['PrevFloor'] = 3;
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
			if(elevator_mc.currentFrame == 3){
				trace('FRAME THREE');
				elevator_mc.alpha = 0;
				
				elevator_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onElevatorEnterFrame);
				elevator_mc.stop();
				Animating = false;
				
				delayedCall = new DelayedCall(CloseElevator,4);
			
				Starling.juggler.add(delayedCall);
				
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
		
		//
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
			
			
			
			this.assets.removeTexture("thirdFloorHall_bg",true);
			this.assets.removeTexture("ThirdFloorHall_Sprite_01",true);
			this.assets.removeTextureAtlas("ThirdFloorHall_Sprite_01",true);
			this.assets.removeTexture("ThirdFloorHall_Sprite_02",true);
			this.assets.removeTextureAtlas("ThirdFloorHall_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("thirdFloorHall_01");
			(stage.getChildAt(0) as Object).falseAsset("thirdFloorHall_02");
			(stage.getChildAt(0) as Object).falseAsset("thirdFloorHall_03");
			(stage.getChildAt(0) as Object).falseAsset("thirdFloorHall_04");
			(stage.getChildAt(0) as Object).falseAsset("thirdFloorHall_05");
			
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
