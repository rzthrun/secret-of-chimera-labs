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
	
	
	public class OfficeKitchenSink extends Sprite
	{
		
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
	//	private var coffee_pot:Image;
		private var tongs:Image;
		private var water_flow:Image;
		
		private var lid_on:Image;
		private var lid_off:Image;
		
		private var drawer_left:Image;
		private var drawer_right:Image;
		
		private var hit_sink:Shape;
		private var hit_tongs:Shape;
		private var hit_pot:Shape;
		private var hit_lid:Shape;
		
		private var hit_maker:Shape;
		private var hit_sponge:Shape;
		private var hit_toaster:Shape;
		private var hit_wall:Shape;
		private var hit_bed:Shape;
		
		private var WaterTween:Tween;
		
		private var Animating:Boolean = false;
		private var TongsPickedUp:Boolean = false;
		private var PotPickedUp:Boolean = false
		private var WaterPickedUp:Boolean = false;
		private var LidOpen:Boolean = false;
		
		
		private var hit_book:Shape;
		
		private var openBookbg:Shape;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookcurrentPage:Number = 0;
		
		private var hit_OpenBook:Shape;
		
		public var OpenBookTween:Tween;
		
		private var BookIsOpen:Boolean = false;
		
		
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function OfficeKitchenSink(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('officeKitchenSink_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeKitchenSink/officeKitchenSink_bg.jpg'));
				game.TrackAssets('officeKitchenSink_01');
			}
			if(game.CheckAsset('officeKitchenSink_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeKitchenSink/OfficeKitchenSink_Sprite_01.png'));
				game.TrackAssets('officeKitchenSink_02');
			}
			if(game.CheckAsset('officeKitchenSink_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeKitchenSink/OfficeKitchenSink_Sprite_01.xml'));
				game.TrackAssets('officeKitchenSink_03');
			}
			if(game.CheckAsset('officeKitchenSink_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeKitchenSink/BizCar_Sprite.png'));
				game.TrackAssets('officeKitchenSink_04');
			}
			if(game.CheckAsset('officeKitchenSink_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeKitchenSink/BizCar_Sprite.xml'));
				game.TrackAssets('officeKitchenSink_05');
			}
			//OfficeKitchenSink_Sprite_01
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("OfficeKitchenSink","OfficeKitchenSinkObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('officeKitchenSink_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			/*
			private var coffee_pot:Image;
			private var tongs:Image;
			private var water_flow:Image;
			*/
	//		coffee_pot = new Image(this.assets.getTexture('coffee_pot'));
	//		coffee_pot.touchable = false;
	//		coffee_pot.x = 453;
	//		coffee_pot.y = 201;
			
			tongs = new Image(this.assets.getTexture('tongs'));
			tongs.touchable = false;
			tongs.x = 49;
			tongs.y = 270;
			
			water_flow = new Image(this.assets.getTexture('water_flow'));
			water_flow.touchable = false;
			water_flow.x = 227;
			water_flow.y = 267;
			
			lid_off = new Image(this.assets.getTexture('coffeeLid_off'));
			lid_off.touchable = false;
			lid_off.x = 575;
			lid_off.y = 0;
			
			lid_on = new Image(this.assets.getTexture('coffeeLid_on'));
			lid_on.touchable = false;
			lid_on.x = 481;
			lid_on.y = 48;
			
			drawer_left = new Image(this.assets.getTexture('drawer_left'));
			drawer_left.touchable = false;
			drawer_left.x = 0;
			drawer_left.y = 413;
			
			drawer_right = new Image(this.assets.getTexture('drawer_right'));
			drawer_right.touchable = false;
			drawer_right.x = 197;
			drawer_right.y = 460;
		
			
		
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['LowerCabLeftOpen'] == 'Open'){	
					drawer_left.alpha = 0;
				}else{
					drawer_left.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['LowerCabRightOpen'] == 'Open'){	
					drawer_right.alpha = 0;
				}else{
					drawer_right.alpha = 1;
				}
			}else{
				drawer_left.alpha = 1;
				drawer_right.alpha = 1;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink['Tongs'] == 'PickedUp'){	
					TongsPickedUp = true;
					tongs.alpha = 0;
				}else{	
					tongs.alpha = 1;
				}
		//		if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink['CoffeePot'] == 'PickedUp'){	
		//			PotPickedUp = true;
		//			coffee_pot.alpha = 0;
		//		}else{
		//			coffee_pot.alpha = 1;
		//		}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink['Water'] == 'PickedUp'){	
					WaterPickedUp = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink['Lid'] == 'Open'){	
					LidOpen = true;
					lid_on.alpha = 0;
					lid_off.alpha = 1;
				}else{
					lid_on.alpha = 1;
					lid_off.alpha = 0;
				}
			}else{
				tongs.alpha = 1;
		//		coffee_pot.alpha = 1;
				lid_on.alpha = 1;
				lid_off.alpha = 0;
		
			}
			
			water_flow.alpha = 0;
			
	//		this.addChildAt(coffee_pot,1);
			this.addChildAt(tongs,1);
			this.addChildAt(water_flow,2);
			this.addChildAt(lid_on,3);
			this.addChildAt(lid_off,4);
			this.addChildAt(drawer_left,5);
			this.addChildAt(drawer_right,6);
			/*
			private var drawer_left:Image;
			private var drawer_right:Image;
			*/
			
			CreateMakerHit();
			CreateSpongeHit();
			CreateToasterHit();
			CreateWallHit();
			CreateBedHit();
			CreateBookHit();
			
			CreateLidHit(LidOpen);
			CreateTongsHit();
			CreateSinkHit();
			CreatePotHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink["Book"] == "open"){
					trace("Book is Open");
					BookIsOpen = true;
					//	OpenBook();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink["BookCurrentPage"] == 0){
						openBookcurrentPage = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink["BookCurrentPage"] == 1){
						openBookcurrentPage = 1;
					}else{
						openBookcurrentPage = 0;
					}
					OpenBook();
					this.addChild(goback);
				}
				
			}else{
				
			}
			
		}
		private function CreateLidHit(open:Boolean = false):void{
			hit_lid = new Shape();		
			hit_lid.x = 0;
			hit_lid.y = 0;
			hit_lid.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_lid.graphics.lineTo(471,72);
				hit_lid.graphics.lineTo(600,33);
				hit_lid.graphics.lineTo(681,71);
				hit_lid.graphics.lineTo(680,108);
				hit_lid.graphics.lineTo(611,148);
				hit_lid.graphics.lineTo(501,133);
					
			}else{
				
				hit_lid.graphics.lineTo(572,0);
				hit_lid.graphics.lineTo(678,0);
				hit_lid.graphics.lineTo(686,99);
				hit_lid.graphics.lineTo(577,59);
			
			}				
			hit_lid.graphics.endFill(false);			
			hit_lid.alpha = 0.0;			
			hit_lid.graphics.precisionHitTest = true;	
			hit_lid.touchable = false
			this.addChild(hit_lid);
			
			
		}

		
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(424,393);	
			hit_book.graphics.lineTo(561,377);	
			hit_book.graphics.lineTo(576,462);	
			hit_book.graphics.lineTo(417,475);	
			hit_book.graphics.lineTo(411,419);	
					
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
		/*
		private var hit_book:Shape;
		
		private var openBookbg:Shape;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookcurrentPage:Number = 0;
		
		private var hit_OpenBook:Shape;
		
		public var OpenBookTween:Tween;
		
		private var BookIsOpen:Boolean = false;
		*/
		private function CreateBedHit():void{
			hit_bed = new Shape();
			hit_bed.touchable = false;
			hit_bed.graphics.beginFill(0xff0000);
			
			hit_bed.graphics.lineTo(0,331);	
			hit_bed.graphics.lineTo(159,192);	
			hit_bed.graphics.lineTo(439,240);	
			hit_bed.graphics.lineTo(441,328);	
			hit_bed.graphics.lineTo(393,469);	
			hit_bed.graphics.lineTo(0,376);	
		
			hit_bed.graphics.endFill(false);
			hit_bed.alpha = 0.0;
			
			hit_bed.graphics.precisionHitTest = true;	
			this.addChild(hit_bed);
		}
		
		private function CreateWallHit():void{
			hit_wall = new Shape();
			hit_wall.touchable = false;
			hit_wall.graphics.beginFill(0xff0000);
			
			hit_wall.graphics.lineTo(70,0);	
			hit_wall.graphics.lineTo(480,0);	
			hit_wall.graphics.lineTo(438,192);	
			hit_wall.graphics.lineTo(95,144);	
		
			hit_wall.graphics.endFill(false);
			hit_wall.alpha = 0.0;
			
			hit_wall.graphics.precisionHitTest = true;	
			this.addChild(hit_wall);
		}
		
		private function CreateToasterHit():void{
			hit_toaster = new Shape();
			hit_toaster.touchable = false;
			hit_toaster.graphics.beginFill(0xff0000);
			
			hit_toaster.graphics.lineTo(618,392);	
			hit_toaster.graphics.lineTo(654,288);	
			hit_toaster.graphics.lineTo(794,248);	
			hit_toaster.graphics.lineTo(796,379);	
			hit_toaster.graphics.lineTo(648,413);	
					
			hit_toaster.graphics.endFill(false);
			hit_toaster.alpha = 0.0;
			
			hit_toaster.graphics.precisionHitTest = true;	
			this.addChild(hit_toaster);
		}
		
		private function CreateSpongeHit():void{
			hit_sponge = new Shape();
			hit_sponge.touchable = false;
			hit_sponge.graphics.beginFill(0xff0000);
			
			hit_sponge.graphics.lineTo(301,355);	
			hit_sponge.graphics.lineTo(384,336);	
			hit_sponge.graphics.lineTo(396,380);	
			hit_sponge.graphics.lineTo(385,394);	
			hit_sponge.graphics.lineTo(310,405);	
			
			hit_sponge.graphics.endFill(false);
			hit_sponge.alpha = 0.0;
			
			hit_sponge.graphics.precisionHitTest = true;	
			this.addChild(hit_sponge);
		}
		
		
		private function CreateMakerHit():void{
			hit_maker = new Shape();
			hit_maker.touchable = false;
			hit_maker.graphics.beginFill(0xff0000);
			
			hit_maker.graphics.lineTo(490,87);	
			hit_maker.graphics.lineTo(573,58);	
			hit_maker.graphics.lineTo(683,104);	
			hit_maker.graphics.lineTo(676,128);	
			hit_maker.graphics.lineTo(580,165);	
			hit_maker.graphics.lineTo(493,138);	
			
			hit_maker.graphics.endFill(false);
			hit_maker.alpha = 0.0;
			
			hit_maker.graphics.precisionHitTest = true;	
			this.addChild(hit_maker);
		}
		
		private function CreatePotHit():void{
			hit_pot = new Shape();
			hit_pot.touchable = false;
			hit_pot.graphics.beginFill(0xff0000);
			
			hit_pot.graphics.lineTo(443,268);	
			hit_pot.graphics.lineTo(498,184);	
			hit_pot.graphics.lineTo(601,205);	
			hit_pot.graphics.lineTo(611,305);	
			hit_pot.graphics.lineTo(580,360);	
			hit_pot.graphics.lineTo(481,356);	
			hit_pot.graphics.lineTo(439,309);	
			
			hit_pot.graphics.endFill(false);
			hit_pot.alpha = 0.0;
			
			hit_pot.graphics.precisionHitTest = true;	
			this.addChild(hit_pot);
		}
		private function CreateSinkHit():void{
			hit_sink = new Shape();
			hit_sink.touchable = false;
			hit_sink.graphics.beginFill(0xff0000);
			
			hit_sink.graphics.lineTo(228,204);	
			hit_sink.graphics.lineTo(363,206);	
			hit_sink.graphics.lineTo(366,239);	
			hit_sink.graphics.lineTo(279,276);	
			hit_sink.graphics.lineTo(238,269);	
		
			hit_sink.graphics.endFill(false);
			hit_sink.alpha = 0.0;
			
			hit_sink.graphics.precisionHitTest = true;	
			this.addChild(hit_sink);
		}
		
		private function CreateTongsHit():void{
			hit_tongs = new Shape();
			hit_tongs.touchable = false;
			hit_tongs.graphics.beginFill(0xff0000);
			
			hit_tongs.graphics.lineTo(31,241);	
			hit_tongs.graphics.lineTo(68,218);	
			hit_tongs.graphics.lineTo(296,355);	
			hit_tongs.graphics.lineTo(268,408);	
			hit_tongs.graphics.lineTo(195,389);	
			
			hit_tongs.graphics.endFill(false);
			hit_tongs.alpha = 0.0;
			
			hit_tongs.graphics.precisionHitTest = true;	
			this.addChild(hit_tongs);
		}
		private function CreateOpenBookHit():void{
			hit_OpenBook = new Shape();
			hit_OpenBook.touchable = false;
			hit_OpenBook.graphics.beginFill(0xff0000);
			
			hit_OpenBook.graphics.lineTo(92,52);	
			hit_OpenBook.graphics.lineTo(668,78);	
			hit_OpenBook.graphics.lineTo(685,414);	
			hit_OpenBook.graphics.lineTo(97,412);	

			hit_OpenBook.graphics.endFill(false);
			hit_OpenBook.alpha = 0.0;
			
			hit_OpenBook.graphics.precisionHitTest = true;	
			this.addChild(hit_OpenBook);
		}
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(BookIsOpen === false){
						
					
								if(targ == goback.SourceImage){
									
									
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
									FadeOut((OfficeKitchen as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeKitchenObj,true
									);
								}else if(hit_tongs.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									TongsHandler();
								}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
									BookIsOpen = true;
									OpenBook(true, 0);
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink;
									}		
									SaveArray['Book'] = "open";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchenSink',SaveArray);
									return;
								
								}else if(hit_sink.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									if((stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.armedItem
										== 
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.inventoryBarObj
										.item_Jar)
									{
										(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
											(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFull,
											'item_JarFull',
											'inven_jarFull_sm',
											(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Jar,
											'item_Jar'
										);
										WaterPickedUp = true;
										
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){	
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink;	
										}
										SaveArray['Water'] = "PickedUp";
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchenSink',SaveArray);
									
										WaterFlowHandler();
									}else if((stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.armedItem
										== 
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.inventoryBarObj
										.item_JarRock)
									{
										(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
											(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFullRock,
											'item_JarFullRock',
											'inven_jarFullRock_sm',
											(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarRock,
											'item_JarRock'
										);
										WaterPickedUp = true;
										
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){	
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink;	
										}
										SaveArray['Water'] = "PickedUp";
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchenSink',SaveArray);
										
										WaterFlowHandler();
									}else if((stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.armedItem
										== 
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.inventoryBarObj
										.item_JarRockIodine)
									{								
										(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
											(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFullRockIodine,
											'item_JarFullRockIodine',
											'inven_jarFullRockIodine_sm',
											(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarRockIodine,
											'item_JarRockIodine'
										);
										WaterPickedUp = true;
										
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){	
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink;	
										}
										SaveArray['Water'] = "PickedUp";
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchenSink',SaveArray);
										
										WaterFlowHandler();
									}else if((stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.armedItem
										== 
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.inventoryBarObj
										.item_JarIodine)
									{	
										(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
											(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFullIodine,
											'item_JarFullIodine',
											'inven_jarFullIodine_sm',
											(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarIodine,
											'item_JarIodine'
										);
										WaterPickedUp = true;
										
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){	
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink;	
										}
										SaveArray['Water'] = "PickedUp";
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchenSink',SaveArray);
										
										WaterFlowHandler();
									}else if((stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.armedItem
										== 
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.inventoryBarObj
										.item_CoffeePot)
									{
										
									}else{
										WaterFlowHandler();
									}
									
									
									
								}else if(hit_pot.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									PotHandler();
									
								}else if(hit_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									LidHandler();
								}else if(hit_sponge.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A sponge.");
								}else if(hit_toaster.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									ToasterHandler();							
								}else if(hit_wall.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is nothing very mysterious about the wall.");					
								}else if(hit_bed.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Beads of water sit on the steel of the sink.");					
								}else if(LidOpen === true){
									if(hit_maker.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
										MakerHandler();
									}
								}
								
								/*
								
								private var hit_maker:Shape;
								private var hit_sponge:Shape;
								private var hit_toaster:Shape;
								private var hit_wall:Shape;
								private var hit_bed:Shape;
								*/
								
						}else{	
								
								if(targ == goback.SourceImage){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
									trace("GoBackClick");
									RemoveBook();
									BookIsOpen = false;	
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink;
									}		
									SaveArray['Book'] = "closed";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchenSink',SaveArray);
								}else if(hit_OpenBook.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink;
									}
									if(openBookcurrentPage == 0){
										SaveArray['BookCurrentPage'] = 1;
										openBookcurrentPage = 1;
										openBookPages.texture = this.assets.getTexture('BizCard_page_01');
									}else if(openBookcurrentPage == 1){
										SaveArray['BookCurrentPage'] = 0;
										openBookcurrentPage = 0;
										openBookPages.texture = this.assets.getTexture('BizCard_page_00');
									}
									
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchenSink',SaveArray);
								}
								
								
							}
					}
				}
			}
		}
		
		
		
		
		private function OpenBook(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openBook = new Sprite();
			openBook.alpha = 0;
			CreateOpenBookBg();
			openBookPages = new Image(this.assets.getTexture('BizCard_page_00'));
			this.openBook.addChildAt(openBookbg,0);
			openBook.addChild(openBookPages);
			openBookPages.touchable = false;
			
			
			this.addChild(openBook);
			this.addChild(goback);
			
			if(openBookcurrentPage == 0){
				openBookPages.texture = this.assets.getTexture('BizCard_page_00');
			}else if(openBookcurrentPage == 1){
				openBookPages.texture = this.assets.getTexture('BizCard_page_01');
			}
			CreateOpenBookHit();
			//CreateOpenBookHit(openBookcurrentPage);
			
			if(Fade === false){
				Animating = false;
				openBook.alpha = 1;
				//	CreateOpenBookHit();
			}else{
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('loman');
				OpenBookTween = new Tween(openBook, 0.5, Transitions.LINEAR);
				OpenBookTween.fadeTo(1);
				OpenBookTween.onComplete = function():void{
					Animating = false;
					//	CreateOpenNotePadHit();
				};
				Starling.juggler.add(OpenBookTween);	
				
			}
			//	CreateOpenBookHit(page);
		}
		private function RemoveBook():void{
			Animating = true;
			Starling.juggler.purge();
			OpenBookTween = new Tween(openBook, 0.5, Transitions.LINEAR);
			OpenBookTween.fadeTo(0);
			OpenBookTween.onComplete = function():void{
				hit_OpenBook.graphics.clear();
				Animating = false;
				CloseBook();
				
			};
			Starling.juggler.add(OpenBookTween);		
		}
		
		public function CloseBook():void{
			this.removeChild(openBook);
			openBook.dispose();
		}
		
		private function CreateOpenBookBg():void{
			openBookbg = new Shape();
			openBookbg.graphics.beginFill(0x000000);
			openBookbg.graphics.lineTo(0,0);	
			openBookbg.graphics.lineTo(800,0);	
			openBookbg.graphics.lineTo(800,512);	
			openBookbg.graphics.lineTo(0,512);	
			openBookbg.touchable = false;
			openBookbg.graphics.endFill(false);
			openBookbg.alpha = 0.5;
			//	openBookbg.graphics.precisionHitTest = true;				
			
		}	
		
		
		
		
		
		
		
		
		
		
		
		private function MakerHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I should not be irrationally distressed by absence of coffee.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The drip coffee maker appears to be produced by a company called \"Pavlov's\"");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("...(Sigh)...");
			}
		}
		private function ToasterHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A toaster.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A toaster is a rather humble machine...");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... it's full of crumbs...");
			}
		}
		
		private function LidHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink;	
			}
			
			if(LidOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxOpen();
				LidOpen = true;
				lid_on.alpha = 0;
				lid_off.alpha = 1;
				SaveArray['Lid'] = 'Open';			
				hit_lid.graphics.clear();
				CreateLidHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxClose();
				LidOpen = false;
				lid_on.alpha = 1;
				lid_off.alpha = 0;
				SaveArray['Lid'] = 'Closed';			
				hit_lid.graphics.clear();
				CreateLidHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchenSink',SaveArray);
		}
		
		private function PotHandler():void{
		/*	if(PotPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink;	
				}
				PotPickedUp = true;
				coffee_pot.alpha = 0;
				SaveArray['CoffeePot'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchenSink',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CoffeePot,
					'item_CoffeePot',
					'inven_coffeePot_sm'
				);
			}
		*/
		}
		private function TongsHandler():void{
			if(TongsPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink;	
				}
				TongsPickedUp = true;
				tongs.alpha = 0;
				SaveArray['Tongs'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchenSink',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_TubeEmpty,
					'item_TubeEmpty',
					'inven_tubeEmpty_sm'
				);
			}
		}
		private function WaterFlowHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterFlow();
			Animating = true;
			WaterTween = new Tween(water_flow, 1.5, Transitions.EASE_OUT);
			WaterTween.fadeTo(1);
			WaterTween.onComplete = function():void{
				FadeOutWater();			
			}
			Starling.juggler.add(WaterTween);
		}
		public function FadeOutWater():void{
			WaterTween = new Tween(water_flow, 1.5, Transitions.EASE_IN);
			WaterTween.fadeTo(0);
			//	game.SoundFXObj.PlaySFX_CosmicWaffle();
			WaterTween.onComplete = function():void{
				Animating = false;
				
			}
			Starling.juggler.add(WaterTween);
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
			
			
			
			this.assets.removeTexture("officeKitchenSink_bg",true);
			this.assets.removeTexture("OfficeKitchenSink_Sprite_01",true);
			this.assets.removeTexture("BizCar_Sprite",true);
			this.assets.removeTextureAtlas("OfficeKitchenSink_Sprite_01",true);
			this.assets.removeTextureAtlas("BizCar_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("officeKitchenSink_01");
			(stage.getChildAt(0) as Object).falseAsset("officeKitchenSink_02");
			(stage.getChildAt(0) as Object).falseAsset("officeKitchenSink_03");
			(stage.getChildAt(0) as Object).falseAsset("officeKitchenSink_04");
			(stage.getChildAt(0) as Object).falseAsset("officeKitchenSink_05");
			
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
