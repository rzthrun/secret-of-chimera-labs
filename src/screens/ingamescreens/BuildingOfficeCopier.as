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

	public class BuildingOfficeCopier extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var lid_closed:Image;
		private var lid_open:Image;
		private var lid_lit:Image;
		private var door_closed:Image;
		
		private var hit_lid:Shape;
		private var hit_paper:Shape;
		private var hit_copy_button:Shape;
		
		private var hit_screen:Shape;
		private var hit_glass:Shape;
		
		private var LidOpen:Boolean = false;
		private var Animating:Boolean = false;		
		
		private var LightTweenIn:Tween;
		private var LightTweenOut:Tween;
		
		private var openBookbg:Shape;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookcurrentPage:Number = 0;
		
		private var hit_OpenBook:Shape;
		
		private var RONum:int = 0;
		
		public var OpenBookTween:Tween;
		private var BookIsOpen:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function BuildingOfficeCopier(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('buildingOfficeCopier_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeCopier/buildingOfficeCopier_bg.jpg'));
				game.TrackAssets('buildingOfficeCopier_01');
			}
			if(game.CheckAsset('buildingOfficeCopier_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeCopier/BuildingOfficeCopier_Sprite_01.png'));
				game.TrackAssets('buildingOfficeCopier_02');
			}
			if(game.CheckAsset('buildingOfficeCopier_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeCopier/BuildingOfficeCopier_Sprite_01.xml'));
				game.TrackAssets('buildingOfficeCopier_03');
			}
			if(game.CheckAsset('buildingOfficeCopier_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeCopier/Rorschach_Book_Sprite.png'));
				game.TrackAssets('buildingOfficeCopier_04');
			}
			if(game.CheckAsset('buildingOfficeCopier_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeCopier/Rorschach_Book_Sprite.xml'));
				game.TrackAssets('buildingOfficeCopier_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BuildingOfficeCopier","BuildingOfficeCopierObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('buildingOfficeCopier_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			door_closed = new Image(this.assets.getTexture('door_closed'));
			door_closed.touchable = false;
			door_closed.x = 728;
			door_closed.y = 0;			
			
			lid_closed = new Image(this.assets.getTexture('lid_closed'));
			lid_closed.touchable = false;
			lid_closed.x = 80;
			lid_closed.y = 39;
			
			lid_open = new Image(this.assets.getTexture('lid_open'));
			lid_open.touchable = false;
			lid_open.x = 81;
			lid_open.y = 0;
			
			lid_lit = new Image(this.assets.getTexture('lid_lights'));
			lid_lit.touchable = false;
			lid_lit.x = 27;
			lid_lit.y = 0;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier['Lid'] == 'Open'){
					LidOpen = true;
					lid_closed.alpha = 0;
					lid_open.alpha = 1;
					CreatePaperHit();
				}else{
					lid_closed.alpha = 1;
					lid_open.alpha = 0;
				}
			}else{
				lid_closed.alpha = 1;
				lid_open.alpha = 0;
				
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice != undefined){
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOffice['BackOfficeDoor'] == 'Open'){
					door_closed.alpha = 0;
				}else{
					door_closed.alpha = 1;
				}
			}else{
				door_closed.alpha = 1;
			}
		
			
			lid_lit.alpha = 0;
			
			
			
			
			this.addChildAt(door_closed,1);
			this.addChildAt(lid_closed,2);
			this.addChildAt(lid_open,3);
			this.addChildAt(lid_lit,4);
			
			CreateGlassHit();
			CreateScreenHit();
			
			CreateCopyHit();
			CreateLidHit(LidOpen);
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier["Book"] == "open"){
					trace("Book is Open");
					BookIsOpen = true;
					//	OpenBook();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier["BookCurrentPage"] == 0){
						openBookcurrentPage = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier["BookCurrentPage"] == 1){
						openBookcurrentPage = 1;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier["BookCurrentPage"] == 2){
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
		//private var hit_screen:Shape;
		//private var hit_glass:Shape;
		private function CreateGlassHit():void{
			hit_glass = new Shape();
			hit_glass.touchable = false;
			hit_glass.graphics.beginFill(0xff0000);
			
			hit_glass.graphics.lineTo(178,151);	
			hit_glass.graphics.lineTo(566,117);	
			hit_glass.graphics.lineTo(670,241);	
			hit_glass.graphics.lineTo(163,295);	
		
			hit_glass.graphics.endFill(false);
			hit_glass.alpha = 0.0;
			
			hit_glass.graphics.precisionHitTest = true;	
			this.addChild(hit_glass);
		}
		
		
		private function CreateScreenHit():void{
			hit_screen = new Shape();
			hit_screen.touchable = false;
			hit_screen.graphics.beginFill(0xff0000);
			
			hit_screen.graphics.lineTo(328,322);	
			hit_screen.graphics.lineTo(631,286);	
			hit_screen.graphics.lineTo(661,372);	
			hit_screen.graphics.lineTo(340,415);	
					
			hit_screen.graphics.endFill(false);
			hit_screen.alpha = 0.0;
			
			hit_screen.graphics.precisionHitTest = true;	
			this.addChild(hit_screen);
		}
		
		
		private function CreateCopyHit():void{
			hit_copy_button = new Shape();
			hit_copy_button.touchable = false;
			hit_copy_button.graphics.beginFill(0xff0000);
			
			hit_copy_button.graphics.lineTo(638,289);	
			hit_copy_button.graphics.lineTo(710,278);	
			hit_copy_button.graphics.lineTo(738,349);	
			hit_copy_button.graphics.lineTo(661,360);	
			
			
			hit_copy_button.graphics.endFill(false);
			hit_copy_button.alpha = 0.0;
			
			hit_copy_button.graphics.precisionHitTest = true;	
			this.addChild(hit_copy_button);
		}
		
		private function CreatePaperHit():void{
			hit_paper = new Shape();
			hit_paper.touchable = false;
			hit_paper.graphics.beginFill(0xff0000);
			
			hit_paper.graphics.lineTo(178,227);	
			hit_paper.graphics.lineTo(291,136);	
			hit_paper.graphics.lineTo(368,154);	
			hit_paper.graphics.lineTo(437,119);	
			hit_paper.graphics.lineTo(572,144);	
			hit_paper.graphics.lineTo(520,245);	
			hit_paper.graphics.lineTo(433,222);	
			hit_paper.graphics.lineTo(319,270);	
			
			hit_paper.graphics.endFill(false);
			hit_paper.alpha = 0.0;
			
			hit_paper.graphics.precisionHitTest = true;	
			this.addChild(hit_paper);
		}
		private function CreateOpenBookHit():void{
			hit_OpenBook = new Shape();
			hit_OpenBook.touchable = false;
			hit_OpenBook.graphics.beginFill(0xff0000);
			
			hit_OpenBook.graphics.lineTo(211,0);	
			hit_OpenBook.graphics.lineTo(585,0);	
			hit_OpenBook.graphics.lineTo(585,512);	
			hit_OpenBook.graphics.lineTo(211,512);	
			
			
			hit_OpenBook.graphics.endFill(false);
			hit_OpenBook.alpha = 0.0;
			
			hit_OpenBook.graphics.precisionHitTest = true;	
			this.addChild(hit_OpenBook);
		}
		private function CreateLidHit(open:Boolean = false):void{
			hit_lid = new Shape();		
			hit_lid.x = 0;
			hit_lid.y = 0;
			hit_lid.graphics.beginFill(0x0000FF);
			if(open === false){	
				hit_lid.graphics.lineTo(79,278);	
				hit_lid.graphics.lineTo(123,114);	
				hit_lid.graphics.lineTo(172,53);	
				hit_lid.graphics.lineTo(368,37);	
				hit_lid.graphics.lineTo(515,62);	
				hit_lid.graphics.lineTo(599,81);	
				hit_lid.graphics.lineTo(735,220);	
				hit_lid.graphics.lineTo(722,252);	
				hit_lid.graphics.lineTo(92,322);	
				
			}else{
				
				hit_lid.graphics.lineTo(80,0);
				hit_lid.graphics.lineTo(633,0);
				hit_lid.graphics.lineTo(595,92);
				hit_lid.graphics.lineTo(126,129);
				
				
			}				
			hit_lid.graphics.endFill(false);			
			hit_lid.alpha = 0.0;			
			hit_lid.graphics.precisionHitTest = true;	
			hit_lid.touchable = false
			this.addChild(hit_lid);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if (touches[0].phase == TouchPhase.ENDED) {
					trace(touches[0].globalX+" ,"+touches[0].globalY);
					if(Animating === false){					
						if(BookIsOpen === false){
							if(targ == goback.SourceImage){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((BuildingOffice as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeObj,true
								);
								return;
							}else if(hit_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LidHandler();
								return;
							}else if(hit_copy_button.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								CopyHandler();
								return;
							}else if(hit_screen.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ScreenHandler();
								return;
							}else if(LidOpen === true){
								if(hit_paper.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
									BookIsOpen = true;
									OpenBook(true, 0);
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier;
									}		
									SaveArray['Book'] = "open";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeCopier',SaveArray);
									
									return;
								}else if(hit_glass.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The glass of the copy bed is smudged and dusty.");	
								}
									
								
							}
						}else{
							if(targ == goback.SourceImage){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								trace("GoBackClick");
								RemoveBook();
								BookIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier;
								}		
								SaveArray['Book'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeCopier',SaveArray);
							}else if(hit_OpenBook.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier;
								}
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
									openBookPages.texture = this.assets.getTexture('Rorschach_page_01');
								}else if(openBookcurrentPage == 1){
									SaveArray['BookCurrentPage'] = 2;
									openBookcurrentPage = 2;
									openBookPages.texture = this.assets.getTexture('Rorschach_page_02');
								}else if(openBookcurrentPage == 2){
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
									openBookPages.texture = this.assets.getTexture('Rorschach_page_00');
								}
								
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeCopier',SaveArray);
								
							}
						}
						
						
					}
				}
			}
		}
		private function ScreenHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The screen indicates the copier is out of paper and toner.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("One shouldn't waste paper.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The copier doesn't appear to be working at the moment.");	
			}
		}
		private function CopyHandler():void{
			if(LidOpen === false){
				if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('Copier') === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Copier();
				}
					//currPlayingSounds
			
			}else{
				Animating = true;
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Copier();
				LightTweenIn = new Tween(lid_lit, 1, Transitions.EASE_IN_OUT);
				LightTweenIn.fadeTo(1)
				//	WolfTween.fadeTo(1);
				LightTweenIn.onComplete = function():void{
					LightTweenOutHandler();
					LightTweenIn = null;
					//FadeOutGoat();							
				};
				Starling.juggler.add(LightTweenIn);	
			}
		}
		
		private function LightTweenOutHandler():void{
			LightTweenOut = new Tween(lid_lit, 1, Transitions.EASE_IN_OUT);
			LightTweenOut.fadeTo(0)
			//	WolfTween.fadeTo(1);
			LightTweenOut.onComplete = function():void{
				Animating = false;
				LightTweenOut = null;
				//FadeOutGoat();							
			};
			Starling.juggler.add(LightTweenOut);	
		}
		
		private function LidHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeCopier;
			}	
			
			if(LidOpen === false){
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeOpen();
				LidOpen = true;
				lid_closed.alpha = 0;
				lid_open.alpha = 1;
				SaveArray['Lid'] = 'Open';
				hit_lid._graphics.clear();
				CreateLidHit(true);				
				CreatePaperHit();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeClose();
				LidOpen = false;
				lid_closed.alpha = 1;
				lid_open.alpha = 0;
				SaveArray['Lid'] = 'Closed';
				hit_lid._graphics.clear();
				hit_paper._graphics.clear();
				CreateLidHit(false);			
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeCopier',SaveArray);
		}
		
		private function OpenBook(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openBook = new Sprite();
			openBook.alpha = 0;
			CreateOpenBookBg();
			openBookPages = new Image(this.assets.getTexture('Rorschach_page_00'));
			this.openBook.addChildAt(openBookbg,0);
			openBook.addChild(openBookPages);
			openBookPages.touchable = false;
			
			
			this.addChild(openBook);
			this.addChild(goback);
			
			if(openBookcurrentPage == 0){
				openBookPages.texture = this.assets.getTexture('Rorschach_page_00');
			}else if(openBookcurrentPage == 1){
				openBookPages.texture = this.assets.getTexture('Rorschach_page_01');
			}else if(openBookcurrentPage == 2){
				openBookPages.texture = this.assets.getTexture('Rorschach_page_02');
			}
			
			CreateOpenBookHit();
			//CreateOpenBookHit(openBookcurrentPage);
			
			if(Fade === false){
				Animating = false;
				openBook.alpha = 1;
				//	CreateOpenBookHit();
			}else{
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('rorschach');
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
			
			
			
			this.assets.removeTexture("buildingOfficeCopier_bg",true);
			this.assets.removeTexture("BuildingOfficeCopier_Sprite_01",true);
			this.assets.removeTexture("Rorschach_Book_Sprite",true);
			this.assets.removeTextureAtlas("BuildingOfficeCopier_Sprite_01",true);
			this.assets.removeTextureAtlas("Rorschach_Book_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeCopier_01");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeCopier_02");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeCopier_03");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeCopier_04");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeCopier_05");
			
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