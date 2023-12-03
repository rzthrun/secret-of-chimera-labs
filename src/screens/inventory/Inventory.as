package screens.inventory
{
	import flash.filesystem.File;
	
	import screens.inventory.InventoryBar;
	
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
	
	public class Inventory extends Sprite
	{
		private var assets:AssetManager;
		
		private var SaveArray:Array = new Array();
		
		public var toggleButton:Image;

		public var armedHighlight:Image;
		public var inventoryBarObj:InventoryBar = new InventoryBar();
		public var armedItem:Object = false;
		
		
		private var touches:Vector.<Touch>;
		private var targ:Object;	
		private var c_targ:Object;
		
		public var ToggleBar:Boolean = false;
		public var ToggleBarTween:Tween;
		
		
		public var item_FuseRed:Image;
		public var item_FuseGreen:Image;
		public var item_FuseBlue:Image;		
		public var item_Chains:Image;
		public var item_SprayCan:Image;
		public var item_PaperTowels:Image;
		public var item_Eyeglasses:Image;
		public var item_Stick:Image;
		public var item_CarKeys:Image;
		public var item_KeyCard:Image;
		public var item_Knob:Image;
		public var item_AllenWrench:Image;
		
		public var item_Splat:Image;
		public var item_Controller:Image;
		public var item_Screwdriver:Image;
		public var item_SmallKey:Image;
		public var item_CubeDamage:Image;
		public var item_Cube:Image;
		
		public var item_Iodine:Image;
		public var item_SampleTweezers:Image;
		public var item_Claw:Image;
		public var item_Cord:Image;
		public var item_HDD:Image;
		public var item_KomaDial:Image;
		public var item_PowerSupply:Image;
		public var item_Eggplant:Image;
		public var item_PushBox:Image;
		
		public var item_Tongs:Image;
		public var item_Orb:Image;
		public var item_Drill:Image;		
		public var item_Metal:Image;
		public var item_BoltCutters:Image;
		public var item_GasMask:Image;
		
		public var item_Ethernet:Image;
		
		
		public var item_LabTongs:Image;
		public var item_Jar:Image;
		public var item_JarFull:Image;
		public var item_JarFullRock:Image;
		public var item_JarFullIodine:Image;
		public var item_JarFullRockIodine:Image;
		public var item_JarRock:Image;
		public var item_JarRockIodine:Image;
		public var item_JarIodine:Image;
	//	public var item_LabTongsJar:Image;
	//	public var item_LabTongsAcid:Image;
		public var item_SamplePipette:Image;
		
		public var item_BookClarke:Image;
		public var item_BookAsimov:Image;
		public var item_BookSagan:Image;
		public var item_BookHeinlein:Image;
		
		public var item_Chisel:Image;
		public var item_TubeEmpty:Image;
		public var item_TubeBlue:Image;
		public var item_TubeRed:Image;
		
		public var item_StoneOne:Image;
		public var item_StoneTwo:Image;
		public var item_StoneThree:Image;
		
		public var item_Injector:Image;
		public var item_InjectorFull:Image;
		public var item_DNAJar:Image;
	
		public var item_Cell:Image;
		public var item_CellFull:Image;
		public var item_RedRock:Image;
		
		public var item_CoffeePot:Image;
		public var item_CoffeePotFull:Image;
		
		public var item_BottleG:Image;
		public var item_BottleC:Image;
		
		public var item_TestTube:Image;
		public var item_TestTubeHalf:Image;
		
		public var item_Crowbar:Image;
		public var item_Handler:Image;
		
		public var item_HandlerCup:Image;
		
		public var item_PearlRed:Image;
		public var item_PearlBlue:Image;
		public var item_PearlGreen:Image;
		
		public var item_SampleNails:Image;
		public var item_TinyDriver:Image;
				
		public var item_Lens:Image;
		
		public var item_Syringe:Image;
		public var item_SyringeFull:Image;

		public var item_Slide:Image;
		
		public var item_Hand:Image;
		
		//item_PirateTubeEmpty
		//item_PirateDisc		
		public var currentSet:int = 1;
		public var InvenPuzzleFlag:String = null;
		
		public var DetailSprite:Sprite;
		private var detailBg:Image;
		private var detailImage:Image;
		private var hit_Detail:Shape; 
		
		private var DetailObj:InventoryDetail;
		private var DetailObjTween:Tween;
		private var DetailLoaded:Boolean = false;
		
		
		
		public var game:Game;
		
		public function Inventory(_game:Game,_assets:AssetManager)
		{
			super();
			this.game = _game;
			this.assets = _assets;
			inventoryBarObj.name = "InvenBar";
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		
	
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
				}				
			});						
			
		}		
		private function onLoadAssets():void{
			DetailObj = new InventoryDetail(this.assets);
			//DetailObj.touchable = false;
			DetailSprite = new Sprite();
			DetailSprite.x = 601;
			DetailSprite.y = 382;
			this.addChild(DetailSprite);
			
			detailBg = new Image(this.assets.getTexture('armedItem_bg_v002a001'));
			detailBg.alpha =1;
			detailBg.x = 0;
			detailBg.y = 0;
			detailBg.touchable = false;
			this.DetailSprite.addChild(detailBg);
			
			detailImage = new Image(this.assets.getTexture('inven_fuseRed_sm'));
			detailImage.alpha =0;
			detailImage.x = 24;
			detailImage.y = 50;
			detailImage.touchable = true;
			this.DetailSprite.addChild(detailImage);
			CreateDetailHit();

			
			/*
			---------------------------------
			*/
		
			/*
			---------------------------------
			*/
			
			//toggleButton = new Image(this.assets.getTexture('inventory_v06'));
			toggleButton = new Image(this.assets.getTexture('invenToggleClosed_v003a001'));
			toggleButton.x = 0;
			toggleButton.y = 410;
			this.addChild(toggleButton);
			
			inventoryBarObj.addBg(new Image(this.assets.getTexture('inventory_v06')));
			inventoryBarObj.x = 65;
			inventoryBarObj.y = 512;
			inventoryBarObj.width = 557;
			inventoryBarObj.height = 89;
			
			inventoryBarObj.touchable = true;
			this.addChild(inventoryBarObj);
			

			inventoryBarObj.addLeftArrow(new Image(this.assets.getTexture('arrow_left_v001a002')));
			inventoryBarObj.addRightArrow(new Image(this.assets.getTexture('arrow_right_v001a002')));
			
			
			armedHighlight = new Image(this.assets.getTexture('element_ArmedHighlight_v001a001'));
			
			//	SourceImage = new Image(this.assets.getTexture('element_hud_goBack_v003a001'));
		//	this.addChild(SourceImage);
			
			CheckSavedState();
			
			this.addEventListener(TouchEvent.TOUCH,onClickHandler);	
			
			
		}		
		
	
		
		public function AddItemToInventory(item:Image,itemName:String,itemImage:String,ArrayPos:Number = -1,SaveIt:Boolean = true):void{
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Inventory != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Inventory;
				
				var pos:Number = CalculatePos();
				trace("CalcPos pos = :"+pos);
				if(ArrayPos > -1){
					pos = ArrayPos;
				}
				trace("CalcPos pos = :"+pos);
			}else{
				pos = 0;
			}
			
			
			trace("pos: "+pos);
			if(((pos+1)/6) <= 1){
				trace("Set 01");
				currentSet = 1;
			}else if(((pos+1)/6) > 1 && ((pos+1)/6) <= 2){
				trace("Set 02");
				currentSet = 2;
			}else if(((pos+1)/6) > 2 && ((pos+1)/6) <= 3){
				trace("Set 03");
				currentSet = 3;
			}else if(((pos+1)/6) > 3 && ((pos+1)/6) <= 4){
				trace("Set 04");
				currentSet = 4;
			}else if(((pos+1)/6) > 4 && ((pos+1)/6) <= 5){
				trace("Set 05");
				currentSet = 5;
			}
				
			item = new Image(this.assets.getTexture(itemImage));
			item.x = ((pos*70)-(420*(currentSet-1)));
			this[itemName] = item;
			inventoryBarObj.addItem(item,itemName,currentSet);
			

			if(SaveIt === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPickUp();
				SaveArray.push(new Array(itemName,itemImage,pos,currentSet));
				(stage.getChildAt(0) as Object).SavedGame.SaveInventoryData(SaveArray);
				armedItem = item;
				trace("ArmedItem: "+armedItem);
				armedHighlight.x = armedItem.x;
				ArmItem();
				if(DetailLoaded === false){
					ToggleCloseUp();
				}else{
					DetailObj.ChangeImageDetail();
					DetailObj.ReadOutReturns();
				}
				if(ToggleBar === false){
					
					toggleInvetory();
				}
			}
			
			
			
		}
		
		public function ChangeInventoryItem(item:Image,itemName:String,itemImage:String,targetRef:Image,targetName:String):void{
			for(var i:Number in SaveArray){
				if(targetName == SaveArray[i][0]){
				//	ArmItem();
					trace('itemName: '+itemName);
					if(itemName == 'item_PipetteFilled'){
						armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PipetteFilled;
					}else if(itemName == 'item_Pot'){
						armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Pot;
					}else if(itemName == 'item_GreenTestTube'){
						armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_GreenTestTube;
					}else if(itemName == 'item_PirateTube'){
						armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PirateTube;
					}
					
					AddItemToInventory(item,itemName,itemImage, SaveArray[i][2],true);
					removeItemFromInventory(targetRef,targetName,true);
					
					
					
				//	armedItem = item;
					ArmItem();
				}
			}
		}
		
		
		private function CalculatePos():Number{
			var p:Number = 0;
			var iCount:Number = 0;
			var total:Number = 0;
			if(SaveArray.length > 0){
				
				var tmp_array: Array = new Array();
				for(var i:Number in SaveArray){
					tmp_array[i] = SaveArray[i][2];
				}
				trace("TMP_ARR: "+ tmp_array);
				p = findInArray();
				
				return p;
				
			}else{
				trace("P IS: "+p);
				return p;
			}
			
			function findInArray():Number {
				for(var i2:int = 0; i2 < tmp_array.length; i2++){
					if(tmp_array[i2] == i2){
						trace("found it at index: " + i2);
						
					}else{
						if(tmp_array.indexOf(i2) >= 0){
							
						}else{
							return i2;
						}		
					}
				}
				return (tmp_array.length);
			}			
			
			
			
		}		
		
		public function removeItemFromInventory(item,itemName,ArmThis:Boolean = false):void{
			for(var i:int in SaveArray){
				if(SaveArray[i][0] == itemName){
					
					inventoryBarObj.removeItem(item,itemName,SaveArray[i][3]);
					inventoryBarObj["Set_0"+SaveArray[i][3]].removeChild(armedHighlight);
					SaveArray.splice(i,1);
					
					trace(itemName+" removed from Inventory");
				}else{
					trace(SaveArray[i][0]+" not a match");
				}
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveInventoryData(SaveArray);
			this[itemName].dispose();
			this[itemName] = null;
			if(ArmThis === false){
				armedItem = false;
			}else{
			//	armedItem = ArmThis;
			//	ArmItem();
			}
			detailImage.alpha = 0;
			//inventoryBarObj.removeChild(armedHighlight);
		}
		
		
		
		public function CheckSavedState():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Inventory != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Inventory;
				var SavedInven:Array = 	(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Inventory;
				for(var i:int in SavedInven){
			//		var SavedInven[i][0] =   
					var img:Image = SavedInven[i][0] as Image;
					AddItemToInventory(
								img,
								SavedInven[i][0],
								SavedInven[i][1],
								SavedInven[i][2],
								false
					);
				}
			}
		}
		
		private function CreateDetailHit():void{
			hit_Detail = new Shape();
			
			this.DetailSprite.addChild(hit_Detail);
			hit_Detail.graphics.beginFill(0x00FF00);
			hit_Detail.graphics.lineTo(10,80);	
			hit_Detail.graphics.lineTo(30,40);	
			hit_Detail.graphics.lineTo(100,40);	
			hit_Detail.graphics.lineTo(100,150);	
			hit_Detail.graphics.lineTo(10,150);	
			hit_Detail.touchable = false;
			hit_Detail.graphics.endFill(false);
			hit_Detail.alpha = 0.0;
			hit_Detail.graphics.precisionHitTest = true;	
		}
		
		private function onClickHandler(e:TouchEvent):void{
			targ = e.target;
		//	c_targ = e.currentTarget;
			touches = e.getTouches(this);
			if (touches.length > 0){
				
				if (touches[0].phase == TouchPhase.BEGAN) {
					trace("HELLO: "+touches[0].globalX+" ,"+touches[0].globalY);
					if(targ == toggleButton){
						trace(targ);
						toggleInvetory();
						return;
					}else if(inventoryBarObj.hit_LeftArrow.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
						var cSet:Number = currentSet-1;
						if(cSet == 0){
							cSet = 5;
						}
						currentSet = cSet;
						
						if(currentSet == 1){
							
							inventoryBarObj.Set_01.touchable = true;
							inventoryBarObj.Set_01.alpha = 1;
							
							inventoryBarObj.Set_02.touchable = false;
							inventoryBarObj.Set_02.alpha = 0;
							
							inventoryBarObj.Set_03.touchable = false;
							inventoryBarObj.Set_03.alpha = 0;
							
							inventoryBarObj.Set_04.touchable = false;
							inventoryBarObj.Set_04.alpha = 0;
							
							inventoryBarObj.Set_05.touchable = false;
							inventoryBarObj.Set_05.alpha = 0;
						}
						if(currentSet == 2){
							inventoryBarObj.Set_01.touchable = false;
							inventoryBarObj.Set_01.alpha = 0;
							
							inventoryBarObj.Set_02.touchable = true;
							inventoryBarObj.Set_02.alpha = 1;
							
							inventoryBarObj.Set_03.touchable = false;
							inventoryBarObj.Set_03.alpha = 0;
							
							inventoryBarObj.Set_04.touchable = false;
							inventoryBarObj.Set_04.alpha = 0;
							
							inventoryBarObj.Set_05.touchable = false;
							inventoryBarObj.Set_05.alpha = 0;
						}
						if(currentSet == 3){
							inventoryBarObj.Set_01.touchable = false;
							inventoryBarObj.Set_01.alpha = 0;
							
							inventoryBarObj.Set_02.touchable = false;
							inventoryBarObj.Set_02.alpha = 0;
							
							inventoryBarObj.Set_03.touchable = true;
							inventoryBarObj.Set_03.alpha = 1;
							
							inventoryBarObj.Set_04.touchable = false;
							inventoryBarObj.Set_04.alpha = 0;
							
							inventoryBarObj.Set_05.touchable = false;
							inventoryBarObj.Set_05.alpha = 0;
						}
						if(currentSet == 4){
							inventoryBarObj.Set_01.touchable = false;
							inventoryBarObj.Set_01.alpha = 0;
							
							inventoryBarObj.Set_02.touchable = false;
							inventoryBarObj.Set_02.alpha = 0;
							
							inventoryBarObj.Set_03.touchable = false;
							inventoryBarObj.Set_03.alpha = 0;
							
							inventoryBarObj.Set_04.touchable = true;
							inventoryBarObj.Set_04.alpha = 1;
							
							inventoryBarObj.Set_05.touchable = false;
							inventoryBarObj.Set_05.alpha = 0;
						}
						if(currentSet == 5){
							inventoryBarObj.Set_01.touchable = false;
							inventoryBarObj.Set_01.alpha = 0;
							
							inventoryBarObj.Set_02.touchable = false;
							inventoryBarObj.Set_02.alpha = 0;
							
							inventoryBarObj.Set_03.touchable = false;
							inventoryBarObj.Set_03.alpha = 0;
							
							inventoryBarObj.Set_04.touchable = false;
							inventoryBarObj.Set_04.alpha = 0;
							
							inventoryBarObj.Set_05.touchable = true;
							inventoryBarObj.Set_05.alpha = 1;
						}
					}
					
					
					else if(inventoryBarObj.hit_RightArrow.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
						var cSet:Number = currentSet+1;
						if(cSet == 6){
							cSet = 1;
						}
						currentSet = cSet;
						
						if(currentSet == 1){
							
							inventoryBarObj.Set_01.touchable = true;
							inventoryBarObj.Set_01.alpha = 1;
							
							inventoryBarObj.Set_02.touchable = false;
							inventoryBarObj.Set_02.alpha = 0;
							
							inventoryBarObj.Set_03.touchable = false;
							inventoryBarObj.Set_03.alpha = 0;
							
							inventoryBarObj.Set_04.touchable = false;
							inventoryBarObj.Set_04.alpha = 0;
							
							inventoryBarObj.Set_05.touchable = false;
							inventoryBarObj.Set_05.alpha = 0;
						}
						if(currentSet == 2){
							inventoryBarObj.Set_01.touchable = false;
							inventoryBarObj.Set_01.alpha = 0;
							
							inventoryBarObj.Set_02.touchable = true;
							inventoryBarObj.Set_02.alpha = 1;
							
							inventoryBarObj.Set_03.touchable = false;
							inventoryBarObj.Set_03.alpha = 0;
							
							inventoryBarObj.Set_04.touchable = false;
							inventoryBarObj.Set_04.alpha = 0;
							
							inventoryBarObj.Set_05.touchable = false;
							inventoryBarObj.Set_05.alpha = 0;
						}
						if(currentSet == 3){
							inventoryBarObj.Set_01.touchable = false;
							inventoryBarObj.Set_01.alpha = 0;
							
							inventoryBarObj.Set_02.touchable = false;
							inventoryBarObj.Set_02.alpha = 0;
							
							inventoryBarObj.Set_03.touchable = true;
							inventoryBarObj.Set_03.alpha = 1;
							
							inventoryBarObj.Set_04.touchable = false;
							inventoryBarObj.Set_04.alpha = 0;
							
							inventoryBarObj.Set_05.touchable = false;
							inventoryBarObj.Set_05.alpha = 0;
						}
						if(currentSet == 4){
							inventoryBarObj.Set_01.touchable = false;
							inventoryBarObj.Set_01.alpha = 0;
							
							inventoryBarObj.Set_02.touchable = false;
							inventoryBarObj.Set_02.alpha = 0;
							
							inventoryBarObj.Set_03.touchable = false;
							inventoryBarObj.Set_03.alpha = 0;
							
							inventoryBarObj.Set_04.touchable = true;
							inventoryBarObj.Set_04.alpha = 1;
							
							inventoryBarObj.Set_05.touchable = false;
							inventoryBarObj.Set_05.alpha = 0;
						}
						if(currentSet == 5){
							inventoryBarObj.Set_01.touchable = false;
							inventoryBarObj.Set_01.alpha = 0;
							
							inventoryBarObj.Set_02.touchable = false;
							inventoryBarObj.Set_02.alpha = 0;
							
							inventoryBarObj.Set_03.touchable = false;
							inventoryBarObj.Set_03.alpha = 0;
							
							inventoryBarObj.Set_04.touchable = false;
							inventoryBarObj.Set_04.alpha = 0;
							
							inventoryBarObj.Set_05.touchable = true;
							inventoryBarObj.Set_05.alpha = 1;
						}
					}
					
					else if(targ == detailImage){
//					if(targ == detailBg){
						if(hit_Detail.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							
							if(armedItem === false){
								trace("No Item");
								
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowmTwo();
								ToggleCloseUp();
							}
						}
					}
					else if(targ != inventoryBarObj.bg 
						&& targ != toggleButton 
						&& targ != inventoryBarObj.leftArrow 
						&& targ != inventoryBarObj.rightArrow
						&& targ != inventoryBarObj
				//		&& targ != DetailObj.goBack

					){
						trace("TARG: "+targ);
						trace("An Item Was Clicked");
						if(targ == armedItem){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							armedItem = false;
							detailImage.alpha = 0;
							
							InvenPuzzleFlag = null;
							inventoryBarObj["Set_0"+currentSet].removeChild(armedHighlight);
							trace("item disarmed");
							
							if(DetailLoaded === true){
								ToggleCloseUp();
							}
							
						}else{
						
							if(armedItem == item_Eyeglasses && targ == item_TinyDriver){
								trace('item_Eyeglasses Armed, item_Marcasite Clicked');
								
								ChangeInventoryItem(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Lens,
									'item_Lens',
									'inven_lens_sm',
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_TinyDriver,
									'item_TinyDriver'
								);
								
								removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_Eyeglasses,
									"item_Eyeglasses"
								);
								var PuzzleSaveArry:Array = new Array();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
									PuzzleSaveArry = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle;
								}
								PuzzleSaveArry['lens'] = 'yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('InvenPuzzle',PuzzleSaveArry);
								
								armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Lens;
								ArmItem();
								
								
							}
							else if(armedItem == item_TinyDriver && targ == item_Eyeglasses){
								
								ChangeInventoryItem(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Lens,
									'item_Lens',
									'inven_lens_sm',
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Eyeglasses,
									'item_Eyeglasses'
								);
								
								
								
								removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_TinyDriver,
									"item_TinyDriver"
								);
								var PuzzleSaveArry:Array = new Array();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
									PuzzleSaveArry = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle;
								}
								PuzzleSaveArry['lens'] = 'yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('InvenPuzzle',PuzzleSaveArry);
								
								armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Lens;
								ArmItem();
								
								
							}
							
							
							else if(armedItem == item_Cell && targ == item_InjectorFull){
								trace('armedItem == item_Ribbon && targ == item_TorchStick');
								
								ChangeInventoryItem(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CellFull,
									'item_CellFull',
									'inven_cellFull_sm',
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_InjectorFull,
									'item_InjectorFull'
								);
								
								removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_Cell,
									"item_Cell"
								);
								var PuzzleSaveArry:Array = new Array();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
									PuzzleSaveArry = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle;
								}
								PuzzleSaveArry['injector'] = 'yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('InvenPuzzle',PuzzleSaveArry);
								
								armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CellFull;
								ArmItem();
							}else if(armedItem == item_InjectorFull && targ == item_Cell){
								trace('armedItem == item_TorchStick && targ == item_Ribbon');
								ChangeInventoryItem(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CellFull,
									'item_CellFull',
									'inven_cellFull_sm',
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Cell,
									'item_Cell'
								);
								removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_InjectorFull,
									"item_InjectorFull"
								);
								var PuzzleSaveArry:Array = new Array();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
									PuzzleSaveArry = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle;
								}
								PuzzleSaveArry['injector'] = 'yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('InvenPuzzle',PuzzleSaveArry);
								
								armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CellFull;
								ArmItem();
							}
							/*
							else if(armedItem == item_Jug && targ == item_K2SO){
								trace('armedItem == item_Ribbon && targ == item_TorchStick');
								
								ChangeInventoryItem(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CausticJug,
									'item_CausticJug',
									'inven_causticJug_sm',
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_K2SO,
									'item_K2SO'
								);
								
								removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_Jug,
									"item_Jug"
								);
								var PuzzleSaveArry:Array = new Array();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
									PuzzleSaveArry = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle;
								}
								PuzzleSaveArry['causticJug'] = 'yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('InvenPuzzle',PuzzleSaveArry);
								
								armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CausticJug;
								ArmItem();
							}else if(armedItem == item_K2SO && targ == item_Jug){
								trace('armedItem == item_TorchStick && targ == item_Ribbon');
								ChangeInventoryItem(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CausticJug,
									'item_CausticJug',
									'inven_causticJug_sm',
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Jug,
									'item_Jug'
								);
								removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_K2SO,
									"item_K2SO"
								);
								var PuzzleSaveArry:Array = new Array();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
									PuzzleSaveArry = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle;
								}
								PuzzleSaveArry['causticJug'] = 'yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('InvenPuzzle',PuzzleSaveArry);
								
								armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CausticJug;
								ArmItem();
							}
							
							/////////////////////////////////////////////
								
							else if(armedItem == item_Wires && targ == item_Potatoes){
								trace('armedItem == item_Jug && targ == item_K2SO');
								
								ChangeInventoryItem(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PotatoesWired,
									'item_PotatoesWired',
									'inven_potatoesWired_sm',
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Potatoes,
									'item_Potatoes'
								);
								
								removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_Wires,
									"item_Wires"
								);
								var PuzzleSaveArry:Array = new Array();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
									PuzzleSaveArry = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle;
								}
								PuzzleSaveArry['PotatoesWired'] = 'yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('InvenPuzzle',PuzzleSaveArry);
								
								armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PotatoesWired;
								ArmItem();
							}else if(armedItem == item_Potatoes && targ == item_Wires){
								trace('armedItem == item_K2SO && targ == item_Jug');
								ChangeInventoryItem(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PotatoesWired,
									'item_PotatoesWired',
									'inven_potatoesWired_sm',
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Wires,
									'item_Wires'
								);
								removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_Potatoes,
									"item_Potatoes"
								);
								var PuzzleSaveArry:Array = new Array();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
									PuzzleSaveArry = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle;
								}
								PuzzleSaveArry['PotatoesWired'] = 'yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('InvenPuzzle',PuzzleSaveArry);
								
								armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PotatoesWired;
								ArmItem();
							}
							
							
							
								/////////////////////////////////////////////
								
							else if(armedItem == item_Glass && targ == item_Slime){
								trace('armedItem == item_Wires && targ == item_Potatoes');
								
								ChangeInventoryItem(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Slide,
									'item_Slide',
									'inven_slide_sm',
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Slime,
									'item_Slime'
								);
								
								removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_Glass,
									"item_Glass"
								);
								var PuzzleSaveArry:Array = new Array();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
									PuzzleSaveArry = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle;
								}
								PuzzleSaveArry['SlideMade'] = 'yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('InvenPuzzle',PuzzleSaveArry);
								
								armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Slide;
								ArmItem();
							}else if(armedItem == item_Slime && targ == item_Glass){
								trace('armedItem == item_Potatoes && targ == item_Wires');
								ChangeInventoryItem(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Slide,
									'item_Slide',
									'inven_slide_sm',
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Glass,
									'item_Glass'
								);
								removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_Slime,
									"item_Slime"
								);
								var PuzzleSaveArry:Array = new Array();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
									PuzzleSaveArry = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle;
								}
								PuzzleSaveArry['SlideMade'] = 'yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('InvenPuzzle',PuzzleSaveArry);
								
								armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Slide;
								ArmItem();
							}
							
								/////////////////////////////////////////////
								
							else if(armedItem == item_Hose && targ == item_Alcohol){
								trace('armedItem == item_Glass && targ == item_Slime');
								
								ChangeInventoryItem(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_HoseClean,
									'item_HoseClean',
									'inven_hoseClean_sm',
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Alcohol,
									'item_Alcohol'
								);
								
								removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_Hose,
									"item_Hose"
								);
								var PuzzleSaveArry:Array = new Array();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
									PuzzleSaveArry = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle;
								}
								PuzzleSaveArry['HoseCleaned'] = 'yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('InvenPuzzle',PuzzleSaveArry);
								
								armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_HoseClean;
								ArmItem();
							}else if(armedItem == item_Alcohol && targ == item_Hose){
								trace('armedItem == item_Slime && targ == item_Glass');
								ChangeInventoryItem(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_HoseClean,
									'item_HoseClean',
									'inven_hoseClean_sm',
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Hose,
									'item_Hose'
								);
								removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_Alcohol,
									"item_Alcohol"
								);
								var PuzzleSaveArry:Array = new Array();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle != undefined){
									PuzzleSaveArry = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.InvenPuzzle;
								}
								PuzzleSaveArry['HoseCleaned'] = 'yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('InvenPuzzle',PuzzleSaveArry);
								
								armedItem = (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_HoseClean;
								ArmItem();
							}
							
							*/
							//////////////////////////////////////////////
							else{
								
								armedHighlight.x= targ.x;
								armedItem = targ;
								ArmItem();
								
							}

						//	armedHighlight.x= targ.x;
						//	armedItem = targ;
						//	ArmItem();
						}
						// Added 6/5/2015
					//	ArmItem();
					/*	armedHighlight.x= targ.x;
						armedItem = targ;
						ArmItem();
						*/
					}
					
					
				//	trace("hitTest: "+hitTest(new Point(touches[0].globalX, touches[0].globalY)));
					else if(targ as Sprite == inventoryBarObj){
						trace("Iven Bar Click "+inventoryBarObj);
					}
				
				}
			}
		}
		
		public function ArmItem():void{
		
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			
		//	public var item_Jar:Image;
		//	public var item_LabTongs:Image;
		//	public var item_LabTongsJar:Image;		
		//	if(armedItem == 'item_Jar'){
		//		InvenPuzzleFlag = 'item_LabTongs';
		//	}
		//	else if(armedItem == 'item_LabTongs'){
		//		InvenPuzzleFlag = 'item_Jar';
		//	}
			
			if(armedItem == 'item_TinyDriver'){
				InvenPuzzleFlag = 'item_EyeGlasses';
			}
			else if(armedItem == 'item_Eyeglasses'){
				InvenPuzzleFlag = 'item_TinyDriver';
			}
			
			else if(armedItem == 'item_Cell'){
				InvenPuzzleFlag = 'item_InjectorFull';
			}
			else if(armedItem == 'item_InjectorFull'){
				InvenPuzzleFlag = 'item_Cell';
			}
			/*
			else if(armedItem == 'item_Jug'){
				InvenPuzzleFlag = 'item_K2SO';
			}
			else if(armedItem == 'item_K2SO'){
				InvenPuzzleFlag = 'item_Jug';
			}
			
			else if(armedItem == 'item_Potatoes'){
				InvenPuzzleFlag = 'item_Wires';
			}
			else if(armedItem == 'item_Wires'){
				InvenPuzzleFlag = 'item_Potatoes';
			}
			
			else if(armedItem == 'item_Slime'){
				InvenPuzzleFlag = 'item_Glass';
			}
			else if(armedItem == 'item_Glass'){
				InvenPuzzleFlag = 'item_Slime';
			}
			
			else if(armedItem == 'item_Hose'){
				InvenPuzzleFlag = 'item_Alcohol';
			}
			else if(armedItem == 'item_Alcohol'){
				InvenPuzzleFlag = 'item_Hose';
			}
			
			armedItem == item_Potatoes && targ == item_Wires
			item_Jug
			item_CausticJug
			item_K2SO
			*/
			
			/*
			if(armedItem == item_GreenTestTube){
				InvenPuzzleFlag = 'item_TubeGreen';
			}
			if(armedItem == item_TubeGreen){
				InvenPuzzleFlag = 'item_GreenTestTube';
			}
			*/
			trace("Armed Item: "+targ);
			inventoryBarObj["Set_0"+currentSet].addChildAt(armedHighlight,0);
			ChangeDetail();
			if(DetailLoaded === true){
				DetailObj.ChangeImageDetail();
			}
		}
		
		public function ToggleCloseUp():void{
			trace("Item is Armed");
			if(DetailLoaded === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.HideReadOut();
				if(DetailObj.animating === false){
					DetailObj.animating = true;
					DetailObj.alpha = 0;
					this.addChildAt(DetailObj,0);
					trace("Detail is False;");
					DetailLoaded = true;
					DetailObj.ChangeImageDetail();
					DetailObj.ReadOutReturns();
					DetailObjTween = new Tween(DetailObj,0.5,Transitions.LINEAR);
					DetailObjTween.fadeTo(1);
					DetailObjTween.onComplete = function():void{
						DetailObj.animating = false;
						
					};
					Starling.juggler.add(DetailObjTween);
					//	closeUpSprite.alpha = 1;
				}
			}else{
				if(DetailObj.animating === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.HideReadOut();
					DetailObj.animating = true;
					DetailLoaded = false;
					
					DetailObjTween = new Tween(DetailObj,0.5,Transitions.LINEAR);
					DetailObjTween.fadeTo(0);
					DetailObjTween.onComplete = function():void{
						removeChild(DetailObj);
						DetailObj.animating = false;
					};
					Starling.juggler.add(DetailObjTween);
					
					
					trace("Detail is true;");
					//	closeUpSprite.alpha = 0;
				}
			}
			
		}
		
		private function ChangeDetail():void{
			
			trace('DETAIL DETAIL');
			trace("ArMeD iTeM:"+ armedItem);
			
			/*
			public var item_Celtic:Image;
			public var item_Compass:Image;
			public var item_Piggy:Image;
			public var item_Puller:Image;
			*/
			
			if(armedItem == item_FuseRed){
				trace("item_FuseRed:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_fuseRed_sm');
			}else if(armedItem == item_FuseGreen){
				trace("item_FuseGreen:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_fuseGreen_sm');
			}else if(armedItem == item_FuseBlue){
				trace("item_FuseBlue:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_fuseBlue_sm');
			}else if(armedItem == item_Chains){
				trace("item_Chains:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_chains_sm');
			}else if(armedItem == item_SprayCan){
				trace("item_SprayCan:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_sprayCan_sm');
			}else if(armedItem == item_PaperTowels){
				trace("item_PaperTowels:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_paperTowels_sm');
			}else if(armedItem == item_Eyeglasses){
				trace("item_Eyeglasses:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_eyeglasses_sm');
			}else if(armedItem == item_Stick){
				trace("item_Stick:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_stick_sm');
			}else if(armedItem == item_CarKeys){
				trace("item_CarKeys:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_carKeys_sm');
			}else if(armedItem == item_KeyCard){
				trace("item_KeyCard:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_keyCard_sm');
			}else if(armedItem == item_Knob){
				trace("item_Knob:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_knob_sm');
			}else if(armedItem == item_AllenWrench){
				trace("item_AllenWrench:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_allenWrench_sm');
			}else if(armedItem == item_Splat){
				trace("item_Splat:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_splat_sm');
			}else if(armedItem == item_Controller){
				trace("item_Controller:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_controller_sm');
			}else if(armedItem == item_Screwdriver){
				trace("item_Screwdriver:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_screwdriver_sm');
			}else if(armedItem == item_SmallKey){
				trace("item_SmallKey:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_smallKey_sm');
			}else if(armedItem == item_CubeDamage){
				trace("item_CubeDamage:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_cubeDamage_sm');
			}else if(armedItem == item_Cube){
				trace("item_Cube"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_cube_sm');
			}else if(armedItem == item_Iodine){
				trace("item_Iodine:"+ armedItem);
				detailImage.texture = this.assets.getTexture('inven_iodine_sm');
			}else if(armedItem == item_SampleTweezers){
				trace("item_SampleTweezers:"+ item_SampleTweezers);
				detailImage.texture = this.assets.getTexture('inven_sampleTweezers_sm');
			}else if(armedItem == item_Claw){
				trace("item_Claw:"+ item_Claw);
				detailImage.texture = this.assets.getTexture('inven_claw_sm');
			}else if(armedItem == item_Cord){
				trace("item_Cord:"+ item_Cord);
				detailImage.texture = this.assets.getTexture('inven_cord_sm');
			}else if(armedItem == item_HDD){
				trace("item_HDD:"+ item_HDD);
				detailImage.texture = this.assets.getTexture('inven_hdd_sm');
			}else if(armedItem == item_KomaDial){
				trace("item_KomaDial:"+ item_KomaDial);
				detailImage.texture = this.assets.getTexture('inven_komaDial_sm');
			}else if(armedItem == item_PowerSupply){
				trace("item_PowerSupply:"+ item_PowerSupply);
				detailImage.texture = this.assets.getTexture('inven_powerSupply_sm');
			}else if(armedItem == item_Eggplant){
				trace("item_Eggplant:"+ item_Eggplant);
				detailImage.texture = this.assets.getTexture('inven_eggplant_sm');
			}else if(armedItem == item_PushBox){
				trace("item_PushBox:"+ item_PushBox);
				detailImage.texture = this.assets.getTexture('inven_pushBox_sm');
			}else if(armedItem == item_BookClarke){
				trace("item_BookClarke:"+ item_BookClarke);
				detailImage.texture = this.assets.getTexture('inven_bookClarke_sm');
			}else if(armedItem == item_Tongs){
				trace("item_Tongs:"+ item_Tongs);
				detailImage.texture = this.assets.getTexture('inven_tongs_sm');
			}else if(armedItem == item_Orb){
				trace("item_Orb:"+ item_Orb);
				detailImage.texture = this.assets.getTexture('inven_orb_sm');
			}else if(armedItem == item_Drill){
				trace("item_Drill:"+ item_Drill);
				detailImage.texture = this.assets.getTexture('inven_drill_sm');
			}else if(armedItem == item_Metal){
				trace("item_Metal:"+ item_Metal);
				detailImage.texture = this.assets.getTexture('inven_metal_sm');
			}else if(armedItem == item_BoltCutters){
				trace("item_BoltCutters:"+ item_BoltCutters);
				detailImage.texture = this.assets.getTexture('inven_boltCutters_sm');
			}else if(armedItem == item_GasMask){
				trace("item_GasMask:"+ item_GasMask);
				detailImage.texture = this.assets.getTexture('inven_gasMask_sm');
			}else if(armedItem == item_StoneOne){
				trace("item_StoneOne:"+ item_StoneOne);
				detailImage.texture = this.assets.getTexture('inven_stoneOne_sm');
				//item_StoneTwo
			}else if(armedItem == item_StoneTwo){
				trace("item_StoneTwo:"+ item_StoneTwo);
				detailImage.texture = this.assets.getTexture('inven_stoneTwo_sm');
				//item_StoneTwo
			}else if(armedItem == item_Ethernet){
				trace("item_Ethernet:"+ item_Ethernet);
				detailImage.texture = this.assets.getTexture('inven_ethernet_sm');
			}else if(armedItem == item_Jar){
				trace("item_Jar:"+ item_Jar);
				detailImage.texture = this.assets.getTexture('inven_jar_sm');
			}else if(armedItem == item_JarFull){
				trace("item_JarFull:"+ item_JarFull);
				detailImage.texture = this.assets.getTexture('inven_jarFull_sm');	
				
			}else if(armedItem == item_JarFullRock){
				trace("item_JarFullRock:"+ item_JarFullRock);
				detailImage.texture = this.assets.getTexture('inven_jarFullRock_sm');		
				
			}else if(armedItem == item_JarFullIodine){
				trace("item_JarFullIodine:"+ item_JarFullIodine);
				detailImage.texture = this.assets.getTexture('inven_jarFullIodine_sm');		
				
			}else if(armedItem == item_JarFullRockIodine){
				trace("item_JarFullRockIodine:"+ item_JarFullRockIodine);
				detailImage.texture = this.assets.getTexture('inven_jarFullRockIodine_sm');		
				
			}else if(armedItem == item_JarRock){
				trace("item_JarRock:"+ item_JarRock);
				detailImage.texture = this.assets.getTexture('inven_jarRock_sm');	
				
			}else if(armedItem == item_JarRockIodine){
				trace("item_JarRockIodine:"+ item_JarRockIodine);
				detailImage.texture = this.assets.getTexture('inven_jarRockIodine_sm');	
				
			}else if(armedItem == item_JarIodine){
				trace("item_JarIodine:"+ item_JarIodine);
				detailImage.texture = this.assets.getTexture('inven_jarIodine_sm');	
				
				
			}else if(armedItem == item_LabTongs){
				trace("item_LabTongs:"+ item_LabTongs);
				detailImage.texture = this.assets.getTexture('inven_labTongs_sm');
			
				//item_JarFull
		//	}else if(armedItem == item_LabTongsJar){
		//		trace("item_LabTongsJar:"+ item_LabTongsJar);
		//		detailImage.texture = this.assets.getTexture('inven_labTongsJar_sm');
		//	}else if(armedItem == item_LabTongsAcid){
		//		trace("item_LabTongsAcid:"+ item_LabTongsAcid);
		//		detailImage.texture = this.assets.getTexture('inven_labTongsAcid_sm');
			}else if(armedItem == item_SamplePipette){
				trace("item_SamplePipette:"+ item_SamplePipette);
				detailImage.texture = this.assets.getTexture('inven_samplePipette_sm');
			}else if(armedItem == item_BookAsimov){
				trace("item_BookAsimov:"+ item_BookAsimov);
				detailImage.texture = this.assets.getTexture('inven_bookAsimov_sm');
			}else if(armedItem == item_Chisel){
				trace("item_Chisel:"+ item_Chisel);
				detailImage.texture = this.assets.getTexture('inven_chisel_sm');
			}else if(armedItem == item_BookSagan){
				trace("item_BookSagan:"+ item_BookSagan);
				detailImage.texture = this.assets.getTexture('inven_bookSagan_sm');
			}else if(armedItem == item_BookHeinlein){
				trace("item_BookHeinlein:"+ item_BookHeinlein);
				detailImage.texture = this.assets.getTexture('inven_bookHeinlein_sm');
			}else if(armedItem == item_TubeEmpty){
				trace("item_TubeEmpty:"+ item_TubeEmpty);
				detailImage.texture = this.assets.getTexture('inven_tubeEmpty_sm');
			}else if(armedItem == item_TubeBlue){
				trace("item_TubeBlue:"+ item_TubeBlue);
				detailImage.texture = this.assets.getTexture('inven_tubeBlue_sm');
			}else if(armedItem == item_TubeRed){
				trace("item_TubeRed:"+ item_TubeRed);
				detailImage.texture = this.assets.getTexture('inven_tubeRed_sm');
			}else if(armedItem == item_Injector){
				trace("item_Injector:"+ item_Injector);
				detailImage.texture = this.assets.getTexture('inven_injector_sm');
			}else if(armedItem == item_InjectorFull){
				trace("item_InjectorFull:"+ item_InjectorFull);
				detailImage.texture = this.assets.getTexture('inven_injectorFull_sm');
				
			//item_InjectorFull
			}else if(armedItem == item_DNAJar){
				trace("item_DNAJar:"+ item_DNAJar);
				detailImage.texture = this.assets.getTexture('inven_dnaJar_sm');
			}else if(armedItem == item_DNAJar){
				trace("item_StoneThree:"+ item_StoneThree);
				detailImage.texture = this.assets.getTexture('inven_stoneThree_sm');
			}else if(armedItem == item_Cell){
				trace("item_Cell:"+ item_Cell);
				detailImage.texture = this.assets.getTexture('inven_cell_sm');
			}else if(armedItem == item_CellFull){
				trace("item_CellFull:"+ item_CellFull);
				detailImage.texture = this.assets.getTexture('inven_cellFull_sm');
				
			}else if(armedItem == item_RedRock){
				trace("item_RedRock:"+ item_RedRock);
				detailImage.texture = this.assets.getTexture('inven_redRock_sm');
			}else if(armedItem == item_CoffeePot){
				trace("item_CoffeePot:"+ item_CoffeePot);
				detailImage.texture = this.assets.getTexture('inven_coffeePot_sm');
				
			}else if(armedItem == item_CoffeePotFull){
				trace("item_CoffeePotFull:"+ item_CoffeePotFull);
				detailImage.texture = this.assets.getTexture('inven_coffeePotFull_sm');
			}else if(armedItem == item_BottleG){
				trace("item_BottleG:"+ item_BottleG);
				detailImage.texture = this.assets.getTexture('inven_bottleG_sm');
			}else if(armedItem == item_BottleC){
				trace("item_BottleC:"+ item_BottleC);
				detailImage.texture = this.assets.getTexture('inven_bottleC_sm');
			}else if(armedItem == item_TestTube){
				trace("item_TestTube:"+ item_TestTube);
				detailImage.texture = this.assets.getTexture('inven_testTube_sm');
			}else if(armedItem == item_TestTubeHalf){
				trace("item_TestTubeHalf:"+ item_TestTubeHalf);
				detailImage.texture = this.assets.getTexture('inven_testTubeHalf_sm');	
				//item_TestTubeHalf
			}else if(armedItem == item_Crowbar){
				trace("item_Crowbar:"+ item_Crowbar);
				detailImage.texture = this.assets.getTexture('inven_crowbar_sm');
			}else if(armedItem == item_Handler){
				trace("item_Handler:"+ item_Handler);
				detailImage.texture = this.assets.getTexture('inven_handler_sm');
			}else if(armedItem == item_HandlerCup){
				trace("item_HandlerCup:"+ item_HandlerCup);
				detailImage.texture = this.assets.getTexture('inven_handlerCup_sm');
			}else if(armedItem == item_PearlRed){
				trace("item_PearlRed:"+ item_PearlRed);
				detailImage.texture = this.assets.getTexture('inven_pearlRed_sm');
			}else if(armedItem == item_PearlBlue){
				trace("item_PearlBlue:"+ item_PearlBlue);
				detailImage.texture = this.assets.getTexture('inven_pearlBlue_sm');
			}else if(armedItem == item_PearlGreen){
				trace("item_PearlGreen:"+ item_PearlGreen);
				detailImage.texture = this.assets.getTexture('inven_pearlGreen_sm');
			}else if(armedItem == item_SampleNails){
				trace("item_SampleNails:"+ item_SampleNails);
				detailImage.texture = this.assets.getTexture('inven_sampleNails_sm');
			}else if(armedItem == item_TinyDriver){
				trace("item_TinyDriver:"+ item_TinyDriver);
				detailImage.texture = this.assets.getTexture('inven_tinyDriver_sm');
			}else if(armedItem == item_Lens){
				trace("item_Lens:"+ item_Lens);
				detailImage.texture = this.assets.getTexture('inven_lens_sm');
			}else if(armedItem == item_Syringe){
				trace("item_Syringe:"+ item_Syringe);
				detailImage.texture = this.assets.getTexture('inven_syringe_sm');
			}else if(armedItem == item_SyringeFull){
				trace("item_SyringeFull:"+ item_SyringeFull);
				detailImage.texture = this.assets.getTexture('inven_syringeFull_sm');
			}else if(armedItem == item_Slide){
				trace("item_Slide:"+ item_Slide);
				detailImage.texture = this.assets.getTexture('inven_slide_sm');
			}else if(armedItem == item_Hand){
				trace("item_Hand:"+ item_Hand);
				detailImage.texture = this.assets.getTexture('inven_hand_sm');
			}
			
			
		
			/*
			item_Hand
			item_Slide
			public var item_Syringe:Image;
			public var item_SyringeFull:Image;
			item_Lens
			public var item_SampleNails:Image;
			public var item_TinyDriver:Image;
			public var item_PearlBlue:Image;
			
			item_PearlRed
			item_HandlerCup
			public var item_Crowbar:Image;
			public var item_Handler:Image;
			item_CellFull
			item_TestTube
			public var item_BottleG:Image;
			public var item_BottleC:Image;
			
			public var item_CoffeePot:Image;
			public var item_CoffeePotFull:Image;
			item_RedRock
			item_Cell
			public var item_Injector:Image;
			public var item_DNAJar:Image;
			public var item_StoneThree:Image;
			item_TubeRed
			item_TubeEmpty
			item_BookHeinlein
			item_BookSagan
			item_Chisel
			item_BookAsimov
			public var item_Jar:Image;
			public var item_LabTongs:Image;
			public var item_LabTongsJar:Image;
			public var item_LabTongsAcid:Image;
			public var item_SamplePipette:Image;
			
			item_Metal
			item_Ethernet
			public var item_GasMask:Image;
			public var item_StoneOne:Image;
			item_BoltCutters
			item_Drill
			public var item_Tongs:Image;
			public var item_Orb:Image;
			item_BookClarke
			item_PushBox
			item_Eggplant
			item_PowerSupply
			item_KomaDial
			item_HDD
			item_Cord
			item_Claw
			item_CubeDamage
			item_SmallKey
			public var item_Splat:Image;
			public var item_Controller:Image;
			public var item_Screwdriver:Image;
			
	
			*/
			detailImage.alpha = 1;

			
		}
		
		public function addBook():void{
			
		}

		
		public function toggleInvetory():void{
			/*
			Move the inventory bar in/out of view
			*/
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InvenOpen();
			if(ToggleBar === false){
				toggleButton.texture = this.assets.getTexture('invenToggleOpen_v003a001');
				game.screenGamePlayHandler.NoteBookObj.ShowButton(ToggleBar);
				ToggleBar = true;
				
				ToggleBarTween = new Tween(inventoryBarObj,0.25,Transitions.LINEAR);
				ToggleBarTween.animate("y",424);
				ToggleBarTween.onComplete = null;
				
				
//				noteBookTween = new Tween(noteBookButton,0.25,Transitions.LINEAR);
//				noteBookTween.animate("y",345);
//				noteBookTween.onComplete = null;
				
				
//				Starling.juggler.add(noteBookTween);
				Starling.juggler.add(ToggleBarTween);
				
			}else{
				toggleButton.texture = this.assets.getTexture('invenToggleClosed_v003a001');
				game.screenGamePlayHandler.NoteBookObj.ShowButton(ToggleBar);
				game.screenGamePlayHandler.NoteBookObj.ToggleNoteBook(true);
				ToggleBar = false;
				
				ToggleBarTween = new Tween(inventoryBarObj,0.25,Transitions.LINEAR);
				ToggleBarTween.animate("y",512);
				ToggleBarTween.onComplete = null;
				
//				noteBookTween = new Tween(noteBookButton,0.25,Transitions.LINEAR);
//				noteBookTween.animate("y",400);
//				noteBookTween.onComplete = null;
				
//				Starling.juggler.add(noteBookTween);
				Starling.juggler.add(ToggleBarTween);
				
			}
				//	toggleButton.readjustSize();
			this.addChild(toggleButton);
		}
		
	}
}