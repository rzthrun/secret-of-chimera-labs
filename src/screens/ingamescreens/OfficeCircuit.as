package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.DelayedCall;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;
	
	
	public class OfficeCircuit extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		//	private var hit_elevator_door:Shape;
		private var spiderlegs_mc:MovieClip;
		private var spider:Image;
		private var controller:Image;
		private var lid:Image;
		private var fuse:Image;
		private var glass:Image;
		private var screwdriver:Image;
		
		private var hit_lid:Shape;
		private var hit_fuse:Shape;
		private var hit_screwdriver:Shape;
		private var hit_glass:Shape;
		private var hit_spider:Shape;
		
		private var hit_splat_00:Shape;
		private var hit_splat_01:Shape;
		private var hit_togu:Shape;
		private var hit_newspaper:Shape;
		private var hit_try:Shape;
		
		private var LidIsOpen:Boolean = false;
		private var FusePickedUp:Boolean = false;
		private var ScrewdriverPickedUp:Boolean = false;
		private var ControllerAttached:Boolean = false;
		private var SpiderPickedUp:Boolean = false;
		private var SpiderWorking:Boolean = false;
		
		private var RONum:int = 0;
		
		private var Animating:Boolean = false;
		
		public var delayedCall:DelayedCall;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function OfficeCircuit(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('officeCircuit_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeCircuit/officeCircuit_bg.jpg'));
				game.TrackAssets('officeCircuit_01');
			}
			if(game.CheckAsset('officeCircuit_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeCircuit/OfficeCircuit_Sprite_01.png'));
				game.TrackAssets('officeCircuit_02');
			}
			if(game.CheckAsset('officeCircuit_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeCircuit/OfficeCircuit_Sprite_01.xml'));
				game.TrackAssets('officeCircuit_03');
			}
			if(game.CheckAsset('officeCircuit_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeCircuit/OfficeCircuit_Sprite_02.png'));
				game.TrackAssets('officeCircuit_04');
			}
			if(game.CheckAsset('officeCircuit_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeCircuit/OfficeCircuit_Sprite_02.xml'));
				game.TrackAssets('officeCircuit_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("OfficeCircuit","OfficeCircuitObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('officeCircuit_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			spider = new Image(this.assets.getTexture('spider_body'));
			//spider.smoothing = TextureSmoothing.NONE;
			spider.touchable = false;
			spider.x = 506;
			spider.y = 272;
			
			spiderlegs_mc = new MovieClip(this.assets.getTextures('spider_legs_frame_00'),8);
			spiderlegs_mc.addFrameAt(1,this.assets.getTexture("spider_legs_frame_01"), null, 0.125);
			spiderlegs_mc.addFrameAt(2,this.assets.getTexture("spider_legs_frame_02"), null, 0.125);
			spiderlegs_mc.addFrameAt(3,this.assets.getTexture("spider_legs_frame_01"), null, 0.125);
			spiderlegs_mc.addFrameAt(4,this.assets.getTexture("spider_legs_frame_00"), null, 0.125);
			spiderlegs_mc.addFrameAt(5,this.assets.getTexture("spider_legs_frame_01"), null, 0.125);
			spiderlegs_mc.addFrameAt(6,this.assets.getTexture("spider_legs_frame_02"), null, 0.125);
			spiderlegs_mc.addFrameAt(7,this.assets.getTexture("spider_legs_frame_02"), null, 0.125);
			spiderlegs_mc.addFrameAt(8,this.assets.getTexture("spider_legs_frame_02"), null, 0.125);
			spiderlegs_mc.addFrameAt(9,this.assets.getTexture("spider_legs_frame_01"), null, 0.125);
			spiderlegs_mc.addFrameAt(10,this.assets.getTexture("spider_legs_frame_00"), null, 0.125);
			spiderlegs_mc.addFrameAt(11,this.assets.getTexture("spider_legs_frame_00"), null, 0.125);
			spiderlegs_mc.addFrameAt(12,this.assets.getTexture("spider_legs_frame_00"), null, 0.125);
			spiderlegs_mc.addFrameAt(13,this.assets.getTexture("spider_legs_frame_00"), null, 0.125);
			spiderlegs_mc.addFrameAt(14,this.assets.getTexture("spider_legs_frame_03"), null, 0.125);
			spiderlegs_mc.addFrameAt(15,this.assets.getTexture("spider_legs_frame_04"), null, 0.125);
			spiderlegs_mc.addFrameAt(16,this.assets.getTexture("spider_legs_frame_03"), null, 0.125);
			spiderlegs_mc.addFrameAt(17,this.assets.getTexture("spider_legs_frame_00"), null, 0.125);
			spiderlegs_mc.addFrameAt(18,this.assets.getTexture("spider_legs_frame_03"), null, 0.125);
			spiderlegs_mc.addFrameAt(19,this.assets.getTexture("spider_legs_frame_04"), null, 0.125);
			spiderlegs_mc.addFrameAt(20,this.assets.getTexture("spider_legs_frame_04"), null, 0.125);
			spiderlegs_mc.addFrameAt(21,this.assets.getTexture("spider_legs_frame_04"), null, 0.125);
			spiderlegs_mc.addFrameAt(22,this.assets.getTexture("spider_legs_frame_03"), null, 0.125);
			spiderlegs_mc.addFrameAt(23,this.assets.getTexture("spider_legs_frame_00"), null, 0.125);
			spiderlegs_mc.addFrameAt(24,this.assets.getTexture("spider_legs_frame_00"), null, 0.125);
			spiderlegs_mc.addFrameAt(25,this.assets.getTexture("spider_legs_frame_00"), null, 0.125);
			//	elevator_mc.smoothing = TextureSmoothing.NONE;
			spiderlegs_mc.x = 491;
			spiderlegs_mc.y = 216;
			spiderlegs_mc.touchable = false;
			spiderlegs_mc.loop = true; 
			spiderlegs_mc.stop(); 
			//	CreateElevatorDoorHit();
			
			controller = new Image(this.assets.getTexture('microcontroller'));
			//spider.smoothing = TextureSmoothing.NONE;
			controller.touchable = false;
			controller.x = 520;
			controller.y = 308;
			
			lid = new Image(this.assets.getTexture('toolbox_lid'));
			//spider.smoothing = TextureSmoothing.NONE;
			lid.touchable = false;
			lid.x = 0;
			lid.y = 100;
			
			fuse = new Image(this.assets.getTexture('fuse'));
			//spider.smoothing = TextureSmoothing.NONE;
			fuse.touchable = false;
			fuse.x = 193;
			fuse.y = 194;
			
			glass = new Image(this.assets.getTexture('glass_spider'));
			//spider.smoothing = TextureSmoothing.NONE;
			glass.touchable = false;
			glass.x = 324;
			glass.y = 125;
			
			screwdriver = new Image(this.assets.getTexture('keys'));
			//spider.smoothing = TextureSmoothing.NONE;
			screwdriver.touchable = false;
			screwdriver.x = 189;
			screwdriver.y = 350;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Controller'] == 'Attached'){	
					ControllerAttached = true;
					
					glass.texture = this.assets.getTexture('glass_spider_controller');
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire != undefined){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire['Solved'] === 'Yes'){
							SpiderWorking = true;
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Spider'] == 'PickedUp'){	
								SpiderPickedUp = true;
								controller.alpha = 0;	
								spider.alpha = 0;
								spiderlegs_mc.alpha = 0;
								glass.alpha = 0;
							}else{
								controller.alpha = 1;	
								spider.alpha = 1;
								spiderlegs_mc.alpha = 1;
								
								glass.alpha = 1;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['On'] == 'Yes'){	
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Servos();
									spiderlegs_mc.removeFrameAt(0);
									spiderlegs_mc.play();
								}else{
									TurnSpiderOn();
								}
								
							}
						}else{
							controller.alpha = 1;	
							spider.alpha = 1;
							spiderlegs_mc.alpha = 1;
							
							glass.alpha = 1;
						}
					}else{
						controller.alpha = 1;	
						spider.alpha = 1;
						spiderlegs_mc.alpha = 1;
						
						glass.alpha = 1;
					}
					
					
				}else{
					controller.alpha = 0;	
					spider.alpha = 1;
					spiderlegs_mc.alpha = 1;
					
					glass.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Fuse'] == 'PickedUp'){	
					FusePickedUp = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Screwdriver'] == 'PickedUp'){	
					ScrewdriverPickedUp = true;
					screwdriver.alpha = 0;
				}else{
					screwdriver.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Lid'] == 'Open'){	
					LidIsOpen = true;
					lid.alpha = 1;
					if(FusePickedUp === true){
						fuse.alpha = 0;
					}else{
						fuse.alpha = 1;
					}
				}else{
					lid.alpha = 0;
					fuse.alpha = 0;
				}
			}else{
				lid.alpha = 0;
				fuse.alpha = 0;
				screwdriver.alpha = 1;
				controller.alpha = 0;	
				spider.alpha = 1;
				spiderlegs_mc.alpha = 1;
				
				glass.alpha = 1;
			}
			
		
			
			this.addChildAt(spider,1)
			this.addChildAt(spiderlegs_mc,2)
			this.addChildAt(controller,3)
			this.addChildAt(lid,4)
			this.addChildAt(fuse,5)
			this.addChildAt(glass,6)
			this.addChildAt(screwdriver,7)
				
			CreateSplat01Hit();
			CreateSplat00Hit();
			CreateToguHit();
			CreateNewspaperHit();
			CreateTrayHit();
			
			CreateScrewDriverHit();
			CreateLidHit(LidIsOpen);
			CreateFuseHit();	
			CreateGlassHit();
			CreateSpiderHit(SpiderWorking);	
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			Starling.juggler.add(spiderlegs_mc);
			
			//(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			
		//	spiderlegs_mc.play();
		}
		//hit_spider
		
		private function TurnSpiderOn():void{
			Animating = true;
			delayedCall = new DelayedCall(function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Servos();
				spiderlegs_mc.play();
				Animating = false;
			},2);
			Starling.juggler.add(delayedCall);	
			
		}
		
		private function CreateTrayHit():void{
			hit_try = new Shape();
			hit_try.touchable = false;
			hit_try.graphics.beginFill(0xff0000);
			
			hit_try.graphics.lineTo(262,250);				
			hit_try.graphics.lineTo(272,168);				
			hit_try.graphics.lineTo(313,137);				
			hit_try.graphics.lineTo(315,234);				
			hit_try.graphics.lineTo(440,266);				
			hit_try.graphics.lineTo(471,179);				
			hit_try.graphics.lineTo(494,183);				
			hit_try.graphics.lineTo(485,322);				
			hit_try.graphics.lineTo(425,330);				
			hit_try.graphics.lineTo(463,368);				
			hit_try.graphics.lineTo(427,428);				
			hit_try.graphics.lineTo(338,389);				
			hit_try.graphics.lineTo(378,310);				
			
			hit_try.graphics.endFill(false);
			hit_try.alpha = 0.0;
			
			hit_try.graphics.precisionHitTest = true;	
			this.addChild(hit_try);
		}
		
		
		private function CreateNewspaperHit():void{
			hit_newspaper = new Shape();
			hit_newspaper.touchable = false;
			hit_newspaper.graphics.beginFill(0xff0000);
			
			hit_newspaper.graphics.lineTo(170,401);	
			hit_newspaper.graphics.lineTo(305,307);	
			hit_newspaper.graphics.lineTo(355,351);	
			hit_newspaper.graphics.lineTo(333,391);	
			hit_newspaper.graphics.lineTo(381,439);	
			hit_newspaper.graphics.lineTo(319,493);	
			hit_newspaper.graphics.lineTo(268,499);	
			
			hit_newspaper.graphics.endFill(false);
			hit_newspaper.alpha = 0.0;
			
			hit_newspaper.graphics.precisionHitTest = true;	
			this.addChild(hit_newspaper);
		}
		
		private function CreateToguHit():void{
			hit_togu = new Shape();
			hit_togu.touchable = false;
			hit_togu.graphics.beginFill(0xff0000);
			
			hit_togu.graphics.lineTo(615,164);	
			hit_togu.graphics.lineTo(667,65);	
			hit_togu.graphics.lineTo(751,126);	
			hit_togu.graphics.lineTo(758,234);	
			hit_togu.graphics.lineTo(746,271);	
			hit_togu.graphics.lineTo(626,255);	
			
			hit_togu.graphics.endFill(false);
			hit_togu.alpha = 0.0;
			
			hit_togu.graphics.precisionHitTest = true;	
			this.addChild(hit_togu);
		}
		
		private function CreateSplat01Hit():void{
			hit_splat_01 = new Shape();
			hit_splat_01.touchable = false;
			hit_splat_01.graphics.beginFill(0xff0000);
			
			hit_splat_01.graphics.lineTo(406,40);	
			hit_splat_01.graphics.lineTo(561,8);	
			hit_splat_01.graphics.lineTo(672,12);	
			hit_splat_01.graphics.lineTo(638,105);	
			hit_splat_01.graphics.lineTo(530,101);	
			hit_splat_01.graphics.lineTo(420,136);	
			
			hit_splat_01.graphics.endFill(false);
			hit_splat_01.alpha = 0.0;
			
			hit_splat_01.graphics.precisionHitTest = true;	
			this.addChild(hit_splat_01);
		}
		
		private function CreateSplat00Hit():void{
			hit_splat_00 = new Shape();
			hit_splat_00.touchable = false;
			hit_splat_00.graphics.beginFill(0xff0000);
			
			hit_splat_00.graphics.lineTo(24,49);	
			hit_splat_00.graphics.lineTo(191,14);	
			hit_splat_00.graphics.lineTo(351,31);	
			hit_splat_00.graphics.lineTo(360,99);	
			hit_splat_00.graphics.lineTo(300,135);	
			hit_splat_00.graphics.lineTo(80,154);	
					
			hit_splat_00.graphics.endFill(false);
			hit_splat_00.alpha = 0.0;
			
			hit_splat_00.graphics.precisionHitTest = true;	
			this.addChild(hit_splat_00);
		}
		
		
		private function CreateSpiderHit(open:Boolean = false):void{
			hit_spider = new Shape();
			this.addChild(hit_spider);
			if(open === false){
				
				hit_spider.x = 0;
				hit_spider.y = 0;
				hit_spider.graphics.beginFill(0x0000FF);
			/*	hit_spider.graphics.lineTo(505,352);
				hit_spider.graphics.lineTo(508,319);
				hit_spider.graphics.lineTo(562,270);
				hit_spider.graphics.lineTo(603,281);
				hit_spider.graphics.lineTo(638,320);
				hit_spider.graphics.lineTo(585,377);				
			*/
				hit_spider.graphics.lineTo(483,269);
				hit_spider.graphics.lineTo(542,212);
				hit_spider.graphics.lineTo(610,259);
				hit_spider.graphics.lineTo(691,266);
				hit_spider.graphics.lineTo(693,323);
				hit_spider.graphics.lineTo(638,368);
				hit_spider.graphics.lineTo(527,371);
				hit_spider.graphics.lineTo(511,349);
			}else{
				
				hit_spider.x = 0;
				hit_spider.y = 0;
				hit_spider.graphics.beginFill(0x0000FF);		
				hit_spider.graphics.lineTo(483,269);
				hit_spider.graphics.lineTo(542,212);
				hit_spider.graphics.lineTo(610,259);
				hit_spider.graphics.lineTo(691,266);
				hit_spider.graphics.lineTo(693,323);
				hit_spider.graphics.lineTo(638,368);
				hit_spider.graphics.lineTo(527,371);
				hit_spider.graphics.lineTo(511,349);
								
			}
			
			hit_spider.graphics.endFill(false);
			hit_spider.alpha = 0.0;
			
			hit_spider.graphics.precisionHitTest = true;		
			hit_spider.touchable = false;
			
		}		
		private function CreateLidHit(open:Boolean = false):void{
			hit_lid = new Shape();
			this.addChild(hit_lid);
			if(open === false){
				
				hit_lid.x = 0;
				hit_lid.y = 0;
				hit_lid.graphics.beginFill(0x0000FF);
				hit_lid.graphics.lineTo(0,295);
				hit_lid.graphics.lineTo(229,154);
				hit_lid.graphics.lineTo(276,178);
				hit_lid.graphics.lineTo(259,255);
				hit_lid.graphics.lineTo(207,301);
				hit_lid.graphics.lineTo(78,385);
				hit_lid.graphics.lineTo(10,339);
							
			
			}else{
				
				hit_lid.x = 0;
				hit_lid.y = 0;
				hit_lid.graphics.beginFill(0x0000FF);		
				hit_lid.graphics.lineTo(0,245);
				hit_lid.graphics.lineTo(81,180);
				hit_lid.graphics.lineTo(115,160);
				hit_lid.graphics.lineTo(245,106);
				hit_lid.graphics.lineTo(269,128);
				hit_lid.graphics.lineTo(251,182);
				hit_lid.graphics.lineTo(16,344);
				hit_lid.graphics.lineTo(0,341);
				
					
			}
			
			hit_lid.graphics.endFill(false);
			hit_lid.alpha = 0.0;
			
			hit_lid.graphics.precisionHitTest = true;		
			hit_lid.touchable = false;
			
		}		
		//hit_screwdriver
		//hit_glass
		private function CreateGlassHit():void{
			hit_glass = new Shape();
			hit_glass.touchable = false;
			hit_glass.graphics.beginFill(0xff0000);
			
			hit_glass.graphics.lineTo(314,160);	
			hit_glass.graphics.lineTo(331,122);	
			hit_glass.graphics.lineTo(367,107);	
			hit_glass.graphics.lineTo(403,119);	
			hit_glass.graphics.lineTo(432,163);	
			hit_glass.graphics.lineTo(423,206);	
			hit_glass.graphics.lineTo(390,231);	
			hit_glass.graphics.lineTo(352,232);	
			hit_glass.graphics.lineTo(325,208);	

			
			hit_glass.graphics.endFill(false);
			hit_glass.alpha = 0.0;
			
			hit_glass.graphics.precisionHitTest = true;	
			this.addChild(hit_glass);
		}
		
		private function CreateScrewDriverHit():void{
			hit_screwdriver = new Shape();
			hit_screwdriver.touchable = false;
			hit_screwdriver.graphics.beginFill(0xff0000);
			
			hit_screwdriver.graphics.lineTo(179,437);	
			hit_screwdriver.graphics.lineTo(240,348);	
			hit_screwdriver.graphics.lineTo(289,353);	
			hit_screwdriver.graphics.lineTo(308,398);	
			hit_screwdriver.graphics.lineTo(295,449);	
		
			hit_screwdriver.graphics.endFill(false);
			hit_screwdriver.alpha = 0.0;
			
			hit_screwdriver.graphics.precisionHitTest = true;	
			this.addChild(hit_screwdriver);
		}
		
		private function CreateFuseHit():void{
			hit_fuse = new Shape();
			hit_fuse.touchable = false;
			hit_fuse.graphics.beginFill(0xff0000);
			
			hit_fuse.graphics.lineTo(188,224);	
			hit_fuse.graphics.lineTo(208,193);	
			hit_fuse.graphics.lineTo(236,177);	
			hit_fuse.graphics.lineTo(263,193);	
			hit_fuse.graphics.lineTo(253,248);	
			hit_fuse.graphics.lineTo(220,279);	
			hit_fuse.graphics.lineTo(191,275);	
			
			hit_fuse.graphics.endFill(false);
			hit_fuse.alpha = 0.0;
			
			hit_fuse.graphics.precisionHitTest = true;	
			this.addChild(hit_fuse);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							
							if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('Servos') === true){
						//	if((stage.getChildAt(0) as Object).SoundFXObj.soundIsPlaying("Servos") === true){
								(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("Servos");
							}
							
							FadeOut((OfficeDesk as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeDeskObj,true
							);
						}else if(hit_glass.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SpiderPickedUp === false){
								if(SpiderWorking === false){									
									FadeOut((OfficeBugWire as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeBugWireObj,true
									);
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The spider is moving so quickly it's hard to see through the magnifying glass.");
								}
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There's nothing to look at through the magnifying glass.");
							}
							
						}else if(hit_togu.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A Togutech soldering iron station.");
						}else if(hit_screwdriver.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ScrewdriverHandler();
						}else if(hit_newspaper.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Sheets of yellowing newspaper.");
						}else if(hit_try.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A stand with small clamps and a magnifying glass.");
							
						}else if(hit_spider.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SpiderHandler();
						}else if(LidIsOpen === false){	
							if(hit_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LidHandler();
							}else if(hit_splat_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SplatHandler();
							}else if(hit_splat_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SplatHandler();
							}
						}else{
							if(hit_fuse.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FuseHandler();
							}
							else if(hit_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LidHandler();
							}else if(hit_splat_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SplatHandler();
							}else if(hit_splat_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SplatHandler();
							}
						}
					
						
					
						
					}
				}
			}
		}
		private function SplatHandler():void{
			if(RONum == 0){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Printed diagrams about the small spider robot.");			
				RONum = 1;
			}else if(RONum == 1){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The diagrams show the robot from various angles.");					
				RONum = 2;
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("These pictures must aid in the design process of the robot.");	
			}
		}
		
		private function SpiderHandler():void{
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
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit;
					}
					
					SaveArray['Controller'] = 'Attached';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeCircuit',SaveArray);
					
					controller.alpha = 1;
					glass.texture = this.assets.getTexture('glass_spider_controller');
					ControllerAttached = true;
					Animating = false;
				
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_Controller,
							"item_Controller"
						);
				}else{
					if(RONum == 0){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small robot with a body that resembles a spider.");
						
					}else if(RONum == 1){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The robot spider appears to still be unfinished and non-functional.");
						
					}else if(RONum == 1){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The drawers are made of painted steel.");	
					}
					
				}

			}else{
				if(SpiderWorking === false){
				
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit;	
					}
					ControllerAttached = false;
					controller.alpha = 0;
					glass.texture = this.assets.getTexture('glass_spider');
					SaveArray['Controller'] = "PickedUp";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeCircuit',SaveArray);
						
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Controller,
							'item_Controller',
							'inven_controller_sm'
					);
					
				}else{
					if(SpiderPickedUp === false){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit;	
						}
						(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("Servos");
						SpiderPickedUp = true;
						spider.alpha = 0;
						spiderlegs_mc.alpha = 0;
						controller.alpha = 0;
						glass.alpha = 0;
						SaveArray['Spider'] = "PickedUp";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeCircuit',SaveArray);
						
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Splat,
							'item_Splat',
							'inven_splat_sm'
						);
					}
				}
			}
		}
		
		private function ScrewdriverHandler():void{
			if(ScrewdriverPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit;	
				}
				ScrewdriverPickedUp = true;
				screwdriver.alpha = 0;
				SaveArray['Screwdriver'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeCircuit',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CarKeys,
					'item_CarKeys',
					'inven_carKeys_sm'
				);
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Sheets of yellowing newspaper.");
			}
		}
		
		private function FuseHandler():void{
			if(FusePickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit;	
				}
				FusePickedUp = true;
				fuse.alpha = 0;
				SaveArray['Fuse'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeCircuit',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_FuseBlue,
					'item_FuseBlue',
					'inven_fuseBlue_sm'
				);
			}else{
				
			}
		}
		
		private function LidHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit;	
			}
			if(LidIsOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxOpen();
				LidIsOpen = true;
				lid.alpha = 1;
				hit_lid.graphics.clear()
				CreateLidHit(true);
				if(FusePickedUp === false){
					fuse.alpha = 1;
				}else{
					fuse.alpha = 0;
				}
				SaveArray['Lid'] = "Open";
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxClose();
				LidIsOpen = false;
				lid.alpha = 0;
				fuse.alpha = 0;
				hit_lid.graphics.clear()
				CreateLidHit(false);
				SaveArray['Lid'] = "Closed";
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeCircuit',SaveArray);
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
			
			
			
			this.assets.removeTexture("officeCircuit_bg",true);
			this.assets.removeTexture("OfficeCircuit_Sprite_01",true);
			this.assets.removeTextureAtlas("OfficeCircuit_Sprite_01",true);
			this.assets.removeTexture("OfficeCircuit_Sprite_02",true);						
			this.assets.removeTextureAtlas("OfficeCircuit_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("officeCircuit_01");
			(stage.getChildAt(0) as Object).falseAsset("officeCircuit_02");
			(stage.getChildAt(0) as Object).falseAsset("officeCircuit_03");
			(stage.getChildAt(0) as Object).falseAsset("officeCircuit_04");
			(stage.getChildAt(0) as Object).falseAsset("officeCircuit_05");
			
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