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
	
	
	public class OfficeDraftsman extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		private var screen:Image;
		
		private var hit_book:Shape;
		private var hit_adimm:Shape;
		private var hit_computer:Shape;
		
		private var hit_wall_00:Shape;
		private var hit_wall_01:Shape;
		private var hit_calander:Shape;
		private var hit_pens:Shape;
		private var hit_picture:Shape;
		private var hit_chair:Shape;
		private var hit_plant:Shape;
		
		private var openBookbg:Shape;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookcurrentPage:Number = 0;
		private var hit_openBookBack:Shape;
		private var hit_openBookNext:Shape;
		public var OpenBookTween:Tween;
		private var BookIsOpen:Boolean = false;
		private var ComputerOn:Boolean = false;
		
		public var ScreenTween:Tween;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function OfficeDraftsman(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('officeDraftsman_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeDraftsman/officeDraftsman_bg.jpg'));
				game.TrackAssets('officeDraftsman_01');
			}
			if(game.CheckAsset('officeDraftsman_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeDraftsman/ComputerBook_Sprite_01.png'));
				game.TrackAssets('officeDraftsman_02');
			}
			if(game.CheckAsset('officeDraftsman_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeDraftsman/ComputerBook_Sprite_01.xml'));
				game.TrackAssets('officeDraftsman_03');
			}
			if(game.CheckAsset('officeDraftsman_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeDraftsman/OfficeDraftsman_Sprite_01.png'));
				game.TrackAssets('officeDraftsman_04');
			}
			if(game.CheckAsset('officeDraftsman_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeDraftsman/OfficeDraftsman_Sprite_01.xml'));
				game.TrackAssets('officeDraftsman_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("OfficeDraftsman","OfficeDraftsmanObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('officeDraftsman_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			screen = new Image(this.assets.getTexture('screen_start'));
			screen.touchable = false;
			screen.x = 421;
			screen.y = 105;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDeskDraftsman != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDeskDraftsman['ComputerOn'] == 'Yes'){
					ComputerOn = true;
					screen.texture = this.assets.getTexture('screen_on');
					screen.alpha = 1;
				}else{
					screen.alpha = 0;
				}
			}else{
				screen.alpha = 0;
			}
			
			CreateWall00Hit();
			CreateWall01Hit();
			CreateCalanderHit();
			CreatePensHit();
			CreatePictureHit();
			CreateChairHit();
			CreatePlantHit();
			
			//	CreateElevatorDoorHit();
			CreateBookHit();
			CreateComputerHit();
			CreateAdminnHit();
			
			this.addChildAt(screen,1);
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman["Book"] == "open"){
					BookIsOpen = true;
					OpenBook();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman["BookCurrentPage"] == 0){
						openBookcurrentPage = 0;
						openBookPages.texture = this.assets.getTexture('computer_book_page_00');
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman["BookCurrentPage"] == 1){
						openBookcurrentPage = 1;
						openBookPages.texture = this.assets.getTexture('computer_book_page_01');
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman["BookCurrentPage"] == 2){
						openBookcurrentPage = 2;
						openBookPages.texture = this.assets.getTexture('computer_book_page_02');
					}else{
						openBookcurrentPage = 0;
						openBookPages.texture = this.assets.getTexture('computer_book_page_00');
					}
					
					this.addChild(goback);
				}
			}
			
			
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
	
		private function CreatePlantHit():void{
			hit_plant = new Shape();
			hit_plant.touchable = false;
			hit_plant.graphics.beginFill(0xff0000);
			
			hit_plant.graphics.lineTo(315,124);	
			hit_plant.graphics.lineTo(362,110);	
			hit_plant.graphics.lineTo(366,0);	
			hit_plant.graphics.lineTo(398,0);	
			hit_plant.graphics.lineTo(409,221);	
			hit_plant.graphics.lineTo(351,220);	
		
			hit_plant.graphics.endFill(false);
			hit_plant.alpha = 0.0;
			
			hit_plant.graphics.precisionHitTest = true;	
			this.addChild(hit_plant);
		}
		
		private function CreateChairHit():void{
			hit_chair = new Shape();
			hit_chair.touchable = false;
			hit_chair.graphics.beginFill(0xff0000);
			
			hit_chair.graphics.lineTo(341,503);	
			hit_chair.graphics.lineTo(520,375);	
			hit_chair.graphics.lineTo(693,315);	
			hit_chair.graphics.lineTo(603,508);	
			
			hit_chair.graphics.endFill(false);
			hit_chair.alpha = 0.0;
			
			hit_chair.graphics.precisionHitTest = true;	
			this.addChild(hit_chair);
		}
		
		private function CreatePictureHit():void{
			hit_picture = new Shape();
			hit_picture.touchable = false;
			hit_picture.graphics.beginFill(0xff0000);
			
			hit_picture.graphics.lineTo(734,243);	
			hit_picture.graphics.lineTo(793,272);	
			hit_picture.graphics.lineTo(769,329);	
			hit_picture.graphics.lineTo(707,299);	
		
			hit_picture.graphics.endFill(false);
			hit_picture.alpha = 0.0;
			
			hit_picture.graphics.precisionHitTest = true;	
			this.addChild(hit_picture);
		}
		
		private function CreatePensHit():void{
			hit_pens = new Shape();
			hit_pens.touchable = false;
			hit_pens.graphics.beginFill(0xff0000);
			
			hit_pens.graphics.lineTo(270,184);	
			hit_pens.graphics.lineTo(275,141);	
			hit_pens.graphics.lineTo(303,133);	
			hit_pens.graphics.lineTo(347,156);	
			hit_pens.graphics.lineTo(349,229);	
			hit_pens.graphics.lineTo(334,235);	
			
			hit_pens.graphics.endFill(false);
			hit_pens.alpha = 0.0;
			
			hit_pens.graphics.precisionHitTest = true;	
			this.addChild(hit_pens);
		}
		
		private function CreateCalanderHit():void{
			hit_calander = new Shape();
			hit_calander.touchable = false;
			hit_calander.graphics.beginFill(0xff0000);
			
			hit_calander.graphics.lineTo(0,40);	
			hit_calander.graphics.lineTo(40,25);	
			hit_calander.graphics.lineTo(120,158);	
			hit_calander.graphics.lineTo(0,193);	
			
			hit_calander.graphics.endFill(false);
			hit_calander.alpha = 0.0;
			
			hit_calander.graphics.precisionHitTest = true;	
			this.addChild(hit_calander);
		}
		
		private function CreateWall01Hit():void{
			hit_wall_01 = new Shape();
			hit_wall_01.touchable = false;
			hit_wall_01.graphics.beginFill(0xff0000);
			
			hit_wall_01.graphics.lineTo(400,0);	
			hit_wall_01.graphics.lineTo(585,0);	
			hit_wall_01.graphics.lineTo(570,82);	
			hit_wall_01.graphics.lineTo(400,87);	
						
			hit_wall_01.graphics.endFill(false);
			hit_wall_01.alpha = 0.0;
			
			hit_wall_01.graphics.precisionHitTest = true;	
			this.addChild(hit_wall_01);
		}
		
		private function CreateWall00Hit():void{
			hit_wall_00 = new Shape();
			hit_wall_00.touchable = false;
			hit_wall_00.graphics.beginFill(0xff0000);
			
			hit_wall_00.graphics.lineTo(128,37);	
			hit_wall_00.graphics.lineTo(363,17);	
			hit_wall_00.graphics.lineTo(361,92);	
			hit_wall_00.graphics.lineTo(130,149);	
			
			hit_wall_00.graphics.endFill(false);
			hit_wall_00.alpha = 0.0;
			
			hit_wall_00.graphics.precisionHitTest = true;	
			this.addChild(hit_wall_00);
		}
		
		private function CreateComputerHit():void{
			hit_computer = new Shape();
			hit_computer.touchable = false;
			hit_computer.graphics.beginFill(0xff0000);
			
			hit_computer.graphics.lineTo(411,94);	
			hit_computer.graphics.lineTo(590,90);	
			hit_computer.graphics.lineTo(606,92);	
			hit_computer.graphics.lineTo(800,112);	
			hit_computer.graphics.lineTo(800,145);	
			hit_computer.graphics.lineTo(779,243);	
			hit_computer.graphics.lineTo(723,240);	
			hit_computer.graphics.lineTo(696,292);	
			hit_computer.graphics.lineTo(551,267);	
			hit_computer.graphics.lineTo(564,243);	
			hit_computer.graphics.lineTo(413,215);				
			
			hit_computer.graphics.endFill(false);
			hit_computer.alpha = 0.0;
			
			hit_computer.graphics.precisionHitTest = true;	
			this.addChild(hit_computer);
		}
		
		private function CreateAdminnHit():void{
			hit_adimm = new Shape();
			hit_adimm.touchable = false;
			hit_adimm.graphics.beginFill(0xff0000);
			
			hit_adimm.graphics.lineTo(0,254);	
			hit_adimm.graphics.lineTo(240,180);	
			hit_adimm.graphics.lineTo(403,304);	
			hit_adimm.graphics.lineTo(171,432);	
			hit_adimm.graphics.lineTo(0,264);	
			
			
			hit_adimm.graphics.endFill(false);
			hit_adimm.alpha = 0.0;
			
			hit_adimm.graphics.precisionHitTest = true;	
			this.addChild(hit_adimm);
		}
		
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(424,263);	
			hit_book.graphics.lineTo(519,293);	
			hit_book.graphics.lineTo(508,386);	
			hit_book.graphics.lineTo(423,358);	
		
			
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
								FadeOut((OfficeDesk as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeDeskObj,true
								);
							}else if(hit_computer.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ComputerHandler();
							}else if(hit_adimm.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((OfficeAdimm as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeAdimmObj,true
								);
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								BookIsOpen = true;
								OpenBook(true, openBookcurrentPage);
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman;
								}		
								SaveArray['Book'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeDraftsman',SaveArray);
								
								
							}else if(hit_wall_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Various diagrams are hung on the cubicle wall.");	
							}else if(hit_wall_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Various diagrams are hung on the cubicle wall.");
							}else if(hit_calander.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A company calendar.");
							}else if(hit_pens.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Many colored pens and pencils.");
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A photo of kitty cat.");
							}else if(hit_chair.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The chair is made of a spongy synthetic material.");
							}else if(hit_plant.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A potted plant grows in the corner of the desk.");
							}
							
							
							/*
							
							private var hit_wall_00:Shape;
							private var hit_wall_01:Shape;
							private var hit_calander:Shape;
							private var hit_pens:Shape;
							private var hit_picture:Shape;
							private var hit_chair:Shape;
							private var hit_plant:Shape;
							
							*/
							
							
						}else{
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								trace("GoBackClick");
								RemoveBook();
								BookIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman;
								}		
								SaveArray['Book'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeDraftsman',SaveArray);
							}
							else if(hit_openBookNext.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman;
								}
								
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
									openBookPages.texture = this.assets.getTexture('computer_book_page_01');
								}else if(openBookcurrentPage == 1){
									
									SaveArray['BookCurrentPage'] = 2
									openBookcurrentPage = 2;
									openBookPages.texture = this.assets.getTexture('computer_book_page_02');
								}else if(openBookcurrentPage == 2){
									
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
									openBookPages.texture = this.assets.getTexture('computer_book_page_00');
								}
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeDraftsman',SaveArray);
							}
							else if(hit_openBookBack.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDraftsman;
								}
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 2;
									openBookcurrentPage = 2;
									openBookPages.texture = this.assets.getTexture('computer_book_page_02');
								}else if(openBookcurrentPage == 2){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
									openBookPages.texture = this.assets.getTexture('computer_book_page_01');
								}else if(openBookcurrentPage == 1){
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
									openBookPages.texture = this.assets.getTexture('computer_book_page_00');
									
								}
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeDraftsman',SaveArray);
						
							}		
						}
					}
				}
			}
		}
		
		private function ComputerHandler():void{
			if(ComputerOn === false){
				TurnComputer();
			}else{
				trace("HIT COMPUTER ON");
				FadeOut((OfficeComputer as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeComputerObj,true
				);
			}
		}
		
		private function TurnComputer():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BootUp();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDeskDraftsman != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeDeskDraftsman;	
			}
			SaveArray['ComputerOn'] = "Yes";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeDeskDraftsman',SaveArray);
			ComputerOn = true;
			Animating = true;
			
			ScreenTween = new Tween(screen, 2, Transitions.EASE_OUT);
			ScreenTween.fadeTo(1);
			ScreenTween.onComplete = function():void{
				CompleteTurnComputer();
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
				
			};
			
			Starling.juggler.add(ScreenTween);
		}
		public function CompleteTurnComputer():void{			
			screen.texture = this.assets.getTexture('screen_on');
			Animating = false;
			ScreenTween = null;
			
			
		}
		
		private function OpenBook(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openBook = new Sprite();
			openBook.alpha = 0;
			CreateOpenBookBg();
			openBookPages = new Image(this.assets.getTexture('computer_book_page_00'));
			this.openBook.addChildAt(openBookbg,0);
			openBook.addChild(openBookPages);
			openBookPages.touchable = false;
			
			
			this.addChildAt(openBook,4);
			this.addChildAt(goback,5);
			
			if(openBookcurrentPage == 0){
				openBookPages.texture = this.assets.getTexture('computer_book_page_00');
			}else if(openBookcurrentPage == 1){
				openBookPages.texture = this.assets.getTexture('computer_book_page_01');
			}else if(openBookcurrentPage == 2){
				openBookPages.texture = this.assets.getTexture('computer_book_page_02');
			}
			
			CreateOpenBookHit()
			//	CreateOpenBookHit(openBookcurrentPage);
			
			if(Fade === false){
				Animating = false;
				openBook.alpha = 1;
				
			}else{
				
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('computer_book');
			//	game.screenGamePlayHandler.NoteBookObj.AddToNoteBook('computer_book');
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
				Animating = false;
				//hit_OpenBook.graphics.clear();
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
		
		
		private function CreateOpenBookHit():void{
			hit_openBookBack = new Shape();
			openBook.addChild(hit_openBookBack);
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
			openBook.addChild(hit_openBookNext);
			hit_openBookNext.graphics.beginFill(0xff0000);
			hit_openBookNext.graphics.lineTo(390,5);		
			hit_openBookNext.graphics.lineTo(667,3);		
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
			
			
			
			this.assets.removeTexture("officeDraftsman_bg",true);
			this.assets.removeTexture("ComputerBook_Sprite_01",true);
			this.assets.removeTexture("OfficeDraftsman_Sprite_01",true);
			this.assets.removeTextureAtlas("ComputerBook_Sprite_01",true);
			this.assets.removeTextureAtlas("OfficeDraftsman_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("officeDraftsman_01");
			(stage.getChildAt(0) as Object).falseAsset("officeDraftsman_02");
			(stage.getChildAt(0) as Object).falseAsset("officeDraftsman_03");
			(stage.getChildAt(0) as Object).falseAsset("officeDraftsman_04");
			(stage.getChildAt(0) as Object).falseAsset("officeDraftsman_05");
			
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

