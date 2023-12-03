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
	
	
	public class ExteriorFireEscapeUpper extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var door_open:Image;
		private var door_closed:Image;
		private var metal:Image;
		
		private var hit_stairs:Shape;
		private var hit_door:Shape;
		private var hit_room:Shape;
		private var hit_metal:Shape;
	
		private var hit_wall:Shape;
		private var hit_floor:Shape;
		
		private var RONum:int = 0;
			
		private var Animating:Boolean = false;
		private var DoorOpen:Boolean = false;
		private var MetalPickedUp:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;
		
		public function ExteriorFireEscapeUpper(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('exteriorFireEscapeUpper_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorFireEscapeUpper/exteriorFireEscapeUpper_bg.jpg'));
				game.TrackAssets('exteriorFireEscapeUpper_01');
			}
			if(game.CheckAsset('exteriorFireEscapeUpper_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorFireEscapeUpper/ExteriorFireEscapeUpper_Sprite_01.png'));
				game.TrackAssets('exteriorFireEscapeUpper_02');
			}
			if(game.CheckAsset('exteriorFireEscapeUpper_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorFireEscapeUpper/ExteriorFireEscapeUpper_Sprite_01.xml'));
				game.TrackAssets('exteriorFireEscapeUpper_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ExteriorFireEscapeUpper","ExteriorFireEscapeUpperObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('exteriorFireEscapeUpper_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			/*
			private var door_open:Image;
			private var door_closed:Image;
			private var metal:Image;
			*/
			door_closed = new Image(this.assets.getTexture('geneticsDoor_closed'));
			door_closed.touchable = false;
			door_closed.x = 251;
			door_closed.y = 25;
			
			door_open = new Image(this.assets.getTexture('geneticsDoor_open'));
			door_open.touchable = false;
			door_open.x = 55;
			door_open.y = 18;
			
			metal = new Image(this.assets.getTexture('metal_bar'));
			metal.touchable = false;
			metal.x = 104;
			metal.y = 306;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorFireEscapeUpper != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorFireEscapeUpper['Metal'] == 'PickedUp'){
					MetalPickedUp = true;
					metal.alpha = 0;
				}else{
					metal.alpha = 1;
				}
			}else{
				metal.alpha = 1;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoom != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoom['Door'] == 'Open'){
					DoorOpen = true;
					door_closed.alpha = 0;
					door_open.alpha = 1;
				}
				else{
					door_closed.alpha = 1;
					door_open.alpha = 0;
				}
			}else{
				door_closed.alpha = 1;
				door_open.alpha = 0;
			}
			
			
			
			
			this.addChildAt(door_closed,1);
			this.addChildAt(door_open,2);
			this.addChildAt(metal,3);
				
			CreateFloorHit();
			CreateWallHit();
			
			CreateDoorHit(DoorOpen);
			CreateRoomHit();
			CreateMetalHit();
			CreateStairsHit();
			
		
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Drone",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadCityHum(true,999);
			
			Starling.juggler.delayCall(function():void{
				
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadWindHowl(true,999);
				PlayShipGroans();
				
			},0.5);
			//WindOne	
		}
		private function PlayShipGroans():void{
			Starling.juggler.delayCall(function():void{				
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadShipGroansOne(true,999);
				
			},0.5);
		}
		
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0x00ff00);
			
			hit_floor.graphics.lineTo(0,372);
			hit_floor.graphics.lineTo(119,333);
			hit_floor.graphics.lineTo(739,388);
			hit_floor.graphics.lineTo(599,502);
			hit_floor.graphics.lineTo(88,506);
					
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		private function CreateWallHit():void{
			hit_wall = new Shape();
			hit_wall.touchable = false;
			hit_wall.graphics.beginFill(0x00ff00);
			
			hit_wall.graphics.lineTo(67,0);
			hit_wall.graphics.lineTo(571,0);
			hit_wall.graphics.lineTo(665,270);
			hit_wall.graphics.lineTo(450,360);
			hit_wall.graphics.lineTo(178,332);
					
			hit_wall.graphics.endFill(false);
			hit_wall.alpha = 0.0;
			
			hit_wall.graphics.precisionHitTest = true;	
			this.addChild(hit_wall);
		}
		
		private function CreateDoorHit(open:Boolean = false):void{
			hit_door = new Shape();		
			hit_door.x = 0;
			hit_door.y = 0;
			hit_door.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				
				hit_door.graphics.lineTo(260,38);
				hit_door.graphics.lineTo(426,28);
				hit_door.graphics.lineTo(424,357);
				hit_door.graphics.lineTo(261,342);
			
			}else{
			
				hit_door.graphics.lineTo(53,20);
				hit_door.graphics.lineTo(255,40);
				hit_door.graphics.lineTo(258,345);
				hit_door.graphics.lineTo(70,368);
			
			}
			
			hit_door.graphics.endFill(false);			
			hit_door.alpha = 0.0;			
			hit_door.graphics.precisionHitTest = true;	
			hit_door.touchable = false
			this.addChild(hit_door);
			
			
			
		}
		

		
		private function CreateMetalHit():void{
			hit_metal = new Shape();
			hit_metal.touchable = false;
			hit_metal.graphics.beginFill(0x00ff00);
			
			hit_metal.graphics.lineTo(90,323);
			hit_metal.graphics.lineTo(167,297);
			hit_metal.graphics.lineTo(176,361);
			hit_metal.graphics.lineTo(263,398);
			hit_metal.graphics.lineTo(205,440);
			hit_metal.graphics.lineTo(131,413);
			hit_metal.graphics.lineTo(98,344);
		
			hit_metal.graphics.endFill(false);
			hit_metal.alpha = 0.0;
			
			hit_metal.graphics.precisionHitTest = true;	
			this.addChild(hit_metal);
		}
		
		private function CreateStairsHit():void{
			hit_stairs = new Shape();
			hit_stairs.touchable = false;
			hit_stairs.graphics.beginFill(0x00ff00);
			
			hit_stairs.graphics.lineTo(460,422);
			hit_stairs.graphics.lineTo(458,382);
			hit_stairs.graphics.lineTo(524,271);
			hit_stairs.graphics.lineTo(684,281);
			hit_stairs.graphics.lineTo(704,320);
			hit_stairs.graphics.lineTo(678,447);
			
			hit_stairs.graphics.endFill(false);
			hit_stairs.alpha = 0.0;
			
			hit_stairs.graphics.precisionHitTest = true;	
			this.addChild(hit_stairs);
		}

		
		private function CreateRoomHit():void{
			hit_room = new Shape();
			hit_room.touchable = false;
			hit_room.graphics.beginFill(0x00ff00);
			
			hit_room.graphics.lineTo(260,38);
			hit_room.graphics.lineTo(426,28);
			hit_room.graphics.lineTo(424,357);
			hit_room.graphics.lineTo(261,342);
			
			hit_room.graphics.endFill(false);
			hit_room.alpha = 0.0;
			
			hit_room.graphics.precisionHitTest = true;	
			this.addChild(hit_room);
		}

		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(hit_metal.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							MetalHandler(e);
							return;
						}
						else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DoorHandler();
							return;
						}
						else if(hit_stairs.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyClose();
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpenTwo();
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalSteps();
							FadeOut((ExteriorFireEscape as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorFireEscapeObj,true
							);
							return;
						}
						
						/*
						private var hit_wall:Shape;
						private var hit_floor:Shape;
						
						*/
						
						else if(DoorOpen === true){
							if(hit_room.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((GeneticsRoom as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomObj,true
								);
								return;
							}
						}
						
						if(hit_wall.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Large concrete slabs form the rear exterior wall of the building...");
						}
						if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FloorHandler();
						}
					}
				}
			}
		}
	
		
		private function FloorHandler():void{
			(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The metal of the fire-escape groans under my step...");
		}
		
		private function MetalHandler(e:TouchEvent):void{
			if(MetalPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorFireEscapeUpper != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorFireEscapeUpper;	
				}
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PipeRingOne();
				MetalPickedUp = true;
				metal.alpha = 0;
				SaveArray['Metal'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorFireEscapeUpper',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Metal,
					'item_Metal',
					'inven_metal_sm'
				);
			}else{
				if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
					DoorHandler();
				}
			}
		}
		
		private function DoorHandler():void{
			if(DoorOpen === true){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Probably should leave the door open. I don't want to get locked out...");
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoorTwo();
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The door is locked from the inside; there's no way I can open it from here.");
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The escape door is shut tight and there is no handle.");
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't open the door.");
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
			
			
			
			this.assets.removeTexture("exteriorFireEscapeUpper_bg",true);
			this.assets.removeTexture("ExteriorFireEscapeUpper_Sprite_01",true);
			this.assets.removeTextureAtlas("ExteriorFireEscapeUpper_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("exteriorFireEscapeUpper_01");
			(stage.getChildAt(0) as Object).falseAsset("exteriorFireEscapeUpper_02");
			(stage.getChildAt(0) as Object).falseAsset("exteriorFireEscapeUpper_03");
			
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
