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
	
	
	public class GreenHouseDeepShelf extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var vial:Image;
		private var fridge_on:Image;
		private var fridge_off:Image;
		private var stone:Image;
		private var book:Image;
		private var left_on:Image;
		private var left_off:Image;
		private var right_on:Image;
		private var right_off:Image;
		
		private var water_flow:Image;
		
		private var hit_fridge:Shape;
		private var hit_left:Shape;
		private var hit_right:Shape;
		private var hit_stone:Shape;
		private var hit_book:Shape;
		private var hit_vial:Shape;
		private var hit_water:Shape;
		
		private var hit_vines:Shape;
		private var hit_root:Shape;
		
		private var LeftOpen:Boolean = false;
		private var RightOpen:Boolean = false;
		private var BookPickedUp:Boolean = false;
		private var StonePickedUp:Boolean = false;
		private var VialPickedUp:Boolean = false;
		private var FridgeOpen:Boolean = false;
		private var WaterPickedUp:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var RONum:Boolean = false;
		
		private var WaterTween:Tween;
	
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		
		public function GreenHouseDeepShelf(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('greenHouseDeepShelf_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseDeepShelf/greenHouseDeepShelf_bg.jpg'));
				game.TrackAssets('greenHouseDeepShelf_01');
			}
			if(game.CheckAsset('greenHouseDeepShelf_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseDeepShelf/GreenHouseDeepShelf_Sprite_01.png'));
				game.TrackAssets('greenHouseDeepShelf_02');
			}
			if(game.CheckAsset('greenHouseDeepShelf_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseDeepShelf/GreenHouseDeepShelf_Sprite_01.xml'));
				game.TrackAssets('greenHouseDeepShelf_03');
			}
			///GreenHouseDeepShelf_Sprite_01
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GreenHouseDeepShelf","GreenHouseDeepShelfObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('greenHouseDeepShelf_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			vial = new Image(this.assets.getTexture('vial'));
			vial.touchable = false;
			vial.x = 624;
			vial.y = 235;
			
			
			fridge_off = new Image(this.assets.getTexture('fridge_open'));
			fridge_off.touchable = false;
			fridge_off.x = 702;
			fridge_off.y = 153;
			
			fridge_on = new Image(this.assets.getTexture('fridge_closed'));
			fridge_on.touchable = false;
			fridge_on.x = 600;
			fridge_on.y = 157;
		
			
			stone = new Image(this.assets.getTexture('stone'));
			stone.touchable = false;
			stone.x = 356;
			stone.y = 224;
						
			book = new Image(this.assets.getTexture('book'));
			book.touchable = false;
			book.x = 383;
			book.y = 13;
			
			right_on = new Image(this.assets.getTexture('right_closed'));
			right_on.touchable = false;
			right_on.x = 378;
			right_on.y = 0;
			
			right_off = new Image(this.assets.getTexture('right_open'));
			right_off.touchable = false;
			right_off.x = 463;
			right_off.y = 0;
			
			left_on = new Image(this.assets.getTexture('left_closed'));
			left_on.touchable = false;
			left_on.x = 249;
			left_on.y = 0;
			
			left_off = new Image(this.assets.getTexture('left_open'));
			left_off.touchable = false;
			left_off.x = 165;
			left_off.y = 0;
			
			water_flow = new Image(this.assets.getTexture('waterflow'));
			water_flow.touchable = false;
			water_flow.x = 205;
			water_flow.y = 352;
			/*
			private var vial:Image;
			private var fridge_on:Image;
			private var fridge_off:Image;
			private var stone:Image;
			private var book:Image;
			private var left_on:Image;
			private var left_off:Image;
			private var right_on:Image;
			private var right_off:Image;
			
			*/
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Water'] == 'PickedUp'){
					WaterPickedUp = true;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Vial'] == 'PickedUp'){
					VialPickedUp = true;
					vial.alpha = 0;
				}else{
					vial.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Book'] == 'PickedUp'){
					BookPickedUp = true;
					book.alpha = 0;
				}else{
					book.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Stone'] == 'PickedUp'){
					StonePickedUp = true;
					stone.alpha = 0;
				}else{
					stone.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Left'] == 'Open'){
					LeftOpen = true;
					left_on.alpha = 0;
					left_off.alpha = 1;
				}else{
					left_on.alpha = 1;
					left_off.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Right'] == 'Open'){
					RightOpen = true;
					right_on.alpha = 0;
					right_off.alpha = 1;
				}else{
					right_on.alpha = 1;
					right_off.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Fridge'] == 'Open'){
					FridgeOpen = true;
					fridge_off.alpha = 1;
					fridge_on.alpha = 0;
				}else{
					fridge_off.alpha = 0;
					fridge_on.alpha = 1;
				}
			}else{
				vial.alpha = 1;
				book.alpha = 1;
				stone.alpha = 1;
				
				left_on.alpha = 1;
				left_off.alpha = 0;
				right_on.alpha = 1;
				right_off.alpha = 0;
				fridge_off.alpha = 0;
				fridge_on.alpha = 1;
			}
			
			water_flow.alpha=  0;
		
			
		
			
			
			
			
			this.addChildAt(vial,1);
			this.addChildAt(fridge_off,2);
			this.addChildAt(fridge_on,3);
			this.addChildAt(stone,4);
			this.addChildAt(right_off,5);
			this.addChildAt(book,6);
			this.addChildAt(right_on,7);			
			this.addChildAt(left_on,8);
			this.addChildAt(left_off,9);
			this.addChildAt(water_flow,10);
			CreateRootHit();
			CreateVineHit();
			CreateVialHit();
			CreateBookHit();
			CreateStoneHit();
			CreateFridgeHit(FridgeOpen);
			CreateRightHit(RightOpen);
			CreateLeftHit(LeftOpen);
			CreateWaterHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			//(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
			Starling.juggler.delayCall(function():void{
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadSlipperyPlants(true,999);
				
			},0.5);
		}
		
		private function CreateVineHit():void{
			hit_vines = new Shape();
			hit_vines.touchable = false;
			hit_vines.graphics.beginFill(0xff0000);
			
			hit_vines.graphics.lineTo(17,162);				
			hit_vines.graphics.lineTo(587,176);				
			hit_vines.graphics.lineTo(605,394);				
			hit_vines.graphics.lineTo(380,426);				
			hit_vines.graphics.lineTo(321,378);				
			hit_vines.graphics.lineTo(0,400);				
		
			hit_vines.graphics.endFill(false);
			hit_vines.alpha = 0.0;
			
			hit_vines.graphics.precisionHitTest = true;	
			this.addChild(hit_vines);
		}
		
		private function CreateRootHit():void{
			hit_root = new Shape();
			hit_root.touchable = false;
			hit_root.graphics.beginFill(0xff0000);
			
			hit_root.graphics.lineTo(182,412);				
			hit_root.graphics.lineTo(265,366);				
			hit_root.graphics.lineTo(334,369);				
			hit_root.graphics.lineTo(373,400);				
			hit_root.graphics.lineTo(437,506);				
			hit_root.graphics.lineTo(329,507);				
			hit_root.graphics.lineTo(290,433);				
			hit_root.graphics.lineTo(197,440);				
			
			hit_root.graphics.endFill(false);
			hit_root.alpha = 0.0;
			
			hit_root.graphics.precisionHitTest = true;	
			this.addChild(hit_root);
		}
		
		private function CreateWaterHit():void{
			hit_water = new Shape();
			hit_water.touchable = false;
			hit_water.graphics.beginFill(0xff0000);
			
			hit_water.graphics.lineTo(154,391);	
			hit_water.graphics.lineTo(183,270);	
			hit_water.graphics.lineTo(225,277);	
			hit_water.graphics.lineTo(223,399);	
			hit_water.graphics.lineTo(198,415);	
			
			hit_water.graphics.endFill(false);
			hit_water.alpha = 0.0;
			
			hit_water.graphics.precisionHitTest = true;	
			this.addChild(hit_water);
		}
		
		
		private function CreateVialHit():void{
			hit_vial = new Shape();
			hit_vial.touchable = false;
			hit_vial.graphics.beginFill(0xff0000);
			
			hit_vial.graphics.lineTo(610,169);	
			hit_vial.graphics.lineTo(700,174);	
			hit_vial.graphics.lineTo(695,368);		
			hit_vial.graphics.lineTo(610,367);		
			
			hit_vial.graphics.endFill(false);
			hit_vial.alpha = 0.0;
			
			hit_vial.graphics.precisionHitTest = true;	
			this.addChild(hit_vial);
		}
		
		
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(373,123);	
			hit_book.graphics.lineTo(395,30);	
			hit_book.graphics.lineTo(455,4);	
			hit_book.graphics.lineTo(476,21);	
			hit_book.graphics.lineTo(440,135);	
			
			
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
		private function CreateStoneHit():void{
			hit_stone = new Shape();
			hit_stone.touchable = false;
			hit_stone.graphics.beginFill(0xff0000);
			
			hit_stone.graphics.lineTo(344,300);	
			hit_stone.graphics.lineTo(378,210);	
			hit_stone.graphics.lineTo(418,214);	
			hit_stone.graphics.lineTo(478,304);	
			hit_stone.graphics.lineTo(493,362);	
			hit_stone.graphics.lineTo(396,400);	
		
			
			hit_stone.graphics.endFill(false);
			hit_stone.alpha = 0.0;
			
			hit_stone.graphics.precisionHitTest = true;	
			this.addChild(hit_stone);
		}
		
		private function CreateRightHit(open:Boolean = false):void{
			hit_right = new Shape();		
			hit_right.x = 0;
			hit_right.y = 0;
			hit_right.graphics.beginFill(0x0000FF);
			if(open === false){					
				hit_right.graphics.lineTo(382,0);								
				hit_right.graphics.lineTo(486,0);								
				hit_right.graphics.lineTo(483,139);								
				hit_right.graphics.lineTo(380,128);								
				
			}else{				
				hit_right.graphics.lineTo(481,0);
				hit_right.graphics.lineTo(588,0);
				hit_right.graphics.lineTo(590,120);
				hit_right.graphics.lineTo(480,133);
				
			}				
			hit_right.graphics.endFill(false);			
			hit_right.alpha = 0.0;			
			hit_right.graphics.precisionHitTest = true;	
			hit_right.touchable = false
			this.addChild(hit_right);
			
			
		}
		
		private function CreateLeftHit(open:Boolean = false):void{
			hit_left = new Shape();		
			hit_left.x = 0;
			hit_left.y = 0;
			hit_left.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_left.graphics.lineTo(251,0);					
				hit_left.graphics.lineTo(378,0);					
				hit_left.graphics.lineTo(378,128);					
				hit_left.graphics.lineTo(253,115);					
					
				
			}else{
				
				hit_left.graphics.lineTo(196,0);
				hit_left.graphics.lineTo(261,0);
				hit_left.graphics.lineTo(263,115);
				hit_left.graphics.lineTo(192,83);
				
			}				
			hit_left.graphics.endFill(false);			
			hit_left.alpha = 0.0;			
			hit_left.graphics.precisionHitTest = true;	
			hit_left.touchable = false
			this.addChild(hit_left);
			
			
		}
		
		private function CreateFridgeHit(open:Boolean = false):void{
			hit_fridge = new Shape();		
			hit_fridge.x = 0;
			hit_fridge.y = 0;
			hit_fridge.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_fridge.graphics.lineTo(594,144);					
				hit_fridge.graphics.lineTo(718,160);					
				hit_fridge.graphics.lineTo(718,373);					
				hit_fridge.graphics.lineTo(601,385);					
			
			}else{
				
				hit_fridge.graphics.lineTo(706,161);
				hit_fridge.graphics.lineTo(793,151);
				hit_fridge.graphics.lineTo(797,387);
				hit_fridge.graphics.lineTo(706,369);
				
			}				
			hit_fridge.graphics.endFill(false);			
			hit_fridge.alpha = 0.0;			
			hit_fridge.graphics.precisionHitTest = true;	
			hit_fridge.touchable = false
			this.addChild(hit_fridge);
			
			
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
							FadeOut((GreenHouseDeep as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseDeepObj,true
							);
							return;
						}else if(hit_fridge.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FridgeHandler();
							return;
						}else if(hit_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LeftHandler();
							return;
						}else if(hit_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							RightHandler();
							return;
						}else if(hit_stone.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							StoneHandler();
							return;
						}else if(hit_water.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
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
								
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf;	
								}
								SaveArray['Water'] = "PickedUp";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepShelf',SaveArray);
								
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
								
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf;	
								}
								SaveArray['Water'] = "PickedUp";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepShelf',SaveArray);
								
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
								
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf;	
								}
								SaveArray['Water'] = "PickedUp";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepShelf',SaveArray);
								
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
								
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf;	
								}
								SaveArray['Water'] = "PickedUp";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepShelf',SaveArray);
								
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
								
						
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I don't need any water at this time.");
							
							}else{
								WaterFlowHandler();
							}
						
						}else if(hit_root.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A large root draws water from the sink...");
							return;
						}else if(hit_vines.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							VinesHandler();
							return;
						}
						
						/*		
						
						private var hit_vines:Shape;
						private var hit_root:Shape;
						*/
						
						if(RightOpen === true){
							if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								BookHandler();
								return;
							}
						}
						
						if(FridgeOpen === true){
							if(hit_vial.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								VialHandler();
								return;
							}
						}
					}
				}
			}
			
		}
		
		private function VinesHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The organism is covering nearly all of the room's surface...");				
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The mutant plant skin is sticky to the touch...");
				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("All the growths appear very fresh.");
				
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
		
		private function VialHandler():void{
			if(VialPickedUp === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_BottleC,
					'item_BottleC',
					'inven_bottleC_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf;	
				}
				VialPickedUp = true;
				vial.alpha = 0;
				SaveArray['Vial'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepShelf',SaveArray);
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The small cooler is empty.");				
			}
			
		}
		private function BookHandler():void{
			if(BookPickedUp === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_BookAsimov,
					'item_BookAsimov',
					'inven_bookAsimov_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf;	
				}
				BookPickedUp = true;
				book.alpha = 0;
				SaveArray['Book'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepShelf',SaveArray);
			}
		}				
		private function StoneHandler():void{
			if(StonePickedUp === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_StoneThree,
					'item_StoneThree',
					'inven_stoneThree_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf;	
				}
				StonePickedUp = true;
				stone.alpha = 0;
				SaveArray['Stone'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepShelf',SaveArray);
			}
		}
		
		private function RightHandler():void{
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf;	
			}
			
			if(RightOpen === false){
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpenTwo();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				RightOpen = true;
				right_on.alpha = 0;
				right_off.alpha = 1;
				hit_right._graphics.clear();
				CreateRightHit(true);
				SaveArray['Right'] = "Open";
			}else{
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyCloseTwo();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
				RightOpen = false;
				right_on.alpha = 1;
				right_off.alpha = 0;
				hit_right._graphics.clear();
				CreateRightHit(false);
				SaveArray['Right'] = "Closed";
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepShelf',SaveArray);
		}
		
		
		private function LeftHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf;	
			}
			
			if(LeftOpen === false){
			//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpenTwo();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				LeftOpen = true;
				left_on.alpha = 0;
				left_off.alpha = 1;
				hit_left._graphics.clear();
				CreateLeftHit(true);
				SaveArray['Left'] = "Open";
			}else{
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyCloseTwo();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
				LeftOpen = false;
				left_on.alpha = 1;
				left_off.alpha = 0;
				hit_left._graphics.clear();
				CreateLeftHit(false);
				SaveArray['Left'] = "Closed";
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepShelf',SaveArray);
		}
		
		private function FridgeHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf;	
			}
			
			if(FridgeOpen === false){
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeOpen();
				FridgeOpen = true;
				fridge_on.alpha = 0;
				fridge_off.alpha = 1;
				hit_fridge._graphics.clear();
				CreateFridgeHit(true);
				SaveArray['Fridge'] = "Open";
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeClose();
				FridgeOpen = false;
				fridge_on.alpha = 1;
				fridge_off.alpha = 0;
				hit_fridge._graphics.clear();
				CreateFridgeHit(false);
				SaveArray['Fridge'] = "Closed";
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepShelf',SaveArray);
			
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
			
			
			
			this.assets.removeTexture("greenHouseDeepShelf_bg",true);
			this.assets.removeTexture("GreenHouseDeepShelf_Sprite_01",true);
			this.assets.removeTextureAtlas("GreenHouseDeepShelf_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("greenHouseDeepShelf_01");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseDeepShelf_02");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseDeepShelf_03");
			
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
