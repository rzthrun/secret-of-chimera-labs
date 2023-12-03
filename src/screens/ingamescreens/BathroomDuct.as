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
	
	
	public class BathroomDuct extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		public var SaveArray2:Array = new Array();
		
		private var bg:Image;
		
		private var stick:Image;
		private var fan_mc:MovieClip;
		
		private var hit_vent_door:Shape;
		private var hit_fan_door:Shape;
		private var hit_walls:Shape;
		
		private var GrateOpen:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var StickAttached:Boolean = false;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function BathroomDuct(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('bathroomDuct_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomDuct/bathroomDuct_bg.jpg'));
				game.TrackAssets('bathroomDuct_01');
			}
			if(game.CheckAsset('bathroomDuct_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomDuct/BathroomDuct_Sprite_01.png'));
				game.TrackAssets('bathroomDuct_02');
			}
			if(game.CheckAsset('bathroomDuct_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomDuct/BathroomDuct_Sprite_01.xml'));
				game.TrackAssets('bathroomDuct_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BathroomDuct","BathroomDuctObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('bathroomDuct_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			fan_mc = new MovieClip(this.assets.getTextures("fan_fan_0"),24);
			fan_mc.x = 223;
			fan_mc.y = 134;			
			fan_mc.touchable = false;
			fan_mc.loop = true; 
			
			
			stick = new Image(this.assets.getTexture('fan_stick'));
			stick.touchable = false;
			stick.x = 272;
			stick.y = 136;
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['FirstTime'] == 'Yes'){
					GrateOpen = true;
				}
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctFan != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctFan['Stick'] == 'Attach'){	
					StickAttached = true;
					stick.alpha = 1;
					fan_mc.stop();
				}else{
					stick.alpha = 0;
					fan_mc.play();
				}
			}else{
				stick.alpha = 0;
				fan_mc.play();
			}
			
			fan_mc.alpha = 1;
			
			
			this.addChildAt(fan_mc,1);
			this.addChildAt(stick,2);
			//	CreateElevatorDoorHit();
			CreateVentHit();
			CreateFanHit();
			CreateWallsHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			
			Starling.juggler.add(fan_mc);
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BathroomDrip",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadWindHowl(true,999);
			
			Starling.juggler.delayCall(function():void{
				
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadDuctVibe(true,999);
				
				PlayBuildingAmb();
			},0.5);

		}

		private function PlayBuildingAmb():void{
			Starling.juggler.delayCall(function():void{
				if(StickAttached === false){
					(stage.getChildAt(0) as Object).AmbientObj.LoadMotorFan(true,999);
					(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolume("MotorFan",((stage.getChildAt(0) as Object).AmbientObj.globalVol/4),1.0);	
				}							
			},0.5);
			
		}
		//hit_walls
		private function CreateWallsHit():void{
			hit_walls = new Shape();
			hit_walls.touchable = false;
			hit_walls.graphics.beginFill(0xff0000);
			
			hit_walls.graphics.lineTo(0,0);	
			hit_walls.graphics.lineTo(800,0);	
			hit_walls.graphics.lineTo(800,512);	
			hit_walls.graphics.lineTo(0,512);	
		
			hit_walls.graphics.endFill(false);
			hit_walls.alpha = 0.0;
			
			hit_walls.graphics.precisionHitTest = true;	
			this.addChild(hit_walls);
		}
		
		private function CreateFanHit():void{
			hit_fan_door = new Shape();
			hit_fan_door.touchable = false;
			hit_fan_door.graphics.beginFill(0xff0000);
			
			hit_fan_door.graphics.lineTo(179,102);	
			hit_fan_door.graphics.lineTo(402,110);	
			hit_fan_door.graphics.lineTo(400,280);	
			hit_fan_door.graphics.lineTo(193,291);	
			
			hit_fan_door.graphics.endFill(false);
			hit_fan_door.alpha = 0.0;
			
			hit_fan_door.graphics.precisionHitTest = true;	
			this.addChild(hit_fan_door);
		}

		
		private function CreateVentHit():void{
			hit_vent_door = new Shape();
			hit_vent_door.touchable = false;
			hit_vent_door.graphics.beginFill(0xff0000);
			
			hit_vent_door.graphics.lineTo(432,109);	
			hit_vent_door.graphics.lineTo(555,67);	
			hit_vent_door.graphics.lineTo(545,365);	
			hit_vent_door.graphics.lineTo(431,293);	
			
			hit_vent_door.graphics.endFill(false);
			hit_vent_door.alpha = 0.0;
			
			hit_vent_door.graphics.precisionHitTest = true;	
			this.addChild(hit_vent_door);
			}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangTwo();
						//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((Bathroom as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BathroomObj,false
							);
						}else if(hit_vent_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(GrateOpen === false){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangOne();
								FadeOut((BathroomDuctExit as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.BathroomDuctExitObj,true
								);
							}else{
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom != undefined){
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['VentCover'] == 'On'){
										SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom;
										SaveArray2['VentCover'] = 'Off';
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray2);
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxClose();
									}
									
								}
									
								
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangTwo();
								FadeOut((ServerRoom as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ServerRoomObj,true
								);
							}
									
						}else if(hit_fan_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangTwo();
							FadeOut((BathroomDuctFan as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BathroomDuctFanObj,true
							);
						}else if(hit_walls.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							WallsHandler();
						}
						
					}
				}
			}
		}
		private function WallsHandler():void{
			if(RONum == 0){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangFour();
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The metal feels cold.");	
			}else if(RONum == 1){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangThree();
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I barely fit through here... I really don't want to get stuck.");	
			}else if(RONum == 2){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangFour();
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I must be careful. There's no telling if these ventilation ducts can support me...");	
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
			
			
			
			this.assets.removeTexture("bathroomDuct_bg",true);
			this.assets.removeTexture("BathroomDuct_Sprite_01",true);
			this.assets.removeTextureAtlas("BathroomDuct_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("bathroomDuct_01");
			(stage.getChildAt(0) as Object).falseAsset("bathroomDuct_02");
			(stage.getChildAt(0) as Object).falseAsset("bathroomDuct_03");
			
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