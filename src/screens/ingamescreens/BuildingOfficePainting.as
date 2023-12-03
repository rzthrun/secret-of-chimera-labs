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
	
	
	
	public class BuildingOfficePainting extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var tube:Image;
		private var safe_on:Image;
		private var safe_off:Image;
		private var painting_on:Image;
		private var painting_off:Image;
		
		private var hit_painting:Shape;
		private var hit_safe:Shape;
		private var hit_tube:Shape;
		
		private var hit_skull:Shape;
	
		
		private var PaintingOpen:Boolean = false;
		private var SafeOpen:Boolean = false
		private var TubePickedUp:Boolean = false;
		private var StonePickedUp:Boolean = true;
		private var SafeUnlocked:Boolean = false;
		private var Animating:Boolean = false;
				
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function BuildingOfficePainting(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('buildingOfficePainting_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficePainting/buildingOfficePainting_bg.jpg'));
				game.TrackAssets('buildingOfficePainting_01');
			}
			if(game.CheckAsset('buildingOfficePainting_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficePainting/BuildingOfficePainting_Sprite_01.png'));
				game.TrackAssets('buildingOfficePainting_02');
			}
			if(game.CheckAsset('buildingOfficePainting_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficePainting/BuildingOfficePainting_Sprite_01.xml'));
				game.TrackAssets('buildingOfficePainting_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BuildingOfficePainting","BuildingOfficePaintingObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			//(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePainting',SaveArray);
			
			bg = new Image(this.assets.getTexture('buildingOfficePainting_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			tube = new Image(this.assets.getTexture('tube_alone'));
			tube.touchable = false;
			tube.x = 266;
			tube.y = 167;
			
			safe_on = new Image(this.assets.getTexture('lid_on'));
			safe_on.touchable = false;
			safe_on.x = 259;
			safe_on.y = 132;
						
			safe_off = new Image(this.assets.getTexture('lid_off'));
			safe_off.touchable = false;
			safe_off.x = 443;
			safe_off.y = 124;
			
			painting_on = new Image(this.assets.getTexture('canvas_on'));
			painting_on.touchable = false;
			painting_on.x = 113;
			painting_on.y = 0;
			
			painting_off = new Image(this.assets.getTexture('canvas_off'));
			painting_off.touchable = false;
			painting_off.x = 0;
			painting_off.y = 0;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting['SafeUnlocked'] == 'Yes'){
					SafeUnlocked = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting['Safe'] == 'Open'){
					SafeOpen = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting['Painting'] == 'Open'){
					PaintingOpen = true;
					painting_on.alpha = 0;
					painting_off.alpha = 1;
				}else{
					painting_on.alpha = 1;
					painting_off.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting['Tube'] == 'PickedUp'){
					trace('BARk 00');
					TubePickedUp = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting['Stone'] == 'PickedUp'){
					trace('BARk 01');
					StonePickedUp = true;
				}
				
				if(TubePickedUp === true){
					trace('BARk 02');
					if(StonePickedUp === true){
						trace('BARk 03');
						tube.alpha = 0;						
					}else{
						trace('BARk 04');
				//		tube.texture = this.assets.getTexture('stone');
				//		tube.alpha = 1;
						tube.alpha = 0;
					}
				}else{
					trace('BARk 05');
					tube.alpha = 1;
				}
				
			}else{
				painting_on.alpha = 1;
				painting_off.alpha = 0;
				
				tube.alpha = 1;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock['Solved'] == 'Yes'){	
					if(SafeUnlocked === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RotaryClicks(1);
						SafeUnlocked = true;
						Animating = true;
						SafeOpen = true;
						safe_off.alpha = 0;
						safe_on.alpha = 1;
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting;	
						}
						SaveArray['SafeUnlocked'] = 'Yes';
						SaveArray['Safe'] = 'Open';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePainting',SaveArray);
						CreateTubeHit();
						Starling.juggler.delayCall(function():void{
							OpenSafe();
						},2);
					}else{
						if(SafeOpen === true){
							CreateTubeHit();
							safe_on.alpha = 0;
							safe_off.alpha = 1;
						}else{
							safe_on.alpha = 1;
							safe_off.alpha = 0;
						}
						
						
					}
				}else{
					safe_on.alpha = 1;
					safe_off.alpha = 0;
				}
			}else{
				safe_on.alpha = 1;
				safe_off.alpha = 0;
			}
			
			
			
			
			this.addChildAt(tube,1);
			this.addChildAt(safe_on,2);
			this.addChildAt(safe_off,3);
			this.addChildAt(painting_on,4);
			this.addChildAt(painting_off,5);
			
			CreateSkullHit();
			
			
			CreateSafeHit(SafeOpen);
			CreatePaintingHit(PaintingOpen);
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		private function OpenSafe():void{
			//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RotaryClicks();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeOpen();
			Animating = false;
			safe_on.alpha = 0;
			safe_off.alpha = 1;
		}
		
		
		
		
		private function CreateSkullHit():void{
			hit_skull = new Shape();
			this.addChild(hit_skull);
			hit_skull.graphics.beginFill(0x0000FF);
			
			hit_skull.graphics.lineTo(587,20);	
			hit_skull.graphics.lineTo(636,16);	
			hit_skull.graphics.lineTo(788,105);	
			hit_skull.graphics.lineTo(703,260);	
			hit_skull.graphics.lineTo(673,252);	
							
			hit_skull.graphics.endFill(false);
			hit_skull.alpha = 0.0;
			hit_skull.touchable = false;
			hit_skull.graphics.precisionHitTest = true;	
			
		}
		
		private function CreateTubeHit():void{
			hit_tube = new Shape();
			this.addChild(hit_tube);
			hit_tube.graphics.beginFill(0x0000FF);
			
			hit_tube.graphics.lineTo(265,304);	
			hit_tube.graphics.lineTo(327,158);	
			hit_tube.graphics.lineTo(360,166);	
			hit_tube.graphics.lineTo(425,261);	
			hit_tube.graphics.lineTo(415,328);	
			hit_tube.graphics.lineTo(330,339);	
					
			hit_tube.graphics.endFill(false);
			hit_tube.alpha = 0.0;
			hit_tube.touchable = false;
			hit_tube.graphics.precisionHitTest = true;	
		
		}
			
		private function CreateSafeHit(open:Boolean = false):void{
			hit_safe = new Shape();		
			hit_safe.x = 0;
			hit_safe.y = 0;
			hit_safe.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_safe.graphics.lineTo(261,133);					
				hit_safe.graphics.lineTo(463,144);					
				hit_safe.graphics.lineTo(461,341);					
				hit_safe.graphics.lineTo(262,350);					
			
			}else{
				
				hit_safe.graphics.lineTo(443,141);
				hit_safe.graphics.lineTo(601,114);
				hit_safe.graphics.lineTo(626,122);
				hit_safe.graphics.lineTo(626,355);
				hit_safe.graphics.lineTo(610,366);
				hit_safe.graphics.lineTo(443,340);
			
				
			}				
			hit_safe.graphics.endFill(false);			
			hit_safe.alpha = 0.0;			
			hit_safe.graphics.precisionHitTest = true;	
			hit_safe.touchable = false
			this.addChild(hit_safe);
			
			
		}
		
		private function CreatePaintingHit(open:Boolean = false):void{
			hit_painting = new Shape();		
			hit_painting.x = 0;
			hit_painting.y = 0;
			hit_painting.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_painting.graphics.lineTo(126,2);					
				hit_painting.graphics.lineTo(559,44);					
				hit_painting.graphics.lineTo(556,452);					
				hit_painting.graphics.lineTo(129,493);					
					
				
			}else{
				
				hit_painting.graphics.lineTo(0,0);
				hit_painting.graphics.lineTo(110,0);
				hit_painting.graphics.lineTo(114,507);
				hit_painting.graphics.lineTo(0,389);
				
			}				
			hit_painting.graphics.endFill(false);			
			hit_painting.alpha = 0.0;			
			hit_painting.graphics.precisionHitTest = true;	
			hit_painting.touchable = false
			this.addChild(hit_painting);
			
			
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
							FadeOut((BuildingOfficeBack as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeBackObj,true
							);
							return;
						}else if(hit_painting.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PaintingHandler();
							return;
						}else if(hit_safe.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SafeHandler();
						}else if(hit_skull.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SkullHandler();
							
						}else if(SafeOpen === true){
							if(hit_tube.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								TubeHandler();
							}
						}else{
							
						}
					}
				}
			}
		}
		
		
		
		private function SkullHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A horned skull hangs on the wall.");			
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The skull resembles a bull, but the horns are unusually large.");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A horned skull hangs on the wall.");
				
			}
		}
		
		/*
		private var hit_skull:Shape;
		private var hit_wall:Shape;
		
		*/
		
		private function TubeHandler():void{
			if(TubePickedUp === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_TubeRed,
					'item_TubeRed',
					'inven_tubeRed_sm'
				);
				TubePickedUp = true;
				tube.alpha = 0;
			//	tube.texture = this.assets.getTexture('stone');
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting;	
				}
				SaveArray['Tube'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePainting',SaveArray);
				return;
		/*	}else if(StonePickedUp === false){
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_StoneOne,
					'item_StoneOne',
					'inven_stoneOne_sm'
				);
				StonePickedUp = true;
				tube.alpha = 0;
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting;	
				}
				SaveArray['Stone'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePainting',SaveArray);
				return;
		*/
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The safe is empty...");
			}
		}
		
		private function SafeHandler():void{
			
			if(SafeUnlocked === false){
				FadeOut((BuildingOfficeLock as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeLockObj,true
				);
			}else{
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting;	
				}
				if(SafeOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeOpen();
					SafeOpen = true;
					safe_on.alpha = 0;
					safe_off.alpha = 1;
					SaveArray['Safe'] = "Open";
					hit_safe.graphics.clear();
					CreateSafeHit(true);
					CreateTubeHit();
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeClose();
					SafeOpen = false;
					safe_on.alpha = 1;
					safe_off.alpha = 0;
					SaveArray['Safe'] = "Closed";
					hit_safe.graphics.clear();
					hit_tube.graphics.clear();
					CreateSafeHit(false);
				
				}
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePainting',SaveArray);
			}
		}
		
		private function PaintingHandler():void{
		
			if(PaintingOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CreakyOpen();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting;	
				}
				PaintingOpen = true;
				painting_on.alpha = 0;
				painting_off.alpha = 1;
				SaveArray['Painting'] = "Open";
				hit_painting.graphics.clear();
				CreatePaintingHit(true);
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePainting',SaveArray);
			}else{
				if(SafeOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CreakyClose();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting;	
					}
					PaintingOpen = false;
					painting_on.alpha = 1;
					painting_off.alpha = 0;
					SaveArray['Painting'] = "Closed";
					hit_painting.graphics.clear();
					CreatePaintingHit(false);
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePainting',SaveArray);
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I should close the safe before putting the picture frame back in place...");
					
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
			
			
			
			this.assets.removeTexture("buildingOfficePainting_bg",true);
			this.assets.removeTexture("BuildingOfficePainting_Sprite_01",true);
			this.assets.removeTextureAtlas("BuildingOfficePainting_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficePainting_01");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficePainting_02");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficePainting_03");
			
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