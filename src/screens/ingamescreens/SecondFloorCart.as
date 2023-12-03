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
	
	public class SecondFloorCart extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		//	private var hit_elevator_door:Shape;
		
		private var paperTowels:Image;
		private var stick:Image;
		private var slime:Image;
		private var eyeglasses:Image;
		private var spraycan:Image;
		private var lobby_door:Image;
		
		private var hit_paperTowels:Shape;
		private var hit_stick:Shape;
		private var hit_eyeglasses:Shape;
		private var hit_spraycan:Shape;
		
		private var hit_cart:Shape;
		private var hit_bucket:Shape;
		private var hit_slime:Shape;
		private var hit_mop:Shape;
		private var hit_sign:Shape;
		
		private var RONum:int = 0;
		
		private var Animating:Boolean = false;
		private var SlimeGone:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function SecondFloorCart(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('secondFloorCart_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/SecondFloorCart/secondFloorCart_bg.jpg'));
				game.TrackAssets('secondFloorCart_01');
			}
			if(game.CheckAsset('secondFloorCart_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/SecondFloorCart/SecondFloorCart_Sprite_01.png'));
				game.TrackAssets('secondFloorCart_02');
			}
			if(game.CheckAsset('secondFloorCart_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/SecondFloorCart/SecondFloorCart_Sprite_01.xml'));
				game.TrackAssets('secondFloorCart_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("SecondFloorCart","SecondFloorCartObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('secondFloorCart_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			//	CreateElevatorDoorHit();
			
			//lobby_door
			lobby_door = new Image(this.assets.getTexture('lobby_office_door'));
			lobby_door.x = 121;
			lobby_door.y = 1;
			lobby_door.touchable = false;
			
			slime = new Image(this.assets.getTexture('slime'));
			slime.x = 206;
			slime.y = 236;
			slime.touchable = false;
			
			eyeglasses = new Image(this.assets.getTexture('glasses'));
			eyeglasses.x = 303;
			eyeglasses.y = 312;
			eyeglasses.touchable = false;
			
			paperTowels = new Image(this.assets.getTexture('paper_towels'));
			paperTowels.x = 179;
			paperTowels.y = 20;
			paperTowels.touchable = false;
			
			stick = new Image(this.assets.getTexture('mop_stick'));
			stick.x = 365;
			stick.y = 98;
			stick.touchable = false;
			
			
			spraycan = new Image(this.assets.getTexture('spray_can'));
			spraycan.x = 470;
			spraycan.y = 131;
			spraycan.touchable = false;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['SlimeCleaned'] == 'Yes'){
					SlimeGone = true;
					slime.alpha = 0;
					eyeglasses.texture = this.assets.getTexture('glasses_no_slime');
				}else{
					slime.alpha = 1;
				}
			}else{
				slime.alpha = 1;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart['paperTowels'] == 'PickedUp'){
					paperTowels.alpha = 0;
				}else{
					paperTowels.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart['stick'] == 'PickedUp'){
					stick.alpha = 0;
				}else{
					stick.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart['eyeglasses'] == 'PickedUp'){
					eyeglasses.alpha = 0;
				}else{
					eyeglasses.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart['spraycan'] == 'PickedUp'){
					spraycan.alpha = 0;
				}else{
					spraycan.alpha = 1;
				}
				
			}else{
				
				eyeglasses.alpha = 1;
				paperTowels.alpha = 1;
				stick.alpha = 1;
				spraycan.alpha = 1;
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby['OfficeDoor'] == 'open'){
					lobby_door.alpha = 0;
				}else{
					lobby_door.alpha = 1;
				}
			}else{
				lobby_door.alpha = 1;
			}
		
			this.addChildAt(lobby_door,1);
			this.addChildAt(slime,2);
			this.addChildAt(eyeglasses,3);
			this.addChildAt(paperTowels,4);
			this.addChildAt(stick,5);
			this.addChildAt(spraycan,6);
			
			CreateSlimeHit();
			CreateMopHit();
			CreateBucketHit();
			CreateCartHit();
			CreateSignHit();
			
			
			CreateStickHit();
			CreatePaperTowelsHit();
			CreateEyeglassesHit();
			CreateSprayCanHit();
			
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadBuildingHum(true,999);
			
		}
	
		private function CreateSignHit():void{
			hit_sign = new Shape();
			hit_sign.touchable = false;
			hit_sign.graphics.beginFill(0xff0000);
			
			hit_sign.graphics.lineTo(626,200);	
			hit_sign.graphics.lineTo(680,82);	
			hit_sign.graphics.lineTo(767,112);	
			hit_sign.graphics.lineTo(755,227);	
			hit_sign.graphics.lineTo(710,263);	
			
			hit_sign.graphics.endFill(false);
			hit_sign.alpha = 0.0;
			
			hit_sign.graphics.precisionHitTest = true;	
			this.addChild(hit_sign);
		}
		
		
		private function CreateCartHit():void{
			hit_cart = new Shape();
			hit_cart.touchable = false;
			hit_cart.graphics.beginFill(0xff0000);
			
			hit_cart.graphics.lineTo(102,65);	
			hit_cart.graphics.lineTo(272,10);	
			hit_cart.graphics.lineTo(348,49);	
			hit_cart.graphics.lineTo(345,194);	
			hit_cart.graphics.lineTo(294,263);	
			hit_cart.graphics.lineTo(167,325);	
			hit_cart.graphics.lineTo(144,152);	
		
			hit_cart.graphics.endFill(false);
			hit_cart.alpha = 0.0;
			
			hit_cart.graphics.precisionHitTest = true;	
			this.addChild(hit_cart);
		}
		
		
		private function CreateBucketHit():void{
			hit_bucket = new Shape();
			hit_bucket.touchable = false;
			hit_bucket.graphics.beginFill(0xff0000);
			
			hit_bucket.graphics.lineTo(69,141);	
			hit_bucket.graphics.lineTo(103,165);	
			hit_bucket.graphics.lineTo(114,188);	
			hit_bucket.graphics.lineTo(165,236);	
			hit_bucket.graphics.lineTo(168,299);	
			hit_bucket.graphics.lineTo(101,339);	
			hit_bucket.graphics.lineTo(44,291);	
			
			hit_bucket.graphics.endFill(false);
			hit_bucket.alpha = 0.0;
			
			hit_bucket.graphics.precisionHitTest = true;	
			this.addChild(hit_bucket);
		}
		
		
		private function CreateMopHit():void{
			hit_mop = new Shape();
			hit_mop.touchable = false;
			hit_mop.graphics.beginFill(0xff0000);
			
			hit_mop.graphics.lineTo(518,243);	
			hit_mop.graphics.lineTo(588,262);	
			hit_mop.graphics.lineTo(646,332);	
			hit_mop.graphics.lineTo(594,356);	
			hit_mop.graphics.lineTo(515,292);	
			
			hit_mop.graphics.endFill(false);
			hit_mop.alpha = 0.0;
			
			hit_mop.graphics.precisionHitTest = true;	
			this.addChild(hit_mop);
		}
		
		private function CreateSlimeHit():void{
			hit_slime = new Shape();
			hit_slime.touchable = false;
			hit_slime.graphics.beginFill(0xff0000);
			
			hit_slime.graphics.lineTo(215,321);	
			hit_slime.graphics.lineTo(350,252);	
			hit_slime.graphics.lineTo(485,276);	
			hit_slime.graphics.lineTo(649,398);	
			hit_slime.graphics.lineTo(512,479);	
			hit_slime.graphics.lineTo(301,431);	
		
			hit_slime.graphics.endFill(false);
			hit_slime.alpha = 0.0;
			
			hit_slime.graphics.precisionHitTest = true;	
			this.addChild(hit_slime);
		}
		
		private function CreateSprayCanHit():void{
			hit_spraycan = new Shape();
			hit_spraycan.touchable = false;
			hit_spraycan.graphics.beginFill(0xff0000);
			
			hit_spraycan.graphics.lineTo(447,150);	
			hit_spraycan.graphics.lineTo(485,102);	
			hit_spraycan.graphics.lineTo(603,138);	
			hit_spraycan.graphics.lineTo(568,199);	
			
			hit_spraycan.graphics.endFill(false);
			hit_spraycan.alpha = 0.0;
			
			hit_spraycan.graphics.precisionHitTest = true;	
			this.addChild(hit_spraycan);
		}
		
		private function CreateEyeglassesHit():void{
			hit_eyeglasses = new Shape();
			hit_eyeglasses.touchable = false;
			hit_eyeglasses.graphics.beginFill(0xff0000);
			
			hit_eyeglasses.graphics.lineTo(292,345);	
			hit_eyeglasses.graphics.lineTo(338,307);	
			hit_eyeglasses.graphics.lineTo(445,355);	
			hit_eyeglasses.graphics.lineTo(403,419);	
			hit_eyeglasses.graphics.lineTo(300,377);	
			
			hit_eyeglasses.graphics.endFill(false);
			hit_eyeglasses.alpha = 0.0;
			
			hit_eyeglasses.graphics.precisionHitTest = true;	
			this.addChild(hit_eyeglasses);
		}
		
		
		private function CreateStickHit():void{
			hit_stick = new Shape();
			hit_stick.touchable = false;
			hit_stick.graphics.beginFill(0xff0000);
			
			hit_stick.graphics.lineTo(354,101);	
			hit_stick.graphics.lineTo(395,93);	
			hit_stick.graphics.lineTo(470,245);	
			hit_stick.graphics.lineTo(422,263);	
		
			hit_stick.graphics.endFill(false);
			hit_stick.alpha = 0.0;
			
			hit_stick.graphics.precisionHitTest = true;	
			this.addChild(hit_stick);
		}
		
		private function CreatePaperTowelsHit():void{
			hit_paperTowels = new Shape();
			hit_paperTowels.touchable = false;
			hit_paperTowels.graphics.beginFill(0xff0000);
		
			hit_paperTowels.graphics.lineTo(153,21);	
			hit_paperTowels.graphics.lineTo(185,0);	
			hit_paperTowels.graphics.lineTo(225,0);	
			hit_paperTowels.graphics.lineTo(249,88);	
			hit_paperTowels.graphics.lineTo(198,112);	
			hit_paperTowels.graphics.lineTo(165,85);	
		
			hit_paperTowels.graphics.endFill(false);
			hit_paperTowels.alpha = 0.0;
		
			hit_paperTowels.graphics.precisionHitTest = true;	
			this.addChild(hit_paperTowels);
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
							FadeOut((SecondFloorHall as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.SecondFloorHallObj,true
							);
							//		}else if(hit_elevator_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							//			FadeOut((Elevator as Class), 
							//				(stage.getChildAt(0) as Object).screenGamePlayHandler.ElevatorObj,true
							//			);
						}else if(hit_paperTowels.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PaperTowelsHandler();
						}else if(hit_stick.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							StickHandler();
						}else if(hit_eyeglasses.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							EyeGlassesHandler();
						}else if(hit_spraycan.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SprayCanHandler();
						}else if(hit_bucket.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A bucket (and squeegee) filled with murky soap water.");
						}else if(hit_cart.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A janitorial cart.");
						}else if(hit_slime.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SlimeHandler();
						}else if(hit_mop.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							MopHandler();
						}else if(hit_sign.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SignHandler();
						}
						/*
						private var hit_cart:Shape;
						private var hit_bucket:Shape;
						private var hit_slime:Shape;
						private var hit_mop:Shape;
						private var hit_sign:Shape;
						
						*/
					}
				}
			}
		}
		private function SignHandler():void{
			if(SlimeGone === false){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'\Caution,'\ - wise words my inanimate friend.");				
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Is it usual around here to simply mop up weird iridescent slime?");				
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'\Wet Floor,'\ - Yes, this is true.");
				}	
			
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Although it appears the green slimy goo has gone elsewhere, I should still probably heed the placard's warning.");
			}
		}
		
		private function MopHandler():void{
			if(SlimeGone === false){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The broken-off head of a mop, resting in the pool of green... goo.");				
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The slime has saturated the mop head.");				
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("What is going on here?");
					
				}
			}else{
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The broken-off head of a mop.");				
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The slime that permeated the mop before is entirely gone.");				
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("What happened here?");
					
				}
			}
			
		}
		
		private function SlimeHandler():void{
			if(SlimeGone === false){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A viscous iridescent green slime covers the floor.");				
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Ewee... I can't tell if it's organic or synthetic...");				
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'd better careful. I don't know what this green slime is...");
					
				}
			}else{
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The green slime has disappeared.");				
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There was slime here earlier; I remember it... But that means...");				
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("No trace of the slime, just the hard slate floor.");
					
				}
			}
			
		}
		
		private function SprayCanHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart['spraycan'] == 'PickedUp'){
					
				}else{
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterPour();
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_StoneDrag();
					spraycan.alpha = 0;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart;
					}
					SaveArray['spraycan'] = "PickedUp";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorCart',SaveArray);
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_SprayCan,
						'item_SprayCan',
						'inven_sprayCan_sm'
					);	
				}
			}else{
			//	(stage.getChildAt(0) as Object).SoundFXObj.SFX_WaterPour();
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_StoneDrag();
				spraycan.alpha = 0;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart;
				}
				SaveArray['spraycan'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorCart',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_SprayCan,
					'item_SprayCan',
					'inven_sprayCan_sm'
				);	
			}
		}
		
		
		private function EyeGlassesHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart['eyeglasses'] == 'PickedUp'){
					SlimeHandler();
				}else{
					if(SlimeGone === false){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I shouldn't risk exposing myself directly to whatever that green slime is...");		
					}else{
						eyeglasses.alpha = 0;
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart;
						}
						SaveArray['eyeglasses'] = "PickedUp";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorCart',SaveArray);
						
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Eyeglasses,
							'item_Eyeglasses',
							'inven_eyeglasses_sm'
						);	
						
					}
					
					
				}
			}else{				
				if(SlimeGone === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I shouldn't risk exposing myself directly to whatever that green slime is...");	
				}else{
					
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_StoneDrag();
					eyeglasses.alpha = 0;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart;
					}
					SaveArray['eyeglasses'] = "PickedUp";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorCart',SaveArray);
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Eyeglasses,
						'item_Eyeglasses',
						'inven_eyeglasses_sm'
					);	
					
				}
				
			}
		}
		
		
		private function StickHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart['stick'] == 'PickedUp'){
					
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_StoneDrag();
					stick.alpha = 0;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart;
					}
					SaveArray['stick'] = "PickedUp";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorCart',SaveArray);
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Stick,
						'item_Stick',
						'inven_stick_sm'
					);	
				}
			}else{
			
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_StoneDrag();
				stick.alpha = 0;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart;
				}
				SaveArray['stick'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorCart',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Stick,
					'item_Stick',
					'inven_stick_sm'
				);	
			}
		}
		
		private function PaperTowelsHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart['paperTowels'] == 'PickedUp'){
					
				}else{
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_StoneDrag();
					paperTowels.alpha = 0;
				
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart;
					}
					SaveArray['paperTowels'] = "PickedUp";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorCart',SaveArray);
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PaperTowels,
						'item_PaperTowels',
						'inven_paperTowels_sm'
					);	
				}
			}else{
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				paperTowels.alpha = 0;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart;
				}
				SaveArray['paperTowels'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorCart',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PaperTowels,
					'item_PaperTowels',
					'inven_paperTowels_sm'
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
			
			
			
			this.assets.removeTexture("secondFloorCart_bg",true);
			this.assets.removeTexture("SecondFloorCart_Sprite_01",true);	
			this.assets.removeTextureAtlas("SecondFloorCart_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("secondFloorCart_01");
			(stage.getChildAt(0) as Object).falseAsset("secondFloorCart_02");
			(stage.getChildAt(0) as Object).falseAsset("secondFloorCart_03");
			
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
