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
	
	public class DeepLabDesk extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		
		private var jar:Image;
		private var jarWater:Image;
	//	private var jarRock:Image;
	//	private var jarRockWater:Image;
		private var jarPink:Image;
		
		private var lid_off:Image
		private var lid_on:Image;
		private var lid_pink:Image;
		private var cell:Image;
		private var bowl_purple:Image;
		private var bowl:Image;
		private var glass_yellow:Image;
		private var glass_twist_one:Image;
		private var glass_twist_two:Image;
		private var glass_tube:Image;
		private var glass_drip:Image;
		private var glass_black:Image;
		private var glass_purple:Image;
		private var slime:Image;
		private var slimeDrip:Image;
		private var spark:Image;
		private var fire:Image;
		private var steam:Image;
	
		
		private var hit_book:Shape;
		private var hit_cell:Shape;
		private var hit_pot:Shape;
		private var hit_jar:Shape;
		private var hit_gas:Shape;
		private var hit_lid:Shape;
		private var hit_power_supply:Shape;
		private var hit_OpenBook:Shape;
		
		private var openBookbg:Shape;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookcurrentPage:Number = 0;
		private var hit_openBookBack:Shape;
		private var hit_openBookNext:Shape;
		public var OpenBookTween:Tween;
		private var BookIsOpen:Boolean = false;
	
		private var RONum:Boolean = false;
		
		private var Animating:Boolean = false;
		
		
		private var FireTween:Tween;
	//	private var FireTween2:Tween;
		private var JarTween:Tween;
		private var LidPinkTween:Tween;
		private var TwistPinkTween:Tween;
		private var TweenOne:Tween;
		private var TweenTwo:Tween;
		private var TweenThree:Tween;	
		
		private var SteamTween:Tween;
		
		private var ElectricTweenOne:Tween;
		private var ElectricTweenTwo:Tween;
		private var SlimeTween:Tween;
		
		private var JarAttached:Boolean = false;
		private var CellPickedUp:Boolean = false;
		private var RockAttached:Boolean = false;
		private var WaterAttached:Boolean = false;
		private var IodineAttached:Boolean = false;
		
		private var LidOff:Boolean = true;

		private var RockMelted:Boolean = false;
		private var DNAAttached:Boolean = false;
		private var DNARockFried:Boolean = false;
		private var SamplePickedUp:Boolean = false;
	
		
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function DeepLabDesk(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('deepLabDesk_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DeepLabDesk/deepLabDesk_bg.jpg'));
				game.TrackAssets('deepLabDesk_01');
			}
			if(game.CheckAsset('deepLabDesk_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DeepLabDesk/DeepLabDesk_Sprite_01.png'));
				game.TrackAssets('deepLabDesk_02');
			}
			if(game.CheckAsset('deepLabDesk_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DeepLabDesk/DeepLabDesk_Sprite_01.xml'));
				game.TrackAssets('deepLabDesk_03');
			}
		/*	if(game.CheckAsset('deepLabDesk_04') === false){
			
				game.TrackAssets('deepLabDesk_04');
			}
			if(game.CheckAsset('deepLabDesk_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DeepLabDesk/DnaBook_Sprite_01.xml'));
				game.TrackAssets('deepLabDesk_05');
			}
		*/
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("DeepLabDesk","DeepLabDeskObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		//	if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
		//		SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
		//	}
			
		//	SaveArray['JarAttached'] = "Yes";
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
			
			bg = new Image(this.assets.getTexture('deepLabDesk_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			jar = new Image(this.assets.getTexture('jar_attached'));			
			jar.touchable = false;
			jar.x = 232;
			jar.y = 73;
			
			jarWater = new Image(this.assets.getTexture('jar_water'));			
			jarWater.touchable = false;
			jarWater.x = 239;
			jarWater.y = 91;
/*			
			jarRock = new Image(this.assets.getTexture('jar_rock'));			
			jarRock.touchable = false;
			jarRock.x = 239;
			jarRock.y = 91;
			
			jarRockWater = new Image(this.assets.getTexture('jar_rock_water'));			
			jarRockWater.touchable = false;
			jarRockWater.x = 239;
			jarRockWater.y = 91;
*/			
			jarPink = new Image(this.assets.getTexture('jar_pink'));			
			jarPink.touchable = false;
			jarPink.x = 239;
			jarPink.y = 91;

			/*
			
		
			private var jarWater:Image;
			private var jarRock:Image;
			private var jarRockWater:Image;
			
			*/
			
			lid_off = new Image(this.assets.getTexture('lid_off'));			
			lid_off.touchable = false;
			lid_off.x = 299;
			lid_off.y = 244;
			
			lid_on = new Image(this.assets.getTexture('lid_on'));			
			lid_on.touchable = false;
			lid_on.x = 234;
			lid_on.y = 27;
			
			lid_pink = new Image(this.assets.getTexture('lid_pink'));			
			lid_pink.touchable = false;
			lid_pink.x = 234;
			lid_pink.y = 27;
			
			cell = new Image(this.assets.getTexture('cell_plate'));			
			cell.touchable = false;
			cell.x = 221;
			cell.y = 323;
			
			bowl_purple = new Image(this.assets.getTexture('base_purple'));			
			bowl_purple.touchable = false;
			bowl_purple.x = 602;
			bowl_purple.y = 283;
			
			bowl = new Image(this.assets.getTexture('base_orange'));			
			bowl.touchable = false;
			bowl.x = 602;
			bowl.y = 283;
			
			glass_yellow = new Image(this.assets.getTexture('glass_yellow'));			
			glass_yellow.touchable = false;
			glass_yellow.x = 659;
			glass_yellow.y = 70;
			
			glass_twist_one = new Image(this.assets.getTexture('glass_twist_pink'));			
			glass_twist_one.touchable = false;
			glass_twist_one.x = 316;
			glass_twist_one.y = 12;
			
			glass_twist_two = new Image(this.assets.getTexture('glass_twist_red'));			
			glass_twist_two.touchable = false;
			glass_twist_two.x = 486;
			glass_twist_two.y = 62;
			
			glass_tube = new Image(this.assets.getTexture('glass_tube_purple'));			
			glass_tube.touchable = false;
			glass_tube.x = 436;
			glass_tube.y = 89;
			
			glass_drip = new Image(this.assets.getTexture('drip'));			
			glass_drip.touchable = false;
			glass_drip.x = 664;
			glass_drip.y = 235;

			glass_black = new Image(this.assets.getTexture('glass_black'));			
			glass_black.touchable = false;
			glass_black.x = 402;
			glass_black.y = 254;
			
			glass_purple = new Image(this.assets.getTexture('glass_purple'));			
			glass_purple.touchable = false;
			glass_purple.x = 486;
			glass_purple.y = 255;
			
			slime = new Image(this.assets.getTexture('purpleSlime'));			
			slime.touchable = false;
			slime.x = 600;
			slime.y = 210;
			
			slimeDrip = new Image(this.assets.getTexture('purpleSlimeDrip'));			
			slimeDrip.touchable = false;
			slimeDrip.x = 488;
			slimeDrip.y = 360;
			
			spark = new Image(this.assets.getTexture('spark'));			
			spark.touchable = false;
			spark.x = 600;
			spark.y = 255;
			
			fire = new Image(this.assets.getTexture('fire'));			
			fire.touchable = false;
			fire.x = 232;
			fire.y = 139;
			
			steam = new Image(this.assets.getTexture('steam'));			
			steam.touchable = false;
			steam.x = 52;
			steam.y = 0;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				trace("HOUSE 00");
				//SamplePickedUp
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['SamplePickedUp'] == 'Yes'){	
					SamplePickedUp = true;
				}			
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['DNARockFried'] == 'Yes'){	
					DNARockFried = true;
				}				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['DNAAttached'] == 'Yes'){	
					DNAAttached = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['RockMelted'] == 'Yes'){	
					RockMelted = true;
				}				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['JarAttached'] == 'Yes'){	
					trace("HOUSE 01");
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['WaterAttached'] == 'Yes'){	
						trace("HOUSE 02");
						WaterAttached = true;
						JarAttached = true;
				//		jar.alpha = 1;
				//		jarWater.alpha = 1;						
					}else{
						JarAttached = true;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['IodineAttached'] == 'Yes'){	
						IodineAttached = true;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['RockAttached'] == 'Yes'){	
						RockAttached = true;
					}
				}else{
					trace("HOUSE 04");
					jar.alpha = 0;
					jarWater.alpha = 0;					
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['Cell'] == 'PickedUp'){	
					CellPickedUp = true;
					cell.alpha = 0;
				}else{
					cell.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['Lid'] == 'On'){	
					LidOff = false;
					lid_off.alpha = 0;
					lid_on.alpha = 1;
					
				}else{
					lid_off.alpha = 1;
					lid_on.alpha = 0;
				}
			}else{
				trace("HOUSE 06");
				cell.alpha = 1;
				lid_off.alpha = 1;
				lid_on.alpha = 0;
				
				jar.alpha = 0;
				jarWater.alpha = 0;
			}
			
			if(DNARockFried === false){
				trace("SMART 00");
				slime.alpha = 0;
				slimeDrip.alpha = 0;
				if(RockMelted === false){
					trace("SMART 01");
					glass_black.alpha = 0;
					glass_purple.alpha = 0;
					if(JarAttached === true){
						trace("SMART 02");
						if(WaterAttached === true){
							trace("SMART 03");
							jar.alpha = 1;
							jarWater.alpha = 1;
							if(RockAttached === true){
								trace("SMART 04");
								if(IodineAttached === true){
									trace("SMART 05");
									jarWater.texture = this.assets.getTexture('jar_rock_water_iodine');
								}else{
									trace("SMART 06");
									jarWater.alpha = 1;
									jarWater.texture = this.assets.getTexture('jar_rock_water');
								}
							}else{
								trace("SMART 07");
								if(IodineAttached === true){
									trace("SMART 08");
									jarWater.alpha = 1;
									jarWater.texture = this.assets.getTexture('jar_water_iodine');
								}else{
									trace("SMART 09");
									jarWater.alpha = 1;
									jarWater.texture = this.assets.getTexture('jar_water');
								}
							}					
						}else{
							trace("SMART 10");
							if(RockAttached === true){
								trace("SMART 11");
								if(IodineAttached === true){
									trace("SMART 12");
									jarWater.alpha = 1;
									jarWater.texture = this.assets.getTexture('jar_rock_iodine');
								}else{
									trace("SMART 13");
									jarWater.alpha = 1;
									jarWater.texture = this.assets.getTexture('jar_rock');
								}
							}else{
								trace("SMART 14");
								if(IodineAttached === true){
									jarWater.alpha = 1;
									jarWater.texture = this.assets.getTexture('jar_iodine');
								}else{
								trace("SMART 15");
									jar.alpha = 1;
									jarWater.alpha = 0;
								}
							}	
							jar.alpha = 1;
						}
					}else{
						trace("SMART 16");
						jar.alpha = 0;
						jarWater.alpha = 0;
					}
					if(DNAAttached === true){
						trace("SMART 18");
						bowl.alpha = 0;
						bowl_purple.alpha = 1;
					}else{
						trace("SMART 19");
						bowl.alpha = 0;
						bowl_purple.alpha = 0;
					}
					
					//bowl.alpha = 0;
				//	bowl_purple.alpha = 0;
				}else{
					trace("SMART 17");
					jar.alpha = 1;
					jarWater.alpha = 0;
					glass_black.alpha = 1;
					glass_purple.alpha = 1;
					if(DNAAttached === true){
						trace("SMART 18");
						bowl.alpha = 0;
						bowl_purple.alpha = 1;
					}else{
						trace("SMART 19");
						bowl.alpha = 1;
						bowl_purple.alpha = 0;
					}
				}
			}else{
				jar.alpha = 1;
				jarWater.alpha = 0;
				trace("SMART 20");
				slime.alpha = 1;
				slimeDrip.alpha = 1;
			}
			/*
			
			private var JarAttached:Boolean = false;
			private var CellPickedUp:Boolean = false;
			private var RockAttached:Boolean = false;
			private var WaterAttached:Boolean = false;
			private var IodineAttached:Boolean = false;
			*/

		//	jar.alpha = 0;
		//	jarWater.alpha = 0;
		//	jarRock.alpha = 0;
		//	jarRockWater.alpha = 0;
			jarPink.alpha = 0;
			steam.alpha = 0;
			
			lid_pink.alpha = 0;
			
			glass_yellow.alpha = 0;
			glass_twist_one.alpha = 0;
			glass_twist_two.alpha = 0;
			glass_tube.alpha = 0;
			glass_drip.alpha = 0;
		//	glass_black.alpha = 0;
		//	glass_purple.alpha = 0;
			
			spark.alpha = 0;
			fire.alpha = 0;
			
			
			CreateCellHit();
			CreateJarHit();
			CreateLidHit(LidOff);
			CreateBookHit();
			CreateGasHit();
			CreatePotHit();
			CreatePowerSupplyHit();
			CreateJarHit();
			
			this.addChildAt(jar,1);
			this.addChildAt(jarWater,2);
//			this.addChildAt(jarRock,3);
//			this.addChildAt(jarRockWater,4);
			this.addChildAt(jarPink,5);
			this.addChildAt(lid_off,6);
			this.addChildAt(lid_on,7);
			this.addChildAt(lid_pink,8);
			this.addChildAt(cell,9);
			this.addChildAt(bowl_purple,10);
			this.addChildAt(bowl,11);
			this.addChildAt(glass_yellow,12);
			this.addChildAt(glass_twist_one,13);
			this.addChildAt(glass_twist_two,14);
			this.addChildAt(glass_tube,15);
			this.addChildAt(glass_drip,16);
			this.addChildAt(glass_black,17);
			this.addChildAt(glass_purple,18);
			this.addChildAt(slime,19);
			this.addChildAt(slimeDrip,20);
			this.addChildAt(spark,21);
			this.addChildAt(fire,22);
			this.addChildAt(steam,23);
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk["Book"] == "open"){
					trace("Book is Open");
					BookIsOpen = true;
					//	OpenBook();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk["BookCurrentPage"] == 0){
						openBookcurrentPage = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk["BookCurrentPage"] == 1){
						openBookcurrentPage = 1;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk["BookCurrentPage"] == 2){
						openBookcurrentPage = 2;
					}else{
						openBookcurrentPage = 0;
					}
					OpenBook();
					this.addChild(goback);
				}
				
			}else{
				
			}
					
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		//hit_power_supply
		
		private function CreatePowerSupplyHit():void{
			hit_power_supply = new Shape();
			hit_power_supply.touchable = false;
			hit_power_supply.graphics.beginFill(0xff0000);
			
			hit_power_supply.graphics.lineTo(386,300);	
			hit_power_supply.graphics.lineTo(523,284);	
			hit_power_supply.graphics.lineTo(543,315);	
			hit_power_supply.graphics.lineTo(533,355);	
			hit_power_supply.graphics.lineTo(397,364);	
			
			hit_power_supply.graphics.endFill(false);
			hit_power_supply.alpha = 0.1;
			
			hit_power_supply.graphics.precisionHitTest = true;	
			this.addChild(hit_power_supply);
		}
		
		
		private function CreateJarHit():void{
			hit_jar = new Shape();
			hit_jar.touchable = false;
			hit_jar.graphics.beginFill(0xff0000);
			
			hit_jar.graphics.lineTo(226,148);	
			hit_jar.graphics.lineTo(216,80);	
			hit_jar.graphics.lineTo(250,63);	
			hit_jar.graphics.lineTo(305,80);	
			hit_jar.graphics.lineTo(307,140);	
			hit_jar.graphics.lineTo(290,162);	
		
			
			hit_jar.graphics.endFill(false);
			hit_jar.alpha = 0.1;
			
			hit_jar.graphics.precisionHitTest = true;	
			this.addChild(hit_jar);
		}
		
		private function CreateGasHit():void{
			hit_gas = new Shape();
			hit_gas.touchable = false;
			hit_gas.graphics.beginFill(0xff0000);
			
			hit_gas.graphics.lineTo(67,305);	
			hit_gas.graphics.lineTo(151,284);	
			hit_gas.graphics.lineTo(256,307);	
			hit_gas.graphics.lineTo(258,272);	
			hit_gas.graphics.lineTo(244,261);	
			hit_gas.graphics.lineTo(260,176);	
			hit_gas.graphics.lineTo(287,177);	
			hit_gas.graphics.lineTo(300,246);	
			hit_gas.graphics.lineTo(307,320);	
			hit_gas.graphics.lineTo(76,368);	
			
			hit_gas.graphics.endFill(false);
			hit_gas.alpha = 0.1;
			
			hit_gas.graphics.precisionHitTest = true;	
			this.addChild(hit_gas);
		}
		
		private function CreatePotHit():void{
			hit_pot = new Shape();
			hit_pot.touchable = false;
			hit_pot.graphics.beginFill(0xff0000);
			
			hit_pot.graphics.lineTo(593,205);	
			hit_pot.graphics.lineTo(606,176);	
			hit_pot.graphics.lineTo(763,202);	
			hit_pot.graphics.lineTo(741,368);	
			hit_pot.graphics.lineTo(587,348);	
			hit_pot.graphics.lineTo(581,308);	
			
			hit_pot.graphics.endFill(false);
			hit_pot.alpha = 0.1;
			
			hit_pot.graphics.precisionHitTest = true;	
			this.addChild(hit_pot);
		}
		
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(6,123);	
			hit_book.graphics.lineTo(104,104);	
			hit_book.graphics.lineTo(203,110);	
			hit_book.graphics.lineTo(218,248);	
			hit_book.graphics.lineTo(13,272);	
		
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.1;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
		private function CreateLidHit(open:Boolean = false):void{
			hit_lid = new Shape();
			hit_lid.touchable = false;
			if(open === false){
				
				hit_lid.x = 0;
				hit_lid.y = 0;
				hit_lid.graphics.beginFill(0xff0000);
				
				hit_lid.graphics.lineTo(229,152);
				hit_lid.graphics.lineTo(225,69);
				hit_lid.graphics.lineTo(245,37);
				hit_lid.graphics.lineTo(316,25);
				hit_lid.graphics.lineTo(304,81);
				hit_lid.graphics.lineTo(306,143);
				hit_lid.graphics.lineTo(289,160);
				
				hit_lid.graphics.endFill(false);
				
				hit_lid.alpha = 0.1;
				
				hit_lid.graphics.precisionHitTest = true;	
			}else{
				
				hit_lid.x = 0;
				hit_lid.y = 0;
				hit_lid.graphics.beginFill(0xff0000);	
				
				hit_lid.graphics.lineTo(322,236);				
				hit_lid.graphics.lineTo(362,238);				
				hit_lid.graphics.lineTo(394,272);				
				hit_lid.graphics.lineTo(387,296);				
				hit_lid.graphics.lineTo(316,307);				
				hit_lid.graphics.lineTo(298,287);				
				
				hit_lid.graphics.endFill(false);
				hit_lid.alpha = 0.1;
				
				hit_lid.graphics.precisionHitTest = true;				
			}
			
			this.addChild(hit_lid);
			
		}	
		private function CreateCellHit():void{
			hit_cell = new Shape();
			hit_cell.touchable = false;
			hit_cell.graphics.beginFill(0xff0000);
			
			hit_cell.graphics.lineTo(218,342);	
			hit_cell.graphics.lineTo(331,314);	
			hit_cell.graphics.lineTo(355,353);	
			hit_cell.graphics.lineTo(291,390);	
			hit_cell.graphics.lineTo(230,387);	
			
			hit_cell.graphics.endFill(false);
			hit_cell.alpha = 0.1;
			
			hit_cell.graphics.precisionHitTest = true;	
			this.addChild(hit_cell);
		}
		
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						if(BookIsOpen === false){						
							trace(touches[0].globalX+" ,"+touches[0].globalY);
							if(targ == goback.SourceImage){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								
								
								FadeOut((DeepLab as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.DeepLabObj,true
								);
								return;
							}else if(hit_cell.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								CellHandler();
						/*		if(CellPickedUp === false){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
										(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Cell,
										'item_Cell',
										'inven_cell_sm'
									);
									
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
									}
									CellPickedUp = true;
									cell.alpha = 0;
									SaveArray['Cell'] = "PickedUp";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
									
									
								}
						*/		
								return;
							}else if(hit_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LidHandler();
								return;
							}else if(hit_jar.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								trace("KIM 05");
								if(RockMelted === false){
									JarHandler();
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The entire contents of the jar has boiled away...");
								}
								return;
							}else if(hit_gas.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								GasHandler();
								return;
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								BookIsOpen = true;
								OpenBook(true, 0);
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;
								}		
								SaveArray['Book'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
								
							}else if(hit_pot.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PotHandler();
								return;
							}else if(hit_power_supply.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PowerSupplyHandler();	
							}
						}else{
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								trace("GoBackClick");
								RemoveBook();
								BookIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;
								}		
								SaveArray['Book'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
							}else if(hit_OpenBook.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;
								}
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
								//	openBookPages.texture = this.assets.getTexture('dnaBook_page_1');
									openBookPages.texture = (stage.getChildAt(0) as Object).DeepLabDeskImages.assets.getTexture("dnaBook_page_1");
								}else if(openBookcurrentPage == 1){
									SaveArray['BookCurrentPage'] = 2;
									openBookcurrentPage = 2;
								//	openBookPages.texture = this.assets.getTexture('dnaBook_page_2');
									openBookPages.texture = (stage.getChildAt(0) as Object).DeepLabDeskImages.assets.getTexture("dnaBook_page_2");
								}else if(openBookcurrentPage == 2){
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
								//	openBookPages.texture = this.assets.getTexture('dnaBook_page_0');
									openBookPages.texture = (stage.getChildAt(0) as Object).DeepLabDeskImages.assets.getTexture("dnaBook_page_0");
								}
								
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
								
							}
						}
					
					}
				}
			}
		}
		/*
		
		private var ElectricTweenOne:Tween;
		private var ElectricTweenTwo:Tween;
		private var SlimeTween:Tween;
		*/
		
		private function PowerSupplyHandler():void{
			Animating = true;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparkFive();
			
			ElectricTweenOne = new Tween(spark, 1, Transitions.EASE_OUT_IN_BACK);
			ElectricTweenOne.fadeTo(1);
			ElectricTweenOne.onComplete = function():void{
				ElectricAnimateTwo();
				ElectricTweenOne = null;
				
			};
					
			Starling.juggler.add(ElectricTweenOne);	 
			
			if(DNAAttached === true){
				if(RockMelted === true){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
					}
					
					SaveArray['DNARockFried'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
					
					DNARockFried = true;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerTwo();
					SlimeTween = new Tween(slime, 3, Transitions.EASE_IN);
					SlimeTween.fadeTo(1);
					SlimeTween.onComplete = function():void{
						
						SlimeDripTween();
					};
					
					Starling.juggler.add(SlimeTween);	 
				}
			}
		}
		
		private function SlimeDripTween():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
			SlimeTween = new Tween(slimeDrip, 1, Transitions.EASE_IN);
			SlimeTween.fadeTo(1);
			SlimeTween.onComplete = function():void{
				Animating = false;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
					PlayMonsterBeat();
				SlimeTween = null;
			};
			
			Starling.juggler.add(SlimeTween);	 
			
		}
		
		private function PlayMonsterBeat():void{
			if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
				Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).MusicObj.LoadMonsterBeat(true,2);					
				},0.5);
			}
		}
		
		private function ElectricAnimateTwo():void{
			ElectricTweenTwo = new Tween(spark, 1, Transitions.EASE_OUT_IN_BACK);
			ElectricTweenTwo.fadeTo(0);
			ElectricTweenTwo.onComplete = function():void{
				if(DNAAttached === true){
					if(RockMelted === true){
						
					}else{
						Animating = false;
					}
				}else{
					Animating = false;
				}
				
				ElectricTweenTwo = null;
				
			};
			
			
			Starling.juggler.add(ElectricTweenTwo);	 
		}
			
		
		private function PotHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_TestTube)
			{
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
				}
				
				SaveArray['DNAAttached'] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
				
				DNAAttached = true;
				bowl_purple.alpha = 1;
				bowl.texture = this.assets.getTexture('base_red');
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterPour();

				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_TestTubeHalf,
					'item_TestTubeHalf',
					'inven_testTubeHalf_sm',
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_TestTube,
					'item_TestTube'
				);
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_TestTubeHalf)
			{
				if(DNAAttached === false){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
					}
					
					SaveArray['DNAAttached'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
					
					DNAAttached = true;
					bowl_purple.alpha = 1;
					bowl.texture = this.assets.getTexture('base_red');
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterPour();
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_TestTubeHalf,
							"item_TestTubeHalf"
						);
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I shouldn't use any more of the DNA here; I might need it for something else.");
				}
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Injector)
			{
				if(DNARockFried === true){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_InjectorFull,
						'item_InjectorFull',
						'inven_injectorFull_sm',
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Injector,
						'item_Injector'
					);
					SamplePickedUp = true;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
					}
					
					SaveArray['SamplePickedUp'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
					
				}else{
					
				}
				
			}else{
				if(SamplePickedUp === true){
					
				}else{
					if(DNARockFried === true){
						if(RONum == 0){
							RONum = 1;
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A large gooey mass has grown from out of the glass bowl...");
						}else if(RONum == 1){
							RONum = 2;
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It's slippery... it is barely solid and liquefies easily.");;				
						}else if(RONum == 2){
							RONum = 0;
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Something happened when electricity went through the DNA and metallic solution....");
							
						}
					}else{
						if(DNAAttached === true){
							if(RockMelted === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The DNA has mixed with the denatured red metal extract, but nothing's happened...?");
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've placed some of the DNA in the bowl...");
							}
						}else{
							if(RockMelted === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("What was once a chunk of the red metal has turned into a strange chemical mixture...");
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A glass bowl with two electrodes placed within it.");
							}
						}
					}
				}
			}
		}
		
		private function GasHandler():void{
			if(RockMelted === false){
				trace('BLUE 00');
				if(JarAttached === true){
					trace('BLUE 01');
					if(RockAttached === true){
						trace('BLUE 02');
						if(WaterAttached === true){
							trace('BLUE 03');
							/*Start Remove*/
							
					//		if(RockAttached === true){	
					//			trace('BLUE 04');
							
							/*End Remove */
								if(IodineAttached === true){
									trace('BLUE 05');
									if(LidOff === false){
										trace('BLUE 06');
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
										}
										
										SaveArray['RockMelted'] = "Yes";
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
										
										
										RockMelted = true;
										Animating = true;
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();
										FireTween = new Tween(fire, 1, Transitions.LINEAR);
										FireTween.fadeTo(1);
										FireTween.onComplete = function():void{
											
											JarAnimation();
											FireTween = null;
										};
										Starling.juggler.add(FireTween);	 
									}else{
										trace('BLUE 07');
										Animating = true;
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();
										SteamTween = new Tween(steam, 1, Transitions.LINEAR);
										SteamTween.fadeTo(1);
										SteamTween.onComplete = function():void{
											FadeOutSteam();
										};
										
										
										FireTween = new Tween(fire, 1, Transitions.LINEAR);
										FireTween.fadeTo(1);
										FireTween.onComplete = function():void{
											FadeOutFire(6);
										};
										Starling.juggler.add(FireTween);	 
										Starling.juggler.delayCall(function():void{
											Starling.juggler.add(SteamTween);	 	
										},1);
									}
								}else{
									trace('BLUE 08');
									Animating = true;
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();
									
									FireTween = new Tween(fire, 1, Transitions.LINEAR);
									FireTween.fadeTo(1);
									FireTween.onComplete = function():void{
										FadeOutFire(1);
									};
									
									Starling.juggler.add(FireTween);	
									
									if(LidOff === true){
										SteamTween = new Tween(steam, 1, Transitions.LINEAR);
										SteamTween.fadeTo(1);
										SteamTween.onComplete = function():void{
											FadeOutSteam();
										};
										Starling.juggler.delayCall(function():void{
											Starling.juggler.add(SteamTween);	 	
										},1); 
									}
									
								
								}
							/*Start Remove*/
						/*		
							}else{
								trace('BLUE 09');
								if(IodineAttached === true){	
									trace('BLUE 10');
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();
									if(LidOff === true){
										SteamTween = new Tween(steam, 1, Transitions.LINEAR);
										SteamTween.fadeTo(1);
										SteamTween.onComplete = function():void{
											FadeOutSteam();
										};
										Starling.juggler.delayCall(function():void{
											Starling.juggler.add(SteamTween);	 	
										},1);	 
									}
									Animating = true;
									FireTween = new Tween(fire, 1, Transitions.LINEAR);
									FireTween.fadeTo(1);
									FireTween.onComplete = function():void{
										FadeOutFire(2);
									};							
									Starling.juggler.add(FireTween);	 
								}else{
									trace('BLUE 11');
					 				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();
									if(LidOff === true){
										SteamTween = new Tween(steam, 1, Transitions.LINEAR);
										SteamTween.fadeTo(1);
										SteamTween.onComplete = function():void{
											FadeOutSteam();
										};
										Starling.juggler.delayCall(function():void{
											Starling.juggler.add(SteamTween);	 	
										},1);
									}
									Animating = true;
									FireTween = new Tween(fire, 1, Transitions.LINEAR);
									FireTween.fadeTo(1);
									FireTween.onComplete = function():void{
										FadeOutFire(2);
									};
									Starling.juggler.add(FireTween);	 
									
								}
							}
						*/		
							/*End Remove */
						}else{
							trace('BLUE 12');
						/* Start Remove*/
						//	if(RockAttached === true){
						//		trace('BLUE 13');
						/*End Remove */		
								if(IodineAttached === true){
									trace('BLUE 14');
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
									Animating = true;
									FireTween = new Tween(fire, 1, Transitions.LINEAR);
									FireTween.fadeTo(1);
									FireTween.onComplete = function():void{
										FadeOutFire(3);
									};
									Starling.juggler.add(FireTween);	 
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();
									if(LidOff === true){
										SteamTween = new Tween(steam, 1, Transitions.LINEAR);
										SteamTween.fadeTo(1);
										SteamTween.onComplete = function():void{
											FadeOutSteam();
										};
										Starling.juggler.delayCall(function():void{
											Starling.juggler.add(SteamTween);	 	
										},1);
									}
								}else{
									trace('BLUE 15');
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
									Animating = true;
									FireTween = new Tween(fire, 1, Transitions.LINEAR);
									FireTween.fadeTo(1);
									FireTween.onComplete = function():void{
										FadeOutFire(4);
									};
									Starling.juggler.add(FireTween);	 
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();
									if(LidOff === true){
										SteamTween = new Tween(steam, 1, Transitions.LINEAR);
										SteamTween.fadeTo(1);
										SteamTween.onComplete = function():void{
											FadeOutSteam();
										};
										Starling.juggler.delayCall(function():void{
											Starling.juggler.add(SteamTween);	 	
										},1);
									}
								}
							/*Start Remove */
							/*
							}else{
								if(IodineAttached === true){
									trace('BLUE 16');
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
									Animating = true;
									FireTween = new Tween(fire, 1, Transitions.LINEAR);
									FireTween.fadeTo(1);
									FireTween.onComplete = function():void{
										FadeOutFire(5);
									};
									Starling.juggler.add(FireTween);	 
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();
									if(LidOff === true){
										SteamTween = new Tween(steam, 1, Transitions.LINEAR);
										SteamTween.fadeTo(1);
										SteamTween.onComplete = function():void{
											FadeOutSteam();
										};
										Starling.juggler.delayCall(function():void{
											Starling.juggler.add(SteamTween);	 	
									},1);
								}
								}else{
									trace('BLUE 17');
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
									Animating = true;
									FireTween = new Tween(fire, 1, Transitions.LINEAR);
									FireTween.fadeTo(1);
									FireTween.onComplete = function():void{
										FadeOutFire(0);
									};
									Starling.juggler.add(FireTween);	 
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();
									if(LidOff === true){
										SteamTween = new Tween(steam, 1, Transitions.LINEAR);
										SteamTween.fadeTo(1);
										SteamTween.onComplete = function():void{
											FadeOutSteam();
										};
										Starling.juggler.delayCall(function():void{
											Starling.juggler.add(SteamTween);	 	
										},1);
									}
								}
							}
							*/
							/*End Remove*/
						}
					}else{
						trace('BLUE 18');
						if(IodineAttached === true){
							trace('BLUE 19');
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
							Animating = true;
							FireTween = new Tween(fire, 1, Transitions.LINEAR);
							FireTween.fadeTo(1);
							FireTween.onComplete = function():void{
								FadeOutFire(5);
							};
							Starling.juggler.add(FireTween);	 
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();
							if(LidOff === true){
								SteamTween = new Tween(steam, 1, Transitions.LINEAR);
								SteamTween.fadeTo(1);
								SteamTween.onComplete = function():void{
									FadeOutSteam();
								};
								Starling.juggler.delayCall(function():void{
									Starling.juggler.add(SteamTween);	 	
								},1);
							}
						}else{
							trace('BLUE 20');
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
							
							Animating = true;
							FireTween = new Tween(fire, 1, Transitions.LINEAR);
							FireTween.fadeTo(1);
							FireTween.onComplete = function():void{
								FadeOutFire(7);
							};
							Starling.juggler.add(FireTween);	 
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();
							if(LidOff === true){
								SteamTween = new Tween(steam, 1, Transitions.LINEAR);
								SteamTween.fadeTo(1);
								SteamTween.onComplete = function():void{
									FadeOutSteam();
								};
								Starling.juggler.delayCall(function():void{
									Starling.juggler.add(SteamTween);	 	
								},1);
							}
						}
						
					
					}
				}else{
					trace('BLUE 21');
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
					
					Animating = true;
					FireTween = new Tween(fire, 1, Transitions.LINEAR);
					FireTween.fadeTo(1);
					FireTween.onComplete = function():void{
						FadeOutFire(0);
					};
					Starling.juggler.add(FireTween);	 
					 
				}
			}else{
				trace('BLUE 22');
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FireBall();
				
				Animating = true;
				FireTween = new Tween(fire, 1, Transitions.LINEAR);
				FireTween.fadeTo(1);
				FireTween.onComplete = function():void{
					FadeOutFire(0);
				};
				Starling.juggler.add(FireTween);	 
			}
			
		}
		private function FadeOutSteam():void{
			SteamTween = new Tween(steam, 2, Transitions.LINEAR);
			SteamTween.fadeTo(0);
			SteamTween.onComplete = function():void{				
				Animating = false;
				SteamTween = null;	
			};
			Starling.juggler.add(SteamTween);	 
		}
		private function FadeOutFire(choice:int = 0):void{
			FireTween = new Tween(fire, 2, Transitions.EASE_IN);
			FireTween.fadeTo(0);
			FireTween.onComplete = function():void{				
				Animating = false;
				FinishDialogue(choice)
				FireTween = null;
				
			};
			Starling.juggler.add(FireTween);	 
		}
		
		private function FinishDialogue(choice:int = 0):void{
			if(choice == 0){
				
			}else if(choice == 1){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmm... boiling the piece of metal in water alone seems to have little effect...");
			}else if(choice == 2){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmm... boiling water and iodine alone doesn't accomplish much.");
			}else if(choice == 3){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The heat seems to have little to no effect on the stone and iodine...");
			}else if(choice == 4){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The heat seems to have no effect on the piece of red metal...");
			}else if(choice == 5){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmmm... the heat of the flame has little effect on the iodine...");
			}else if(choice == 6){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I should try this with the lid on the beaker.");
			}else if(choice == 7){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmm... boiling the water by itself doesn't help me much at the moment...");
			}
		}
		
		private function JarAnimation():void{
			JarTween = new Tween(jarPink, 2, Transitions.LINEAR);
			JarTween.fadeTo(1);
			JarTween.onComplete = function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Bubbles();
//				jarRockWater.alpha = 0;
//				jarRock.alpha = 0;
				jarWater.alpha = 0;
				LidPinkAnimation();
				
				JarTween = null;
			
				
			};
			Starling.juggler.add(JarTween);	 
		
			
		}
		private function LidPinkAnimation():void{
	//		jarRock.alpha = 0
	//		jarRockWater.alpha = 0
			jarWater.alpha = 0
			LidPinkTween = new Tween(lid_pink, 1, Transitions.LINEAR);
			LidPinkTween.fadeTo(1);
			LidPinkTween.onComplete = function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
				TwistPinkAnimation();
				
				LidPinkTween = null;
				
			};
			Starling.juggler.add(LidPinkTween);	 

		}
		
		private function TwistPinkAnimation():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirLeak();
			TwistPinkTween = new Tween(glass_twist_one, 1, Transitions.LINEAR);
			TwistPinkTween.fadeTo(1);
			TwistPinkTween.onComplete = function():void{
				
				TransAnimation01();
				TwistPinkTween = null;
				
			};
			Starling.juggler.add(TwistPinkTween);	 
			
		}
		
		private function TransAnimation01():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
			
			JarTween = new Tween(jarPink, 1, Transitions.LINEAR);
			JarTween.fadeTo(0);
			JarTween.onComplete = function():void{				
			
				JarTween = null;
				
			};
			FireTween = new Tween(fire, 1, Transitions.LINEAR);
			FireTween.fadeTo(0);
			FireTween.onComplete = function():void{				
				
				FireTween = null;
				
			};
			TweenOne = new Tween(glass_black, 1, Transitions.LINEAR);
			TweenOne.fadeTo(1);
			TweenOne.onComplete = function():void{				
				
				TweenOne = null;
			};
			
			TweenTwo = new Tween(glass_tube, 2, Transitions.LINEAR);
			TweenTwo.fadeTo(1);
			TweenTwo.onComplete = function():void{				
				TransAnimation02();
				TweenTwo = null;
			};
			
			Starling.juggler.add(TweenTwo);	 
			Starling.juggler.add(FireTween);	 
			Starling.juggler.add(TweenOne);	 
			Starling.juggler.add(JarTween);	 
			
		}
		
		private function TransAnimation02():void{
			LidPinkTween = new Tween(lid_pink, 1, Transitions.LINEAR);
			LidPinkTween.fadeTo(0);
			LidPinkTween.onComplete = function():void{
				
				LidPinkTween = null;
				
			};
			TwistPinkTween = new Tween(glass_twist_one, 2, Transitions.LINEAR);
			TwistPinkTween.fadeTo(0);
			TwistPinkTween.onComplete = function():void{

				TwistPinkTween = null;
				
			};
			TweenOne = new Tween(glass_twist_two, 2, Transitions.LINEAR);
			TweenOne.fadeTo(1);
			TweenOne.onComplete = function():void{				
				
				TweenOne = null;
			};
			
			TweenTwo = new Tween(glass_purple, 1, Transitions.LINEAR);
			TweenTwo.fadeTo(1);
			TweenTwo.onComplete = function():void{				
				TransAnimation03();
				
				TweenTwo = null;
			};
			
			
			Starling.juggler.add(TwistPinkTween);	 
			Starling.juggler.add(LidPinkTween);	 
			Starling.juggler.add(TweenOne);	 
			Starling.juggler.add(TweenTwo);	 
		}
		
		private function TransAnimation03():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DripsFast();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
			TweenThree = new Tween(glass_yellow, 1, Transitions.LINEAR);
			TweenThree.fadeTo(1);
			TweenThree.onComplete = function():void{
				
				TweenThree = null;
				
			};
			
			
			TweenOne = new Tween(glass_tube, 2, Transitions.LINEAR);
			TweenOne.fadeTo(0);
			TweenOne.onComplete = function():void{				
				TransAnimation04();
				TweenOne = null;
			};
			Starling.juggler.add(TweenOne);	 
			Starling.juggler.add(TweenThree);	 
		}
		
		private function TransAnimation04():void{
			TweenTwo = new Tween(bowl, 2, Transitions.LINEAR);
			TweenTwo.fadeTo(1);
			TweenTwo.onComplete = function():void{
				TransAnimation05();
				TweenTwo = null;
				
			};
			
			
			TwistPinkTween = new Tween(glass_twist_two, 1, Transitions.LINEAR);
			TwistPinkTween.fadeTo(0);
			TwistPinkTween.onComplete = function():void{
				
				TwistPinkTween = null;
				
				
			};
			Starling.juggler.add(TweenTwo);	
			Starling.juggler.add(TwistPinkTween);	
		}
		private function TransAnimation05():void{
			TweenThree = new Tween(glass_yellow, 1, Transitions.LINEAR);
			TweenThree.fadeTo(0);
			TweenThree.onComplete = function():void{
				
				TweenThree = null;
				Animating = false;
			};
			
			Starling.juggler.add(TweenThree);	
		}
		
		private function JarHandler():void{
			trace("KIM 03");
			if(JarAttached === false){
				trace("KIM 04");
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Jar)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalPing();
					
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
					}
					
					SaveArray['JarAttached'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);

					JarAttached = true;
					jar.alpha = 1;
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_Jar,
							"item_Jar"
						);
					
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_JarFull)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalPing();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SplashTwo();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
					}
					
					SaveArray['JarAttached'] = "Yes";
					SaveArray['WaterAttached'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
					
					WaterAttached = true;
					JarAttached = true;
					jar.alpha = 1;
					jarWater.alpha = 1;
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_JarFull,
							"item_JarFull"
						);				
					
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_JarFullRock)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalPing();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SplashTwo();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
					}
					
					SaveArray['JarAttached'] = "Yes";
					SaveArray['WaterAttached'] = "Yes";
					SaveArray['RockAttached'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
					
					WaterAttached = true;
					JarAttached = true;
					RockAttached = true;
					jar.alpha = 1;
					jarWater.texture = this.assets.getTexture('jar_rock_water');
					jarWater.alpha = 1;
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_JarFullRock,
							"item_JarFullRock"
						);		
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_JarFullIodine)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalPing();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SplashTwo();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
					}
					
					SaveArray['JarAttached'] = "Yes";
					SaveArray['WaterAttached'] = "Yes";
			//		SaveArray['RockAttached'] = "Yes";
					SaveArray['IodineAttached'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
					
					WaterAttached = true;
					JarAttached = true;
			//		RockAttached = true;
					IodineAttached = true;
					jar.alpha = 1;
					jarWater.texture = this.assets.getTexture('jar_water_iodine');
					jarWater.alpha = 1;
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_JarFullIodine,
							"item_JarFullIodine"
						);		
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_JarFullRockIodine)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalPing();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SplashTwo();
					SaveArray['JarAttached'] = "Yes";
					SaveArray['WaterAttached'] = "Yes";
					SaveArray['RockAttached'] = "Yes";
					SaveArray['IodineAttached'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
					
					WaterAttached = true;
					JarAttached = true;
					RockAttached = true;
					IodineAttached = true;
					jar.alpha = 1;
					jarWater.texture = this.assets.getTexture('jar_rock_water_iodine');
					jarWater.alpha = 1;
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_JarFullRockIodine,
							"item_JarFullRockIodine"
						);		
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_JarRock)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalPing();
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SplashTwo();
					SaveArray['JarAttached'] = "Yes";
				//	SaveArray['WaterAttached'] = "Yes";
					SaveArray['RockAttached'] = "Yes";
				//	SaveArray['IodineAttached'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
					
			//		WaterAttached = true;
					JarAttached = true;
					RockAttached = true;
			//		IodineAttached = true;
					jar.alpha = 1;
					jarWater.texture = this.assets.getTexture('jar_rock');
					jarWater.alpha = 1;
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_JarRock,
							"item_JarRock"
						);		
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_JarIodine)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalPing();
					SaveArray['JarAttached'] = "Yes";
					//	SaveArray['WaterAttached'] = "Yes";
				//	SaveArray['RockAttached'] = "Yes";
					SaveArray['IodineAttached'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
					
					//		WaterAttached = true;
					JarAttached = true;
			//		RockAttached = true;
					IodineAttached = true;
					jar.alpha = 1;
					jarWater.texture = this.assets.getTexture('jar_iodine');
					jarWater.alpha = 1;
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_JarIodine,
							"item_JarIodine"
						);		
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_JarRockIodine)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalPing();
					SaveArray['JarAttached'] = "Yes";
					//	SaveArray['WaterAttached'] = "Yes";
					SaveArray['RockAttached'] = "Yes";
					SaveArray['IodineAttached'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
					
					//		WaterAttached = true;
					JarAttached = true;
					RockAttached = true;
					IodineAttached = true;
					jar.alpha = 1;
					jarWater.texture = this.assets.getTexture('jar_rock_iodine');
					jarWater.alpha = 1;
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_JarRockIodine,
							"item_JarRockIodine"
						);		
				}
			}else{
				trace("KIM 00");
				if(LidOff === true){
					trace("KIM 01");
					if((stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.armedItem
						== 
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.inventoryBarObj
						.item_RedRock)
					{
						trace("KIM 02");
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
						}						
						SaveArray['RockAttached'] = "Yes";						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
						
						RockAttached = true;
				
						if(WaterAttached === false){
							if(IodineAttached === false){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalPing();
								jarWater.texture = this.assets.getTexture('jar_rock');
							}else{
								jarWater.texture = this.assets.getTexture('jar_rock_iodine');
							}							
						}else{
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterPour();
							if(IodineAttached === false){
								jarWater.texture = this.assets.getTexture('jar_rock_water');
							}else{
								jarWater.texture = this.assets.getTexture('jar_rock_water_iodine');
							}
						}
						jarWater.alpha = 1;
						
						
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_RedRock,
								"item_RedRock"
							);
						
					}else if((stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.armedItem
						== 
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.inventoryBarObj
						.item_Iodine)
					{	
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterPour();
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
						}						
						SaveArray['IodineAttached'] = "Yes";						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
						
						IodineAttached = true;						
						if(WaterAttached === false){
							if(RockAttached === false){
								jarWater.texture = this.assets.getTexture('jar_iodine');
							}else{
								jarWater.texture = this.assets.getTexture('jar_rock_iodine');
							}							
						}else{
							if(RockAttached === false){
								jarWater.texture = this.assets.getTexture('jar_water_iodine');
							}else{
								jarWater.texture = this.assets.getTexture('jar_rock_water_iodine');
							}
						}
						jarWater.alpha = 1;
						
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_Iodine,
								"item_Iodine"
							);		
						
						
					}else if(WaterAttached === false){
						trace('NOOB 00');
						if(RockAttached === true){
							trace('NOOB 01');
							if(IodineAttached === true){
								trace('NOOB 02');
								(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarRockIodine,
									'item_JarRockIodine',
									'inven_jarRockIodine_sm'
								);
								RemoveJar();
							}else{
								trace('NOOB 03');
								(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarRock,
									'item_JarRock',
									'inven_jarRock_sm'
								);
								RemoveJar();
							}
						}else{
							trace('NOOB 04');
							if(IodineAttached === true){
								trace('NOOB 05');
								(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarIodine,
									'item_JarIodine',
									'inven_jarIodine_sm'
								);
								RemoveJar();
							}else{
								trace('NOOB 06');
								(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Jar,
									'item_Jar',
									'inven_jar_sm'
								);
								RemoveJar();
							}
						}
							
					}else{
						trace('NOOB 07');
						if(RockAttached === true){
							trace('NOOB 08');
							if(IodineAttached === true){
								trace('NOOB 09');
								(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFullRockIodine,
									'item_JarFullRockIodine',
									'inven_jarFullRockIodine_sm'
								);
								RemoveJar();
							}else{
								trace('NOOB 10');
								(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFullRock,
									'item_JarFullRock',
									'inven_jarFullRock_sm'
								);
								RemoveJar();
							}
						}else{
							trace('NOOB 11');
							if(IodineAttached === true){
								trace('NOOB 12');
								(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFullIodine,
									'item_JarFullIodine',
									'inven_jarFullIodine_sm'
								);
								RemoveJar();
							}else{								
								trace('NOOB 13');
								(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFull,
									'item_JarFull',
									'inven_jarFull_sm'
								);
								RemoveJar();
							}
						}
						
					}
					
					
				}else{
					trace('NOOB 14');
					LidHandler();
				}
			}
				
			
		}
		private function RemoveJar():void{
				
			WaterAttached = false;
			JarAttached = false;
			RockAttached = false;
			IodineAttached = false;
			jar.alpha = 0;
			jarWater.alpha = 0;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
			}
			
			SaveArray['JarAttached'] = "No";
			SaveArray['WaterAttached'] = "No";
			SaveArray['RockAttached'] = "No";
			SaveArray['IodineAttached'] = "No";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
		}
		
		private function OpenBook(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openBook = new Sprite();
			openBook.alpha = 0;
			CreateOpenBookBg();
			openBookPages = new Image((stage.getChildAt(0) as Object).DeepLabDeskImages.assets.getTexture("dnaBook_page_0"));
		//	openBookPages = new Image(this.assets.getTexture('dnaBook_page_0'));
			this.openBook.addChildAt(openBookbg,0);
			openBook.addChild(openBookPages);
			openBookPages.touchable = false;
			
			
			this.addChild(openBook);
			this.addChild(goback);
			
			if(openBookcurrentPage == 0){
				openBookPages.texture = (stage.getChildAt(0) as Object).DeepLabDeskImages.assets.getTexture("dnaBook_page_0");
			//	openBookPages.texture = this.assets.getTexture('dnaBook_page_0');
			}else if(openBookcurrentPage == 1){
				openBookPages.texture = (stage.getChildAt(0) as Object).DeepLabDeskImages.assets.getTexture("dnaBook_page_1");
			//	openBookPages.texture = this.assets.getTexture('dnaBook_page_1');
			}else if(openBookcurrentPage == 2){
				openBookPages.texture = (stage.getChildAt(0) as Object).DeepLabDeskImages.assets.getTexture("dnaBook_page_2");
				//openBookPages.texture = this.assets.getTexture('dnaBook_page_2');
			}
			
			CreateOpenBookHit();
			//CreateOpenBookHit(openBookcurrentPage);
			
			if(Fade === false){
				Animating = false;
				openBook.alpha = 1;
				//	CreateOpenBookHit();
			}else{
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('gatc');
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
		private function CreateOpenBookHit():void{
			hit_OpenBook = new Shape();
			hit_OpenBook.touchable = false;
			hit_OpenBook.graphics.beginFill(0xff0000);
			
			hit_OpenBook.graphics.lineTo(82,0);	
			hit_OpenBook.graphics.lineTo(720,0);	
			hit_OpenBook.graphics.lineTo(720,512);	
			hit_OpenBook.graphics.lineTo(82,512);	
			
			
			hit_OpenBook.graphics.endFill(false);
			hit_OpenBook.alpha = 0.0;
			
			hit_OpenBook.graphics.precisionHitTest = true;	
			this.addChild(hit_OpenBook);
		}
		private function LidHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
			}
			if(JarAttached === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalPing();
				if(LidOff === false){
					
					LidOff = true;
					SaveArray['Lid'] = "Off";
					lid_on.alpha = 0;
					lid_off.alpha = 1;
					hit_lid.graphics.clear();
					CreateLidHit(true);
				}else{
					LidOff = false;
					SaveArray['Lid'] = "On";
					lid_on.alpha = 1;
					lid_off.alpha = 0;
					hit_lid.graphics.clear();
					CreateLidHit(false);
				}
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A pyrex glass semi-spherical lid and spout.");
			}
			
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
		}
		
		private function CellHandler():void{
			if(CellPickedUp === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Cell,
					'item_Cell',
					'inven_cell_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk;	
				}
				CellPickedUp = true;
				cell.alpha = 0;
				SaveArray['Cell'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLabDesk',SaveArray);
				
				
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
			
			
			
			this.assets.removeTexture("deepLabDesk_bg",true);
			this.assets.removeTexture("DeepLabDesk_Sprite_01",true);
		//	this.assets.removeTexture("DnaBook_Sprite_01",true);
			this.assets.removeTextureAtlas("DeepLabDesk_Sprite_01",true);
		//	this.assets.removeTextureAtlas("DnaBook_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("deepLabDesk_01");
			(stage.getChildAt(0) as Object).falseAsset("deepLabDesk_02");
			(stage.getChildAt(0) as Object).falseAsset("deepLabDesk_03");
		//	(stage.getChildAt(0) as Object).falseAsset("deepLabDesk_04");
		//	(stage.getChildAt(0) as Object).falseAsset("deepLabDesk_05");
			
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
