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
	
	
	public class LobbyDesk extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		private var screen:Image;
		private var phone:Image;
		
		private var hit_computer:Shape;
		private var hit_phone:Shape;
		
		private var hit_lamp:Shape;
		private var hit_coffee:Shape;
		private var hit_chair:Shape;
		
		private var ScreenTween:Tween;
		
		private var ScreenOn:Boolean = false;
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		private var openBookbg:Shape;
		
		private var MorsePlaying:Boolean = false;
		private var PhoneIsOpen:Boolean = false;
		
		private var RONum:int = 0;
		
		private var openPhone:Sprite;
		private var openPhonePages:Image;
		private var soundWave:Image;
		private var hit_openPhone:Shape;
		private var hit_openHeadSet:Shape;
		public var OpenPhoneTween:Tween;
		public var soundWaveTween:Tween;
		
		public function LobbyDesk(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('lobbyDesk_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyDesk/lobbyDesk_bg.jpg'));
				game.TrackAssets('lobbyDesk_01');
			}
			if(game.CheckAsset('lobbyDesk_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyDesk/LobbyDesk_Sprite_01.png'));
				game.TrackAssets('lobbyDesk_02');
			}
			if(game.CheckAsset('lobbyDesk_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyDesk/LobbyDesk_Sprite_01.xml'));
				game.TrackAssets('lobbyDesk_03');
			}
			if(game.CheckAsset('lobbyDesk_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyDesk/LobbyDesk_Sprite_02.png'));
				game.TrackAssets('lobbyDesk_04');
			}
			if(game.CheckAsset('lobbyDesk_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyDesk/LobbyDesk_Sprite_02.xml'));
				game.TrackAssets('lobbyDesk_05');
			}
			//LobbyDesk_Sprite_01
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("LobbyDesk","LobbyDeskObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('lobbyDesk_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			
			screen = new Image(this.assets.getTexture('screen_blue'));
			screen.touchable = false;
			screen.x = 384;
			screen.y = 59;
			
			phone = new Image(this.assets.getTexture('phone'));
			phone.touchable = false;
			phone.x = 175;
			phone.y = 169;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk['Screen'] == 'on'){
					ScreenOn = true;
					screen.texture = this.assets.getTexture('screen');
					screen.alpha = 1;
				
				/*	if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer != undefined){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['Window'] == 'MM'){
							screen.texture = this.assets.getTexture('screen_email');
							
						}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['Window'] == 'DC'){
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['DC_Window'] == 'mgnt'){
								screen.texture = this.assets.getTexture('screen_dc_mgnt');
							}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['DC_Window'] == 'elevator'){
								screen.texture = this.assets.getTexture('screen_dc_elevator');
							}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['DC_Window'] == 'entrance'){
								screen.texture = this.assets.getTexture('screen_dc_front');
							}else{
								screen.texture = this.assets.getTexture('screen_dc_front');
							}
						}else{
							screen.texture = this.assets.getTexture('screen_dc_desktop');
						}
					}else{
						
						screen.texture = this.assets.getTexture('screen_dc_desktop');
						
					}
				*/	
				
				}else{
					screen.alpha = 0;
				}
					
			}else{
				screen.alpha = 0;
			}
			
			
			
			this.addChildAt(screen,1);
			this.addChildAt(phone,2);			
			
			CreateLampHit();
			CreateChairHit();
			CreateCoffeeHit();
			
			CreateLobbyComputerHit();
			CreatePhoneHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk["Phone"] == "open"){
					PhoneIsOpen = true;
					OpenPhone();
					
					this.addChild(goback);
				}
			}
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		private function CreateChairHit():void{
			hit_chair = new Shape();
			hit_chair.touchable = false;
			hit_chair.graphics.beginFill(0xff0000);
			
			hit_chair.graphics.lineTo(0,356);	
			hit_chair.graphics.lineTo(122,322);	
			hit_chair.graphics.lineTo(161,384);	
			hit_chair.graphics.lineTo(226,403);	
			hit_chair.graphics.lineTo(285,505);	
			hit_chair.graphics.lineTo(75,506);	
			
			hit_chair.graphics.endFill(false);
			hit_chair.alpha = 0.0;
			
			hit_chair.graphics.precisionHitTest = true;	
			this.addChild(hit_chair);
		}
		
		
		private function CreateCoffeeHit():void{
			hit_coffee = new Shape();
			hit_coffee.touchable = false;
			hit_coffee.graphics.beginFill(0xff0000);
			
			hit_coffee.graphics.lineTo(592,395);	
			hit_coffee.graphics.lineTo(641,350);	
			hit_coffee.graphics.lineTo(713,364);	
			hit_coffee.graphics.lineTo(732,394);	
			hit_coffee.graphics.lineTo(592,472);	
				
			
			hit_coffee.graphics.endFill(false);
			hit_coffee.alpha = 0.0;
			
			hit_coffee.graphics.precisionHitTest = true;	
			this.addChild(hit_coffee);
		}
		
		private function CreateLampHit():void{
			hit_lamp = new Shape();
			hit_lamp.touchable = false;
			hit_lamp.graphics.beginFill(0xff0000);
			
			hit_lamp.graphics.lineTo(52,52);	
			hit_lamp.graphics.lineTo(103,3);	
			hit_lamp.graphics.lineTo(185,7);	
			hit_lamp.graphics.lineTo(213,47);	
			hit_lamp.graphics.lineTo(128,94);	
			hit_lamp.graphics.lineTo(170,202);	
			hit_lamp.graphics.lineTo(111,229);	
			hit_lamp.graphics.lineTo(43,191);	
			
			hit_lamp.graphics.endFill(false);
			hit_lamp.alpha = 0.0;
			
			hit_lamp.graphics.precisionHitTest = true;	
			this.addChild(hit_lamp);
		}
	
			
		private function CreatePhoneHit():void{
			hit_phone = new Shape();
			hit_phone.touchable = false;
			hit_phone.graphics.beginFill(0xff0000);
			
			hit_phone.graphics.lineTo(158,268);	
			hit_phone.graphics.lineTo(186,199);	
			hit_phone.graphics.lineTo(223,154);	
			hit_phone.graphics.lineTo(346,170);	
			hit_phone.graphics.lineTo(311,285);	
			
			
			hit_phone.graphics.endFill(false);
			hit_phone.alpha = 0.0;
			
			hit_phone.graphics.precisionHitTest = true;	
			this.addChild(hit_phone);
		}
		
		
		private function CreateLobbyComputerHit():void{
			hit_computer = new Shape();
			hit_computer.touchable = false;
			hit_computer.graphics.beginFill(0xff0000);
			
			hit_computer.graphics.lineTo(328,320);	
			hit_computer.graphics.lineTo(364,230);	
			hit_computer.graphics.lineTo(385,34);	
			hit_computer.graphics.lineTo(674,87);	
			hit_computer.graphics.lineTo(691,104);	
			hit_computer.graphics.lineTo(641,325);	
			hit_computer.graphics.lineTo(518,424);	
			
			
			hit_computer.graphics.endFill(false);
			hit_computer.alpha = 0.0;
			
			hit_computer.graphics.precisionHitTest = true;	
			this.addChild(hit_computer);
		}
		
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){			
				if (touches[0].phase == TouchPhase.ENDED) {
					trace(touches[0].globalX+" ,"+touches[0].globalY);
					if(Animating === false){
							if(PhoneIsOpen === false){
								if(targ == goback.SourceImage){								
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
									FadeOut((LobbyCounter as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyCounterObj,true
									);
								}else if(hit_computer.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									ComputerHandler();
								}else if(hit_phone.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PhonePickUp();
									//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
										PhoneIsOpen = true;
										OpenPhone(true, 0)
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk;
									}		
									SaveArray['Phone'] = "open";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyDesk',SaveArray);		
								}else if(hit_lamp.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									LampHandler();
								}else if(hit_chair.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									ChairHandler();
								}else if(hit_coffee.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									CoffeeHandler();
								}
								/*
								private var hit_lamp:Shape;
								private var hit_coffee:Shape;
								private var hit_chair:Shape;
								
								*/
							}else{
								if(targ == goback.SourceImage){
									//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();									
									RemovePhone();
									PhoneIsOpen = false;	
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk;
									}		
									SaveArray['Phone'] = "closed";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyDesk',SaveArray);
								}else if(hit_openPhone.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Repeating tones are beeping continuously out of the phone.");	
								}else if(hit_openHeadSet.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();									
									RemovePhone();
									PhoneIsOpen = false;	
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk;
									}		
									SaveArray['Phone'] = "closed";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyDesk',SaveArray);
								}
							}
					}
				}
			}
		}
		private function CoffeeHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An empty coffee cup.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The coffee cup is stained and clearly well used.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Whomever works here must enjoy coffee from time to time.");
			}
		}
		
		private function LampHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An electric lamp.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The lamp has an odd design.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Lamp is warm and buzzes quietly.");
			}
		}
		
		private function ChairHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The chair is made from a faux leather.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Is it just my imagination... or is the chair still warm...");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is nothing unusual about the chair.");
			}
		}
		private function OpenPhone(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openPhone = new Sprite();
			openPhone.alpha = 0;
			CreateOpenBookBg();
			openPhonePages = new Image(this.assets.getTexture('openPhone'));
			openPhonePages.x = 33;
			openPhonePages.y = 30;
			
			soundWave = new Image(this.assets.getTexture('waves'));
			soundWave.x = 115;
			soundWave.y = 30;
			soundWave.alpha = 0;
			
			this.openPhone.addChildAt(openBookbg,0);
			this.openPhone.addChildAt(openPhonePages,1);
			this.openPhone.addChildAt(soundWave,2);
			
			openPhonePages.touchable = false;
			
			this.addChildAt(openPhone,6);
			this.addChildAt(goback,7);
			
			
			if(Fade === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MorseOne();									
				
				openPhone.alpha = 1;
				soundWave.alpha = 1;
				CreateOpenPhoneHit();
				CreateOpenHeadSetHit();
				Animating = false;
				//	CreateOpenNotePadHit();
			}else{
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('morse_one');
			//	game.screenGamePlayHandler.NoteBookObj.AddToNoteBook('morse_one');
				
				OpenPhoneTween = new Tween(openPhone, 0.5, Transitions.LINEAR);
				OpenPhoneTween.fadeTo(1);
				OpenPhoneTween.onComplete = function():void{
					//		CreateOpenNotePadHit();
					
					FadeInSoundWave();
					
				};
				Starling.juggler.add(OpenPhoneTween);	
				
			}
			//	CreateOpenBookHit(page);
		}
		
		public function FadeInSoundWave():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MorseOne();									
			
			soundWaveTween = new Tween(soundWave, 1, Transitions.LINEAR);
			soundWaveTween.fadeTo(1);
			soundWaveTween.onComplete = function():void{
				//		CreateOpenNotePadHit();
				
				
				CreateOpenPhoneHit();
				CreateOpenHeadSetHit();
				Animating = false; 
			};
			
			Starling.juggler.add(soundWaveTween);	
		}
		//hit_openHeadSet
		private function CreateOpenHeadSetHit():void{
			hit_openHeadSet = new Shape();
			this.addChild(hit_openHeadSet);
			hit_openHeadSet.graphics.beginFill(0x0000FF);
			hit_openHeadSet.graphics.lineTo(18,48);	
			hit_openHeadSet.graphics.lineTo(82,20);	
			hit_openHeadSet.graphics.lineTo(210,26);	
			hit_openHeadSet.graphics.lineTo(349,508);	
			hit_openHeadSet.graphics.lineTo(131,504);	
			
			hit_openHeadSet.graphics.endFill(false);
			hit_openHeadSet.alpha = 0.0;
			hit_openHeadSet.touchable = false;
			hit_openHeadSet.graphics.precisionHitTest = true;	
		}
		
		private function CreateOpenPhoneHit():void{
			hit_openPhone = new Shape();
			this.addChild(hit_openPhone);
			hit_openPhone.graphics.beginFill(0x0000FF);
			hit_openPhone.graphics.lineTo(110,84);	
			hit_openPhone.graphics.lineTo(208,25);	
			hit_openPhone.graphics.lineTo(592,22);	
			hit_openPhone.graphics.lineTo(705,109);	
			hit_openPhone.graphics.lineTo(749,358);	
			hit_openPhone.graphics.lineTo(602,435);	
			hit_openPhone.graphics.lineTo(413,417);	
			
			hit_openPhone.graphics.endFill(false);
			hit_openPhone.alpha = 0.0;
			hit_openPhone.touchable = false;
			hit_openPhone.graphics.precisionHitTest = true;	
		}
		private function RemovePhone():void{
			(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("MorseOne");
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PhonePutDown();
			Animating = true;
			hit_openPhone.graphics.clear();
			hit_openHeadSet.graphics.clear();
			//	Starling.juggler.purge();
			OpenPhoneTween = new Tween(openPhone, 0.5, Transitions.LINEAR);
			OpenPhoneTween.fadeTo(0);
			OpenPhoneTween.onComplete = function():void{
				
				ClosePhone();
				Animating = false;
				
			};
			Starling.juggler.add(OpenPhoneTween);		
		}
		
		public function ClosePhone():void{
			
			this.removeChild(openPhone);
			openPhone.dispose();
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
		private function ComputerHandler():void{
			if(ScreenOn === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BootUp();
			
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyDesk;
				}
				SaveArray['Screen'] = 'on';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyDesk',SaveArray);

				ScreenOn = true;
				Animating = true;
				
				ScreenTween = new Tween(screen, 2, Transitions.LINEAR);
				ScreenTween.fadeTo(1);
				ScreenTween.onComplete = function():void{	
					ComputerFadeInCallback();
				}
				Starling.juggler.add(ScreenTween);
			}else{
				FadeOut((LobbyComputer as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyComputerObj,true
				);	
			}
		}
		
		public function ComputerFadeInCallback():void{
			screen.texture = this.assets.getTexture('screen');
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
			
			Animating = false;
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
			
			
			
			this.assets.removeTexture("lobbyDesk_bg",true);
			this.assets.removeTexture("LobbyDesk_Sprite_01",true);
			this.assets.removeTextureAtlas("LobbyDesk_Sprite_01",true);
			this.assets.removeTexture("LobbyDesk_Sprite_02",true);
			this.assets.removeTextureAtlas("LobbyDesk_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("lobbyDesk_01");
			(stage.getChildAt(0) as Object).falseAsset("lobbyDesk_02");
			(stage.getChildAt(0) as Object).falseAsset("lobbyDesk_03");
			(stage.getChildAt(0) as Object).falseAsset("lobbyDesk_04");
			(stage.getChildAt(0) as Object).falseAsset("lobbyDesk_05");
			
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
