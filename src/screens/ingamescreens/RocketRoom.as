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
	import starling.display.MovieClip;
	
	public class RocketRoom extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var desk_drawer_lower:Image;
		private var desk_drawer_upper:Image;
		private var computer_screen:Image;
		private var computer_drawer_large:Image;
		private var computer_drawer_small:Image;
		private var drill:Image;
		private var sat_cover:Image;
		private var door:Image;
		private var engine:Image;
		
		private var creature_cover:Image;
		
		private var screen_mc:MovieClip;
		private var fire_mc:MovieClip;
		
		private var red_mc:MovieClip;
		
		private var hit_desk:Shape;
		private var hit_computer:Shape;
		private var hit_station:Shape;
		private var hit_rocket:Shape;
		private var hit_door:Shape;
		private var hit_creature:Shape;
		
		private var Animating:Boolean = false;
		private var DoorOpen:Boolean = false;
		private var CreatureAlive:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function RocketRoom(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('rocketRoom_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoom/rocketRoom_bg.jpg'));
				game.TrackAssets('rocketRoom_01');
			}
			if(game.CheckAsset('rocketRoom_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoom/RocketRoom_Sprite_01.png'));
				game.TrackAssets('rocketRoom_02');
			}
			if(game.CheckAsset('rocketRoom_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoom/RocketRoom_Sprite_01.xml'));
				game.TrackAssets('rocketRoom_03');
			}
			if(game.CheckAsset('rocketRoom_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoom/RocketRoom_Sprite_02.png'));
				game.TrackAssets('rocketRoom_04');
			}
			if(game.CheckAsset('rocketRoom_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoom/RocketRoom_Sprite_02.xml'));
				game.TrackAssets('rocketRoom_05');
			}
		//	if(game.CheckAsset('rocketRoom_06') === false){
		//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoom/RocketRoom_Sprite_03.png'));
		//		game.TrackAssets('rocketRoom_06');
		//	}
		//	if(game.CheckAsset('rocketRoom_07') === false){
		//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoom/RocketRoom_Sprite_03.xml'));
		//		game.TrackAssets('rocketRoom_07');
		//	}
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RocketRoom","RocketRoomObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputer',SaveArray);
			
			bg = new Image(this.assets.getTexture('rocketRoom_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			door = new Image(this.assets.getTexture('escape_door'));
			door.touchable = false;
			door.x = 576;
			door.y = 116;
			
			drill = new Image(this.assets.getTexture('sat_drill'));
			drill.touchable = false;
			drill.x = 339;
			drill.y = 213;
			
			sat_cover = new Image(this.assets.getTexture('sat_station_cover'));
			sat_cover.touchable = false;
			sat_cover.x = 224;
			sat_cover.y = 165;
			
			desk_drawer_lower = new Image(this.assets.getTexture('desk_drawer_bottom'));
			desk_drawer_lower.touchable = false;
			desk_drawer_lower.x = 260;
			desk_drawer_lower.y = 367;
			
			desk_drawer_upper = new Image(this.assets.getTexture('desk_drawer_top'));
			desk_drawer_upper.touchable = false;
			desk_drawer_upper.x = 249;
			desk_drawer_upper.y = 313;
			
			computer_drawer_small = new Image(this.assets.getTexture('computer_short_drawer'));
			computer_drawer_small.touchable = false;
			computer_drawer_small.x = 104;
			computer_drawer_small.y = 255;
			
			computer_drawer_large = new Image(this.assets.getTexture('computer_wide_drawer'));
			computer_drawer_large.touchable = false;
			computer_drawer_large.x = 45;
			computer_drawer_large.y = 260;
			
			computer_screen = new Image(this.assets.getTexture('comp_screen_blank'));
			computer_screen.touchable = false;
			computer_screen.x = 52;
			computer_screen.y = 196;
			
			
			engine = new Image(this.assets.getTexture('engine'));
			engine.touchable = false;
			engine.x = 627;
			engine.y = 16;
			
			
			
			screen_mc = new MovieClip(this.assets.getTextures('sat_screen_0'),1);
			//elevator_mc.smoothing = TextureSmoothing.NONE;
			screen_mc.x = 151;
			screen_mc.y = 41;
			screen_mc.touchable = false;
			screen_mc.loop = true; 
			screen_mc.play();
			
		
			fire_mc = new MovieClip(this.assets.getTextures('fire_00'),10);
			//elevator_mc.smoothing = TextureSmoothing.NONE;
			fire_mc.x = 624;
			fire_mc.y = 237;
			fire_mc.touchable = false;
			fire_mc.loop = false; 
			
			fire_mc.addFrameAt(1,this.assets.getTexture("fire_01"), null, 0.1);
			fire_mc.addFrameAt(2,this.assets.getTexture("fire_02"), null, 0.1);
			fire_mc.addFrameAt(3,this.assets.getTexture("fire_03"), null, 0.1);
			fire_mc.addFrameAt(4,this.assets.getTexture("fire_04"), null, 0.1);
			fire_mc.addFrameAt(5,this.assets.getTexture("fire_01"), null, 0.1);
			fire_mc.addFrameAt(6,this.assets.getTexture("fire_02"), null, 0.1);
			fire_mc.addFrameAt(7,this.assets.getTexture("fire_03"), null, 0.1);
			fire_mc.addFrameAt(8,this.assets.getTexture("fire_04"), null, 0.1);
			fire_mc.addFrameAt(9,this.assets.getTexture("fire_01"), null, 0.1);
			fire_mc.addFrameAt(10,this.assets.getTexture("fire_02"), null, 0.1);
			fire_mc.addFrameAt(11,this.assets.getTexture("fire_03"), null, 0.1);
			fire_mc.addFrameAt(12,this.assets.getTexture("fire_04"), null, 0.1);
			fire_mc.addFrameAt(13,this.assets.getTexture("fire_01"), null, 0.1);
			fire_mc.addFrameAt(14,this.assets.getTexture("fire_02"), null, 0.1);
			fire_mc.addFrameAt(15,this.assets.getTexture("fire_03"), null, 0.1);
			fire_mc.addFrameAt(16,this.assets.getTexture("fire_04"), null, 0.1);
			fire_mc.addFrameAt(17,this.assets.getTexture("fire_00"), null, 0.1);
			fire_mc.stop();
			
			
			creature_cover = new Image((stage.getChildAt(0) as Object).RocketRoomImages.assets.getTexture("creature_pearl"));
		//	creature_cover = new Image(this.assets.getTexture('creature_pearl'));
			creature_cover.touchable = false;
			creature_cover.x = 556;
			creature_cover.y = 293;
			
			
	/*		red_mc = new MovieClip(this.assets.getTextures('red_frame_01'),8);
			//elevator_mc.smoothing = TextureSmoothing.NONE;
			red_mc.x = 490;
			red_mc.y = 0;
			red_mc.touchable = false;
			red_mc.loop = false; 
			
		//	red_mc.addFrameAt(0,this.assets.getTexture("red_frame_00"), null, 0.5);
			red_mc.addFrameAt(1,this.assets.getTexture("red_frame_01"), null, 1);
			red_mc.addFrameAt(2,this.assets.getTexture("red_frame_02"), null, 0.25);
			red_mc.addFrameAt(3,this.assets.getTexture("red_frame_03"), null, 0.25);
			red_mc.addFrameAt(4,this.assets.getTexture("red_frame_04"), null, 0.125);
			red_mc.addFrameAt(5,this.assets.getTexture("red_frame_05"), null, 0.375);
			red_mc.addFrameAt(6,this.assets.getTexture("red_frame_06"), null, 0.125);
			red_mc.addFrameAt(7,this.assets.getTexture("red_frame_07"), null, 0.125);
			red_mc.addFrameAt(8,this.assets.getTexture("red_frame_08"), null, 0.125);
			red_mc.addFrameAt(9,this.assets.getTexture("red_frame_09"), null, 0.375);
			red_mc.addFrameAt(10,this.assets.getTexture("red_frame_10"), null, 0.125);
			red_mc.addFrameAt(11,this.assets.getTexture("red_frame_11"), null, 0.125);
			red_mc.addFrameAt(12,this.assets.getTexture("red_frame_12"), null, 0.125);
			red_mc.addFrameAt(13,this.assets.getTexture("red_frame_13"), null, 0.25);
			red_mc.addFrameAt(14,this.assets.getTexture("red_frame_14"), null, 0.5);
			red_mc.addFrameAt(15,this.assets.getTexture("red_frame_15"), null, 0.25);
			red_mc.addFrameAt(16,this.assets.getTexture("red_frame_16"), null, 0.125);
			red_mc.addFrameAt(17,this.assets.getTexture("red_frame_17"), null, 0.25);
			red_mc.addFrameAt(18,this.assets.getTexture("red_frame_18"), null, 1);
			
			*/
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['ComputerOn'] == 'Yes'){						
					computer_screen.alpha = 1;
				}else{
					computer_screen.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['SmallDrawer'] == 'Open'){	
					computer_drawer_small.alpha = 1;
				}else{
					computer_drawer_small.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['LargeDrawer'] == 'Open'){	
					computer_drawer_large.alpha = 1;
				}else{
					computer_drawer_large.alpha = 0;
				}
			}else{
				computer_screen.alpha = 0;
				computer_drawer_large.alpha = 0;
				computer_drawer_small.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk['Drawer'] == 'Upper'){
					desk_drawer_lower.alpha = 0;
					desk_drawer_upper.alpha = 1;
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk['Drawer'] == 'Lower'){	
					desk_drawer_lower.alpha = 1;
					desk_drawer_upper.alpha = 0;
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk['Drawer'] == 'Both'){	
					desk_drawer_lower.alpha = 1;
					desk_drawer_upper.alpha = 1;
				}else{
					desk_drawer_lower.alpha = 0;
					desk_drawer_upper.alpha = 0;
				}
			}else{
				desk_drawer_lower.alpha = 0;
				desk_drawer_upper.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSatStation != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSatStation['DrillPickedUp'] == 'Yes'){
					drill.alpha = 0;
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
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoom != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoom['Door'] == 'Open'){	
					
					DoorOpen = true;
					door.alpha = 0;
				}else{
					door.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoom['Creature'] == 'Alive'){	
					CreatureAlive = true;
					engine.texture = this.assets.getTexture('engine_off');
				
					
					red_mc = new MovieClip((stage.getChildAt(0) as Object).RocketRoomImages.assets.getTextures("growth_frame_10"),4);
			//		red_mc = new MovieClip(this.assets.getTextures('growth_frame_10'),4);
					//elevator_mc.smoothing = TextureSmoothing.NONE;
					red_mc.x = 289;
					red_mc.y = 40;
					red_mc.touchable = false;
					red_mc.loop = false; 
					
					red_mc.alpha = 1;
					CreateCretureHit();
					
				}else{
					red_mc = new MovieClip((stage.getChildAt(0) as Object).RocketRoomImages.assets.getTextures("growth_frame_"),4);
				//	red_mc = new MovieClip(this.assets.getTextures('growth_frame_'),4);
					//elevator_mc.smoothing = TextureSmoothing.NONE;
					red_mc.x = 289;
					red_mc.y = 40;
					red_mc.touchable = false;
					red_mc.loop = false; 
					
					red_mc.alpha = 0;
				}
			}else{
				red_mc = new MovieClip((stage.getChildAt(0) as Object).RocketRoomImages.assets.getTextures("growth_frame_"),4);
			//	red_mc = new MovieClip(this.assets.getTextures('growth_frame_'),4);
				//elevator_mc.smoothing = TextureSmoothing.NONE;
				red_mc.x = 289;
				red_mc.y = 40;
				red_mc.touchable = false;
				red_mc.loop = false; 
				
				door.alpha = 1;
				red_mc.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomCreature != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomCreature['Cover'] == "Open"){
					creature_cover.alpha = 	1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomCreature['Pearl'] == "PickedUp"){
						creature_cover.texture = (stage.getChildAt(0) as Object).RocketRoomImages.assets.getTexture("creature_open")
					//	creature_cover.texture = this.assets.getTexture('creature_open');
					//	creature_cover.texture = this.assets.getTexture('creature_open');
						creature_cover.alpha = 	1;
					}else{
						creature_cover.alpha = 	1;
					}
				}else{
					creature_cover.alpha = 	0;
				}
			}else{
				creature_cover.alpha = 	0;
			}
			
			
			
			engine.alpha =1;

			fire_mc.alpha = 0;
			
			red_mc.stop();
			
			
			
			this.addChildAt(door,1);
			this.addChildAt(drill,2);
			this.addChildAt(sat_cover,3);
			this.addChildAt(desk_drawer_lower,4);
			this.addChildAt(desk_drawer_upper,5);
			this.addChildAt(computer_drawer_small,6);
			this.addChildAt(computer_drawer_large,7);
			this.addChildAt(computer_screen,8);
			this.addChildAt(screen_mc,9);
			this.addChildAt(engine,10);
			this.addChildAt(red_mc,11);
			this.addChildAt(fire_mc,12);
			this.addChildAt(creature_cover,13);
			
			CreateDeskHit();
			CreateSatSationHit();
			CreateComputerHit();
			CreateRocketHit();
			CreateDoorHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			Starling.juggler.add(screen_mc);
	//		Starling.juggler.add(red_mc);
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ShipGroansOne",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("CityHum",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("WindHowl",0,0.5,'stop');
		}
		//hit_computer
		//hit_station
		//hit_rocket
		//hit_door
		private function CreateCretureHit():void{
			hit_creature = new Shape();
			hit_creature.touchable = false;
			hit_creature.graphics.beginFill(0x00ff00);
			
			hit_creature.graphics.lineTo(522,327);	
			hit_creature.graphics.lineTo(561,269);	
			hit_creature.graphics.lineTo(646,300);	
			hit_creature.graphics.lineTo(676,352);	
			hit_creature.graphics.lineTo(626,421);	
			hit_creature.graphics.lineTo(530,405);	
			
			
			hit_creature.graphics.endFill(false);
			hit_creature.alpha = 0.0;
			
			hit_creature.graphics.precisionHitTest = true;	
			this.addChild(hit_creature);
		}
		
		
		private function CreateDoorHit():void{
			hit_door = new Shape();
			hit_door.touchable = false;
			hit_door.graphics.beginFill(0x00ff00);
			
			hit_door.graphics.lineTo(583,115);	
			hit_door.graphics.lineTo(658,112);	
			hit_door.graphics.lineTo(660,181);	
			hit_door.graphics.lineTo(639,220);	
			hit_door.graphics.lineTo(639,234);	
			hit_door.graphics.lineTo(674,244);	
			hit_door.graphics.lineTo(666,298);	
			hit_door.graphics.lineTo(571,298);	
		
			hit_door.graphics.endFill(false);
			hit_door.alpha = 0.0;
			
			hit_door.graphics.precisionHitTest = true;	
			this.addChild(hit_door);
		}
		
		private function CreateRocketHit():void{
			hit_rocket = new Shape();
			hit_rocket.touchable = false;
			hit_rocket.graphics.beginFill(0x00ff00);
			
			hit_rocket.graphics.lineTo(653,224);	
			hit_rocket.graphics.lineTo(704,129);	
			hit_rocket.graphics.lineTo(775,135);	
			hit_rocket.graphics.lineTo(800,163);	
			//hit_rocket.graphics.lineTo(800,234);	
			hit_rocket.graphics.lineTo(800,289);	
			hit_rocket.graphics.lineTo(666,280);	
			hit_rocket.graphics.lineTo(675,238);	
			
			hit_rocket.graphics.lineTo(741,237);	
			hit_rocket.graphics.lineTo(678,233);	
		
			hit_rocket.graphics.endFill(false);
			hit_rocket.alpha = 0.0;
			
			hit_rocket.graphics.precisionHitTest = true;	
			this.addChild(hit_rocket);
		}
		
		private function CreateSatSationHit():void{
			hit_station = new Shape();
			hit_station.touchable = false;
			hit_station.graphics.beginFill(0x00ff00);
			
			hit_station.graphics.lineTo(155,98);	
			hit_station.graphics.lineTo(350,97);	
			hit_station.graphics.lineTo(370,227);	
			hit_station.graphics.lineTo(164,271);	
			
			hit_station.graphics.endFill(false);
			hit_station.alpha = 0.0;
			
			hit_station.graphics.precisionHitTest = true;	
			this.addChild(hit_station);
		}
		
		private function CreateComputerHit():void{
			hit_computer = new Shape();
			hit_computer.touchable = false;
			hit_computer.graphics.beginFill(0x00ff00);
			
			hit_computer.graphics.lineTo(0,117);	
			hit_computer.graphics.lineTo(99,119);	
			hit_computer.graphics.lineTo(157,169);	
			hit_computer.graphics.lineTo(164,313);	
			hit_computer.graphics.lineTo(153,356);	
			hit_computer.graphics.lineTo(86,368);	
			hit_computer.graphics.lineTo(0,362);	
			
			
			hit_computer.graphics.endFill(false);
			hit_computer.alpha = 0.0;
			
			hit_computer.graphics.precisionHitTest = true;	
			this.addChild(hit_computer);
		}
		
		
		private function CreateDeskHit():void{
			hit_desk = new Shape();
			hit_desk.touchable = false;
			hit_desk.graphics.beginFill(0x00ff00);
			
			hit_desk.graphics.lineTo(217,278);	
			hit_desk.graphics.lineTo(305,237);	
			hit_desk.graphics.lineTo(348,233);	
			hit_desk.graphics.lineTo(416,259);	
			hit_desk.graphics.lineTo(523,277);	
			hit_desk.graphics.lineTo(498,355);	
			hit_desk.graphics.lineTo(361,346);	
			hit_desk.graphics.lineTo(335,412);	
			hit_desk.graphics.lineTo(253,352);	
			
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
							
							FadeOut((Office as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeObj,false
							);
						}else if(hit_desk.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((RocketRoomDesk as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomDeskObj,true
							);
						}else if(hit_computer.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((RocketRoomComputerDesk as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomComputerDeskObj,true
							);
						}else if(hit_station.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((RocketRoomSatStation as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomSatStationObj,true
							);
						}else if(hit_rocket.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							RocketHandler();
						}else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(CreatureAlive === true){
								if(hit_creature.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									FadeOut((RocketRoomCreature as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomCreatureObj,true
									);
								}else{
									DoorHandler();
								}
							}else{
								DoorHandler();
							}
						}else if(CreatureAlive === true){
							if(hit_creature.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((RocketRoomCreature as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomCreatureObj,true
								);
							}
						}
						//hit_rocket
						//hit_station
					}
				}
			}
		}
		private function DoorHandler():void{
			if(DoorOpen === false){
				DoorOpen = true;
				door.alpha = 0;
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HeavyMetalDoorOpen();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoom != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoom;	
				}
				SaveArray['Door'] = "Open";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoom',SaveArray);
			}else{
				FadeOut((ExteriorFireEscape as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorFireEscapeObj,true
				);
			}
		}
		
		private function RocketHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_HandlerCup)
			{
				if(CreatureAlive === false){
					Animating = true;
					CreatureAlive = true;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoom != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoom;	
					}
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RocketEngine();
				SaveArray['Creature'] = "Alive";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoom',SaveArray);
					
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PipeRingOne();
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClinkOne();
					fire_mc.alpha = 1;
					red_mc.alpha = 1;
					fire_mc.play();
					CreateCretureHit();
					fire_mc.addEventListener(Event.COMPLETE, FireRedComplete);
					Starling.juggler.add(fire_mc);
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_HandlerCup,
							"item_HandlerCup"
						);
					
					
				}
			}else{
				if(CreatureAlive === false){
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RocketEngine();
					Animating = true;
					fire_mc.alpha = 1;
					fire_mc.play();
					fire_mc.addEventListener(Event.COMPLETE, FireComplete);
					Starling.juggler.add(fire_mc);
					
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The engine appears damaged, I shouldn't try firing it.");
				}
				
			}
			
		
		}
		private function delayRedMC():void{
			trace("HIP 00");
			Starling.juggler.add(red_mc);
			red_mc.addEventListener(Event.ENTER_FRAME, RedEnterFrame);
			red_mc.addEventListener(Event.COMPLETE, RedComplete);
			
			red_mc.play();
			Starling.juggler.add(red_mc);
		}
		
		private function FireRedComplete():void{
			trace("HIP 01");
			fire_mc.removeEventListener(Event.COMPLETE, FireComplete);
			fire_mc.stop();
			fire_mc.alpha = 0;
			
			Starling.juggler.delayCall(
				delayRedMC,1.5);
			
			//Starling.juggler.add(red_mc);
		}
		private function RedEnterFrame():void{
			trace("HIP 02");
			if(red_mc.currentFrame == 1){
				if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('SlimerTwo') === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerTwo();
				}
			}else if(red_mc.currentFrame == 2){
				
			}else if(red_mc.currentFrame == 3){
				if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('SlimeMove') === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
				}
			}else if(red_mc.currentFrame == 4){
				if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('SlimePlop') === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
				}
			}else if(red_mc.currentFrame == 5){
				if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('MailBox') === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MailBox();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakThree();
				}
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClinkOne();
				engine.texture = this.assets.getTexture('engine_off');
			}else if(red_mc.currentFrame == 6){
				if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('SlimerOne') === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
				}
			}else if(red_mc.currentFrame == 7){
				if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('SlimeMove') === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
				}
			}else if(red_mc.currentFrame == 8){
				if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('SlimePlop') === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
				}
				//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerTwo();
			}else if(red_mc.currentFrame == 9){
				if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('SlimerTwo') === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerTwo();
				}
			}
		}
		
		private function RedComplete():void{
			//;red_mc.stop();
			red_mc.removeEventListener(Event.COMPLETE, RedComplete);
			red_mc.removeEventListener(Event.ENTER_FRAME, RedEnterFrame);
			Animating = false;
			
			
			if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
				
				Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).MusicObj.LoadSpeedDial(true,3);
					
				},0.25);
			}
			
		}
		private function FireComplete():void{
			Animating = false;
			fire_mc.removeEventListener(Event.COMPLETE, FireComplete);
			fire_mc.stop();
			fire_mc.alpha = 0;

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
			
			
			
			this.assets.removeTexture("rocketRoom_bg",true);
			this.assets.removeTexture("RocketRoom_Sprite_01",true);
			this.assets.removeTexture("RocketRoom_Sprite_02",true);
		//	this.assets.removeTexture("RocketRoom_Sprite_03",true);
			this.assets.removeTextureAtlas("RocketRoom_Sprite_01",true);
			this.assets.removeTextureAtlas("RocketRoom_Sprite_02",true);
		//	this.assets.removeTextureAtlas("RocketRoom_Sprite_03",true);
			
			(stage.getChildAt(0) as Object).falseAsset("rocketRoom_01");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoom_02");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoom_03");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoom_04");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoom_05");
		//	(stage.getChildAt(0) as Object).falseAsset("rocketRoom_06");
		//	(stage.getChildAt(0) as Object).falseAsset("rocketRoom_07");
			
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