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
	
	
	public class BuildingOfficeTable extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var stone:Image;
		private var lid_on:Image;
		private var lid_off:Image;
		private var chisel:Image;
		private var book:Image;
		
		private var hit_book:Shape;
		private var hit_case:Shape;
		private var hit_stone:Shape;
		private var hit_chisel:Shape;
		private var hit_paper:Shape;
		private var hit_chalkboard:Shape;
		
		private var hit_frog:Shape;
		private var hit_lamp:Shape;
		private var hit_chair:Shape;
		private var hit_table:Shape;
		private var hit_map:Shape;
		private var hit_stack:Shape;
		
		
		private var CaseOpen:Boolean = false;
		private var ChiselPickedUp:Boolean = false;
		private var StonePickedUp:Boolean = false;
		private var BookPickedUp:Boolean = false;
		private var Animating:Boolean = false;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function BuildingOfficeTable(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('buildingOfficeTable_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeTable/buildingOfficeTable_bg.jpg'));
				game.TrackAssets('buildingOfficeTable_01');
			}
			if(game.CheckAsset('buildingOfficeTable_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeTable/BuildingOfficeTable_Sprite_01.png'));
				game.TrackAssets('buildingOfficeTable_02');
			}
			if(game.CheckAsset('buildingOfficeTable_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeTable/BuildingOfficeTable_Sprite_01.xml'));
				game.TrackAssets('buildingOfficeTable_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BuildingOfficeTable","BuildingOfficeTableObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('buildingOfficeTable_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			stone = new Image(this.assets.getTexture('slide'));
			stone.touchable = false;
			stone.x = 182;
			stone.y = 265;
						
			lid_on = new Image(this.assets.getTexture('lid_on'));
			lid_on.touchable = false;
			lid_on.x = 70;
			lid_on.y = 226;
			
			lid_off = new Image(this.assets.getTexture('lid_off'));
			lid_off.touchable = false;
			lid_off.x = 13;
			lid_off.y = 59;
			
			chisel = new Image(this.assets.getTexture('chisel'));
			chisel.touchable = false;
			chisel.x = 504;
			chisel.y = 322;
					
			book = new Image(this.assets.getTexture('book'));
			book.touchable = false;
			book.x = 401;
			book.y = 156;
						
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable['Stone'] == 'PickedUp'){	
					StonePickedUp = true;
					stone.alpha = 0;
				}else{
					stone.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable['Case'] == 'Open'){	
					CaseOpen = true;
					lid_on.alpha = 0;
					lid_off.alpha = 1;
					CreateStoneHit();
				}else{
					lid_on.alpha = 1;
					lid_off.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable['Book'] == 'PickedUp'){	
					BookPickedUp = true;
					book.alpha = 0;
				}else{
					book.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable['Chisel'] == 'PickedUp'){	
					ChiselPickedUp = true;
					chisel.alpha = 0;
				}else{
					chisel.alpha = 1;
				}
			}else{
				stone.alpha = 1;
				lid_on.alpha = 1;
				lid_off.alpha = 0;
				book.alpha = 1;
				chisel.alpha = 1;
			}
			
			
			/*
			private var stone:Image;
			private var lid_on:Image;
			private var lid_off:Image;
			private var chisel:Image;
			private var book:Image;
			*/
			
			this.addChildAt(stone,1);
			this.addChildAt(lid_on,2);
			this.addChildAt(lid_off,3);
			this.addChildAt(chisel,4);
			this.addChildAt(book,5);
			
			CreateChairHit();
			CreateMapHit();
			CreateStackHit();
			CreateTableHit();
			CreateLampHit();
			CreateFrogHit();
			
			CreateChalkboardHit();
			CreateCaseHit(CaseOpen);
			CreateChiselHit();
			CreateBookHit();
			CreatePaperHit();
			
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
	
		private function CreateStackHit():void{
			hit_stack = new Shape();
			this.addChild(hit_stack);
			hit_stack.graphics.beginFill(0xFF0000);
			
			hit_stack.graphics.lineTo(0,37);				
			hit_stack.graphics.lineTo(39,35);				
			hit_stack.graphics.lineTo(125,131);				
			hit_stack.graphics.lineTo(114,248);				
			hit_stack.graphics.lineTo(0,344);				
				
			
			hit_stack.graphics.endFill(false);
			hit_stack.alpha = 0.0;
			hit_stack.touchable = false;
			hit_stack.graphics.precisionHitTest = true;	
		}
		
		private function CreateMapHit():void{
			hit_map = new Shape();
			this.addChild(hit_map);
			hit_map.graphics.beginFill(0xFF0000);
			
			hit_map.graphics.lineTo(403,354);				
			hit_map.graphics.lineTo(521,295);				
			hit_map.graphics.lineTo(723,339);				
			hit_map.graphics.lineTo(722,387);				
			hit_map.graphics.lineTo(606,440);				
			hit_map.graphics.lineTo(545,430);				
			
			hit_map.graphics.endFill(false);
			hit_map.alpha = 0.0;
			hit_map.touchable = false;
			hit_map.graphics.precisionHitTest = true;	
		}
		
		private function CreateTableHit():void{
			hit_table = new Shape();
			this.addChild(hit_table);
			hit_table.graphics.beginFill(0xFF0000);
			
			hit_table.graphics.lineTo(19,392);				
			hit_table.graphics.lineTo(14,344);				
			hit_table.graphics.lineTo(60,315);				
			hit_table.graphics.lineTo(345,252);				
			hit_table.graphics.lineTo(543,277);				
			hit_table.graphics.lineTo(530,451);				
			hit_table.graphics.lineTo(339,418);				
			hit_table.graphics.lineTo(279,512);				
			hit_table.graphics.lineTo(83,512);				
			
			hit_table.graphics.endFill(false);
			hit_table.alpha = 0.0;
			hit_table.touchable = false;
			hit_table.graphics.precisionHitTest = true;	
		}
		
		
		private function CreateChairHit():void{
			hit_chair = new Shape();
			this.addChild(hit_chair);
			hit_chair.graphics.beginFill(0xFF0000);
			
			hit_chair.graphics.lineTo(345,245);	
			hit_chair.graphics.lineTo(355,179);	
			hit_chair.graphics.lineTo(477,150);	
			hit_chair.graphics.lineTo(500,46);	
			hit_chair.graphics.lineTo(602,32);	
			hit_chair.graphics.lineTo(689,95);	
			hit_chair.graphics.lineTo(642,203);	
			hit_chair.graphics.lineTo(525,268);	
			
			hit_chair.graphics.endFill(false);
			hit_chair.alpha = 0.0;
			hit_chair.touchable = false;
			hit_chair.graphics.precisionHitTest = true;	
		}
		
		private function CreateLampHit():void{
			hit_lamp = new Shape();
			this.addChild(hit_lamp);
			hit_lamp.graphics.beginFill(0xFF0000);
			
			hit_lamp.graphics.lineTo(651,174);	
			hit_lamp.graphics.lineTo(684,113);	
			hit_lamp.graphics.lineTo(796,157);	
			hit_lamp.graphics.lineTo(790,232);	
			hit_lamp.graphics.lineTo(729,336);	
			hit_lamp.graphics.lineTo(648,312);	
			hit_lamp.graphics.lineTo(693,221);	
						
			hit_lamp.graphics.endFill(false);
			hit_lamp.alpha = 0.0;
			hit_lamp.touchable = false;
			hit_lamp.graphics.precisionHitTest = true;	
		}
		
		private function CreateFrogHit():void{
			hit_frog = new Shape();
			this.addChild(hit_frog);
			hit_frog.graphics.beginFill(0xFF0000);
			
			hit_frog.graphics.lineTo(543,288);	
			hit_frog.graphics.lineTo(549,245);	
			hit_frog.graphics.lineTo(616,246);	
			hit_frog.graphics.lineTo(648,272);	
			hit_frog.graphics.lineTo(636,305);	
			hit_frog.graphics.lineTo(573,307);	
		
			hit_frog.graphics.endFill(false);
			hit_frog.alpha = 0.0;
			hit_frog.touchable = false;
			hit_frog.graphics.precisionHitTest = true;	
		}
		
		private function CreateChalkboardHit():void{
			hit_chalkboard = new Shape();
			this.addChild(hit_chalkboard);
			hit_chalkboard.graphics.beginFill(0xFF0000);
			
			hit_chalkboard.graphics.lineTo(33,0);	
			hit_chalkboard.graphics.lineTo(426,0);	
			hit_chalkboard.graphics.lineTo(428,65);	
			hit_chalkboard.graphics.lineTo(126,128);	
			hit_chalkboard.graphics.lineTo(40,33);	
			
			hit_chalkboard.graphics.endFill(false);
			hit_chalkboard.alpha = 0.0;
			hit_chalkboard.touchable = false;
			hit_chalkboard.graphics.precisionHitTest = true;	
		}
		
		private function CreatePaperHit():void{
			hit_paper = new Shape();
			this.addChild(hit_paper);
			hit_paper.graphics.beginFill(0x0000FF);
			
			hit_paper.graphics.lineTo(336,291);	
			hit_paper.graphics.lineTo(483,287);	
			hit_paper.graphics.lineTo(500,344);	
			hit_paper.graphics.lineTo(331,347);	
					
			hit_paper.graphics.endFill(false);
			hit_paper.alpha = 0.0;
			hit_paper.touchable = false;
			hit_paper.graphics.precisionHitTest = true;	
		}
		
		private function CreateBookHit():void{
			hit_book = new Shape();
			this.addChild(hit_book);
			hit_book.graphics.beginFill(0x0000FF);
			
			hit_book.graphics.lineTo(391,164);	
			hit_book.graphics.lineTo(398,148);	
			hit_book.graphics.lineTo(460,144);	
			hit_book.graphics.lineTo(503,215);	
			hit_book.graphics.lineTo(500,238);	
			hit_book.graphics.lineTo(431,245);	
			
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			hit_book.touchable = false;
			hit_book.graphics.precisionHitTest = true;	
		}
		
		private function CreateChiselHit():void{
			hit_chisel = new Shape();
			this.addChild(hit_chisel);
			hit_chisel.graphics.beginFill(0x0000FF);
			
			hit_chisel.graphics.lineTo(501,322);	
			hit_chisel.graphics.lineTo(523,314);	
			hit_chisel.graphics.lineTo(694,350);	
			hit_chisel.graphics.lineTo(631,431);	
			hit_chisel.graphics.lineTo(585,415);	
			hit_chisel.graphics.lineTo(505,332);	
			
			hit_chisel.graphics.endFill(false);
			hit_chisel.alpha = 0.0;
			hit_chisel.touchable = false;
			hit_chisel.graphics.precisionHitTest = true;	
		}
		
		private function CreateStoneHit():void{
			hit_stone = new Shape();
			this.addChild(hit_stone);
			hit_stone.graphics.beginFill(0x00ff00);
			
			hit_stone.graphics.lineTo(117,291);	
			hit_stone.graphics.lineTo(190,242);	
			hit_stone.graphics.lineTo(320,259);	
			hit_stone.graphics.lineTo(251,324);	
			
			hit_stone.graphics.endFill(false);
			hit_stone.alpha = 0.0;
			hit_stone.touchable = false;
			hit_stone.graphics.precisionHitTest = true;	
		}
		
		private function CreateCaseHit(open:Boolean = false):void{
			hit_case = new Shape();		
			hit_case.x = 0;
			hit_case.y = 0;
			hit_case.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_case.graphics.lineTo(67,318);
				hit_case.graphics.lineTo(64,294);
				hit_case.graphics.lineTo(178,215);
				hit_case.graphics.lineTo(338,241);
				hit_case.graphics.lineTo(339,275);
				hit_case.graphics.lineTo(332,305);
				hit_case.graphics.lineTo(308,330);
				hit_case.graphics.lineTo(250,354);							
				
			}else{
				
				hit_case.graphics.lineTo(10,90);
				hit_case.graphics.lineTo(156,58);
				hit_case.graphics.lineTo(181,225);
				hit_case.graphics.lineTo(63,304);
				hit_case.graphics.lineTo(43,295);
				hit_case.graphics.lineTo(43,295);
				
			}				
			hit_case.graphics.endFill(false);			
			hit_case.alpha = 0.0;			
			hit_case.graphics.precisionHitTest = true;	
			hit_case.touchable = false
			this.addChild(hit_case);
			
			
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
						}else if(hit_chisel.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ChiselHandler();
							return;
						}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BookHandler();
							return;
						}else if(hit_case.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CaseHandler();
							return;
						}else if(hit_chalkboard.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((BuildingOfficeChalkboard as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeChalkboardObj,true
							);
							return;
						}else if(hit_paper.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((BuildingOfficeTablePaper as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeTablePaperObj,true
							);
							return;
						}else if(hit_frog.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FrogHandler();
						}else if(hit_lamp.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A green bankers' light stands on the table edge.");			
						}else if(hit_map.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							MapHandler();
						}else if(hit_chair.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ChairHandler();
						}else if(hit_stack.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Books are stacked high beside the desk.");			
						}
						
						/*	
						private var hit_frog:Shape;
						private var hit_lamp:Shape;
						private var hit_chair:Shape;
						private var hit_table:Shape;
						private var hit_map:Shape;
						private var hit_stack:Shape;
						*/
						
						if(CaseOpen === true){
							trace("Smart");
							if(hit_stone.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								trace("BARK BARK");
								StoneHandler();
								return;
							}else if(hit_table.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The surface of the table is scratched and well worn.");			
								return;
							}
							
						}else{
							if(hit_table.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The surface of the table is scratched and well worn.");			
								return;
							}
						}
						
						//CaseOpen
					}
				}
				
			}
		}
		private function FrogHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The skeleton of a frog rests perched upon a book.");			
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The amphibian's bones are tiny and delicate.");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The skeleton of a frog rests perched upon a book.");	
			}
		}
		
		private function ChairHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A large leather chair sits behind the desk.");			
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The chair looks like a quite comfortable reading place.");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A slight depression in the middle of the seat suggests many hours of use.");
				
			}
		}
		
		
		private function MapHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An old map lays spread across the table.");			
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The map depicts an area full of mountains and forest in extreme detail.");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Funny... I can't seem to figure out what region of the world the map shows...");
				
			}
		}
		
		private function LionHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A skeleton of a large feline... or cat.");			
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small plaque reads 'Smilodon, c. 55 mya.'");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The bones have fossilized and turned to stone.");
				
			}
		}
		private function StoneHandler():void{
			if(StonePickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable;	
				}
				StonePickedUp = true;
				stone.alpha = 0;
				SaveArray['Stone'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeTable',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Slide,
					'item_Slide',
					'inven_slide_sm'
				);
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The interior of the strong metal case is lined with cut foam.");			
			}
		}
		
		private function CaseHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable;	
			}
			if(CaseOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxOpen();
				CaseOpen = true;
				lid_on.alpha = 0;
				lid_off.alpha = 1;
				SaveArray['Case'] = "Open";
				hit_case.graphics.clear();
				CreateCaseHit(true);
				CreateStoneHit();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxClose();
				CaseOpen = false
				lid_off.alpha = 0;
				lid_on.alpha = 1;
				SaveArray['Case'] = "Closed";
				hit_case.graphics.clear();
				hit_stone.graphics.clear();
				hit_stone = null;
				CreateCaseHit(false);
				
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeTable',SaveArray);
			
		}
		
		private function BookHandler():void{
			if(BookPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable;	
				}
				BookPickedUp = true;
				book.alpha = 0;
				SaveArray['Book'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeTable',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_BookSagan,
					'item_BookSagan',
					'inven_bookSagan_sm'
				);
			}
		}
		
		private function ChiselHandler():void{
			if(ChiselPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable;	
				}
				ChiselPickedUp = true;
				chisel.alpha = 0;
				SaveArray['Chisel'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeTable',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Chisel,
					'item_Chisel',
					'inven_chisel_sm'
				);
			}else{
				MapHandler();
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
			
			
			
			this.assets.removeTexture("buildingOfficeTable_bg",true);
			this.assets.removeTexture("BuildingOfficeTable_Sprite_01",true);
			this.assets.removeTextureAtlas("BuildingOfficeTable_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeTable_01");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeTable_02");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeTable_03");
			
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
