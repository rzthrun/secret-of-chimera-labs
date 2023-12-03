package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.DelayedCall;
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
	
	public class ServerRoomComputer extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var lid_on:Image;
		private var lid_off:Image;
		private var cube:Image;
		private var core:Image;
		private var screen:Image;
		private var eye:Image;
		private var lid_hot:Image;
		
		private var hit_screen:Shape;
		private var hit_lid:Shape;
		private var hit_core:Shape;		
		
		private var hit_eye:Shape;
		private var hit_tower:Shape;
		
		private var hit_book:Shape;
			
		
		private var openLetter:Sprite;
		private var openLetterPages:Image;
		private var hit_openLetter:Shape;

		private var hit_trash:Shape;
		public var OpenLetterTween:Tween;
		
		private var openBookbg:Shape;
		
		private var LetterIsOpen:Boolean = false;
		
		
		private var LidOpen:Boolean = false;
		private var ComputerOn:Boolean = false;
		private var Animating:Boolean = false;
		private var CubeAttached:Boolean = false;
		private var CubeDamageAttached:Boolean = false;
		private var AdimmRepaired:Boolean = false;
		private var HotLidTween:Tween;
		private var delayedCall:DelayedCall;
		
		
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function ServerRoomComputer(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('serverRoomComputer_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoomComputer/serverRoomComputer_bg.jpg'));
				game.TrackAssets('serverRoomComputer_01');
			}
			if(game.CheckAsset('serverRoomComputer_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoomComputer/ServerRoomComputer_Sprite_01.png'));
				game.TrackAssets('serverRoomComputer_02');
			}
			if(game.CheckAsset('serverRoomComputer_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoomComputer/ServerRoomComputer_Sprite_01.xml'));
				game.TrackAssets('serverRoomComputer_03');
			}
			
			if(game.CheckAsset('serverRoomComputer_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoomComputer/PostIt_Sprite.png'));
				game.TrackAssets('serverRoomComputer_04');
			}
			if(game.CheckAsset('serverRoomComputer_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoomComputer/PostIt_Sprite.xml'));
				game.TrackAssets('serverRoomComputer_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ServerRoomComputer","ServerRoomComputerObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			//(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomPal',SaveArray);
			
			bg = new Image(this.assets.getTexture('serverRoomComputer_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			
			core = new Image(this.assets.getTexture('core_on'));
			core.touchable = false;
			core.x = 64;
			core.y = 99;
			
			cube = new Image(this.assets.getTexture('cube_damage'));
			cube.touchable = false;
			cube.x = 142;
			cube.y = 157;
			
			lid_on = new Image(this.assets.getTexture('lid_on'));
			lid_on.touchable = false;
			lid_on.x = 56;
			lid_on.y = 93;
			
			lid_off = new Image(this.assets.getTexture('lid_off'));
			lid_off.touchable = false;
			lid_off.x = 5;
			lid_off.y = 244;
			
			screen = new Image(this.assets.getTexture('screen'));
			screen.touchable = false;
			screen.x = 537;
			screen.y = 87;
			
			
			eye = new Image(this.assets.getTexture('eye'));
			eye.touchable = false;
			eye.x = 340;
			eye.y = 332;
			
			lid_hot = new Image(this.assets.getTexture('lid_on_hot'));
			lid_hot.touchable = false;
			lid_hot.x = 56;
			lid_hot.y = 93;
			lid_hot.alpha = 0;
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox != undefined){
				trace("BARK 00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['Solved'] == 'Yes'){
					trace("BARK 01");
					ComputerOn = true;
					
					screen.alpha = 1;
					eye.alpha = 1;
					core.alpha = 1;
				}else{
					trace("BARK 02");
					screen.alpha = 0;
					eye.alpha = 0;
					core.alpha = 0;
				}
			}else{
				trace("BARK 03");
				screen.alpha = 0;
				eye.alpha = 0;
				core.alpha = 0;
				
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['AdimmRepaired'] == 'Yes'){
					AdimmRepaired = true;
					cube.texture = this.assets.getTexture('cube_clean');
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['CubeDamage'] == 'Attached'){
					cube.alpha = 1;
					CubeDamageAttached = true;
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['Cube'] == 'Attached'){
					cube.alpha = 1;
					CubeAttached = true;
				}else{
					cube.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['Lid'] == 'Open'){
					LidOpen = true;
					lid_on.alpha = 0;
					lid_off.alpha = 1;
					CreateCoreHit();
				}else{
					lid_on.alpha = 1;
					lid_off.alpha = 0;
				}
								
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['FirstTime'] == 'Yes'){
						
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer;
						SaveArray['FirstTime'] = 'Yes';
							
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomComputer',SaveArray);
							
						Starling.juggler.delayCall(function():void{
								(stage.getChildAt(0) as Object).MusicObj.LoadSoulSearch(true,3);
							
						},1.5);
					}
						
					
				}
				
			}else{
				cube.alpha = 0;
				lid_on.alpha = 1;
				lid_off.alpha = 0;
			}
		//	core.alpha = 0;
			
			
		
			/*
			private var lid_on:Image;
			private var lid_off:Image;
			private var cube:Image;
			private var core:Image;
			private var screen:Image;
			*/
		
			this.addChildAt(core,1);
			this.addChildAt(cube,2);
			this.addChildAt(lid_on,3);
			this.addChildAt(lid_off,4);
			this.addChildAt(screen,5);
			this.addChildAt(eye,6);
			this.addChildAt(lid_hot,7);
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){
				trace("WANBA 00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['AdimmRepaired'] == 'Yes'){
					trace("WANBA 01");
					if(AdimmRepaired === false){
						trace("WANBA 02");
						cube.texture = this.assets.getTexture('cube_clean');
						Animating = true;
						CubeDamageAttached = false;
						CubeAttached = true;
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer;	
						}
						SaveArray['AdimmRepaired'] = "Yes";
						SaveArray['CubeDamage'] = "Gone";
						SaveArray['Cube'] = "Attached";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomComputer',SaveArray);
						
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MicrowaveFan();
						delayedCall = new DelayedCall(function():void{
							AnimateHotLidIn();
							
						}, 2);
						Starling.juggler.add(delayedCall);
					}
				}
				
			}
			CreateEyeHit();
			CreateTowerHit();
			CreateBookHit();
			
			CreateScreenHit();
			CreateLidHit(LidOpen);
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['Letter'] == 'open'){
					LetterIsOpen = true;
					OpenLetter(false);
					this.addChild(goback);
				}
			}
			
			
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
		}
		private function AnimateHotLidIn():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MicrowaveFan();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
			HotLidTween = new Tween(lid_hot, 3, Transitions.EASE_OUT);
			HotLidTween.fadeTo(1);
			HotLidTween.onComplete = function():void{
				AnimateHotLidOut();
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
			};
			
			Starling.juggler.add(HotLidTween);
		}
		private function AnimateHotLidOut():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OhmTwo();
			
			HotLidTween = new Tween(lid_hot, 3, Transitions.EASE_IN);
			HotLidTween.fadeTo(0);
			HotLidTween.onComplete = function():void{
				FinishHotLidTween()
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
			};
			
			Starling.juggler.add(HotLidTween);
		}
		private function FinishHotLidTween():void{
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OvenDing();
			Animating = false;
			LidHandler();
		}
		
	
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(366,94);	
			hit_book.graphics.lineTo(461,93);	
			hit_book.graphics.lineTo(455,182);	
			hit_book.graphics.lineTo(368,181);	
			
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
		private function CreateTowerHit():void{
			hit_tower = new Shape();
			hit_tower.touchable = false;
			hit_tower.graphics.beginFill(0xff0000);
			
			hit_tower.graphics.lineTo(23,341);	
			hit_tower.graphics.lineTo(35,6);	
			hit_tower.graphics.lineTo(647,10);	
			hit_tower.graphics.lineTo(751,283);	
			hit_tower.graphics.lineTo(543,506);	
			hit_tower.graphics.lineTo(94,506);	
			
			hit_tower.graphics.endFill(false);
			hit_tower.alpha = 0.0;
			
			hit_tower.graphics.precisionHitTest = true;	
			this.addChild(hit_tower);
		}
		
		private function CreateEyeHit():void{
			hit_eye = new Shape();
			hit_eye.touchable = false;
			hit_eye.graphics.beginFill(0xff0000);
			
			hit_eye.graphics.lineTo(282,268);	
			hit_eye.graphics.lineTo(470,264);	
			hit_eye.graphics.lineTo(467,453);	
			hit_eye.graphics.lineTo(278,449);	
			
			hit_eye.graphics.endFill(false);
			hit_eye.alpha = 0.0;
			
			hit_eye.graphics.precisionHitTest = true;	
			this.addChild(hit_eye);
		}
		
		private function CreateCoreHit():void{
			hit_core = new Shape();
			hit_core.touchable = false;
			hit_core.graphics.beginFill(0xff0000);
			
			hit_core.graphics.lineTo(76,104);	
			hit_core.graphics.lineTo(217,104);	
			hit_core.graphics.lineTo(217,231);	
			hit_core.graphics.lineTo(70,232);	
			
			hit_core.graphics.endFill(false);
			hit_core.alpha = 0.0;
			
			hit_core.graphics.precisionHitTest = true;	
			this.addChild(hit_core);
		}
		
		private function CreateLidHit(open:Boolean = false):void{
			hit_lid = new Shape();
			this.addChild(hit_lid);
			if(open === false){
				
				hit_lid.x = 0;
				hit_lid.y = 0;
				hit_lid.graphics.beginFill(0x0000FF);
				
				hit_lid.graphics.lineTo(61,95);
				hit_lid.graphics.lineTo(228,88);
				hit_lid.graphics.lineTo(223,248);
				hit_lid.graphics.lineTo(53,250);

				
				hit_lid.graphics.endFill(false);
				
				hit_lid.alpha = 0.0;
				
				hit_lid.graphics.precisionHitTest = true;	
			}else{
				
				hit_lid.x = 0;
				hit_lid.y = 0;
				hit_lid.graphics.beginFill(0x0000FF);	
				
				hit_lid.graphics.lineTo(4,382);
				hit_lid.graphics.lineTo(53,243);
				hit_lid.graphics.lineTo(225,242);
				hit_lid.graphics.lineTo(195,385);

				
				hit_lid.graphics.endFill(false);
				hit_lid.alpha = 0.0;
				
				hit_lid.graphics.precisionHitTest = true;				
			}
			hit_lid.touchable = false;
			
		}		
		private function CreateScreenHit():void{
			hit_screen = new Shape();
			hit_screen.touchable = false;
			hit_screen.graphics.beginFill(0x00ff00);
			
			hit_screen.graphics.lineTo(510,64);	
			hit_screen.graphics.lineTo(656,58);	
			hit_screen.graphics.lineTo(738,136);	
			hit_screen.graphics.lineTo(741,264);	
			hit_screen.graphics.lineTo(514,264);	
			
			hit_screen.graphics.endFill(false);
			hit_screen.alpha = 0.0;
			
			hit_screen.graphics.precisionHitTest = true;	
			this.addChild(hit_screen);
		}

		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(LetterIsOpen === false){
							if(LidOpen === true){
								if(hit_core.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									CoreHandler();
									return;
								}
								
							}
							
							if(targ == goback.SourceImage){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((ServerRoom as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ServerRoomObj,true
								);
							}else if(hit_screen.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(ComputerOn === false){
									trace("SMART PLUG");
									OffScreenHandler();
								}else{
									FadeOut((ServerRoomPal as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.ServerRoomPalObj,true
									);
								}
								
							}else if(hit_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LidHandler();
								return;
							}else if(hit_eye.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								EyeHandler();
							
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								Animating = true;
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								
								OpenLetter(true, 0);
								LetterIsOpen = true;
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer;
								}		
								SaveArray['Letter'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomComputer',SaveArray);
							}else if(hit_tower.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								TowerHandler();
							}
							/*
							CreateEyeHit();
							CreateTowerHit();
							private var hit_eye:Shape;
							private var hit_tower:Shape;		
							*/
						}else{
							if(targ == goback.SourceImage){
								trace("GoBackClick");
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.HideReadOut();
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								RemoveLetter();
								LetterIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer;
								}		
								SaveArray['Letter'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomComputer',SaveArray);
								
								
							}else if(hit_openLetter.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'...at One-Time Caesar too was an Enigma...'");
							}
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
			openLetterPages = new Image(this.assets.getTexture('postitnote_page_00'));
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
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('onetime_caesar');
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
			hit_openLetter.graphics.lineTo(201,26);	
			hit_openLetter.graphics.lineTo(639,19);	
			hit_openLetter.graphics.lineTo(599,485);	
			hit_openLetter.graphics.lineTo(150,464);	
			
			
			hit_openLetter.graphics.endFill(false);
			hit_openLetter.alpha = 0.0;
			hit_openLetter.touchable = false;
			hit_openLetter.graphics.precisionHitTest = true;	
			
		
			//hit_openLetter_paper
			
			this.addChild(hit_openLetter);
		
			
		}
		
		
		
		
		
		
		private function OffScreenHandler():void{
			
				if(RONum == 0){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The screen is currently blank.");
					RONum = 1;
				}else if(RONum == 1){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... nothing happens when I try to turn the machine on...");					
					RONum = 2;
				}else if(RONum == 2){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Looks like there still isn't any electricity reaching the computer.");	
					RONum = 0;
				}
			
		}
		
		private function TowerHandler():void{
			if(ComputerOn === false){
				if(RONum == 0){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Three very tall computer towers.");
					RONum = 1;
				}else if(RONum == 1){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The computer towers are silent... the machine doesn't appear to be on.");					
					RONum = 2;
				}else if(RONum == 2){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder what all this processing power is used for...");	
					RONum = 0;
				}
			}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The three monolithic machines hum with a quiet confidence.");
					
			}
		}
		private function EyeHandler():void{
			if(ComputerOn === false){
				if(RONum == 0){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A thick glass orb sits half-encased in thick plastic.");
					RONum = 1;
				}else if(RONum == 1){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think I can see intricate electronic components through the glass.");					
					RONum = 2;
				}else if(RONum == 2){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The glass orb could be used to refract light waves...");	
					RONum = 0;
				}
			}else{
				if(RONum == 0){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think this is an advanced type of camera....");
					RONum = 1;
				}else if(RONum == 1){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The gaze of the machine is pointed at the table in the center of the room.");					
					RONum = 2;
				}else if(RONum == 2){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The red dot stares impassively out from the computer tower.");	
					RONum = 0;
				}
			}
		}
		
		private function CoreHandler():void{
			if(CubeDamageAttached === true){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer;	
				}
				CubeDamageAttached = false;
				cube.alpha = 0;
				SaveArray['CubeDamage'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomComputer',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CubeDamage,
					'item_CubeDamage',
					'inven_cubeDamage_sm'
				);
			}else if(CubeAttached === true){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer;	
				}
				CubeAttached = false;
				cube.alpha = 0;
				SaveArray['Cube'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomComputer',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Cube,
					'item_Cube',
					'inven_cube_sm'
				);
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_CubeDamage)
			{
			//	if(ComputerOn === true){
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InputAccept();
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
			//	}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
			//	}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer;	
				}
				SaveArray['CubeDamage'] = "Attached";
				CubeDamageAttached = true;
				cube.texture = this.assets.getTexture('cube_damage');
				cube.alpha = 1;
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomComputer',SaveArray);
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_CubeDamage,
						"item_CubeDamage"
					);
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Cube)
			{
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer;	
				}
				SaveArray['Cube'] = "Attached";
				CubeAttached = true;
				cube.texture = this.assets.getTexture('cube_clean');
				cube.alpha = 1;
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomComputer',SaveArray);
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_Cube,
						"item_Cube"
					);
			}else{
				if(ComputerOn === true){
					if(RONum == 0){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The inside of the chamber glows.");
						RONum = 1;
					}else if(RONum == 1){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a rectangular space in the center where the machinery and instruments seem to focus...");					
						RONum = 2;
					}else if(RONum == 2){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are powerful magnets, pumps, hoses, and wiring weaving and interlocking inside the chamber.");	
						RONum = 0;
					}
				}else{
					
					
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a recessed chamber with all types of machinery and components inside.");
						
					
				}
			}

		}
		
		private function LidHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer;	
			}
			if(LidOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawSlideOpen();
				LidOpen = true;
				lid_off.alpha = 1;
				lid_on.alpha = 0;
				SaveArray['Lid'] = "Open";
				hit_lid.graphics.clear();
				CreateLidHit(true);
				CreateCoreHit();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawSlideClosed();
				LidOpen = false;
				lid_off.alpha = 0;
				lid_on.alpha = 1;
				SaveArray['Lid'] = "Closed";
				hit_lid.graphics.clear();
				hit_core.graphics.clear();
				CreateLidHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomComputer',SaveArray);
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
			
			
			
			this.assets.removeTexture("serverRoomComputer_bg",true);
			this.assets.removeTexture("ServerRoomComputer_Sprite_01",true);
			this.assets.removeTextureAtlas("ServerRoomComputer_Sprite_01",true);
			this.assets.removeTexture("PostIt_Sprite",true);
			this.assets.removeTextureAtlas("PostIt_Sprite",true);
			//PostIt_Sprite
			(stage.getChildAt(0) as Object).falseAsset("serverRoomComputer_01");
			(stage.getChildAt(0) as Object).falseAsset("serverRoomComputer_02");
			(stage.getChildAt(0) as Object).falseAsset("serverRoomComputer_03");
			(stage.getChildAt(0) as Object).falseAsset("serverRoomComputer_04");
			(stage.getChildAt(0) as Object).falseAsset("serverRoomComputer_05");
			
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
import screens.ingamescreens;

