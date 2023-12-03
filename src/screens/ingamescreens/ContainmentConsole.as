package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.DelayedCall;
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
	
	public class ContainmentConsole extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
	//	public var SaveArray2:Array = new Array();
		
		private var bg:Image;
			
		private var screen_three_mc:MovieClip;
		private var screen_two_mc:MovieClip;
		private var screen_ulam_mc:MovieClip;
		private var screen_zero_mc:MovieClip;
		private var screen_zero_still:Image;
		
		private var fuse_blue:Image;
		private var fuse_green:Image;
		private var fuse_red:Image;	
		
		private var spinner_mc:MovieClip;
		
		private var hit_screen_zero:Shape;
		private var hit_ulam:Shape;
		private var hit_lamps:Shape;
		private var hit_screen_extra:Shape;
		
		private var Animating:Boolean = false;
		private var SpinnerOn:Boolean = false;
		private var PreviousStartUp:Boolean = false;
	
		private var MusicPlayed:Boolean = false;
		private var QuantumRedAttached:Boolean = false;
		private var QuantumGreenAttached:Boolean = false;
		private var QuantumBlueAttached:Boolean = false;
		private var UlamUnlocked:Boolean = false;
		private var CalibratorSolved:Boolean = false;
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		private var RONum:int = 0;
		
		private var delayedCall:DelayedCall;
		
		public function ContainmentConsole(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('containmentConsole_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentConsole/containmentConsole_bg.jpg'));
				game.TrackAssets('containmentConsole_01');
			}
			if(game.CheckAsset('containmentConsole_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentConsole/ContainmentConsole_Sprite_01.png'));
				game.TrackAssets('containmentConsole_02');
			}
			if(game.CheckAsset('containmentConsole_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentConsole/ContainmentConsole_Sprite_01.xml'));
				game.TrackAssets('containmentConsole_03');
			}
			if(game.CheckAsset('containmentConsole_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentConsole/ContainmentConsole_Sprite_02.png'));
				game.TrackAssets('containmentConsole_04');
			}
			if(game.CheckAsset('containmentConsole_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentConsole/ContainmentConsole_Sprite_02.xml'));
				game.TrackAssets('containmentConsole_05');
			}
			//ContainmentConsole_Sprite_01
			//ContainmentInterior_Sprite_01
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ContainmentConsole","ContainmentConsoleObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('containmentConsole_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
		//	spinner_mc = new MovieClip(this.assets.getTextures("q_spinner_").reverse(),16);
			spinner_mc = new MovieClip(this.assets.getTextures("q_spinner_"),16);
			spinner_mc.x = 0;
			spinner_mc.y = 0;
			spinner_mc.touchable = false;
			spinner_mc.loop = true; 
			spinner_mc.stop();
			
			screen_three_mc = new MovieClip(this.assets.getTextures("screen_three_0"),3);
			screen_three_mc.x = 609;
			screen_three_mc.y = 21;
			screen_three_mc.touchable = false;
			screen_three_mc.loop = true; 
			screen_three_mc.play();
			
			
			screen_two_mc = new MovieClip(this.assets.getTextures("screen_two_0"),5);
			screen_two_mc.x = 395;
			screen_two_mc.y = 0;
			screen_two_mc.touchable = false;
			screen_two_mc.loop = true; 
			screen_two_mc.play();
			
			screen_ulam_mc  = new MovieClip(this.assets.getTextures("screen_ulam_batch_0"),2);
			screen_ulam_mc.x = 106;
			screen_ulam_mc.y = 195;
			screen_ulam_mc.touchable = false;
			screen_ulam_mc.loop = true; 
			screen_ulam_mc.play();
		
			screen_zero_mc = new MovieClip(this.assets.getTextures("screen_zero_running_00"),8);
			screen_zero_mc.x = 467;
			screen_zero_mc.y = 143;
			screen_zero_mc.touchable = false;
			screen_zero_mc.loop = true; 
			screen_zero_mc.stop();
			
			screen_zero_mc.addFrameAt(1,this.assets.getTexture("screen_zero_running_01"), null, 0.125);
			screen_zero_mc.addFrameAt(2,this.assets.getTexture("screen_zero_running_02"), null, 0.125);
			screen_zero_mc.addFrameAt(3,this.assets.getTexture("screen_zero_running_03"), null, 0.125);
			screen_zero_mc.addFrameAt(4,this.assets.getTexture("screen_zero_running_02"), null, 0.125);
			screen_zero_mc.addFrameAt(3,this.assets.getTexture("screen_zero_running_01"), null, 0.125);
			
			
			screen_zero_still = new Image(this.assets.getTexture('screen_zero_stopped'));
			screen_zero_still.touchable = false;
			screen_zero_still.x = 467;
			screen_zero_still.y = 143;
			
			fuse_blue = new Image(this.assets.getTexture('fuse_blue'));
			fuse_blue.touchable = false;
			fuse_blue.x = 334;
			fuse_blue.y = 90;
			
			fuse_green = new Image(this.assets.getTexture('fuse_green'));
			fuse_green.touchable = false;
			fuse_green.x = 283;
			fuse_green.y = 87;
			
			fuse_red = new Image(this.assets.getTexture('fuse_red'));
			fuse_red.touchable = false;
			fuse_red.x = 219;
			fuse_red.y = 83;
			
			/*
			private var SpinnerOn:Boolean = false;
			private var PreviousStartUp:Boolean = false;
			*/
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentConsole != undefined){
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentConsole['MusicPlayed'] == 'Yes'){
					MusicPlayed = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentConsole['PreviousStartUp'] == 'Yes'){
					PreviousStartUp = true;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentConsole['SpinnerOn'] == 'Yes'){
					SpinnerOn = true;
					screen_zero_still.alpha = 0;
					screen_zero_mc.play();
					spinner_mc.play();
					if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('SpinLoop') === true){
						
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SpinLoop(999);
					}
				
				}else{
					screen_zero_still.alpha = 1;
				}
			}else{
				
				screen_zero_still.alpha = 1;
			}
			
			
			
			screen_zero_mc.alpha = 1;
			spinner_mc.alpha = 1;
			screen_three_mc.alpha = 1;
			screen_two_mc.alpha = 1;
		

			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum['RedAttached'] == 'Yes'){
					QuantumRedAttached = true;
					fuse_red.alpha = 1;
				}else{
					fuse_red.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum['GreenAttached'] == 'Yes'){
					QuantumGreenAttached = true;
					fuse_green.alpha = 1;
				}else{
					fuse_green.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum['BlueAttached'] == 'Yes'){
					QuantumBlueAttached = true;
					fuse_blue.alpha = 1
				}else{
					fuse_blue.alpha = 0;
				}
			}else{
				fuse_blue.alpha = 0;
				fuse_green.alpha = 0;
				fuse_red.alpha = 0;
			}
			
			if(QuantumRedAttached === true){
				if(QuantumGreenAttached === true){
					if(QuantumBlueAttached === true){
						if(SpinnerOn === true){
							UlamUnlocked = true;
							screen_ulam_mc.alpha = 0;
						}else{
							screen_ulam_mc.alpha = 1;
						}						
					}else{
						screen_ulam_mc.alpha = 1;
					}
				}else{
					screen_ulam_mc.alpha = 1;
				}
			}else{
				screen_ulam_mc.alpha = 1;
			}
		/*
			private var QuantumRedAttached:Boolean = false;
			private var QuantumGreenAttached:Boolean = false;
			private var QuantumBlueAttached:Boolean = false;
			private var UlamUnlocked:Boolean = false;
			
			*/
			
			this.addChildAt(spinner_mc,1);
			this.addChildAt(screen_three_mc,2);
			this.addChildAt(screen_two_mc,3);
			this.addChildAt(screen_ulam_mc,4);
			this.addChildAt(screen_zero_mc,5);
			this.addChildAt(screen_zero_still,6);
			this.addChildAt(fuse_blue,7);
			this.addChildAt(fuse_green,8);
			this.addChildAt(fuse_red,9);
			
			CreateScreenZeroHit();
			CreateUlamHit();
			CreateLampHit();
			CreateScreenHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
		
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			Starling.juggler.add(spinner_mc);
			Starling.juggler.add(screen_three_mc);
			Starling.juggler.add(screen_two_mc);
			Starling.juggler.add(screen_ulam_mc);
			Starling.juggler.add(screen_zero_mc);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['Solved'] == 'Yes'){
					CalibratorSolved = true;
				}
			}
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).AmbientObj.LoadSpaceHumPower(true,999);
				
			},0.5);
			delayedCall = new DelayedCall(LoadDrone,1);
			Starling.juggler.add(delayedCall);
		}
		
		private function LoadDrone():void{
		//	(stage.getChildAt(0) as Object).AmbientObj.LoadDuctVibe(true,999);
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).AmbientObj.LoadControlBeeps(true,999);
			},0.25);
			
			if(CalibratorSolved === true){
				(stage.getChildAt(0) as Object).AmbientObj.LoadQuantumDrone(true,999);				
			}
			
		}
		/*
		CreateLampHit();
		CreateScreenHit();
		
		
		*/
		private function CreateScreenHit():void{
			hit_screen_extra = new Shape();
			hit_screen_extra.touchable = false;
			hit_screen_extra.graphics.beginFill(0xff0000);
			
			hit_screen_extra.graphics.lineTo(390,0);	
			hit_screen_extra.graphics.lineTo(663,0);	
			hit_screen_extra.graphics.lineTo(685,126);	
			hit_screen_extra.graphics.lineTo(409,126);	
						
			hit_screen_extra.graphics.endFill(false);
			hit_screen_extra.alpha = 0.0;
			
			hit_screen_extra.graphics.precisionHitTest = true;	
			this.addChild(hit_screen_extra);
		}
		
		
		private function CreateLampHit():void{
			hit_lamps = new Shape();
			hit_lamps.touchable = false;
			hit_lamps.graphics.beginFill(0xff0000);
			
			hit_lamps.graphics.lineTo(193,62);	
			hit_lamps.graphics.lineTo(218,19);	
			hit_lamps.graphics.lineTo(364,35);	
			hit_lamps.graphics.lineTo(387,89);	
			hit_lamps.graphics.lineTo(375,186);	
			hit_lamps.graphics.lineTo(208,168);	
					
			hit_lamps.graphics.endFill(false);
			hit_lamps.alpha = 0.0;
			
			hit_lamps.graphics.precisionHitTest = true;	
			this.addChild(hit_lamps);
		}
		
		private function CreateUlamHit():void{
			hit_ulam = new Shape();
			hit_ulam.touchable = false;
			hit_ulam.graphics.beginFill(0xff0000);
			
			hit_ulam.graphics.lineTo(95,200);	
			hit_ulam.graphics.lineTo(256,189);	
			hit_ulam.graphics.lineTo(320,329);	
			hit_ulam.graphics.lineTo(163,371);	
		
			hit_ulam.graphics.endFill(false);
			hit_ulam.alpha = 0.0;
			
			hit_ulam.graphics.precisionHitTest = true;	
			this.addChild(hit_ulam);
		}
		
		private function CreateScreenZeroHit():void{
			hit_screen_zero = new Shape();
			hit_screen_zero.touchable = false;
			hit_screen_zero.graphics.beginFill(0xff0000);
			
			hit_screen_zero.graphics.lineTo(462,137);	
			hit_screen_zero.graphics.lineTo(718,137);	
			hit_screen_zero.graphics.lineTo(706,320);	
			hit_screen_zero.graphics.lineTo(460,284);	
		
			hit_screen_zero.graphics.endFill(false);
			hit_screen_zero.alpha = 0.0;
			
			hit_screen_zero.graphics.precisionHitTest = true;	
			this.addChild(hit_screen_zero);
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
							FadeOut((ContainmentInterior as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentInteriorObj,true
							);
							//}else if(hit_button.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							
						}else if(hit_screen_zero.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ScreenZeroHandler();
						
						}else if(hit_ulam.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(UlamUnlocked === false){
								if(RONum == 0){
									RONum = 1;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A grid of numbers blink on and off randomly...");	
								}else if(RONum == 1){
									RONum = 2;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The console screen is unresponsive...");	
								}else if(RONum == 2){
									RONum = 0;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmmm.... nothing happens when I touch the screen...");
								}
							}else{
								FadeOut((ContainmentUlam as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentUlamObj,true
								);
							}
							
						}else if(hit_lamps.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){							
							if(QuantumRedAttached === true){
								if(QuantumGreenAttached === true){
									if(QuantumBlueAttached === true){
										(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The three lamps are glowing red, green, and blue.");
									}else{
										(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Two lamps glow green and red.");
									}
								}else if(QuantumBlueAttached === true){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Two lamps glow blue and red.");	
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("One of the lamps is glowing red.");	
								}
							}else if(QuantumGreenAttached === true){
								if(QuantumBlueAttached === true){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Two lamps glow blue and green.");
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("One of the lamps is glowing green.");	
								}
							}else if(QuantumBlueAttached === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("One of the lamps is glowing blue.");
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Three lamps adorn the top of the console.");	
							}
							
							/*
							private var QuantumRedAttached:Boolean = false;
							private var QuantumGreenAttached:Boolean = false;
							private var QuantumBlueAttached:Boolean = false;
							*/
						}else if(hit_screen_extra.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A cacophony of data flashes across the screens...");
						}
						
						/*
						hit_lamps
						hit_screen_extra
						*/
					}
				}
			}
		}
		//ContainmentUlam
		private function ScreenZeroHandler():void{
			trace("BARF 00");
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentConsole != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentConsole;
			}
					
			if(SpinnerOn === false){
				
				if(MusicPlayed === false){					
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray['MusicPlayed'] = 'Yes';
						MusicPlayed= true;
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadHarper(true,3);							
						},0.25);
					}
				}

				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiThree();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_EnergyPulse();
				
				Animating = true;
				SpinnerOn = true;
				SaveArray['SpinnerOn'] = 'Yes';
				
				
				screen_zero_still.texture = this.assets.getTexture('screen_zero_starting');			
				screen_zero_still.alpha = 1;
				
				if(PreviousStartUp === false){
					SaveArray['PreviousStartUp'] = 'Yes';
					FadeOut((ContainmentInterior as Class), 
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentInteriorObj,true
					);
				}else{
					screen_zero_still.texture = this.assets.getTexture('screen_zero_starting');			
					screen_zero_still.alpha = 1;
					Starling.juggler.delayCall(StartSpinner,1.5);
					
				}
				
				
				if(QuantumRedAttached === true){
					if(QuantumGreenAttached === true){
						if(QuantumBlueAttached === true){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
							UlamUnlocked = true;
							screen_ulam_mc.alpha = 0;
						}
					}
				}
				
			}else{
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiTwo();
				UlamUnlocked = false;
				screen_ulam_mc.alpha = 1;
				SaveArray['SpinnerOn'] = 'No';
				Animating = false;
				SpinnerOn = false;
				screen_zero_still.texture = this.assets.getTexture('screen_zero_stopping');			
				screen_zero_still.alpha = 1;
				screen_zero_mc.stop();
				Starling.juggler.delayCall(StopSpinner,1.5);
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_EnergyPulse();
				
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentConsole',SaveArray);
		}
		private function StopSpinner():void{
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerUp();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OhmTwo();
			(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("SpinLoop");
			Animating = false;
			screen_zero_still.texture = this.assets.getTexture('screen_zero_stopped');		
			spinner_mc.stop();
			spinner_mc.currentFrame = 0;
		}
		private function StartSpinner():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerUp();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OhmTwo();
			
			Animating = false;
			screen_zero_still.alpha = 0;
			spinner_mc.play();
			screen_zero_mc.alpha = 1;
			screen_zero_mc.play();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SpinLoop(999);
			
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
			
			
			
			this.assets.removeTexture("containmentConsole_bg",true);
			this.assets.removeTexture("ContainmentConsole_Sprite_01",true);
			this.assets.removeTexture("ContainmentConsole_Sprite_02",true);
			this.assets.removeTextureAtlas("ContainmentConsole_Sprite_01",true);
			this.assets.removeTextureAtlas("ContainmentConsole_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("containmentConsole_01");
			(stage.getChildAt(0) as Object).falseAsset("containmentConsole_02");
			(stage.getChildAt(0) as Object).falseAsset("containmentConsole_03");
			(stage.getChildAt(0) as Object).falseAsset("containmentConsole_04");
			(stage.getChildAt(0) as Object).falseAsset("containmentConsole_05");
			
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
