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
	
	
	public class LabDoor extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var door_closed:Image;
		private var melted:Image;
		private var goo:Image;
		private var smoke:Image;
		
		private var hit_lock:Shape;
		private var hit_porthole:Shape;
		private var hit_door:Shape;
		
		private var MeltTween:Tween;
		private var SmokeTween:Tween;
		private var GooTween:Tween
		
		private var DoorOpen:Boolean = false;
		private var Melted:Boolean = false;
		private var Animating:Boolean = false;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function LabDoor(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('labDoor_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabDoor/labDoor_bg.jpg'));
				game.TrackAssets('labDoor_01');
			}
			if(game.CheckAsset('labDoor_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabDoor/LabDoor_Sprite_01.png'));
				game.TrackAssets('labDoor_02');
			}
			if(game.CheckAsset('labDoor_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabDoor/LabDoor_Sprite_01.xml'));
				game.TrackAssets('labDoor_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("LabDoor","LabDoorObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('labDoor_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);


			door_closed = new Image(this.assets.getTexture('door_closed'));
			door_closed.touchable = false;
			door_closed.x = 164;
			door_closed.y = 0;
			
			goo = new Image(this.assets.getTexture('goo'));
			goo.touchable = false;
			goo.x = 194;
			goo.y = 256;			
			
			melted = new Image(this.assets.getTexture('burn'));
			melted.touchable = false;
			melted.x = 175;
			melted.y = 0;
			
			smoke = new Image(this.assets.getTexture('smoke'));
			smoke.touchable = false;
			smoke.x = 100;
			smoke.y = 0;
			/*
			private var door_closed:Image;
			private var melted:Image;
			private var goo:Image;
			private var smoke:Image;
			*/
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDoor != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDoor['Melted'] == 'Yes'){	
					Melted = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDoor['Door'] == 'Open'){	
					DoorOpen = true;
				}
				
				if(Melted === true){
					if(DoorOpen === true){
						door_closed.alpha = 0;
						goo.alpha = 0;
						melted.alpha = 0;
						smoke.alpha = 0;
					}else{
						door_closed.alpha = 1;
						goo.alpha = 0;
						melted.alpha = 1;
						smoke.alpha = 0;
					}
				}else{
					door_closed.alpha = 1;
					goo.alpha = 0;
					melted.alpha = 0;
					smoke.alpha = 0;
				}
				
			}else{
				door_closed.alpha = 1;
				goo.alpha = 0;
				melted.alpha = 0;
				smoke.alpha = 0;
			}
			
			
			
			this.addChildAt(door_closed,1);
			this.addChildAt(goo,2);			
			this.addChildAt(melted,3);
			this.addChildAt(smoke,4);
			
			CreateDoorHit();
			CreatePortHoleHit();
			CreateLockHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		/*
		private var hit_lock:Shape;
		private var hit_porthole:Shape;
		*/
		private function CreateDoorHit():void{
			hit_door = new Shape();
			hit_door.touchable = false;
			hit_door.graphics.beginFill(0xff0000);
			
			hit_door.graphics.lineTo(221,0);	
			hit_door.graphics.lineTo(655,0);	
			hit_door.graphics.lineTo(655,512);	
			hit_door.graphics.lineTo(222,512);	
					
			hit_door.graphics.endFill(false);
			hit_door.alpha = 0.0;
			
			hit_door.graphics.precisionHitTest = true;	
			this.addChild(hit_door);
		}
		
		private function CreatePortHoleHit():void{
			hit_porthole = new Shape();
			hit_porthole.touchable = false;
			hit_porthole.graphics.beginFill(0xff0000);
			
			hit_porthole.graphics.lineTo(388,86);	
			hit_porthole.graphics.lineTo(410,30);	
			hit_porthole.graphics.lineTo(470,6);	
			hit_porthole.graphics.lineTo(532,32);	
			hit_porthole.graphics.lineTo(550,94);	
			hit_porthole.graphics.lineTo(518,149);	
			hit_porthole.graphics.lineTo(460,172);	
			hit_porthole.graphics.lineTo(397,133);	
		
			hit_porthole.graphics.endFill(false);
			hit_porthole.alpha = 0.0;
			
			hit_porthole.graphics.precisionHitTest = true;	
			this.addChild(hit_porthole);
		}
		
		private function CreateLockHit():void{
			hit_lock = new Shape();
			hit_lock.touchable = false;
			hit_lock.graphics.beginFill(0xff0000);
			
			hit_lock.graphics.lineTo(53,191);	
			hit_lock.graphics.lineTo(439,189);	
			hit_lock.graphics.lineTo(518,267);	
			hit_lock.graphics.lineTo(500,405);	
			hit_lock.graphics.lineTo(418,419);	
			hit_lock.graphics.lineTo(48,389);	
					
			hit_lock.graphics.endFill(false);
			hit_lock.alpha = 0.0;
			
			hit_lock.graphics.precisionHitTest = true;	
			this.addChild(hit_lock);
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
							FadeOut((Lab as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LabObj,true
							);
						}else if(hit_lock.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(Melted === false){
								LockHandler();
							}else{
								if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									if(DoorOpen === false){
										
										//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HeavyStoneDrag();
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
										DoorOpen = true;
										door_closed.alpha = 0;
										goo.alpha = 0;
										melted.alpha = 0;
										
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDoor != undefined){	
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDoor;	
										}
										SaveArray['Door'] = "Open";
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabDoor',SaveArray);
										
									}else{
										trace("ENTERING ROOM");
										FadeOut((DeepLab as Class), 
											(stage.getChildAt(0) as Object).screenGamePlayHandler.DeepLabObj,false
										);
										
									}
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The waste 'ate' through the metal...");
								}
							}	
						}else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(Melted === false){					
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoor();
								
								
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The door won't budge...");
								
								
							}else{
								if(DoorOpen === false){
									
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_StoneDrag();
									DoorOpen = true;
									door_closed.alpha = 0;
									goo.alpha = 0;
									melted.alpha = 0;
									
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDoor != undefined){	
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDoor;	
									}
									SaveArray['Door'] = "Open";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabDoor',SaveArray);
								}else{
									trace("ENTERING ROOM");
									FadeOut((DeepLab as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.DeepLabObj,true
									);
								}
							}
						}
					}
					
				}
			}
		}
		
		
		private function LockHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_CoffeePotFull)
			{
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Sizzle();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDoor != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDoor;	
				}
				SaveArray['Melted'] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabDoor',SaveArray);
				
				Animating = true;
				Melted = true;
				goo.alpha = 1;
				Starling.juggler.delayCall(function():void{
					FadeInSmoke();
				},1);
				
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_CoffeePotFull,
						"item_CoffeePotFull"
					);
			}else{
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A thick bar locks the door in place.");
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The bar is several inches thick, there's no way I can force it open.");;				
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("If I could remove or cut the bar, then door would open.");
					
				}
				
			}
		}
		
		private function FadeInSmoke():void{
			SmokeTween = new Tween(smoke, 1.5, Transitions.LINEAR);
			SmokeTween.fadeTo(1);
			SmokeTween.onComplete = function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Sizzle();
				FadeInMelt();
				
				SmokeTween = null;
				
			};
			Starling.juggler.add(SmokeTween);	
		}
		
		private function FadeInMelt():void{
			MeltTween = new Tween(melted, 2.5, Transitions.LINEAR);
			MeltTween.fadeTo(1);
			MeltTween.onComplete = function():void{
				FadeOutSmoke();
				MeltTween = null;
				
			};
			Starling.juggler.add(MeltTween);	
		}
		
		private function FadeOutSmoke():void{
			goo.alpha = 0;
			SmokeTween = new Tween(smoke, 1.5, Transitions.LINEAR);
			SmokeTween.fadeTo(0);
			SmokeTween.onComplete = function():void{
				Animating = false;
				SmokeTween = null
			};
			Starling.juggler.add(SmokeTween);	
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
			
			
			
			this.assets.removeTexture("labDoor_bg",true);
			this.assets.removeTexture("LabDoor_Sprite_01",true);
			this.assets.removeTextureAtlas("LabDoor_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("labDoor_01");
			(stage.getChildAt(0) as Object).falseAsset("labDoor_02");
			(stage.getChildAt(0) as Object).falseAsset("labDoor_03");
			
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