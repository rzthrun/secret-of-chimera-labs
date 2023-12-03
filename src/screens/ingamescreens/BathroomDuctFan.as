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
	
	public class BathroomDuctFan extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var hardDrive:Image;
		private var stick:Image;
		private var fan_mc:MovieClip;
		
		private var hit_hardDrive:Shape;
		private var hit_fan:Shape;
		
		private var hit_gate:Shape;
		private var hit_duct:Shape;
		
		private var HardDrivePickedUp:Boolean = false;
		private var StickAttached:Boolean = false;
		
		private var RONum:int = 0;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function BathroomDuctFan(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('bathroomDuctFan_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomDuctFan/bathroomDuctFan_bg.jpg'));
				game.TrackAssets('bathroomDuctFan_01');
			}
			if(game.CheckAsset('bathroomDuctFan_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomDuctFan/BathroomDuctFan_Sprite_01.png'));
				game.TrackAssets('bathroomDuctFan_02');
			}
			if(game.CheckAsset('bathroomDuctFan_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomDuctFan/BathroomDuctFan_Sprite_01.xml'));
				game.TrackAssets('bathroomDuctFan_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BathroomDuctFan","BathroomDuctFanObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('bathroomDuctFan_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			/*
			private var hardDrive:Image;
			private var stick:Image;
			*/
			
			hardDrive = new Image(this.assets.getTexture('harddrive'));
			hardDrive.touchable = false;
			hardDrive.x = 212;
			hardDrive.y = 277;
			
			fan_mc = new MovieClip(this.assets.getTextures("fan_0"),24);
			fan_mc.x = 184;
			fan_mc.y = 25;			
			fan_mc.touchable = false;
			fan_mc.loop = true; 
						
			
			stick = new Image(this.assets.getTexture('stick'));
			stick.touchable = false;
			stick.x = 310;
			stick.y = 42;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctFan != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctFan['Stick'] == 'Attach'){	
					StickAttached = true;
					stick.alpha = 1;
					fan_mc.stop();
				}else{
					stick.alpha = 0;
					fan_mc.play();
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctFan['HardDrive'] == 'PickedUp'){	
					HardDrivePickedUp = true;
					hardDrive.alpha = 0;
				}else{
					hardDrive.alpha = 1;
				}
			}else{
				hardDrive.alpha = 1;
				stick.alpha = 0;
				fan_mc.play();
			}
			
			
			fan_mc.alpha = 1;
			
			
			
			
			this.addChildAt(hardDrive,1);
			this.addChildAt(fan_mc,2);
			this.addChildAt(stick,3);
			
			CreateDuctHit();
			CreateGateHit();			
			CreateFanHit();
			CreateHardDriveHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			Starling.juggler.add(fan_mc);
			
			if(StickAttached === false){
				(stage.getChildAt(0) as Object).AmbientObj.LoadMotorFan(true,999);
				(stage.getChildAt(0) as Object).AmbientObj.currentAmbient = 'MotorFan';
			}
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("MotorFan",((stage.getChildAt(0) as Object).AmbientObj.globalVol),1.0);
			Starling.juggler.delayCall(function():void{
			
				(stage.getChildAt(0) as Object).AmbientObj.LoadDuctVibe(true,999);
				if(StickAttached === false){
					(stage.getChildAt(0) as Object).AmbientObj.currentAmbient = 'MotorFan';
				}else{
					(stage.getChildAt(0) as Object).AmbientObj.currentAmbient = 'DuctVibe';
				}
				
				PlayWindAmb();
			},1);
			//(stage.getChildAt(0) as Object).AmbientObj.LoadBuildingHum(true,999);
		}
		private function PlayWindAmb():void{
			Starling.juggler.delayCall(function():void{
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadWindHowl(true,999);
				if(StickAttached === false){
					(stage.getChildAt(0) as Object).AmbientObj.currentAmbient = 'MotorFan';
				}else{
					(stage.getChildAt(0) as Object).AmbientObj.currentAmbient = 'DuctVibe';
				}
				
			},0.5);
			
		}
		/*
		private var hit_gate:Shape;
		private var hit_duct:Shape;
		*/
		private function CreateDuctHit():void{
			hit_duct = new Shape();
			hit_duct.touchable = false;
			hit_duct.graphics.beginFill(0xff0000);
			
			hit_duct.graphics.lineTo(0,0);	
			hit_duct.graphics.lineTo(800,0);	
			hit_duct.graphics.lineTo(800,512);	
			hit_duct.graphics.lineTo(0,512);	
		
			hit_duct.graphics.endFill(false);
			hit_duct.alpha = 0.0;
			
			hit_duct.graphics.precisionHitTest = true;	
			this.addChild(hit_duct);
		}
		
		private function CreateGateHit():void{
			hit_gate = new Shape();
			hit_gate.touchable = false;
			hit_gate.graphics.beginFill(0xff0000);
			
			hit_gate.graphics.lineTo(115,6);	
			hit_gate.graphics.lineTo(612,24);	
			hit_gate.graphics.lineTo(600,382);	
			hit_gate.graphics.lineTo(136,412);				
			
			hit_gate.graphics.endFill(false);
			hit_gate.alpha = 0.0;
			
			hit_gate.graphics.precisionHitTest = true;	
			this.addChild(hit_gate);
		}
		
		private function CreateFanHit():void{
			hit_fan = new Shape();
			hit_fan.touchable = false;
			hit_fan.graphics.beginFill(0xff0000);
			
			hit_fan.graphics.lineTo(168,208);	
			hit_fan.graphics.lineTo(190,107);	
			hit_fan.graphics.lineTo(261,33);	
			hit_fan.graphics.lineTo(367,16);	
			hit_fan.graphics.lineTo(475,49);	
			hit_fan.graphics.lineTo(539,135);	
			hit_fan.graphics.lineTo(545,238);	
			hit_fan.graphics.lineTo(507,320);	
			hit_fan.graphics.lineTo(431,375);	
			hit_fan.graphics.lineTo(295,381);	
			hit_fan.graphics.lineTo(201,313);	
			
			hit_fan.graphics.endFill(false);
			hit_fan.alpha = 0.0;
			
			hit_fan.graphics.precisionHitTest = true;	
			this.addChild(hit_fan);
		}
		
		private function CreateHardDriveHit():void{
			hit_hardDrive = new Shape();
			hit_hardDrive.touchable = false;
			hit_hardDrive.graphics.beginFill(0xff0000);
			
			hit_hardDrive.graphics.lineTo(192,275);	
			hit_hardDrive.graphics.lineTo(263,251);	
			hit_hardDrive.graphics.lineTo(356,290);	
			hit_hardDrive.graphics.lineTo(358,312);	
			hit_hardDrive.graphics.lineTo(279,343);	
					
			hit_hardDrive.graphics.endFill(false);
			hit_hardDrive.alpha = 0.0;
			
			hit_hardDrive.graphics.precisionHitTest = true;	
			this.addChild(hit_hardDrive);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangOne();
							FadeOut((BathroomDuct as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BathroomDuctObj,true
							);
						}else if(hit_hardDrive.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							HardDriveHandler(e);
						
						}else if(hit_fan.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FanHandler();
						}else if(hit_gate.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The fan's housing is welded into place.");	
						}else if(hit_duct.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DuctHandler();
						}
						/*
						
						private var hit_gate:Shape;
						private var hit_duct:Shape;
						*/
					}
				}
			}
		}
		private function DuctHandler():void{
			if(RONum == 0){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangFour();
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The metal groans and reverberates under my weight.");	
			}else if(RONum == 1){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangThree();
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The cold metal sends a shiver down my spine.");	
			}else if(RONum == 2){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangFour();
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Careful... I don't want to become claustrophobic...");	
			}
		}
		
		private function HardDriveHandler(e:TouchEvent):void{
			if(StickAttached === false){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Looks like there's something behind the fan...");

				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I won't be able to reach it so long as the fan is moving.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think it's a hard drive...");	
				}
			
			}else{
				if(HardDrivePickedUp === false){
					if((stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.armedItem
						== 
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.inventoryBarObj
						.item_Claw)
					{
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctFan != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctFan;	
						}
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsTwo(2);
						HardDrivePickedUp = true;
						hardDrive.alpha = 0;
						SaveArray['HardDrive'] = "PickedUp";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BathroomDuctFan',SaveArray);
						
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_HDD,
							'item_HDD',
							'inven_hdd_sm'
						);
												
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_Claw,
								"item_Claw"
							);
						
					}else{
						if(RONum == 0){
							RONum = 1;
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't reach the hard drive... It's just beyond my grasp.");

						}else if(RONum == 1){
							RONum = 2;
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I need something to extend my reach another foot or two.");

						}else if(RONum == 2){
							RONum = 0;
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Just a little further... Ugh.. I can't reach it...");	
						}
						
						
					}
						
				}else{
					
				}
			}
		}
		private function FanHandler():void{
			if(StickAttached === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Stick)
				{
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctFan != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctFan;	
					}
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FanJam();
					(stage.getChildAt(0) as Object).AmbientObj.soundManager.stopSound("MotorFan");
					StickAttached = true;
					fan_mc.stop();
					fan_mc.currentFrame = 0;
					stick.alpha = 1;
					SaveArray['Stick'] = "Attach";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BathroomDuctFan',SaveArray);
					
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_Stick,
							"item_Stick"
						);
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					!= 
					false){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Putting that item into the rotating fan doesn't seem like a good idea..");	
	
				}else{
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'll hurt myself if I try to touch the fan's blades directly.");	
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Dusty air is sucked through the rotating blades.");	
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Ow! The fan is spinning too fast to touch.");	
					}
				}
			}else{
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The fans blades are covered in a layer of grey dust.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Careful... I like having fingers.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The broken end of the mop has jammed the fan's rotation.");	
				}
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
			
			
			
			this.assets.removeTexture("bathroomDuctFan_bg",true);
			this.assets.removeTexture("BathroomDuctFan_Sprite_01",true);
			this.assets.removeTextureAtlas("BathroomDuctFan_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("bathroomDuctFan_01");
			(stage.getChildAt(0) as Object).falseAsset("bathroomDuctFan_02");
			(stage.getChildAt(0) as Object).falseAsset("bathroomDuctFan_03");
			
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
