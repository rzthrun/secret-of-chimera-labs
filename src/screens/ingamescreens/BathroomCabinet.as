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
	
	public class BathroomCabinet extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var iodine:Image;
		private var sample:Image;	
		private var lid_on:Image;
		private var lid_off:Image;
	
		private var hit_lid:Shape;
		private var hit_iodine:Shape;
		private var hit_sample:Shape;
		
		private var hit_box_01:Shape;
		private var hit_box_02:Shape;
		private var hit_box_03:Shape;
	//	private var hit_box_04:Shape;
			
		private var LidOpen:Boolean = false;		
		
		private var IodinePickedUp:Boolean = false;
		private var SamplePickedUp:Boolean = false;
		
		private var Animating:Boolean = false;
	
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;
		
		public function BathroomCabinet(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('bathroomCabinet_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomCabinet/bathroomCabinet_bg.jpg'));
				game.TrackAssets('bathroomCabinet_01');
			}
			if(game.CheckAsset('bathroomCabinet_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomCabinet/BathroomCabinet_Sprite_01.png'));
				game.TrackAssets('bathroomCabinet_02');
			}
			if(game.CheckAsset('bathroomCabinet_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomCabinet/BathroomCabinet_Sprite_01.xml'));
				game.TrackAssets('bathroomCabinet_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BathroomCabinet","BathroomCabinetObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('bathroomCabinet_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			iodine = new Image(this.assets.getTexture('iodine'));
			iodine.touchable = false;
			iodine.x = 212;
			iodine.y = 61;
	
			sample = new Image(this.assets.getTexture('sample'));
			sample.touchable = false;
			sample.x = 390;
			sample.y = 307;
			
			lid_on = new Image(this.assets.getTexture('lid_on'));
			lid_on.touchable = false;
			lid_on.x = 180;
			lid_on.y = 34;
			
			lid_off = new Image(this.assets.getTexture('lid_off'));
			lid_off.touchable = false;
			lid_off.x = 0;
			lid_off.y = 0;
			/*
			private var iodine:Image;
			private var sample:Image;	
			private var lid_on:Image;
			private var lid_off:Image;
			*/
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet['Iodine'] == 'PickedUp'){	
					IodinePickedUp = true;
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet['Sample'] == 'PickedUp'){	
					SamplePickedUp = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet['Lid'] == 'Open'){	
					LidOpen = true;
					lid_on.alpha = 0;
					lid_off.alpha = 1;
					if(IodinePickedUp === false){
						iodine.alpha = 1;
					}else{
						iodine.alpha = 0;
					}
					if(SamplePickedUp === false){
						sample.alpha = 1;
					}else{
						sample.alpha = 0;
					}
					CreateIodineHit();
					CreateSampleHit();
				}else{
					iodine.alpha = 0;
					sample.alpha = 0;
					lid_on.alpha = 1;
					lid_off.alpha = 0;
				}
			}else{
				iodine.alpha = 0;
				sample.alpha = 0;
				lid_on.alpha = 1;
				lid_off.alpha = 0;
			}
			
			
			
			this.addChildAt(iodine,1);
			this.addChildAt(sample,2);
			this.addChildAt(lid_on,3);
			this.addChildAt(lid_off,4);
			
			//	CreateElevatorDoorHit();
			CreateBox01Hit();
			CreateBox02Hit();
			CreateBox03Hit();
			CreateLidHit(LidOpen);
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDuctVibe(true,999);
		
			Starling.juggler.delayCall(function():void{
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadBathroomDrip(true,999);				
				(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolume("DuctVibe",((stage.getChildAt(0) as Object).AmbientObj.globalVol/2),1.0);
				PlayBuildingAmb();
				
			},0.5);
			
		}
		private function PlayBuildingAmb():void{
			Starling.juggler.delayCall(function():void{
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadBuildingHum(true,999);
				(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolume("BuildingHum",((stage.getChildAt(0) as Object).AmbientObj.globalVol/2),1.0);
				
			},0.5);
			
		}
		/*
		private var hit_box_01:Shape;
		private var hit_box_02:Shape;
		private var hit_box_03:Shape;
		private var hit_box_04:Shape;
		*/
		private function CreateBox03Hit():void{
			hit_box_03 = new Shape();
			hit_box_03.touchable = false;
			hit_box_03.graphics.beginFill(0xff0000);
			
			hit_box_03.graphics.lineTo(408,429);	
			hit_box_03.graphics.lineTo(430,327);	
			hit_box_03.graphics.lineTo(584,337);	
			hit_box_03.graphics.lineTo(581,435);	
			hit_box_03.graphics.lineTo(570,466);	
			hit_box_03.graphics.lineTo(415,457);	
			
			hit_box_03.graphics.endFill(false);
			hit_box_03.alpha = 0.0;
			
			hit_box_03.graphics.precisionHitTest = true;	
			this.addChild(hit_box_03);
		}
		
		private function CreateBox02Hit():void{
			hit_box_02 = new Shape();
			hit_box_02.touchable = false;
			hit_box_02.graphics.beginFill(0xff0000);
			
			hit_box_02.graphics.lineTo(196,362);	
			hit_box_02.graphics.lineTo(356,345);	
			hit_box_02.graphics.lineTo(387,364);	
			hit_box_02.graphics.lineTo(385,469);	
			hit_box_02.graphics.lineTo(193,472);	
			
			hit_box_02.graphics.endFill(false);
			hit_box_02.alpha = 0.0;
			
			hit_box_02.graphics.precisionHitTest = true;	
			this.addChild(hit_box_02);
		}
		
		private function CreateBox01Hit():void{
			hit_box_01 = new Shape();
			hit_box_01.touchable = false;
			hit_box_01.graphics.beginFill(0xff0000);
			
			hit_box_01.graphics.lineTo(266,156);	
			hit_box_01.graphics.lineTo(347,152);	
			hit_box_01.graphics.lineTo(370,86);	
			hit_box_01.graphics.lineTo(409,88);	
			hit_box_01.graphics.lineTo(530,112);	
			hit_box_01.graphics.lineTo(575,155);	
			hit_box_01.graphics.lineTo(581,253);	
			hit_box_01.graphics.lineTo(258,252);	
		
			hit_box_01.graphics.endFill(false);
			hit_box_01.alpha = 0.0;
			
			hit_box_01.graphics.precisionHitTest = true;	
			this.addChild(hit_box_01);
		}
		
		private function CreateSampleHit():void{
			hit_sample = new Shape();
			hit_sample.touchable = false;
			hit_sample.graphics.beginFill(0xff0000);
			
			hit_sample.graphics.lineTo(351,314);	
			hit_sample.graphics.lineTo(395,295);	
			hit_sample.graphics.lineTo(460,321);	
			hit_sample.graphics.lineTo(474,466);	
			hit_sample.graphics.lineTo(406,494);	
			hit_sample.graphics.lineTo(363,463);	
			
			
			hit_sample.graphics.endFill(false);
			hit_sample.alpha = 0.0;
			
			hit_sample.graphics.precisionHitTest = true;	
			this.addChild(hit_sample);
		}
		
		private function CreateIodineHit():void{
			hit_iodine = new Shape();
			hit_iodine.touchable = false;
			hit_iodine.graphics.beginFill(0xff0000);
			
			hit_iodine.graphics.lineTo(198,78);	
			hit_iodine.graphics.lineTo(221,45);	
			hit_iodine.graphics.lineTo(261,53);	
			hit_iodine.graphics.lineTo(283,97);	
			hit_iodine.graphics.lineTo(273,250);	
			hit_iodine.graphics.lineTo(198,250);	
		
			hit_iodine.graphics.endFill(false);
			hit_iodine.alpha = 0.0;
			
			hit_iodine.graphics.precisionHitTest = true;	
			this.addChild(hit_iodine);
		}
		
		
		private function CreateLidHit(open:Boolean = false):void{
			hit_lid = new Shape();		
			hit_lid.x = 0;
			hit_lid.y = 0;
			hit_lid.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_lid.graphics.lineTo(178,33);					
				hit_lid.graphics.lineTo(605,41);					
				hit_lid.graphics.lineTo(603,457);					
				hit_lid.graphics.lineTo(179,465);					
							
			
			}else{
				
				hit_lid.graphics.lineTo(0,0);					
				hit_lid.graphics.lineTo(183,36);					
				hit_lid.graphics.lineTo(181,467);					
				hit_lid.graphics.lineTo(0,508);		
				
			}				
			hit_lid.graphics.endFill(false);			
			hit_lid.alpha = 0.0;			
			hit_lid.graphics.precisionHitTest = true;	
			hit_lid.touchable = false
			this.addChild(hit_lid);
			
			
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
							FadeOut((Bathroom as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BathroomObj,true
							);
						}else if(hit_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LidHandler();					
						
						}else if(LidOpen === true){
							if(hit_iodine.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								IodineHandler();
							}else if(hit_sample.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SampleHandler();	
							}else if(hit_box_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								Box01Handler();
							}else if(hit_box_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Boxes of various medicines.");	
							}else if(hit_box_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Neat rolls of bandaging gauze.");	
							}
						}
					}
				}
			}
		}
		private function Box01Handler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("bottles, vitamins, medicines, sterilizing equipment...");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are many first aid supplies in the cabinet.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("bottles, vitamins, medicines, sterilizing equipment..");	
			}
		}
		
		/*
		
		private var hit_box_01:Shape;
		private var hit_box_02:Shape;
		private var hit_box_03:Shape;
		*/
		
		private function SampleHandler():void{
			if(SamplePickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet;	
				}
				SamplePickedUp = true;
				sample.alpha = 0;
				SaveArray['Sample'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BathroomCabinet',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_SampleTweezers,
					'item_SampleTweezers',
					'inven_sampleTweezers_sm'
				);
			}else{
				
			}
		}
		private function IodineHandler():void{
			if(IodinePickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet;	
				}
				IodinePickedUp = true;
				iodine.alpha = 0;
				SaveArray['Iodine'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BathroomCabinet',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Iodine,
					'item_Iodine',
					'inven_iodine_sm'
				);
			}else{
				
			}
		}
		
		private function LidHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet;	
			}
			
			if(LidOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxOpen();
				LidOpen = true;
				lid_on.alpha = 0;
				lid_off.alpha = 1;
				if(IodinePickedUp === false){
					iodine.alpha = 1;
				}
				if(SamplePickedUp === false){
					sample.alpha = 1;
				}
				SaveArray['Lid'] = 'Open';
				hit_lid.graphics.clear();
				CreateLidHit(true);
				CreateIodineHit();
				CreateSampleHit();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxClose();
				LidOpen = false;
				lid_on.alpha = 1;
				lid_off.alpha = 0;
				iodine.alpha = 0;
				sample.alpha = 0;
				SaveArray['Lid'] = 'Closed';
				hit_lid.graphics.clear();
				hit_iodine.graphics.clear();
				hit_sample.graphics.clear();
				CreateLidHit(false);
				
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BathroomCabinet',SaveArray);
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
			
			
			
			this.assets.removeTexture("bathroomCabinet_bg",true);
			this.assets.removeTexture("BathroomCabinet_Sprite_01",true);		
			this.assets.removeTextureAtlas("BathroomCabinet_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("bathroomCabinet_01");
			(stage.getChildAt(0) as Object).falseAsset("bathroomCabinet_02");
			(stage.getChildAt(0) as Object).falseAsset("bathroomCabinet_03");
			
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
