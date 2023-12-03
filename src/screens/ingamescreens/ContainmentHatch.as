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
	
	
	public class ContainmentHatch extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var hatch_closed:Image;
		private var hatch_open:Image;
		private var hatch_screen:Image;
		private var bg_light:Image;
		
		private var screen_hand_mc:MovieClip;
		
		private var hit_screen:Shape;
		private var hit_hatch:Shape;
		private var hit_hole:Shape;
		private var hit_light:Shape;
		private var hit_left:Shape;
		private var hit_right:Shape;
		
		private var HatchOverride:Boolean = false;
		private var HatchUnlocked:Boolean = false;
		private var HatchOpen:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function ContainmentHatch(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('containmentHatch_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentHatch/containmentHatch_bg.jpg'));
				game.TrackAssets('containmentHatch_01');
			}
			if(game.CheckAsset('containmentHatch_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentHatch/ContainmentHatch_Sprite_01.png'));
				game.TrackAssets('containmentHatch_02');
			}
			if(game.CheckAsset('containmentHatch_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentHatch/ContainmentHatch_Sprite_01.xml'));
				game.TrackAssets('containmentHatch_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ContainmentHatch","ContainmentHatchObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('containmentHatch_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			bg_light = new Image(this.assets.getTexture('light_orange'));
			bg_light.touchable = false;
			bg_light.x = 60;
			bg_light.y = 0;	
			
			hatch_open = new Image(this.assets.getTexture('hatch_open'));
			hatch_open.touchable = false;
			hatch_open.x = 253;
			hatch_open.y = 0;	
			
			hatch_closed = new Image(this.assets.getTexture('hatch_green'));
			hatch_closed.touchable = false;
			hatch_closed.x = 160;
			hatch_closed.y = 58;	
			
			hatch_screen = new Image(this.assets.getTexture('screen_green_lock'));
			hatch_screen.touchable = false;
			hatch_screen.x = 352;
			hatch_screen.y = 183;	
			
			screen_hand_mc = new MovieClip(this.assets.getTextures("screen_orange_lock"),1);
			screen_hand_mc.x = 352;
			screen_hand_mc.y = 183;
			screen_hand_mc.touchable = false;
			screen_hand_mc.loop = true; 
			screen_hand_mc.stop();
			
			screen_hand_mc.addFrameAt(1,this.assets.getTexture("screen_orange_hand"), null, 1);
			
			
			
			/*
			352
			private var hatch:Image;
			private var hatch_open:Image;
			private var hatch_screen:Image;
			private var bg_light:Image;
			
			private var LockDisabled:Boolean = false;
			private var HatchUnlocked:Boolean = false;
			private var HatchOpen:Boolean = false;
			*/
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['Solved'] == 'Yes'){
					HatchOverride = true;
				}
			}
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch['Hand'] == 'Attached'){	
					HatchUnlocked = true;
					hatch_closed.texture = this.assets.getTexture("hatch_red");
					bg_light.texture = this.assets.getTexture("light_red");
					hatch_screen.texture = this.assets.getTexture("screen_red_unlock");
					bg_light.alpha = 1;
					screen_hand_mc.alpha = 0;
				}else{
					if(HatchOverride === true){
						hatch_closed.texture = this.assets.getTexture("hatch_orange");
						bg_light.texture = this.assets.getTexture("light_orange");
						hatch_screen.texture = this.assets.getTexture("screen_orange_x");
						bg_light.alpha = 1;
						screen_hand_mc.alpha = 1;
						screen_hand_mc.play();
					}else{
						bg_light.alpha = 0;
						screen_hand_mc.alpha = 0;
					}
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch['Hatch'] == 'Open'){	
					HatchOpen = true;
					hatch_open.alpha = 1;
					hatch_closed.alpha = 0;
					hatch_screen.alpha = 0;
					screen_hand_mc.alpha = 0;
				}else{
					hatch_open.alpha = 0;
					hatch_closed.alpha = 1;
					hatch_screen.alpha = 1;
				//	screen_hand_mc.alpha = 0;
				}
				
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentHatch',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadErrieAlley(true,2);
							
						},0.5);
					}
				}
				
			}else{
				
				if(HatchOverride === true){
					hatch_closed.texture = this.assets.getTexture("hatch_orange");
					bg_light.texture = this.assets.getTexture("light_orange");
					hatch_screen.texture = this.assets.getTexture("screen_orange_x");
					bg_light.alpha = 1;
					screen_hand_mc.alpha = 1;
					screen_hand_mc.play();
					hatch_open.alpha = 0;
					hatch_closed.alpha = 1;
				}else{
					hatch_open.alpha = 0;
					hatch_closed.alpha = 1;
					hatch_screen.alpha = 1;
					screen_hand_mc.alpha = 0;
					bg_light.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Containment',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadErrieAlley(true,2);
						
					},0.5);
				}
				
				
			
			}
			
			
			
			
			
			this.addChildAt(bg_light,1);
			this.addChildAt(hatch_open,2);
			this.addChildAt(hatch_closed,3);
			this.addChildAt(hatch_screen,4);
			this.addChildAt(screen_hand_mc,5);
			
			CreateHoleHit();
			CreateScreenHit();
			CreateHatchHit(HatchOpen);
			
			CreateLeftHit();
			CreateLightHit();
			CreateRightHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("DuctVibe",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Drone",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ControlBeeps",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("QuantumDrone",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadDarkness(true,999);
			Starling.juggler.delayCall(function():void{				
				(stage.getChildAt(0) as Object).AmbientObj.LoadBuildingHum(true,999);
			},0.5);
			
			
			Starling.juggler.add(screen_hand_mc);
		}
		
		//hit_screen
		
		
		private function CreateHatchHit(open:Boolean = false):void{
			hit_hatch = new Shape();		
			hit_hatch.x = 0;
			hit_hatch.y = 0;
			hit_hatch.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_hatch.graphics.lineTo(148,256);					
				hit_hatch.graphics.lineTo(196,140);					
				hit_hatch.graphics.lineTo(321,56);					
				hit_hatch.graphics.lineTo(476,58);					
				hit_hatch.graphics.lineTo(595,135);					
				hit_hatch.graphics.lineTo(651,260);					
				hit_hatch.graphics.lineTo(621,400);					
				hit_hatch.graphics.lineTo(495,503);					
				hit_hatch.graphics.lineTo(316,505);					
				hit_hatch.graphics.lineTo(188,403);					
				
			}else{
				
				hit_hatch.graphics.lineTo(258,0);
				hit_hatch.graphics.lineTo(548,0);
				hit_hatch.graphics.lineTo(482,97);
				hit_hatch.graphics.lineTo(292,88);
			
			}				
			hit_hatch.graphics.endFill(false);			
			hit_hatch.alpha = 0.1;			
			hit_hatch.graphics.precisionHitTest = true;	
			hit_hatch.touchable = false
			this.addChild(hit_hatch);
			
			
		}
		
		/*
		CreateLeftHit();
		CreateLightHit();
		CreateRightHit();
	
		*/
		private function CreateRightHit():void{
			hit_right = new Shape();
			hit_right.touchable = false;
			hit_right.graphics.beginFill(0xff0000);
			
			hit_right.graphics.lineTo(496,0);	
			hit_right.graphics.lineTo(668,0);	
			hit_right.graphics.lineTo(800,123);	
			hit_right.graphics.lineTo(800,231);	
			hit_right.graphics.lineTo(648,233);	
			hit_right.graphics.lineTo(578,116);	
			
			hit_right.graphics.endFill(false);
			hit_right.alpha = 0.0;
			
			hit_right.graphics.precisionHitTest = true;	
			this.addChild(hit_right);
		}
		
		private function CreateLeftHit():void{
			hit_left = new Shape();
			hit_left.touchable = false;
			hit_left.graphics.beginFill(0xff0000);
			
			hit_left.graphics.lineTo(0,0);	
			hit_left.graphics.lineTo(294,10);	
			hit_left.graphics.lineTo(139,279);	
			hit_left.graphics.lineTo(5,284);	
		
			hit_left.graphics.endFill(false);
			hit_left.alpha = 0.0;
			
			hit_left.graphics.precisionHitTest = true;	
			this.addChild(hit_left);
		}
		
		private function CreateLightHit():void{
			hit_light = new Shape();
			hit_light.touchable = false;
			hit_light.graphics.beginFill(0xff0000);
			
			hit_light.graphics.lineTo(310,0);	
			hit_light.graphics.lineTo(493,0);	
			hit_light.graphics.lineTo(493,66);	
			hit_light.graphics.lineTo(310,66);	
						
			hit_light.graphics.endFill(false);
			hit_light.alpha = 0.0;
			
			hit_light.graphics.precisionHitTest = true;	
			this.addChild(hit_light);
		}
		
		private function CreateHoleHit():void{
			hit_hole = new Shape();
			hit_hole.touchable = false;
			hit_hole.graphics.beginFill(0xff0000);
			
			hit_hole.graphics.lineTo(208,277);	
			hit_hole.graphics.lineTo(266,161);	
			hit_hole.graphics.lineTo(400,113);	
			hit_hole.graphics.lineTo(529,167);	
			hit_hole.graphics.lineTo(579,288);	
			hit_hole.graphics.lineTo(523,428);	
			hit_hole.graphics.lineTo(411,467);	
			hit_hole.graphics.lineTo(250,400);	
		
			hit_hole.graphics.endFill(false);
			hit_hole.alpha = 0.0;
			
			hit_hole.graphics.precisionHitTest = true;	
			this.addChild(hit_hole);
		}
		private function CreateScreenHit():void{
			hit_screen = new Shape();
			hit_screen.touchable = false;
			hit_screen.graphics.beginFill(0xff0000);
			
			hit_screen.graphics.lineTo(307,225);	
			hit_screen.graphics.lineTo(345,165);	
			hit_screen.graphics.lineTo(406,145);	
			hit_screen.graphics.lineTo(468,174);	
			hit_screen.graphics.lineTo(495,232);	
			hit_screen.graphics.lineTo(465,295);	
			hit_screen.graphics.lineTo(400,320);	
			hit_screen.graphics.lineTo(331,289);		
		
			hit_screen.graphics.endFill(false);
			hit_screen.alpha = 0.0;
			
			hit_screen.graphics.precisionHitTest = true;	
			this.addChild(hit_screen);
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
							FadeOut((Containment as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentObj,true
							);
						}else if(HatchOpen === false){
							if(hit_screen.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(HatchUnlocked === true){
									HatchHandler();
								}else{
									ScreenHandler();
								}
							}
							else if(hit_hatch.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								HatchHandler();
							}
							else if(hit_light.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LightHandler();
							}
							else if(hit_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SidesHandler();
							}
							else if(hit_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SidesHandler();
							}
							/*
							private var hit_light:Shape;
							private var hit_left:Shape;
							private var hit_right:Shape;
							*/
							
						}else{
							if(hit_hatch.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								HatchHandler();
							}else if(hit_hole.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalSteps();
								FadeOut((ContainmentInterior as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentInteriorObj,false
								);
							}
						}
					}
				}
			}
		}
		private function LightHandler():void{
			if(HatchOverride === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A green light.");
			}else{
				if(HatchUnlocked === true){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A red warning light shines over the hatch.");
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A light shines a cautionary orange glow over the hatch.");
				}
			}
			
			//HatchOverride
			//HatchUnlocked
		}
		
		private function SidesHandler():void{
			
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Large pipes connect into the structure.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Thick cabling criss-crosses the surface of the dome.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can feel a strong vibration.");
			}
			
		}
		private function ScreenHandler():void{
			if(HatchOverride === false){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The screen displays a reassuring green lock.");
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("What is in there?");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't see any way to open the hatch here...");
				}
				
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorBeepsAccessDenied();
				
			}else{
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Hand)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorBeepsAccessGranted();
					Animating = true;
					HatchUnlocked = true;
					hatch_screen.texture = this.assets.getTexture("screen_red_disc");
					bg_light.texture = this.assets.getTexture("light_red");
					screen_hand_mc.stop();
					screen_hand_mc.alpha = 0;
					
					Starling.juggler.delayCall(UnlockHatch,2);
					game.SoundFXObj.PlaySFX_AirRelease();		
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch;	
					}
					SaveArray['Hand'] = "Attached";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentHatch',SaveArray);
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_Hand,
							"item_Hand"
						);
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorBeepsAccessDenied();
					
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Locked...");	
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The door is looking for a particular palm print.");	
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The system indicates it needs a biometric key...");
					}
					
					
				}
				
			}
		}
		
		/*
		game.SoundFXObj.PlaySFX_CosmicDoor();
		game.SoundFXObj.PlaySFX_EnergyPulse();
		*/
		private function UnlockHatch():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
			//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorBeepsAccessDenied();
			
			hatch_screen.texture = this.assets.getTexture("screen_red_unlock");
			Animating = false;
			game.SoundFXObj.PlaySFX_EnergyPulse();
		}
		
		private function HatchHandler():void{
			
			if(HatchOpen === false){
				if(HatchUnlocked === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The hatch to the chamber is tightly sealed...");
					
				}else{
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch;	
					}
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxOpen();
					HatchOpen = true;
					hatch_closed.alpha = 0;
					hatch_screen.alpha = 0;
					hatch_open.alpha = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirRelease();
					hit_hatch._graphics.clear();
					CreateHatchHit(true);
					SaveArray['Hatch'] = "Open";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentHatch',SaveArray);
				}
			}else{
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch;	
				}
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxClose();
				HatchOpen = false;
				hatch_closed.alpha = 1;
				hatch_open.alpha = 0;
				hatch_screen.alpha = 1;
				hit_hatch._graphics.clear();
				CreateHatchHit(false);
				SaveArray['Hatch'] = "Closed";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentHatch',SaveArray);
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
			
			
			
			this.assets.removeTexture("containmentHatch_bg",true);
			this.assets.removeTexture("ContainmentHatch_Sprite_01",true);
			this.assets.removeTextureAtlas("ContainmentHatch_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("containmentHatch_01");
			(stage.getChildAt(0) as Object).falseAsset("containmentHatch_02");
			(stage.getChildAt(0) as Object).falseAsset("containmentHatch_03");
			
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
