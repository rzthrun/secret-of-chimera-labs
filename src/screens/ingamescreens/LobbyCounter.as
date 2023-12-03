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
	
	public class LobbyCounter extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var screen:Image;
		
		private var drawer:Image;
		private var fuse:Image;
		
		private var hit_drawer:Shape;
		private var hit_fuse:Shape;
		private var hit_desk:Shape;
		private var hit_book:Shape;
		
		private var hit_binders:Shape;
		private var hit_pen:Shape;
		private var hit_window:Shape;
		private var hit_logo:Shape;
		private var hit_chair:Shape;
		
		
		private var openLetter:Sprite;
		private var openLetterPages:Image;
		private var hit_openLetter:Shape;
		private var hit_openLetter_01:Shape;
		private var hit_openLetter_paper:Shape;
		private var hit_trash:Shape;
		public var OpenLetterTween:Tween;
		
		private var openBookbg:Shape;
		
		private var LetterIsOpen:Boolean = false;
		
		
		private var DrawerOpen:Boolean = false;
		private var FusePickedUp:Boolean = false;
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function LobbyCounter(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('lobbyCounter_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyCounter/lobbyCounter_bg.jpg'));
				game.TrackAssets('lobbyCounter_01');
			}
			if(game.CheckAsset('lobbyCounter_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyCounter/LobbyCounter_Sprite_01.png'));
				game.TrackAssets('lobbyCounter_02');
			}
			if(game.CheckAsset('lobbyCounter_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyCounter/LobbyCounter_Sprite_01.xml'));
				game.TrackAssets('lobbyCounter_03');
			}
			if(game.CheckAsset('lobbyCounter_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyCounter/SignIn_Sprite.png'));
				game.TrackAssets('lobbyCounter_04');
			}
			if(game.CheckAsset('lobbyCounter_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyCounter/SignIn_Sprite.xml'));
				game.TrackAssets('lobbyCounter_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("LobbyCounter","LobbyCounterObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('lobbyCounter_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			drawer = new Image(this.assets.getTexture('drawer'));
			drawer.touchable = false;
			drawer.x = 132;
			drawer.y = 214;
			
			
			fuse = new Image(this.assets.getTexture('fuse'));
			fuse.touchable = false;
			fuse.x = 152;
			fuse.y = 275;
			
			screen = new Image(this.assets.getTexture('desk_screen'));
			screen.touchable = false;
			screen.x = 515;
			screen.y = 132;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter['Drawer'] == 'Open'){	
					drawer.alpha = 1;
					DrawerOpen = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter['Fuse'] == 'PickedUp'){	
						FusePickedUp = true;
						fuse.alpha = 0;
					}else{
						
						fuse.alpha = 1;
					}
				}else{
					drawer.alpha = 0;
					fuse.alpha = 0;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter['Fuse'] == 'PickedUp'){	
						FusePickedUp = true;
					}
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyCounter',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadMorGu(true,3);
							
						},0.5);
					}
				}
				
			}else{
				
				drawer.alpha = 0;
				fuse.alpha = 0;
				
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyCounter',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadMorGu(true,3);
						
					},0.5);
				}
			}
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk['Screen'] == 'on'){
					screen.alpha = 1;
				/*	screen.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer != undefined){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['Window'] == 'MM'){
							screen.texture = this.assets.getTexture('desk_screen_email');
							
						}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['Window'] == 'DC'){
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['DC_Window'] == 'mgnt'){
								screen.texture = this.assets.getTexture('desk_screen_dc_mgnt');
							}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['DC_Window'] == 'elevator'){
								screen.texture = this.assets.getTexture('desk_screen_dc_elevator');
							}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['DC_Window'] == 'entrance'){
								screen.texture = this.assets.getTexture('desk_screen_dc_front');
							}else{
								screen.texture = this.assets.getTexture('desk_screen_dc_front');
							}
						}else{
							screen.texture = this.assets.getTexture('desk_screen_dc_desktop');
						}
					}else{
						
						screen.texture = this.assets.getTexture('desk_screen_dc_desktop');
						
					}
				*/	
					
				}else{
					screen.alpha = 0;
				}
				
			}else{
				screen.alpha = 0;
			}
			
			this.addChildAt(drawer,1);
			this.addChildAt(fuse,2);
			this.addChildAt(screen,3);
			
			
			CreateDrawerHit(DrawerOpen);
			CreateFuseHit();
			CreateDeskHit();
			CreateBookHit();
			CreateBindersHit();
			CreateLogoHit();
			CreateChairHit();		
			CreatePenHit();
			CreateWindowHit();
			CreateTrashHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter['Letter'] == 'open'){
					LetterIsOpen = true;
					OpenLetter(false);
					this.addChild(goback);
				}
			}
			
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadBuildingHum(true,999);
		}
		
		/*
		hit_trash
		*/
		private function CreateTrashHit():void{
			hit_trash = new Shape();
			hit_trash.touchable = false;
			hit_trash.graphics.beginFill(0xff0000);
			
			hit_trash.graphics.lineTo(23,338);	
			hit_trash.graphics.lineTo(90,309);	
			hit_trash.graphics.lineTo(130,339);	
			hit_trash.graphics.lineTo(131,435);	
			hit_trash.graphics.lineTo(81,460);	
			
			hit_trash.graphics.endFill(false);
			hit_trash.alpha = 0.0;
			
			hit_trash.graphics.precisionHitTest = true;	
			this.addChild(hit_trash);
		}
		
		
		private function CreateWindowHit():void{
			hit_window = new Shape();
			hit_window.touchable = false;
			hit_window.graphics.beginFill(0xff0000);
			
			hit_window.graphics.lineTo(378,0);	
			hit_window.graphics.lineTo(678,0);	
			hit_window.graphics.lineTo(720,175);	
			hit_window.graphics.lineTo(617,153);	
			hit_window.graphics.lineTo(372,117);	
		
			hit_window.graphics.endFill(false);
			hit_window.alpha = 0.0;
			
			hit_window.graphics.precisionHitTest = true;	
			this.addChild(hit_window);
		}
			
		
		private function CreateBindersHit():void{
			hit_binders = new Shape();
			hit_binders.touchable = false;
			hit_binders.graphics.beginFill(0xff0000);
			
			hit_binders.graphics.lineTo(0,120);	
			hit_binders.graphics.lineTo(155,145);	
			hit_binders.graphics.lineTo(222,169);	
			hit_binders.graphics.lineTo(222,190);	
			hit_binders.graphics.lineTo(48,247);	
			hit_binders.graphics.lineTo(0,230);	
					
			hit_binders.graphics.endFill(false);
			hit_binders.alpha = 0.0;
			
			hit_binders.graphics.precisionHitTest = true;	
			this.addChild(hit_binders);
		}
		
		
		
		private function CreateLogoHit():void{
			hit_logo = new Shape();
			hit_logo.touchable = false;
			hit_logo.graphics.beginFill(0xff0000);
			
			hit_logo.graphics.lineTo(53,0);	
			hit_logo.graphics.lineTo(240,0);	
			hit_logo.graphics.lineTo(237,24);	
			hit_logo.graphics.lineTo(162,114);	
			hit_logo.graphics.lineTo(63,82);	
					
			hit_logo.graphics.endFill(false);
			hit_logo.alpha = 0.0;
			
			hit_logo.graphics.precisionHitTest = true;	
			this.addChild(hit_logo);
		}
		
		
		private function CreateChairHit():void{
			hit_chair = new Shape();
			hit_chair.touchable = false;
			hit_chair.graphics.beginFill(0xff0000);
			
			hit_chair.graphics.lineTo(245,170);	
			hit_chair.graphics.lineTo(265,128);	
			hit_chair.graphics.lineTo(300,129);	
			hit_chair.graphics.lineTo(341,216);	
			hit_chair.graphics.lineTo(401,220);	
			hit_chair.graphics.lineTo(437,263);	
			hit_chair.graphics.lineTo(433,329);	
			hit_chair.graphics.lineTo(346,341);	
			hit_chair.graphics.lineTo(290,326);	
			hit_chair.graphics.lineTo(265,219);	

			hit_chair.graphics.endFill(false);
			hit_chair.alpha = 0.0;
			hit_chair.graphics.precisionHitTest = true;	
			this.addChild(hit_chair);
		}
		
		private function CreatePenHit():void{
			hit_pen = new Shape();
			hit_pen.touchable = false;
			hit_pen.graphics.beginFill(0xff0000);
			
			hit_pen.graphics.lineTo(598,297);	
			hit_pen.graphics.lineTo(579,332);	
			hit_pen.graphics.lineTo(508,290);	
			hit_pen.graphics.lineTo(529,280);	
			
			hit_pen.graphics.endFill(false);
			hit_pen.alpha = 0.0;
			
			hit_pen.graphics.precisionHitTest = true;	
			this.addChild(hit_pen);
		}
		
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(621,202);	
			hit_book.graphics.lineTo(673,195);	
			hit_book.graphics.lineTo(779,230);	
			hit_book.graphics.lineTo(709,257);	
			hit_book.graphics.lineTo(628,231);	
			
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
		
		private function CreateDeskHit():void{
			hit_desk = new Shape();
			hit_desk.touchable = false;
			hit_desk.graphics.beginFill(0xff0000);
			
			hit_desk.graphics.lineTo(373,179);	
			hit_desk.graphics.lineTo(416,94);	
			hit_desk.graphics.lineTo(506,104);	
			hit_desk.graphics.lineTo(611,145);	
			hit_desk.graphics.lineTo(629,251);	
			hit_desk.graphics.lineTo(600,293);	
			hit_desk.graphics.lineTo(515,277);	
			hit_desk.graphics.lineTo(391,204);	
			
			hit_desk.graphics.endFill(false);
			hit_desk.alpha = 0.0;
			
			hit_desk.graphics.precisionHitTest = true;	
			this.addChild(hit_desk);
		}
		
		private function CreateFuseHit():void{
			hit_fuse = new Shape();
			hit_fuse.touchable = false;
			hit_fuse.graphics.beginFill(0xff0000);
			
			hit_fuse.graphics.lineTo(127,278);	
			hit_fuse.graphics.lineTo(148,252);	
			hit_fuse.graphics.lineTo(190,257);	
			hit_fuse.graphics.lineTo(195,340);	
			hit_fuse.graphics.lineTo(170,355);	
			hit_fuse.graphics.lineTo(141,341);	
					
			hit_fuse.graphics.endFill(false);
			hit_fuse.alpha = 0.0;
			
			hit_fuse.graphics.precisionHitTest = true;	
			this.addChild(hit_fuse);
		}
		
		
		private function CreateDrawerHit(open:Boolean = false):void{
			hit_drawer = new Shape();		
			hit_drawer.x = 0;
			hit_drawer.y = 0;
			hit_drawer.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				
				hit_drawer.graphics.lineTo(120,239);	
				hit_drawer.graphics.lineTo(212,210);	
				hit_drawer.graphics.lineTo(222,321);	
				hit_drawer.graphics.lineTo(141,361);	
				
				
			}else{
				
				hit_drawer.graphics.lineTo(203,212);
				hit_drawer.graphics.lineTo(272,231);
				hit_drawer.graphics.lineTo(275,350);
				hit_drawer.graphics.lineTo(206,319);
				
				
			}
			
			hit_drawer.graphics.endFill(false);			
			hit_drawer.alpha = 0.0;			
			hit_drawer.graphics.precisionHitTest = true;	
			hit_drawer.touchable = false
			this.addChild(hit_drawer);
		}
		
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){				
				if (touches[0].phase == TouchPhase.ENDED) {
					if(Animating === false){
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(LetterIsOpen === false){
						//	trace(touches[0].globalX+" ,"+touches[0].globalY);
							if(targ == goback.SourceImage){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((Lobby as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyObj,true
								);
							}else if(hit_desk.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((LobbyDesk as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyDeskObj,true
								);	
							}else if(hit_drawer.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								DrawerHandler();
								
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								LetterIsOpen = true;
								OpenLetter(true, 0)
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter;
								}		
								SaveArray['Letter'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyCounter',SaveArray);
							}else if(hit_binders.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Some binders and file storage materials.");
							}else if(hit_pen.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A ball-point pen.");
							}else if(hit_window.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The wind rattles the glass.");				
							}else if(hit_logo.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The red paint of the logo is chipping slightly.");		
							}else if(hit_chair.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){		
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder if anyone is supposed to be on security duty now...");
							}else if(hit_trash.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){		
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is nothing of interest in the trash can.");
							}else if(DrawerOpen === true){
								if(hit_fuse.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									FuseHandler();
								}
							
							}
							
							
							/*
							private var hit_binders:Shape;
							private var hit_pen:Shape;
							private var hit_window:Shape;
							private var hit_logo:Shape;
							private var hit_chair:Shape;
							
							*/
							
						}else{
							if(targ == goback.SourceImage){
								trace("GoBackClick");
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.HideReadOut();
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								RemoveLetter();
								LetterIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter;
								}		
								SaveArray['Letter'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyCounter',SaveArray);
							}else if(hit_openLetter.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The Chimera Corporation's official sign-in sheet for the building.");
							}else if(hit_openLetter_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Looks like someone hasn't signed out today.");
							}else if(hit_openLetter_paper.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It's a list of the people who came into the building today.");
							}
							
							/*
							private var hit_openLetter:Shape;
							private var hit_openLetter_01:Shape;
							private var hit_openLetter_paper:Shape;
							*/
						}
					}
				}
			}
		}
		
		private function OpenLetter(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openLetter = new Sprite();
			openLetter.alpha = 0;
			CreateOpenBookBg();
			openLetterPages = new Image(this.assets.getTexture('SignIn_Page_00'));
			this.openLetter.addChildAt(openBookbg,0);
			openLetter.addChild(openLetterPages);
			openLetterPages.touchable = false;
			
			this.addChildAt(openLetter,8);
			this.addChildAt(goback,9);
			
			
			if(Fade === false){
				openLetter.alpha = 1;
				CreateOpenLetterHit();
				Animating = false;
				//	CreateOpenNotePadHit();
			}else{
				
				OpenLetterTween = new Tween(openLetter, 0.5, Transitions.LINEAR);
				OpenLetterTween.fadeTo(1);
				OpenLetterTween.onComplete = function():void{
					//		CreateOpenNotePadHit();
					CreateOpenLetterHit();
					Animating = false; 
				};
				Starling.juggler.add(OpenLetterTween);	
				
			}
			//	CreateOpenBookHit(page);
		}
		private function RemoveLetter():void{
			Animating = true;
			hit_openLetter.graphics.clear();
			hit_openLetter_01.graphics.clear();
			hit_openLetter_paper.graphics.clear();
		
			//	Starling.juggler.purge();
			OpenLetterTween = new Tween(openLetter, 0.5, Transitions.LINEAR);
			OpenLetterTween.fadeTo(0);
			OpenLetterTween.onComplete = function():void{
				
				CloseLetter();
				Animating = false;
				
			};
			Starling.juggler.add(OpenLetterTween);		
		}
		
		public function CloseLetter():void{
			this.removeChild(openLetter);
			openLetter.dispose();
		}
		private function CreateOpenBookBg():void{
			openBookbg = new Shape();
			openBookbg.graphics.beginFill(0x000000);
			openBookbg.graphics.lineTo(0,0);	
			openBookbg.graphics.lineTo(800,0);	
			openBookbg.graphics.lineTo(800,512);	
			openBookbg.graphics.lineTo(0,512);	
			
			openBookbg.graphics.endFill(false);
			openBookbg.alpha = 0.5;
			//	openBookbg.graphics.precisionHitTest = true;				
			
		}
		private function CreateOpenLetterHit():void{
			hit_openLetter = new Shape();
			
			hit_openLetter.graphics.beginFill(0x0000FF);
			hit_openLetter.graphics.lineTo(111,38);	
			hit_openLetter.graphics.lineTo(639,27);	
			hit_openLetter.graphics.lineTo(631,112);	
			hit_openLetter.graphics.lineTo(118,122);	
			
			hit_openLetter.graphics.endFill(false);
			hit_openLetter.alpha = 0.0;
			hit_openLetter.touchable = false;
			hit_openLetter.graphics.precisionHitTest = true;	
			
			
			hit_openLetter_01 = new Shape();
			hit_openLetter_01.graphics.beginFill(0x0000FF);
			
			hit_openLetter_01.graphics.lineTo(118,179);	
			hit_openLetter_01.graphics.lineTo(671,168);	
			hit_openLetter_01.graphics.lineTo(673,211);	
			hit_openLetter_01.graphics.lineTo(118,225);	
		
			hit_openLetter_01.graphics.endFill(false);
			hit_openLetter_01.alpha = 0.0;
			hit_openLetter_01.touchable = false;
			hit_openLetter_01.graphics.precisionHitTest = true;	
			
			
			hit_openLetter_paper = new Shape();
			hit_openLetter_paper.graphics.beginFill(0x0000FF);
			
			hit_openLetter_paper.graphics.lineTo(118,129);	
			hit_openLetter_paper.graphics.lineTo(662,111);	
			hit_openLetter_paper.graphics.lineTo(673,404);	
			hit_openLetter_paper.graphics.lineTo(609,424);	
			hit_openLetter_paper.graphics.lineTo(126,437);	
		
			hit_openLetter_paper.graphics.endFill(false);
			hit_openLetter_paper.alpha = 0.0;
			hit_openLetter_paper.touchable = false;
			hit_openLetter_paper.graphics.precisionHitTest = true;	
			
			//hit_openLetter_paper
			
			this.addChild(hit_openLetter);
			this.addChild(hit_openLetter_01);
			this.addChild(hit_openLetter_paper);
			
		}
		
		private function FuseHandler():void{
			if(FusePickedUp === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter;	
				}
				FusePickedUp = true;
				fuse.alpha = 0;
				SaveArray['Fuse'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyCounter',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_FuseGreen,
					'item_FuseGreen',
					'inven_fuseGreen_sm'
				);
			}
		}
		
		private function DrawerHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();									
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyCounter;	
			}
			
			if(DrawerOpen === false){
				SaveArray['Drawer'] = "Open";
				DrawerOpen = true;
				drawer.alpha = 1;
				if(FusePickedUp === false){
					fuse.alpha = 1;
				}
				hit_drawer.graphics.clear();
				CreateDrawerHit(true);
				
			}else{
				SaveArray['Drawer'] = "Closed";
				DrawerOpen = false;
				drawer.alpha = 0;
				
				fuse.alpha = 0;
				
				hit_drawer.graphics.clear();
				CreateDrawerHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyCounter',SaveArray);
			
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
			
			
			
			this.assets.removeTexture("lobbyCounter_bg",true);
			this.assets.removeTexture("LobbyCounter_Sprite_01",true);
			this.assets.removeTexture("SignIn_Sprite",true);
			this.assets.removeTextureAtlas("LobbyCounter_Sprite_01",true);
			this.assets.removeTextureAtlas("SignIn_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("lobbyCounter_01");
			(stage.getChildAt(0) as Object).falseAsset("lobbyCounter_02");
			(stage.getChildAt(0) as Object).falseAsset("lobbyCounter_03");
			(stage.getChildAt(0) as Object).falseAsset("lobbyCounter_04");
			(stage.getChildAt(0) as Object).falseAsset("lobbyCounter_05");
			
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
