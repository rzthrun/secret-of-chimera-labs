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
	
	public class BuildingOfficeDesk extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var drawer_upper:Image;
		private var drawer_middle:Image;
		private var drawer_lower:Image;
		private var box:Image;
		private var fuse:Image;
		private var door:Image;
		private var knob:Image;
		private var allen_wrench:Image;
		private var screen:Image;
		
		private var hit_drawer_upper:Shape;
		private var hit_drawer_middle:Shape;
		private var hit_drawer_lower:Shape;
		private var hit_book:Shape;
		private var hit_box:Shape;
		private var hit_fuse:Shape;
		private var hit_knob:Shape;
		private var hit_allen_wrench:Shape;
		private var hit_screen:Shape;
		
		private var hit_blueprints:Shape;
		private var hit_chair:Shape;
		
		
		private var openBookbg:Shape;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookcurrentPage:Number = 0;
		
		private var hit_openBookBack:Shape;
		private var hit_openBookNext:Shape;
		
		private var hit_OpenBook:Shape;
		
		public var OpenBookTween:Tween;
		public var ScreenTween:Tween;
		
		private var BookIsOpen:Boolean = false;	
		private var DrawerUpperOpen:Boolean = false;
		private var DrawerMiddleOpen:Boolean = false;
		private var DrawerLowerOpen:Boolean = false;
		private var KnobPickedUp:Boolean = false;
		private var FusePickedUp:Boolean = false;
		private var AllenWrenchPickedUp:Boolean = false;
		private var BoxOpen:Boolean = false;
		private var ComputerOn:Boolean = false
		private var Animating:Boolean = false;
		
		
	
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function BuildingOfficeDesk(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('buildingOfficeDesk_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeDesk/buildingOfficeDesk_bg.jpg'));
				game.TrackAssets('buildingOfficeDesk_01');
			}
			if(game.CheckAsset('buildingOfficeDesk_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeDesk/BuildingOfficeDesk_Sprite_01.png'));
				game.TrackAssets('buildingOfficeDesk_02');
			}
			if(game.CheckAsset('buildingOfficeDesk_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeDesk/BuildingOfficeDesk_Sprite_01.xml'));
				game.TrackAssets('buildingOfficeDesk_03');
			}
			if(game.CheckAsset('buildingOfficeDesk_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeDesk/BuildingOfficeDesk_Sprite_02.png'));
				game.TrackAssets('buildingOfficeDesk_04');
			}
			if(game.CheckAsset('buildingOfficeDesk_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeDesk/BuildingOfficeDesk_Sprite_02.xml'));
				game.TrackAssets('buildingOfficeDesk_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BuildingOfficeDesk","BuildingOfficeDeskObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('buildingOfficeDesk_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
		
			drawer_lower = new Image(this.assets.getTexture('drawer_lower'));
			drawer_lower.touchable = false;
			drawer_lower.x = 153;
			drawer_lower.y = 423;
			
			drawer_middle = new Image(this.assets.getTexture('drawer_middle'));
			drawer_middle.touchable = false;
			drawer_middle.x = 142;
			drawer_middle.y = 366;
			
			drawer_upper = new Image(this.assets.getTexture('drawer_upper'));
			drawer_upper.touchable = false;
			drawer_upper.x = 131;
			drawer_upper.y = 298;
			
			door = new Image(this.assets.getTexture('door_closed'));
			door.touchable = false;
			door.x = 14;
			door.y = 0;
			
			box = new Image(this.assets.getTexture('box_open'));
			box.touchable = false;
			box.x = 450;
			box.y = 85;
			
			fuse = new Image(this.assets.getTexture('fuse'));
			fuse.touchable = false;
			fuse.x = 531;
			fuse.y = 107;
			
			allen_wrench = new Image(this.assets.getTexture('allen_wench'));
			allen_wrench.touchable = false;
			allen_wrench.x = 246;
			allen_wrench.y = 391;		
			
			knob = new Image(this.assets.getTexture('knob'));
			knob.touchable = false;
			knob.x = 217;
			knob.y = 357;			
			
			screen = new Image(this.assets.getTexture('screen_turn_on'));
			screen.touchable = false;
			screen.x = 48;
			screen.y = 14;			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['AllenWrench'] == 'PickedUp'){
					AllenWrenchPickedUp = true;					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['Knob'] == 'PickedUp'){
					KnobPickedUp = true;					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['Fuse'] == 'PickedUp'){
					FusePickedUp = true;					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['DrawerUpper'] == 'open'){
					DrawerUpperOpen = true;
					drawer_upper.alpha = 1;
					if(KnobPickedUp === false){
						knob.alpha = 1;
					}else{
						knob.alpha = 0;
					}
					CreateKnobHit();
				}else{
					drawer_upper.alpha = 0;
					knob.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['DrawerMiddle'] == 'open'){
					DrawerMiddleOpen = true;
					drawer_middle.alpha = 1;
					if(AllenWrenchPickedUp === false){
						allen_wrench.alpha = 1;
					}else{
						allen_wrench.alpha = 0;
					}
					CreateWrenchHit();
					
				}else{
					drawer_middle.alpha = 0;
					allen_wrench.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['DrawerLower'] == 'open'){
					DrawerLowerOpen = true;
					drawer_lower.alpha = 1;
				}else{
					drawer_lower.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['Box'] == 'open'){
					trace("THE BOX IS OPEN");
					BoxOpen = true;
					box.alpha = 1;
					if(FusePickedUp === true){
						fuse.alpha = 0;
					}else{
						fuse.alpha = 1;
					}
					
				}else{
					fuse.alpha = 0;
					box.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk['Computer'] == 'On'){
					ComputerOn = true;
					screen.texture = this.assets.getTexture('screen_on');
					screen.alpha = 1;
				}else{
					screen.alpha = 0;
				}
				
				
			}else{
				drawer_lower.alpha = 0;
				drawer_middle.alpha = 0;
				drawer_upper.alpha = 0;
				knob.alpha = 0;
				allen_wrench.alpha = 0;
				box.alpha = 0;
				fuse.alpha = 0;
				screen.alpha = 0;
			}
			
			
			door.alpha = 1;
			
			
			
			this.addChildAt(drawer_lower,1);
			this.addChildAt(drawer_middle,2);
			this.addChildAt(allen_wrench,3);
			this.addChildAt(drawer_upper,4);
			this.addChildAt(door,5);
			this.addChildAt(box,6);
			this.addChildAt(fuse,7);
			this.addChildAt(knob,8);
			this.addChildAt(screen,9);
			
			CreateChairHit();
			CreateBlueprintHit();
			
			CreateDrawerUpperHit(DrawerUpperOpen);
			CreateDrawerMiddleHit(DrawerMiddleOpen);
			CreateDrawerLowerHit(DrawerLowerOpen);
			CreateBoxHit(BoxOpen);
			CreateFuseHit();
			CreateBookHit();
			CreateScreenHit();
			
		
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk["Book"] == "open"){
					trace("Book is Open");
					BookIsOpen = true;
					//	OpenBook();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk["BookCurrentPage"] == 0){
						openBookcurrentPage = 0;
						//openBookPages.texture = this.assets.getTexture('buc_page_zero');
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk["BookCurrentPage"] == 1){
						openBookcurrentPage = 1;
						
					}else{
						openBookcurrentPage = 0;
						//	openBookPages.texture = this.assets.getTexture('buc_page_zero');
					}
					OpenBook();
					this.addChild(goback);
				}
			}
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ElectricHum",0,0.5,'stop');
		}
	/*
		private var hit_blueprints:Shape;
		private var hit_chair:Shape;
		
		*/
		private function CreateChairHit():void{
			hit_chair = new Shape();
			hit_chair.touchable = false;
			hit_chair.graphics.beginFill(0x0000ff);
			
			hit_chair.graphics.lineTo(446,360);	
			hit_chair.graphics.lineTo(476,332);	
			hit_chair.graphics.lineTo(656,334);	
			hit_chair.graphics.lineTo(635,243);	
			hit_chair.graphics.lineTo(663,172);	
			hit_chair.graphics.lineTo(730,162);	
			hit_chair.graphics.lineTo(773,244);	
			hit_chair.graphics.lineTo(734,375);	
			hit_chair.graphics.lineTo(568,495);	
			hit_chair.graphics.lineTo(463,478);	
		
			hit_chair.graphics.endFill(false);
			hit_chair.alpha = 0.0;
			
			hit_chair.graphics.precisionHitTest = true;	
			this.addChild(hit_chair);
		}
		
		private function CreateBlueprintHit():void{
			hit_blueprints = new Shape();
			hit_blueprints.touchable = false;
			hit_blueprints.graphics.beginFill(0x0000ff);
			
			hit_blueprints.graphics.lineTo(318,124);	
			hit_blueprints.graphics.lineTo(367,78);	
			hit_blueprints.graphics.lineTo(524,47);	
			hit_blueprints.graphics.lineTo(546,15);	
			hit_blueprints.graphics.lineTo(585,10);	
			hit_blueprints.graphics.lineTo(736,138);	
			hit_blueprints.graphics.lineTo(658,180);	
			hit_blueprints.graphics.lineTo(456,175);	
			
			hit_blueprints.graphics.endFill(false);
			hit_blueprints.alpha = 0.0;
			
			hit_blueprints.graphics.precisionHitTest = true;	
			this.addChild(hit_blueprints);
		}
		
		private function CreateScreenHit():void{
			hit_screen = new Shape();
			hit_screen.touchable = false;
			hit_screen.graphics.beginFill(0x0000ff);
			
			hit_screen.graphics.lineTo(38,38);	
			hit_screen.graphics.lineTo(235,10);	
			hit_screen.graphics.lineTo(258,132);	
			hit_screen.graphics.lineTo(253,167);	
			hit_screen.graphics.lineTo(316,177);	
			hit_screen.graphics.lineTo(213,274);	
			hit_screen.graphics.lineTo(148,241);	
			hit_screen.graphics.lineTo(196,193);	
			hit_screen.graphics.lineTo(76,181);	
		
			hit_screen.graphics.endFill(false);
			hit_screen.alpha = 0.0;
			
			hit_screen.graphics.precisionHitTest = true;	
			this.addChild(hit_screen);
		}
		
		private function CreateBoxHit(open:Boolean = false):void{
			hit_box = new Shape();
			
			hit_box.x = 0;
			hit_box.y = 0;
			if(open === false){
				
				
				hit_box.graphics.beginFill(0x0000FF);
				hit_box.graphics.lineTo(480,122);
				hit_box.graphics.lineTo(520,83);
				hit_box.graphics.lineTo(572,83);
				hit_box.graphics.lineTo(623,112);
				hit_box.graphics.lineTo(613,168);
				hit_box.graphics.lineTo(586,210);
				hit_box.graphics.lineTo(483,183);
				
				hit_box.graphics.endFill(false);
				
				hit_box.alpha = 0.0;
				
				hit_box.graphics.precisionHitTest = true;	
			}else{
				
				
				hit_box.graphics.beginFill(0x0000FF);		
				hit_box.graphics.lineTo(456,133);
				hit_box.graphics.lineTo(495,90);
				hit_box.graphics.lineTo(532,86);
				hit_box.graphics.lineTo(623,111);
				hit_box.graphics.lineTo(640,163);
				hit_box.graphics.lineTo(617,196);
				hit_box.graphics.lineTo(588,207);
				hit_box.graphics.lineTo(481,183);
			
				
				hit_box.graphics.endFill(false);
				hit_box.alpha = 0.0;
				
				hit_box.graphics.precisionHitTest = true;				
			}
			hit_box.touchable = false;
			this.addChild(hit_box);
		}
		
		private function CreateDrawerUpperHit(open:Boolean = false):void{
			hit_drawer_upper = new Shape();
			hit_drawer_upper.x = 0;
			hit_drawer_upper.y = 0;
			if(open === false){
				
				
				hit_drawer_upper.graphics.beginFill(0x0000FF);
				hit_drawer_upper.graphics.lineTo(126,344);
				hit_drawer_upper.graphics.lineTo(338,289);
				hit_drawer_upper.graphics.lineTo(341,360);
				hit_drawer_upper.graphics.lineTo(141,416);
				
				hit_drawer_upper.graphics.endFill(false);
				
				hit_drawer_upper.alpha = 0.0;
				
				hit_drawer_upper.graphics.precisionHitTest = true;	
			}else{
				
				
				hit_drawer_upper.graphics.beginFill(0x0000FF);		
				hit_drawer_upper.graphics.lineTo(140,350);
				hit_drawer_upper.graphics.lineTo(325,300);
				hit_drawer_upper.graphics.lineTo(385,375);
				hit_drawer_upper.graphics.lineTo(384,436);
				hit_drawer_upper.graphics.lineTo(180,499);
				
				
				hit_drawer_upper.graphics.endFill(false);
				hit_drawer_upper.alpha = 0.0;
				
				hit_drawer_upper.graphics.precisionHitTest = true;				
			}
			hit_drawer_upper.touchable = false;
			this.addChild(hit_drawer_upper);
		}
		private function CreateDrawerMiddleHit(open:Boolean = false):void{
			hit_drawer_middle = new Shape();
			
			hit_drawer_middle.x = 0;
			hit_drawer_middle.y = 0;
			if(open === false){
				
				
				hit_drawer_middle.graphics.beginFill(0x0000FF);
				hit_drawer_middle.graphics.lineTo(146,416);
				hit_drawer_middle.graphics.lineTo(336,363);
				hit_drawer_middle.graphics.lineTo(339,421);
				hit_drawer_middle.graphics.lineTo(156,478);
				
				hit_drawer_middle.graphics.endFill(false);
				
				hit_drawer_middle.alpha = 0.0;
				
				hit_drawer_middle.graphics.precisionHitTest = true;	
			}else{
				
				
				hit_drawer_middle.graphics.beginFill(0x0000FF);		
				hit_drawer_middle.graphics.lineTo(151,416);
				hit_drawer_middle.graphics.lineTo(331,364);
				hit_drawer_middle.graphics.lineTo(386,446);
				hit_drawer_middle.graphics.lineTo(386,501);
				hit_drawer_middle.graphics.lineTo(366,508);
				hit_drawer_middle.graphics.lineTo(177,508);				
				
				hit_drawer_middle.graphics.endFill(false);
				hit_drawer_middle.alpha = 0.0;
				
				hit_drawer_middle.graphics.precisionHitTest = true;				
			}
			hit_drawer_middle.touchable = false;
			this.addChild(hit_drawer_middle);
		}
		private function CreateDrawerLowerHit(open:Boolean = false):void{
			hit_drawer_lower = new Shape();
			
			hit_drawer_lower.x = 0;
			hit_drawer_lower.y = 0;
			if(open === false){
				
				
				hit_drawer_lower.graphics.beginFill(0x0000FF);
				hit_drawer_lower.graphics.lineTo(157,479);
				hit_drawer_lower.graphics.lineTo(340,423);
				hit_drawer_lower.graphics.lineTo(343,477);
				hit_drawer_lower.graphics.lineTo(243,510);
				hit_drawer_lower.graphics.lineTo(165,508);
				
				hit_drawer_lower.graphics.endFill(false);
				
				hit_drawer_lower.alpha = 0.0;
				
				hit_drawer_lower.graphics.precisionHitTest = true;	
			}else{
				
				hit_drawer_lower.x = 0;
				hit_drawer_lower.y = 0;
				hit_drawer_lower.graphics.beginFill(0x0000FF);		
				hit_drawer_lower.graphics.lineTo(158,477);
				hit_drawer_lower.graphics.lineTo(332,426);
				hit_drawer_lower.graphics.lineTo(385,507);
				hit_drawer_lower.graphics.lineTo(166,507);
			
				hit_drawer_lower.graphics.endFill(false);
				hit_drawer_lower.alpha = 0.0;
				
				hit_drawer_lower.graphics.precisionHitTest = true;				
			}
			hit_drawer_lower.touchable = false;
			this.addChild(hit_drawer_lower);
		}
		//hit_fuse
		private function CreateWrenchHit():void{
			hit_allen_wrench = new Shape();
			hit_allen_wrench.touchable = false;
			hit_allen_wrench.graphics.beginFill(0x0000ff);
			
			hit_allen_wrench.graphics.lineTo(226,399);	
			hit_allen_wrench.graphics.lineTo(310,374);	
			hit_allen_wrench.graphics.lineTo(355,431);	
			hit_allen_wrench.graphics.lineTo(325,458);	
			hit_allen_wrench.graphics.lineTo(245,433);	
					
			hit_allen_wrench.graphics.endFill(false);
			hit_allen_wrench.alpha = 0.0;
			
			hit_allen_wrench.graphics.precisionHitTest = true;	
			this.addChild(hit_allen_wrench);
		}
		
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0x0000ff);
			
			hit_book.graphics.lineTo(330,168);	
			hit_book.graphics.lineTo(433,162);	
			hit_book.graphics.lineTo(475,237);	
			hit_book.graphics.lineTo(351,251);	
			
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
		
		private function CreateFuseHit():void{
			hit_fuse = new Shape();
			hit_fuse.touchable = false;
			hit_fuse.graphics.beginFill(0x0000ff);
			
			hit_fuse.graphics.lineTo(527,130);	
			hit_fuse.graphics.lineTo(556,76);	
			hit_fuse.graphics.lineTo(586,86);	
			hit_fuse.graphics.lineTo(600,105);	
			hit_fuse.graphics.lineTo(568,152);	
			
			hit_fuse.graphics.endFill(false);
			hit_fuse.alpha = 0.0;
			
			hit_fuse.graphics.precisionHitTest = true;	
			this.addChild(hit_fuse);
		}
		
		private function CreateKnobHit():void{
			hit_knob = new Shape();
			hit_knob.touchable = false;
			hit_knob.graphics.beginFill(0xff0000);
			
			hit_knob.graphics.lineTo(200,385);	
			hit_knob.graphics.lineTo(226,344);	
			hit_knob.graphics.lineTo(276,358);	
			hit_knob.graphics.lineTo(280,398);	
			hit_knob.graphics.lineTo(238,412);	
		
			hit_knob.graphics.endFill(false);
			hit_knob.alpha = 0.0;
			
			hit_knob.graphics.precisionHitTest = true;	
			this.addChild(hit_knob);
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
								FadeOut((BuildingOffice as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeObj,true
								);
							}else if(hit_screen.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ScreenHandler();
							}else if(hit_drawer_upper.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(DrawerUpperOpen === false){
									UpperDrawerHandler();
								}else{
									if(hit_knob.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
										if(KnobPickedUp === false){
											KnobHandler();
										}else{
											UpperDrawerHandler();
										}
									}else{
										UpperDrawerHandler();
									}
								}
								
							}else if(hit_drawer_middle.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(DrawerMiddleOpen === false){
									DrawerMiddleHandler();
								}else{
									if(hit_allen_wrench.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
										if(AllenWrenchPickedUp === false){
											WrenchHandler();
										}else{
											DrawerMiddleHandler();
										}
									}else{
										DrawerMiddleHandler();
									}
								}
								
								//	DrawerMiddleHandler();
							}else if(hit_drawer_lower.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								DrawerLowerHandler();
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								BookIsOpen = true;
								OpenBook(true, 0)
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk;
								}		
								SaveArray['Book'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeDesk',SaveArray);	
							}else if(BoxOpen === true){
								if(hit_fuse.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									if(FusePickedUp === false){
										FuseHandler();
									}else if(hit_box.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
										BoxHandler();
									}
								}else if(hit_box.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									BoxHandler();
								}else if(hit_blueprints.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Stacks of blue prints for what looks like an incredibly complicated machine.");
								}else if(hit_chair.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A rather uncomfortable and slightly soiled looking chair...");
								}
							}else if(hit_box.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								BoxHandler();
							}else if(hit_blueprints.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Stacks of blue prints for what looks like an incredibly complicated machine.");
							}else if(hit_chair.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A rather uncomfortable and slightly soiled looking chair...");
							}
						}else{
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								trace("GoBackClick");
								RemoveBook();
								BookIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk;
								}		
								SaveArray['Book'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeDesk',SaveArray);
							}else if(hit_OpenBook.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk;
								}
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
									openBookPages.texture = this.assets.getTexture('morse_page_01');
									hit_OpenBook.graphics.clear();
									CreateOpenBookHit(1);
								}else if(openBookcurrentPage == 1){
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
									openBookPages.texture = this.assets.getTexture('morse_page_00');
									hit_OpenBook.graphics.clear();
									CreateOpenBookHit(0);
								}
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeDesk',SaveArray);
							}
						}
					}
				}
			}
		}
		private function ScreenHandler():void{
			if(ComputerOn === false){
				Animating = true;
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BootUp();
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk;
				}
				SaveArray['Computer'] = 'On';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeDesk',SaveArray);
				
				ComputerOn = true;
			
				
				ScreenTween = new Tween(screen, 2, Transitions.LINEAR);
				ScreenTween.fadeTo(1);
				ScreenTween.onComplete = function():void{	
					ComputerFadeInCallback();
				}
				Starling.juggler.add(ScreenTween);
			}else{
				FadeOut((BuildingOfficeComputer as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeComputerObj,true
				);
			}
		}
		public function ComputerFadeInCallback():void{
			screen.texture = this.assets.getTexture('screen_on');
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
			
			Animating = false;
		}
		
		private function OpenBook(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openBook = new Sprite();
			openBook.alpha = 0;
			CreateOpenBookBg();
			openBookPages = new Image(this.assets.getTexture('morse_page_00'));
			this.openBook.addChildAt(openBookbg,0);
			openBook.addChild(openBookPages);
			openBookPages.touchable = false;
			
			
			this.addChildAt(openBook,10);
			this.addChildAt(goback,11);
			
			if(openBookcurrentPage == 0){
				openBookPages.texture = this.assets.getTexture('morse_page_00');
			}else if(openBookcurrentPage == 1){
				openBookPages.texture = this.assets.getTexture('morse_page_01');
			}
			
			
			CreateOpenBookHit(openBookcurrentPage);
			
			if(Fade === false){
				openBook.alpha = 1;
				Animating = false;
			}else{
				//AddToNoteBookDouble
				
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookDouble('morse_book_page_00','morse_book_page_01');
			//	game.screenGamePlayHandler.NoteBookObj.AddToNoteBook('morse_book_page_00');
			//	game.screenGamePlayHandler.NoteBookObj.AddToNoteBook('morse_book_page_01');
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
		
		private function CreateOpenBookHit(page:Number = 0):void{
			hit_OpenBook = new Shape();
			openBook.addChild(hit_OpenBook);
			hit_OpenBook.graphics.beginFill(0x00ff00);
			if(page == 0){
				hit_OpenBook.graphics.lineTo(227,3);	
				hit_OpenBook.graphics.lineTo(565,0);	
				hit_OpenBook.graphics.lineTo(562,501);	
				hit_OpenBook.graphics.lineTo(229,497);	
			}else if(page == 1){
				hit_OpenBook.graphics.lineTo(90,7);	
				hit_OpenBook.graphics.lineTo(349,0);	
				hit_OpenBook.graphics.lineTo(409,6);	
				hit_OpenBook.graphics.lineTo(473,0);	
				hit_OpenBook.graphics.lineTo(718,8);	
				hit_OpenBook.graphics.lineTo(716,105);	
				hit_OpenBook.graphics.lineTo(710,497);		
				hit_OpenBook.graphics.lineTo(475,505);	
				hit_OpenBook.graphics.lineTo(404,496);	
				hit_OpenBook.graphics.lineTo(333,502);	
				hit_OpenBook.graphics.lineTo(83,496);	
				//hit_OpenBook.graphics.lineTo(83,376);	
				
			}
			hit_OpenBook.graphics.endFill(false);
			hit_OpenBook.alpha = 0.0;
			hit_OpenBook.graphics.precisionHitTest = true;
			openBookcurrentPage = page;
		}
		
		private function RemoveBook():void{
			Animating = true;
			Starling.juggler.purge();
			OpenBookTween = new Tween(openBook, 0.5, Transitions.LINEAR);
			OpenBookTween.fadeTo(0);
			OpenBookTween.onComplete = function():void{
				Animating = false;
				hit_OpenBook.graphics.clear();
				//	hit_openBookBack.graphics.clear();
				//	hit_openBookNext.graphics.clear();
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
		
		
		
		private function FuseHandler():void{
			trace("FUSE HANDLER");
			//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk;
			}	
			FusePickedUp = true;
			fuse.alpha = 0;
			SaveArray["Fuse"] = "PickedUp";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeDesk',SaveArray);
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Controller,
				'item_Controller',
				'inven_controller_sm'
			);
			
			/*
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
			SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk;
			}	
			FusePickedUp = true;
			fuse.alpha = 0;
			SaveArray["Fuse"] = "PickedUp";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeDesk',SaveArray);
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_FuseRed,
			'item_FuseRed',
			'inven_fuseRed_sm'
			);
			*/
		}
		
		private function BoxHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk;
			}
			if(BoxOpen === false){
				//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakThree();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				BoxOpen = true;
				SaveArray['Box'] = 'open';
				
				box.alpha = 1;
				if(FusePickedUp === false){
					fuse.alpha = 1;
				}else{
					fuse.alpha = 0;
				}
				hit_box.graphics.clear();
				CreateBoxHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				BoxOpen = false;
				SaveArray['Box'] = 'closed';
				box.alpha = 0;
				fuse.alpha = 0;
				hit_box.graphics.clear();
				CreateBoxHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeDesk',SaveArray);	
			
		}
		
		private function WrenchHandler():void{
			//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
			trace("Wrench Handler");
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk;
			}	
			AllenWrenchPickedUp = true;
			allen_wrench.alpha = 0;
			SaveArray["AllenWrench"] = "PickedUp";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeDesk',SaveArray);
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_AllenWrench,
				'item_AllenWrench',
				'inven_allenWrench_sm'
			);
			
			
		}
		private function KnobHandler():void{
			//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
			trace("Knob Handler");
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk;
			}	
			KnobPickedUp = true;
			knob.alpha = 0;
			SaveArray["Knob"] = "PickedUp";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeDesk',SaveArray);
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Knob,
				'item_Knob',
				'inven_knob_sm'
			);
			
		}
		
		private function UpperDrawerHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk;
			}
			if(DrawerUpperOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
				DrawerUpperOpen = true;
				SaveArray['DrawerUpper'] = 'open';
				if(KnobPickedUp === false){
					knob.alpha = 1;
				}else{
					knob.alpha = 0;
				}
				drawer_upper.alpha = 1;
				hit_drawer_upper.graphics.clear();
				CreateDrawerUpperHit(true);
				CreateKnobHit();
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
				DrawerUpperOpen = false;
				SaveArray['DrawerUpper'] = 'closed';
				drawer_upper.alpha = 0;
				hit_drawer_upper.graphics.clear();
				hit_knob.graphics.clear();
				knob.alpha = 0;
				CreateDrawerUpperHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeDesk',SaveArray);	
			
		}
		
		private function DrawerMiddleHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk;
			}
			if(DrawerMiddleOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
				DrawerMiddleOpen = true;
				SaveArray['DrawerMiddle'] = 'open';
				if(AllenWrenchPickedUp === false){
					allen_wrench.alpha = 1;
				}else{
					allen_wrench.alpha = 0;
				}
				drawer_middle.alpha = 1;
				hit_drawer_middle.graphics.clear();
				CreateDrawerMiddleHit(true);
				CreateWrenchHit();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
				DrawerMiddleOpen = false;
				SaveArray['DrawerMiddle'] = 'closed';
				allen_wrench.alpha = 0;
				drawer_middle.alpha = 0;
				hit_drawer_middle.graphics.clear();
				hit_allen_wrench.graphics.clear();
				CreateDrawerMiddleHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeDesk',SaveArray);	
			
		}
		private function DrawerLowerHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeDesk;
			}
			if(DrawerLowerOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
				DrawerLowerOpen = true;
				SaveArray['DrawerLower'] = 'open';
				drawer_lower.alpha = 1;
				hit_drawer_lower.graphics.clear();
				CreateDrawerLowerHit(true);
			}else{
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
				DrawerLowerOpen = false;
				SaveArray['DrawerLower'] = 'closed';
				drawer_lower.alpha = 0;
				hit_drawer_lower.graphics.clear();
				CreateDrawerLowerHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeDesk',SaveArray);	
			
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
			
			
			
			this.assets.removeTexture("buildingOfficeDesk_bg",true);
			this.assets.removeTexture("BuildingOfficeDesk_Sprite_01",true);
			this.assets.removeTexture("BuildingOfficeDesk_Sprite_02",true);
			this.assets.removeTextureAtlas("BuildingOfficeDesk_Sprite_01",true);		
			this.assets.removeTextureAtlas("BuildingOfficeDesk_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeDesk_01");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeDesk_02");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeDesk_03");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeDesk_04");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeDesk_05");
			
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
import starling.utils.AssetManager;

