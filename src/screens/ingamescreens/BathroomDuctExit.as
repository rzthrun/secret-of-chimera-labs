package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
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
	import starling.textures.TextureSmoothing;
	import starling.utils.AssetManager;
	import starling.utils.deg2rad;
	
	public class BathroomDuctExit extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		private var bg_hood:Image;
		
		private var grate:Image;
		private var spider_mc:MovieClip;
		private var spider_out_mc:MovieClip;
		private var anima_mult:Number = 0.1;
		
		private var hit_server:Shape;
		private var hit_grate:Shape;
		private var hit_spider:Shape;
		
		private var hit_hole:Shape;
		private var hit_walls:Shape;
		
		private var RONum:int = 0;
		
		private var SpiderAttached:Boolean = false;
		private var SpiderKickedOne:Boolean = false;
	
		private var SpiderOutTween:Tween;
		
		private var GrateUnlocked:Boolean = false;
		private var GrateOpen:Boolean = false;
		private var StickAttached:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function BathroomDuctExit(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('BathroomDuctExit_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomDuctExit/bathroomDuctExit_bg.jpg'));
				game.TrackAssets('BathroomDuctExit_01');
			}
			if(game.CheckAsset('BathroomDuctExit_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomDuctExit/BathroomDuctExit_Sprite_01.xml'));
				game.TrackAssets('BathroomDuctExit_02');
			}
			if(game.CheckAsset('BathroomDuctExit_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomDuctExit/BathroomDuctExit_Sprite_01.png'));
				game.TrackAssets('BathroomDuctExit_03');
			}
			if(game.CheckAsset('BathroomDuctExit_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomDuctExit/BathroomDuctExit_Sprite_02.xml'));
				game.TrackAssets('BathroomDuctExit_04');
			}
			if(game.CheckAsset('BathroomDuctExit_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BathroomDuctExit/BathroomDuctExit_Sprite_02.png'));
				game.TrackAssets('BathroomDuctExit_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BathroomDuctExit","BathroomDuctExitObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BathroomDuctExit',SaveArray);
			
			
			bg = new Image(this.assets.getTexture('bathroomDuctExit_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			bg_hood = new Image(this.assets.getTexture('vent_hood'));
			//grate.smoothing = TextureSmoothing.NONE;
			bg_hood.touchable = false;
			bg_hood.x = 0;
			bg_hood.y = 0;
			bg_hood.alpha = 1;
			
			spider_out_mc = new MovieClip(this.assets.getTextures("spi_out_0"),6);
			spider_out_mc.x = 50;
			spider_out_mc.y = 400;
			spider_out_mc.pivotX = spider_out_mc.width/2;
			spider_out_mc.pivotY = spider_out_mc.height/2;
			spider_out_mc.touchable = false;
			spider_out_mc.loop = true; 
			
			
			grate = new Image(this.assets.getTexture('grate'));
			//grate.smoothing = TextureSmoothing.NONE;
			grate.touchable = false;
			grate.x = 180;
			grate.y = 56;
			
			
			spider_mc = new MovieClip(this.assets.getTextures("spi_00"),12);
			spider_mc.x = 144;
			spider_mc.y = 243;
			spider_mc.touchable = false;
			spider_mc.loop = false; 
			
			
			
			spider_mc.addFrameAt(1,this.assets.getTexture("spi_00"), null, anima_mult*8);
			spider_mc.addFrameAt(2,this.assets.getTexture("spi_01"), null, anima_mult*2);
			spider_mc.addFrameAt(3,this.assets.getTexture("spi_00"), null, anima_mult*3);
			spider_mc.addFrameAt(4,this.assets.getTexture("spi_01"), null, anima_mult*3);
			spider_mc.addFrameAt(5,this.assets.getTexture("spi_00"), null, anima_mult*3);
			spider_mc.addFrameAt(6,this.assets.getTexture("spi_02"), null, anima_mult*2);
			spider_mc.addFrameAt(7,this.assets.getTexture("spi_03"), null, anima_mult*1);
			spider_mc.addFrameAt(8,this.assets.getTexture("spi_04"), null, anima_mult*12);
			spider_mc.addFrameAt(9,this.assets.getTexture("spi_05"), null, anima_mult*1);
			spider_mc.addFrameAt(10,this.assets.getTexture("spi_06"), null, anima_mult*1);
			spider_mc.addFrameAt(11,this.assets.getTexture("spi_07"), null, anima_mult*1);
			spider_mc.addFrameAt(12,this.assets.getTexture("spi_08"), null, anima_mult*1);
			spider_mc.addFrameAt(13,this.assets.getTexture("spi_09"), null, anima_mult*1);
			spider_mc.addFrameAt(14,this.assets.getTexture("spi_10"), null, anima_mult*1);
			spider_mc.addFrameAt(15,this.assets.getTexture("spi_11"), null, anima_mult*1);
			spider_mc.addFrameAt(16,this.assets.getTexture("spi_12"), null, anima_mult*1);
			spider_mc.addFrameAt(17,this.assets.getTexture("spi_13"), null, anima_mult*3);
			spider_mc.addFrameAt(18,this.assets.getTexture("spi_14"), null, anima_mult*3);
			spider_mc.addFrameAt(19,this.assets.getTexture("spi_13"), null, anima_mult*2);
			spider_mc.addFrameAt(20,this.assets.getTexture("spi_14"), null, anima_mult*2);
			spider_mc.addFrameAt(21,this.assets.getTexture("spi_13"), null, anima_mult*8);
			spider_mc.addFrameAt(22,this.assets.getTexture("spi_14"), null, anima_mult*1);
			spider_mc.addFrameAt(23,this.assets.getTexture("spi_15"), null, anima_mult*1);
			spider_mc.addFrameAt(24,this.assets.getTexture("spi_16"), null, anima_mult*1);
			spider_mc.addFrameAt(25,this.assets.getTexture("spi_17"), null, anima_mult*1);
			spider_mc.addFrameAt(26,this.assets.getTexture("spi_18"), null, anima_mult*1);
			spider_mc.addFrameAt(27,this.assets.getTexture("spi_19"), null, anima_mult*4);
			spider_mc.addFrameAt(28,this.assets.getTexture("spi_20"), null, anima_mult*1);
			spider_mc.addFrameAt(29,this.assets.getTexture("spi_21"), null, anima_mult*4);
			spider_mc.addFrameAt(30,this.assets.getTexture("spi_22"), null, anima_mult*1);
			spider_mc.addFrameAt(31,this.assets.getTexture("spi_23"), null, anima_mult*1);
			spider_mc.addFrameAt(32,this.assets.getTexture("spi_24"), null, anima_mult*1);
			spider_mc.addFrameAt(33,this.assets.getTexture("spi_25"), null, anima_mult*4);
			spider_mc.addFrameAt(34,this.assets.getTexture("spi_26"), null, anima_mult*1);
			spider_mc.addFrameAt(35,this.assets.getTexture("spi_27"), null, anima_mult*1);
			spider_mc.addFrameAt(36,this.assets.getTexture("spi_28"), null, anima_mult*1);
			spider_mc.addFrameAt(37,this.assets.getTexture("spi_29"), null, anima_mult*3);
			spider_mc.addFrameAt(38,this.assets.getTexture("spi_30"), null, anima_mult*1);
			spider_mc.addFrameAt(39,this.assets.getTexture("spi_31"), null, anima_mult*1);
			spider_mc.addFrameAt(40,this.assets.getTexture("spi_30"), null, anima_mult*1);
			spider_mc.addFrameAt(41,this.assets.getTexture("spi_31"), null, anima_mult*1);
			spider_mc.addFrameAt(42,this.assets.getTexture("spi_32"), null, anima_mult*1);
			spider_mc.addFrameAt(43,this.assets.getTexture("spi_33"), null, anima_mult*1);
			spider_mc.addFrameAt(44,this.assets.getTexture("spi_34"), null, anima_mult*2);
			spider_mc.addFrameAt(45,this.assets.getTexture("spi_35"), null, anima_mult*2);
			spider_mc.addFrameAt(46,this.assets.getTexture("spi_36"), null, anima_mult*1);
			spider_mc.addFrameAt(47,this.assets.getTexture("spi_37"), null, anima_mult*1);
			spider_mc.addFrameAt(48,this.assets.getTexture("spi_38"), null, anima_mult*1);
		//	spider_mc.addFrameAt(47,this.assets.getTexture("spi_39"), null, anima_mult*1);
		//	spider_mc.addFrameAt(48,this.assets.getTexture("spi_310"), null, anima_mult*1);
		//	spider_mc.addFrameAt(49,this.assets.getTexture("spi_39"), null, anima_mult*1);
			
			
			spider_mc.stop();
			spider_out_mc.stop();
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctFan != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctFan['Stick'] == 'Attach'){	
					StickAttached = true;
				}
			}
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctExit != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctExit['Splat'] == 'Attached'){
					SpiderAttached = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctExit['GrateUnlocked'] == 'Yes'){
						GrateUnlocked = true;
						SpiderKickedOne = true;
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctExit['GrateOpen'] == 'Yes'){
							GrateOpen = true;
							spider_out_mc.alpha = 0; 
							grate.alpha = 0;
							spider_mc.alpha = 0; 
						
							
						}else{
							spider_out_mc.x = 385;
							spider_out_mc.y = 220;
							spider_out_mc.rotation = deg2rad(45);
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SnoryBot();
							
							
							spider_out_mc.alpha = 1; 
							grate.alpha = 1;
							spider_mc.alpha = 0; 
						}
					}else{
						spider_out_mc.alpha = 0; 
						grate.alpha = 1;
						spider_mc.alpha = 1; 
					}
					
				
				}else{
					spider_out_mc.alpha = 0; 
					grate.alpha = 1;
					spider_mc.alpha = 0; 
				}
			}else{
				spider_out_mc.alpha = 0; 
				grate.alpha = 1;
				spider_mc.alpha = 0; 
			}
			
			//	CreateElevatorDoorHit();
			this.addChildAt(spider_out_mc, 1);
			this.addChildAt(bg_hood, 2);
			
			this.addChildAt(grate, 3);
			this.addChildAt(spider_mc, 4);
			
			CreateWallHit();
			CreateServerHit();
			CreateHoleHit();
			CreateSpiderHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			Starling.juggler.add(spider_mc);
			Starling.juggler.add(spider_out_mc);
			
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadWindHowl(true,999);
			//(stage.getChildAt(0) as Object).AmbientObj.LoadBuildingHum(true,999);
			Starling.juggler.delayCall(function():void{
				
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadDuctVibe(true,999);
				//	(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("DuctVibe",((stage.getChildAt(0) as Object).AmbientObj.globalVol),0.5,'stop');
				
				PlayBuildingAmb();
			},0.5);
			
		}
		//	private var hit_vent_door:Shape;
		//	private var hit_fan_door:Shape;
		private function PlayBuildingAmb():void{
			Starling.juggler.delayCall(function():void{
				if(StickAttached === false){
					(stage.getChildAt(0) as Object).AmbientObj.LoadMotorFan(true,999);
					(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolume("MotorFan",((stage.getChildAt(0) as Object).AmbientObj.globalVol/4),1.0);	
				}							
			},0.5);
			
		}
		

		
		private function CreateWallHit():void{
			hit_walls = new Shape();
			hit_walls.touchable = false;
			hit_walls.graphics.beginFill(0xff0000);
			
			hit_walls.graphics.lineTo(0,0);	
			hit_walls.graphics.lineTo(800,0);	
			hit_walls.graphics.lineTo(800,512);	
			hit_walls.graphics.lineTo(0,512);	
		
			hit_walls.graphics.endFill(false);
			hit_walls.alpha = 0.0;
			
			hit_walls.graphics.precisionHitTest = true;	
			this.addChild(hit_walls);
		}
		
		private function CreateHoleHit():void{
			hit_hole = new Shape();
			hit_hole.touchable = false;
			hit_hole.graphics.beginFill(0xff0000);
			
			hit_hole.graphics.lineTo(205,243);	
			hit_hole.graphics.lineTo(346,262);	
			hit_hole.graphics.lineTo(345,334);	
			hit_hole.graphics.lineTo(205,325);	
			
			hit_hole.graphics.endFill(false);
			hit_hole.alpha = 0.0;
			
			hit_hole.graphics.precisionHitTest = true;	
			this.addChild(hit_hole);
		}
		
		private function CreateSpiderHit():void{
			hit_spider = new Shape();
			hit_spider.touchable = false;
			hit_spider.graphics.beginFill(0xff0000);
			
			hit_spider.graphics.lineTo(215,428);	
			hit_spider.graphics.lineTo(246,383);	
			hit_spider.graphics.lineTo(433,376);	
			hit_spider.graphics.lineTo(494,431);	
			hit_spider.graphics.lineTo(502,503);	
			hit_spider.graphics.lineTo(228,503);	
			
			hit_spider.graphics.endFill(false);
			hit_spider.alpha = 0.0;
			
			hit_spider.graphics.precisionHitTest = true;	
			this.addChild(hit_spider);
		}
		
		private function CreateServerHit():void{
			hit_server = new Shape();
			hit_server.touchable = false;
			hit_server.graphics.beginFill(0xff0000);
			
			hit_server.graphics.lineTo(178,53);	
			hit_server.graphics.lineTo(580,64);	
			hit_server.graphics.lineTo(576,368);	
			hit_server.graphics.lineTo(182,378);	
			
			hit_server.graphics.endFill(false);
			hit_server.alpha = 0.0;
			
			hit_server.graphics.precisionHitTest = true;	
			this.addChild(hit_server);
		}
	
		
		private function CreateVentHit():void{
			hit_grate = new Shape();
			hit_grate.touchable = false;
			hit_grate.graphics.beginFill(0xff0000);
			
			hit_grate.graphics.lineTo(432,109);	
			
			
			hit_grate.graphics.endFill(false);
			hit_grate.alpha = 0.0;
			
			hit_grate.graphics.precisionHitTest = true;	
			this.addChild(hit_grate);
		}
			
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("SnoryBot");	
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangOne();
							
							FadeOut((BathroomDuct as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BathroomDuctObj,true
							);
						}else if(hit_hole.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SpiderAttached === false){
								if((stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.armedItem
									== 
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.inventoryBarObj
									.item_Splat)
								{
									SpiderHandler();
								}else{
									HoleHandler();
								}
								
							}else{
								if(GrateUnlocked === false){
									
								}else{
									GrateHandler();
								}
								
							}
							
							
						}else if(hit_server.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SpiderAttached === false){
								SpiderHandler();
							}else{
								if(GrateUnlocked === false){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I should try to wake the spider bot up.");	
								}else{
									GrateHandler();
								}
								
							}
							
						}else if(hit_spider.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SpiderAttached === false){
								if((stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.armedItem
									== 
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.inventoryBarObj
									.item_Splat)
								{
									SpiderHandler();
								}else{
									WallsHandler();
								}
								
							//	SpiderHandler();
							//}else if(SpiderKickedOne === false){
							//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Servos(0);
							//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
							//	SpiderKickedOne = true;
						//	}else{
						//		PlaySpider();
								
							}
						}else if(hit_walls.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							WallsHandler();
						}
						
					}
				}
			}
		}
		private function HoleHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Part of the vent is bent, forming a small hole.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can just barely fit my hand through the hole, not much else though...");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Maybe I can use this small opening somehow...?");	
			}
		}
		
		private function WallsHandler():void{
			if(RONum == 0){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangFour();
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The metal feels cold.");	
			}else if(RONum == 1){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangThree();
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Water vapor condenses on the cool steel.");	
			}else if(RONum == 2){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangFour();
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It's so chilly; the climate control must be malfunctioning....");	
			}
		}
		
		private function PlaySpider():void{
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Servos();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RotaryClicks();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctExit != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctExit;
			}
			
			SaveArray['GrateUnlocked'] = 'Yes';
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BathroomDuctExit',SaveArray);
			
			Animating = true;
			GrateUnlocked = true;
			spider_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onSpiderEnterFrame);
			spider_mc.play();
		}
		private function onSpiderEnterFrame():void{
			trace('FIRE ON FRAME');
			if(spider_mc.isComplete == true){
				trace("END spider_mc ANIMATION");
				spider_mc.alpha = 0;
				
				spider_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onSpiderEnterFrame);
				PlaySpiderOut();
			}else{
				if(spider_mc.currentFrame == 47){
					if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('ClickyBot') === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickyBot();
					}
				}else if(spider_mc.currentFrame == 26){
					if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('WalkyBot') === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WalkyBot(2);
					}
				}
				//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WalkyBot();
			}
		}
		private function PlaySpiderOut():void{
			
			//Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrillSingleOne();
			//},1.5);
				Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrillSingleOne();
				},1.5);
			spider_out_mc.alpha = 1;
			spider_out_mc.play();
			
			SpiderOutTween =  new Tween(spider_out_mc, 2, Transitions.LINEAR);
			SpiderOutTween.moveTo(700,-50);
			
			SpiderOutTween.onComplete = function():void{
				PlaySpiderOutTwo();
			//	game.SoundFXObj.PlaySFX_CosmicWaffle();
			//	BlueAnimator();
				SpiderOutTween = null;
			}
			Starling.juggler.add(SpiderOutTween);
			
		}
		
		private function PlaySpiderOutTwo():void{
			
			
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrillSingleOne();
			},1.5);
			spider_out_mc.x = 700;
			spider_out_mc.y = 400;
			spider_out_mc.rotation = deg2rad(-90);
			SpiderOutTween =  new Tween(spider_out_mc, 2, Transitions.LINEAR);
			SpiderOutTween.moveTo(50,-50);
			
			SpiderOutTween.onComplete = function():void{
			//	game.SoundFXObj.PlaySFX_CosmicWaffle();
				//	BlueAnimator();
				PlaySpiderOutThree();
				SpiderOutTween = null;
			}
			Starling.juggler.add(SpiderOutTween);
		}
		
		private function PlaySpiderOutThree():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SnoryBot();
			spider_out_mc.fps = 6;
			spider_out_mc.x = 50;
			spider_out_mc.y = 50;
			spider_out_mc.rotation = deg2rad(45);
			SpiderOutTween =  new Tween(spider_out_mc, 2, Transitions.EASE_OUT);
			SpiderOutTween.moveTo(385,220);
			SpiderOutTween.animate("rotation", deg2rad(65));
			
			SpiderOutTween.onComplete = function():void{
				//	game.SoundFXObj.PlaySFX_CosmicWaffle();
				//	BlueAnimator();
				SpiderOnComplete();
				Animating = false;
				spider_out_mc.stop();
				SpiderOutTween = null;
			}
			Starling.juggler.add(SpiderOutTween);
		}
		private function SpiderOnComplete():void{
			(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("Servos");
			(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("RotaryClicks");
			(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("ClickyBot");
			
		}
		private function GrateHandler():void{
			if(GrateOpen === false){
				GrateOpen = true;
				spider_out_mc.alpha = 0;
				grate.alpha = 0;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctExit != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctExit;
				}
				(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("SnoryBot");
				SaveArray['GrateOpen'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BathroomDuctExit',SaveArray);
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BarrelKickLight();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalDrop();
				
				
				
				Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RobotWail();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalDropLight();
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BarrelKickLight();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
			
				},1);
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangTwo();
				FadeOut((ServerRoom as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ServerRoomObj,true
				);
			}
		}
		
		private function SpiderHandler():void{
			
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Splat)
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangFour();
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctExit != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomDuctExit;
				}
				
				SaveArray['Splat'] = 'Attached';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BathroomDuctExit',SaveArray);
				
				SpiderAttached = true;
				spider_mc.alpha = 1; 
			
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_Splat,
						"item_Splat"
					);
				
				PlaySpider();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoorTwo();
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangThree();
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The vent cover won't budge.");
				}else if(RONum == 1){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangFour();
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The vent cover must be secured somehow on the other side.");	
				}else if(RONum == 2){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangThree();
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Maybe I can use this small opening somehow...?");	
				}
				
				
				
				
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
			
			
			
			this.assets.removeTexture("BathroomDuctExit_bg",true);
			this.assets.removeTexture("BathroomDuctExit_Sprite_01",true);
			this.assets.removeTextureAtlas("BathroomDuctExit_Sprite_01",true);
			this.assets.removeTexture("BathroomDuctExit_Sprite_02",true);
			this.assets.removeTextureAtlas("BathroomDuctExit_Sprite_03",true);
			
			(stage.getChildAt(0) as Object).falseAsset("BathroomDuctExit_01");
			(stage.getChildAt(0) as Object).falseAsset("BathroomDuctExit_02");
			(stage.getChildAt(0) as Object).falseAsset("BathroomDuctExit_03");
			(stage.getChildAt(0) as Object).falseAsset("BathroomDuctExit_04");
			(stage.getChildAt(0) as Object).falseAsset("BathroomDuctExit_05");
			
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
