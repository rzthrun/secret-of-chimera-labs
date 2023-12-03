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
	
	
	public class GeneticsRoomElectron extends Sprite
	{
		
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var black_tube_off:Image;
		private var black_tube_on:Image;
		
		private var bottle_g_empty:Image;
		private var bottle_a_empty:Image;
		private var bottle_c_empty:Image;
		private var bottle_t_empty:Image;
		private var bottle_g_full:Image;
		private var bottle_a_full:Image;
		private var bottle_c_full:Image;
		private var bottle_t_full:Image;
		
		private var lever_g:Image;
		private var lever_a:Image;
		private var lever_c:Image;
		private var lever_t:Image;
		
		private var dna_container:Image;
		private var dna_container_flow:Image;
		private var eyes:Image;
		private var wheel:Image;
		private var test_tube:Image;
		private var test_tube_full:Image;
		private var indicator:Image;
		
		
		private var hit_microscope:Shape;
		private var hit_dna:Shape;
		private var hit_wheel:Shape;
		private var hit_test_tube:Shape;	
		private var hit_hose:Shape;
		private var hit_bottle_g:Shape;
		private var hit_bottle_a:Shape;
		private var hit_bottle_c:Shape;
		private var hit_bottle_t:Shape;	
		private var hit_lever_g:Shape;
		private var hit_lever_a:Shape;
		private var hit_lever_c:Shape;
		private var hit_lever_t:Shape;
		
		private var Animating:Boolean = false;
		private var HoseAttached:Boolean = false;
		private var DNAAttached:Boolean = false;
		private var WheelTurned:Boolean = false;
		private var TestTubeFilled:Boolean = false;
		private var TestTubePickedUp:Boolean = false;
		
		private var Bottle_g_Attached:Boolean = true;
		private var Bottle_a_Attached:Boolean = false;
		private var Bottle_c_Attached:Boolean = false;
		private var Bottle_t_Attached:Boolean = true;
		
		private var Bottle_g_Drained:Boolean = false;
		private var Bottle_a_Drained:Boolean = false;
		private var Bottle_c_Drained:Boolean = false;
		private var Bottle_t_Drained:Boolean = false;
		
		private var WheelPos:Boolean = false;
		
		private var DNATweenOne:Tween;
		private var DNATweenTwo:Tween;
		private var DNACylanderTween:Tween;
		private var EyesTween:Tween;
		private var BottleTween:Tween;
		private var TestTubeTween:Tween;
	
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function GeneticsRoomElectron(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('geneticsRoomElectron_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomElectron/geneticsRoomElectron_bg.jpg'));
				game.TrackAssets('geneticsRoomElectron_01');
			}
			if(game.CheckAsset('geneticsRoomElectron_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomElectron/GeneticsRoomElectron_Sprite_01.png'));
				game.TrackAssets('geneticsRoomElectron_02');
			}
			if(game.CheckAsset('geneticsRoomElectron_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomElectron/GeneticsRoomElectron_Sprite_01.xml'));
				game.TrackAssets('geneticsRoomElectron_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GeneticsRoomElectron","GeneticsRoomElectronObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
	
		
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('geneticsRoomElectron_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			
			black_tube_off = new Image(this.assets.getTexture('black_tube_off'));
			black_tube_off.touchable = false;
			black_tube_off.x = 227;
			black_tube_off.y = 90;;
			
			black_tube_on = new Image(this.assets.getTexture('black_tube_on'));
			black_tube_on.touchable = false;
			black_tube_on.x = 157;
			black_tube_on.y = 94;
			
			bottle_g_empty = new Image(this.assets.getTexture('bottle_g_empty'));
			bottle_g_empty.touchable = false;
			bottle_g_empty.x = 472;
			bottle_g_empty.y = 151;
			
			bottle_g_full = new Image(this.assets.getTexture('bottle_g_full'));
			bottle_g_full.touchable = false;
			bottle_g_full.x = 472;
			bottle_g_full.y = 151;
			
			bottle_a_empty = new Image(this.assets.getTexture('bottle_a_empty'));
			bottle_a_empty.touchable = false;
			bottle_a_empty.x = 540;
			bottle_a_empty.y = 149;
			
			bottle_a_full = new Image(this.assets.getTexture('bottle_a_full'));
			bottle_a_full.touchable = false;
			bottle_a_full.x = 540;
			bottle_a_full.y = 149;
			
			bottle_c_empty = new Image(this.assets.getTexture('bottle_c_empty'));
			bottle_c_empty.touchable = false;
			bottle_c_empty.x = 604;
			bottle_c_empty.y = 146;
			
			bottle_c_full = new Image(this.assets.getTexture('bottle_c_full'));
			bottle_c_full.touchable = false;
			bottle_c_full.x = 604;
			bottle_c_full.y = 146;
			
			bottle_t_empty = new Image(this.assets.getTexture('bottle_t_empty'));
			bottle_t_empty.touchable = false;
			bottle_t_empty.x = 663;
			bottle_t_empty.y = 145;
			
			bottle_t_full = new Image(this.assets.getTexture('bottle_t_full'));
			bottle_t_full.touchable = false;
			bottle_t_full.x = 663;
			bottle_t_full.y = 145;
			
			lever_g = new Image(this.assets.getTexture('lever_g_right'));
			lever_g.touchable = false;
			lever_g.x = 488;
			lever_g.y = 326;
			
			lever_a = new Image(this.assets.getTexture('lever_a_right'));
			lever_a.touchable = false;
			lever_a.x = 559;
			lever_a.y = 319;
			
			lever_c = new Image(this.assets.getTexture('lever_c_right'));
			lever_c.touchable = false;
			lever_c.x = 627;
			lever_c.y = 312;
			
			lever_t = new Image(this.assets.getTexture('lever_t_right'));
			lever_t.touchable = false;
			lever_t.x = 690;
			lever_t.y = 307;
			
		
			dna_container = new Image(this.assets.getTexture('dna_container_full'));
			dna_container.touchable = false;
			dna_container.x = 42;
			dna_container.y = 191;
			
			dna_container_flow  = new Image(this.assets.getTexture('dna_container_flowl'));
			dna_container_flow.touchable = false;
			dna_container_flow.x = 42;
			dna_container_flow.y = 191;
			
			eyes = new Image(this.assets.getTexture('eyes'));
			eyes.touchable = false;
			eyes.x = 335;
			eyes.y = 291;
			
			wheel = new Image(this.assets.getTexture('wheel'));
			wheel.touchable = false;
			wheel.x = 447;
			wheel.y = 0;
			
			test_tube = new Image(this.assets.getTexture('test_tube_empty'));
			test_tube.touchable = false;
			test_tube.x = 396;
			test_tube.y = 148;
			
			indicator = new Image(this.assets.getTexture('indicator_full'));
			indicator.touchable = false;
			indicator.x = 345;
			indicator.y = 120;
			
			
			test_tube_full = new Image(this.assets.getTexture('test_tube_full'));
			test_tube_full.touchable = false;
			test_tube_full.x = 396;
			test_tube_full.y = 148;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['TestTubeFilled'] == 'Yes'){
					TestTubeFilled = true;
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['TestTubePickedUp'] == 'Yes'){
					TestTubePickedUp = true;
					
					
				}
				if(TestTubeFilled === true){
					if(TestTubePickedUp === true){
						test_tube.alpha = 0;
						test_tube_full.alpha = 0;
					}else{
						test_tube.alpha = 0;
						test_tube_full.alpha = 1;
					}
				}else{
					test_tube.alpha = 1;
					test_tube_full.alpha = 0;
				}
				
				//test_tube_full.alpha = 0;
				//
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['HoseAttached'] == 'Yes'){
					HoseAttached = true;
					black_tube_off.alpha = 0;
					black_tube_on.alpha = 1;
				}else{
					black_tube_off.alpha = 1;
					black_tube_on.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['DNAAttached'] == 'Yes'){
					DNAAttached = true;
					dna_container.alpha = 1;
					dna_container_flow.alpha = 0;
				}else{
					dna_container.alpha = 0;
					dna_container_flow.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['WheelTurned'] == 'Yes'){
					WheelTurned = true;			
					dna_container.texture = this.assets.getTexture('dna_container_empty');
					eyes.alpha = 1;
					indicator.alpha = 1;
				}else{
					eyes.alpha = 0;
					indicator.alpha = 0;

				}
				
			
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_g'] == 'Yes'){
					Bottle_g_Drained = true;
					lever_g.texture = this.assets.getTexture('lever_g_left');
					bottle_g_full.alpha = 0;
					bottle_g_empty.alpha = 1;
				}else{
					bottle_g_full.alpha = 1;
					bottle_g_empty.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['Bottle_a_Attached'] == 'Yes'){
					Bottle_a_Attached = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_a'] == 'Yes'){
						Bottle_a_Drained = true;
						lever_a.texture = this.assets.getTexture('lever_a_left');
						bottle_a_full.alpha = 0;
						bottle_a_empty.alpha = 1;
					}else{
						bottle_a_full.alpha = 1;
						bottle_a_empty.alpha = 0;
					}
				}else{
					bottle_a_full.alpha = 0;
					bottle_a_empty.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['Bottle_c_Attached'] == 'Yes'){
					Bottle_c_Attached = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_c'] == 'Yes'){
						Bottle_c_Drained = true;
						lever_c.texture = this.assets.getTexture('lever_c_left');
						bottle_c_full.alpha = 0;
						bottle_c_empty.alpha = 1;
					}else{
						bottle_c_full.alpha = 1;
						bottle_c_empty.alpha = 0;
					}
				}else{
					bottle_c_full.alpha = 0;
					bottle_c_empty.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_t'] == 'Yes'){
					Bottle_t_Drained = true;
					lever_t.texture = this.assets.getTexture('lever_t_left');
					bottle_t_full.alpha = 0;
					bottle_t_empty.alpha = 1;
				}else{
					bottle_t_full.alpha = 1;
					bottle_t_empty.alpha = 0;
				}
				
			//Bottle_c_Attached
			}else{
				dna_container.alpha = 0;
				dna_container_flow.alpha = 0;
				black_tube_off.alpha = 1;
				black_tube_on.alpha = 0;
				indicator.alpha = 0;
				eyes.alpha = 0;
				bottle_g_full.alpha = 1;
				bottle_g_empty.alpha = 0;
				bottle_a_full.alpha = 0;
				bottle_a_empty.alpha = 0;
				bottle_c_full.alpha = 0;
				bottle_c_empty.alpha = 0;
				bottle_t_full.alpha = 1;
				bottle_t_empty.alpha = 0;
				test_tube_full.alpha = 0;
				test_tube.alpha = 1
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['Solved'] == 'yes'){	
					if(TestTubePickedUp === false){
						if(TestTubeFilled === false){
							Animating = true;
							
							TestTubeFilled = true;
							
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
								SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron;
							}
							SaveArray['TestTubeFilled'] = 'Yes';
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomElectron',SaveArray);
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirLeak();
							Starling.juggler.delayCall(function():void{
								FillTestTube();
							},2);
						}
					}
				}
			}
				
			
			/*
			TestTubePickedUp = true;
			test_tube.alpha = 0;
			test_tube_full.alpha = 0;
			*/
		
			
			lever_g.alpha = 1;
			lever_a.alpha = 1;
			lever_c.alpha = 1;
			lever_t.alpha = 1;
			
			
			
			wheel.alpha = 0;
			
			
			
				
			this.addChildAt(dna_container,1);
			this.addChildAt(dna_container_flow,2);
			this.addChildAt(black_tube_off,3);
			this.addChildAt(black_tube_on,4);
			
			this.addChildAt(bottle_g_full,5);
			this.addChildAt(bottle_g_empty,6);
			
			this.addChildAt(bottle_a_full,7);
			this.addChildAt(bottle_a_empty,8);
			
			this.addChildAt(bottle_c_full,9);
			this.addChildAt(bottle_c_empty,10);
			
			this.addChildAt(bottle_t_full,11);
			this.addChildAt(bottle_t_empty,12);
					
			this.addChildAt(lever_g,13);
			this.addChildAt(lever_a,14);
			this.addChildAt(lever_c,15);
			this.addChildAt(lever_t,16);
			
			
			this.addChildAt(eyes,17);
			this.addChildAt(test_tube,18);
			this.addChildAt(indicator,19);
			this.addChildAt(wheel,20);
			this.addChildAt(test_tube_full,21);
			
			
			CreateMicroscopeHit();
			CreateDNAHit(DNAAttached);
			CreateWheelHit();
			CreateTestTubeHit();
			CreateHoseHit(HoseAttached);
			CreateBottleHits();
			CreateLeverHits();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
		//	(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
		}
		
		private function FillTestTube():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Machine();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirRelease();
			
			DNACylanderTween = new Tween(indicator, 2, Transitions.LINEAR);
			DNACylanderTween.fadeTo(0);
			DNACylanderTween.onComplete = function():void{			
				//	CompleteDNAAnimation();
				
				DNACylanderTween = null;
				
			};
			TestTubeTween = new Tween(test_tube_full, 2, Transitions.LINEAR);
			TestTubeTween.fadeTo(1);
			TestTubeTween.onComplete = function():void{			
				//	CompleteDNAAnimation();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
				Animating = false;
				TestTubeTween = null;
				
			};
						
			Starling.juggler.add(DNACylanderTween);	
			Starling.juggler.add(TestTubeTween);	
			
		}
		
		
		private function CreateMicroscopeHit():void{
			hit_microscope = new Shape();
			hit_microscope.touchable = false;
			hit_microscope.graphics.beginFill(0xff0000);
			
			hit_microscope.graphics.lineTo(265,381);	
			hit_microscope.graphics.lineTo(284,274);	
			hit_microscope.graphics.lineTo(387,267);	
			hit_microscope.graphics.lineTo(443,366);	
		
			hit_microscope.graphics.endFill(false);
			hit_microscope.alpha = 0.0;
			
			hit_microscope.graphics.precisionHitTest = true;	
			this.addChild(hit_microscope);
		}
		private function CreateDNAHit(open:Boolean = false):void{
			hit_dna = new Shape();		
			hit_dna.x = 0;
			hit_dna.y = 0;
			hit_dna.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				
				hit_dna.graphics.lineTo(19,378);	
				hit_dna.graphics.lineTo(77,337);	
				hit_dna.graphics.lineTo(175,332);	
				hit_dna.graphics.lineTo(224,356);	
				hit_dna.graphics.lineTo(225,380);	
				hit_dna.graphics.lineTo(148,421);	
				hit_dna.graphics.lineTo(70,428);			
				
				
			}else{
				
				hit_dna.graphics.lineTo(37,264);
				hit_dna.graphics.lineTo(80,194);
				hit_dna.graphics.lineTo(112,182);
				hit_dna.graphics.lineTo(168,204);
				hit_dna.graphics.lineTo(178,260);
				hit_dna.graphics.lineTo(188,381);
				hit_dna.graphics.lineTo(114,412);
				hit_dna.graphics.lineTo(49,400);
				
			}				
			hit_dna.graphics.endFill(false);			
			hit_dna.alpha = 0.0;			
			hit_dna.graphics.precisionHitTest = true;	
			hit_dna.touchable = false
			this.addChild(hit_dna);
			
			
		}
	
		private function CreateWheelHit():void{
			hit_wheel = new Shape();
			hit_wheel.touchable = false;
			hit_wheel.graphics.beginFill(0xff0000);
			
			hit_wheel.graphics.lineTo(416,0);	
			hit_wheel.graphics.lineTo(485,0);	
			hit_wheel.graphics.lineTo(491,47);	
			hit_wheel.graphics.lineTo(467,90);	
			hit_wheel.graphics.lineTo(414,72);	
			
			hit_wheel.graphics.endFill(false);
			hit_wheel.alpha = 0.0;
			
			hit_wheel.graphics.precisionHitTest = true;	
			this.addChild(hit_wheel);
		}
		private function CreateTestTubeHit():void{
			hit_test_tube = new Shape();
			hit_test_tube.touchable = false;
			hit_test_tube.graphics.beginFill(0xff0000);
			
			hit_test_tube.graphics.lineTo(381,138);	
			hit_test_tube.graphics.lineTo(441,137);	
			hit_test_tube.graphics.lineTo(435,284);	
			hit_test_tube.graphics.lineTo(411,295);	
			hit_test_tube.graphics.lineTo(391,268);	
						
			hit_test_tube.graphics.endFill(false);
			hit_test_tube.alpha = 0.0;
			
			hit_test_tube.graphics.precisionHitTest = true;	
			this.addChild(hit_test_tube);
		}
		private function CreateHoseHit(open:Boolean = false):void{
			hit_hose = new Shape();		
			hit_hose.x = 0;
			hit_hose.y = 0;
			hit_hose.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_hose.graphics.lineTo(230,85);					
				hit_hose.graphics.lineTo(263,86);					
				hit_hose.graphics.lineTo(263,117);					
				hit_hose.graphics.lineTo(268,292);					
				hit_hose.graphics.lineTo(211,288);					
							
				
			}else{
				
				hit_hose.graphics.lineTo(162,219);
				hit_hose.graphics.lineTo(162,193);
				hit_hose.graphics.lineTo(226,191);
				hit_hose.graphics.lineTo(227,88);
				hit_hose.graphics.lineTo(262,94);
				hit_hose.graphics.lineTo(255,223);
				
			}				
			hit_hose.graphics.endFill(false);			
			hit_hose.alpha = 0.0;			
			hit_hose.graphics.precisionHitTest = true;	
			hit_hose.touchable = false
			this.addChild(hit_hose);
			
			
		}
		private function CreateBottleHits():void{
			hit_bottle_g = new Shape();
			hit_bottle_g.touchable = false;
			hit_bottle_g.graphics.beginFill(0xff0000);
			
			hit_bottle_g.graphics.lineTo(459,286);	
			hit_bottle_g.graphics.lineTo(467,152);	
			hit_bottle_g.graphics.lineTo(476,145);	
			hit_bottle_g.graphics.lineTo(516,145);	
			hit_bottle_g.graphics.lineTo(531,158);	
			hit_bottle_g.graphics.lineTo(525,301);	
			
			hit_bottle_g.graphics.endFill(false);
			hit_bottle_g.alpha = 0.0;
			
			hit_bottle_g.graphics.precisionHitTest = true;	
			
			
			hit_bottle_a = new Shape();
			hit_bottle_a.touchable = false;
			hit_bottle_a.graphics.beginFill(0xff0000);
			
			hit_bottle_a.graphics.lineTo(533,289);	
			hit_bottle_a.graphics.lineTo(540,145);	
			hit_bottle_a.graphics.lineTo(590,143);	
			hit_bottle_a.graphics.lineTo(596,155);	
			hit_bottle_a.graphics.lineTo(589,295);	
			
			hit_bottle_a.graphics.endFill(false);
			hit_bottle_a.alpha = 0.0;
			
			hit_bottle_a.graphics.precisionHitTest = true;	
			
			
			hit_bottle_c = new Shape();
			hit_bottle_c.touchable = false;
			hit_bottle_c.graphics.beginFill(0xff0000);
			
			hit_bottle_c.graphics.lineTo(598,289);	
			hit_bottle_c.graphics.lineTo(607,142);	
			hit_bottle_c.graphics.lineTo(664,145);	
			hit_bottle_c.graphics.lineTo(656,290);	
			
			hit_bottle_c.graphics.endFill(false);
			hit_bottle_c.alpha = 0.0;
			
			hit_bottle_c.graphics.precisionHitTest = true;	
			
			
			hit_bottle_t = new Shape();
			hit_bottle_t.touchable = false;
			hit_bottle_t.graphics.beginFill(0xff0000);
			
			hit_bottle_t.graphics.lineTo(670,138);	
			hit_bottle_t.graphics.lineTo(725,144);	
			hit_bottle_t.graphics.lineTo(713,286);	
			hit_bottle_t.graphics.lineTo(659,284);	
			
			hit_bottle_t.graphics.endFill(false);
			hit_bottle_t.alpha = 0.0;
			
			hit_bottle_t.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_bottle_g);
			this.addChild(hit_bottle_a);
			this.addChild(hit_bottle_c);
			this.addChild(hit_bottle_t);
		}
		
		private function CreateLeverHits():void{
			hit_lever_g = new Shape();
			hit_lever_g.touchable = false;
			hit_lever_g.graphics.beginFill(0xff0000);
			
			hit_lever_g.graphics.lineTo(480,339);	
			hit_lever_g.graphics.lineTo(488,322);	
			hit_lever_g.graphics.lineTo(548,318);	
			hit_lever_g.graphics.lineTo(557,329);	
			hit_lever_g.graphics.lineTo(538,385);	
			hit_lever_g.graphics.lineTo(524,385);	
		
			hit_lever_g.graphics.endFill(false);
			hit_lever_g.alpha = 0.0;
			
			hit_lever_g.graphics.precisionHitTest = true;	
			
			
			hit_lever_a = new Shape();
			hit_lever_a.touchable = false;
			hit_lever_a.graphics.beginFill(0xff0000);
			
			hit_lever_a.graphics.lineTo(557,339);	
			hit_lever_a.graphics.lineTo(561,324);	
			hit_lever_a.graphics.lineTo(622,321);	
			hit_lever_a.graphics.lineTo(628,337);	
			hit_lever_a.graphics.lineTo(612,382);	
			hit_lever_a.graphics.lineTo(595,381);	
		
			hit_lever_a.graphics.endFill(false);
			hit_lever_a.alpha = 0.0;
			
			hit_lever_a.graphics.precisionHitTest = true;	
			
			
			hit_lever_c = new Shape();
			hit_lever_c.touchable = false;
			hit_lever_c.graphics.beginFill(0xff0000);
			
			hit_lever_c.graphics.lineTo(626,320);	
			hit_lever_c.graphics.lineTo(629,312);	
			hit_lever_c.graphics.lineTo(687,307);	
			hit_lever_c.graphics.lineTo(689,313);	
			hit_lever_c.graphics.lineTo(675,371);	
			hit_lever_c.graphics.lineTo(663,371);	
						
			hit_lever_c.graphics.endFill(false);
			hit_lever_c.alpha = 0.0;
			
			hit_lever_c.graphics.precisionHitTest = true;	
			
			
			hit_lever_t = new Shape();
			hit_lever_t.touchable = false;
			hit_lever_t.graphics.beginFill(0xff0000);
			
			hit_lever_t.graphics.lineTo(686,324);	
			hit_lever_t.graphics.lineTo(694,311);	
			hit_lever_t.graphics.lineTo(748,307);	
			hit_lever_t.graphics.lineTo(748,316);	
			hit_lever_t.graphics.lineTo(739,368);	
			hit_lever_t.graphics.lineTo(721,364);	
			
			hit_lever_t.graphics.endFill(false);
			hit_lever_t.alpha = 0.0;
			
			hit_lever_t.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_lever_g);
			this.addChild(hit_lever_a);
			this.addChild(hit_lever_c);
			this.addChild(hit_lever_t);
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
							
							FadeOut((GeneticsRoom as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomObj,true
							);
						}else if(hit_microscope.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							EyesHandler();						
						}else if(hit_dna.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DNAHandler();			
						}else if(hit_hose.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							HoseHandler();
						}else if(hit_wheel.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							WheelHandler();
						}else if(hit_lever_g.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LeverHandler('g');
						}else if(hit_lever_a.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LeverHandler('a');
						}else if(hit_lever_c.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LeverHandler('c');
						}else if(hit_lever_t.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LeverHandler('t');
							
						}else if(hit_bottle_a.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BottleHandler(e);
						}else if(hit_bottle_c.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BottleHandler(e);
						}else if(hit_test_tube.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							TestTubeHandler();
						}
					}
				}
			}
		}
		private function TestTubeHandler():void{
			
			if(TestTubeFilled === true){
				if(TestTubePickedUp === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_TestTube,
						'item_TestTube',
						'inven_testTube_sm'
					);
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron;	
					}
					TestTubePickedUp = true;
					test_tube.alpha = 0;
					test_tube_full.alpha = 0;
					SaveArray['TestTubePickedUp'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomElectron',SaveArray);
				
				}else{
					
				}
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An empty test tube is fixed to the machine, it seems to connect to some type of pump or siphon");
			}
		}
		
		private function BottleHandler(e:Event):void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_BottleG)
				
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				bottle_a_full.alpha = 1;
				Bottle_a_Attached = true;
				
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron;
				}
				SaveArray['Bottle_a_Attached'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomElectron',SaveArray);
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_BottleG,
						"item_BottleG"
					);
			}else{
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_BottleC)
					
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
					bottle_c_full.alpha = 1;
					Bottle_c_Attached = true;
					
					
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron;
					}
					SaveArray['Bottle_c_Attached'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomElectron',SaveArray);
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_BottleC,
							"item_BottleC"
						);
				}else if(hit_bottle_a.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
					if(Bottle_a_Attached === true){
						if(Bottle_a_Drained === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'A' is for adenine.");
						}else{
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The bottle is now attached to the device");
						}
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is an empty space for another bottle.");
					}
				}else if(hit_bottle_c.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
					if(Bottle_c_Attached === true){
						if(Bottle_c_Drained === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'C' is for cytosine.");
						}else{
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The bottle is now attached to the device");
						}
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is an empty space for another bottle.");
					}
				}
			}
			
		}
		
		private function LeverHandler(pos:String):void{
			if(WheelTurned === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The lever is locked in place.");
				
			}else{
				if(this['Bottle_'+pos+'_Attached'] === true){
					if(this['Bottle_'+pos+'_Drained'] === true){
						
					}else{
						
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirDecompress();
						this['Bottle_'+pos+'_Drained'] = true;
						this['lever_'+pos].texture = this.assets.getTexture('lever_'+pos+'_left');
						
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron;
						}
						SaveArray['lever_'+pos] = 'Yes';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomElectron',SaveArray);
						
						
						BottleTween = new Tween(this['bottle_'+pos+'_empty'], 1, Transitions.LINEAR);
						BottleTween.fadeTo(1);
						BottleTween.onComplete = function():void{			
							//	CompleteDNAAnimation();
							Animating = false;
							BottleTween = null;
							
						};
						
						
						Starling.juggler.add(BottleTween);	
					}
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The lever won't budge.");
				}
			}
			
		}
		
		private function WheelHandler():void{
			trace("Barf");
			if(WheelTurned === false){
				if(HoseAttached === true){
					Animating = true;
					WheelTurned = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron;
					}
					SaveArray['WheelTurned'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomElectron',SaveArray);
				
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpen();
					if(WheelPos === false){
						WheelPos = true;
						wheel.alpha = 1;
					}else{
						WheelPos = false;
						wheel.alpha = 0;
					}
					AnimateDNAOne();
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpen();
					if(WheelPos === false){
						WheelPos = true;
						wheel.alpha = 1;
					}else{
						WheelPos = false;
						wheel.alpha = 0;
					}
				}
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The wheel won't move; it's under great pressure.");
			}
			
		}
		/*
		private var DNATweenOne:Tween;
		private var DNATweenTwo:Tween;
		private var DNACylanderTween:Tween;
		*/
		private function AnimateDNAOne():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MachineTwo();
			DNATweenOne = new Tween(dna_container_flow, 2, Transitions.LINEAR);
			DNATweenOne.fadeTo(1);
			DNATweenOne.onComplete = function():void{
				AnimateDNATwo();
				
				DNATweenOne = null;
				
			};
			DNACylanderTween  = new Tween(indicator, 4, Transitions.EASE_IN);
			DNACylanderTween.fadeTo(1);
			DNACylanderTween.onComplete = function():void{			
				
				DNACylanderTween = null;
				
			};
			Starling.juggler.add(DNATweenOne);	 
			Starling.juggler.add(DNACylanderTween);	
		}
		private function AnimateDNATwo():void{
			dna_container.texture = this.assets.getTexture('dna_container_empty');
			
			EyesTween = new Tween(eyes, 2, Transitions.LINEAR);
			EyesTween.fadeTo(1);
			EyesTween.onComplete = function():void{			
				//	CompleteDNAAnimation();
				
				EyesTween = null;
				
			};
			
			
			DNATweenTwo = new Tween(dna_container_flow, 2, Transitions.LINEAR);
			DNATweenTwo.fadeTo(0);
			DNATweenTwo.onComplete = function():void{			
			//	CompleteDNAAnimation();
				Animating = false;
				DNATweenTwo = null;
				
			};
			 
		
			Starling.juggler.add(EyesTween);	
			Starling.juggler.add(DNATweenTwo);	
			
		}
	
		
		private function HoseHandler():void{
			if(DNAAttached === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A thick piece of polymer tubing connects to the machine.");
			}else{
				if(HoseAttached === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PopOne();
					black_tube_off.alpha = 0;
					black_tube_on.alpha = 1;
					HoseAttached = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron;
					}
					SaveArray['HoseAttached'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomElectron',SaveArray);
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The tubing now connects the container to the machine.");
				}
			}
		}
		
		private function DNAHandler():void{
			if(DNAAttached === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_DNAJar)
					
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
					
					dna_container.alpha = 1;
					DNAAttached = true;
					hit_dna._graphics.clear();
					CreateDNAHit(true);
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron;
					}
					SaveArray['DNAAttached'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomElectron',SaveArray);
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_DNAJar,
							"item_DNAJar"
						);
					
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Some object is clearly meant to fit here.");
				}
			}else{
				if(HoseAttached === true){
					if(WheelTurned === true){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The container is empty.");
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is fluid still inside the container.");
					}
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There's a valve on the top of the container...");
				}
			}
			
		}
		
		private function EyesHandler():void{
			if(DNAAttached === true){
				if(HoseAttached === true){
					if(WheelTurned === true){
						FadeOut((GeneticsRoomMicroscope as Class), 
							(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomMicroscopeObj,false
						);
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I still can't see anything through the eye-piece.");
					}
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There's nothing to see when I look through the viewfinder.");
				}
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There's only darkness visible through the viewfinder.");
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
			
			
			
			this.assets.removeTexture("geneticsRoomElectron_bg",true);
			this.assets.removeTexture("GeneticsRoomElectron_Sprite_01",true);
			this.assets.removeTextureAtlas("GeneticsRoomElectron_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomElectron_01");
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomElectron_02");
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomElectron_03");
			
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
