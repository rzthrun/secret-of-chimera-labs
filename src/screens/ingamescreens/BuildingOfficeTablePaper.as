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
	
	
	
	public class BuildingOfficeTablePaper extends Sprite
	{
		
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var tiny_driver:Image;
		private var finger_nails:Image;
		
		private var hit_driver:Shape;
		private var hit_finger_nails:Shape;
		private var RONum:int = 0;
		
		private var DriverPickedUp:Boolean = false;
		private var NailsPickedUp:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function BuildingOfficeTablePaper(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('buildingOfficeTablePaper_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeTablePaper/buildingOfficeTablePaper_bg.jpg'));
				game.TrackAssets('buildingOfficeTablePaper_01');
			}
			if(game.CheckAsset('buildingOfficeTablePaper_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeTablePaper/BuildingOfficeTablePaper_Sprite_01.png'));
				game.TrackAssets('buildingOfficeTablePaper_02');
			}
			if(game.CheckAsset('buildingOfficeTablePaper_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeTablePaper/BuildingOfficeTablePaper_Sprite_01.xml'));
				game.TrackAssets('buildingOfficeTablePaper_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BuildingOfficeTablePaper","BuildingOfficeTablePaperObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeTablePaper',SaveArray);
			
			bg = new Image(this.assets.getTexture('buildingOfficeTablePaper_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			tiny_driver = new Image(this.assets.getTexture('tiny_screwdriver'));
			tiny_driver.touchable = false;
			tiny_driver.x = 73;
			tiny_driver.y = 208;	
			
			finger_nails = new Image(this.assets.getTexture('nails'));
			finger_nails.touchable = false;
			finger_nails.x = 567;
			finger_nails.y = 198;	
			/*		
			private var tiny_driver:Image;
			private var finger_nails:Image;
			*/
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTablePaper != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTablePaper['Driver'] == 'PickedUp'){
					DriverPickedUp = true;
					tiny_driver.alpha = 0;
				}else{
					tiny_driver.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTablePaper['Nails'] == 'PickedUp'){
					NailsPickedUp = true;
					finger_nails.alpha = 0;
				}else{
					finger_nails.alpha = 1;
				}
			}else{
				tiny_driver.alpha = 1;
				finger_nails.alpha = 1;
			}
			
		
			
			this.addChildAt(tiny_driver,1);
			this.addChildAt(finger_nails,2);
			
			CreateDriverHit();
			CreateNailsHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			game.screenGamePlayHandler.NoteBookObj.AddToNoteBookDouble('chemistry_page_00','chemistry_page_01');
			
		//	game.screenGamePlayHandler.NoteBookObj.AddToNoteBook('chemistry_page_00');
		//	game.screenGamePlayHandler.NoteBookObj.AddToNoteBook('chemistry_page_01');
		}
		//hit_finger_nails
		private function CreateNailsHit():void{
			hit_finger_nails = new Shape();
			hit_finger_nails.touchable = false;
			hit_finger_nails.graphics.beginFill(0x0000ff);
			
			hit_finger_nails.graphics.lineTo(558,231);	
			hit_finger_nails.graphics.lineTo(546,202);	
			hit_finger_nails.graphics.lineTo(593,170);	
			hit_finger_nails.graphics.lineTo(651,200);	
			hit_finger_nails.graphics.lineTo(656,232);	
			hit_finger_nails.graphics.lineTo(623,254);	
			
			hit_finger_nails.graphics.endFill(false);
			hit_finger_nails.alpha = 0.0;
			
			hit_finger_nails.graphics.precisionHitTest = true;	
			this.addChild(hit_finger_nails);
		}
		
		private function CreateDriverHit():void{
			hit_driver = new Shape();
			hit_driver.touchable = false;
			hit_driver.graphics.beginFill(0x0000ff);
			
			hit_driver.graphics.lineTo(68,218);	
			hit_driver.graphics.lineTo(146,186);	
			hit_driver.graphics.lineTo(371,235);	
			hit_driver.graphics.lineTo(363,279);	
			hit_driver.graphics.lineTo(171,246);	
			hit_driver.graphics.lineTo(86,259);	
		
			hit_driver.graphics.endFill(false);
			hit_driver.alpha = 0.0;
			
			hit_driver.graphics.precisionHitTest = true;	
			this.addChild(hit_driver);
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
							FadeOut((BuildingOfficeTable as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeTableObj,true
							);
						}else if(hit_finger_nails.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							NailsHandler();
						}else if(hit_driver.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DriverHandler();
						}
					}
				}
			}
		}
		private function NailsHandler():void{
			if(NailsPickedUp === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_SampleTweezers)
					
				{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_SampleNails,
						'item_SampleNails',
						'inven_sampleNails_sm',
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_SampleTweezers,
						'item_SampleTweezers'
					);
					
					NailsPickedUp = true;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTablePaper != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTablePaper;
					}	
					
					finger_nails.alpha = 0;
					SaveArray["Nails"] = "PickedUp";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeTablePaper',SaveArray);
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					!= 
					false){	
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't use that item to pick up the nail clippings...");
				}else{
					
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Ewww... fingernail clippings...");
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I should use some type of storage container if I'm going to pick those up...");
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Ewww... it pays to be careful with other people's DNA... I should put these into a container.");
					}
					
				//	(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Ewww... finger-nail clippings...");
				}
			}
		}
		
		private function DriverHandler():void{
			if(DriverPickedUp === false){
			
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_TinyDriver,
					'item_TinyDriver',
					'inven_tinyDriver_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTablePaper != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTablePaper;
				}	
				DriverPickedUp = true;
				tiny_driver.alpha = 0;
				SaveArray["Driver"] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeTablePaper',SaveArray);
				
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
			
			
			
			this.assets.removeTexture("buildingOfficeTablePaper_bg",true);
			this.assets.removeTexture("BuildingOfficeTablePaper_Sprite_01",true);
			this.assets.removeTextureAtlas("BuildingOfficeTablePaper_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeTablePaper_01");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeTablePaper_02");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeTablePaper_03");
			
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