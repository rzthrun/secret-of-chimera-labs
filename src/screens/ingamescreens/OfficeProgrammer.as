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
	
	public class OfficeProgrammer extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var drawer_upper:Image;
		private var drawer_lower:Image;
		private var box_closed:Image;
		private var cube:Image;
		private var lid_on:Image;
		private var lid_off:Image;
		private var controller:Image;
		private var screen:Image;
		
		private var hit_computer:Shape;
		private var hit_drawer_upper:Shape;
		private var hit_drawer_lower:Shape;
		private var hit_box:Shape;
		private var hit_cube:Shape;
		private var hit_controller:Shape;
		private var hit_lid:Shape;
		
		private var hit_book:Shape;
		
		private var hit_tank:Shape;
		private var hit_chair:Shape;
		private var hit_desktop:Shape;
		
		
		private var openLetter:Sprite;
		private var openLetterPages:Image;
		private var hit_openLetter:Shape;
//		private var hit_openLetter_01:Shape;
//		private var hit_openLetter_paper:Shape;
		private var hit_trash:Shape;
		public var OpenLetterTween:Tween;
		
		private var openBookbg:Shape;
		
		private var LetterIsOpen:Boolean = false;
		
		private var DrawerUpperOpen:Boolean = false;
		private var DrawerLowerOpen:Boolean = false;
		private var DrawerUnlocked:Boolean = false;
	
		private var LidOpen:Boolean = false;
		private var BoxOpen:Boolean = false;
		private var CubePickedUp:Boolean = false;
		private var ControllerAttached:Boolean = false;
		private var Animating:Boolean = false;
		private var ComputerOn:Boolean = false;
		
		public var ScreenTween:Tween;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function OfficeProgrammer(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('officeProgrammer_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeProgrammer/officeProgrammer_bg.jpg'));
				game.TrackAssets('officeProgrammer_01');
			}
			if(game.CheckAsset('officeProgrammer_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeProgrammer/OfficeProgrammer_Sprite_01.png'));
				game.TrackAssets('officeProgrammer_02');
			}
			if(game.CheckAsset('officeProgrammer_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeProgrammer/OfficeProgrammer_Sprite_01.xml'));
				game.TrackAssets('officeProgrammer_03');
			}
			if(game.CheckAsset('officeProgrammer_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeProgrammer/GreekSheet_Sprite_01.png'));
				game.TrackAssets('officeProgrammer_04');
			}
			if(game.CheckAsset('officeProgrammer_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeProgrammer/GreekSheet_Sprite_01.xml'));
				game.TrackAssets('officeProgrammer_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("OfficeProgrammer","OfficeProgrammerObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('officeProgrammer_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
		
			
			drawer_lower = new Image(this.assets.getTexture('drawer_lower'));
			drawer_lower.touchable = false;
			drawer_lower.x = 422;
			drawer_lower.y = 404;			
			
			drawer_upper = new Image(this.assets.getTexture('drawer_upper'));
			drawer_upper.touchable = false;
			drawer_upper.x = 394;
			drawer_upper.y = 274;
						
			cube = new Image(this.assets.getTexture('cube'));
			cube.touchable = false;
			cube.x = 524;
			cube.y = 375;			
			
			box_closed = new Image(this.assets.getTexture('box_closed'));
			box_closed.touchable = false;
			box_closed.x = 463;
			box_closed.y = 345;
					
			lid_off = new Image(this.assets.getTexture('lid_off'));
			lid_off.touchable = false;
			lid_off.x = 413;
			lid_off.y = 119;
						
			controller = new Image(this.assets.getTexture('controller'));
			controller.touchable = false;
			controller.x = 401;
			controller.y = 205;
			
			lid_on = new Image(this.assets.getTexture('lid_on'));
			lid_on.touchable = false;
			lid_on.x = 366;
			lid_on.y = 170;
			
			screen = new Image(this.assets.getTexture('screen_start'));
			screen.touchable = false;
			screen.x = 150;
			screen.y = 56;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['DrawerUnlocked'] == 'Yes'){
					DrawerUnlocked = true;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['Controller'] == 'Attached'){
					ControllerAttached = true;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['Cube'] == 'PickedUp'){
					CubePickedUp = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['Box'] == 'Open'){
					BoxOpen = true;
				}	
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['Lid'] == 'Open'){
					LidOpen = true;
					lid_off.alpha = 1;
					lid_on.alpha = 0;
					if(ControllerAttached === true){
						controller.alpha = 1;
					}else{
						controller.alpha = 0;
					}
				
					CreateControllerHit();
				}else{
					lid_off.alpha = 0;
					lid_on.alpha = 1;
					controller.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['LowerDrawer'] == 'Open'){
					DrawerLowerOpen = true;
					drawer_lower.alpha = 1;
				}else{
					drawer_lower.alpha = 0;
				}
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['UpperDrawer'] == 'Open'){
					CreateBoxHit();
					CreateCubeHit();
					DrawerUpperOpen = true;
					drawer_upper.alpha = 1;
					if(BoxOpen === true){
						box_closed.alpha = 0;
						if(CubePickedUp === true){
							cube.alpha = 0;
						}else{
							cube.alpha = 1;
						}
					}else{
						box_closed.alpha = 1;
						cube.alpha = 0;
					}
				}else{
					drawer_upper.alpha = 0;
					box_closed.alpha = 0;
					cube.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['ComputerOn'] == 'Yes'){
					ComputerOn = true;
					screen.texture = this.assets.getTexture('screen_on');
					screen.alpha = 1;
				}else{
					screen.alpha = 0;
				}
				
			}else{
				lid_off.alpha = 0;
				lid_on.alpha = 1;
				controller.alpha = 0;
				drawer_lower.alpha = 0;
				drawer_upper.alpha = 0;
				box_closed.alpha = 0;
				cube.alpha = 0;
				screen.alpha = 0;
			}
			
	
			this.addChildAt(drawer_lower,1);
			this.addChildAt(drawer_upper,2);
			this.addChildAt(cube,3);
			this.addChildAt(box_closed,4);
			this.addChildAt(lid_off,5);
			this.addChildAt(controller,6);
			this.addChildAt(lid_on,7);
			this.addChildAt(screen,8);
			
			CreateTankHit();
			CreateChairHit();
			CreateDesktopHit();
			
			CreateComputerHit();
			CreateLidHit(LidOpen);			
			CreateDrawerLowerHit(DrawerLowerOpen);
			CreateDrawerUpperHit(DrawerUpperOpen);
			CreateBookHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['Letter'] == 'open'){
					LetterIsOpen = true;
					OpenLetter(false);
					this.addChild(goback);
				}
			}
			
			
			
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
		//	(stage.getChildAt(0) as Object).AmbientObj.LoadBuildingHum(true,999);
		//	(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			
	
		}
		
		private function CreateDesktopHit():void{
			hit_desktop = new Shape();
			hit_desktop.touchable = false;
			hit_desktop.graphics.beginFill(0xff0000);
			
			hit_desktop.graphics.lineTo(331,382);	
			hit_desktop.graphics.lineTo(358,347);	
			hit_desktop.graphics.lineTo(445,369);	
			hit_desktop.graphics.lineTo(434,508);	
			hit_desktop.graphics.lineTo(338,498);	
			
			hit_desktop.graphics.endFill(false);
			hit_desktop.alpha = 0.0;
			
			hit_desktop.graphics.precisionHitTest = true;	
			this.addChild(hit_desktop);
		}
		
		private function CreateChairHit():void{
			hit_chair = new Shape();
			hit_chair.touchable = false;
			hit_chair.graphics.beginFill(0xff0000);
			
			hit_chair.graphics.lineTo(10,207);	
			hit_chair.graphics.lineTo(39,148);	
			hit_chair.graphics.lineTo(128,263);	
			hit_chair.graphics.lineTo(204,258);				
			hit_chair.graphics.lineTo(208,303);				
			hit_chair.graphics.lineTo(257,300);				
			hit_chair.graphics.lineTo(270,386);				
			hit_chair.graphics.lineTo(193,445);				
			hit_chair.graphics.lineTo(98,401);				
			
			hit_chair.graphics.endFill(false);
			hit_chair.alpha = 0.0;
			
			hit_chair.graphics.precisionHitTest = true;	
			this.addChild(hit_chair);
		}
		
		private function CreateTankHit():void{
			hit_tank = new Shape();
			hit_tank.touchable = false;
			hit_tank.graphics.beginFill(0xff0000);
			
			hit_tank.graphics.lineTo(526,85);	
			hit_tank.graphics.lineTo(553,63);	
			hit_tank.graphics.lineTo(771,124);	
			hit_tank.graphics.lineTo(736,262);	
			hit_tank.graphics.lineTo(518,224);	
		
			hit_tank.graphics.endFill(false);
			hit_tank.alpha = 0.0;
			
			hit_tank.graphics.precisionHitTest = true;	
			this.addChild(hit_tank);
		}
		
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(317,19);	
			hit_book.graphics.lineTo(422,17);	
			hit_book.graphics.lineTo(431,108);	
			hit_book.graphics.lineTo(327,111);	
		
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
		private function CreateLidHit(open:Boolean = false):void{
			hit_lid = new Shape();
			
			if(open === false){
				
				hit_lid.x = 0;
				hit_lid.y = 0;
				hit_lid.graphics.beginFill(0x0000FF);
				
				hit_lid.graphics.lineTo(352,218);
				hit_lid.graphics.lineTo(365,178);
				hit_lid.graphics.lineTo(433,154);
				hit_lid.graphics.lineTo(510,188);
				hit_lid.graphics.lineTo(505,225);
				hit_lid.graphics.lineTo(435,263);
			
				hit_lid.graphics.endFill(false);
				
				hit_lid.alpha = 0.0;
				
				hit_lid.graphics.precisionHitTest = true;	
			}else{
				
				hit_lid.x = 0;
				hit_lid.y = 0;
				hit_lid.graphics.beginFill(0x0000FF);	
				
				hit_lid.graphics.lineTo(406,117);
				hit_lid.graphics.lineTo(421,108);
				hit_lid.graphics.lineTo(451,113);
				hit_lid.graphics.lineTo(512,136);
				hit_lid.graphics.lineTo(517,204);
				hit_lid.graphics.lineTo(499,228);
				hit_lid.graphics.lineTo(421,195);
				
				
				hit_lid.graphics.endFill(false);
				hit_lid.alpha = 0.0;
				
				hit_lid.graphics.precisionHitTest = true;				
			}
			hit_lid.touchable = false;
			
			this.addChild(hit_lid);
			
		}	
		
		private function CreateDrawerUpperHit(open:Boolean = false):void{
			hit_drawer_upper = new Shape();
			
			if(open === false){
				
				hit_drawer_upper.x = 0;
				hit_drawer_upper.y = 0;
				hit_drawer_upper.graphics.beginFill(0x0000FF);
				
				hit_drawer_upper.graphics.lineTo(463,270);
				hit_drawer_upper.graphics.lineTo(685,299);
				hit_drawer_upper.graphics.lineTo(703,304);
				hit_drawer_upper.graphics.lineTo(668,455);
				hit_drawer_upper.graphics.lineTo(461,401);
				
				hit_drawer_upper.graphics.endFill(false);
				
				hit_drawer_upper.alpha = 0.0;
				
				hit_drawer_upper.graphics.precisionHitTest = true;	
			}else{
				
				hit_drawer_upper.x = 0;
				hit_drawer_upper.y = 0;
				hit_drawer_upper.graphics.beginFill(0x0000FF);	
				
				hit_drawer_upper.graphics.lineTo(403,393);
				hit_drawer_upper.graphics.lineTo(658,466);
				hit_drawer_upper.graphics.lineTo(646,512);
				hit_drawer_upper.graphics.lineTo(392,512);
				
				hit_drawer_upper.graphics.endFill(false);
				hit_drawer_upper.alpha = 0.0;
				
				hit_drawer_upper.graphics.precisionHitTest = true;				
			}
			hit_drawer_upper.touchable = false;
			this.addChild(hit_drawer_upper);
			
		}		
		
		private function CreateDrawerLowerHit(open:Boolean = false):void{
			hit_drawer_lower = new Shape();
			
			if(open === false){
				
				hit_drawer_lower.x = 0;
				hit_drawer_lower.y = 0;
				hit_drawer_lower.graphics.beginFill(0x0000FF);
				
				hit_drawer_lower.graphics.lineTo(458,408);
				hit_drawer_lower.graphics.lineTo(658,467);
				hit_drawer_lower.graphics.lineTo(655,512);
				hit_drawer_lower.graphics.lineTo(456,512);
				
				hit_drawer_lower.graphics.endFill(false);
				
				hit_drawer_lower.alpha = 0.0;
				
				hit_drawer_lower.graphics.precisionHitTest = true;	
			}else{
				
				hit_drawer_lower.x = 0;
				hit_drawer_lower.y = 0;
				hit_drawer_lower.graphics.beginFill(0x0000FF);	
				
				hit_drawer_lower.graphics.lineTo(422,512);
				hit_drawer_lower.graphics.lineTo(475,412);
				hit_drawer_lower.graphics.lineTo(657,454);
				hit_drawer_lower.graphics.lineTo(649,512);
				
				hit_drawer_lower.graphics.endFill(false);
				hit_drawer_lower.alpha = 0.0;
				
				hit_drawer_lower.graphics.precisionHitTest = true;				
			}
			hit_drawer_lower.touchable = false;
			this.addChild(hit_drawer_lower);
		}		
		//hit_cube
		
		
		private function CreateControllerHit():void{
			hit_controller = new Shape();
			hit_controller.touchable = false;
			hit_controller.graphics.beginFill(0xff0000);
			
			hit_controller.graphics.lineTo(362,218);	
			hit_controller.graphics.lineTo(426,193);	
			hit_controller.graphics.lineTo(498,224);	
			hit_controller.graphics.lineTo(435,257);	
		
			hit_controller.graphics.endFill(false);
			hit_controller.alpha = 0.0;
			
			hit_controller.graphics.precisionHitTest = true;	
			this.addChild(hit_controller);
		}
		
		private function CreateCubeHit():void{
			hit_cube = new Shape();
			hit_cube.touchable = false;
			hit_cube.graphics.beginFill(0xff0000);
			
			hit_cube.graphics.lineTo(511,415);	
			hit_cube.graphics.lineTo(511,399);	
			hit_cube.graphics.lineTo(537,362);	
			hit_cube.graphics.lineTo(609,385);	
			hit_cube.graphics.lineTo(600,428);	
			hit_cube.graphics.lineTo(524,429);	
			
			
			hit_cube.graphics.endFill(false);
			hit_cube.alpha = 0.0;
			
			hit_cube.graphics.precisionHitTest = true;	
			this.addChild(hit_cube);
		}
		
		private function CreateBoxHit():void{
			hit_box = new Shape();
			hit_box.touchable = false;
			hit_box.graphics.beginFill(0xff0000);
			
			hit_box.graphics.lineTo(465,372);	
			hit_box.graphics.lineTo(505,340);	
			hit_box.graphics.lineTo(599,341);	
			hit_box.graphics.lineTo(622,360);	
			hit_box.graphics.lineTo(643,445);	
			hit_box.graphics.lineTo(623,455);	
			hit_box.graphics.lineTo(465,414);	
			
			hit_box.graphics.endFill(false);
			hit_box.alpha = 0.0;
			
			hit_box.graphics.precisionHitTest = true;	
			this.addChild(hit_box);
		}
		
		private function CreateComputerHit():void{
			hit_computer = new Shape();
			hit_computer.touchable = false;
			hit_computer.graphics.beginFill(0xff0000);
			
			hit_computer.graphics.lineTo(135,37);	
			hit_computer.graphics.lineTo(308,40);	
			hit_computer.graphics.lineTo(316,160);	
			hit_computer.graphics.lineTo(284,220);	
			hit_computer.graphics.lineTo(155,206);	
			hit_computer.graphics.lineTo(144,151);	
			
			hit_computer.graphics.endFill(false);
			hit_computer.alpha = 0.0;
			
			hit_computer.graphics.precisionHitTest = true;	
			this.addChild(hit_computer);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
					
						if(LetterIsOpen === false){
						
							if(targ == goback.SourceImage){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((Office as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeObj,true
								);
							}else if(hit_computer.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ComputerHandler();
								//	FadeOut((OfficeSplatComputer as Class), 
							//		(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeSplatComputerObj,true
							//	);
							}else if(hit_drawer_upper.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								UpperDrawerHandler();
							}else if(hit_drawer_lower.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LowerDrawerHandler();
							}else if(hit_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LidHandler();
							}else if(hit_tank.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								TankHandler();	
							}else if(hit_chair.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ChairHandler();	
							}else if(hit_desktop.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A standard desktop computer.");
								
								
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								LetterIsOpen = true;
								OpenLetter(true, 0)
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer;
								}		
								SaveArray['Letter'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeProgrammer',SaveArray);
								
								
							}else if(LidOpen === true){
								if(hit_controller.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									ControllerHandler();
								}else if(DrawerUpperOpen === true){
									if(hit_box.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
										if(BoxOpen === true){
											if(CubePickedUp === false){
												if(hit_cube.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
													CubeHandler();
												}else{
													BoxHandler();
												}
											}else{
												BoxHandler();
											}
										}else{
											BoxHandler();
										}
									}
								}
								
							}else if(DrawerUpperOpen === true){
								if(hit_box.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									if(BoxOpen === true){
										if(CubePickedUp === false){
											if(hit_cube.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
												CubeHandler();
											}else{
												BoxHandler();
											}
										}else{
											BoxHandler();
										}
									}else{
										BoxHandler();
									}
								}
							}
						}else{
							if(targ == goback.SourceImage){
								trace("GoBackClick");
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.HideReadOut();
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								RemoveLetter();
								LetterIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer;
								}		
								SaveArray['Letter'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeProgrammer',SaveArray);
							}
						}
					}
				}
			}
		}
		
		
		/*
		TankHandler
		private var hit_tank:Shape;
		private var hit_chair:Shape;
		private var hit_desktop:Shape;
		
		*/	
				
		private function ChairHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An ergonomic chair.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Looks like a comfortable chair.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Maybe I'll have an opportunity to sit down later.");	
			}
		}
		
		
		private function TankHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The tank contains several species of insect and arachnid.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Err.. I wonder if any of the spiders in that tank are poisonous...");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Despite being different species, the creatures in the tank seem to get along just fine.");	
			}
		}
		
		
		private function OpenLetter(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openLetter = new Sprite();
			openLetter.alpha = 0;
			CreateOpenBookBg();
			openLetterPages = new Image(this.assets.getTexture('greek_sheet_page_00'));
			this.openLetter.addChildAt(openBookbg,0);
			openLetter.addChild(openLetterPages);
			openLetterPages.touchable = false;
			
			this.addChildAt(openLetter,9);
			this.addChildAt(goback,10);
			
			
			if(Fade === false){
				openLetter.alpha = 1;
				CreateOpenLetterHit();
				Animating = false;
				//	CreateOpenNotePadHit();
			}else{
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('greekchart');
				
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
	//		hit_openLetter_01.graphics.clear();
	//		hit_openLetter_paper.graphics.clear();
			
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
			
			hit_openLetter.graphics.lineTo(105,24);	
			hit_openLetter.graphics.lineTo(643,26);	
			hit_openLetter.graphics.lineTo(691,107);	
			hit_openLetter.graphics.lineTo(695,389);	
			hit_openLetter.graphics.lineTo(595,472);	
			hit_openLetter.graphics.lineTo(103,470);	
		
			hit_openLetter.alpha = 0.0;
			hit_openLetter.touchable = false;
			hit_openLetter.graphics.precisionHitTest = true;	
			
			
		
					//hit_openLetter_paper
			
			this.addChild(hit_openLetter);
		
		}
		
		
		private function ComputerHandler():void{
			if(ComputerOn === false){
				TurnComputer();
			}else{
				FadeOut((OfficeSplatComputer as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeSplatComputerObj,true
				);
			}
		}
		
		private function TurnComputer():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BootUp();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer;	
			}
			SaveArray['ComputerOn'] = "Yes";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeProgrammer',SaveArray);
			
			Animating = true;
			ComputerOn = true;
			ScreenTween = new Tween(screen, 2, Transitions.EASE_OUT);
			ScreenTween.fadeTo(1);
			ScreenTween.onComplete = function():void{
				Animating = false;
				CompleteTurnComputer();
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
				
			};
			
			Starling.juggler.add(ScreenTween);
		}
		public function CompleteTurnComputer():void{			
			Animating = false;
			screen.texture = this.assets.getTexture('screen_on');
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();

			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
			
			ScreenTween = null;
			
			
		}
		private function ControllerHandler():void{
			if(ControllerAttached === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Controller)
				{
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer;
					}
					
					SaveArray['Controller'] = 'Attached';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeProgrammer',SaveArray);
					
					controller.alpha = 1;
					
					ControllerAttached = true;
					
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_Controller,
							"item_Controller"
						);
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The device has a rectangular groove in the top with several electrical contacts.");
					
				}
				
			}else{
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer;	
				}
				ControllerAttached = false;
				controller.alpha = 0;
			
				SaveArray['Controller'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeProgrammer',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Controller,
					'item_Controller',
					'inven_controller_sm'
				);
			}
		}
		
		private function CubeHandler():void{
			trace("CUBE HIT");
			if(CubePickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer;	
				}
				CubePickedUp = true;
				cube.alpha = 0;
				SaveArray['Cube'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeProgrammer',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CubeDamage,
					'item_CubeDamage',
					'inven_cubeDamage_sm'
				);
			}else{
				
			}
				
		}
		
		private function LidHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer;
			}					
			if(LidOpen === false){
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxOpen();
				LidOpen = true;
				lid_on.alpha = 0;
				lid_off.alpha = 1;
				if(ControllerAttached === false){
					controller.alpha = 0;
				}else{
					controller.alpha = 1;
				}
				hit_lid.graphics.clear();
				CreateLidHit(true);
				CreateControllerHit();
				SaveArray['Lid'] = "Open";
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxClose();
				LidOpen = false;
				lid_on.alpha = 1;
				lid_off.alpha = 0;
				controller.alpha = 0;
				hit_lid.graphics.clear();
				hit_controller.graphics.clear();
				CreateLidHit(false);
				SaveArray['Lid'] = "Closed";
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeProgrammer',SaveArray);
			
		}
		
		private function BoxHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer;
			}	
			if(BoxOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				BoxOpen = true;
				box_closed.alpha = 0;
				if(CubePickedUp === false){
					cube.alpha = 1;
				}else{
					cube.alpha = 0;
				}
				SaveArray['Box'] = "Open";
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				BoxOpen = false;
				box_closed.alpha = 1;
				cube.alpha = 0;
				SaveArray['Box'] = "Closed";
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeProgrammer',SaveArray);
		}
		
		private function LowerDrawerHandler():void{
			
			if(DrawerUnlocked === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_SmallKey)
				{
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_UnlockTwo();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_SmallKey,
							"item_SmallKey"
						);
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer;
					}
					DrawerLowerOpen = true;
					drawer_lower.alpha = 1;
					hit_drawer_lower.graphics.clear();
					CreateDrawerLowerHit(true);
					SaveArray['LowerDrawer'] = "Open";
					SaveArray['DrawerUnlocked'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeProgrammer',SaveArray);
	
					DrawerUnlocked = true;
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoor();
										
					if(RONum == 0){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The drawers are locked.");

					}else if(RONum == 1){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a hole for a small key on the upper right corner.");					
					}else if(RONum == 1){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The drawers are made of painted steel.");	
					}
					
				}
			}else{			
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer;
				}
				if(DrawerLowerOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
					DrawerLowerOpen = true;
					drawer_lower.alpha = 1;
					hit_drawer_lower.graphics.clear();
					CreateDrawerLowerHit(true);
					SaveArray['LowerDrawer'] = "Open";
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
					DrawerLowerOpen = false;
					drawer_lower.alpha = 0;
					hit_drawer_lower.graphics.clear();
					CreateDrawerLowerHit(false);
					SaveArray['LowerDrawer'] = "Closed";
				}
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeProgrammer',SaveArray);
			}
		}
		
		private function UpperDrawerHandler():void{
			
			if(DrawerUnlocked === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_SmallKey)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer;
					}
					DrawerUpperOpen = true;
					drawer_upper.alpha = 1;
					hit_drawer_upper.graphics.clear();
					CreateDrawerUpperHit(true);
					SaveArray['UpperDrawer'] = "Open";
					SaveArray['DrawerUnlocked'] = 'Yes';
					CreateBoxHit();
					CreateCubeHit();
					
					box_closed.alpha = 1;
					cube.alpha = 0;
				
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeProgrammer',SaveArray);
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_SmallKey,
							"item_SmallKey"
						);
					DrawerUnlocked = true;
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoor();
					
					if(RONum == 0){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The drawers are locked.");
						RONum = 1;
					}else if(RONum == 1){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a hole for a small key on the upper right corner.");					
						RONum = 2;
					}else if(RONum == 2){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The drawers are made of painted steel.");	
						RONum = 0;
					}
				}
			}else{
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer;
				}
				if(DrawerUpperOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
					
					DrawerUpperOpen = true;
					drawer_upper.alpha = 1;
					hit_drawer_upper.graphics.clear();
					CreateDrawerUpperHit(true);
					CreateBoxHit();
					CreateCubeHit();
					if(BoxOpen === false){
						box_closed.alpha = 1;
						cube.alpha = 0;
					}else{
						box_closed.alpha = 0;
						if(CubePickedUp === false){
							cube.alpha = 1;
						}else{
							cube.alpha = 0;
						}
					}
					SaveArray['UpperDrawer'] = "Open";
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
					
					DrawerUpperOpen = false;
					drawer_upper.alpha = 0;
					box_closed.alpha = 0;
					cube.alpha = 0;
					hit_drawer_upper.graphics.clear();
					hit_box.graphics.clear();
					hit_cube.graphics.clear();
					CreateDrawerUpperHit(false);
					SaveArray['UpperDrawer'] = "Closed";
				}
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeProgrammer',SaveArray);
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
			
			
			
			this.assets.removeTexture("officeProgrammer_bg",true);
			this.assets.removeTexture("OfficeProgrammer_Sprite_01",true);
			this.assets.removeTextureAtlas("OfficeProgrammer_Sprite_01",true);
			this.assets.removeTexture("GreekSheet_Sprite_01",true);
			this.assets.removeTextureAtlas("GreekSheet_Sprite_01",true);
			
			//GreekSheet_Sprite_01
			(stage.getChildAt(0) as Object).falseAsset("officeProgrammer_01");
			(stage.getChildAt(0) as Object).falseAsset("officeProgrammer_02");
			(stage.getChildAt(0) as Object).falseAsset("officeProgrammer_03");
			(stage.getChildAt(0) as Object).falseAsset("officeProgrammer_04");
			(stage.getChildAt(0) as Object).falseAsset("officeProgrammer_05");
			
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


