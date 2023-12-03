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
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;
	
	
	public class Containment extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var sparks_mc:MovieClip;
		
		private var hatch:Image;
		private var hatch_open:Image;
		private var hatch_screen:Image;
		private var hatch_screen_mc:MovieClip;
		
		
		private var control_screen:Image;
		private var control_blip_mc:MovieClip;
		
		private var hit_elevator:Shape;
		private var hit_hatch:Shape;
		private var hit_control:Shape;
		
		private var hit_static:Shape;
		private var hit_floor:Shape;
		private var hit_top:Shape;
		private var hit_dome:Shape;
		
		private var RONum:int = 0;
		
		private var HatchOverride:Boolean = false;
		private var HandAttached:Boolean = false;
		private var HatchOpen:Boolean = false;
		private var HatchOrange:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function Containment(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('containment_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Containment/containment_bg.jpg'));
				game.TrackAssets('containment_01');
			}
			if(game.CheckAsset('containment_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Containment/Containment_Sprite_01.png'));
				game.TrackAssets('containment_02');
			}
			if(game.CheckAsset('containment_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Containment/Containment_Sprite_01.xml'));
				game.TrackAssets('containment_03');
			}
			if(game.CheckAsset('containment_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Containment/Containment_Sprite_02.png'));
				game.TrackAssets('containment_04');
			}
			if(game.CheckAsset('containment_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Containment/Containment_Sprite_02.xml'));
				game.TrackAssets('containment_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("Containment","ContainmentObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('containment_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			/*			
			private var hatch:Image;
			private var hatch_open:Image;			
			private var control_screen:Image;
			private var control_blip_mc:MovieClip;
			
			*/
			sparks_mc = new MovieClip(this.assets.getTextures("sparks_05"),2);
			sparks_mc.x = 307;
			sparks_mc.y = 0;
			sparks_mc.touchable = false;
			sparks_mc.loop = true; 
			sparks_mc.play();
			
			
			sparks_mc.addFrameAt(01,this.assets.getTexture("sparks_05"), null, 2);
			sparks_mc.addFrameAt(02,this.assets.getTexture("sparks_00"), null, 0.1);
			sparks_mc.addFrameAt(03,this.assets.getTexture("sparks_05"), null, 0.1);
			sparks_mc.addFrameAt(04,this.assets.getTexture("sparks_01"), null, 0.1);
			sparks_mc.addFrameAt(05,this.assets.getTexture("sparks_05"), null, 1.5);
			sparks_mc.addFrameAt(06,this.assets.getTexture("sparks_02"), null, 0.1);
			sparks_mc.addFrameAt(07,this.assets.getTexture("sparks_05"), null, 0.1);
			sparks_mc.addFrameAt(08,this.assets.getTexture("sparks_03"), null, 0.1);
			sparks_mc.addFrameAt(09,this.assets.getTexture("sparks_05"), null, 1);
			sparks_mc.addFrameAt(10,this.assets.getTexture("sparks_04"), null, 0.1);
			sparks_mc.addFrameAt(11,this.assets.getTexture("sparks_05"), null, 0.1);
			sparks_mc.addFrameAt(12,this.assets.getTexture("sparks_02"), null, 0.1);
			sparks_mc.addFrameAt(13,this.assets.getTexture("sparks_05"), null, 3.5);
			sparks_mc.addFrameAt(14,this.assets.getTexture("sparks_00"), null, 0.1);
			sparks_mc.addFrameAt(15,this.assets.getTexture("sparks_05"), null, 0.1);
			sparks_mc.addFrameAt(16,this.assets.getTexture("sparks_01"), null, 0.1);
			sparks_mc.addFrameAt(17,this.assets.getTexture("sparks_05"), null, 5);
			
		
			control_blip_mc = new MovieClip(this.assets.getTextures("control_blip_0"),1);
			control_blip_mc.x = 57;
			control_blip_mc.y = 199;
			control_blip_mc.touchable = false;
			control_blip_mc.loop = true; 
			control_blip_mc.play();
			
			control_screen = new Image(this.assets.getTexture('control_screen_awating'));
			control_screen.touchable = false;
			control_screen.x = 61;
			control_screen.y = 230;	
			
			hatch_open = new Image(this.assets.getTexture('hatch_hatch_open'));
			hatch_open.touchable = false;
			hatch_open.x = 285;
			hatch_open.y = 148;	
			
			hatch = new Image(this.assets.getTexture('hatch_hatch_green'));
			hatch.touchable = false;
			hatch.x = 293;
			hatch.y = 196;	
			
			hatch_screen = new Image(this.assets.getTexture('hatch_lock_green'));
			hatch_screen.touchable = false;
			hatch_screen.x = 380;
			hatch_screen.y = 276;	
			
			hatch_screen_mc =new MovieClip(this.assets.getTextures("hatch_lock_orange_0"),1);
			hatch_screen_mc.touchable = false;
			hatch_screen_mc.x = 380;
			hatch_screen_mc.y = 276;	
			hatch_screen_mc.loop = true;
			
			
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Containment != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Containment['HatchOrange'] == 'Yes'){
					HatchOrange = true;
					
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Containment['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Containment;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Containment',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadEzekiel(true,3);
							
						},0.5);
					}
				}
			}else{
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Containment',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadEzekiel(true,3);
						
					},0.5);
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['Solved'] == 'Yes'){
					HatchOverride = true;
					
				}
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch['Hand'] == 'Attached'){	
					HandAttached = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch['Hatch'] == 'Open'){	
					HatchOpen = true;
				}
			}
			
			if(HatchOverride === true){
				
				if(HandAttached === true){
					control_screen.alpha = 1;
					if(HatchOpen === true){
						hatch.texture = this.assets.getTexture('hatch_hatch_red');
						control_screen.texture = this.assets.getTexture('control_screen_open');
						hatch_open.alpha = 1;
						hatch.alpha = 0;
						hatch_screen.alpha = 0;
						hatch_screen_mc.alpha = 0;
					}else{
						hatch.texture = this.assets.getTexture('hatch_hatch_red');
						control_screen.texture = this.assets.getTexture('control_screen_unlocked');
						hatch_open.alpha = 0;
						hatch.alpha = 1;
						hatch_screen.texture = this.assets.getTexture('hatch_lock_red');
						hatch_screen.alpha = 1;
						hatch_screen_mc.alpha = 0;
					}
						
				}else{
					if(HatchOrange === false){
						control_screen.alpha = 0;
						Animating = true;
						HatchOrange = true;
						
						Starling.juggler.delayCall(OrangeHatch,2);
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Containment != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Containment;	
						}
						SaveArray['HatchOrange'] = "Yes";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Containment',SaveArray);
						hatch_screen.alpha = 1;
						hatch_screen_mc.alpha = 0;
					}else{
						hatch.texture = this.assets.getTexture('hatch_hatch_orange');
						control_screen.alpha = 1;
						hatch_open.alpha = 0;
						hatch.alpha = 1;
						hatch_screen.alpha = 0;
						hatch_screen_mc.alpha = 1;
					}
					
				
				//	control_screen.alpha = 1;
					hatch_open.alpha = 0;
					hatch.alpha = 1;
				}
			}else{
				
				control_screen.alpha = 0;
				hatch_open.alpha = 0;
				hatch.alpha = 1;
				hatch_screen.alpha = 1;
				hatch_screen_mc.alpha = 0;
			}
			
			control_blip_mc.alpha = 1;
			sparks_mc.alpha = 1;
			
			this.addChildAt(sparks_mc,1);
			this.addChildAt(control_screen,2);
			this.addChildAt(control_blip_mc,3);
			this.addChildAt(hatch_open,4);
			this.addChildAt(hatch,5);
			this.addChildAt(hatch_screen,6);
			this.addChildAt(hatch_screen_mc,7);
			
						
			CreateElevatorHit();
			CreateHatchHit();
			CreateControlHit();
			
			CreateStaticHit();
			CreateFloorHit();
			CreateTopHit();
			CreateDomeHit();
		//	goback = new GoBackButton(this.assets);
		//	this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			sparks_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, SparksEnterFrameHandler);
			
			
			Starling.juggler.add(control_blip_mc);
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("QuantumBalls",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("QuantumDrone",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ShipGroansOne",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BasementBongs",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("DuctVibe",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadDarkness(true,999);
		
			
			Starling.juggler.delayCall(function():void{				
				(stage.getChildAt(0) as Object).AmbientObj.LoadBuildingHum(true,999);
			},0.5);
			
			Starling.juggler.add(sparks_mc);
			Starling.juggler.add(hatch_screen_mc);
		}
	
		private function SparksEnterFrameHandler():void{
			if(sparks_mc.currentFrame == 2){
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksFour();
			}else if(sparks_mc.currentFrame == 6){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksFour();
			}else if(sparks_mc.currentFrame == 10){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksFour();
			}else if(sparks_mc.currentFrame == 14){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksFour();
			}
			
			
		}
		
		private function OrangeHatch():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
			control_screen.alpha = 1;
			hatch_screen_mc.alpha = 1;
			hatch_screen.alpha = 0;
			
			hatch.texture = this.assets.getTexture('hatch_hatch_orange');
			Animating = false;
			
			if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
				//	SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
				//MarsLanding
				Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).MusicObj.LoadSubBop(true,2);
				},0.5);
			}
			
		}
		
		/*
		CreateStaticHit();
		CreateFloorHit();
		CreateTopHit();
		CreateDomeHit();
		
		
		*/
		
		private function CreateDomeHit():void{
			hit_dome = new Shape();
			
			hit_dome.graphics.beginFill(0x0000FF);
			hit_dome.graphics.lineTo(170,272);	
			hit_dome.graphics.lineTo(286,158);	
			hit_dome.graphics.lineTo(488,176);	
			hit_dome.graphics.lineTo(606,258);	
			hit_dome.graphics.lineTo(564,334);	
			hit_dome.graphics.lineTo(220,334);	
			
			hit_dome.graphics.endFill(false);
			hit_dome.alpha = 0.0;
			hit_dome.touchable = false;
			hit_dome.graphics.precisionHitTest = true;	
			
			this.addChild(hit_dome);
		}
		
		private function CreateTopHit():void{
			hit_top = new Shape();
			
			hit_top.graphics.beginFill(0x0000FF);
			hit_top.graphics.lineTo(183,0);	
			hit_top.graphics.lineTo(599,0);	
			hit_top.graphics.lineTo(608,163);	
			hit_top.graphics.lineTo(176,176);	
		
			
			hit_top.graphics.endFill(false);
			hit_top.alpha = 0.0;
			hit_top.touchable = false;
			hit_top.graphics.precisionHitTest = true;	
			
			this.addChild(hit_top);
		}
		
		
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			
			hit_floor.graphics.beginFill(0x0000FF);
			hit_floor.graphics.lineTo(139,434);	
			hit_floor.graphics.lineTo(244,399);	
			hit_floor.graphics.lineTo(578,407);	
			hit_floor.graphics.lineTo(585,502);	
			hit_floor.graphics.lineTo(166,502);	
		
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			hit_floor.touchable = false;
			hit_floor.graphics.precisionHitTest = true;	
			
			this.addChild(hit_floor);
		}
		
		private function CreateStaticHit():void{
			hit_static = new Shape();
		
			hit_static.graphics.beginFill(0x0000FF);
			hit_static.graphics.lineTo(328,0);	
			hit_static.graphics.lineTo(438,0);	
			hit_static.graphics.lineTo(446,67);	
			hit_static.graphics.lineTo(421,179);	
			hit_static.graphics.lineTo(351,175);	
			hit_static.graphics.lineTo(314,60);	
				
			hit_static.graphics.endFill(false);
			hit_static.alpha = 0.0;
			hit_static.touchable = false;
			hit_static.graphics.precisionHitTest = true;	
			
			this.addChild(hit_static);
		}
		
		private function CreateControlHit():void{
			hit_control = new Shape();
			
			hit_control.graphics.beginFill(0x0000FF);
			hit_control.graphics.lineTo(0,136);	
			hit_control.graphics.lineTo(153,152);	
			hit_control.graphics.lineTo(143,291);	
			hit_control.graphics.lineTo(195,346);	
			hit_control.graphics.lineTo(193,426);	
			hit_control.graphics.lineTo(149,432);	
			hit_control.graphics.lineTo(39,312);	
			hit_control.graphics.lineTo(0,312);	
			
			hit_control.graphics.endFill(false);
			hit_control.alpha = 0.0;
			hit_control.touchable = false;
			hit_control.graphics.precisionHitTest = true;	
			this.addChild(hit_control);
		}
		
		private function CreateHatchHit():void{
			hit_hatch = new Shape();
		
			hit_hatch.graphics.beginFill(0x0000FF);
			hit_hatch.graphics.lineTo(323,347);	
			hit_hatch.graphics.lineTo(326,265);	
			hit_hatch.graphics.lineTo(362,229);	
			hit_hatch.graphics.lineTo(429,237);	
			hit_hatch.graphics.lineTo(450,285);	
			hit_hatch.graphics.lineTo(456,357);	
			
			hit_hatch.graphics.endFill(false);
			hit_hatch.alpha = 0.0;
			hit_hatch.touchable = false;
			hit_hatch.graphics.precisionHitTest = true;	
			this.addChild(hit_hatch);
		}
		
		private function CreateElevatorHit():void{
			hit_elevator = new Shape();
			
			hit_elevator.graphics.beginFill(0x0000FF);
			hit_elevator.graphics.lineTo(653,254);	
			hit_elevator.graphics.lineTo(729,234);	
			hit_elevator.graphics.lineTo(745,383);	
			hit_elevator.graphics.lineTo(685,414);	
			hit_elevator.graphics.lineTo(656,409);	
		
			hit_elevator.graphics.endFill(false);
			hit_elevator.alpha = 0.0;
			hit_elevator.touchable = false;
			hit_elevator.graphics.precisionHitTest = true;	
			this.addChild(hit_elevator);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						 if(hit_elevator.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((LiftElevator as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.LiftElevatorObj,true
								 );
						 }else if(hit_hatch.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							 FadeOut((ContainmentHatch as Class), 
								 (stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentHatchObj,true
							 );
						 }else if(hit_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							 (stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalSteps();
							 FadeOut((ContainmentControl as Class), 
								 (stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentControlObj,true
							 );
						 }else if(hit_static.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							 if(RONum == 0){
								 RONum = 1;
								 (stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Powerful bolts of electricity discharge in the cold air.");	
							 }else if(RONum == 1){
								 RONum = 2;
								 (stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The huge quantity of power running through the structure is palpable.");	
							 }else if(RONum == 2){
								 RONum = 0;
								 (stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Purple blue sparks are released intermittently.");	
							 }
						 }else if(hit_dome.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							 if(RONum == 0){
								 RONum = 1;
								 (stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("All manner of pipe, conduit, and cable weave over the structure's surface...");	
							 }else if(RONum == 1){
								 RONum = 2;
								 (stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The metal dome is spherical and vibrates out a deep hum.");	
							 }else if(RONum == 2){
								 RONum = 0;
								 (stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("All manner of pipe, conduit, and cable weave over the structure's surface...");	
							 }
						 }else if(hit_top.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							 if(RONum == 0){
								 RONum = 1;
								 (stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The structure is built directly into the granite bedrock.");	
							 }else if(RONum == 1){
								 RONum = 2;
								 (stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Parts of this cave appear to be a natural formation.");	
							 }else if(RONum == 2){
								 RONum = 0;
								 (stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Steel beams and struts support the enormous structure.");	
							 }
						 }else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							 (stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The floor is made of coarse stone.");	
						 }
				
					}
				}
			}
		}
		/*
		hit_dome
		hit_static
		hit_floor
		hit_top
		*/
		
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
			
			
			
			this.assets.removeTexture("containment_bg",true);
			this.assets.removeTexture("Containment_Sprite_01",true);
			this.assets.removeTextureAtlas("Containment_Sprite_01",true);
			this.assets.removeTexture("Containment_Sprite_02",true);
			this.assets.removeTextureAtlas("Containment_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("containment_01");
			(stage.getChildAt(0) as Object).falseAsset("containment_02");
			(stage.getChildAt(0) as Object).falseAsset("containment_03");
			(stage.getChildAt(0) as Object).falseAsset("containment_04");
			(stage.getChildAt(0) as Object).falseAsset("containment_05");
			
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
