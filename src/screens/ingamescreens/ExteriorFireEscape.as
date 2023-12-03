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
	
	
	
	public class ExteriorFireEscape extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var door_closed:Image;
		private var door_open:Image;
		private var ladder:Image;
		
		private var hit_door:Shape;
		private var hit_ladder:Shape;
		private var hit_room:Shape;
		private var hit_stairs:Shape;
		private var Animating:Boolean = false;
	
		
		private var hit_floor:Shape;
		private var hit_exterior:Shape;
				
		private var RONum:int = 0;
		
	//	private var DoorOpen:Boolean = false;
		private var DoorOpen:Boolean = true;
		private var LadderDown:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function ExteriorFireEscape(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('exteriorFireEscape_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorFireEscape/exteriorFireEscape_bg.jpg'));
				game.TrackAssets('exteriorFireEscape_01');
			}
			if(game.CheckAsset('exteriorFireEscape_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorFireEscape/ExteriorFireEscape_Sprite_01.png'));
				game.TrackAssets('exteriorFireEscape_02');
			}
			if(game.CheckAsset('exteriorFireEscape_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorFireEscape/ExteriorFireEscape_Sprite_01.xml'));
				game.TrackAssets('exteriorFireEscape_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ExteriorFireEscape","ExteriorFireEscapeObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('exteriorFireEscape_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			door_closed = new Image(this.assets.getTexture('rocketRoom_door'));
			door_closed.touchable = false;
			door_closed.x = 104;
			door_closed.y = 22;
			
			door_open = new Image(this.assets.getTexture('rocketRoom_door_open'));
			door_open.touchable = false;
			door_open.x = 0;
			door_open.y = 0;
			
			ladder = new Image(this.assets.getTexture('ladder_on'));
			ladder.touchable = false;
			ladder.x = 573;
			ladder.y = 139;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorFireEscape != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorFireEscape['LadderDown'] == 'Yes'){
					LadderDown = true;
					ladder.alpha = 0;
				}else{
					ladder.alpha = 0;
				}
			}else{
				ladder.alpha = 1;
			}
			
			/*
			private var door_closed:Image;
			private var door_open:Image;
			private var ladder:Image;
			*/
			
			
			door_closed.alpha = 0;
			door_open.alpha = 1;
			
			this.addChildAt(door_closed,1);
			this.addChildAt(door_open,2);
			this.addChildAt(ladder,3);
			
			CreateFloorHit();
			CreateExteriorHit();
			
			CreateLadderHit(LadderDown);
			CreateDoorHit();
			CreateRoomHit();
			CreateStairsHit();
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadCityHum(true,999);
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
		
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
		/*
		private var hit_door:Image;
		private var hit_ladder:Image;
		*/
		
		private function CreateExteriorHit():void{
			hit_exterior = new Shape();
			hit_exterior.touchable = false;
			hit_exterior.graphics.beginFill(0x00ff00);
			
			hit_exterior.graphics.lineTo(513,0);
			hit_exterior.graphics.lineTo(793,0);
			hit_exterior.graphics.lineTo(784,323);
			hit_exterior.graphics.lineTo(452,294);
			
			hit_exterior.graphics.endFill(false);
			hit_exterior.alpha = 0.0;
			
			hit_exterior.graphics.precisionHitTest = true;	
			this.addChild(hit_exterior);
		}
		
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0x00ff00);
			
			hit_floor.graphics.lineTo(101,478);
			hit_floor.graphics.lineTo(432,348);
			hit_floor.graphics.lineTo(785,393);
			hit_floor.graphics.lineTo(597,505);
			hit_floor.graphics.lineTo(106,505);
			
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		private function CreateLadderHit(open:Boolean = false):void{
			hit_ladder = new Shape();		
			hit_ladder.x = 0;
			hit_ladder.y = 0;
			hit_ladder.graphics.beginFill(0x0000FF);
			if(open === false){	
			
				
				hit_ladder.graphics.lineTo(575,136);
				hit_ladder.graphics.lineTo(673,136);
				hit_ladder.graphics.lineTo(670,400);
				hit_ladder.graphics.lineTo(570,385);
				
				
			}else{
				
				
				hit_ladder.graphics.lineTo(501,353);
				hit_ladder.graphics.lineTo(525,302);
				hit_ladder.graphics.lineTo(583,302);
				hit_ladder.graphics.lineTo(583,276);
				hit_ladder.graphics.lineTo(708,296);
				hit_ladder.graphics.lineTo(704,396);
				hit_ladder.graphics.lineTo(635,447);
				hit_ladder.graphics.lineTo(515,416);
				
			}
			
			hit_ladder.graphics.endFill(false);			
			hit_ladder.alpha = 0.0;			
			hit_ladder.graphics.precisionHitTest = true;	
			hit_ladder.touchable = false
			this.addChild(hit_ladder);
			
			
			
		}
		//hit_stairs
		private function CreateStairsHit():void{
			hit_stairs = new Shape();
			hit_stairs.touchable = false;
			hit_stairs.graphics.beginFill(0x00ff00);

			hit_stairs.graphics.lineTo(297,212);
			hit_stairs.graphics.lineTo(373,0);
			hit_stairs.graphics.lineTo(507,0);
			hit_stairs.graphics.lineTo(445,267);
			hit_stairs.graphics.lineTo(340,263);
			
			hit_stairs.graphics.endFill(false);
			hit_stairs.alpha = 0.0;
			
			hit_stairs.graphics.precisionHitTest = true;	
			this.addChild(hit_stairs);
			
			
		}
		
		private function CreateRoomHit():void{
			hit_room = new Shape();
			hit_room.touchable = false;
			hit_room.graphics.beginFill(0x00ff00);
			
			
			hit_room.graphics.lineTo(105,20);
			hit_room.graphics.lineTo(278,62);
			hit_room.graphics.lineTo(282,396);
			hit_room.graphics.lineTo(116,453);
			
			
			hit_room.graphics.endFill(false);
			hit_room.alpha = 0.0;
			
			hit_room.graphics.precisionHitTest = true;	
			this.addChild(hit_room);
			
			
		}
		private function CreateDoorHit():void{
			hit_door = new Shape();		
			hit_door.x = 0;
			hit_door.y = 0;
			hit_door.graphics.beginFill(0x0000FF);
			
				
				hit_door.graphics.lineTo(0,0);	
				hit_door.graphics.lineTo(47,0);	
				hit_door.graphics.lineTo(118,20);	
				hit_door.graphics.lineTo(130,465);	
				hit_door.graphics.lineTo(3,371);	
				
			
			
			hit_door.graphics.endFill(false);			
			hit_door.alpha = 0.0;			
			hit_door.graphics.precisionHitTest = true;	
			hit_door.touchable = false
			this.addChild(hit_door);
			
			
			
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						
						if(hit_room.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((RocketRoom as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomObj,true
									);
						}else if(hit_ladder.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LadderHandler();
						}else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Probably should leave the door open. Don't want to get locked out...");
						}else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The black steel of the fire escape clings to the side of the building...");
						}
						else if(hit_exterior.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ExteriorHandler();
						
						}else if(hit_stairs.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpenTwo();
					//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyClose();
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalSteps();
							FadeOut((ExteriorFireEscapeUpper as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorFireEscapeUpperObj,true
							);
							
							
						}
					
						
					//	if(targ == goback.SourceImage){
					//		
					//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
					//		FadeOut((BuildingOffice as Class), 
					//			(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeObj,true
					//		);
					//	}
					}
				}
			}
		}
		private function ExteriorHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I must be careful; a fall from this height could really hurt me.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A brisk wind whips past the building and into the night...");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I must be careful; a fall from this height could really hurt me.");
			}
		}
		
		private function LadderHandler():void{
			if(LadderDown === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyClose();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangThree();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BarrelKickDeep();
			//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ladder();
				
				LadderDown = true;
				ladder.alpha = 0;
				hit_ladder.graphics.clear();
				
				
				CreateLadderHit(true);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorFireEscape != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorFireEscape;
				}
				
				SaveArray['LadderDown'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorFireEscape',SaveArray);
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyClose();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ladder();
				FadeOut((ExteriorRear as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorRearObj,true
				);
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
			
			
			
			this.assets.removeTexture("exteriorFireEscape_bg",true);
			this.assets.removeTexture("ExteriorFireEscape_Sprite_01",true);
			this.assets.removeTextureAtlas("ExteriorFireEscape_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("exteriorFireEscape_01");
			(stage.getChildAt(0) as Object).falseAsset("exteriorFireEscape_02");
			(stage.getChildAt(0) as Object).falseAsset("exteriorFireEscape_03");
			
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
