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
	
	
	public class BuildingOfficeBookCase extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var pos_0:Image;
		private var pos_1:Image;
		private var pos_2:Image;
		private var pos_3:Image;
		private var pos_4:Image;
		
		private var orwell:Image;
		
		private var hit_pos_0:Shape;
		private var hit_pos_1:Shape;
		private var hit_pos_2:Shape;
		private var hit_pos_3:Shape;
		private var hit_pos_4:Shape;
		
		private var ArmedPos:int = 5;
		private var PosArray:Array = new Array(
			null,
			null,
			null,
			null,
			null
		);
		
		private var OrwellStraight:Boolean = false;
		private var SaganAttached:Boolean = false;
		private var HeinleinAttached:Boolean = false;
		private var AsimovAttached:Boolean = false;
		private var ClarkeAttached:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function BuildingOfficeBookCase(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('buildingOfficeBookCase_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeBookCase/buildingOfficeBookCase_bg.jpg'));
				game.TrackAssets('buildingOfficeBookCase_01');
			}
			if(game.CheckAsset('buildingOfficeBookCase_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeBookCase/BuildingOfficeBookCase_Sprite_01.png'));
				game.TrackAssets('buildingOfficeBookCase_02');
			}
			if(game.CheckAsset('buildingOfficeBookCase_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeBookCase/BuildingOfficeBookCase_Sprite_01.xml'));
				game.TrackAssets('buildingOfficeBookCase_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BuildingOfficeBookCase","BuildingOfficeBookCaseObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			//(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBookCase',SaveArray);
			
			bg = new Image(this.assets.getTexture('buildingOfficeBookCase_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				//if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['EggplantAttached'] == 'Yes'){	
				//	EggplantAttached = true;
				//}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['0'] != undefined){	
					PosArray[0] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['1'] != undefined){	
					PosArray[1] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['2'] != undefined){	
					PosArray[2] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['3'] != undefined){	
					PosArray[3] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['3'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['4'] != undefined){	
					PosArray[4] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['4'];
				}
				
			}else{
				
			}
			
			
			if(PosArray[0] == null){
				pos_0 = new Image(this.assets.getTexture('pos_0_o'));
			}else{	
				pos_0 = new Image(this.assets.getTexture('pos_0_'+PosArray[0]));
			}	

			pos_0.touchable = false;
			pos_0.x = 146;
			pos_0.y = 32;
			
			if(PosArray[1] == null){
				pos_1 = new Image(this.assets.getTexture('pos_1_a'));
			}else{	
				pos_1 = new Image(this.assets.getTexture('pos_1_'+PosArray[1]));
			}	
			pos_1.touchable = false;
			pos_1.x = 246;
			pos_1.y = 33;
			
			if(PosArray[2] == null){
				pos_2 = new Image(this.assets.getTexture('pos_2_a'));
			}else{	
				pos_2 = new Image(this.assets.getTexture('pos_2_'+PosArray[2]));
			}	
			pos_2.touchable = false;
			pos_2.x = 346;
			pos_2.y = 33;
			
			if(PosArray[3] == null){
				pos_3 = new Image(this.assets.getTexture('pos_3_a'));
			}else{	
				pos_3 = new Image(this.assets.getTexture('pos_3_'+PosArray[3]));
			}	
			pos_3.touchable = false;
			pos_3.x = 437;
			pos_3.y = 33;
			
			if(PosArray[4] == null){
				pos_4 = new Image(this.assets.getTexture('pos_4_a'));
			}else{	
				pos_4 = new Image(this.assets.getTexture('pos_4_'+PosArray[4]));
			}
			pos_4.touchable = false;
			pos_4.x = 516;
			pos_4.y = 33;
			
			orwell = new Image(this.assets.getTexture('orwell'));
			orwell.touchable = false;
			orwell.x = 148;
			orwell.y = 46;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['OrwellStraight'] == 'Yes'){	
					OrwellStraight = true;
					orwell.alpha = 0;
				}else{
					orwell.alpha = 1;
				}
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_0'] != undefined){	
					PosArray[0] = ""+(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_0'];
					if(PosArray[0] != null){
						trace("'pos_0_'+PosArray[0]: "+'pos_0_'+PosArray[0]);
						pos_0.texture = this.assets.getTexture('pos_0_'+PosArray[0])
						pos_0.alpha = 1;
					}else{
						pos_0.alpha = 0;
					}
				}else{
					pos_0.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_1'] != undefined){	
					PosArray[1] = ""+(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_1'];
					if(PosArray[1] != null){
						pos_1.texture = this.assets.getTexture('pos_1_'+PosArray[1])
						pos_1.alpha = 1;
					}else{
						pos_1.alpha = 0;
					}
				}else{
					pos_1.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_2'] != undefined){	
					PosArray[2] = ""+(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_2'];
					if(PosArray[2] != null){
						pos_2.texture = this.assets.getTexture('pos_2_'+PosArray[2])
						pos_2.alpha = 1;
					}else{
						pos_2.alpha = 0;
					}
				}else{
					pos_2.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_3'] != undefined){	
					PosArray[3] = ""+(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_3'];
					if(PosArray[3] != null){
						pos_3.texture = this.assets.getTexture('pos_3_'+PosArray[3])
						pos_3.alpha = 1;
					}else{
						pos_3.alpha = 0;
					}
				}else{
					pos_3.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_4'] != undefined){	
					PosArray[4] = ""+(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_4'];
					if(PosArray[4] != null){
						pos_4.texture = this.assets.getTexture('pos_4_'+PosArray[4])
						pos_4.alpha = 1;
					}else{
						pos_4.alpha = 0;
					}
				}else{
					pos_4.alpha = 0;
				}
			}else{
				pos_0.alpha = 0;
				pos_1.alpha = 0;
				pos_2.alpha = 0;
				pos_3.alpha = 0;
				pos_4.alpha = 0;
				orwell.alpha = 1;
			}
			
		
			
			
			this.addChildAt(pos_0,1);
			this.addChildAt(pos_1,2);
			this.addChildAt(pos_4,3);
			this.addChildAt(pos_3,4);
			this.addChildAt(pos_2,5);
			this.addChildAt(orwell,6);
			
			CreatePosHits();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
		//	(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
		//		(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_BookHeinlein,
		//		'item_BookHeinlein',
		//		'inven_bookHeinlein_sm'
		//	);
		}
		
		private function CreatePosHits():void{
			hit_pos_0 = new Shape();
			hit_pos_0.touchable = false;
			hit_pos_0.graphics.beginFill(0xff0000);
			
			hit_pos_0.graphics.lineTo(145,33);	
			hit_pos_0.graphics.lineTo(241,34);	
			hit_pos_0.graphics.lineTo(245,476);	
			hit_pos_0.graphics.lineTo(148,476);	
			
			hit_pos_0.graphics.endFill(false);
			hit_pos_0.alpha = 0.0;
			
			hit_pos_0.graphics.precisionHitTest = true;	
			
			hit_pos_1 = new Shape();
			hit_pos_1.touchable = false;
			hit_pos_1.graphics.beginFill(0xff0000);
			
			hit_pos_1.graphics.lineTo(241,32);	
			hit_pos_1.graphics.lineTo(342,32);	
			hit_pos_1.graphics.lineTo(343,478);	
			hit_pos_1.graphics.lineTo(246,478);	
			
			hit_pos_1.graphics.endFill(false);
			hit_pos_1.alpha = 0.0;
			
			hit_pos_1.graphics.precisionHitTest = true;	
			
			hit_pos_2 = new Shape();
			hit_pos_2.touchable = false;
			hit_pos_2.graphics.beginFill(0xff0000);
			
			hit_pos_2.graphics.lineTo(344,30);	
			hit_pos_2.graphics.lineTo(443,31);	
			hit_pos_2.graphics.lineTo(443,479);	
			hit_pos_2.graphics.lineTo(345,478);	
						
			hit_pos_2.graphics.endFill(false);
			hit_pos_2.alpha = 0.0;
			
			hit_pos_2.graphics.precisionHitTest = true;	
			
			
			hit_pos_3 = new Shape();
			hit_pos_3.touchable = false;
			hit_pos_3.graphics.beginFill(0xff0000);
			
			hit_pos_3.graphics.lineTo(445,31);	
			hit_pos_3.graphics.lineTo(543,30);	
			hit_pos_3.graphics.lineTo(542,478);	
			hit_pos_3.graphics.lineTo(444,478);	
			
			hit_pos_3.graphics.endFill(false);
			hit_pos_3.alpha = 0.0;
			
			hit_pos_3.graphics.precisionHitTest = true;	
			
			hit_pos_4 = new Shape();
			hit_pos_4.touchable = false;
			hit_pos_4.graphics.beginFill(0xff0000);
			
			hit_pos_4.graphics.lineTo(543,28);	
			hit_pos_4.graphics.lineTo(641,30);	
			hit_pos_4.graphics.lineTo(643,478);	
			hit_pos_4.graphics.lineTo(545,478);	
		
			hit_pos_4.graphics.endFill(false);
			hit_pos_4.alpha = 0.0;
			
			hit_pos_4.graphics.precisionHitTest = true;	
			
			this.addChild(hit_pos_0);
			this.addChild(hit_pos_1);
			this.addChild(hit_pos_2);
			this.addChild(hit_pos_3);
			this.addChild(hit_pos_4);
		}
		
		/*
		private var hit_pos_0:Shape;
		private var hit_pos_1:Shape;
		private var hit_pos_2:Shape;
		private var hit_pos_3:Shape;
		private var hit_pos_4:Shape;
		*/
		
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
						}else if(hit_pos_0.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(OrwellStraight === true){
								PosHandler(0);
							}else{
								OrwellHandler();
							}
						
						
						}else if(hit_pos_1.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(OrwellStraight === true){
								PosHandler(1);
							}else{
								OrwellHandler();
							}
							
							
						}else if(hit_pos_2.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(OrwellStraight === true){
								PosHandler(2);
							}else{
								OrwellHandler();
							}
							
							
						}else if(hit_pos_3.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(OrwellStraight === true){
								PosHandler(3);
							}else{
								OrwellHandler();
							}
							
							
						}else if(hit_pos_4.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							
							PosHandler(4);
							
							
							
						}
					}
				}
			}
		}
		
		private function PosHandler(tapPos:int):void{
			
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_BookAsimov)
				{
					if(this.PosArray[tapPos] == null){
						PosArray[tapPos] = 'a';
						this['pos_'+tapPos].texture = this.assets.getTexture('pos_'+tapPos+'_a');
						this['pos_'+tapPos].alpha = 1;
						
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase;	
						}
						AsimovAttached = true;
						
						SaveArray['AsimovAttached'] = "Yes";
						SaveArray['pos_'+tapPos] = 'a';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBookCase',SaveArray);
						
						
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_BookAsimov,
								"item_BookAsimov"
							);
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
						
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("That space on the shelf is already occupied by a book.");
						
					}
					
					
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_BookClarke)
				{
					if(this.PosArray[tapPos] == null){
						PosArray[tapPos] = 'c';
						this['pos_'+tapPos].texture = this.assets.getTexture('pos_'+tapPos+'_c');
						this['pos_'+tapPos].alpha = 1;
						
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase;	
						}
						ClarkeAttached = true;
						
						SaveArray['ClarkeAttached'] = "Yes";
						SaveArray['pos_'+tapPos] = 'c';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBookCase',SaveArray);
						
						
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_BookClarke,
								"item_BookClarke"
							);
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("That space on the shelf is already occupied by a book.");
						
					}
					
					
					
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_BookSagan)
				{
					if(this.PosArray[tapPos] == null){
						PosArray[tapPos] = 's';
						this['pos_'+tapPos].texture = this.assets.getTexture('pos_'+tapPos+'_s');
						this['pos_'+tapPos].alpha = 1;
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase;	
						}
						SaganAttached = true;
						
						SaveArray['SaganAttached'] = "Yes";
						SaveArray['pos_'+tapPos] = 's';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBookCase',SaveArray);
						
						
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_BookSagan,
								"item_BookSagan"
							);
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
						
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("That space on the shelf is already occupied by a book.");
						
					}
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_BookHeinlein)
				{
					if(this.PosArray[tapPos] == null){
						PosArray[tapPos] = 'h';
						this['pos_'+tapPos].texture = this.assets.getTexture('pos_'+tapPos+'_h');
						this['pos_'+tapPos].alpha = 1;
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase;	
						}
						HeinleinAttached = true;
						
						SaveArray['HeinleinAttached'] = "Yes";
						SaveArray['pos_'+tapPos] = 'h';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBookCase',SaveArray);
						
						
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_BookHeinlein,
								"item_BookHeinlein"
							);
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
						
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("That space on the shelf is already occupied by a book.");						
					}
					

					
				}else{
					trace('00:');
					if(ArmedPos == 5){
						trace('01:');
						if(PosArray[tapPos] != null){
							trace('02:');
							ArmedPos = tapPos;
						}else{
							trace('03:');
							ArmedPos = 5;
						}
					
					}else{
						
						
						trace('04:');
						if(PosArray[tapPos] != null){
							if(PosArray[tapPos] != PosArray[ArmedPos]){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
								
								
								trace('05:');
								trace('tapPos: '+tapPos);
								trace('ArmedPos: '+ArmedPos);
								trace('PosArray[tapPos]: '+PosArray[tapPos]);
								trace('PosArray[ArmedPos]: '+PosArray[ArmedPos]);
								
								var tempPosVal:String = PosArray[tapPos];
								PosArray[tapPos] = PosArray[ArmedPos];
								
								trace("'pos_'+ArmedPos+'_'+PosArray[tempPos]: "+'pos_'+ArmedPos+'_'+tempPosVal);
								trace("''pos_'+tapPos+'_'+PosArray[ArmedPos]: "+'pos_'+tapPos+'_'+PosArray[ArmedPos]);
								
								this['pos_'+ArmedPos].texture = this.assets.getTexture('pos_'+ArmedPos+'_'+tempPosVal);
								this['pos_'+tapPos].texture = this.assets.getTexture('pos_'+tapPos+'_'+PosArray[ArmedPos]);
								PosArray[ArmedPos] = tempPosVal;
															
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase;	
								}
								
								SaveArray['pos_'+tapPos] = PosArray[tapPos];
								SaveArray['pos_'+ArmedPos] = PosArray[ArmedPos];
								
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBookCase',SaveArray);
								
								ArmedPos = 5;
							}
						}else{
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
							trace('06:');
							PosArray[tapPos] = PosArray[ArmedPos];
							this['pos_'+tapPos].texture = this.assets.getTexture('pos_'+tapPos+'_'+PosArray[ArmedPos]);
							this['pos_'+tapPos].alpha = 1;
							this['pos_'+ArmedPos].alpha = 0;
							PosArray[ArmedPos] = null;
							
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
								SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase;	
							}
							
							
							SaveArray['pos_'+tapPos] = PosArray[tapPos];
							SaveArray['pos_'+ArmedPos] = null;
							
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBookCase',SaveArray);
							
							ArmedPos = 5;
						//	this['pos_'+tapPos];
						}
					}
						
				}
				
				Solve();
		}
		
		private function OrwellHandler():void{
		//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
			PosArray[0] = 'o';
			OrwellStraight = true;
			orwell.alpha = 0;
			pos_0.alpha = 1;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase;	
			}
			
			SaveArray['OrwellStraight'] = "Yes";
			SaveArray['pos_0'] = "o";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBookCase',SaveArray);
			
			
		}
		
		private function Solve():void{
			if(PosArray[0] == 'c'){
				if(PosArray[1] == 'h'){
					if(PosArray[2] == 'a'){
						if(PosArray[3] == 'o'){
							if(PosArray[4] == 's'){
								Animating = true;
								trace('Solved');
								trace('Solved');
								trace('Solved');
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
								
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){	
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase;	
								}
								
								SaveArray['Solved'] = 'Yes';
								
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBookCase',SaveArray);
								
								Starling.juggler.delayCall(function():void{
									
									RunSolve();
									
								},2);
							}
						}
					}
				}
			}
		}
		
		private function RunSolve():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_UnlockTwo();
			FadeOut((BuildingOfficeBack as Class), 
				(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeBackObj,true
			);
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
			
			
			
			this.assets.removeTexture("buildingOfficeBookCase_bg",true);
			this.assets.removeTexture("BuildingOfficeBookCase_Sprite_01",true);
			this.assets.removeTextureAtlas("BuildingOfficeBookCase_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeBookCase_01");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeBookCase_02");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeBookCase_03");
			
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