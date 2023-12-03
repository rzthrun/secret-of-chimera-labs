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
	
	public class ExteriorRearDumpster extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		
		private var bio_lid_off:Image;
		private var bio_lid_on:Image;
		private var book:Image;
		private var left_lid_off:Image;
		private var left_lid_on:Image;
		private var right_lid_off:Image;
		private var right_lid_on:Image;
		
		private var hit_bio_lid:Shape;
		private var hit_lid_left:Shape
		private var hit_lid_right:Shape;

		private var hit_book:Shape;
		private var hit_acid:Shape;
		
		private var hit_dumpsterGarbage:Shape;
		private var hit_dumpster:Shape;
		private var hit_sign:Shape;
		private var hit_barrel:Shape;
		private var hit_depris:Shape;
		
		private var RONum:int = 0;
		
		private var BioLidOpen:Boolean = false;
		private var LidLeftOpen:Boolean = false;
		private var LidRightOpen:Boolean = false;
		private var BookPickedUp:Boolean = false;
		private var AcidPickedUp:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var GrateKeyCardPickedUp:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function ExteriorRearDumpster(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('exteriorRearDumpster_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorRearDumpster/exteriorRearDumpster_bg.jpg'));
				game.TrackAssets('exteriorRearDumpster_01');
			}
			if(game.CheckAsset('exteriorRearDumpster_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorRearDumpster/ExteriorRearDumpster_Sprite_01.png'));
				game.TrackAssets('exteriorRearDumpster_02');
			}
			if(game.CheckAsset('exteriorRearDumpster_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorRearDumpster/ExteriorRearDumpster_Sprite_01.xml'));
				game.TrackAssets('exteriorRearDumpster_03');
			}
			//ExteriorRearDumpster_Sprite_01
		
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ExteriorRearDumpster","ExteriorRearDumpsterObj");
				} 				
			});	
			
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('exteriorRearDumpster_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			/*
			private var bio_lid_off:Image;
			private var bio_lid_on:Image;
			private var book:Image;
			private var left_lid_off:Image;
			private var left_lid_on:Image;
			private var right_lid_off:Image;
			private var right_lid_on:Image;
			*/
			
			bio_lid_on = new Image(this.assets.getTexture('bio_on'));
			bio_lid_on.touchable = false;
			bio_lid_on.x = 71;
			bio_lid_on.y = 130;
			
			bio_lid_off = new Image(this.assets.getTexture('bio_off'));
			bio_lid_off.touchable = false;
			bio_lid_off.x = 58;
			bio_lid_off.y = 311;
			
		
			book = new Image(this.assets.getTexture('book'));
			book.touchable = false;
			book.x = 407;
			book.y = 170;
			
			left_lid_on = new Image(this.assets.getTexture('lid_left_on'));
			left_lid_on.touchable = false;
			left_lid_on.x = 248;
			left_lid_on.y = 90;
			
			right_lid_on = new Image(this.assets.getTexture('lid_right_on'));
			right_lid_on.touchable = false;
			right_lid_on.x = 479;
			right_lid_on.y = 95;
			
			left_lid_off = new Image(this.assets.getTexture('lid_left_off'));
			left_lid_off.touchable = false;
			left_lid_off.x = 323;
			left_lid_off.y = 0;
			
			right_lid_off = new Image(this.assets.getTexture('lid_right_off'));
			right_lid_off.touchable = false;
			right_lid_off.x = 510;
			right_lid_off.y = 0;
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate['Keys'] == 'PickedUp'){	
					GrateKeyCardPickedUp = true;
				}
			}

			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster['BioLid'] == 'Off'){	
					BioLidOpen = true;
					bio_lid_on.alpha = 0;
					bio_lid_off.alpha = 1;
				}else{
					bio_lid_on.alpha = 1;
					bio_lid_off.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster['RightLid'] == 'Open'){	
					LidRightOpen = true;
					right_lid_on.alpha = 0;
					right_lid_off.alpha = 1;
				}else{
					right_lid_on.alpha = 1;
					right_lid_off.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster['LeftLid'] == 'Open'){	
					LidLeftOpen = true;
					left_lid_on.alpha = 0;
					left_lid_off.alpha = 1;
				}else{
					left_lid_on.alpha = 1;
					left_lid_off.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster['Acid'] == 'PickedUp'){	
					AcidPickedUp = true;	
				}
			}else{
				bio_lid_on.alpha = 1;
				bio_lid_off.alpha = 0;
				
				left_lid_on.alpha = 1;
				left_lid_off.alpha = 0;
				right_lid_on.alpha = 1;
				right_lid_off.alpha = 0;
			}
			
			book.alpha = 0;
			
			this.addChildAt(bio_lid_on,1);
			this.addChildAt(bio_lid_off,2);
			this.addChildAt(book,3);
			this.addChildAt(left_lid_on,4);
			this.addChildAt(right_lid_on,5);
			this.addChildAt(left_lid_off,6);
			this.addChildAt(right_lid_off,7);
			
			CreateDebrisHit();
			CreateDumpsterGarbageHit();
			CreateDumpsterHit();
			CreateSignHit();
			CreateBarrelHit();
			
			CreateBioLidHit(BioLidOpen);
			CreateLidLeftHit(LidLeftOpen);
			CreateLidRightHit(LidRightOpen);
			CreateBookHit();
			CreateAcidHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadCityHum(true,999);
		}
		
		
		/*
		
		private var hit_dumpsterGarbage:Shape;
		private var hit_dumpster:Shape;
		private var hit_sign:Shape;
		private var hit_barrel:Shape;
		private var hit_depris:Shape;
		
		*/
		
		private function CreateDebrisHit():void{
			hit_depris = new Shape();
			hit_depris.touchable = false;
			hit_depris.graphics.beginFill(0xff0000);
			
			hit_depris.graphics.lineTo(0,87);	
			hit_depris.graphics.lineTo(213,110);	
			hit_depris.graphics.lineTo(95,380);	
			hit_depris.graphics.lineTo(0,392);	
		
			hit_depris.graphics.endFill(false);
			hit_depris.alpha = 0.0;
			
			hit_depris.graphics.precisionHitTest = true;	
			this.addChild(hit_depris);
		}
		private function CreateBarrelHit():void{
			hit_barrel = new Shape();
			hit_barrel.touchable = false;
			hit_barrel.graphics.beginFill(0xff0000);
			
			hit_barrel.graphics.lineTo(86,220);	
			hit_barrel.graphics.lineTo(236,211);	
			hit_barrel.graphics.lineTo(238,259);	
			hit_barrel.graphics.lineTo(258,351);	
			hit_barrel.graphics.lineTo(226,413);	
			hit_barrel.graphics.lineTo(138,410);	
			hit_barrel.graphics.lineTo(108,346);	
			
			hit_barrel.graphics.endFill(false);
			hit_barrel.alpha = 0.0;
			
			hit_barrel.graphics.precisionHitTest = true;	
			this.addChild(hit_barrel);
		}
		
		private function CreateSignHit():void{
			hit_sign = new Shape();
			hit_sign.touchable = false;
			hit_sign.graphics.beginFill(0xff0000);
			
			hit_sign.graphics.lineTo(396,286);	
			hit_sign.graphics.lineTo(531,298);	
			hit_sign.graphics.lineTo(526,372);	
			hit_sign.graphics.lineTo(400,357);	
		
			hit_sign.graphics.endFill(false);
			hit_sign.alpha = 0.0;
			
			hit_sign.graphics.precisionHitTest = true;	
			this.addChild(hit_sign);
		}
		
		
		private function CreateDumpsterHit():void{
			hit_dumpster = new Shape();
			hit_dumpster.touchable = false;
			hit_dumpster.graphics.beginFill(0xff0000);
			
			hit_dumpster.graphics.lineTo(250,237);	
			hit_dumpster.graphics.lineTo(739,286);	
			hit_dumpster.graphics.lineTo(721,394);	
			hit_dumpster.graphics.lineTo(587,467);	
			hit_dumpster.graphics.lineTo(350,425);	
			hit_dumpster.graphics.lineTo(260,330);	
			
			hit_dumpster.graphics.endFill(false);
			hit_dumpster.alpha = 0.0;
			
			hit_dumpster.graphics.precisionHitTest = true;	
			this.addChild(hit_dumpster);
		}
		
		private function CreateDumpsterGarbageHit():void{
			hit_dumpsterGarbage = new Shape();
			hit_dumpsterGarbage.touchable = false;
			hit_dumpsterGarbage.graphics.beginFill(0xff0000);
			
			hit_dumpsterGarbage.graphics.lineTo(310,231);	
			hit_dumpsterGarbage.graphics.lineTo(331,168);	
			hit_dumpsterGarbage.graphics.lineTo(395,160);	
			hit_dumpsterGarbage.graphics.lineTo(491,192);	
			hit_dumpsterGarbage.graphics.lineTo(515,178);	
			hit_dumpsterGarbage.graphics.lineTo(640,148);	
			hit_dumpsterGarbage.graphics.lineTo(706,192);	
			hit_dumpsterGarbage.graphics.lineTo(697,268);	
			hit_dumpsterGarbage.graphics.lineTo(308,237);	
					
			hit_dumpsterGarbage.graphics.endFill(false);
			hit_dumpsterGarbage.alpha = 0.0;
			
			hit_dumpsterGarbage.graphics.precisionHitTest = true;	
			this.addChild(hit_dumpsterGarbage);
		}
	
		
		private function CreateAcidHit():void{
			hit_acid = new Shape();
			hit_acid.touchable = false;
			hit_acid.graphics.beginFill(0xff0000);
			
			hit_acid.graphics.lineTo(76,185);	
			hit_acid.graphics.lineTo(83,167);	
			hit_acid.graphics.lineTo(153,144);	
			hit_acid.graphics.lineTo(227,145);	
			hit_acid.graphics.lineTo(258,166);	
			hit_acid.graphics.lineTo(239,192);	
			hit_acid.graphics.lineTo(167,210);	
			hit_acid.graphics.lineTo(86,201);	
		
			hit_acid.graphics.endFill(false);
			hit_acid.alpha = 0.0;
			
			hit_acid.graphics.precisionHitTest = true;	
			this.addChild(hit_acid);
		}
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(401,171);	
			hit_book.graphics.lineTo(461,163);	
			hit_book.graphics.lineTo(483,213);	
			hit_book.graphics.lineTo(476,238);	
			hit_book.graphics.lineTo(431,247);	
			
			
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
		
		/*
		private var hit_bio_lid:Shape;
		private var hit_lid_left:Shape
		private var hit_lid_right:Shape;
		
		private var hit_book:Shape;
		private var hit_acid:Shape;
		*/
		private function CreateLidRightHit(open:Boolean = false):void{
			hit_lid_right = new Shape();		
			hit_lid_right.x = 0;
			hit_lid_right.y = 0;
			hit_lid_right.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_lid_right.graphics.lineTo(476,254);					
				hit_lid_right.graphics.lineTo(509,94);					
				hit_lid_right.graphics.lineTo(675,98);					
				hit_lid_right.graphics.lineTo(720,124);					
				hit_lid_right.graphics.lineTo(745,280);					
				
			}else{		
				
				hit_lid_right.graphics.lineTo(518,0);
				hit_lid_right.graphics.lineTo(675,0);
				hit_lid_right.graphics.lineTo(685,113);
				hit_lid_right.graphics.lineTo(511,108);
							
			}				
			hit_lid_right.graphics.endFill(false);			
			hit_lid_right.alpha = 0.0;			
			hit_lid_right.graphics.precisionHitTest = true;	
			hit_lid_right.touchable = false
			this.addChild(hit_lid_right);
			
			
		}
		
		private function CreateLidLeftHit(open:Boolean = false):void{
			hit_lid_left = new Shape();		
			hit_lid_left.x = 0;
			hit_lid_left.y = 0;
			hit_lid_left.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_lid_left.graphics.lineTo(242,236);					
				hit_lid_left.graphics.lineTo(321,86);					
				hit_lid_left.graphics.lineTo(509,97);					
				hit_lid_left.graphics.lineTo(471,265);					
		
			}else{				
				
				hit_lid_left.graphics.lineTo(326,0);
				hit_lid_left.graphics.lineTo(515,0);
				hit_lid_left.graphics.lineTo(507,110);
				hit_lid_left.graphics.lineTo(323,105);
				
				
				
			}				
			hit_lid_left.graphics.endFill(false);			
			hit_lid_left.alpha = 0.0;			
			hit_lid_left.graphics.precisionHitTest = true;	
			hit_lid_left.touchable = false
			this.addChild(hit_lid_left);
			
			
		}
		
		private function CreateBioLidHit(open:Boolean = false):void{
			hit_bio_lid = new Shape();		
			hit_bio_lid.x = 0;
			hit_bio_lid.y = 0;
			hit_bio_lid.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_bio_lid.graphics.lineTo(60,186);					
				hit_bio_lid.graphics.lineTo(81,135);					
				hit_bio_lid.graphics.lineTo(159,116);					
				hit_bio_lid.graphics.lineTo(241,124);					
				hit_bio_lid.graphics.lineTo(265,171);					
				hit_bio_lid.graphics.lineTo(241,206);					
				hit_bio_lid.graphics.lineTo(157,223);					
				hit_bio_lid.graphics.lineTo(75,209);					
			
				
			}else{		
				
				
				hit_bio_lid.graphics.lineTo(48,371);
				hit_bio_lid.graphics.lineTo(98,306);
				hit_bio_lid.graphics.lineTo(170,302);
				hit_bio_lid.graphics.lineTo(233,350);
				hit_bio_lid.graphics.lineTo(240,410);
				hit_bio_lid.graphics.lineTo(196,485);
				hit_bio_lid.graphics.lineTo(100,487);
				hit_bio_lid.graphics.lineTo(72,463);
			
				
			}				
			hit_bio_lid.graphics.endFill(false);			
			hit_bio_lid.alpha = 0.0;			
			hit_bio_lid.graphics.precisionHitTest = true;	
			hit_bio_lid.touchable = false
			this.addChild(hit_bio_lid);
			
			
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
							FadeOut((ExteriorRear as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorRearObj,true
							);
						}else if(hit_bio_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BioLidHandler();
							return;
						}else if(hit_lid_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LidRightHandler();
							return;
						}else if(hit_lid_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LidLeftHandler();
							return;
						}else if(hit_dumpsterGarbage.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DumpsterGarbageHandler();
							return;
						}else if(hit_sign.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("\"Nowheresburg Associated Waste Management\"");
							return;
						}else if(hit_dumpster.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DumpsterHandler();
							return;
						}else if(hit_barrel.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BarrelHandler();
							return;
						}
						if(LidLeftOpen === true){
							if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						//		BookHandler();
								return;							
							}
						}
						if(BioLidOpen === true){							
							if(hit_acid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									AcidHandler();
									return
							}else if(hit_depris.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Broken cinder blocks and various pieces of scrap.");
								return;
							}
						}else if(hit_depris.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Broken cinder blocks and various pieces of scrap.");
							return;
						}
						
						/*
						private var hit_dumpsterGarbage:Shape;
						private var hit_dumpster:Shape;
						private var hit_sign:Shape;
						private var hit_barrel:Shape;
						private var hit_depris:Shape;
						*/
					}
				}
			}
		}
		
		private function BarrelHandler():void{
			
			if(RONum == 0){					
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmmm... Corrosive biological waste...");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I probably want to be careful around this barrel.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This doesn't seem safe at all.");
				
			}
		}
		
		private function DumpsterHandler():void{
					
				if(RONum == 0){					
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A waste dumpster... also known as a 'dumpster'.");
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A layer of grime covers the surface of the dumpster.");
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("paint chips and rust crack off the garbage bin.");
				
			}
		}
		private function DumpsterGarbageHandler():void{
			if(GrateKeyCardPickedUp === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I should look around more before I start rummaging through the garbage.");
			}else{				
				if(RONum == 0){					
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Looks like regular garbage...");
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'm not touching that if I don't have to.");
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The smell is terrible.");
				}
			}
		}
		
		private function AcidHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_CoffeePot)
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SplashTwo();
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CoffeePotFull,
					'item_CoffeePotFull',
					'inven_coffeePotFull_sm',
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CoffeePot,
					'item_CoffeePot'
				);
				AcidPickedUp = true;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster;	
				}
				SaveArray['Acid'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorRearDumpster',SaveArray);
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Jar)
			{
				if(RONum == 0){					
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The beaker doesn't have a handle... I could get some of the ooze on my hands.");
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I need to find a container with a handle. I can't risk touching the waste matter.");
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I don't want the caustic ooze on my skin... I need a container with a handle grip.");
				}
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				!= 
				false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Placing that item into the vat of biochemical waste will not accomplish anything...");
			}else{
				if(AcidPickedUp === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The bin is full of steaming chemical and biological matter.");
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I don't think I need any more of the chemical and biological waste for now...");
				}
			}
		}
		
		
		private function BookHandler():void{
			if(BookPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster;	
				}
				BookPickedUp = true;
				book.alpha = 0;
				SaveArray['Book'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorRearDumpster',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_BookClarke,
					'item_BookClarke',
					'inven_bookClarke_sm'
				);
			}
		}
		
		private function LidLeftHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster;	
			}
						
			if(LidLeftOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpen();
				LidLeftOpen = true;
				left_lid_off.alpha = 1;
				left_lid_on.alpha = 0;
				SaveArray['LeftLid'] = 'Open';
				hit_lid_left.graphics.clear();
				//	hit_duct.graphics.clear();
				CreateLidLeftHit(true);
	//			CreateBookHit();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BarrelKickDeep();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyClose();
				LidLeftOpen = false;
				left_lid_off.alpha = 0;
				left_lid_on.alpha = 1;
				SaveArray['LeftLid'] = 'Closed';
				hit_lid_left.graphics.clear();
				//	hit_duct.graphics.clear();
				CreateLidLeftHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorRearDumpster',SaveArray);
		}
		
		private function LidRightHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster;	
			}
			if(LidRightOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpen();
				LidRightOpen = true;
				right_lid_off.alpha = 1;
				right_lid_on.alpha = 0;
				SaveArray['RightLid'] = 'Open';
				hit_lid_right.graphics.clear();
				//	hit_duct.graphics.clear();
				CreateLidRightHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BarrelKickDeep();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyClose();
				LidRightOpen = false;
				right_lid_off.alpha = 0;
				right_lid_on.alpha = 1;
				SaveArray['RightLid'] = 'Closed';
				hit_lid_right.graphics.clear();
				//	hit_duct.graphics.clear();
				CreateLidRightHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorRearDumpster',SaveArray);
		}
		
		private function BioLidHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorRearDumpster;	
			}
			if(BioLidOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				BioLidOpen = true;
				bio_lid_off.alpha = 1;
				bio_lid_on.alpha = 0;
				SaveArray['BioLid'] = 'Off';
				hit_bio_lid.graphics.clear();
			//	hit_duct.graphics.clear();
				CreateBioLidHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				BioLidOpen = false;
				bio_lid_off.alpha = 0;
				bio_lid_on.alpha = 1;
				SaveArray['BioLid'] = 'On';
				hit_bio_lid.graphics.clear();
				//	hit_duct.graphics.clear();
				CreateBioLidHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorRearDumpster',SaveArray);
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
			
			
			
			this.assets.removeTexture("exteriorRearDumpster_bg",true);
			this.assets.removeTexture("ExteriorRearDumpster_Sprite_01",true);
			this.assets.removeTextureAtlas("ExteriorRearDumpster_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("exteriorRearDumpster_01");
			(stage.getChildAt(0) as Object).falseAsset("exteriorRearDumpster_02");
			(stage.getChildAt(0) as Object).falseAsset("exteriorRearDumpster_03");
			
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
