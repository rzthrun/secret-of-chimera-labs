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
	
	public class DeepLabFridge extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var injector:Image;
		private var book:Image;
		private var dna:Image;
		private var stone:Image;
		
		private var door_0_close:Image;
		private var door_0_open:Image;
		private var door_1_close:Image;
		private var door_1_open:Image;
		private var door_2_close:Image;
		private var door_2_open:Image;
		private var door_3_close:Image;
		private var door_3_open:Image;
		private var door_4_close:Image;
		private var door_4_open:Image;
		private var door_5_close:Image;
		private var door_5_open:Image;
		
		
		private var hit_injector:Shape;
		private var hit_book:Shape;
		private var hit_dna:Shape;
		private var hit_stone:Shape;
		
		private var hit_door_0:Shape;
		private var hit_door_1:Shape;
		private var hit_door_2:Shape;
		private var hit_door_3:Shape;
		private var hit_door_4:Shape;
		private var hit_door_5:Shape;
		
		private var hit_fridge_00:Shape;
		private var hit_fridge_01:Shape;
		private var hit_fridge_02:Shape;
		private var hit_fridge_03:Shape;
		private var hit_fridge_04:Shape;
		private var hit_fridge_05:Shape;

		private var hit_shelf_01:Shape;
		private var hit_shelf_02:Shape;
		private var hit_shelf_03:Shape;
		
		
		private var Animating:Boolean = false;
		
		private var BookPickedUp:Boolean = false;
		private var InjectorPickedUp:Boolean = false;
		private var DNAPickedUp:Boolean = false;
		private var StonePickedUp:Boolean = false;
		
		private var Door0Open:Boolean = false;
		private var Door1Open:Boolean = false;
		private var Door2Open:Boolean = false;
		private var Door3Open:Boolean = false;
		private var Door4Open:Boolean = false;
		private var Door5Open:Boolean = false;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function DeepLabFridge(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('deepLabFridge_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DeepLabFridge/deepLabFridge_bg.jpg'));
				game.TrackAssets('deepLabFridge_01');
			}
			if(game.CheckAsset('deepLabFridge_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DeepLabFridge/DeepLabFridge_Sprite_01.png'));
				game.TrackAssets('deepLabFridge_02');
			}
			if(game.CheckAsset('deepLabFridge_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DeepLabFridge/DeepLabFridge_Sprite_01.xml'));
				game.TrackAssets('deepLabFridge_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("DeepLabFridge","DeepLabFridgeObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		/*	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFull,
				'item_JarFull',
				'inven_jarFull_sm'
			);
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Iodine,
			'item_Iodine',
			'inven_iodine_sm'
			);
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_RedRock,
				'item_RedRock',
				'inven_redRock_sm'
			);
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_TestTube,
				'item_TestTube',
				'inven_testTube_sm'
			);	
			*/
			
		
			bg = new Image(this.assets.getTexture('deepLabFridge_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			injector = new Image(this.assets.getTexture('injector'));			
			injector.touchable = false;
			injector.x = 71;
			injector.y = 113;
			
			book = new Image(this.assets.getTexture('book'));			
			book.touchable = false;
			book.x = 241;
			book.y = 267;
			
			dna = new Image(this.assets.getTexture('dnaCan'));			
			dna.touchable = false;
			dna.x = 529;
			dna.y = 136;
			
			stone = new Image(this.assets.getTexture('stone'));			
			stone.touchable = false;
			stone.x = 666;
			stone.y = 290;
			
			door_0_close = new Image(this.assets.getTexture('door_00_close'));			
			door_0_close.touchable = false;
			door_0_close.x = 378;
			door_0_close.y = 76;
			
			door_0_open = new Image(this.assets.getTexture('door_00_open'));			
			door_0_open.touchable = false;
			door_0_open.x = 293;
			door_0_open.y = 73;
			
			door_1_close = new Image(this.assets.getTexture('door_01_close'));			
			door_1_close.touchable = false;
			door_1_close.x = 495;
			door_1_close.y = 67;
			
			door_1_open = new Image(this.assets.getTexture('door_01_open'));			
			door_1_open.touchable = false;
			door_1_open.x = 418;
			door_1_open.y = 61;
			
			door_2_close = new Image(this.assets.getTexture('door_02_close'));			
			door_2_close.touchable = false;
			door_2_close.x = 626;
			door_2_close.y = 57;
			
			door_2_open = new Image(this.assets.getTexture('door_02_open'));			
			door_2_open.touchable = false;
			door_2_open.x = 571;
			door_2_open.y = 45;
			
			door_3_close = new Image(this.assets.getTexture('door_03_close'));			
			door_3_close.touchable = false;
			door_3_close.x = 377;
			door_3_close.y = 236;
			
			door_3_open = new Image(this.assets.getTexture('door_03_open'));			
			door_3_open.touchable = false;
			door_3_open.x = 330;
			door_3_open.y = 236;
			
			door_4_close = new Image(this.assets.getTexture('door_04_close'));			
			door_4_close.touchable = false;
			door_4_close.x = 488;
			door_4_close.y = 238;
			
			door_4_open = new Image(this.assets.getTexture('door_04_open'));			
			door_4_open.touchable = false;
			door_4_open.x = 440;
			door_4_open.y = 239;
			
			door_5_close = new Image(this.assets.getTexture('door_05_close'));			
			door_5_close.touchable = false;
			door_5_close.x = 623;
			door_5_close.y = 244;
			
			door_5_open = new Image(this.assets.getTexture('door_05_open'));			
			door_5_open.touchable = false;
			door_5_open.x = 537;
			door_5_open.y = 242;
			/*			
			private var injector:Image;
			private var book:Image;
			private var dna:Image;
			private var stone:Image;
			
			private var door_0_close:Image;
			private var door_0_open:Image;
			private var door_1_close:Image;
			private var door_1_open:Image;
			private var door_2_close:Image;
			private var door_2_open:Image;
			private var door_3_close:Image;
			private var door_3_open:Image;
			private var door_4_close:Image;
			private var door_4_open:Image;
			private var door_5_close:Image;
			private var door_5_open:Image;			
			*/
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Stone'] == 'PickedUp'){	
					StonePickedUp = true;
					stone.alpha = 0;
				}else{
					stone.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Injector'] == 'PickedUp'){	
					InjectorPickedUp = true;
					injector.alpha = 0;
				}else{
					injector.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['DNA'] == 'PickedUp'){	
					DNAPickedUp = true;
					dna.alpha = 0;
				}else{
					dna.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Book'] == 'PickedUp'){	
					BookPickedUp = true;
					book.alpha = 0;
				}else{
					book.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Door_0'] == 'Open'){
					Door0Open = true;
					door_0_close.alpha = 0;
					door_0_open.alpha = 1;		
				}else{
					door_0_close.alpha = 1;
					door_0_open.alpha = 0;		
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Door_1'] == 'Open'){
					Door1Open = true;
					door_1_close.alpha = 0;
					door_1_open.alpha = 1;		
				}else{
					door_1_close.alpha = 1;
					door_1_open.alpha = 0;		
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Door_2'] == 'Open'){
					Door2Open = true;
					door_2_close.alpha = 0;
					door_2_open.alpha = 1;		
				}else{
					door_2_close.alpha = 1;
					door_2_open.alpha = 0;		
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Door_3'] == 'Open'){
					Door3Open = true;
					door_3_close.alpha = 0;
					door_3_open.alpha = 1;		
				}else{
					door_3_close.alpha = 1;
					door_3_open.alpha = 0;		
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Door_4'] == 'Open'){
					Door4Open = true;
					door_4_close.alpha = 0;
					door_4_open.alpha = 1;		
				}else{
					door_4_close.alpha = 1;
					door_4_open.alpha = 0;		
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Door_5'] == 'Open'){
					Door5Open = true;
					door_5_close.alpha = 0;
					door_5_open.alpha = 1;		
				}else{
					door_5_close.alpha = 1;
					door_5_open.alpha = 0;		
				}
			}else{
				injector.alpha = 1;
				book.alpha = 1;
				dna.alpha = 1;
				stone.alpha = 1;
				
				door_0_close.alpha = 1;
				door_0_open.alpha = 0;			
				door_1_close.alpha = 1;
				door_1_open.alpha = 0;			
				door_2_close.alpha = 1;
				door_2_open.alpha = 0;			
				door_3_close.alpha = 1;
				door_3_open.alpha = 0;			
				door_4_close.alpha = 1;
				door_4_open.alpha = 0;			
				door_5_close.alpha = 1;
				door_5_open.alpha = 0;
			}
			
			
			
		
			
			this.addChildAt(injector,1);
			this.addChildAt(book,2);
			this.addChildAt(dna,3);
			this.addChildAt(stone,4);
			
			this.addChildAt(door_0_close,5);
			this.addChildAt(door_0_open,6);
			
			this.addChildAt(door_1_close,7);
			this.addChildAt(door_1_open,8);
			
			this.addChildAt(door_2_close,9);
			this.addChildAt(door_2_open,10);
			
			this.addChildAt(door_3_close,11);
			this.addChildAt(door_3_open,12);
						
			this.addChildAt(door_4_close,13);
			this.addChildAt(door_4_open,14);
			
			this.addChildAt(door_5_close,15);
			this.addChildAt(door_5_open,16);
			
			CreateShelfHit();
			CreateFridgeHit();
			
			CreateStoneHit();
			CreateDNAHit();
			CreateBookHit();
			CreateInjectorHit();
			
			CreateDoor0Hit(Door0Open);
			CreateDoor1Hit(Door1Open);
			CreateDoor2Hit(Door2Open);
			CreateDoor3Hit(Door3Open);
			CreateDoor4Hit(Door4Open);
			CreateDoor5Hit(Door5Open);
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		
		
		private function CreateShelfHit():void{
			hit_shelf_01 = new Shape();
			hit_shelf_01.touchable = false;
			hit_shelf_01.graphics.beginFill(0xff0000);
			
			hit_shelf_01.graphics.lineTo(40,175);	
			hit_shelf_01.graphics.lineTo(88,58);	
			hit_shelf_01.graphics.lineTo(205,74);	
			hit_shelf_01.graphics.lineTo(206,355);	
			hit_shelf_01.graphics.lineTo(102,374);	
			hit_shelf_01.graphics.lineTo(33,273);	
					
			hit_shelf_01.graphics.endFill(false);
			hit_shelf_01.alpha = 0.0;
			
			hit_shelf_01.graphics.precisionHitTest = true;	
			
			hit_shelf_02 = new Shape();
			hit_shelf_02.touchable = false;
			hit_shelf_02.graphics.beginFill(0xff0000);
			
			hit_shelf_02.graphics.lineTo(233,339);	
			hit_shelf_02.graphics.lineTo(229,167);	
			hit_shelf_02.graphics.lineTo(281,62);	
			hit_shelf_02.graphics.lineTo(325,69);	
			hit_shelf_02.graphics.lineTo(325,270);	
			hit_shelf_02.graphics.lineTo(249,352);	
		
			hit_shelf_02.graphics.endFill(false);
			hit_shelf_02.alpha = 0.0;
			
			hit_shelf_02.graphics.precisionHitTest = true;	
			
			this.addChild(hit_shelf_01);
			this.addChild(hit_shelf_02);
		}
		
		private function CreateFridgeHit():void{
			hit_fridge_00 = new Shape();
			hit_fridge_00.touchable = false;
			hit_fridge_00.graphics.beginFill(0xff0000);
			
			hit_fridge_00.graphics.lineTo(384,81);	
			hit_fridge_00.graphics.lineTo(477,79);	
			hit_fridge_00.graphics.lineTo(474,234);	
			hit_fridge_00.graphics.lineTo(383,232);	
			
			hit_fridge_00.graphics.endFill(false);
			hit_fridge_00.alpha = 0.0;
			
			hit_fridge_00.graphics.precisionHitTest = true;	
			
			hit_fridge_01 = new Shape();
			hit_fridge_01.touchable = false;
			hit_fridge_01.graphics.beginFill(0xff0000);
			
			hit_fridge_01.graphics.lineTo(503,74);	
			hit_fridge_01.graphics.lineTo(606,67);	
			hit_fridge_01.graphics.lineTo(603,234);	
			hit_fridge_01.graphics.lineTo(500,233);				
			
			hit_fridge_01.graphics.endFill(false);
			hit_fridge_01.alpha = 0.0;
			
			hit_fridge_01.graphics.precisionHitTest = true;	
						
			hit_fridge_02 = new Shape();
			hit_fridge_02.touchable = false;
			hit_fridge_02.graphics.beginFill(0xff0000);
			
			hit_fridge_02.graphics.lineTo(640,64);	
			hit_fridge_02.graphics.lineTo(677,62);	
			hit_fridge_02.graphics.lineTo(758,126);	
			hit_fridge_02.graphics.lineTo(758,241);	
			hit_fridge_02.graphics.lineTo(633,235);	
			
			hit_fridge_02.graphics.endFill(false);
			hit_fridge_02.alpha = 0.0;
			
			hit_fridge_02.graphics.precisionHitTest = true;	
			
			hit_fridge_03 = new Shape();
			hit_fridge_03.touchable = false;
			hit_fridge_03.graphics.beginFill(0xff0000);
			
			hit_fridge_03.graphics.lineTo(382,236);	
			hit_fridge_03.graphics.lineTo(476,239);	
			hit_fridge_03.graphics.lineTo(474,393);	
			hit_fridge_03.graphics.lineTo(381,384);	
		
			hit_fridge_03.graphics.endFill(false);
			hit_fridge_03.alpha = 0.0;
			
			hit_fridge_03.graphics.precisionHitTest = true;	
			
			
			
			hit_fridge_04 = new Shape();
			hit_fridge_04.touchable = false;
			hit_fridge_04.graphics.beginFill(0xff0000);
			
			hit_fridge_04.graphics.lineTo(497,241);	
			hit_fridge_04.graphics.lineTo(606,245);	
			hit_fridge_04.graphics.lineTo(605,412);	
			hit_fridge_04.graphics.lineTo(496,396);	
		
			hit_fridge_04.graphics.endFill(false);
			hit_fridge_04.alpha = 0.0;
			
			hit_fridge_04.graphics.precisionHitTest = true;	
			
			
			
			hit_fridge_05 = new Shape();
			hit_fridge_05.touchable = false;
			hit_fridge_05.graphics.beginFill(0xff0000);
			
			hit_fridge_05.graphics.lineTo(631,247);	
			hit_fridge_05.graphics.lineTo(753,250);	
			hit_fridge_05.graphics.lineTo(753,386);	
			hit_fridge_05.graphics.lineTo(628,410);	
		
			hit_fridge_05.graphics.endFill(false);
			hit_fridge_05.alpha = 0.0;
			
			hit_fridge_05.graphics.precisionHitTest = true;	
			
			this.addChild(hit_fridge_00);
			this.addChild(hit_fridge_01);
			this.addChild(hit_fridge_02);
			this.addChild(hit_fridge_03);
			this.addChild(hit_fridge_04);
			this.addChild(hit_fridge_05);
		}
		
		
		private function CreateStoneHit():void{
			hit_stone = new Shape();
			hit_stone.touchable = false;
			hit_stone.graphics.beginFill(0xff0000);
			
			hit_stone.graphics.lineTo(636,340);	
			hit_stone.graphics.lineTo(665,298);	
			hit_stone.graphics.lineTo(712,286);	
			hit_stone.graphics.lineTo(726,365);	
			hit_stone.graphics.lineTo(715,404);	
			hit_stone.graphics.lineTo(641,405);	
			
			hit_stone.graphics.endFill(false);
			hit_stone.alpha = 0.0;
			
			hit_stone.graphics.precisionHitTest = true;	
			this.addChild(hit_stone);
		}
		
		private function CreateDNAHit():void{
			hit_dna = new Shape();
			hit_dna.touchable = false;
			hit_dna.graphics.beginFill(0xff0000);
			
			hit_dna.graphics.lineTo(522,147);	
			hit_dna.graphics.lineTo(541,125);	
			hit_dna.graphics.lineTo(580,127);	
			hit_dna.graphics.lineTo(595,148);	
			hit_dna.graphics.lineTo(593,231);	
			hit_dna.graphics.lineTo(525,230);	
		
			hit_dna.graphics.endFill(false);
			hit_dna.alpha = 0.0;
			
			hit_dna.graphics.precisionHitTest = true;	
			this.addChild(hit_dna);
		}
		
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(235,264);	
			hit_book.graphics.lineTo(260,256);	
			hit_book.graphics.lineTo(305,269);	
			hit_book.graphics.lineTo(326,347);	
			hit_book.graphics.lineTo(272,364);	
			hit_book.graphics.lineTo(248,355);	
			
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		private function CreateInjectorHit():void{
			hit_injector = new Shape();
			hit_injector.touchable = false;
			hit_injector.graphics.beginFill(0xff0000);
			
			hit_injector.graphics.lineTo(62,118);	
			hit_injector.graphics.lineTo(132,88);	
			hit_injector.graphics.lineTo(194,106);	
			hit_injector.graphics.lineTo(201,142);	
			hit_injector.graphics.lineTo(68,158);	
			
			hit_injector.graphics.endFill(false);
			hit_injector.alpha = 0.0;
			
			hit_injector.graphics.precisionHitTest = true;	
			this.addChild(hit_injector);
		}
		private function CreateDoor0Hit(open:Boolean = false):void{
			hit_door_0 = new Shape();
			hit_door_0.touchable = false;
			if(open === false){
				
				hit_door_0.x = 0;
				hit_door_0.y = 0;
				hit_door_0.graphics.beginFill(0xff0000);
				
				hit_door_0.graphics.lineTo(382,80);
				hit_door_0.graphics.lineTo(477,76);
				hit_door_0.graphics.lineTo(476,237);
				hit_door_0.graphics.lineTo(381,234);
							
				hit_door_0.graphics.endFill(false);
				
				hit_door_0.alpha = 0.0;
				
				hit_door_0.graphics.precisionHitTest = true;	
			}else{
				
				hit_door_0.x = 0;
				hit_door_0.y = 0;
				hit_door_0.graphics.beginFill(0xff0000);	
				
				hit_door_0.graphics.lineTo(298,74);
				hit_door_0.graphics.lineTo(373,86);
				hit_door_0.graphics.lineTo(373,234);
				hit_door_0.graphics.lineTo(298,232);
								
				hit_door_0.graphics.endFill(false);
				hit_door_0.alpha = 0.0;
				
				hit_door_0.graphics.precisionHitTest = true;				
			}
			
			this.addChild(hit_door_0);
			
		}	
		private function CreateDoor1Hit(open:Boolean = false):void{
			hit_door_1 = new Shape();
			hit_door_1.touchable = false;
			if(open === false){
				
				hit_door_1.x = 0;
				hit_door_1.y = 0;
				hit_door_1.graphics.beginFill(0xff0000);
				
				hit_door_1.graphics.lineTo(496,71);
				hit_door_1.graphics.lineTo(611,64);
				hit_door_1.graphics.lineTo(608,240);
				hit_door_1.graphics.lineTo(491,238);
			
				
				hit_door_1.graphics.endFill(false);
				
				hit_door_1.alpha = 0.0;
				
				hit_door_1.graphics.precisionHitTest = true;	
			}else{
				
				hit_door_1.x = 0;
				hit_door_1.y = 0;
				hit_door_1.graphics.beginFill(0xff0000);	
				
				hit_door_1.graphics.lineTo(426,63);
				hit_door_1.graphics.lineTo(490,76);
				hit_door_1.graphics.lineTo(487,233);
				hit_door_1.graphics.lineTo(428,237);
								
				hit_door_1.graphics.endFill(false);
				hit_door_1.alpha = 0.0;
				
				hit_door_1.graphics.precisionHitTest = true;				
			}
			
			this.addChild(hit_door_1);
			
		}	
		private function CreateDoor2Hit(open:Boolean = false):void{
			hit_door_2 = new Shape();
			hit_door_2.touchable = false;
			if(open === false){
				
				hit_door_2.x = 0;
				hit_door_2.y = 0;
				hit_door_2.graphics.beginFill(0xff0000);
				
				hit_door_2.graphics.lineTo(636,62);
				hit_door_2.graphics.lineTo(665,58);
				hit_door_2.graphics.lineTo(761,130);
				hit_door_2.graphics.lineTo(756,245);
				hit_door_2.graphics.lineTo(631,239);
			
				
				hit_door_2.graphics.endFill(false);
				
				hit_door_2.alpha = 0.0;
				
				hit_door_2.graphics.precisionHitTest = true;	
			}else{
				
				hit_door_2.x = 0;
				hit_door_2.y = 0;
				hit_door_2.graphics.beginFill(0xff0000);	
				
				hit_door_2.graphics.lineTo(588,51);
				hit_door_2.graphics.lineTo(626,69);
				hit_door_2.graphics.lineTo(621,237);
				hit_door_2.graphics.lineTo(581,240);				
				
				hit_door_2.graphics.endFill(false);
				hit_door_2.alpha = 0.0;
				
				hit_door_2.graphics.precisionHitTest = true;				
			}
			
			this.addChild(hit_door_2);
			
		}	
		private function CreateDoor3Hit(open:Boolean = false):void{
			hit_door_3 = new Shape();
			hit_door_3.touchable = false;
			if(open === false){
				
				hit_door_3.x = 0;
				hit_door_3.y = 0;
				hit_door_3.graphics.beginFill(0xff0000);
				
				hit_door_3.graphics.lineTo(379,235);
				hit_door_3.graphics.lineTo(478,237);
				hit_door_3.graphics.lineTo(475,396);
				hit_door_3.graphics.lineTo(381,384);
			
				hit_door_3.graphics.endFill(false);
				
				hit_door_3.alpha = 0.0;
				
				hit_door_3.graphics.precisionHitTest = true;	
			}else{
				
				hit_door_3.x = 0;
				hit_door_3.y = 0;
				hit_door_3.graphics.beginFill(0xff0000);	
				
				hit_door_3.graphics.lineTo(341,244);
				hit_door_3.graphics.lineTo(378,239);
				hit_door_3.graphics.lineTo(378,382);
				hit_door_3.graphics.lineTo(341,398);				
				
				hit_door_3.graphics.endFill(false);
				hit_door_3.alpha = 0.0;
				
				hit_door_3.graphics.precisionHitTest = true;				
			}
			
			this.addChild(hit_door_3);
			
		}	
		private function CreateDoor4Hit(open:Boolean = false):void{
			hit_door_4 = new Shape();
			hit_door_4.touchable = false;
			if(open === false){
				
				hit_door_4.x = 0;
				hit_door_4.y = 0;
				hit_door_4.graphics.beginFill(0xff0000);
				
				hit_door_4.graphics.lineTo(491,240);
				hit_door_4.graphics.lineTo(613,241);
				hit_door_4.graphics.lineTo(608,416);
				hit_door_4.graphics.lineTo(487,399);
			
				hit_door_4.graphics.endFill(false);
				
				hit_door_4.alpha = 0.0;
				
				hit_door_4.graphics.precisionHitTest = true;	
			}else{
				
				hit_door_4.x = 0;
				hit_door_4.y = 0;
				hit_door_4.graphics.beginFill(0xff0000);	
				
				hit_door_4.graphics.lineTo(442,247);
				hit_door_4.graphics.lineTo(490,241);
				hit_door_4.graphics.lineTo(493,392);
				hit_door_4.graphics.lineTo(441,418);				
				
				hit_door_4.graphics.endFill(false);
				hit_door_4.alpha = 0.0;
				
				hit_door_4.graphics.precisionHitTest = true;				
			}
			
			this.addChild(hit_door_4);
			
		}	
		private function CreateDoor5Hit(open:Boolean = false):void{
			hit_door_5 = new Shape();
			hit_door_5.touchable = false;
			if(open === false){
				
				hit_door_5.x = 0;
				hit_door_5.y = 0;
				hit_door_5.graphics.beginFill(0xff0000);
				
				hit_door_5.graphics.lineTo(621,244);
				hit_door_5.graphics.lineTo(766,246);
				hit_door_5.graphics.lineTo(758,387);
				hit_door_5.graphics.lineTo(621,416);
						
				hit_door_5.graphics.endFill(false);
				
				hit_door_5.alpha = 0.0;
				
				hit_door_5.graphics.precisionHitTest = true;	
			}else{
				
				hit_door_5.x = 0;
				hit_door_5.y = 0;
				hit_door_5.graphics.beginFill(0xff0000);	
				
				hit_door_5.graphics.lineTo(543,245);
				hit_door_5.graphics.lineTo(620,243);
				hit_door_5.graphics.lineTo(615,408);
				hit_door_5.graphics.lineTo(540,426);
			
				hit_door_5.graphics.endFill(false);
				hit_door_5.alpha = 0.0;
				
				hit_door_5.graphics.precisionHitTest = true;				
			}
			
			this.addChild(hit_door_5);
			
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
							FadeOut((DeepLab as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.DeepLabObj,true
							);
							return;
						}else if(hit_door_2.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							Door2Handler();
							return;
						}else if(hit_door_1.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							Door1Handler();
							return;
						}else if(hit_door_0.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							Door0Handler();
							return;
						}else if(hit_door_5.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							Door5Handler();
							return;
						}else if(hit_door_4.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							Door4Handler();
							return;
						}else if(hit_door_3.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							Door3Handler();
							return;
							
						}else if(hit_injector.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							InjectorHandler();
							return;
						//	return;
						}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BookHandler();
							return;
					//	}else if(hit_dna.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							
					//		return;
					//	}else if(hit_stone.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							
					//		return;
						
						}else if(hit_fridge_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							EmptyFridgeHandler();
							return;
						}else if(hit_fridge_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DNAHandler();
							return;
						}else if(hit_fridge_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							EmptyFridgeHandler();
							return;
						}else if(hit_fridge_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							EmptyFridgeHandler();
							return;
						}else if(hit_fridge_04.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							EmptyFridgeHandler();
							return;
						}else if(hit_fridge_05.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							StoneHandler();
							return;
						}else if(hit_shelf_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							Shelf01Handler();
							return;
						}else if(hit_shelf_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							Shelf01Handler
							return;
						}
						
						
						
						
						/*
						
						private var hit_shelf_01:Shape;
						private var hit_shelf_02:Shape;
						private var hit_shelf_03:Shape;
						*/
					}
				}
			}
		}
		
		
		private function Shelf01Handler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Brains... lizard... pickles.... some strange organic... thing... hmmm.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'm not sure what a few of the things in these jars are...");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The jars smell of formaldehyde and other preserving chemicals.");	
			}
		}
		
		private function EmptyFridgeHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The refrigerator compartment is empty.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The air inside the refrigerator is cool and icy.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The temperature is below zero.");	
			}
		}
		
		private function InjectorHandler():void{
			if(InjectorPickedUp === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Injector,
					'item_Injector',
					'inven_injector_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge;	
				}
				InjectorPickedUp = true;
				injector.alpha = 0;
				SaveArray['Injector'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabFridge',SaveArray);
				
				
			}
		}
		private function BookHandler():void{
			if(BookPickedUp === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_BookHeinlein,
					'item_BookHeinlein',
					'inven_bookHeinlein_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge;	
				}
				BookPickedUp = true;
				book.alpha = 0;
				SaveArray['Book'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabFridge',SaveArray);
				
				
			}
		}
		private function DNAHandler():void{
			if(DNAPickedUp === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_DNAJar,
					'item_DNAJar',
					'inven_dnaJar_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge;	
				}
				DNAPickedUp = true;
				dna.alpha = 0;
				SaveArray['DNA'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabFridge',SaveArray);
			}else{
				EmptyFridgeHandler();
			}
		}
		private function StoneHandler():void{
			if(StonePickedUp === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_BottleG,
					'item_BottleG',
					'inven_bottleG_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge;	
				}
				StonePickedUp = true;
				stone.alpha = 0;
				SaveArray['Stone'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabFridge',SaveArray);
			}else{
				EmptyFridgeHandler();
			}
		}
		private function Door5Handler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge;
			}			
			if(Door5Open === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeOpen();
				Door5Open = true;
				SaveArray['Door_5'] = "Open";
				door_5_close.alpha = 0;
				door_5_open.alpha = 1;
				hit_door_5.graphics.clear();				
				CreateDoor5Hit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeClose();
				Door5Open = false;
				SaveArray['Door_5'] = "Closed";
				door_5_close.alpha = 1;
				door_5_open.alpha = 0;
				hit_door_5.graphics.clear();
				CreateDoor5Hit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabFridge',SaveArray);
		}
		
		private function Door4Handler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge;
			}			
			if(Door4Open === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeOpen();
				Door4Open = true;
				SaveArray['Door_4'] = "Open";
				door_4_close.alpha = 0;
				door_4_open.alpha = 1;
				hit_door_4.graphics.clear();				
				CreateDoor4Hit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeClose();
				Door4Open = false;
				SaveArray['Door_4'] = "Closed";
				door_4_close.alpha = 1;
				door_4_open.alpha = 0;
				hit_door_4.graphics.clear();
				CreateDoor4Hit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabFridge',SaveArray);
		}
		private function Door3Handler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge;
			}			
			if(Door3Open === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeOpen();
				Door3Open = true;
				SaveArray['Door_3'] = "Open";
				door_3_close.alpha = 0;
				door_3_open.alpha = 1;
				hit_door_3.graphics.clear();				
				CreateDoor3Hit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeClose();
				Door3Open = false;
				SaveArray['Door_3'] = "Closed";
				door_3_close.alpha = 1;
				door_3_open.alpha = 0;
				hit_door_3.graphics.clear();
				CreateDoor3Hit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabFridge',SaveArray);
		}
		private function Door2Handler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge;
			}			
			if(Door2Open === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeOpen();
				Door2Open = true;
				SaveArray['Door_2'] = "Open";
				door_2_close.alpha = 0;
				door_2_open.alpha = 1;
				hit_door_2.graphics.clear();				
				CreateDoor2Hit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeClose();
				Door2Open = false;
				SaveArray['Door_2'] = "Closed";
				door_2_close.alpha = 1;
				door_2_open.alpha = 0;
				hit_door_2.graphics.clear();
				CreateDoor2Hit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabFridge',SaveArray);
		}
		
		private function Door1Handler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge;
			}			
			if(Door1Open === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeOpen();
				Door1Open = true;
				SaveArray['Door_1'] = "Open";
				door_1_close.alpha = 0;
				door_1_open.alpha = 1;
				hit_door_1.graphics.clear();				
				CreateDoor1Hit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeClose();
				Door1Open = false;
				SaveArray['Door_1'] = "Closed";
				door_1_close.alpha = 1;
				door_1_open.alpha = 0;
				hit_door_1.graphics.clear();
				CreateDoor1Hit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabFridge',SaveArray);
		}
		private function Door0Handler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge;
			}			
			if(Door0Open === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeOpen();
				Door0Open = true;
				SaveArray['Door_0'] = "Open";
				door_0_close.alpha = 0;
				door_0_open.alpha = 1;
				hit_door_0.graphics.clear();
				
				CreateDoor0Hit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeClose();
				Door0Open = false;
				SaveArray['Door_0'] = "Closed";
				door_0_close.alpha = 1;
				door_0_open.alpha = 0;
				hit_door_0.graphics.clear();
				CreateDoor0Hit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabFridge',SaveArray);
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
			
			
			
			this.assets.removeTexture("deepLabFridge_bg",true);
			this.assets.removeTexture("DeepLabFridge_Sprite_01",true);
			this.assets.removeTextureAtlas("DeepLabFridge_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("deepLabFridge_01");
			(stage.getChildAt(0) as Object).falseAsset("deepLabFridge_02");
			(stage.getChildAt(0) as Object).falseAsset("deepLabFridge_03");
			
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
