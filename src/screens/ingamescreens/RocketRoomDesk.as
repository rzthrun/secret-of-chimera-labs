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
	
	
	public class RocketRoomDesk extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		private var key:Image;
		private var top_on:Image;
		private var top_off:Image;
		private var drawer:Image;
		
		private var hit_book:Shape;
		private var hit_key:Shape;
		private var hit_top:Shape;
		private var hit_drawer_upper:Shape;
		private var hit_drawer_lower:Shape;
		
		private var hit_head:Shape;
		private var hit_slime:Shape;
		private var hit_blueprint:Shape;
		private var hit_floor:Shape;
		
		
		private var KeyPickedUp:Boolean = false;
		private var UpperDrawerOpen:Boolean = false;
		private var LowerDrawerOpen:Boolean = false;
		private var TopOpen:Boolean = false;
		
		private var openBookbg:Shape;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookcurrentPage:Number = 0;
		
		private var hit_openBookBack:Shape;
		private var hit_openBookNext:Shape;
		
		private var RONum:int = 0;
		
		public var OpenBookTween:Tween;
		private var BookIsOpen:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function RocketRoomDesk(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('rocketRoomDesk_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomDesk/rocketRoomDesk_bg.jpg'));
				game.TrackAssets('rocketRoomDesk_01');
			}
			if(game.CheckAsset('rocketRoomDesk_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomDesk/RocketRoomDesk_Sprite_01.png'));
				game.TrackAssets('rocketRoomDesk_02');
			}
			if(game.CheckAsset('rocketRoomDesk_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomDesk/RocketRoomDesk_Sprite_01.xml'));
				game.TrackAssets('rocketRoomDesk_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RocketRoomDesk","RocketRoomDeskObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		/*	(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_HDD,
				'item_HDD',
				'inven_hdd_sm'
			);
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CubeDamage,
				'item_CubeDamage',
				'inven_cubeDamage_sm'
			);
			*/
			bg = new Image(this.assets.getTexture('rocketRoomDesk_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			key = new Image(this.assets.getTexture('key'));
			key.touchable = false;
			key.x = 306;
			key.y = 269;	
			
			top_on = new Image(this.assets.getTexture('top_on'));
			top_on.touchable = false;
			top_on.x = 207;
			top_on.y = 26;	
			
			top_off = new Image(this.assets.getTexture('top_off'));
			top_off.touchable = false;
			top_off.x = 81;
			top_off.y = 105;	
			
			drawer  = new Image(this.assets.getTexture('drawer_lower'));
			drawer.touchable = false;
			drawer.x = 0;
			drawer.y = 254;	
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk['Key'] == 'PickedUp'){	
					key.alpha = 0;	
					KeyPickedUp = true;
				}else{
					key.alpha = 1;		
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk['Top'] == 'Off'){	
					top_on.alpha = 0;		
					top_off.alpha = 1;	
					TopOpen = true;
				}else {
					top_on.alpha = 1;		
					top_off.alpha = 0;		
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk['Drawer'] == 'Upper'){	
					drawer.texture  = this.assets.getTexture('drawer_upper');
					drawer.alpha = 1;
					UpperDrawerOpen = true;
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk['Drawer'] == 'Lower'){	
					drawer.texture  = this.assets.getTexture('drawer_lower');
					drawer.alpha = 1;
					LowerDrawerOpen = true;
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk['Drawer'] == 'Both'){	
					drawer.texture  = this.assets.getTexture('drawer_both');
					drawer.alpha = 1;
					UpperDrawerOpen = true;
					LowerDrawerOpen = true;
				}else{
					drawer.alpha = 0;
				}
			}else{
				key.alpha = 1;
				top_on.alpha = 1;		
				top_off.alpha = 0;	
				drawer.alpha = 0;
				
			}
			
			
		
			
			this.addChildAt(key,1);
			this.addChildAt(top_on,2);
			this.addChildAt(top_off,3);
			this.addChildAt(drawer,4);
			
			CreateHeadHit();
			CreateSlimeHit();
			CreateBlueprintHit();
			CreateFloorHit();
			
			CreateKeyHit();
			CreateBookHit();
			
			CreateTopHit(TopOpen);
			CreateDrawerLowerHit(LowerDrawerOpen);
			CreateDrawerUpperHit(UpperDrawerOpen);
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk["Book"] == "open"){
					BookIsOpen = true;
					OpenBook();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk["BookCurrentPage"] == 0){
						openBookcurrentPage = 0;
						openBookPages.texture = (stage.getChildAt(0) as Object).CryptoBookImages.assets.getTexture("CryptoBook_page_0");
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk["BookCurrentPage"] == 1){
						openBookcurrentPage = 1;						
						openBookPages.texture = (stage.getChildAt(0) as Object).CryptoBookImages.assets.getTexture("CryptoBook_page_1");
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk["BookCurrentPage"] == 2){
						openBookcurrentPage = 2;						
						openBookPages.texture = (stage.getChildAt(0) as Object).CryptoBookImages.assets.getTexture("CryptoBook_page_2");
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk["BookCurrentPage"] == 3){
						openBookcurrentPage = 3;						
						openBookPages.texture = (stage.getChildAt(0) as Object).CryptoBookImages.assets.getTexture("CryptoBook_page_3");
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk["BookCurrentPage"] == 4){
						openBookcurrentPage = 4;
						openBookPages.texture = (stage.getChildAt(0) as Object).CryptoBookImages.assets.getTexture("CryptoBook_page_4");
					}else{
						openBookcurrentPage = 0;
						openBookPages.texture = (stage.getChildAt(0) as Object).CryptoBookImages.assets.getTexture("CryptoBook_page_0");	
					}
					
					this.addChild(goback);
				}
			}
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		/*
		
		
		private var hit_head:Shape;
		private var hit_slime:Shape;
		private var hit_blueprint:Shape;
		private var hit_floor:Shape;
		*/
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0xff0000);
			
			hit_floor.graphics.lineTo(141,458);	
			hit_floor.graphics.lineTo(232,476);	
			hit_floor.graphics.lineTo(328,357);	
			hit_floor.graphics.lineTo(331,499);	
			hit_floor.graphics.lineTo(173,506);	
		
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		private function CreateBlueprintHit():void{
			hit_blueprint = new Shape();
			hit_blueprint.touchable = false;
			hit_blueprint.graphics.beginFill(0xff0000);
			
			hit_blueprint.graphics.lineTo(361,221);	
			hit_blueprint.graphics.lineTo(436,124);	
			hit_blueprint.graphics.lineTo(723,176);	
			hit_blueprint.graphics.lineTo(794,235);	
			hit_blueprint.graphics.lineTo(793,376);	
			hit_blueprint.graphics.lineTo(544,484);	
			hit_blueprint.graphics.lineTo(419,332);	
		
			hit_blueprint.alpha = 0.0;
			
			hit_blueprint.graphics.precisionHitTest = true;	
			this.addChild(hit_blueprint);
		}
		
		private function CreateSlimeHit():void{
			hit_slime = new Shape();
			hit_slime.touchable = false;
			hit_slime.graphics.beginFill(0xff0000);
			
			hit_slime.graphics.lineTo(124,195);	
			hit_slime.graphics.lineTo(124,189);	
			hit_slime.graphics.lineTo(222,108);	
			hit_slime.graphics.lineTo(345,132);	
			hit_slime.graphics.lineTo(360,186);	
			hit_slime.graphics.lineTo(337,230);	
			hit_slime.graphics.lineTo(233,313);	
			hit_slime.graphics.lineTo(174,294);	
					
			hit_slime.graphics.endFill(false);
			hit_slime.alpha = 0.0;
			
			hit_slime.graphics.precisionHitTest = true;	
			this.addChild(hit_slime);
		}
		
		private function CreateHeadHit():void{
			hit_head = new Shape();
			hit_head.touchable = false;
			hit_head.graphics.beginFill(0xff0000);
			
			hit_head.graphics.lineTo(179,36);	
			hit_head.graphics.lineTo(282,12);	
			hit_head.graphics.lineTo(327,95);	
			hit_head.graphics.lineTo(329,171);	
			hit_head.graphics.lineTo(258,187);	
			hit_head.graphics.lineTo(198,126);	
						
			hit_head.graphics.endFill(false);
			hit_head.alpha = 0.0;
			
			hit_head.graphics.precisionHitTest = true;	
			this.addChild(hit_head);
		}
		private function CreateDrawerUpperHit(open:Boolean = false):void{
			hit_drawer_upper = new Shape();
			this.addChild(hit_drawer_upper);
			if(open === false){
				
				hit_drawer_upper.x = 0;
				hit_drawer_upper.y = 0;
				hit_drawer_upper.graphics.beginFill(0x0000FF);
				
				hit_drawer_upper.graphics.lineTo(46,254);
				hit_drawer_upper.graphics.lineTo(188,303);
				hit_drawer_upper.graphics.lineTo(207,389);
				hit_drawer_upper.graphics.lineTo(77,346);
			
				hit_drawer_upper.graphics.endFill(false);
				
				hit_drawer_upper.alpha = 0.0;
				
				hit_drawer_upper.graphics.precisionHitTest = true;	
			}else{
				
				hit_drawer_upper.x = 0;
				hit_drawer_upper.y = 0;
				hit_drawer_upper.graphics.beginFill(0x0000FF);	
				
				hit_drawer_upper.graphics.lineTo(0,305);
				hit_drawer_upper.graphics.lineTo(53,270);
				hit_drawer_upper.graphics.lineTo(185,303);
				hit_drawer_upper.graphics.lineTo(201,377);
				hit_drawer_upper.graphics.lineTo(110,484);
				hit_drawer_upper.graphics.lineTo(0,401);
				
				hit_drawer_upper.graphics.endFill(false);
				hit_drawer_upper.alpha = 0.0;
				
				hit_drawer_upper.graphics.precisionHitTest = true;				
			}
			hit_drawer_upper.touchable = false;
			
		}		
		private function CreateDrawerLowerHit(open:Boolean = false):void{
			hit_drawer_lower = new Shape();
			this.addChild(hit_drawer_lower);
			if(open === false){
				
				hit_drawer_lower.x = 0;
				hit_drawer_lower.y = 0;
				hit_drawer_lower.graphics.beginFill(0x0000FF);
				
				hit_drawer_lower.graphics.lineTo(77,346);
				hit_drawer_lower.graphics.lineTo(211,393);
				hit_drawer_lower.graphics.lineTo(230,481);
				hit_drawer_lower.graphics.lineTo(108,434);
				
				hit_drawer_lower.graphics.endFill(false);
				
				hit_drawer_lower.alpha = 0.0;
				
				hit_drawer_lower.graphics.precisionHitTest = true;	
			}else{
				
				hit_drawer_lower.x = 0;
				hit_drawer_lower.y = 0;
				hit_drawer_lower.graphics.beginFill(0x0000FF);	
				
				hit_drawer_lower.graphics.lineTo(0,430);
				hit_drawer_lower.graphics.lineTo(84,359);
				hit_drawer_lower.graphics.lineTo(204,394);
				hit_drawer_lower.graphics.lineTo(225,460);
				hit_drawer_lower.graphics.lineTo(184,512);
				hit_drawer_lower.graphics.lineTo(20,512);
				
				hit_drawer_lower.graphics.endFill(false);
				hit_drawer_lower.alpha = 0.0;
				
				hit_drawer_lower.graphics.precisionHitTest = true;				
			}
			hit_drawer_lower.touchable = false;
			
		}		
		private function CreateTopHit(open:Boolean = false):void{
			hit_top = new Shape();
			this.addChild(hit_top);
			if(open === false){
				
				hit_top.x = 0;
				hit_top.y = 0;
				hit_top.graphics.beginFill(0x0000FF);
				
				hit_top.graphics.lineTo(187,16);
				hit_top.graphics.lineTo(275,7);
				hit_top.graphics.lineTo(312,54);
				hit_top.graphics.lineTo(238,84);
							
				hit_top.graphics.endFill(false);
				
				hit_top.alpha = 0.0;
				
				hit_top.graphics.precisionHitTest = true;	
			}else{
				
				hit_top.x = 0;
				hit_top.y = 0;
				hit_top.graphics.beginFill(0x0000FF);	
				
				hit_top.graphics.lineTo(71,119);
				hit_top.graphics.lineTo(95,113);
				hit_top.graphics.lineTo(138,120);
				hit_top.graphics.lineTo(166,93);
				hit_top.graphics.lineTo(199,113);
				hit_top.graphics.lineTo(183,144);
				hit_top.graphics.lineTo(150,155);
				hit_top.graphics.lineTo(112,152);
				hit_top.graphics.lineTo(89,143);
								
				hit_top.graphics.endFill(false);
				hit_top.alpha = 0.0;
				
				hit_top.graphics.precisionHitTest = true;				
			}
			hit_top.touchable = false;
			
		}		
		private function CreateKeyHit():void{
			hit_key = new Shape();
			hit_key.touchable = false;
			hit_key.graphics.beginFill(0xff0000);
			
			hit_key.graphics.lineTo(294,254);	
			hit_key.graphics.lineTo(338,244);	
			hit_key.graphics.lineTo(392,260);	
			hit_key.graphics.lineTo(401,300);	
			hit_key.graphics.lineTo(356,319);	
			hit_key.graphics.lineTo(290,303);	
			
			
			hit_key.graphics.endFill(false);
			hit_key.alpha = 0.0;
			
			hit_key.graphics.precisionHitTest = true;	
			this.addChild(hit_key);
		}
		
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(406,237);	
			hit_book.graphics.lineTo(535,157);	
			hit_book.graphics.lineTo(621,165);	
			hit_book.graphics.lineTo(741,242);	
			hit_book.graphics.lineTo(735,270);	
			hit_book.graphics.lineTo(640,369);	
			
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if (touches[0].phase == TouchPhase.ENDED) {
					if(Animating === false){
						if(BookIsOpen === false){						
							trace(touches[0].globalX+" ,"+touches[0].globalY);
							if(targ == goback.SourceImage){
								
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((RocketRoom as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomObj,true
								);
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								BookIsOpen = true;
								OpenBook(true, openBookcurrentPage)
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk;
								}		
								SaveArray['Book'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomDesk',SaveArray);
							}else if(hit_key.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								KeyHandler();
							}else if(hit_top.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								TopHandler();
							}else if(hit_drawer_upper.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								DrawerUpperHandler();
							}else if(hit_drawer_lower.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								DrawerLowerHandler();
							}else if(hit_head.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								HeadHandler();
							}else if(hit_slime.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SlimeHandler();
							}else if(hit_blueprint.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								BluePrintHandler();
							}else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FloorHandler();
							}
							
						}else{
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								trace("GoBackClick");
								RemoveBook();
								BookIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk;
								}		
								SaveArray['Book'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomDesk',SaveArray);
							}else if(hit_openBookNext.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk;
								}
								
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
									openBookPages.texture = this.assets.getTexture('CryptoBook_page_1');
								}else if(openBookcurrentPage == 1){
									SaveArray['BookCurrentPage'] = 2;
									openBookcurrentPage = 2;
									openBookPages.texture = this.assets.getTexture('CryptoBook_page_2');
								}else if(openBookcurrentPage == 2){
									SaveArray['BookCurrentPage'] = 3;
									openBookcurrentPage = 3;
									openBookPages.texture = this.assets.getTexture('CryptoBook_page_3');
								}else if(openBookcurrentPage == 3){
									SaveArray['BookCurrentPage'] = 4;
									openBookcurrentPage = 4;
									openBookPages.texture = this.assets.getTexture('CryptoBook_page_4');
								}else if(openBookcurrentPage == 4){
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
									openBookPages.texture = this.assets.getTexture('CryptoBook_page_0');
								}
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomDesk',SaveArray);
							}
							else if(hit_openBookBack.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk;
								}
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 4;
									openBookcurrentPage = 4;
									openBookPages.texture = this.assets.getTexture('CryptoBook_page_4');
								}else if(openBookcurrentPage == 1){
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
									openBookPages.texture = this.assets.getTexture('CryptoBook_page_0');
								}else if(openBookcurrentPage == 2){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
									openBookPages.texture = this.assets.getTexture('CryptoBook_page_1');
								}else if(openBookcurrentPage == 3){
									SaveArray['BookCurrentPage'] = 2;
									openBookcurrentPage = 2;
									openBookPages.texture = this.assets.getTexture('CryptoBook_page_2');
								}else if(openBookcurrentPage == 4){
									SaveArray['BookCurrentPage'] = 3;
									openBookcurrentPage = 3;
									openBookPages.texture = this.assets.getTexture('CryptoBook_page_3');
								}
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomDesk',SaveArray);
							}
						}
					}
				
				}
			}
		}
		private function HeadHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A broken and burnt animatronic human head.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The face and skull are made from ultra-thin metals and polyurethane, now brittle from extreme heat.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It looks like the skull burnt from the inside out, there are even traces of small explosions...");
			}
		}
		private function SlimeHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An oily light blue fluid has oozed from the broken head.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The ooze must have been some sort of lubricant for the minute parts of the robotic head and face...");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The oily ooze is thick and viscous; it sticks to my fingers.");
			}
		}
		private function BluePrintHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Blueprints cover the table...");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The blueprints depict mechanical parts of dizzying complexity.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The blueprint looks to be concerned with the mechanics of the animatronic head.");
			}
		}
		private function FloorHandler():void{
			(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The oily fluid has dripped onto the floor.");
		}
		
		private function DrawerUpperHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk;	
			}
			if(UpperDrawerOpen === false){
				UpperDrawerOpen = true;
				hit_drawer_upper.graphics.clear();
				CreateDrawerUpperHit(true);
				if(LowerDrawerOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
					SaveArray['Drawer'] = 'Upper';
					drawer.texture  = this.assets.getTexture('drawer_upper');
					drawer.alpha = 1;
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
					SaveArray['Drawer'] = 'Both';
					drawer.texture  = this.assets.getTexture('drawer_both');
					drawer.alpha = 1;
				}
			}else{
				UpperDrawerOpen = false;
				hit_drawer_upper.graphics.clear();
				CreateDrawerUpperHit(false);
				if(LowerDrawerOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
					SaveArray['Drawer'] = 'Closed';
					drawer.alpha = 0;
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
					SaveArray['Drawer'] = 'Lower';
					drawer.texture  = this.assets.getTexture('drawer_lower');
					drawer.alpha = 1;
				}
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomDesk',SaveArray);
		}
		private function DrawerLowerHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk;	
			}
			if(LowerDrawerOpen === false){
				LowerDrawerOpen = true;
				hit_drawer_lower.graphics.clear();
				CreateDrawerLowerHit(true);
				if(UpperDrawerOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
					SaveArray['Drawer'] = 'Lower';
					drawer.texture  = this.assets.getTexture('drawer_lower');
					drawer.alpha = 1;
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
					SaveArray['Drawer'] = 'Both';
					drawer.texture  = this.assets.getTexture('drawer_both');
					drawer.alpha = 1;
				}
			}else{
				LowerDrawerOpen = false;
				hit_drawer_lower.graphics.clear();
				CreateDrawerLowerHit(false);
				if(UpperDrawerOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
					SaveArray['Drawer'] = 'Closed';
					drawer.alpha = 0;
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
					SaveArray['Drawer'] = 'Upper';
					drawer.texture  = this.assets.getTexture('drawer_upper');
					drawer.alpha = 1;
				}
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomDesk',SaveArray);
		}
		private function TopHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk;	
			}
			if(TopOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClinkOne();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				TopOpen = true;
				top_on.alpha = 0;
				top_off.alpha = 1;
				hit_top.graphics.clear();
				CreateTopHit(true);
				SaveArray['Top'] = "Off";
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClinkOne();
				TopOpen = false;
				top_on.alpha = 1;
				top_off.alpha = 0;
				hit_top.graphics.clear();
				CreateTopHit(false);
				SaveArray['Top'] = "On";
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomDesk',SaveArray);
			
		}
		
		private function KeyHandler():void{
			if(KeyPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomDesk;	
				}
				KeyPickedUp = true;
				key.alpha = 0;
				SaveArray['Key'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomDesk',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_SmallKey,
					'item_SmallKey',
					'inven_smallKey_sm'
				);
			}else{
				
			}
		}
		
		
		private function OpenBook(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openBook = new Sprite();
			openBook.alpha = 0;
			CreateOpenBookBg();
			openBookPages = new Image((stage.getChildAt(0) as Object).CryptoBookImages.assets.getTexture("CryptoBook_page_0"));
			//	openBookPages = new Image(this.assets.getTexture('queens_page_one'));
			this.openBook.addChildAt(openBookbg,0);
			openBook.addChild(openBookPages);
			openBookPages.touchable = false;
			
			
			this.addChildAt(openBook,5);
			this.addChildAt(goback,6);
			
			if(openBookcurrentPage == 0){
				openBookPages.texture = (stage.getChildAt(0) as Object).CryptoBookImages.assets.getTexture("CryptoBook_page_0");
			}else if(openBookcurrentPage == 1){
				openBookPages.texture = (stage.getChildAt(0) as Object).CryptoBookImages.assets.getTexture("CryptoBook_page_1");
				//	openBookPages.texture = this.assets.getTexture('queens_page_two');
			}else if(openBookcurrentPage == 2){
				openBookPages.texture = (stage.getChildAt(0) as Object).CryptoBookImages.assets.getTexture("CryptoBook_page_2");
				//	openBookPages.texture = this.assets.getTexture('queens_page_three');
			}else if(openBookcurrentPage == 3){
				openBookPages.texture = (stage.getChildAt(0) as Object).CryptoBookImages.assets.getTexture("CryptoBook_page_3");
				//	openBookPages.texture = this.assets.getTexture('queens_page_four');
			}else if(openBookcurrentPage == 4){
				openBookPages.texture = (stage.getChildAt(0) as Object).CryptoBookImages.assets.getTexture("CryptoBook_page_4");
				//	openBookPages.texture = this.assets.getTexture('queens_page_five');
			}
			
			CreateOpenBookHit()
			//	CreateOpenBookHit(openBookcurrentPage);
			
			if(Fade === false){
				Animating = false;
				openBook.alpha = 1;
				
			}else{
				
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookDouble('crypto_book_page_00','crypto_book_page_01');
			//	game.screenGamePlayHandler.NoteBookObj.AddToNoteBook('crypto_book');
				OpenBookTween = new Tween(openBook, 0.5, Transitions.LINEAR);
				OpenBookTween.fadeTo(1);
				OpenBookTween.onComplete = function():void{
					//	CreateOpenNotePadHit();
					Animating = false;
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
				//hit_OpenBook.graphics.clear();
				//	hit_openBookBack.graphics.clear();
				//	hit_openBookNext.graphics.clear();
				Animating = false;
				CloseBook();
				
			};
			Starling.juggler.add(OpenBookTween);		
		}
		
		public function CloseBook():void{
			this.removeChild(openBook);
			openBook.dispose();
		}
		
		private function CreateOpenBookHit():void{
			hit_openBookBack = new Shape();
			this.addChild(hit_openBookBack);
			hit_openBookBack.graphics.beginFill(0x00ff00);
			hit_openBookBack.graphics.lineTo(65,15);		
			hit_openBookBack.graphics.lineTo(287,0);		
			hit_openBookBack.graphics.lineTo(380,7);		
			hit_openBookBack.graphics.lineTo(385,490);		
			hit_openBookBack.graphics.lineTo(269,493);		
			hit_openBookBack.graphics.lineTo(50,504);		
			
			hit_openBookBack.graphics.endFill(false);
			hit_openBookBack.alpha = 0.0;
			hit_openBookBack.touchable = false;
			hit_openBookBack.graphics.precisionHitTest = true;	
			
			hit_openBookNext = new Shape();
			this.addChild(hit_openBookNext);
			hit_openBookNext.graphics.beginFill(0x00ff00);
			hit_openBookNext.graphics.lineTo(390,5);		
			hit_openBookNext.graphics.lineTo(545,3);		
			hit_openBookNext.graphics.lineTo(714,384);		
			hit_openBookNext.graphics.lineTo(395,494);		
			
			hit_openBookNext.graphics.endFill(false);
			hit_openBookNext.alpha = 0.0;
			hit_openBookNext.touchable = false;
			hit_openBookNext.graphics.precisionHitTest = true;	
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
			
			
			
			this.assets.removeTexture("rocketRoomDesk_bg",true);
			this.assets.removeTexture("RocketRoomDesk_Sprite_01",true);
			this.assets.removeTextureAtlas("RocketRoomDesk_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomDesk_01");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomDesk_02");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomDesk_03");
			
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
