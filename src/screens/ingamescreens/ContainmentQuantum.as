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
	import starling.utils.deg2rad;
	
	
	public class ContainmentQuantum extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var shine:Image;
		private var shine_core:Image;
		private var quanta_mc:MovieClip;
		private var quanta_sprite:Sprite;
		private var shineWhole:Image;
		
		private var red_ball_mc:MovieClip;
		private var green_ball_mc:MovieClip;
		private var blue_ball_mc:MovieClip;
		
	
		
		private var hit_machine:Shape;
		private var hit_hole:Shape;
		private var hit_center:Shape;
		
		private var CalibratorSolved:Boolean = false;
		private var RedAttached:Boolean = false;
		private var GreenAttached:Boolean = false;
		private var BlueAttached:Boolean = false;
		private var WholeShine:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var RONum:int = 0;
		private var ShineWholeTween:Tween;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function ContainmentQuantum(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('containmentQuantum_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentQuantum/containmentQuantum_bg.jpg'));
				game.TrackAssets('containmentQuantum_01');
			}
			if(game.CheckAsset('containmentQuantum_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentQuantum/ContainmentQuantum_Sprite_00.png'));
				game.TrackAssets('containmentQuantum_02');
			}
			if(game.CheckAsset('containmentQuantum_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentQuantum/ContainmentQuantum_Sprite_00.xml'));
				game.TrackAssets('containmentQuantum_03');
			}
			if(game.CheckAsset('containmentQuantum_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentQuantum/ContainmentQuantum_Sprite_02.png'));
				game.TrackAssets('containmentQuantum_04');
			}
			if(game.CheckAsset('containmentQuantum_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentQuantum/ContainmentQuantum_Sprite_02.xml'));
				game.TrackAssets('containmentQuantum_05');
			}
			//ContainmentQuantum_Sprite_00
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ContainmentQuantum","ContainmentQuantumObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('containmentQuantum_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
	
			
			red_ball_mc = new MovieClip(this.assets.getTextures("red_ball_"),24);
			red_ball_mc.pivotX = 314.5;
			red_ball_mc.pivotY = 196.5;
			red_ball_mc.x = 400;
			red_ball_mc.y = 290;
			red_ball_mc.touchable = false;
			red_ball_mc.loop = true; 
			red_ball_mc.play();
		
			
			
			green_ball_mc = new MovieClip(this.assets.getTextures("green_ball_").reverse(),24);
			green_ball_mc.pivotX = 314.5;
			green_ball_mc.pivotY = 196.5;
			green_ball_mc.x = 370;
			green_ball_mc.y = 270;
			green_ball_mc.rotation = deg2rad(60);
			green_ball_mc.touchable = false;
			green_ball_mc.loop = true; 
			green_ball_mc.play();
			green_ball_mc.currentFrame = 13;
			
				
			blue_ball_mc = new MovieClip(this.assets.getTextures("blue_ball_"),24);
			blue_ball_mc.pivotX = 314.5;
			blue_ball_mc.pivotY = 196.5;
			blue_ball_mc.x = 430;
			blue_ball_mc.y = 270;
			blue_ball_mc.rotation = deg2rad(-60);
			blue_ball_mc.touchable = false;
			blue_ball_mc.loop = true; 
			blue_ball_mc.play();
			blue_ball_mc.currentFrame = 6;
			
			shineWhole= new Image(this.assets.getTexture('shine_whole'));
			shineWhole.touchable = false;
			shineWhole.pivotX = 185;
			shineWhole.pivotY = 185;
			shineWhole.width = 20;
			shineWhole.height = 20;
			shineWhole.x = 400;
			shineWhole.y = 246;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
				trace("SMARTZ 00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum['WholeShine'] == 'Yes'){
					trace("SMARTZ 01");
					WholeShine = true;
					shineWhole.width = 370;
					shineWhole.height = 370;
					shineWhole.alpha = 1;
				}else{
					trace("SMARTZ 02");
					shineWhole.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum['RedAttached'] == 'Yes'){
					RedAttached = true;
					if(WholeShine === false){
						red_ball_mc.alpha = 0.75;
					}else{
						red_ball_mc.alpha = 0;
					}
					
				}else{
					red_ball_mc.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum['GreenAttached'] == 'Yes'){
					GreenAttached = true;				
					if(WholeShine === false){
						green_ball_mc.alpha = 0.75;
					}else{
						green_ball_mc.alpha = 0;
					}
				}else{
					green_ball_mc.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum['BlueAttached'] == 'Yes'){
					BlueAttached = true;					
					if(WholeShine === false){
						blue_ball_mc.alpha = 0.75;
					}else{
						blue_ball_mc.alpha = 0;
					}
				}else{
					blue_ball_mc.alpha = 0;
				}
			}else{
				red_ball_mc.alpha = 0;
				green_ball_mc.alpha = 0;
				blue_ball_mc.alpha = 0;
				shineWhole.alpha = 0;
			}
			
	
			this.addChildAt(blue_ball_mc,1);
			this.addChildAt(green_ball_mc,2);
			this.addChildAt(red_ball_mc,3);
			this.addChildAt(shineWhole,4);
			
			CreateQuantaSprite();		
			
			CreateMachineHit();
			CreateHoleHit();
			CreateCenterHit();
			
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			
			
		}
		
		private function CreateMachineHit():void{
			hit_machine = new Shape();
			hit_machine.touchable = false;
			hit_machine.graphics.beginFill(0xff0000);
			
			hit_machine.graphics.lineTo(0,0);	
			hit_machine.graphics.lineTo(800,0);	
			hit_machine.graphics.lineTo(800,512);	
			hit_machine.graphics.lineTo(0,512);	
						
			hit_machine.graphics.endFill(false);
			hit_machine.alpha = 0.0;
			
			hit_machine.graphics.precisionHitTest = true;	
			this.addChild(hit_machine);
		}
		
		private function CreateHoleHit():void{
			hit_hole = new Shape();
			hit_hole.touchable = false;
			hit_hole.graphics.beginFill(0xff0000);
			
			hit_hole.graphics.lineTo(139,147);	
			hit_hole.graphics.lineTo(266,0);	
			hit_hole.graphics.lineTo(532,0);	
			hit_hole.graphics.lineTo(666,147);	
			hit_hole.graphics.lineTo(666,368);	
			hit_hole.graphics.lineTo(528,512);	
			hit_hole.graphics.lineTo(274,512);	
			hit_hole.graphics.lineTo(139,368);	
			
			hit_hole.graphics.endFill(false);
			hit_hole.alpha = 0.0;
			
			hit_hole.graphics.precisionHitTest = true;	
			this.addChild(hit_hole);
		}
		
		private function CreateCenterHit():void{
			hit_center = new Shape();
			hit_center.touchable = false;
			hit_center.graphics.beginFill(0xff0000);
			
			hit_center.graphics.lineTo(264,253);	
			hit_center.graphics.lineTo(266,182);	
			hit_center.graphics.lineTo(346,108);	
			hit_center.graphics.lineTo(468,116);	
			hit_center.graphics.lineTo(533,194);	
			hit_center.graphics.lineTo(534,282);	
			hit_center.graphics.lineTo(465,366);	
			hit_center.graphics.lineTo(335,366);	
			hit_center.graphics.lineTo(272,287);	
		
			hit_center.graphics.endFill(false);
			hit_center.alpha = 0.0;
			
			hit_center.graphics.precisionHitTest = true;	
			this.addChild(hit_center);
		}
		
		private function CreateQuantaSprite():void{
			
			quanta_sprite = new Sprite();
			quanta_sprite.touchable = false;
			quanta_sprite.x = 400;
			quanta_sprite.y = 246;
			//401
			
			shine = new Image(this.assets.getTexture('shine'));
			shine.touchable = false;
			shine.pivotX = 242.5;
			shine.pivotY = 242.5;
			shine.x = 0;
			shine.y = 0;
			
			shine_core = new Image(this.assets.getTexture('shine_core'));
			shine_core.touchable = false;
			shine_core.pivotX = 135;
			shine_core.pivotY = 135;
			shine_core.x = 0;
			shine_core.y = 0;
			
			quanta_mc = new MovieClip((stage.getChildAt(0) as Object).ContainmentQuantumImages.assets.getTextures("quanta_ball_"),12);
			//quanta_mc = new MovieClip(this.assets.getTextures("quanta_ball_"),12);
			quanta_mc.pivotX = 132.5;
			quanta_mc.pivotY = 131.5;
			quanta_mc.x = 0;
			quanta_mc.y = 0;	
			quanta_mc.touchable = false;
			quanta_mc.loop = true; 
			quanta_mc.play();
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['Solved'] == 'Yes'){
					CalibratorSolved = true;
					quanta_mc.alpha = 1;
					shine_core.alpha = 1;
					shine.alpha = 1;
				}else{
					quanta_mc.alpha = 0;
					shine_core.alpha = 0;
					shine.alpha = 0;
				}
			}else{
				quanta_mc.alpha = 0;
				shine_core.alpha = 0;
				shine.alpha = 0;
			}

			
			quanta_sprite.addChildAt(shine,0);
			quanta_sprite.addChildAt(shine_core,1);
			quanta_sprite.addChildAt(quanta_mc,2);
			
			this.addChild(quanta_sprite);
			
			quanta_sprite.addEventListener(EnterFrameEvent.ENTER_FRAME, OnQuantaEnterFrame);
			
			Starling.juggler.add(quanta_mc);
			Starling.juggler.add(red_ball_mc);
			Starling.juggler.add(green_ball_mc);
			Starling.juggler.add(blue_ball_mc);
			
			
			if(CalibratorSolved === true){
				(stage.getChildAt(0) as Object).AmbientObj.LoadQuantumDrone(true,999);
				
				(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ControlBeeps",0,0.5,'stop');
				Starling.juggler.delayCall(function():void{
					if(GreenAttached === true){
						(stage.getChildAt(0) as Object).AmbientObj.LoadQuantumBalls(true,999);
					}else if(RedAttached === true){
						(stage.getChildAt(0) as Object).AmbientObj.LoadQuantumBalls(true,999);
					}else if(BlueAttached === true){
						(stage.getChildAt(0) as Object).AmbientObj.LoadQuantumBalls(true,999);
					}
				},0.5);
			}else{
				Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).AmbientObj.LoadControlBeeps(true,999);
				},0.5);
			}
		}
		
		
		
		private function OnQuantaEnterFrame():void{
		//	var currentDate:Date=new Date();
		//	quanta_sprite.y = quanta_sprite.y+(Math.cos(currentDate.getTime()*0.25)*3);
			shine.rotation = shine.rotation+deg2rad(2);
			
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
						}else if(hit_center.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(CalibratorSolved === true){
								CenterHandler(false);
							}else{
								EmptyHandler();
							}
							
						}else if(hit_hole.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(CalibratorSolved === true){
								CenterHandler(true);
							}else{
								EmptyHandler();
							}
						}else if(hit_machine.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(CalibratorSolved === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The great rings wait nearby, surrounding the anomaly...");
							}else{
								if(RONum == 0){
									RONum = 1;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The great rings of the machine rest...");
								}else if(RONum == 1){
									RONum = 2;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The large device is icy cold to the touch...");						
								}else if(RONum == 2){
									RONum = 0;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This machine must be the focus of all Chimera's research...");	
								}
							}
						}
						
					}	
						
				}
			}
		}
		
		private function CheckBalls():void{
			if(RedAttached === true){	
				if(GreenAttached === true){	
					if(BlueAttached === true){	
						this.addEventListener(EnterFrameEvent.ENTER_FRAME,WholeShineOnFrame);
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum;
						}
						
						SaveArray['WholeShine'] = 'Yes';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentQuantum',SaveArray);
						
						Animating = true;
						Starling.juggler.delayCall(WholeShineFadeIn,2.5);
					}
				}
			}
		}
		
		private function WholeShineFadeIn():void{
			(stage.getChildAt(0) as Object).MusicObj.LoadLightBeam(true,1);
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
			ShineWholeTween =  new Tween(shineWhole, 3.5, Transitions.EASE_OUT);
			ShineWholeTween.fadeTo(1);
			ShineWholeTween.animate("width", 370);
			ShineWholeTween.animate("height", 370)
			ShineWholeTween.onComplete = function():void{
				
				//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();
				WholeShineFadeInOnComplete();
				Animating = false;
				ShineWholeTween = null;
			}
			Starling.juggler.add(ShineWholeTween);
		}
		
		private function WholeShineOnFrame():void{
			if(red_ball_mc.currentFrame == 11){
				red_ball_mc.alpha = 0;
			}
			if(green_ball_mc.currentFrame == 11){
				green_ball_mc.alpha = 0;
			}
			if(blue_ball_mc.currentFrame == 11){
				blue_ball_mc.alpha = 0;
			}
			
		}
		
		private function WholeShineFadeInOnComplete():void{
			this.removeEventListener(EnterFrameEvent.ENTER_FRAME,WholeShineOnFrame);
		//	quanta_sprite.removeEventListener(EnterFrameEvent.ENTER_FRAME, OnQuantaEnterFrame);
		//	quanta_mc.stop();
		}
		
		
		private function CenterHandler(HitSource:Boolean):void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_PearlRed)
				
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWaveTwo();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ping();
				(stage.getChildAt(0) as Object).AmbientObj.LoadQuantumBalls(true,999);
				RedAttached = true;
				red_ball_mc.alpha = 1;
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum;
				}
			
				SaveArray['RedAttached'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentQuantum',SaveArray);
				
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_PearlRed,
						"item_PearlRed"
					);
				
				CheckBalls();
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_PearlGreen)
				
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWaveTwo();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ping();
				(stage.getChildAt(0) as Object).AmbientObj.LoadQuantumBalls(true,999);
				GreenAttached = true;
				green_ball_mc.alpha = 1;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum;
				}
				
				SaveArray['GreenAttached'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentQuantum',SaveArray);
				
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_PearlGreen,
						"item_PearlGreen"
					);
				
				CheckBalls();
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_PearlBlue)
				
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWaveTwo();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ping();
				(stage.getChildAt(0) as Object).AmbientObj.LoadQuantumBalls(true,999);
				BlueAttached = true;
				blue_ball_mc.alpha = 1;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum;
				}
				
				SaveArray['BlueAttached'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentQuantum',SaveArray);
				
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_PearlBlue,
						"item_PearlBlue"
					);
				
				CheckBalls();
			}else{
				if(HitSource === false){
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An anomaly has materialized at the epicenter of the large device.");
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Light energy is pouring out... a plasma field hovers over the source...");						
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A strong energy pushes me back with stronger and stronger force the closer I get to the field.");	
					}
				}else{
					BallTextHandler();
				}
			}
		}
		
		private function BallTextHandler():void{
			if(RedAttached === true){
				if(GreenAttached === true){
					if(BlueAttached === true){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The three glowing balls orbit the plasma field....");
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The red and green orbs spin around at a great velocity... ");
					}
				}else{
					if(BlueAttached === true){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The red and blue orbs spin around at a great velocity... ");
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The glowing red ball orbits the quivering plasma... ");
					}
				}
			}else{
				if(GreenAttached === true){
					if(BlueAttached === true){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The blue and green orbs spin around at a great velocity... ");
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The glowing green ball orbits the quivering plasma... ");
					}
				}else{
					if(BlueAttached === true){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The glowing blue ball orbits the quivering plasma... ");
					}else{
						EmptyOrbitHandler();
					}
				}
			}
		}
		
		private function EmptyOrbitHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't tell what the source of this energy is... where is it coming from?");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The space around the anomaly distorts when I move my hand through it.");						
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("...I feel a bit dizzy...");	
			}
		}
		
		private function EmptyHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is only a void at the center of the machine..");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It feels unusually cold here.");						
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmm...");	
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
			
			
			
			this.assets.removeTexture("containmentQuantum_bg",true);
			this.assets.removeTexture("ContainmentQuantum_Sprite_00",true);
			this.assets.removeTextureAtlas("ContainmentQuantum_Sprite_00",true);
			this.assets.removeTexture("ContainmentQuantum_Sprite_02",true);
			this.assets.removeTextureAtlas("ContainmentQuantum_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("containmentQuantum_01");
			(stage.getChildAt(0) as Object).falseAsset("containmentQuantum_02");
			(stage.getChildAt(0) as Object).falseAsset("containmentQuantum_03");
			(stage.getChildAt(0) as Object).falseAsset("containmentQuantum_04");
			(stage.getChildAt(0) as Object).falseAsset("containmentQuantum_05");
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
