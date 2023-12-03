package screens.inventory
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	import screens.ingamescreens.Cave;
	
	import starling.display.Image;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;
	
	public class InventoryDetail extends Sprite
	{
		private var assets:AssetManager;
		public var bg:Shape;
		public var LargeDetailImage:Image;
		public var hit_area:Shape;
		private var touches:Vector.<Touch>;
		private var targ:Object;	
		private var goback:GoBackButton;
		
		public var animating:Boolean = false;
		
		public function InventoryDetail(_assets:AssetManager)
		{
			super();
			this.assets = _assets;
			/*
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v001.png'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v001.xml'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v002.png'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v002.xml'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v003.png'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v003.xml'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v004.png'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v004.xml'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v005.png'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v005.xml'));
			*/
			//this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/IntroSequence'));
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					//		(stage.getChildAt(0) as Object).screenGamePlayHandler.hud.toggleGoBack(FrontDoorObj,true);
					onLoadAssets();

				}				
			});	
			
		}
		
		
		private function onLoadAssets():void{
			
			
			CreateBg();
			
			LargeDetailImage = new Image(this.assets.getTexture('inven_detail_carKeys'));	
			LargeDetailImage.width = 400;
			LargeDetailImage.height = 390;
			LargeDetailImage.x = 160;
			LargeDetailImage.y = 0;
			LargeDetailImage.touchable = false;
			this.addChild(LargeDetailImage);
			CreateAreaHit();
			goback = new GoBackButton(this.assets);	
			this.addChild(goback);
			this.addEventListener(TouchEvent.TOUCH,OnClickHandler);
			
		}
		private function OnClickHandler(e:TouchEvent):void{
			targ = e.target;
			
			touches = e.getTouches(this);
			if (touches.length > 0){
				if (touches[0].phase == TouchPhase.BEGAN) {
					if(targ == goback.SourceImage){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowmTwo();
						trace("GoBackClick");
						e.stopPropagation();
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ToggleCloseUp();
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.HideReadOut();
						
					}else if(hit_area.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						trace(touches[0].globalX+", "+touches[0].globalY);
						e.stopPropagation();
						
						if(animating === false){
							ReadOutReturns();
						}else{
							
						}
					}else if(bg.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowmTwo();
						trace("GoBackClick");
						e.stopPropagation();
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ToggleCloseUp();
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.HideReadOut();
						//	trace('BG CLIK');
					/*	trace(touches[0].globalX+", "+touches[0].globalY);
						e.stopPropagation();
						
						if(animating === false){
							ReadOutReturns();
						}else{
							
						}
					*/
					}
					
				}
			}
		}		
		public function ChangeImageDetail():void{
			trace(" "+this.parent);
			trace("PARENT ARMED ITEM: "+this.parent["armedItem"]);


			
			if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_FuseRed){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_fuseRed');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_FuseGreen){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_fuseGreen');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_FuseBlue){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_fuseBlue');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Chains){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_chains');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_SprayCan){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_sprayCan');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_PaperTowels){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_paperTowels');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Eyeglasses){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_eyeglasses');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Stick){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_stick');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_CarKeys){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_carKeys');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_KeyCard){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_keyCard');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Knob){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_knob');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_AllenWrench){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_allenWrench');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Splat){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_splat');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Controller){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_controller');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Screwdriver){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_screwdriver');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_SmallKey){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_smallKey');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_CubeDamage){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_cubeDamage');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Cube){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_cube');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Iodine){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_iodine');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_SampleTweezers){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_sampleTweezers');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Claw){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_claw');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Cord){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_cord');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_HDD){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_hdd');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_KomaDial){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_komaDial');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_PowerSupply){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_powerSupply');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Eggplant){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_eggplant');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_PushBox){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_pushBox');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BookClarke){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_bookClarke');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Tongs){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_tongs');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Orb){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_orb');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Drill){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_drill');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Metal){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_metal');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BoltCutters){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_boltCutters');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_GasMask){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_gasMask');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_StoneOne){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_stoneOne');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Ethernet){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_ethenet');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
		
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_LabTongs){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_labTongs');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Jar){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_jar');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;	
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarFull){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_jarFull');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;	
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarFullRock){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_jarFullRock');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;	
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarFullIodine){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_jarFullIodine');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;	
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarFullRockIodine){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_jarFullRockIodine');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;	
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarRock){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_jarRock');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;		
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarRockIodine){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_jarRockIodine');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;	
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarIodine){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_jarIodine');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;	
				
				//item_JarFull
	//		}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_LabTongsJar){
	//			LargeDetailImage.texture = this.assets.getTexture('inven_detail_labTongsJar');
	//			LargeDetailImage.x = 110;
	//			LargeDetailImage.y = 30;
	//			LargeDetailImage.width = 256*2;
	//			LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_SamplePipette){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_samplePipette');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
//			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_LabTongsAcid){
//				LargeDetailImage.texture = this.assets.getTexture('inven_detail_labTongsAcid');
//				LargeDetailImage.x = 110;
//				LargeDetailImage.y = 30;
//				LargeDetailImage.width = 256*2;
//				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BookAsimov){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_bookAsimov');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Chisel){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_chisel');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BookSagan){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_bookSagan');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BookHeinlein){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_bookHeinlein');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_TubeEmpty){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_tubeEmpty');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_StoneTwo){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_stoneTwo');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_TubeBlue){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_tubeBlue');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_TubeRed){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_tubeRed');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Injector){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_injector');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_InjectorFull){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_injectorFull');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			//item_InjectorFull
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_DNAJar){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_dnaJar');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_StoneThree){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_stoneThree');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Cell){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_cell');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_CellFull){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_cellFull');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;	
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_RedRock){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_redRock');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_CoffeePot){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_coffeePot');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_CoffeePotFull){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_coffeePotFull');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BottleG){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_bottleG');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BottleC){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_bottleC');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BottleC){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_bottleC');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_TestTube){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_testTube');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_TestTubeHalf){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_testTubeHalf');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;	
				//item_TestTubeHalf
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Crowbar){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_crowbar');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Handler){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_handler');
				LargeDetailImage.x = 110;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 256*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_HandlerCup){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_handlerCup');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_PearlRed){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_pearlRed');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_PearlBlue){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_pearlBlue');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_SampleNails){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_sampleNails');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_TinyDriver){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_tinyDriver');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Lens){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_lens');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Syringe){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_syringe');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_SyringeFull){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_syringeFull');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Slide){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_slide');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_PearlGreen){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_pearlGreen');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Hand){
				LargeDetailImage.texture = this.assets.getTexture('inven_detail_hand');
				LargeDetailImage.x = 160;
				LargeDetailImage.y = 30;
				LargeDetailImage.width = 196*2;
				LargeDetailImage.height = 196*2;
			}
			
			
			/*item_Hand
			item_PearlGreen
			item_Slide
			public var item_Syringe:Image;
			public var item_SyringeFull:Image;
			item_Lens
			public var item_SampleNails:Image;
			public var item_TinyDriver:Image;
			item_PearlBlue
			item_PearlRed
			item_HandlerCup
			public var item_Crowbar:Image;
			public var item_Handler:Image;
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BottleG){
			(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A glass bottle with a backwards 'C' printed on it. There is a transparent red liquid inside.");
			}
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
			item_TubeBlue
			item_TubeEmpty
			inven_bookHeinlein_sm
			item_BookSagan
			item_Chisel
			item_BookAsimov
			public var item_Jar:Image;
			public var item_LabTongs:Image;
			public var item_LabTongsJar:Image;
			public var item_LabTongsAcid:Image;
			public var item_SamplePipette:Image;
			
			item_Ethernet
			public var item_GasMask:Image;
			public var item_StoneOne:Image;
			item_BoltCutters
			item_Metal
			DrillHandler
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
			*/
			
			
			
		}
		
		public function ReadOutReturns():void{
			
			
			
			
			if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_FuseRed){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An electrical component, with a small screen and red stripes.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_FuseGreen){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Looks like a fuse... with a green stripe at either end.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_FuseBlue){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An electrical fuse with two blue paint strips.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Chains){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A length of strong iron chain.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_SprayCan){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A spray bottle filled with cleaning solution.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_PaperTowels){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A roll of paper towels.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Eyeglasses){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A pair of eyeglasses - one lens is broken.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Stick){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The broken mop pole, now merely a stick.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_CarKeys){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A set of car keys.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_KeyCard){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A security access card.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Knob){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A worn brass knob... too small for a door handle.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_AllenWrench){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A steel allen wrench, used for hexagonal sockets.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Splat){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The small robotic spider... now functioning.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Controller){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small PCB board with a microcontroller affixed to it.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Screwdriver){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A flat-head screwdriver.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_SmallKey){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small flat key.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_CubeDamage){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A light-weight multifaceted cube with many small holes of decreasing size. It is badly cracked and slightly warped.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Cube){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The light-weight multifaceted cube, now repaired. There seems to be an infinite series of square holes of ever decreasing size.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Iodine){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A bottle of iodine.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_SampleTweezers){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A sample glass sample jar and a pair of tweezers.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Claw){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A mechanical gripper, about a meter long.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Cord){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A cable removed from the android's leg. It's a densely packed mesh of wires coated in rubber.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_HDD){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A computer hard drive. 'ADIMM' is written in tiny letters along one side.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_KomaDial){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small discus or dial made of some type of strong polymer.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_PowerSupply){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Some sort of compact power supply. A low vibration is constantly emitting from it.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Eggplant){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An eggplant.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_PushBox){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small insertable panel with six buttons.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BookClarke){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("\"Childhood's End\" by Arthur C. Clarke. The book is nicely adorned and embossed.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Tongs){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A pair of large kitchen tongs.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Orb){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A near perfectly spherical stone with a swirling pattern all along its surface.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Drill){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A portable electric drill.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Metal){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A piece of twisted metal, bent into a u-shaped curve.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BoltCutters){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A pair of bolt cutters, made for cutting through thick pieces of metal.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_GasMask){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A gas mask. The filter attached to the front says 'NBC: Nuclear, Biological, Chemical.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_StoneOne){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A flat, slightly curved stone with areas of smooth lines. It pulsates with energy in my hands.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Ethernet){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A short purple ethernet cable.");
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_LabTongs){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A pair of forceps.");
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Jar){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A pyrex laboratory beaker, made to handle all types of substances.");	
				
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarFull){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've filled the pyrex beaker with water.'");
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarFullRock){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The pyrex beaker with water and the red metal chipped from the statue.");
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarFullIodine){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The pyrex beaker full of water and iodine.");
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarFullRockIodine){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The pyrex beaker, filled with water, iodine, and a piece of metal from the statue.");
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarRock){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The pyrex beaker and a piece of the red metal from the statue.");
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarRockIodine){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The pyrex beaker filled with iodine and a piece of the red metal from the statue.");
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_JarIodine){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The pyrex beaker filled with some iodine.");
				
			
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_SamplePipette){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small sample jar and a pipette.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BookAsimov){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("\"The Gods Themselves\" by Isaac Asimov. The book copy appears to be from a series.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Chisel){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A chisel and small hammer: the tools of an archaeologist.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BookSagan){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("\"Contact\" by Carl Sagan. A science fiction novel by a great science teacher...");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BookHeinlein){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("\"The Puppet Masters\" by Robert A. Heinlein, 1951. This copy appears to be part of an anthology...");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_TubeEmpty){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An empty glass tube with metal caps at either end. There is a small intake valve on one end.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_StoneTwo){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A flat curved stone with a smooth spiraling pattern. It emits a small vibration.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_TubeBlue){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The glass tube, now filled with a viscous blue liquid.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_TubeRed){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A glass and metal tube, filled with a strange pinkish red fluid.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Injector){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It says \"Multi-Sample Air Displacement Pipette\" on the side...");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_InjectorFull){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The multi-sample pipette, filled with bits from the chemistry experiment.");
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_DNAJar){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is strange purple substance inside the container. It appears to be sealed and pressurized...");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_StoneThree){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A curved flat stone with a smooth spiralling pattern.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Cell){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... a porcelain plate, with 66 small, self-contained areas....");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_CellFull){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The 66 sample plate, now with 66 samples of the growth from chemistry experiment.");
				
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_RedRock){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The piece of red, carbon rich, compressed metal from the statue.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_CoffeePot){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A standard coffee pot.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_CoffeePot){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The coffee pot, now full of water.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BottleG){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A glass bottle with a transparent green liquid inside, an upside down 'A' is printed on the side.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_BottleC){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A glass bottle with a backwards 'C' printed on it. There is a transparent red liquid inside.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_TestTube){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A test tube filled with the purple fluid containing DNA...");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_TestTubeHalf){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've used half of the DNA containing purple fluid...");
				
				//item_TestTubeHalf
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Crowbar){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A crowbar.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Handler){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A  pair of long metal tongs - the end is badly charred...");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_HandlerCup){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A freezing red semi-liquid substance, held by the metal tongs.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_PearlRed){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A glowing red spherical object. It hovers and emits a pulsating energy.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_PearlBlue){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A glowing blue sphere. It casts a gentle cool light.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_SampleNails){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Some finger-nail clippings, secure in a small sample jar.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Lens){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An optical glass lens, removed from the eye-glasses.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Syringe){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A large empty syringe. The needle is sharp and thick, designed to penetrate tough surfaces and membranes.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_SyringeFull){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The imposing syringe, filled with the modified glowing green subtance from the experiment...");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Slide){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A glass microscope slide with a sample of a viscous green ooze on it.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_PearlGreen){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A glowing sphere raditaing green glow. It is light weight and hums and gurgles intermittently.");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_Hand){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Err... a human hand.... it's warm...");
			}else if(this.parent["armedItem"] == (stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.inventoryBarObj.item_TinyDriver){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A very small screwdriver - usually used for eyeglasses.");
			}
			
			

		}
		
		
		private function CreateBg():void{
			bg = new Shape();
			this.addChildAt(bg,0);
			bg.graphics.beginFill(0x000000);
			bg.graphics.lineTo(0,0);	
			bg.graphics.lineTo(800,0);	
			bg.graphics.lineTo(800,512);	
			bg.graphics.lineTo(0,512);	
			bg.touchable = true;
			bg.graphics.endFill(false);
			bg.alpha = 0.5;
			//	openBookbg.graphics.precisionHitTest = true;				
			
		}
		private function CreateAreaHit():void{
			
			
			hit_area = new Shape();
			this.addChild(hit_area);
			hit_area.graphics.beginFill(0x000ff0);
			hit_area.graphics.lineTo(235,138);	
			hit_area.graphics.lineTo(310,70);	
			hit_area.graphics.lineTo(473,67);	
			hit_area.graphics.lineTo(575,165);	
			hit_area.graphics.lineTo(583,275);	
			hit_area.graphics.lineTo(495,346);	
			hit_area.graphics.lineTo(355,341);	
			hit_area.graphics.lineTo(242,280);	
		
			hit_area.touchable = true;
			hit_area.graphics.endFill(false);
			hit_area.alpha = 0.0;
			hit_area.graphics.precisionHitTest = true;	
		}
		
	}
}