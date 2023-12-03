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
	
	public class GreenHouseTable extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		private var blueTube:Image;
		private var redTube:Image;
		private var yellowTube:Image;
		private var jar:Image;
		private var syringe:Image;
		private var syringeFull:Image;
		private var tongs:Image;
		private var slide:Image;
		private var emptyTubes:Image;
		
		private var hit_microscope:Shape;
	//	private var hit_microscope_stand:Shape;
		private var hit_tube:Shape;
		private var hit_jar:Shape;
		private var hit_syringe:Shape;
		private var hit_tongs:Shape;
		
		private var hit_machine:Shape;
		
		private var hit_book:Shape;
		//	private var hit_elevator_door:Shape;
		private var openBookbg:Shape;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookcurrentPage:Number = 0;		
		private var hit_OpenBook:Shape;
		public var OpenBookTween:Tween;
		private var BookIsOpen:Boolean = false;
		
		
		private var FillSyringeTween00:Tween;
		private var FillSyringeTween01:Tween;
		
		private var JarPickedUp:Boolean = false;
		private var TongsPickedUp:Boolean = false;
		private var SyringeAttached:Boolean = false;
		private var SyringeFull:Boolean = false;
		private var BlueTubeAttached:Boolean = false;
		private var RedTubeAttached:Boolean = false;
		private var SlideAttached:Boolean = false;
		private var Animating:Boolean = false;
		
		private var RONum:int = 0;		
		
		private var MicroscopeSolved:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function GreenHouseTable(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('greenHouseTable_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseTable/greenHouseTable_bg.jpg'));
				game.TrackAssets('greenHouseTable_01');
			}
			if(game.CheckAsset('greenHouseTable_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseTable/GreenHouseTable_Sprite_01.png'));
				game.TrackAssets('greenHouseTable_02');
			}
			if(game.CheckAsset('greenHouseTable_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseTable/GreenHouseTable_Sprite_01.xml'));
				game.TrackAssets('greenHouseTable_03');
			}
			
			if(game.CheckAsset('greenHouseTable_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseTable/ViridiBook_Sprite_01.png'));
				game.TrackAssets('greenHouseTable_04');
			}
			if(game.CheckAsset('greenHouseTable_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseTable/ViridiBook_Sprite_01.xml'));
				game.TrackAssets('greenHouseTable_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GreenHouseTable","GreenHouseTableObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		/*
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;
			}		
			SaveArray['SyringeFull'] = "No";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
		*/	
			
		/*	(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_SyringeFull,
			'item_SyringeFull',
			'inven_syringeFull_sm'
			);
		*/	
			
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseMicroscope',SaveArray);
			bg = new Image(this.assets.getTexture('greenHouseTable_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			emptyTubes = new Image(this.assets.getTexture('empty_tubes'));
			emptyTubes.touchable = false;
			emptyTubes.x = 332;
			emptyTubes.y = 83;
			
			redTube = new Image(this.assets.getTexture('blue_red'));
			redTube.touchable = false;
			redTube.x = 393;
			redTube.y = 89;
			
			blueTube = new Image(this.assets.getTexture('blue_tube'));
			blueTube.touchable = false;
			blueTube.x = 332;
			blueTube.y = 93;
						
			yellowTube = new Image(this.assets.getTexture('yellow_tube'));
			yellowTube.touchable = false;
			yellowTube.x = 451;
			yellowTube.y = 86;
			
			jar = new Image(this.assets.getTexture('jars'));
			jar.touchable = false;
			jar.x = 38;
			jar.y = 258;
			
			syringe = new Image(this.assets.getTexture('syringe'));
			syringe.touchable = false;
			syringe.x = 588;
			syringe.y = 130;
			
			syringeFull = new Image(this.assets.getTexture('syringe_full'));
			syringeFull.touchable = false;
			syringeFull.x = 588;
			syringeFull.y = 130;
			
			
			tongs = new Image(this.assets.getTexture('tongs'));
			tongs.touchable = false;
			tongs.x = 166;
			tongs.y = 138;
			
			slide = new Image(this.assets.getTexture('slide'));
			slide.touchable = false;
			slide.x = 445;
			slide.y = 251;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['Solved'] == 'Yes'){
					MicroscopeSolved = true;
					slide.texture = this.assets.getTexture('slide_empty');
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['SyringeFull'] == 'Yes'){
					SyringeFull = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['BlueTube'] == 'Attached'){
					BlueTubeAttached = true;
					if(SyringeFull === false){
						blueTube.alpha = 1;
					}else{
						blueTube.alpha = 0;
					}
					
				}else{
					blueTube.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['RedTube'] == 'Attached'){
					
					RedTubeAttached = true;
					if(SyringeFull === false){
						redTube.alpha = 1;
					}else{
						redTube.alpha = 0;
					}
				}else{
					redTube.alpha = 0;
				}
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['Slide'] == 'Attached'){
					SlideAttached = true;
					slide.alpha = 1;
				}else{
					slide.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['Tongs'] == 'PickedUp'){
					TongsPickedUp = true;
					tongs.alpha = 0;
				}else{
					tongs.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['Syringe'] == 'Attached'){
					SyringeAttached = true;
					if(MicroscopeSolved === true){
						if(SyringeFull === false){
							SyringeFull = true;
							Animating = true;
							emptyTubes.alpha = 1;
							syringe.alpha = 1;
							syringeFull.alpha = 0;
						
							yellowTube.alpha =1;
							redTube.alpha = 1;
							blueTube.alpha = 1;
							
							
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){
								SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;
							}		
							SaveArray['SyringeFull'] = "Yes";
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Machine();	
							Starling.juggler.delayCall(function():void{
								FillSyringe00();
							},1.5);
						}else{
							syringe.alpha = 0;
							syringeFull.alpha = 1;
							yellowTube.alpha = 0;
							redTube.alpha = 0;
							blueTube.alpha = 0;
							emptyTubes.alpha = 1;
						}
					}else{
						syringe.alpha = 1;
						syringeFull.alpha = 0;
						emptyTubes.alpha = 0;
					}
					//PickedUp
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['Syringe'] == 'PickedUp'){	
			//		SyringePickedUp = true;
					syringe.alpha = 0;
					syringeFull.alpha = 0;
					yellowTube.alpha = 0;
					redTube.alpha = 0;
					blueTube.alpha = 0;
					emptyTubes.alpha = 1;
				}else{
					syringe.alpha = 0;
					syringeFull.alpha = 0;
					emptyTubes.alpha = 0;
				}
			
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['Jar'] == 'PickedUp'){
					JarPickedUp = true;
					jar.alpha = 0;
				}else{
					jar.alpha = 1;
				}
			
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadXFiles(true,3);
							
						},0.5);
					}
				}
				
			}else{
				yellowTube.alpha = 1;
				redTube.alpha = 0;
				blueTube.alpha = 0;
				jar.alpha = 1;
				syringe.alpha = 0;
				tongs.alpha = 1;
				slide.alpha = 0;
				syringeFull.alpha = 0;
				emptyTubes.alpha = 0;
				
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					//SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadXFiles(true,3);
						
					},0.5);
				}
				
			}
			
			
			
			
			this.addChildAt(emptyTubes,1);
			this.addChildAt(redTube,2);
			this.addChildAt(blueTube,3);
			this.addChildAt(yellowTube,4);
			this.addChildAt(jar,5);
			this.addChildAt(syringe,6);
			this.addChildAt(syringeFull,7);
			this.addChildAt(tongs,8);
			this.addChildAt(slide,9);
			
			CreateMachineHit();
			CreateSyringeHit();
			CreateTongHit();
			CreateJarHit();
			CreateTubeHit();
		//	CreateMicroscopeStandHit();
			CreateMicroscopeHit();
			CreateBookHit();
			
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable["Book"] == "open"){
					trace("Book is Open");
					BookIsOpen = true;
					//	OpenBook();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable["BookCurrentPage"] == 0){
						openBookcurrentPage = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable["BookCurrentPage"] == 1){
						openBookcurrentPage = 1;
					}else{
						openBookcurrentPage = 0;
					}
					OpenBook();
					this.addChild(goback);
				}
			}else{
				
			}
		
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadHorrorBreath(true,4);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Drone",0,0.5,'stop');
			Starling.juggler.delayCall(function():void{
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadSlipperyPlants(true,999);
				
				
			},0.5);
		
		}
		//	private var FillSyringeTween00:Tween;
		//	private var FillSyringeTween01:Tween;
		private function FillSyringe00():void{
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirDecompress();
			FillSyringeTween00 = new Tween(yellowTube, 1.5, Transitions.LINEAR);
			FillSyringeTween00.fadeTo(0);
			FillSyringeTween00.onComplete = function():void{
			
				FillSyringe01();
				FillSyringeTween00 = null;
				
			};
			
			Starling.juggler.add(FillSyringeTween00);	
		}
		private function FillSyringe01():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirDecompress();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();	
			FillSyringeTween01 = new Tween(redTube, 1.5, Transitions.LINEAR);
			FillSyringeTween01.fadeTo(0);
			FillSyringeTween01.onComplete = function():void{
				
				FillSyringe02();
				FillSyringeTween01 = null;
				
			};
			
			Starling.juggler.add(FillSyringeTween01);	
		}
		
		private function FillSyringe02():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirDecompress();
			FillSyringeTween00 = new Tween(blueTube, 1.5, Transitions.LINEAR);
			FillSyringeTween00.fadeTo(0);
			FillSyringeTween00.onComplete = function():void{
				
				FillSyringe03();
				FillSyringeTween00 = null;
				
			};
			
			Starling.juggler.add(FillSyringeTween00);	
		}
		private function FillSyringe03():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OhmTwo();
		
			FillSyringeTween01 = new Tween(syringeFull, 1.5, Transitions.LINEAR);
			FillSyringeTween01.fadeTo(1);
			FillSyringeTween01.onComplete = function():void{
				
				Animating = false;
				FillSyringeTween01 = null;
				
			};
			
			Starling.juggler.add(FillSyringeTween01);	
		}
		
		//hit_machine
		private function CreateMachineHit():void{
			hit_machine = new Shape();
			hit_machine.touchable = false;
			hit_machine.graphics.beginFill(0xff0000);
			
			hit_machine.graphics.lineTo(254,292);	
			hit_machine.graphics.lineTo(243,103);	
			hit_machine.graphics.lineTo(303,16);	
			hit_machine.graphics.lineTo(528,0);	
			hit_machine.graphics.lineTo(693,106);	
			hit_machine.graphics.lineTo(726,325);	
			hit_machine.graphics.lineTo(435,388);	
			hit_machine.graphics.lineTo(375,327);	
			hit_machine.graphics.lineTo(288,337);	
			
			hit_machine.graphics.endFill(false);
			hit_machine.alpha = 0.0;
			
			hit_machine.graphics.precisionHitTest = true;	
			this.addChild(hit_machine);
		}
		
		private function CreateSyringeHit():void{
			hit_syringe = new Shape();
			hit_syringe.touchable = false;
			hit_syringe.graphics.beginFill(0xff0000);
			
			hit_syringe.graphics.lineTo(560,134);	
			hit_syringe.graphics.lineTo(602,98);	
			hit_syringe.graphics.lineTo(633,98);	
			hit_syringe.graphics.lineTo(658,144);	
			hit_syringe.graphics.lineTo(724,273);	
			hit_syringe.graphics.lineTo(622,297);	
			
			hit_syringe.graphics.endFill(false);
			hit_syringe.alpha = 0.0;
			
			hit_syringe.graphics.precisionHitTest = true;	
			this.addChild(hit_syringe);
		}
		
		private function CreateTongHit():void{
			hit_tongs = new Shape();
			hit_tongs.touchable = false;
			hit_tongs.graphics.beginFill(0xff0000);
			
			hit_tongs.graphics.lineTo(154,307);	
			hit_tongs.graphics.lineTo(208,161);	
			hit_tongs.graphics.lineTo(236,122);	
			hit_tongs.graphics.lineTo(283,142);	
			hit_tongs.graphics.lineTo(278,197);	
			hit_tongs.graphics.lineTo(236,330);	
			hit_tongs.graphics.lineTo(198,349);	
			hit_tongs.graphics.lineTo(166,330);	
			
			hit_tongs.graphics.endFill(false);
			hit_tongs.alpha = 0.0;
			
			hit_tongs.graphics.precisionHitTest = true;	
			this.addChild(hit_tongs);
		}
		
		private function CreateJarHit():void{
			hit_jar = new Shape();
			hit_jar.touchable = false;
			hit_jar.graphics.beginFill(0xff0000);
			
			hit_jar.graphics.lineTo(25,273);	
			hit_jar.graphics.lineTo(33,246);	
			hit_jar.graphics.lineTo(99,234);	
			hit_jar.graphics.lineTo(124,249);	
			hit_jar.graphics.lineTo(136,334);	
			hit_jar.graphics.lineTo(126,358);	
			hit_jar.graphics.lineTo(74,372);	
			hit_jar.graphics.lineTo(46,362);	
			
			hit_jar.graphics.endFill(false);
			hit_jar.alpha = 0.0;
			
			hit_jar.graphics.precisionHitTest = true;	
			this.addChild(hit_jar);
		}
		
		private function CreateTubeHit():void{
			hit_tube = new Shape();
			hit_tube.touchable = false;
			hit_tube.graphics.beginFill(0xff0000);
			
			hit_tube.graphics.lineTo(318,68);	
			hit_tube.graphics.lineTo(495,58);	
			hit_tube.graphics.lineTo(492,115);	
			hit_tube.graphics.lineTo(438,166);	
			hit_tube.graphics.lineTo(310,175);	
		
			hit_tube.graphics.endFill(false);
			hit_tube.alpha = 0.0;
			
			hit_tube.graphics.precisionHitTest = true;	
			this.addChild(hit_tube);
		}
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(95,435);	
			hit_book.graphics.lineTo(109,402);	
			hit_book.graphics.lineTo(243,341);	
			hit_book.graphics.lineTo(300,364);	
			hit_book.graphics.lineTo(381,368);	
			hit_book.graphics.lineTo(370,456);	
			hit_book.graphics.lineTo(233,454);	
			hit_book.graphics.lineTo(173,487);	
			
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
		private function CreateMicroscopeHit():void{
			hit_microscope = new Shape();
			hit_microscope.touchable = false;
			hit_microscope.graphics.beginFill(0xff0000);
			
			hit_microscope.graphics.lineTo(415,252);	
			hit_microscope.graphics.lineTo(420,176);	
			hit_microscope.graphics.lineTo(504,83);	
			hit_microscope.graphics.lineTo(540,89);	
			hit_microscope.graphics.lineTo(547,115);	
			hit_microscope.graphics.lineTo(537,291);	
			hit_microscope.graphics.lineTo(482,324);	
			hit_microscope.graphics.lineTo(431,309);	
		
			hit_microscope.graphics.endFill(false);
			hit_microscope.alpha = 0.0;
			
			hit_microscope.graphics.precisionHitTest = true;	
			this.addChild(hit_microscope);
		}
		private function CreateOpenBookHit():void{
			hit_OpenBook = new Shape();
			hit_OpenBook.touchable = false;
			hit_OpenBook.graphics.beginFill(0xff0000);
			
			hit_OpenBook.graphics.lineTo(95,29);	
			hit_OpenBook.graphics.lineTo(647,29);	
			hit_OpenBook.graphics.lineTo(701,107);	
			hit_OpenBook.graphics.lineTo(701,395);	
			hit_OpenBook.graphics.lineTo(598,455);	
			hit_OpenBook.graphics.lineTo(98,455);	
			
			
			hit_OpenBook.graphics.endFill(false);
			hit_OpenBook.alpha = 0.0;
			
			hit_OpenBook.graphics.precisionHitTest = true;	
			this.addChild(hit_OpenBook);
		}
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(BookIsOpen === false){
							
							if(targ == goback.SourceImage){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((GreenHouse as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseObj,true
								);
							}else if(hit_microscope.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(MicroscopeSolved === false){
									if(SlideAttached === false){
										SlideHandler();
									}else{
										FadeOut((GreenHouseMicroscope as Class), 
											(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseMicroscopeObj,false
										);
									}
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I believe I'm done with this microscope and machine.");
									
								}
								
							}else if(hit_jar.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								JarHandler();
							}else if(hit_syringe.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SyringeHandler();
							}else if(hit_tongs.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								TongsHandler();
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								BookIsOpen = true;
								OpenBook(true, 0);
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;
								}		
								SaveArray['Book'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
								
							}else if(hit_tube.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								TubeHandler();
							}else if(hit_machine.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The machine has an unusual design... I wonder what it is called...");
							}
						}else{
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								trace("GoBackClick");
								RemoveBook();
								BookIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;
								}		
								SaveArray['Book'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
							}else if(hit_OpenBook.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;
								}
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
									openBookPages.texture = this.assets.getTexture('viridi_page_01');
								}else if(openBookcurrentPage == 1){
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
									openBookPages.texture = this.assets.getTexture('viridi_page_00');
								}
								
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
								
							}
						}
					}
				}
			}
		}
	
		private function EmptyMicroscopeHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't see anything under the microscope.");				
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("On the bed of the microscope is an area where slides are placed.");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Until I put something under the lens of the microscope, I won't see anything through the viewfinder.");
				
			}
		}
		
		private function SlideHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Slide)
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				SlideAttached = true;
				slide.alpha = 1;
								
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;	
				}
				
				SaveArray['Slide'] = "Attached";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_Slide,
						"item_Slide"
					);
				
			}else{
				EmptyMicroscopeHandler();
			}
			
		}
		
		private function TubeHandler():void{
			
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_TubeBlue)
			{
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;	
				}
				
				SaveArray['BlueTube'] = "Attached";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
				
				BlueTubeAttached = true;
				blueTube.alpha = 1;
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_TubeBlue,
						"item_TubeBlue"
					);
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_TubeRed)
			{
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;	
				}
				
				SaveArray['RedTube'] = "Attached";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
				
				RedTubeAttached = true;
				redTube.alpha = 1;
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_TubeRed,
						"item_TubeRed"
					);
			}else{
				if(RedTubeAttached === false && BlueTubeAttached === false){
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a glass tube with a yellow fluid connected to the machine.");				
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are spaces for two more tubes to be inserted.");				
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a glass tube with a yellow fluid connected to the machine.");		
						
					}
					
				}else if(RedTubeAttached === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is still space for another tube.");	
				}else if(BlueTubeAttached === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is still space for another tube.");	
				}else if(MicroscopeSolved === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The three tubes wait to receive the proper instructions from the machine.");				
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The tubes have drained and are now empty.");				
				}
			
			}
			
		}
	
		private function JarHandler():void{
			if(JarPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;	
				}
				JarPickedUp = true;
				jar.alpha = 0;
				SaveArray['Jar'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Jar,
					'item_Jar',
					'inven_jar_sm'
				);
			}
		}
		
		private function TongsHandler():void{
			if(TongsPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;	
				}
				TongsPickedUp = true;
				tongs.alpha = 0;
				SaveArray['Tongs'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_LabTongs,
					'item_LabTongs',
					'inven_labTongs_sm'
				);
			}
		}
		
		private function SyringeHandler():void{
			if(SyringeAttached === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Syringe)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					SyringeAttached = true;
					syringe.alpha = 1;
					syringeFull.alpha = 0;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;	
					}				
					SaveArray['Syringe'] = "Attached";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_Syringe,
							"item_Syringe"
						);
					
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There's some type of stand located on the machine.");
				}
			}else{
				if(SyringeFull === false){
					SyringeAttached = false;
					syringe.alpha = 0;
					syringeFull.alpha = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Syringe,
						'item_Syringe',
						'inven_syringe_sm'
					);
					
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;	
					}				
					SaveArray['Syringe'] = "PickedUp";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
					
				}else{
					
					SyringeAttached = false;
					syringe.alpha = 0;
					syringeFull.alpha = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_SyringeFull,
						'item_SyringeFull',
						'inven_syringeFull_sm'
					);
					
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;	
					}				
					SaveArray['Syringe'] = "PickedUp";
					SaveArray['SyringeFull'] = "PickedUp";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
				}
			}
		}
		
	/*	private function SampleHandler():void{
			if(SamplePickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable;	
				}
				SamplePickedUp = true;
				sample.alpha = 0;
				SaveArray['Sample'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseTable',SaveArray);
								
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_SamplePipette,
					'item_SamplePipette',
					'inven_samplePipette_sm'
				);
			}
		}
	*/	
		private function OpenBook(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openBook = new Sprite();
			openBook.alpha = 0;
			CreateOpenBookBg();
			openBookPages = new Image(this.assets.getTexture('viridi_page_00'));
			this.openBook.addChildAt(openBookbg,0);
			openBook.addChild(openBookPages);
			openBookPages.touchable = false;
			
			
			this.addChild(openBook);
			this.addChild(goback);
			
			if(openBookcurrentPage == 0){
				openBookPages.texture = this.assets.getTexture('viridi_page_00');
			}else if(openBookcurrentPage == 1){
				openBookPages.texture = this.assets.getTexture('viridi_page_01');
			}
			
			CreateOpenBookHit();
			//CreateOpenBookHit(openBookcurrentPage);
			
			if(Fade === false){
				Animating = false;
				openBook.alpha = 1;
				//	CreateOpenBookHit();
			}else{
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('hex_notes');
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
			
			
			
			this.assets.removeTexture("greenHouseTable_bg",true);
			this.assets.removeTexture("GreenHouseTable_Sprite_01",true);
			this.assets.removeTexture("ViridiBook_Sprite_01",true);			
			this.assets.removeTextureAtlas("GreenHouseTable_Sprite_01",true);
			this.assets.removeTextureAtlas("ViridiBook_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("greenHouseTable_01");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseTable_02");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseTable_03");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseTable_04");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseTable_05");
			
			// stage.getChildAt(0) as Object).falseAsset("coastSurf_02");
			
			if(blackOut === true){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.BlackOutRectangleFade(0,0.5);
			}
			(stage.getChildAt(0) as Object).screenGamePlayHandler.
				UnloadScene(
					
				);			
			
			this.dispose();
			
		}
	}
}
