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
	
	
	public class Exterior extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		private var rear_car_lid:Image;
		private var door_mc:MovieClip;
		private var door_close_mc:MovieClip;
		
		private var marquee_mc:MovieClip;
		
		private var hit_rear:Shape;
		private var hit_lobby:Shape;
		private var hit_sculpture:Shape;
		private var hit_logo:Shape;
		
		private var hit_sky_00:Shape;
		private var hit_sky_01:Shape;
		private var hit_glass:Shape;
		private var hit_lamp_00:Shape;
		private var hit_lamp_01:Shape;
		private var hit_road:Shape;
		private var hit_steps:Shape;
		private var hit_build_00:Shape;
		private var hit_build_01:Shape;
		
		//	private var hit_elevator_door:Shape;
		private var DoorUnlocked:Boolean = false;
		private var DoorOpen:Boolean = false;
		private var Animating:Boolean = false;
		
		private var delayedCall:DelayedCall;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
	//	private var goback:GoBackButton;		
		private var RONum:int = 0;
		
		
		public function Exterior(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('exterior_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Exterior/exterior_bg.jpg'));
				game.TrackAssets('exterior_01');
			}
			if(game.CheckAsset('exterior_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Exterior/Exterior_SpriteSheet_01.png'));
				game.TrackAssets('exterior_02');
			}
			if(game.CheckAsset('exterior_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Exterior/Exterior_SpriteSheet_01.xml'));
				game.TrackAssets('exterior_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("Exterior","ExteriorObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('exterior_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			rear_car_lid = new Image(this.assets.getTexture('rear_car_lid'));
			rear_car_lid.touchable = false;
			rear_car_lid.x = 698;
			rear_car_lid.y = 344;
			
	
			door_mc = new MovieClip(this.assets.getTextures('door_frame_'),12);
			//	elevator_mc.smoothing = TextureSmoothing.NONE;
			door_mc.x = 393;
			door_mc.y = 257;
			door_mc.touchable = false;
			door_mc.loop = false; 
			
			
			door_close_mc = new MovieClip(this.assets.getTextures('door_frame_').reverse(),12);
			//elevator_mc.smoothing = TextureSmoothing.NONE;
			door_close_mc.x = 393;
			door_close_mc.y = 257;
			door_close_mc.touchable = false;
			door_close_mc.loop = false; 
			
			marquee_mc = new MovieClip(this.assets.getTextures('marquee_00').reverse(),12);
			//elevator_mc.smoothing = TextureSmoothing.NONE;
			marquee_mc.x = 182;
			marquee_mc.y = 30;
			marquee_mc.touchable = false;
			marquee_mc.loop = true; 
			
			marquee_mc.addFrameAt(01,this.assets.getTexture("marquee_00"), null, 2);
			marquee_mc.addFrameAt(02,this.assets.getTexture("marquee_01"), null, 0.05);
			marquee_mc.addFrameAt(03,this.assets.getTexture("marquee_00"), null, 0.05);
			marquee_mc.addFrameAt(04,this.assets.getTexture("marquee_01"), null, 0.05);
			marquee_mc.addFrameAt(05,this.assets.getTexture("marquee_00"), null, 1.5);
			marquee_mc.addFrameAt(06,this.assets.getTexture("marquee_01"), null, 0.05);
			marquee_mc.addFrameAt(07,this.assets.getTexture("marquee_00"), null, 0.05);
			marquee_mc.addFrameAt(08,this.assets.getTexture("marquee_01"), null, 0.05);
			marquee_mc.addFrameAt(09,this.assets.getTexture("marquee_00"), null, 1);
			marquee_mc.addFrameAt(10,this.assets.getTexture("marquee_01"), null, 0.05);
			marquee_mc.addFrameAt(11,this.assets.getTexture("marquee_00"), null, 0.05);
			marquee_mc.addFrameAt(12,this.assets.getTexture("marquee_01"), null, 0.05);
			marquee_mc.addFrameAt(13,this.assets.getTexture("marquee_00"), null, 3.5);
			marquee_mc.addFrameAt(14,this.assets.getTexture("marquee_01"), null, 0.05);
			marquee_mc.addFrameAt(15,this.assets.getTexture("marquee_00"), null, 0.05);
			marquee_mc.addFrameAt(16,this.assets.getTexture("marquee_01"), null, 0.05);
			marquee_mc.addFrameAt(17,this.assets.getTexture("marquee_00"), null, 5);
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Exterior != undefined){
				trace("MART MART");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Exterior['DoorUnlocked'] == 'Yes'){
					trace("SPARK SPARK");
					DoorUnlocked = true;
				}				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Exterior['ComingFromLobby'] == 'Yes'){
					door_mc.alpha = 0;		
					door_close_mc.alpha = 1;						
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Exterior;
					SaveArray['ComingFromLobby'] = 'No';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Exterior',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						trace('JOY');
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlidingDoor();
						Animating = true;
						DoorOpen = false;
						door_close_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onDoorCloseEnterFrame);
						door_close_mc.alpha = 1;
						
						door_close_mc.play();
						Starling.juggler.add(door_close_mc);
						//	Starling.juggler.add(elevator_mc);
					},2);
				}else{
					door_mc.alpha = 1;		
					door_close_mc.alpha = 0;		
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Exterior['FirstTime'] == 'Yes'){
					
				}else{
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Exterior;
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Exterior',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadCharmsSoft(true,4);
					},1.5);
				}
				
			}else{
				door_mc.alpha = 1;		
				door_close_mc.alpha = 0;		
				
				SaveArray['FirstTime'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Exterior',SaveArray);
				Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).MusicObj.LoadCharmsSoft(true,4);
				},1.5);
				
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear != undefined){				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear['TrunkUnlocked'] == 'Yes'){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRear['TrunkOpen'] == 'Yes'){						
						rear_car_lid.alpha =  1;						
					}else{
						
						rear_car_lid.alpha =  0;						
					}
				}else{
					rear_car_lid.alpha =  0;
				}
			}else{
				rear_car_lid.alpha =  0;
			}
			
	
			
			this.addChildAt(door_mc,1);	
			this.addChildAt(door_close_mc,2);	
			this.addChildAt(rear_car_lid,3);	
			this.addChildAt(marquee_mc,4);	
			//	CreateElevatorDoorHit();
		
			
			CreateLobbyHit();
			CreateRearHit();
			CreateCubeHit();
			
			CreateLogoHit();
			CreateSkyHit();
			CreateGlassHit();
			CreateLamp00Hit();
			CreateLamp01Hit();
			CreateSky01Hit();
			CreateRoadHit();
			CreateStepHit();
			CreateBuild00Hit();
			CreateBuild01Hit();
	//		goback = new GoBackButton(this.assets);
	//		this.addChild(goback);
			
		//	door_mc.play();
		//	Starling.juggler.add(door_mc);	
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		//	marquee_mc.addEventListener(TouchEvent.TOUCH,TouchHandler);
			marquee_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, MarqueeEnterFrameHandler);
			Starling.juggler.add(marquee_mc);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadCityHum(true,999);
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BuildingHum",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("WindOne",0,1,'stop');
			//(stage.getChildAt(0) as Object).AmbientObj.LoadWindOne(true,999);
		//	Starling.juggler.delayCall(function():void{
				
		//	},1);
		//	(stage.getChildAt(0) as Object).AmbientObj.LoadCityHum(true,999);
		}
		//hit_sculpture
		private function MarqueeEnterFrameHandler():void{
			if(marquee_mc.currentFrame == 2){
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
			}else if(marquee_mc.currentFrame == 6){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
			}else if(marquee_mc.currentFrame == 10){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
			}else if(marquee_mc.currentFrame == 14){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
			}
			
		
		}
		/*
		private var hit_sky_00:Shape;
		private var hit_sky_01:Shape;
		private var hit_glass:Shape;
		private var hit_lamp_00:Shape;
		private var hit_lamp_01:Shape;
		private var hit_road:Shape;
		private var hit_steps:Shape;
		*/
		
		//hit_build_00
		private function CreateBuild01Hit():void{
			hit_build_01 = new Shape();
			hit_build_01.touchable = false;
			hit_build_01.graphics.beginFill(0xff0000);
			
			hit_build_01.graphics.lineTo(0,125);	
			hit_build_01.graphics.lineTo(161,179);	
			hit_build_01.graphics.lineTo(161,205);	
			hit_build_01.graphics.lineTo(0,285);	
		
			hit_build_01.graphics.endFill(false);
			hit_build_01.alpha = 0.0;
			
			hit_build_01.graphics.precisionHitTest = true;	
			this.addChild(hit_build_01);
		}
		
		private function CreateBuild00Hit():void{
			hit_build_00 = new Shape();
			hit_build_00.touchable = false;
			hit_build_00.graphics.beginFill(0xff0000);
			
			hit_build_00.graphics.lineTo(664,131);	
			hit_build_00.graphics.lineTo(800,115);	
			hit_build_00.graphics.lineTo(800,227);	
			hit_build_00.graphics.lineTo(665,228);	
			
			hit_build_00.graphics.endFill(false);
			hit_build_00.alpha = 0.0;
			
			hit_build_00.graphics.precisionHitTest = true;	
			this.addChild(hit_build_00);
		}
		
		
		private function CreateStepHit():void{
			hit_steps = new Shape();
			hit_steps.touchable = false;
			hit_steps.graphics.beginFill(0xff0000);
			
			hit_steps.graphics.lineTo(270,378);	
			hit_steps.graphics.lineTo(315,331);	
			hit_steps.graphics.lineTo(523,328);	
			hit_steps.graphics.lineTo(481,410);	
			
			hit_steps.graphics.endFill(false);
			hit_steps.alpha = 0.0;
			
			hit_steps.graphics.precisionHitTest = true;	
			this.addChild(hit_steps);
		}
		
		
		private function CreateRoadHit():void{
			hit_road = new Shape();
			hit_road.touchable = false;
			hit_road.graphics.beginFill(0xff0000);
			
			hit_road.graphics.lineTo(101,427);	
			hit_road.graphics.lineTo(270,413);	
			hit_road.graphics.lineTo(479,421);	
			hit_road.graphics.lineTo(610,418);	
			hit_road.graphics.lineTo(604,512);	
			hit_road.graphics.lineTo(95,512);	
		
			hit_road.graphics.endFill(false);
			hit_road.alpha = 0.0;
			
			hit_road.graphics.precisionHitTest = true;	
			this.addChild(hit_road);
		}
		
		private function CreateLamp00Hit():void{
			hit_lamp_00 = new Shape();
			hit_lamp_00.touchable = false;
			hit_lamp_00.graphics.beginFill(0xff0000);
			
			hit_lamp_00.graphics.lineTo(255,215);	
			hit_lamp_00.graphics.lineTo(273,195);	
			hit_lamp_00.graphics.lineTo(318,188);	
			hit_lamp_00.graphics.lineTo(339,208);	
			hit_lamp_00.graphics.lineTo(324,238);	
			hit_lamp_00.graphics.lineTo(287,241);	
			
			hit_lamp_00.graphics.endFill(false);
			hit_lamp_00.alpha = 0.0;
			
			hit_lamp_00.graphics.precisionHitTest = true;	
			this.addChild(hit_lamp_00);
		}
		
		private function CreateLamp01Hit():void{
			hit_lamp_01 = new Shape();
			hit_lamp_01.touchable = false;
			hit_lamp_01.graphics.beginFill(0xff0000);
			
			hit_lamp_01.graphics.lineTo(519,165);	
			hit_lamp_01.graphics.lineTo(560,165);	
			hit_lamp_01.graphics.lineTo(592,316);	
			hit_lamp_01.graphics.lineTo(522,314);	
		
			hit_lamp_01.graphics.endFill(false);
			hit_lamp_01.alpha = 0.0;
			
			hit_lamp_01.graphics.precisionHitTest = true;	
			this.addChild(hit_lamp_01);
		}
		private function CreateSky01Hit():void{
			hit_sky_01 = new Shape();
			hit_sky_01.touchable = false;
			hit_sky_01.graphics.beginFill(0xff0000);
			
			hit_sky_01.graphics.lineTo(518,0);	
			hit_sky_01.graphics.lineTo(800,0);	
			hit_sky_01.graphics.lineTo(800,108);	
			hit_sky_01.graphics.lineTo(698,128);	
			hit_sky_01.graphics.lineTo(660,120);	
			hit_sky_01.graphics.lineTo(660,106);	
			hit_sky_01.graphics.lineTo(588,23);	
		
			hit_sky_01.graphics.endFill(false);
			hit_sky_01.alpha = 0.0;
			
			hit_sky_01.graphics.precisionHitTest = true;	
			this.addChild(hit_sky_01);
		}
		private function CreateSkyHit():void{
			hit_sky_00 = new Shape();
			hit_sky_00.touchable = false;
			hit_sky_00.graphics.beginFill(0xff0000);
			
			hit_sky_00.graphics.lineTo(0,0);	
			hit_sky_00.graphics.lineTo(423,0);	
			hit_sky_00.graphics.lineTo(419,63);	
			hit_sky_00.graphics.lineTo(211,117);	
			hit_sky_00.graphics.lineTo(160,172);	
			hit_sky_00.graphics.lineTo(5,120);	
			
			hit_sky_00.graphics.endFill(false);
			hit_sky_00.alpha = 0.0;
			
			hit_sky_00.graphics.precisionHitTest = true;	
			this.addChild(hit_sky_00);
		}
		//hit_glass
		private function CreateGlassHit():void{
			hit_glass = new Shape();
			hit_glass.touchable = false;
			hit_glass.graphics.beginFill(0xff0000);
			
			hit_glass.graphics.lineTo(218,198);	
			hit_glass.graphics.lineTo(220,152);	
			hit_glass.graphics.lineTo(393,113);	
			hit_glass.graphics.lineTo(415,86);	
			hit_glass.graphics.lineTo(586,48);	
			hit_glass.graphics.lineTo(629,115);	
			hit_glass.graphics.lineTo(633,192);	
			hit_glass.graphics.lineTo(612,232);	
			hit_glass.graphics.lineTo(560,159);	
			hit_glass.graphics.lineTo(510,165);	
			hit_glass.graphics.lineTo(505,234);	
			hit_glass.graphics.lineTo(384,242);	
			hit_glass.graphics.lineTo(385,309);	
			hit_glass.graphics.lineTo(342,312);	
			hit_glass.graphics.lineTo(345,176);	
			
			hit_glass.graphics.endFill(false);
			hit_glass.alpha = 0.0;
			
			hit_glass.graphics.precisionHitTest = true;	
			this.addChild(hit_glass);
		}
		private function CreateLogoHit():void{
			hit_logo = new Shape();
			hit_logo.touchable = false;
			hit_logo.graphics.beginFill(0xff0000);
			
			hit_logo.graphics.lineTo(293,55);	
			hit_logo.graphics.lineTo(325,17);	
			hit_logo.graphics.lineTo(373,40);	
			hit_logo.graphics.lineTo(373,90);	
			hit_logo.graphics.lineTo(333,105);	
			hit_logo.graphics.lineTo(298,102);	
			
			hit_logo.graphics.endFill(false);
			hit_logo.alpha = 0.0;
			
			hit_logo.graphics.precisionHitTest = true;	
			this.addChild(hit_logo);
		}
		
		
		private function CreateCubeHit():void{
			hit_sculpture = new Shape();
			hit_sculpture.touchable = false;
			hit_sculpture.graphics.beginFill(0xff0000);
			
			hit_sculpture.graphics.lineTo(12,291);	
			hit_sculpture.graphics.lineTo(166,209);	
			hit_sculpture.graphics.lineTo(250,245);	
			hit_sculpture.graphics.lineTo(285,339);	
			hit_sculpture.graphics.lineTo(257,409);	
			hit_sculpture.graphics.lineTo(257,409);	
			hit_sculpture.graphics.lineTo(99,423);	
			hit_sculpture.graphics.lineTo(12,385);	
			
			hit_sculpture.graphics.endFill(false);
			hit_sculpture.alpha = 0.0;
			
			hit_sculpture.graphics.precisionHitTest = true;	
			this.addChild(hit_sculpture);
		}
		
		private function CreateLobbyHit():void{
			hit_lobby = new Shape();
			hit_lobby.touchable = false;
			hit_lobby.graphics.beginFill(0xff0000);
			
			hit_lobby.graphics.lineTo(390,249);	
			hit_lobby.graphics.lineTo(509,238);	
			hit_lobby.graphics.lineTo(515,324);	
			hit_lobby.graphics.lineTo(505,354);	
			hit_lobby.graphics.lineTo(391,355);	
			
			hit_lobby.graphics.endFill(false);
			hit_lobby.alpha = 0.0;
			
			hit_lobby.graphics.precisionHitTest = true;	
			this.addChild(hit_lobby);
		}
		
		
		private function CreateRearHit():void{
			hit_rear = new Shape();
			hit_rear.touchable = false;
			hit_rear.graphics.beginFill(0xff0000);
			
			hit_rear.graphics.lineTo(655,240);	
			hit_rear.graphics.lineTo(794,234);	
			hit_rear.graphics.lineTo(795,384);	
			hit_rear.graphics.lineTo(654,419);	
			
			hit_rear.graphics.endFill(false);
			hit_rear.alpha = 0.0;
			
			hit_rear.graphics.precisionHitTest = true;	
			this.addChild(hit_rear);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						
						if(hit_rear.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WetSteps();
							FadeOut((ExteriorRear as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorRearObj,true
							);
						}else if(hit_lobby.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LobbyHanlder();
							//CreateLogoHit
						}else if(hit_logo.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LogoHandlerHandler();
						
						}else if(hit_lamp_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LampHandler();
						}else if(hit_lamp_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LampHandler();
						}else if(hit_glass.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							GlassHandler();
						}else if(hit_sky_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SkyHandler();
						}else if(hit_sky_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SkyHandler();
						}else if(hit_road.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							RoadHandler();
						}else if(hit_build_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BuildHandler();
						}else if(hit_build_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BuildHandler();
						}else if(hit_steps.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The steps are wet and slick. I should be careful.");
						}else if(hit_sculpture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WetSteps();
							FadeOut((ExteriorCube as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorCubeObj,true
							);
							
						}
						//hit_sculpture
				
					}
				}
			}
		}
		private function BuildHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Dark factories populate the night in this area.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The empty industrial buildings stand like sentinels in the midnight hours.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It's quiet... almost too quiet...");
			}
		}
		
		private function LampHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Small insects clamor around the light.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A faint electric hum is audible below the street lamp.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The thick air scatters the yellow light of the street lamp.");
			}
		}
		
		private function GlassHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The facility seems built of metal and poured concrete.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The night sky reflects off the polished glass.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The large glass windows are thick, perhaps even bullet-proof.");
			}
		}
		
		private function SkyHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The city twinkles under a canopy of clouds.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The lights of factories and offices shine below the overcast night sky.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Towers and smoke-stacks rise from the cacophony of structures like dark and silent obelisks.");
			}
		}
		
		private function RoadHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The damp asphalt shines under the street lamps.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The pavement is cold and damp.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Tiny bits of broken pebbles grate against the concrete under my feet.");
			}
		}
		
		private function LogoHandlerHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The glowing marquee of the company logo is attached to the facility.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The bright light flickers intermittently.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The light casts out crimson red rays.");
			}
		}
		
		private function LobbyHanlder():void{
			if(DoorUnlocked === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_KeyCard)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorBeepsAccessGranted();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlidingDoor();
					(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_KeyCard,
						"item_KeyCard"
					);
							
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Exterior != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Exterior;
					}
					
					SaveArray['DoorUnlocked'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Exterior',SaveArray);
					
					
					DoorUnlocked = true;
					DoorOpen = true;
					Animating = true;
					door_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onDoorEnterFrame);

					door_mc.play();
					Starling.juggler.add(door_mc);	
					
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorBeepsAccessDenied();
					
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The doors are electronically sealed.");
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a vertical slot to the left of the door. I believe it is for a key card.");
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The sliding doors won't open. I need the key to get inside.");
					}
				
				}
			}else{
				if(DoorOpen === false){
					DoorOpen = true;
					Animating = true;
					door_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onDoorEnterFrame);
					
					door_mc.play();
					Starling.juggler.add(door_mc);	
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlidingDoor();
				}else{
					
					door_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onDoorEnterFrame);
					FadeOut((Lobby as Class), 
						(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyObj,true
					);
				}
			}
		}
		
		private function onDoorEnterFrame():void{
			if(door_mc.currentFrame == 3){
				door_mc.alpha = 0;
				door_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onDoorEnterFrame);
				door_mc.stop();
				Animating = false;
				
			//	if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.CurrentRoomClass != undefined){
			//		if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.CurrentRoomClass == 'Exterior'){
						
				delayedCall = new DelayedCall(CloseDoor,4);
				
				Starling.juggler.add(delayedCall);
				//	Starling.juggler.remove(delayedCall);
		//			}
		//		}
				
				
			}
		}
		
		private function CloseDoor():void{
			trace('ANGER');
			Animating = true;
			DoorOpen = false;
			door_close_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onDoorCloseEnterFrame);
			door_close_mc.alpha = 1;
			
			door_close_mc.play();
			Starling.juggler.add(door_close_mc);
			CloseDoorPlaySound();
			//	Starling.juggler.add(elevator_mc);
		}
		
		private function CloseDoorPlaySound():void{
		
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlidingDoor();
		
			
		}
		
		private function onDoorCloseEnterFrame():void{
			if(door_close_mc.currentFrame == 3){
				trace('close frame 3');
				door_mc.alpha = 1;
				door_close_mc.alpha = 0;
				
				door_close_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onDoorCloseEnterFrame);
				door_close_mc.stop();
				Animating = false;
			}
		}
		
		private function FadeOut(loadClass:Class,loadObj:Object,Fade:Boolean = false):void{
			trace("FADE OUT");
			Starling.juggler.remove(delayedCall);
			Starling.juggler.purge();
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
			
			
			
			this.assets.removeTexture("exterior_bg",true);
			this.assets.removeTexture("Exterior_SpriteSheet_01",true);
			this.assets.removeTextureAtlas("Exterior_SpriteSheet_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("exterior_01");
			(stage.getChildAt(0) as Object).falseAsset("exterior_02");
			(stage.getChildAt(0) as Object).falseAsset("exterior_03");
			
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
