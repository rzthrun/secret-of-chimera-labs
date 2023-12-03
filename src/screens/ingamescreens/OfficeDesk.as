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
	
	
	public class OfficeDesk extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var screwdriver:Image;
		private var lid:Image;
		private var fuse:Image;
		private var screen_draft:Image;
		private var screen_prog:Image;
		private var spider:Image;
		private var controller:Image;
		private var bath_door:Image;
		
		private var hit_programmer:Shape;
		private var hit_light:Shape;
		private var hit_chair:Shape;
		private var hit_floor:Shape;
		private var hit_drawer:Shape;
		
		private var hit_circuitDesk:Shape;
		private var hit_draftsman:Shape;
		
		//	private var hit_elevator_door:Shape;
		private var RONum:int = 0;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function OfficeDesk(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('officeDesk_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeDesk/officeDesk_bg.jpg'));
				game.TrackAssets('officeDesk_01');
			}
			if(game.CheckAsset('officeDesk_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeDesk/OfficeDesk_Sprite_01.png'));
				game.TrackAssets('officeDesk_02');
			}
			if(game.CheckAsset('officeDesk_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeDesk/OfficeDesk_Sprite_01.xml'));
				game.TrackAssets('officeDesk_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("OfficeDesk","OfficeDeskObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('officeDesk_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
				
			screwdriver = new Image(this.assets.getTexture('circuit_keys'));
			screwdriver.touchable = false;
			screwdriver.x = 102;
			screwdriver.y = 302;	
			
			fuse = new Image(this.assets.getTexture('circuit_fuse'));
			fuse.touchable = false;
			fuse.x = 70;
			fuse.y = 250;
			
			lid = new Image(this.assets.getTexture('circuit_toolbox_lid'));
			lid.touchable = false;
			lid.x = 0;
			lid.y = 196;	
			
			spider = new Image(this.assets.getTexture('circuit_spider'));
			spider.touchable = false;
			spider.x = 234;
			spider.y = 229;	
			
			controller = new Image(this.assets.getTexture('circuit_controller'));
			controller.touchable = false;
			controller.x = 259;
			controller.y = 253;	
			
			screen_prog = new Image(this.assets.getTexture('screen_prog'));
			screen_prog.touchable = false;
			screen_prog.x = 57;
			screen_prog.y = 79;	
			
			screen_draft = new Image(this.assets.getTexture('screen_draft'));
			screen_draft.touchable = false;
			screen_draft.x = 577;
			screen_draft.y = 102;	
			
			bath_door = new Image(this.assets.getTexture('bath_door'));
			bath_door.touchable = false;
			bath_door.x = 167;
			bath_door.y = 0;	
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Controller'] == 'Attached'){	
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Spider'] == 'PickedUp'){	
						spider.alpha = 0;
						controller.alpha = 0;
					}else{
						spider.alpha = 1;
						controller.alpha = 1;
					}
				}else{
					spider.alpha = 1;
					controller.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Screwdriver'] == 'PickedUp'){	
					screwdriver.alpha = 0;
				}else{
					screwdriver.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Lid'] == 'Open'){	
					lid.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Fuse'] == 'PickedUp'){	
						fuse.alpha = 0;
					}else{
						fuse.alpha = 1;
					}
				}else{
					lid.alpha = 0;
					fuse.alpha = 0;
				}
				
			}else{
				screwdriver.alpha = 1;
				fuse.alpha = 0;
				lid.alpha = 0;
				spider.alpha = 1;
				controller.alpha = 0;
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['ComputerOn'] == 'Yes'){
					screen_prog.alpha = 1;
				}else{
					screen_prog.alpha = 0;
				}
			}else{
				screen_prog.alpha = 0;
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDeskDraftsman != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDeskDraftsman['ComputerOn'] == 'Yes'){
					screen_draft.alpha = 1;
				}else{
					screen_draft.alpha = 0;
				}
			}else{
				screen_draft.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['Door'] == 'Open'){	
					bath_door.alpha = 0;
				}else{
					bath_door.alpha = 1;
				}
			}else{
				bath_door.alpha = 1;
			}
			
			
			
			this.addChildAt(screwdriver,1);
			
			this.addChildAt(lid,2);
			this.addChildAt(fuse,3);
			this.addChildAt(spider,4);
			this.addChildAt(controller,5);
			this.addChildAt(screen_prog,6);
			this.addChildAt(screen_draft,7);
			this.addChildAt(bath_door,8);
			
			CreateProgrammerHit();
			CreateFloorHit();
			CreateChairHit();
			CreateDrawerHit();
			CreateLightHit();
			
			CreateCircuitHit();
			CreateDraftsmanHit();
			
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
		//	(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			
		}
		
		private function CreateLightHit():void{
			hit_light = new Shape();
			hit_light.touchable = false;
			hit_light.graphics.beginFill(0xff0000);
			
			hit_light.graphics.lineTo(141,71);	
			hit_light.graphics.lineTo(138,49);	
			hit_light.graphics.lineTo(152,0);	
			hit_light.graphics.lineTo(181,0);	
			hit_light.graphics.lineTo(219,64);	
			hit_light.graphics.lineTo(176,87);	
			
			hit_light.graphics.endFill(false);
			hit_light.alpha = 0.0;
			
			hit_light.graphics.precisionHitTest = true;	
			this.addChild(hit_light);
		}
		
		private function CreateDrawerHit():void{
			hit_drawer = new Shape();
			hit_drawer.touchable = false;
			hit_drawer.graphics.beginFill(0xff0000);
			
			hit_drawer.graphics.lineTo(53,387);	
			hit_drawer.graphics.lineTo(174,347);	
			hit_drawer.graphics.lineTo(196,491);	
			hit_drawer.graphics.lineTo(163,506);	
			hit_drawer.graphics.lineTo(80,504);	
		
			hit_drawer.graphics.endFill(false);
			hit_drawer.alpha = 0.0;
			
			hit_drawer.graphics.precisionHitTest = true;	
			this.addChild(hit_drawer);
		}
		
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0xff0000);
			
			hit_floor.graphics.lineTo(208,494);	
			hit_floor.graphics.lineTo(233,410);	
			hit_floor.graphics.lineTo(513,347);	
			hit_floor.graphics.lineTo(711,357);	
			hit_floor.graphics.lineTo(597,506);	
			hit_floor.graphics.lineTo(256,509);	
		
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		private function CreateChairHit():void{
			hit_chair = new Shape();
			hit_chair.touchable = false;
			hit_chair.graphics.beginFill(0xff0000);
			
			hit_chair.graphics.lineTo(235,402);	
			hit_chair.graphics.lineTo(261,368);	
			hit_chair.graphics.lineTo(335,289);	
			hit_chair.graphics.lineTo(450,255);	
			hit_chair.graphics.lineTo(425,439);	
			hit_chair.graphics.lineTo(366,492);	
			hit_chair.graphics.lineTo(321,502);	
			hit_chair.graphics.lineTo(281,480);	
						
			hit_chair.graphics.endFill(false);
			hit_chair.alpha = 0.0;
			
			hit_chair.graphics.precisionHitTest = true;	
			this.addChild(hit_chair);
		}
		
		
		private function CreateProgrammerHit():void{
			hit_programmer = new Shape();
			hit_programmer.touchable = false;
			hit_programmer.graphics.beginFill(0xff0000);
						
			hit_programmer.graphics.lineTo(0,0);	
			hit_programmer.graphics.lineTo(127,0);	
			hit_programmer.graphics.lineTo(138,121);	
			hit_programmer.graphics.lineTo(0,143);	
					
			hit_programmer.graphics.endFill(false);
			hit_programmer.alpha = 0.0;
			
			hit_programmer.graphics.precisionHitTest = true;	
			this.addChild(hit_programmer);
		}
		
		private function CreateDraftsmanHit():void{
			hit_draftsman = new Shape();
			hit_draftsman.touchable = false;
			hit_draftsman.graphics.beginFill(0xff0000);
			
			hit_draftsman.graphics.lineTo(329,51);	
			hit_draftsman.graphics.lineTo(548,32);	
			hit_draftsman.graphics.lineTo(664,39);	
			hit_draftsman.graphics.lineTo(797,110);	
			hit_draftsman.graphics.lineTo(799,336);	
			hit_draftsman.graphics.lineTo(628,358);	
			hit_draftsman.graphics.lineTo(455,252);	
			hit_draftsman.graphics.lineTo(373,211);	
			hit_draftsman.graphics.lineTo(326,145);	
		
			hit_draftsman.graphics.endFill(false);
			hit_draftsman.alpha = 0.0;
			
			hit_draftsman.graphics.precisionHitTest = true;	
			this.addChild(hit_draftsman);
		}
		
		
		private function CreateCircuitHit():void{
			hit_circuitDesk = new Shape();
			hit_circuitDesk.touchable = false;
			hit_circuitDesk.graphics.beginFill(0xff0000);
			
			hit_circuitDesk.graphics.lineTo(0,155);	
			hit_circuitDesk.graphics.lineTo(176,122);	
			hit_circuitDesk.graphics.lineTo(310,135);	
			hit_circuitDesk.graphics.lineTo(379,230);	
			hit_circuitDesk.graphics.lineTo(393,255);	
			hit_circuitDesk.graphics.lineTo(78,364);	
			hit_circuitDesk.graphics.lineTo(0,337);	
			
			hit_circuitDesk.graphics.endFill(false);
			hit_circuitDesk.alpha = 0.0;
			
			hit_circuitDesk.graphics.precisionHitTest = true;	
			this.addChild(hit_circuitDesk);
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
							
							FadeOut((Office as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeObj,true
							);
						}else if(hit_circuitDesk.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((OfficeCircuit as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeCircuitObj,true
							);
						}else if(hit_draftsman.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((OfficeDraftsman as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeDraftsmanObj,true
							);
						}else if(hit_programmer.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((OfficeProgrammer as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeProgrammerObj,true
							);
						}else if(hit_light.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The electric lamp glows steadily.");	
						}else if(hit_chair.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ChairHandler();
						}else if(hit_chair.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The shadows of old coffee stains cover the carpeted floor.");
						}else if(hit_drawer.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DrawerHandler();
						}
					}
				}
			}
		}
		
		private function DrawerHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoor();
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_SmallKey)
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This key doesn't seem to unlock this set of drawers...");
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The drawers are locked shut. I can't open them.");
			}
		}
		
		/*		
		private var hit_programmer:Shape;
		private var hit_light:Shape;
		private var hit_chair:Shape;
		private var hit_floor:Shape;
		private var hit_drawer:Shape;		
		*/
		private function ChairHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An ergonomic chair.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Looks like a comfortable chair.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Maybe I'll have an opportunity to sit down later.");	
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
			
			
			
			this.assets.removeTexture("officeDesk_bg",true);
			this.assets.removeTexture("OfficeDesk_Sprite_01",true);
			this.assets.removeTextureAtlas("OfficeDesk_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("officeDesk_01");
			(stage.getChildAt(0) as Object).falseAsset("officeDesk_02");
			(stage.getChildAt(0) as Object).falseAsset("officeDesk_03");
			
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
