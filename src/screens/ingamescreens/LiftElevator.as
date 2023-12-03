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

	public class LiftElevator extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var hood:Image;
		private var gate:Image;
		
		private var button_up:Image;
		private var button_down:Image;
		
		private var bg_mc:MovieClip;
		private var bg_down_mc:MovieClip;
		
		private var hit_gate:Shape;
		private var hit_exit:Shape;
		private var hit_button_up:Shape;
		private var hit_button_down:Shape;
		
		private var GateOpen:Boolean = true;
		private var ElevatorDown:Boolean = false;
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;			
		
		public function LiftElevator(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('liftElevator_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LiftElevator/LiftElevator_Sprite_01.png'));
				game.TrackAssets('liftElevator_01');
			}
			if(game.CheckAsset('liftElevator_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LiftElevator/LiftElevator_Sprite_01.xml'));
				game.TrackAssets('liftElevator_02');
			}
			if(game.CheckAsset('liftElevator_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LiftElevator/LiftElevator_Sprite_02.jpg'));
				game.TrackAssets('liftElevator_03');
			}
			if(game.CheckAsset('liftElevator_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LiftElevator/LiftElevator_Sprite_02.xml'));
				game.TrackAssets('liftElevator_04');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("LiftElevator","LiftElevatorObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Containment',SaveArray);
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentControl',SaveArray);
			
			bg = new Image(this.assets.getTexture('liftElevator_bg'));
			bg.touchable = true;
			bg.x = 0;
			bg.y = 0;
			bg.width = 800;
			bg.height = 512;
			this.addChildAt(bg,0);
				
			bg_mc = new MovieClip(this.assets.getTextures("l_frame_"),12);
			bg_mc.x = 0;
			bg_mc.y = 0;
			bg_mc.width = 430;
			bg_mc.height = 512;
			bg_mc.touchable = false;
			bg_mc.loop = false; 
			bg_mc.stop();
			
			bg_down_mc = new MovieClip(this.assets.getTextures("l_frame_").reverse(),12);
			bg_down_mc.x = 0;
			bg_down_mc.y = 0;
			bg_down_mc.width = 430;
			bg_down_mc.height = 512;
			bg_down_mc.touchable = false;
			bg_down_mc.loop = false; 
			bg_down_mc.stop();
			
			gate = new Image(this.assets.getTexture('gate_open'));
			gate.touchable = false;
			gate.x = 0;
			gate.y = 0;
			
			hood = new Image(this.assets.getTexture('lift_hood'));
			hood.touchable = false;
			hood.x = 0;
			hood.y = 0;
					
			button_up = new Image(this.assets.getTexture('button_up'));
			button_up.touchable = false;
			button_up.x = 541;
			button_up.y = 190;

			button_down = new Image(this.assets.getTexture('button_down'));
			button_down.touchable = false;
			button_down.x = 543;
			button_down.y = 292;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LiftElevator != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LiftElevator['ElevatorDown'] == 'Yes'){	
					ElevatorDown = true;
					bg_mc.alpha = 0;
					bg_down_mc.alpha = 1;
				}else{
					bg_mc.alpha = 1;
					bg_down_mc.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LiftElevator['Gate'] == 'Closed'){	
					GateOpen = false;
					gate.texture = this.assets.getTexture('gate_closed');
					
				}else{
					CreateExitHit();
				}
			}else{
				CreateExitHit();
				bg_mc.alpha = 1;
				bg_down_mc.alpha = 0;
			}	
			
			
		
			gate.alpha = 1;
			hood.alpha = 1;
				
			button_down.alpha = 0;
			button_up.alpha = 0;
			
			
		
			
			CreateGateHit(GateOpen);
			CreateButtonUpHit();
			
			CreateButtonUpHit();
			CreateButtonDownHit();
			
			this.addChildAt(bg_mc,1);
			this.addChildAt(bg_down_mc,2);
			this.addChildAt(gate,3);
			this.addChildAt(hood,4);
			this.addChildAt(button_up,5);
			this.addChildAt(button_down,6);
			
		//	goback = new GoBackButton(this.assets);
		//	this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			Starling.juggler.add(bg_mc);
			Starling.juggler.add(bg_down_mc);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadShipGroansOne(true,999);
			
			Starling.juggler.delayCall(function():void{
				
					(stage.getChildAt(0) as Object).AmbientObj.LoadBasementBongs(true,999);
			},0.5);
		}
		
		/*
		
		private var hit_gate:Shape;
		private var hit_exit:Shape;
		private var hit_button:Shape;
		
		*/
		private function CreateGateHit(open:Boolean = false):void{
			hit_gate = new Shape();		
			hit_gate.x = 0;
			hit_gate.y = 0;
			hit_gate.graphics.beginFill(0x00FF00);
			if(open === false){	
				
						
				hit_gate.graphics.lineTo(0,0);	
				hit_gate.graphics.lineTo(422,0);	
				hit_gate.graphics.lineTo(418,512);	
				hit_gate.graphics.lineTo(0,512);					
												
			}else{
				
				hit_gate.graphics.lineTo(169,0);	
				hit_gate.graphics.lineTo(422,0);	
				hit_gate.graphics.lineTo(418,512);	
				hit_gate.graphics.lineTo(172,512);	
				
			}				
			hit_gate.graphics.endFill(false);			
			hit_gate.alpha = 0.0;			
			hit_gate.graphics.precisionHitTest = true;	
			hit_gate.touchable = false
			this.addChild(hit_gate);
			
			
		}
		
		/*
		private var hit_button_up:Shape;
		private var hit_button_down:Shape;
		*/
		
		private function CreateButtonUpHit():void{
			hit_button_up = new Shape();
			this.addChild(hit_button_up);
			hit_button_up.graphics.beginFill(0x0000FF);
			hit_button_up.graphics.lineTo(535,186);	
			hit_button_up.graphics.lineTo(635,187);	
			hit_button_up.graphics.lineTo(635,280);	
			hit_button_up.graphics.lineTo(532,279);	
		
			hit_button_up.graphics.endFill(false);
			hit_button_up.alpha = 0.0;
			hit_button_up.touchable = false;
			hit_button_up.graphics.precisionHitTest = true;	
		}
		
		private function CreateButtonDownHit():void{
			hit_button_down = new Shape();
			this.addChild(hit_button_down);
			hit_button_down.graphics.beginFill(0x0000FF);
			hit_button_down.graphics.lineTo(530,286);	
			hit_button_down.graphics.lineTo(644,291);	
			hit_button_down.graphics.lineTo(643,390);	
			hit_button_down.graphics.lineTo(535,382);	
			
			hit_button_down.graphics.endFill(false);
			hit_button_down.alpha = 0.0;
			hit_button_down.touchable = false;
			hit_button_down.graphics.precisionHitTest = true;	
		}
		
		private function CreateExitHit():void{
			hit_exit = new Shape();
			this.addChild(hit_exit);
			hit_exit.graphics.beginFill(0x0000FF);
			hit_exit.graphics.lineTo(0,0);	
			hit_exit.graphics.lineTo(168,0);	
			hit_exit.graphics.lineTo(168,512);	
			hit_exit.graphics.lineTo(0,512);	
			
			hit_exit.graphics.endFill(false);
			hit_exit.alpha = 0.0;
			hit_exit.touchable = false;
			hit_exit.graphics.precisionHitTest = true;	
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(hit_gate.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							GateHandler();
							return;
						}else if(hit_button_down.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(GateOpen === false){
								if(ElevatorDown === false){
									ButtonDownHandler();
								}else{
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
								}
								
							
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
							}
							return;
						}else if(hit_button_up.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(GateOpen === false){
								if(ElevatorDown === false){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
								}else{
									ButtonUpHandler();
								}
								
								
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
							}
							return;
							//	ButtonUpHandler();
						}
						else if(GateOpen === true){
							if(hit_exit.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(ElevatorDown === false){
									FadeOut((Lift as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.LiftObj,true
									);
								}else{
									FadeOut((Containment as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentObj,true
									);
								}
								
							}
							return;
						}
						
					
					}
				}
			}
		}
		private function ButtonUpHandler():void{
			Animating = true;
			ElevatorDown = false;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_EnergyPulse();
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LiftElevator != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LiftElevator;	
			}
			SaveArray['ElevatorDown'] = "No";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LiftElevator',SaveArray);
			
			
			bg_down_mc.addEventListener(Event.COMPLETE, OnUpComplete);
			
			
			
			
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BigElevatorLong();
				bg_down_mc.play();
			},0.5)
			
			
		}
		private function OnUpComplete():void{
		
			bg_mc.removeEventListener(Event.COMPLETE, OnUpComplete);
			
			bg_mc.alpha = 1;
			bg_down_mc.alpha = 0;
			bg_mc.stop();
			bg_down_mc.stop();
			bg_down_mc.currentFrame = 0;
			bg_mc.currentFrame = 0;
			Animating = false;
		}
		private function ButtonDownHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_EnergyPulse();
			Animating = true;
			ElevatorDown = true;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LiftElevator != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LiftElevator;	
			}
			SaveArray['ElevatorDown'] = "Yes";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LiftElevator',SaveArray);
			
			bg_mc.addEventListener(Event.COMPLETE, OnDownComplete);
			
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BigElevatorLong();
				bg_mc.play();
			},0.5)
			
			
			
		}
		private function OnDownComplete():void{
		
			bg_mc.removeEventListener(Event.COMPLETE, OnDownComplete);
			bg_down_mc.alpha = 1;
			bg_mc.alpha = 0;
			bg_mc.stop();
			bg_down_mc.stop();
			bg_down_mc.currentFrame = 0;
			bg_mc.currentFrame = 0;
			
			Animating = false;
		}
		
		private function GateHandler():void{
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LiftElevator != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LiftElevator;	
			}
		
			if(GateOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpen();
				GateOpen = true;
				gate.texture = this.assets.getTexture('gate_open');
				hit_gate._graphics.clear();
				SaveArray['Gate'] = "Open";
				CreateGateHit(true);
				CreateExitHit();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyClose();
				GateOpen = false;
				gate.texture = this.assets.getTexture('gate_closed');
				hit_gate._graphics.clear();
				hit_exit.graphics.clear();
				SaveArray['Gate'] = "Closed";
				CreateGateHit(false);
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LiftElevator',SaveArray);
			
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
			
			
			
			this.assets.removeTexture("LiftElevator_Sprite_01",true);
			this.assets.removeTexture("LiftElevator_Sprite_02",true);
			this.assets.removeTextureAtlas("LiftElevator_Sprite_01",true);
			this.assets.removeTextureAtlas("LiftElevator_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("liftElevator_01");
			(stage.getChildAt(0) as Object).falseAsset("liftElevator_02");
			(stage.getChildAt(0) as Object).falseAsset("liftElevator_03");
			(stage.getChildAt(0) as Object).falseAsset("liftElevator_04");
			
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