package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import events.ImageLoadEvent;
	
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
	
	public class ExteriorCarFront extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var gloveBox:Image;
		private var card:Image;
		private var keys:Image;
		private var dash:Image;
		private var book:Image;
				
		private var hit_glovebox:Shape;
		private var hit_keyCard:Shape;
		private var hit_book:Shape;
		private var hit_keySlot:Shape;
		private var hit_radio:Shape;
		
		private var hit_stick:Shape;
		private var hit_wheel:Shape;
		private var hit_door:Shape;
		private var hit_interior:Shape;
		private var hit_airbags:Shape;
		private var hit_floor:Shape;
		
		//	private var hit_elevator_door:Shape;
		private var GloveBoxOpen:Boolean = false;
		private var CardPickedUp:Boolean = false;
		private var Animating:Boolean = false;
		private var BookPickedUp:Boolean = false;
		private var CarOn:Boolean = false;
		private var KeysAttached:Boolean = false;
		
		public var RadioTween:Tween;
		
		private var openBookbg:Shape;
		private var PhoneIsOpen:Boolean = false;
		private var openPhone:Sprite;
		private var openPhonePages:Image;
	//	private var soundWave:Image;
		private var hit_openPhone:Shape;
		private var hit_openHeadSet:Shape;
		public var OpenPhoneTween:Tween;
//		public var soundWaveTween:Tween;
		
		private var RONum:int = 0;
		
	//	private var MorsePlaying:Boolean = false;
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function ExteriorCarFront(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('exteriorCarFront_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCarFront/exteriorCarFront_bg.jpg'));
				game.TrackAssets('exteriorCarFront_01');
			}
			if(game.CheckAsset('exteriorCarFront_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCarFront/ExteriorCarFront_Sprite_01.png'));
				game.TrackAssets('exteriorCarFront_02');
			}
			if(game.CheckAsset('exteriorCarFront_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCarFront/ExteriorCarFront_Sprite_01.xml'));
				game.TrackAssets('exteriorCarFront_03');
			}
			if(game.CheckAsset('exteriorCarFront_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCarFront/ExteriorCarFront_Sprite_02.png'));
				game.TrackAssets('exteriorCarFront_04');
			}
			if(game.CheckAsset('exteriorCarFront_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCarFront/ExteriorCarFront_Sprite_02.xml'));
				game.TrackAssets('exteriorCarFront_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ExteriorCarFront","ExteriorCarFrontObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('exteriorCarFront_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);

			gloveBox = new Image(this.assets.getTexture('glovebox'));
			gloveBox.touchable = false;
			gloveBox.x = 504;
			gloveBox.y = 205;
			
			card = new Image(this.assets.getTexture('screwdriver'));
			card.touchable = false;
			card.x = 559;
			card.y = 313;
						
			dash = new Image(this.assets.getTexture('dash'));
			dash.touchable = false;
			dash.x = 433;
			dash.y = 84;
			
			keys = new Image(this.assets.getTexture('keys'));
			keys.touchable = false;
			keys.x = 435;
			keys.y = 136;
			
			book = new Image(this.assets.getTexture('book_c'));
			book.touchable = false;
			book.x = 239;
			book.y = 297;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront['Card'] == 'PickedUp'){	
					CardPickedUp = true;	
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront['GloveBox'] == 'Open'){	
					GloveBoxOpen = true;
					gloveBox.alpha = 1;
					if(CardPickedUp === true){
						card.alpha = 0;
					}else{
						card.alpha = 1;
					}
				}else{
					gloveBox.alpha = 0;
					card.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront['Book'] == 'PickedUp'){	
					BookPickedUp = true;
					book.alpha = 0;					
				}else{
					book.alpha = 1;
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront['KeysAttached'] == 'Yes'){	
					KeysAttached = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront['CarOn'] == 'Yes'){	
						keys.texture = this.assets.getTexture('keys_on');
						CarOn = true;
						dash.alpha = 1;
					//	(stage.getChildAt(0) as Object).AmbientObj.LoadTVStatic(true,999);
					//	(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("TVStatic",0,((stage.getChildAt(0) as Object).AmbientObj.globalVol/10),null);
						
					}else{
						dash.alpha = 0;
					}
					
					keys.alpha = 1;					
				}else{
					keys.alpha = 0;
					dash.alpha = 0;
				}
			
				
			}else{
				gloveBox.alpha = 0;
				card.alpha = 0;
				book.alpha = 1;
				keys.alpha = 0;
				dash.alpha = 0;
			}
			
			this.addChildAt(gloveBox,1);
			this.addChildAt(card,2);
			this.addChildAt(dash,3);
			this.addChildAt(keys,4);
			this.addChildAt(book,5);
			
			CreateStickHit();
			CreateWheelHit();
			CreateDoorHit();
			CreateAirbagsHit();
			CreateFloorHit();
			CreateInteriorHit();
			
			CreateGloveBoxHit(GloveBoxOpen);
			CreateKeyCardHit();
			CreateBookHit();
			CreateKeySlotHit();
			CreateRadioHit();
			
			//CreateKeyCardHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront["Phone"] == "open"){
					PhoneIsOpen = true;
					OpenPhone();
					
					this.addChild(goback);
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarFront',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadSubBop(true,3);
							
						},1.5);
					}
				}
				
			}else{
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarFront',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						//	Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadSubBop(true,3);
					
					},1.5);
				}
			}
			
			
						
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			Starling.juggler.delayCall(function():void{
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadCityHum(true,999);				
				
			},0.5);
			
			
			
			
		}
	
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0xff0000);
			
			hit_floor.graphics.lineTo(446,384);	
			hit_floor.graphics.lineTo(554,337);	
			hit_floor.graphics.lineTo(638,397);	
			hit_floor.graphics.lineTo(563,509);	
			hit_floor.graphics.lineTo(488,506);	
		
			
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		private function CreateInteriorHit():void{
			hit_interior = new Shape();
			hit_interior.touchable = false;
			hit_interior.graphics.beginFill(0xff0000);
			
			hit_interior.graphics.lineTo(30,170);	
			hit_interior.graphics.lineTo(123,81);	
			hit_interior.graphics.lineTo(223,250);	
			hit_interior.graphics.lineTo(335,239);	
			hit_interior.graphics.lineTo(481,449);	
			hit_interior.graphics.lineTo(441,508);	
			hit_interior.graphics.lineTo(209,505);	
			
			hit_interior.graphics.endFill(false);
			hit_interior.alpha = 0.0;
			
			hit_interior.graphics.precisionHitTest = true;	
			this.addChild(hit_interior);
		}
		
		
		private function CreateAirbagsHit():void{
			hit_airbags = new Shape();
			hit_airbags.touchable = false;
			hit_airbags.graphics.beginFill(0xff0000);
			
			hit_airbags.graphics.lineTo(545,176);	
			hit_airbags.graphics.lineTo(566,110);	
			hit_airbags.graphics.lineTo(740,160);	
			hit_airbags.graphics.lineTo(723,248);	
			
			hit_airbags.graphics.endFill(false);
			hit_airbags.alpha = 0.0;
			
			hit_airbags.graphics.precisionHitTest = true;	
			this.addChild(hit_airbags);
		}
		
		
		private function CreateDoorHit():void{
			hit_door = new Shape();
			hit_door.touchable = false;
			hit_door.graphics.beginFill(0xff0000);
			
			hit_door.graphics.lineTo(100,0);	
			hit_door.graphics.lineTo(346,0);	
			hit_door.graphics.lineTo(393,42);	
			hit_door.graphics.lineTo(330,241);	
			hit_door.graphics.lineTo(223,247);	
			
			hit_door.graphics.endFill(false);
			hit_door.alpha = 0.0;
			
			hit_door.graphics.precisionHitTest = true;	
			this.addChild(hit_door);
		}
		
		private function CreateWheelHit():void{
			hit_wheel = new Shape();
			hit_wheel.touchable = false;
			hit_wheel.graphics.beginFill(0xff0000);
			
			hit_wheel.graphics.lineTo(346,128);	
			hit_wheel.graphics.lineTo(388,47);	
			hit_wheel.graphics.lineTo(428,39);	
			hit_wheel.graphics.lineTo(513,96);	
			hit_wheel.graphics.lineTo(386,197);	
			hit_wheel.graphics.lineTo(350,185);	
			
			hit_wheel.graphics.endFill(false);
			hit_wheel.alpha = 0.0;
			
			hit_wheel.graphics.precisionHitTest = true;	
			this.addChild(hit_wheel);
		}
		
		
		private function CreateStickHit():void{
			hit_stick = new Shape();
			hit_stick.touchable = false;
			hit_stick.graphics.beginFill(0xff0000);
			
			hit_stick.graphics.lineTo(351,236);	
			hit_stick.graphics.lineTo(405,221);	
			hit_stick.graphics.lineTo(475,322);	
			hit_stick.graphics.lineTo(378,342);	
			hit_stick.graphics.lineTo(361,312);	
			
			hit_stick.graphics.endFill(false);
			hit_stick.alpha = 0.0;
			
			hit_stick.graphics.precisionHitTest = true;	
			this.addChild(hit_stick);
		}
		
		private function CreateGloveBoxHit(open:Boolean = false):void{
			hit_glovebox = new Shape();		
			hit_glovebox.x = 0;
			hit_glovebox.y = 0;
			hit_glovebox.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_glovebox.graphics.lineTo(542,204);	
				hit_glovebox.graphics.lineTo(546,185);	
				hit_glovebox.graphics.lineTo(687,241);	
				hit_glovebox.graphics.lineTo(687,342);	
				hit_glovebox.graphics.lineTo(543,266);	
				
			}else{			
				
				hit_glovebox.graphics.lineTo(518,313);	
				hit_glovebox.graphics.lineTo(523,290);	
				hit_glovebox.graphics.lineTo(591,244);	
				hit_glovebox.graphics.lineTo(674,273);	
				hit_glovebox.graphics.lineTo(706,344);	
				hit_glovebox.graphics.lineTo(640,396);	
				
				
			}
			
			hit_glovebox.graphics.endFill(false);			
			hit_glovebox.alpha = 0.0;			
			hit_glovebox.graphics.precisionHitTest = true;	
			hit_glovebox.touchable = false
			this.addChild(hit_glovebox);
		}
		//private var hit_keySlot:Shape;
		//private var hit_radio:Shape;
		//391
		private function CreateRadioHit():void{
			hit_radio = new Shape();
			hit_radio.touchable = false;
			hit_radio.graphics.beginFill(0xff0000);
			
			hit_radio.graphics.lineTo(474,115);	
			hit_radio.graphics.lineTo(498,96);	
			hit_radio.graphics.lineTo(563,113);	
		//	hit_radio.graphics.lineTo(569,149);	
			hit_radio.graphics.lineTo(543,182);	
			hit_radio.graphics.lineTo(535,273);	
			hit_radio.graphics.lineTo(489,318);	
			hit_radio.graphics.lineTo(457,286);	
			hit_radio.graphics.lineTo(462,194);	
			hit_radio.graphics.lineTo(466,132);			
			
			hit_radio.graphics.endFill(false);
			hit_radio.alpha = 0.0;
			
			hit_radio.graphics.precisionHitTest = true;	
			this.addChild(hit_radio);
		}
		private function CreateKeySlotHit():void{
			hit_keySlot = new Shape();
			hit_keySlot.touchable = false;
			hit_keySlot.graphics.beginFill(0xff0000);
			
			hit_keySlot.graphics.lineTo(391,179);	
			hit_keySlot.graphics.lineTo(438,105);	
			hit_keySlot.graphics.lineTo(470,126);	
			hit_keySlot.graphics.lineTo(462,212);	
					
			hit_keySlot.graphics.endFill(false);
			hit_keySlot.alpha = 0.0;
			
			hit_keySlot.graphics.precisionHitTest = true;	
			this.addChild(hit_keySlot);
		}
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(236,359);	
			hit_book.graphics.lineTo(230,283);	
			hit_book.graphics.lineTo(351,291);	
			hit_book.graphics.lineTo(355,361);	
		
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
		private function CreateKeyCardHit():void{
			hit_keyCard = new Shape();
			hit_keyCard.touchable = false;
			hit_keyCard.graphics.beginFill(0xff0000);
			
			hit_keyCard.graphics.lineTo(570,321);	
			hit_keyCard.graphics.lineTo(598,274);	
			hit_keyCard.graphics.lineTo(670,302);	
			hit_keyCard.graphics.lineTo(641,359);	
			
			hit_keyCard.graphics.endFill(false);
			hit_keyCard.alpha = 0.0;
			
			hit_keyCard.graphics.precisionHitTest = true;	
			this.addChild(hit_keyCard);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if (touches[0].phase == TouchPhase.ENDED) {
					if(Animating === false){
						if(PhoneIsOpen === false){
							trace(touches[0].globalX+" ,"+touches[0].globalY);
							if(targ == goback.SourceImage){
								
							
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((ExteriorRear as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorRearObj,true
								);
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								BookHandler();
							}else if(hit_keySlot.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								KeySlotHandler();
								
							}else if(hit_radio.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(CarOn === true){
									PhoneIsOpen = true;
									OpenPhone(true, 0)
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront;
									}		
									SaveArray['Phone'] = "open";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarFront',SaveArray);
								}else{
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakThree();
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I need to turn the van's battery on to use the radio.");
								}
							}else if(hit_stick.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								StickHandler();
							}else if(hit_wheel.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								WheelHandler();
							}else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The van's driver's side door.");
							}else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FloorHandler();
							}else if(hit_interior.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The cabin interior is made of faux leather and grey plastic.");
								
							}else if(hit_airbags.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Airbags are stored above the glove compartment.");
							
							}else if(GloveBoxOpen === true){
								if(hit_keyCard.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									KeyCardHandler();
								}else if(hit_glovebox.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									BoxHandler();
								}							
							}else if(hit_glovebox.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(KeysAttached === true){
									BoxHandler();
								}else{
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoor();
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The glove box won't open...and there's no key slot.");
								}
							}	
							
						}else{
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();									
								RemovePhone();
								PhoneIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront;
								}		
								SaveArray['Phone'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarFront',SaveArray);
							}else if(hit_openPhone.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Every position on the radio dial is blaring the same repeating tones...");	
							}
						}
					}
				}
			}
		}
	
		private function FloorHandler():void{
		
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();	
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Muddy footprints mark the floor mat.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The mud has a reddish hue and doesn't look to be from the local area...");
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder where this van has been recently...?");	
				}
		
		}
		
		private function WheelHandler():void{
			if(CarOn === false){
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();	
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The steering wheel will not move while the van is parked.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I should turn on the van's battery if I want to see information on the dashboard.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The steering wheel.");	
				}
			}else{
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The dash indicates the van is extremely low on gas.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The van has been driven over 100,000 kilometers...");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The fuel light is on... The van's gas tank is virtually empty.");	
				}
			}
		}
		
		private function StickHandler():void{
			
			if(CarOn === false){
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();	
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The van has a manual transmission...");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A 'stick' shift.'");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I should turn the engine on before attempting to put the van into gear.");	
				}
			}else{
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think I'll leave the van parked here for now.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The van has little gas. Driving it anywhere would not make sense.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'll leave the van here for now.");	
				}
			}
		}
		
		private function OpenPhone(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openPhone = new Sprite();
			openPhone.alpha = 0;
			CreateOpenBookBg();
			openPhonePages = new Image(this.assets.getTexture('morse'));
			openPhonePages.x = 33;
			openPhonePages.y = 30;					
			
			this.openPhone.addChildAt(openBookbg,0);
			this.openPhone.addChildAt(openPhonePages,1);
			//this.openPhone.addChildAt(soundWave,2);
			
			openPhonePages.touchable = false;
			
			this.addChildAt(openPhone,6);
			this.addChildAt(goback,7);
			
			
			if(Fade === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MorseThree();									
			//	(stage.getChildAt(0) as Object).AmbientObj.LoadTVStatic(true,999);
				openPhone.alpha = 1;
			//	soundWave.alpha = 1;
				CreateOpenPhoneHit();
				
				Animating = false;
				(stage.getChildAt(0) as Object).AmbientObj.LoadTVStatic(true,999);
				(stage.getChildAt(0) as Object).AmbientObj.currentAmbient = 'CityHum';
				//	CreateOpenNotePadHit();
			}else{
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('morse_three');
				
				OpenPhoneTween = new Tween(openPhone, 0.5, Transitions.LINEAR);
				OpenPhoneTween.fadeTo(1);
				OpenPhoneTween.onComplete = function():void{
					//		CreateOpenNotePadHit();
					(stage.getChildAt(0) as Object).AmbientObj.LoadTVStatic(true,999);
					(stage.getChildAt(0) as Object).AmbientObj.currentAmbient = 'CityHum';
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MorseThree();	
					CreateOpenPhoneHit();
					
					Animating = false; 
					//FadeInSoundWave();
					
				};
				Starling.juggler.add(OpenPhoneTween);	
				
			}
			//	CreateOpenBookHit(page);
		}
		
	
		//hit_openHeadSet
		
		
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
			hit_openPhone.graphics.lineTo(100,417);	
			
			hit_openPhone.graphics.endFill(false);
			hit_openPhone.alpha = 0.0;
			hit_openPhone.touchable = false;
			hit_openPhone.graphics.precisionHitTest = true;	
		}
		private function RemovePhone():void{
			Animating = true;
			hit_openPhone.graphics.clear();
		//	hit_openHeadSet.graphics.clear();
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
			(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("MorseThree");
			this.removeChild(openPhone);
			openPhone.dispose();
			//(stage.getChildAt(0) as Object).AmbientObj.LoadTVStatic(true,999);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("TVStatic",0,0.5,"stop");
			
			
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
		
		
		private function KeySlotHandler():void{
			if(KeysAttached === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_CarKeys)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CarIgnition();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront;	
					}
					
					KeysAttached = true;
					keys.alpha = 1;
					SaveArray['KeysAttached'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarFront',SaveArray);
					
					(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_CarKeys,
						"item_CarKeys"
						);
						
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The van's ignition...");
				}
			}else{
				if(CarOn === false){
					if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('CarStart') === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CarStart();
					}
				//	(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("TVStatic",0,0.5,null);
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront;	
					}
				//	(stage.getChildAt(0) as Object).AmbientObj.LoadTVStatic(true,999);
				//	(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("TVStatic",0,((stage.getChildAt(0) as Object).AmbientObj.globalVol/2),null);
					
					CarOn = true;
					keys.texture = this.assets.getTexture('keys_on');
					keys.alpha = 1;
					SaveArray['CarOn'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarFront',SaveArray);
					
					Animating = true;
					TurnOnRadio();
					
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CarIgnition();
					(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("CarStart");
					//(stage.getChildAt(0) as Object).AmbientObj.soundManager.stopSound("TVStatic");
					//(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("TVStatic",0,0,null);
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront;	
					}
					
					CarOn = false;
					dash.alpha = 0;
					keys.texture = this.assets.getTexture('keys');
					keys.alpha = 1;
					SaveArray['CarOn'] = 'No';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarFront',SaveArray);
				}
			}
		}
		private function TurnOnRadio():void{
			RadioTween = new Tween(dash, 2.5, Transitions.LINEAR);
			RadioTween.fadeTo(1);
		//	game.SoundFXObj.PlaySFX_CosmicWaffle();
			RadioTween.onComplete = function():void{
				Animating = false;
				RadioTween = null;
				
			}
			Starling.juggler.add(RadioTween);
		}
		
		private function BookHandler():void{
			if(BookPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront;	
				}
				BookPickedUp = true;
				book.alpha = 0;
				SaveArray['Book'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarFront',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_BookClarke,
					'item_BookClarke',
					'inven_bookClarke_sm'
				);
			}
		}
		//BookPickedUp
		private function KeyCardHandler():void{
			if(CardPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront;	
				}
				CardPickedUp = true;
				card.alpha = 0;
				SaveArray['Card'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarFront',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Screwdriver,
					'item_Screwdriver',
					'inven_screwdriver_sm'
				);
			}else{
				BoxHandler();
			}
		}
		
		private function BoxHandler():void{
			if(GloveBoxOpen === false){
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
				gloveBox.alpha = 1;
				GloveBoxOpen = true;
				hit_glovebox.graphics.clear();
				CreateGloveBoxHit(true);
				if(CardPickedUp === false){
					card.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront;	
				}
				SaveArray['GloveBox'] = "Open";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarFront',SaveArray);
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
				card.alpha = 0;
				gloveBox.alpha = 0;
				GloveBoxOpen = false;
				hit_glovebox.graphics.clear();
				CreateGloveBoxHit(false);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarFront;	
				}
				SaveArray['GloveBox'] = "Closed";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCarFront',SaveArray);
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
			
			
			
			this.assets.removeTexture("exteriorCarFront_bg",true);
			this.assets.removeTexture("ExteriorCarFront_Sprite_01",true);
			this.assets.removeTexture("ExteriorCarFront_Sprite_02",true);
			this.assets.removeTextureAtlas("ExteriorCarFront_Sprite_01",true);
			this.assets.removeTextureAtlas("ExteriorCarFront_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("exteriorCarFront_01");
			(stage.getChildAt(0) as Object).falseAsset("exteriorCarFront_02");
			(stage.getChildAt(0) as Object).falseAsset("exteriorCarFront_03");
			(stage.getChildAt(0) as Object).falseAsset("exteriorCarFront_04");
			(stage.getChildAt(0) as Object).falseAsset("exteriorCarFront_05");
			
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
