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
		
	public class ExteriorCarRear extends Sprite
	{
		
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var gas_mask:Image;
		private var case_open:Image;
		private var case_closed:Image;
		private var stone:Image;
		
		private var hit_gas_mask:Shape;
		private var hit_book:Shape;
		private var hit_case:Shape;
		private var hit_stone:Shape;
		
		private var hit_rock:Shape;
		private var hit_screens:Shape;
		private var hit_shelf:Shape;
		private var hit_boxes:Shape;
		private var hit_stool:Shape;
		private var hit_console:Shape;
		
		private var RONum:int = 0;
		
		private var openBookbg:Shape;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookcurrentPage:Number = 0;
		
		private var hit_openBookBack:Shape;
		private var hit_openBookNext:Shape;
		
		public var OpenBookTween:Tween;
		private var BookIsOpen:Boolean = false;
		
		//	private var hit_elevator_door:Shape;
		
		private var Animating:Boolean = false;
		private var CaseOpen:Boolean = false;
		private var CaseUnlocked:Boolean = false;
		private var MaskPickedUp:Boolean = false;
		private var StoneUnlocked:Boolean = false;
		private var StonePickedUp:Boolean = false;
		
		private var RedRockPickedUp:Boolean = false;
		
		private var DrillUsed:Boolean = false;
		private var ChiselUsed:Boolean = false;
	//	private var SatMeltRemoved:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function ExteriorCarRear(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('exteriorCarRear_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCarRear/exteriorCarRear_bg.jpg'));
				game.TrackAssets('exteriorCarRear_01');
			}
			if(game.CheckAsset('exteriorCarRear_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCarRear/ExteriorCarRear_Sprite_01.png'));
				game.TrackAssets('exteriorCarRear_02');
			}
			if(game.CheckAsset('exteriorCarRear_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCarRear/ExteriorCarRear_Sprite_01.xml'));
				game.TrackAssets('exteriorCarRear_03');
			}
			if(game.CheckAsset('exteriorCarRear_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCarRear/ChaosBook_SpriteSheet_01.png'));
				game.TrackAssets('exteriorCarRear_04');
			}
			if(game.CheckAsset('exteriorCarRear_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCarRear/ChaosBook_SpriteSheet_01.xml'));
				game.TrackAssets('exteriorCarRear_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ExteriorCarRear","ExteriorCarRearObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('exteriorCarRear_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			
			gas_mask = new Image(this.assets.getTexture('gas_mask'));
			gas_mask.touchable = false;
			gas_mask.x = 65;
			gas_mask.y = 238;
			
			stone = new Image(this.assets.getTexture('stone_covered'));
			stone.touchable = false;
			stone.x = 520;
			stone.y = 211;
			
			case_closed = new Image(this.assets.getTexture('case_closed'));
			case_closed.touchable = false;
			case_closed.x = 417;
			case_closed.y = 165;
			
			case_open = new Image(this.assets.getTexture('case_open'));
			case_open.touchable = false;
			case_open.x = 368;
			case_open.y = 327;
			
		//	if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat != undefined){
		//		if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat['MeltRemoved'] == 'Yes'){
		//			SatMeltRemoved = true;		
		//		}
			
		//	}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCube != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCube['RedRock'] = "PickedUp"){
					
					RedRockPickedUp = true;
				}
				
			}
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){	
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear['GasMask'] == 'PickedUp'){	
					MaskPickedUp = true;
					gas_mask.alpha = 0;
				}else{
					gas_mask.alpha = 1;
				}
				
			
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear['DrillUsed'] == 'Yes'){	
					DrillUsed = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear['ChiselUsed'] == 'Yes'){	
					ChiselUsed = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear['CaseUnlocked'] == 'Yes'){	
					CaseUnlocked = true;	
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear['Case'] == 'Open'){	
					CaseOpen = true;	
					case_closed.alpha = 0;
					case_open.alpha = 1;
				}else{
					case_closed.alpha = 1;
					case_open.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear['StoneUnlocked'] == 'Yes'){	
					StoneUnlocked = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear['Stone'] == 'PickedUp'){	
						StonePickedUp = true;
						stone.texture = this.assets.getTexture('stone_empty');
					}else{
					
						stone.texture = this.assets.getTexture('stone_uncovered');
					}
				}
				
			}else{
				gas_mask.alpha = 1;
				case_closed.alpha = 1;
				case_open.alpha = 0;
			}
			
			
			stone.alpha = 1;
			
			
			this.addChildAt(gas_mask,1)
			this.addChildAt(stone,2)
			this.addChildAt(case_closed,3)		
			this.addChildAt(case_open,4)
			
			CreateStoolHit();		
			CreateConsoleHit();
			CreateBoxesHit();
			CreateShelfHit();
			CreateRockHit();
			CreateScreensHit();
				
			CreateGasMaskHit();
			CreateBookHit();	
			CreateCaseHit(CaseOpen);
			CreateStoneHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear["Book"] == "open"){
					trace("Book is Open");
					BookIsOpen = true;
					//	OpenBook();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear["BookCurrentPage"] == 0){
						openBookcurrentPage = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear["BookCurrentPage"] == 1){
						openBookcurrentPage = 1;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear["BookCurrentPage"] == 2){
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
		//hit_gas_mask
		private function CreateCaseHit(open:Boolean = false):void{
			hit_case = new Shape();		
			hit_case.x = 0;
			hit_case.y = 0;
			hit_case.graphics.beginFill(0x0000FF);
			if(open === false){	
			
				hit_case.graphics.lineTo(423,164);	
				hit_case.graphics.lineTo(728,180);	
				hit_case.graphics.lineTo(710,384);	
				hit_case.graphics.lineTo(417,346);	
				
				
			}else{
				
				hit_case.graphics.lineTo(392,353);	
				hit_case.graphics.lineTo(417,325);	
				hit_case.graphics.lineTo(710,360);	
				hit_case.graphics.lineTo(720,400);	
				hit_case.graphics.lineTo(613,414);	
				hit_case.graphics.lineTo(550,405);	
				hit_case.graphics.lineTo(535,372);	
				hit_case.graphics.lineTo(489,356);	
				hit_case.graphics.lineTo(408,361);	
			
			}
			
			hit_case.graphics.endFill(false);			
			hit_case.alpha = 0.0;			
			hit_case.graphics.precisionHitTest = true;	
			hit_case.touchable = false
			this.addChild(hit_case);
			
		}
		
		private function CreateScreensHit():void{
			hit_screens = new Shape();
			hit_screens.touchable = false;
			hit_screens.graphics.beginFill(0xff0000);
			
			hit_screens.graphics.lineTo(29,0);	
			hit_screens.graphics.lineTo(131,0);	
			hit_screens.graphics.lineTo(321,44);	
			hit_screens.graphics.lineTo(319,136);	
			hit_screens.graphics.lineTo(49,142);	
		
			hit_screens.graphics.endFill(false);
			hit_screens.alpha = 0.0;
			
			hit_screens.graphics.precisionHitTest = true;	
			this.addChild(hit_screens);
		}
		
		
		private function CreateRockHit():void{
			hit_rock = new Shape();
			hit_rock.touchable = false;
			hit_rock.graphics.beginFill(0xff0000);
			
			hit_rock.graphics.lineTo(448,216);	
			hit_rock.graphics.lineTo(540,181);	
			hit_rock.graphics.lineTo(636,202);	
			hit_rock.graphics.lineTo(696,265);	
			hit_rock.graphics.lineTo(627,343);	
			hit_rock.graphics.lineTo(523,330);	
			hit_rock.graphics.lineTo(484,309);	
			
			hit_rock.graphics.endFill(false);
			hit_rock.alpha = 0.0;
			
			hit_rock.graphics.precisionHitTest = true;	
			this.addChild(hit_rock);
		}
		
		private function CreateShelfHit():void{
			hit_shelf = new Shape();
			hit_shelf.touchable = false;
			hit_shelf.graphics.beginFill(0xff0000);
			
			hit_shelf.graphics.lineTo(336,53);	
			hit_shelf.graphics.lineTo(427,78);	
			hit_shelf.graphics.lineTo(422,163);	
			hit_shelf.graphics.lineTo(416,244);	
			hit_shelf.graphics.lineTo(384,263);	
			hit_shelf.graphics.lineTo(329,152);	
			hit_shelf.graphics.lineTo(331,152);	
		
			hit_shelf.graphics.endFill(false);
			hit_shelf.alpha = 0.0;
			
			hit_shelf.graphics.precisionHitTest = true;	
			this.addChild(hit_shelf);
		}
		
		
		private function CreateBoxesHit():void{
			hit_boxes = new Shape();
			hit_boxes.touchable = false;
			hit_boxes.graphics.beginFill(0xff0000);
			
			hit_boxes.graphics.lineTo(435,103);	
			hit_boxes.graphics.lineTo(590,51);	
			hit_boxes.graphics.lineTo(618,111);	
			hit_boxes.graphics.lineTo(729,116);	
			hit_boxes.graphics.lineTo(734,177);	
			hit_boxes.graphics.lineTo(445,162);	
		
			hit_boxes.graphics.endFill(false);
			hit_boxes.alpha = 0.0;
			
			hit_boxes.graphics.precisionHitTest = true;	
			this.addChild(hit_boxes);
		}
		
		
		private function CreateStoolHit():void{
			hit_stool = new Shape();
			hit_stool.touchable = false;
			hit_stool.graphics.beginFill(0xff0000);
			
			hit_stool.graphics.lineTo(379,374);	
			hit_stool.graphics.lineTo(488,358);	
			hit_stool.graphics.lineTo(528,374);	
			hit_stool.graphics.lineTo(545,410);	
			hit_stool.graphics.lineTo(478,437);	
			hit_stool.graphics.lineTo(381,408);	
		
			hit_stool.graphics.endFill(false);
			hit_stool.alpha = 0.0;
			
			hit_stool.graphics.precisionHitTest = true;	
			this.addChild(hit_stool);
		}
		
		private function CreateConsoleHit():void{
			hit_console = new Shape();
			hit_console.touchable = false;
			hit_console.graphics.beginFill(0xff0000);
			
			hit_console.graphics.lineTo(30,171);	
			hit_console.graphics.lineTo(202,160);	
			hit_console.graphics.lineTo(207,296);	
			hit_console.graphics.lineTo(47,357);	
			
			hit_console.graphics.endFill(false);
			hit_console.alpha = 0.0;
			
			hit_console.graphics.precisionHitTest = true;	
			this.addChild(hit_console);
		}
		private function CreateStoneHit():void{
			hit_stone = new Shape();
			hit_stone.touchable = false;
			hit_stone.graphics.beginFill(0xff0000);
			
			hit_stone.graphics.lineTo(520,257);	
			hit_stone.graphics.lineTo(561,206);	
			hit_stone.graphics.lineTo(600,214);	
			hit_stone.graphics.lineTo(618,268);	
			hit_stone.graphics.lineTo(598,310);	
			hit_stone.graphics.lineTo(530,296);	
		
			hit_stone.graphics.endFill(false);
			hit_stone.alpha = 0.0;
			
			hit_stone.graphics.precisionHitTest = true;	
			this.addChild(hit_stone);
		}
		private function CreateGasMaskHit():void{
			hit_gas_mask = new Shape();
			hit_gas_mask.touchable = false;
			hit_gas_mask.graphics.beginFill(0xff0000);
			
			hit_gas_mask.graphics.lineTo(59,302);	
			hit_gas_mask.graphics.lineTo(151,224);	
			hit_gas_mask.graphics.lineTo(211,229);	
			hit_gas_mask.graphics.lineTo(227,304);	
			hit_gas_mask.graphics.lineTo(208,343);	
			hit_gas_mask.graphics.lineTo(107,370);	
			hit_gas_mask.graphics.lineTo(72,359);	
		
			hit_gas_mask.graphics.endFill(false);
			hit_gas_mask.alpha = 0.0;
			
			hit_gas_mask.graphics.precisionHitTest = true;	
			this.addChild(hit_gas_mask);
		}
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(215,165);	
			hit_book.graphics.lineTo(348,164);	
			hit_book.graphics.lineTo(368,268);	
			hit_book.graphics.lineTo(261,272);	
			hit_book.graphics.lineTo(226,259);	
		
			
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
	/*	private function CreateOpenBookHit():void{
			hit_OpenBook = new Shape();
			hit_OpenBook.touchable = false;
			hit_OpenBook.graphics.beginFill(0xff0000);
			
			hit_OpenBook.graphics.lineTo(211,0);	
			hit_OpenBook.graphics.lineTo(585,0);	
			hit_OpenBook.graphics.lineTo(585,512);	
			hit_OpenBook.graphics.lineTo(211,512);	
			
			
			hit_OpenBook.graphics.endFill(false);
			hit_OpenBook.alpha = 0.1;
			
			hit_OpenBook.graphics.precisionHitTest = true;	
			this.addChild(hit_OpenBook);
		}
	*/
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
		//
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
								
								FadeOut((ExteriorRear as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorRearObj,true
								);
							}else if(hit_gas_mask.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								MaskHandler();
							}else if(hit_case.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								CaseHandler();
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								BookIsOpen = true;
								OpenBook(true, 0);
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear;
								}		
								SaveArray['Book'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarRear',SaveArray);
							}else if(hit_screens.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The van's equipment is picking up a signal across multiple wave-lengths.");	
							}else if(hit_boxes.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Several smaller specimen boxes sit atop the large crate.");
							}else if(hit_shelf.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The shelf is filled with archaeological tools.");
							}else if(hit_stool.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A stool.");
							}else if(hit_console.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
								ConsoleHandler();
								
							}else if(CaseOpen === true){
								if(hit_stone.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									StoneHandler();
								}else if(hit_rock.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									RockHandler();
								}
							}
							
							
							/*
							
							private var hit_rock:Shape;
							private var hit_screens:Shape;
							private var hit_shelf:Shape;
							private var hit_boxes:Shape;
							private var hit_stool:Shape;
							private var hit_console:Shape;
							
							*/
							
						}else{
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								trace("GoBackClick");
								RemoveBook();
								BookIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear;
								}		
								SaveArray['Book'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarRear',SaveArray);
							
								
								hit_openBookNext
								
							}else if(hit_openBookNext.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear;									
								}
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
									openBookPages.texture = this.assets.getTexture('ChaosBook_page_01');
								}else if(openBookcurrentPage == 1){
									SaveArray['BookCurrentPage'] = 2;
									openBookcurrentPage = 2;
									openBookPages.texture = this.assets.getTexture('ChaosBook_page_02');
								}else if(openBookcurrentPage == 2){
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
									openBookPages.texture = this.assets.getTexture('ChaosBook_page_00');
									
								}								
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarRear',SaveArray);
							}else if(hit_openBookBack.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear;									
								}
								if(openBookcurrentPage == 2){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
									openBookPages.texture = this.assets.getTexture('ChaosBook_page_01');			
									
								}else if(openBookcurrentPage == 1){
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0
									openBookPages.texture = this.assets.getTexture('ChaosBook_page_00');
									
								}else if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 2;
									openBookcurrentPage = 2
									openBookPages.texture = this.assets.getTexture('ChaosBook_page_02');	
									
									
								}								
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarRear',SaveArray);
							}
							//
								
						}
					}
				}
			}
		}
		
		
		private function ConsoleHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A control and calibration console... but for what?");				
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The van must be outfitted with some sort of equipment for picking up ambient signals.");				
				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A control and calibration console... but for what?");
				
			}
		}
		private function RockHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The stone must weigh 1000 kilograms.");				
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The stone is reddish and very hard.");
				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The large stone looks like it comes from far away.");
				
			}
		}
		
		private function StoneHandler():void{
			if(StoneUnlocked === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Drill)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrillQuick();
					Animating = true;
					StoneUnlocked = true;	
					
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear;	
					}
					DrillUsed = true;
					SaveArray['DrillUsed'] = "Yes";
					SaveArray['StoneUnlocked'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarRear',SaveArray);
					
				//	if(SatMeltRemoved === true){
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_Drill,
								"item_Drill"
							);
			//		}
					
					Starling.juggler.delayCall(OpenStone,1.5);
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Chisel)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HammerTap();
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClinkOne();
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					StoneUnlocked = true;	
				//	stone.texture = this.assets.getTexture('stone_uncovered');
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I was able to remove most of the surrounding stone!");
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear;	
					}
					
					ChiselUsed = true;
					SaveArray['ChiselUsed'] = "Yes";
					SaveArray['StoneUnlocked'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarRear',SaveArray);
					Starling.juggler.delayCall(OpenStone,1.5);
				
					if(RedRockPickedUp === true){
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_Chisel,
								"item_Chisel"
							);
						
					}
					
				}else{
					
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is another type of stone encased within the rock");
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I will have to drill and chisel away the surrounding stone to get a better look.");
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The encased stone has curving patterns on its exposed surface.");
					}
				}
			}else{
				if(StonePickedUp == false){
					if((stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.armedItem
						== 
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.inventoryBarObj
						.item_Chisel)
					{
		//				private var DrillUsed:Boolean = true;
		//				private var ChiselUsed:Boolean = true;
						if(ChiselUsed === false){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
								(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_StoneOne,
								'item_StoneOne',
								'inven_stoneOne_sm'
							);
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HammerTap();
						//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClinkOne();
							//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
							
							if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
								
								Starling.juggler.delayCall(function():void{
									(stage.getChildAt(0) as Object).MusicObj.LoadSubBop(true,3);
									
								},0.5);
							}
							StonePickedUp = true;
							stone.texture = this.assets.getTexture('stone_empty');
							
							
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){	
								SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear;	
							}
							/*	private var DrillUsed:Boolean = false;
							private var ChiselUsed:Boolean = false;*/
							SaveArray['ChiselUsed'] = "Yes";
							SaveArray['Stone'] = "PickedUp";
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarRear',SaveArray);
							
							if(RedRockPickedUp === true){
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
									.InventoryObj.removeItemFromInventory(
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.item_Chisel,
										"item_Chisel"
									);
						
							}
						}else{
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I don't think I can remove anymore of the surrounding stone with the chisel and hammer.");
						}
						
					}else if((stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.armedItem
						== 
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.inventoryBarObj
						.item_Drill)
					{
						if(DrillUsed === false){
							if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
								(stage.getChildAt(0) as Object).MusicObj.LoadSubBop(true,3);
							}
						
						//	Starling.juggler.delayCall(function():void{
								
								(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_StoneOne,
									'item_StoneOne',
									'inven_stoneOne_sm'
								);
								
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_Drill,
									"item_Drill"
								);
								
								StonePickedUp = true;
								stone.texture = this.assets.getTexture('stone_empty');
								
								
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){	
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear;	
								}
								
								SaveArray['DrillUsed'] = "Yes";
								SaveArray['Stone'] = "PickedUp";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarRear',SaveArray);
								
								Animating = false;
						//	},0.5);
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrillSlow();	
	
						}else{
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I don't think I can remove anymore of the surrounding stone with the drill.");
						}
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The stone still won't budge. I need to find a way to get it free...");
					}
				}
			}
		}
		
		private function OpenStone():void{
			Animating = false;
			stone.texture = this.assets.getTexture('stone_uncovered');
			(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I was able to remove most of the surrounding stone!");
		}
		
		private function CaseHandler():void{
			if(CaseUnlocked === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Crowbar)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WoodPry();
					
					CaseUnlocked = true;
					CaseOpen = true;
					
					Animating = true;
						
					hit_case._graphics.clear();
					CreateCaseHit(true);
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear;	
					}
					SaveArray['Case'] = "Open";
					SaveArray['CaseUnlocked'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarRear',SaveArray);
					
					Starling.juggler.delayCall(OpenCase,3);
					
					
					
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_Crowbar,
							"item_Crowbar"
						);
					
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadMarsLanding(true,2);
							
						},0.5);
					}
					
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Drill)
				{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are too many nails to try and drill the case open. I need something to pry the lid off.");
					
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFXDrillQuick();
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoorTwo();
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Chisel)
				{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are too many nails in the lid. It would take forever to chip enough wood away. I need something to pry the lid off.");
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoorTwo();
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoorTwo();
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The wooden crate is nailed tightly shut...");
						
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I need to pry it open...");
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoorTwo();
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'Specimen'... I wonder what's in there.");
						
					}
					
				
				}
			}else{
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear;	
				}
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ChestOpen();
				if(CaseOpen === false){
					CaseOpen = true;				
					case_closed.alpha = 0;
					case_open.alpha = 1;					
					hit_case._graphics.clear();
					
					SaveArray['Case'] = "Open";
					
					CreateCaseHit(true);
				}else{
					CaseOpen = false;					
					case_closed.alpha = 1;
					case_open.alpha = 0;
					hit_case._graphics.clear();
					
					SaveArray['Case'] = "Closed";
					
					CreateCaseHit(false);
				}
				
				
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarRear',SaveArray);
			}
		
		}
		
		private function OpenCase():void{
			case_closed.alpha = 0;
			case_open.alpha = 1;	
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ChestOpen();
			Animating = false;
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
			},0.35);
			
		}
		
		private function MaskHandler():void{
			if(MaskPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear;	
				}
				MaskPickedUp = true;
				gas_mask.alpha = 0;
				SaveArray['GasMask'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarRear',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_GasMask,
					'item_GasMask',
					'inven_gasMask_sm'
				);
			}
		}
		
		private function OpenBook(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openBook = new Sprite();
			openBook.alpha = 0;
			CreateOpenBookBg();
			openBookPages = new Image(this.assets.getTexture('ChaosBook_page_00'));
			this.openBook.addChildAt(openBookbg,0);
			openBook.addChild(openBookPages);
			openBookPages.touchable = false;
			
			
			this.addChild(openBook);
			this.addChild(goback);
			
			if(openBookcurrentPage == 0){
				openBookPages.texture = this.assets.getTexture('ChaosBook_page_00');
			}else if(openBookcurrentPage == 1){
				openBookPages.texture = this.assets.getTexture('ChaosBook_page_01');
			}else if(openBookcurrentPage == 2){
				openBookPages.texture = this.assets.getTexture('ChaosBook_page_02');
			}
			
			CreateOpenBookHit();
			//CreateOpenBookHit(openBookcurrentPage);
			
			if(Fade === false){
				Animating = false;
				openBook.alpha = 1;
				//	CreateOpenBookHit();
			}else{
				
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
				hit_openBookNext.graphics.clear();
				hit_openBookBack.graphics.clear();
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
			
			
			
			this.assets.removeTexture("exteriorCarRear_bg",true);
			this.assets.removeTexture("ExteriorCarRear_Sprite_01",true);
			this.assets.removeTexture("ChaosBook_SpriteSheet_01",true);
			this.assets.removeTextureAtlas("ExteriorCarRear_Sprite_01",true);
			this.assets.removeTextureAtlas("ChaosBook_SpriteSheet_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("exteriorCarRear_01");
			(stage.getChildAt(0) as Object).falseAsset("exteriorCarRear_02");
			(stage.getChildAt(0) as Object).falseAsset("exteriorCarRear_03");
			(stage.getChildAt(0) as Object).falseAsset("exteriorCarRear_04");
			(stage.getChildAt(0) as Object).falseAsset("exteriorCarRear_05");
			
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
