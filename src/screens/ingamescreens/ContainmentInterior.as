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
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.extensions.PDParticleSystem;
	import starling.utils.AssetManager;
	
	public class ContainmentInterior extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var blackhole:Image;
		private var wormHole:PDParticleSystem;
		private var quantum_shine:Image;
		private var quantum_shineWhole:Image;
		private var quanta_mc:MovieClip;
		private var spinner_mc:MovieClip;
		
		private var calibrate_static_mc:MovieClip;
		private var calibrate_screen_two_mc:MovieClip;
		private var calibrate_screen_one_mc:MovieClip;
		private var calibrate_screen_zero_mc:MovieClip;
		private var calibrate_indicator_blue:MovieClip;
		private var calibrate_indicator_orange:MovieClip;
		private var calibrate_lever:Image;
		private var calibrate_pos_00:Image;
		private var calibrate_pos_01:Image;
		private var calibrate_pos_02:Image;
		private var calibrate_pos_03:Image;
		private var calibrate_pos_04:Image;
		private var calibrate_pos_05:Image;
		private var calibrate_pos_06:Image;
		private var calibrate_pos_07:Image;
		
		private var console_fuse_blue:Image;
		private var console_fuse_green:Image;
		private var console_fuse_red:Image;
		private var console_screen_four_mc:MovieClip;
		private var console_screen_three_mc:MovieClip;
		private var console_screen_two_mc:MovieClip;
		private var console_screen_ulam_mc:MovieClip;
		private var console_screen_zero_mc:MovieClip;
		private var console_screen_zero_still:Image;
		
		private var hit_calibrator:Shape;
		private var hit_console:Shape;
		private var hit_quantum:Shape;
		
		private var QuantaFadeTween:Tween;
		
		private var Animating:Boolean = false;
	//	private var SpinnerOn:Boolean = false;
		private var ConsoleOn:Boolean = false;
		private var PreviousStartUp:Boolean = false;
		
		private var CalibratorSolved:Boolean = false;
		private var QuantaOn:Boolean = false;
		
		private var BlackHoleTween:Tween;
		private var UlamSolved:Boolean = false;
		private var BlackHoleOn:Boolean = false;
		
		private var QuantumRedAttached:Boolean = false;
		private var QuantumGreenAttached:Boolean = false;
		private var QuantumBlueAttached:Boolean = false;
		
		private var delayedCall:DelayedCall;
		
		private var ColorArray:Array = new Array(
			'deepblue',
			'green',
			'lightblue',
			'magenta',
			'orange',
			'puke',
			'purple',
			'red'
		);
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		private var RONum:int = 0;	
		
		public function ContainmentInterior(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('containmentInterior_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentInterior/containmentInterior_bg.jpg'));
				game.TrackAssets('containmentInterior_01');
			}
			if(game.CheckAsset('containmentInterior_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentInterior/ContainmentInterior_Sprite_03.png'));
				game.TrackAssets('containmentInterior_02');
			}
			if(game.CheckAsset('containmentInterior_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentInterior/ContainmentInterior_Sprite_03.xml'));
				game.TrackAssets('containmentInterior_03');
			}
			if(game.CheckAsset('containmentInterior_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentInterior/ContainmentInterior_Sprite_02.png'));
				game.TrackAssets('containmentInterior_04');
			}
			if(game.CheckAsset('containmentInterior_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentInterior/ContainmentInterior_Sprite_02.xml'));
				game.TrackAssets('containmentInterior_05');
			}
			if(game.CheckAsset('containmentInterior_06') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/particles/wormhole2/wormhole.pex'));
				game.TrackAssets('containmentInterior_06');
			}
			if(game.CheckAsset('containmentInterior_07') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/particles/wormhole2/wormhole.png'));
				game.TrackAssets('containmentInterior_07');
			}
			//ContainmentInterior_Sprite_01
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ContainmentInterior","ContainmentInteriorObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			
			
			bg = new Image(this.assets.getTexture('containmentInterior_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
		//	toggle_switch.texture = ;
			blackhole = new Image((stage.getChildAt(0) as Object).ContainmentInteriorImages.assets.getTexture("blackhole"));
		//	blackhole = new Image(this.assets.getTexture('blackhole'));
			blackhole.touchable = false;
			blackhole.pivotX = 177;
			blackhole.pivotY = 177;
			blackhole.width = 123;
			blackhole.height = 123;
			blackhole.x = 400;
			blackhole.y = 151;
			
			quantum_shineWhole = new Image((stage.getChildAt(0) as Object).ContainmentInteriorImages.assets.getTexture("quantum_shine_whole"));
		//	quantum_shineWhole = new Image(this.assets.getTexture('quantum_shine_whole'));
			quantum_shineWhole.touchable = false;
			quantum_shineWhole.pivotX = 61.5;
			quantum_shineWhole.pivotY = 61.5;
			quantum_shineWhole.x = 338+61.5;
			quantum_shineWhole.y = 90+61.5;
			
			quantum_shine = new Image((stage.getChildAt(0) as Object).ContainmentInteriorImages.assets.getTexture("quantum_shine"));
		//	quantum_shine = new Image(this.assets.getTexture('quantum_shine'));
			quantum_shine.touchable = false;
			quantum_shine.pivotX = 120;
			quantum_shine.pivotY = 121.5;
			quantum_shine.x = 276+120;
			quantum_shine.y = 29+121.5;
			
			quanta_mc = new MovieClip((stage.getChildAt(0) as Object).ContainmentInteriorImages.assets.getTextures("quantum_quanta_ball_"),12);
		//	quanta_mc = new MovieClip(this.assets.getTextures("quantum_quanta_ball_"),12);
			quanta_mc.x = 350;
			quanta_mc.y = 103;
			quanta_mc.touchable = false;
			quanta_mc.loop = true; 
			quanta_mc.play();
				
			spinner_mc = new MovieClip((stage.getChildAt(0) as Object).ContainmentInteriorImages.assets.getTextures("quantum_spinner_").reverse(),16);
		//	spinner_mc = new MovieClip(this.assets.getTextures("quantum_spinner_").reverse(),16);
			spinner_mc.x = 254;
			spinner_mc.y = 6;
			spinner_mc.touchable = false;
			spinner_mc.loop = true; 
			spinner_mc.stop();
			spinner_mc.currentFrame = 23;
			
			
			calibrate_static_mc = new MovieClip(this.assets.getTextures("calibrate_static_"),16);
			calibrate_static_mc.touchable = false;
			calibrate_static_mc.x = 23;
			calibrate_static_mc.y = 139;
			
			calibrate_static_mc.loop = true; 
			calibrate_static_mc.play();
			
			calibrate_screen_one_mc = new MovieClip(this.assets.getTextures("calibrate_screen_one_"),1);
			calibrate_screen_one_mc.touchable = false;
			calibrate_screen_one_mc.x = 65;
			calibrate_screen_one_mc.y = 99;
			calibrate_screen_one_mc.loop = true; 
			calibrate_screen_one_mc.play();
			
			calibrate_screen_two_mc = new MovieClip(this.assets.getTextures("calibrate_screen_two_"),2);
			calibrate_screen_two_mc.touchable = false;
			calibrate_screen_two_mc.x = 101;
			calibrate_screen_two_mc.y = 105;
			calibrate_screen_two_mc.loop = true; 
			calibrate_screen_two_mc.play();
			
			calibrate_screen_zero_mc = new MovieClip(this.assets.getTextures("calibrate_screen_zero_"),3);
			calibrate_screen_zero_mc.touchable = false;
			calibrate_screen_zero_mc.x = 12;
			calibrate_screen_zero_mc.y = 137;
			
			calibrate_screen_zero_mc.loop = true; 
			calibrate_screen_zero_mc.play();
			
			
			calibrate_indicator_blue = new MovieClip(this.assets.getTextures("calibrate_indicator_blue_"),4);
			calibrate_indicator_blue.touchable = false;
			calibrate_indicator_blue.x = 119;
			calibrate_indicator_blue.y = 134;
			
			calibrate_indicator_blue.loop = true; 
			calibrate_indicator_blue.play();
			
			calibrate_indicator_orange = new MovieClip(this.assets.getTextures("calibrate_indicator_orange_"),4);
			calibrate_indicator_orange.touchable = false;
			calibrate_indicator_orange.x = 119;
			calibrate_indicator_orange.y = 134;
			
			calibrate_indicator_orange.loop = true; 
			calibrate_indicator_orange.play();
			
			
			calibrate_lever = new Image(this.assets.getTexture('calibrate_lever_up'));
			calibrate_lever.touchable = false;
			calibrate_lever.x = 159;
			calibrate_lever.y = 150;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentUlam != undefined){
				//UlamSolved
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentUlam['Solved'] == 'Yes'){
					UlamSolved = true;
				}
			}
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['Solved'] == 'Yes'){
					CalibratorSolved = true;
				}
				//CalibratorSolved
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['ToggleSwitchDown'] == 'Yes'){
					trace("TOGGLE TOGGLE DOWN");
					calibrate_lever.texture = this.assets.getTexture('calibrate_lever_down');
					calibrate_lever.alpha = 1;
					calibrate_indicator_orange.alpha = 1;
					calibrate_indicator_blue.alpha = 0;
				}else{
					calibrate_indicator_orange.alpha = 0;
					calibrate_indicator_blue.alpha = 1;
				}
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['0_ColorArray'] != null){
					ColorArray[0] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['0_ColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['1_ColorArray'] != null){
					ColorArray[1] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['1_ColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['2_ColorArray'] != null){
					ColorArray[2] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['2_ColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['3_ColorArray'] != null){
					ColorArray[3] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['3_ColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['4_ColorArray'] != null){
					ColorArray[4] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['4_ColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['5_ColorArray'] != null){
					ColorArray[5] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['5_ColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['6_ColorArray'] != null){
					ColorArray[6] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['6_ColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['7_ColorArray'] != null){
					ColorArray[7] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['7_ColorArray'];
				}
			}else{
				calibrate_indicator_orange.alpha = 0;
				calibrate_indicator_blue.alpha = 1;
				
			}
			
			
			calibrate_pos_00 = new Image(this.assets.getTexture('calibrate_pos_00_'+ColorArray[0]));
			calibrate_pos_00.touchable = false;
			calibrate_pos_00.x = 47;
			calibrate_pos_00.y = 140;
			
			calibrate_pos_01 = new Image(this.assets.getTexture('calibrate_pos_01_'+ColorArray[1]));
			calibrate_pos_01.touchable = false;
			calibrate_pos_01.x = 76;
			calibrate_pos_01.y = 140;
			
			calibrate_pos_02 = new Image(this.assets.getTexture('calibrate_pos_02_'+ColorArray[2]));
			calibrate_pos_02.touchable = false;
			calibrate_pos_02.x = 23;
			calibrate_pos_02.y = 170;
			
			calibrate_pos_03 = new Image(this.assets.getTexture('calibrate_pos_03_'+ColorArray[3]));
			calibrate_pos_03.touchable = false;
			calibrate_pos_03.x = 47;
			calibrate_pos_03.y = 168;
			
			trace("ColorArray[4]:"+ColorArray[4]);
			
			calibrate_pos_04 = new Image(this.assets.getTexture('calibrate_pos_04_'+ColorArray[4]));
			calibrate_pos_04.touchable = false;
			calibrate_pos_04.x = 76;
			calibrate_pos_04.y = 166;
			
			calibrate_pos_05 = new Image(this.assets.getTexture('calibrate_pos_05_'+ColorArray[5]));
			calibrate_pos_05.touchable = false;
			calibrate_pos_05.x = 101;
			calibrate_pos_05.y = 165;
			
			calibrate_pos_06 = new Image(this.assets.getTexture('calibrate_pos_06_'+ColorArray[6]));
			calibrate_pos_06.touchable = false;
			calibrate_pos_06.x = 52;
			calibrate_pos_06.y = 202;
			
			calibrate_pos_07 = new Image(this.assets.getTexture('calibrate_pos_07_'+ColorArray[7]));
			calibrate_pos_07.touchable = false;
			calibrate_pos_07.x = 83;
			calibrate_pos_07.y = 199;
			
			
			console_fuse_blue= new Image(this.assets.getTexture('console_fuse_blue'));
			console_fuse_blue.touchable = false;
			console_fuse_blue.x = 600;
			console_fuse_blue.y = 209;
			
			console_fuse_green= new Image(this.assets.getTexture('console_fuse_green'));
			console_fuse_green.touchable = false;
			console_fuse_green.x = 576;
			console_fuse_green.y = 210;
			
			console_fuse_red = new Image(this.assets.getTexture('console_fuse_red'));
			console_fuse_red.touchable = false;
			console_fuse_red.x = 551;
			console_fuse_red.y = 211;
			
			console_screen_four_mc = new MovieClip(this.assets.getTextures("console_screen_four_mc_"),1);
			console_screen_four_mc.touchable = false;
			console_screen_four_mc.x = 665;
			console_screen_four_mc.y = 138;
			console_screen_four_mc.play();
			
			console_screen_three_mc = new MovieClip(this.assets.getTextures("console_screen_three_"),3);
			console_screen_three_mc.touchable = false;
			console_screen_three_mc.x = 689;
			console_screen_three_mc.y = 200;
			console_screen_three_mc.play();
			
			console_screen_two_mc = new MovieClip(this.assets.getTextures("console_screen_two_mc_"),5);
			console_screen_two_mc.touchable = false;
			console_screen_two_mc.x = 621;
			console_screen_two_mc.y = 184;
			console_screen_two_mc.play();
			
			console_screen_ulam_mc = new MovieClip(this.assets.getTextures("console_screen_ulam_"),2);
			console_screen_ulam_mc.touchable = false;
			console_screen_ulam_mc.x = 507;
			console_screen_ulam_mc.y = 250;
			console_screen_ulam_mc.play();
			
			console_screen_zero_mc = new MovieClip(this.assets.getTextures("console_screen_zero_mc_00"),8);
			console_screen_zero_mc.touchable = false;
			console_screen_zero_mc.x = 645;
			console_screen_zero_mc.y = 233;
			console_screen_zero_mc.play();
			
			
			console_screen_zero_mc.addFrameAt(1,this.assets.getTexture("console_screen_zero_mc_01"), null, 0.125);
			console_screen_zero_mc.addFrameAt(2,this.assets.getTexture("console_screen_zero_mc_02"), null, 0.125);
			console_screen_zero_mc.addFrameAt(3,this.assets.getTexture("console_screen_zero_mc_03"), null, 0.125);
			console_screen_zero_mc.addFrameAt(4,this.assets.getTexture("console_screen_zero_mc_02"), null, 0.125);
			console_screen_zero_mc.addFrameAt(3,this.assets.getTexture("console_screen_zero_mc_01"), null, 0.125);
			
			console_screen_zero_still = new Image(this.assets.getTexture('console_screen_zero_stopped'));
			console_screen_zero_still.touchable = false;
			console_screen_zero_still.x = 645;
			console_screen_zero_still.y = 233;
			
			wormHole = new PDParticleSystem(this.assets.getXml('wormhole'),this.assets.getTexture('wormhole'));			
			wormHole.x = 400;
			wormHole.y = 151;
			//wormHole.scaleX = 9;
			//wormHole.scaleY = 4;
			//	rain.rotation = deg2rad(45);
			Starling.juggler.add(wormHole);
		//	this.addChildAt(wormHole,3);
			wormHole.stop();
		
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentConsole != undefined){
				trace("RUFF 00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentConsole['SpinnerOn'] == 'Yes'){
					trace("RUFF 01");
					ConsoleOn = true;
					
				}
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior != undefined){
				trace("RUFF 02");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior['BlackHoleOn'] == 'Yes'){
					trace("YEKKO");
					BlackHoleOn = true;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior['PreviousStartUp'] == 'Yes'){
					trace("RUFF 03");
					PreviousStartUp = true;
				}
				//QuantaOn
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior['QuantaOn'] == 'Yes'){
					trace("RUFF 10");
					QuantaOn = true;
				}
				
				if(CalibratorSolved === true){						
					trace('MUNCH 00');
					if(QuantaOn === true){
						trace('MUNCH 01');
						quantum_shine.alpha = 1;
						quanta_mc.alpha = 1;
						
						if(UlamSolved === true){
							trace('MUNCH 02');
							if(BlackHoleOn === true){
								trace('MUNCH 03');
								spinner_mc.stop();
								spinner_mc.currentFrame = 23;
								quantum_shineWhole.width = 20;
								quantum_shineWhole.height = 20;
								quantum_shine.alpha = 0;
								blackhole.width = 354;
								blackhole.height = 354;
								blackhole.alpha = 1;
								quanta_mc.stop();
								quanta_mc.alpha = 0;
								
								//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerPulse();
								
								Starling.juggler.delayCall(function():void{
									wormHole.start()
								},0.5);
								
							}else{
								trace('MUNCH 04');
								
								QuantaOn = true;
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior != undefined){
									trace("COCK SURE 01");
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior;
								}
							
								blackhole.alpha = 0;
								
								SaveArray['BlackHoleOn'] = 'Yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentInterior',SaveArray);
								
								Starling.juggler.delayCall(FadeInBlackHole,2.5);
							}
						}else{
							trace('MUNCH 05');
							blackhole.alpha = 0;
						}
						
					}else{
						trace('MUNCH 05');
						quantum_shine.alpha = 0;
						quanta_mc.alpha = 0;
						QuantaOn = true;
						Animating = true;
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior != undefined){
							trace("RUFF 11");
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior;
						}
						//	spinner_mc.play();
						SaveArray['QuantaOn'] = 'Yes';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentInterior',SaveArray);
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerPulse();
						Starling.juggler.delayCall(FadeInQuanta,2);
						blackhole.alpha = 0;
					}
					
				}else{
					quantum_shine.alpha = 0;
					quanta_mc.alpha = 0;
					blackhole.alpha = 0;
				}
				
				if(ConsoleOn === true){
					trace("RUFF 04");
					if(PreviousStartUp === false){
						trace("RUFF 05");
						calibrate_static_mc.alpha = 1;
						calibrate_pos_00.alpha = 0;
						calibrate_pos_01.alpha = 0;
						calibrate_pos_02.alpha = 0;
						calibrate_pos_03.alpha = 0;
						calibrate_pos_04.alpha = 0;
						calibrate_pos_05.alpha = 0;
						calibrate_pos_06.alpha = 0;
						calibrate_pos_07.alpha = 0;
						
						Animating = true;
						console_screen_zero_still.texture = this.assets.getTexture('console_screen_zero_starting');
						console_screen_zero_mc.alpha = 0;
						console_screen_zero_still.alpha = 1;
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior != undefined){
							trace("RUFF 06");
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior;
						}
					//	spinner_mc.play();
						SaveArray['PreviousStartUp'] = 'Yes';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentInterior',SaveArray);
						
						Starling.juggler.delayCall(TurnSpinnerOn,2);
					}else{
						calibrate_static_mc.alpha = 0;
						calibrate_pos_00.alpha = 1;
						calibrate_pos_01.alpha = 1;
						calibrate_pos_02.alpha = 1;
						calibrate_pos_03.alpha = 1;
						calibrate_pos_04.alpha = 1;
						calibrate_pos_05.alpha = 1;
						calibrate_pos_06.alpha = 1;
						calibrate_pos_07.alpha = 1;
						
						console_screen_zero_mc.alpha = 1;
						console_screen_zero_still.alpha = 0;
						trace("RUFF 07");
						if(BlackHoleOn === false){
							if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('SpinLoop') === true){
								
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SpinLoop(999);
							}
							
							spinner_mc.play();
						}
						
						
						
					}
				}else{
					calibrate_static_mc.alpha = 1;
					calibrate_pos_00.alpha = 0;
					calibrate_pos_01.alpha = 0;
					calibrate_pos_02.alpha = 0;
					calibrate_pos_03.alpha = 0;
					calibrate_pos_04.alpha = 0;
					calibrate_pos_05.alpha = 0;
					calibrate_pos_06.alpha = 0;
					calibrate_pos_07.alpha = 0;
					
					
				}
			}else{
				trace("RUFF 08");
				if(ConsoleOn === true){
					trace("RUFF 09");
					calibrate_static_mc.alpha = 1;
					calibrate_pos_00.alpha = 0;
					calibrate_pos_01.alpha = 0;
					calibrate_pos_02.alpha = 0;
					calibrate_pos_03.alpha = 0;
					calibrate_pos_04.alpha = 0;
					calibrate_pos_05.alpha = 0;
					calibrate_pos_06.alpha = 0;
					calibrate_pos_07.alpha = 0;
					
					console_screen_zero_still.texture = this.assets.getTexture('console_screen_zero_starting');
					console_screen_zero_mc.alpha = 0;
					console_screen_zero_still.alpha = 1;
					
					Animating = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior;
					}
					//spinner_mc.play();
					SaveArray['PreviousStartUp'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentInterior',SaveArray);
					
					Starling.juggler.delayCall(TurnSpinnerOn,2);
					
					
				}else{
					console_screen_zero_mc.alpha = 0;
					console_screen_zero_still.alpha = 1;
					
					calibrate_static_mc.alpha = 1;
					calibrate_pos_00.alpha = 0;
					calibrate_pos_01.alpha = 0;
					calibrate_pos_02.alpha = 0;
					calibrate_pos_03.alpha = 0;
					calibrate_pos_04.alpha = 0;
					calibrate_pos_05.alpha = 0;
					calibrate_pos_06.alpha = 0;
					calibrate_pos_07.alpha = 0;
					
				
				}
				
					blackhole.alpha = 0;
					quantum_shine.alpha = 0;
					quanta_mc.alpha = 0;
				
			}
		
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum['WholeShine'] == 'Yes'){
					quantum_shineWhole.alpha = 1;
				}else{
					quantum_shineWhole.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum['RedAttached'] == 'Yes'){
					QuantumRedAttached = true;
					console_fuse_red.alpha = 1;
				}else{
					console_fuse_red.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum['GreenAttached'] == 'Yes'){
					QuantumGreenAttached = true;
					console_fuse_green.alpha = 1;
				}else{
					console_fuse_green.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentQuantum['BlueAttached'] == 'Yes'){
					QuantumBlueAttached = true;
					console_fuse_blue.alpha = 1
				}else{
					console_fuse_blue.alpha = 0;
				}
			}else{
				console_fuse_blue.alpha = 0;
				console_fuse_green.alpha = 0;
				console_fuse_red.alpha = 0;
				quantum_shineWhole.alpha = 0;
			}
			
			if(QuantumRedAttached === true){
				if(QuantumGreenAttached === true){
					if(QuantumBlueAttached === true){
						if(ConsoleOn === true){
							console_screen_ulam_mc.alpha = 0;
						}else{
							console_screen_ulam_mc.alpha = 1;
						}
					}else{
						console_screen_ulam_mc.alpha = 1;
					}
				}else{
					console_screen_ulam_mc.alpha = 1;
				}
			}else{
				console_screen_ulam_mc.alpha = 1;
			}
			
		
			console_screen_four_mc.alpha = 1;
			console_screen_three_mc.alpha = 1;
			console_screen_two_mc.alpha = 1;
		
			
			
			calibrate_screen_zero_mc.alpha = 1;
			calibrate_screen_two_mc.alpha = 1;
			calibrate_screen_one_mc.alpha = 1;
			
		//	calibrate_indicator_blue.alpha = 1;
		//	calibrate_indicator_orange.alpha = 0;
			calibrate_lever.alpha = 1;
		
			
			
			if(BlackHoleOn === true){
				this.addChildAt(spinner_mc,1);
				this.addChildAt(blackhole,2);
				this.addChildAt(quantum_shineWhole,3);
				this.addChildAt(quantum_shine,4);
				this.addChildAt(quanta_mc,5);
				
				
			}else{
				this.addChildAt(blackhole,1);
				this.addChildAt(quantum_shineWhole,2);
				this.addChildAt(quantum_shine,3);
				this.addChildAt(quanta_mc,4);
				this.addChildAt(spinner_mc,5);
			}
			
			
			this.addChildAt(calibrate_screen_zero_mc,6);
			this.addChildAt(calibrate_screen_two_mc,7);
			this.addChildAt(calibrate_screen_one_mc,8);
			this.addChildAt(calibrate_static_mc,9);
			this.addChildAt(calibrate_indicator_blue,10);
			this.addChildAt(calibrate_indicator_orange,11);
			this.addChildAt(calibrate_lever,12);
			
			this.addChildAt(calibrate_pos_00,13);
			this.addChildAt(calibrate_pos_01,14);
			this.addChildAt(calibrate_pos_02,15);
			this.addChildAt(calibrate_pos_03,16);
			this.addChildAt(calibrate_pos_04,17);
			this.addChildAt(calibrate_pos_05,18);
			this.addChildAt(calibrate_pos_06,19);
			this.addChildAt(calibrate_pos_07,20);
			
			this.addChildAt(console_fuse_blue,21);
			this.addChildAt(console_fuse_green,22);
			this.addChildAt(console_fuse_red,23);
			this.addChildAt(console_screen_four_mc,24);
			this.addChildAt(console_screen_three_mc,25);
			this.addChildAt(console_screen_two_mc,26);
			this.addChildAt(console_screen_ulam_mc,27);
			this.addChildAt(console_screen_zero_mc,28);
			this.addChildAt(console_screen_zero_still,29);
			this.addChildAt(wormHole,30);
			
			/*
			this.addChildAt(wormHole,3);
			wormHole.stop();
			
			console_fuse_blue.alpha = 1;
			console_fuse_green.alpha = 1;
			console_fuse_red.alpha = 1;
		
			*/
			
			CreateCalibrateHit();
			CreateConsoleHit();
			CreateQuantumHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			Starling.juggler.add(spinner_mc);
			Starling.juggler.add(quanta_mc);
			Starling.juggler.add(calibrate_screen_zero_mc);
			Starling.juggler.add(calibrate_screen_two_mc);
			Starling.juggler.add(calibrate_screen_one_mc);
			Starling.juggler.add(calibrate_static_mc);
			Starling.juggler.add(calibrate_indicator_blue);
			Starling.juggler.add(calibrate_indicator_orange);
			
			Starling.juggler.add(console_screen_four_mc);
			Starling.juggler.add(console_screen_three_mc);
			Starling.juggler.add(console_screen_two_mc);
			Starling.juggler.add(console_screen_ulam_mc);
			Starling.juggler.add(console_screen_zero_mc);
			
			/*
			console_screen_four_mc.alpha = 1;
			console_screen_three_mc.alpha = 1;
			console_screen_two_mc.alpha = 1;
			console_screen_ulam_mc.alpha = 1;
			console_screen_zero_mc.alpha = 1;
			*/
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Darkness",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BuildingHum",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("QuantumBalls",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);			
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).AmbientObj.LoadSpaceHumPower(true,999);
				
			},0.5);
			delayedCall = new DelayedCall(LoadDrone,1);
			Starling.juggler.add(delayedCall);
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentInterior',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadDeepSpace(true,2);
							
						},0.5);
					}
				}
			}else{
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					//	SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab;
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentInterior',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadDeepSpace(true,3);
						
					},0.5);
				}
			}
			
			
			
		}
		private function LoadDrone():void{
			if(CalibratorSolved === true){
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadQuantumDrone(true,999);							
			
			}else{
				(stage.getChildAt(0) as Object).AmbientObj.LoadDuctVibe(true,999);
			}
			
			
			Starling.juggler.delayCall(function():void{
				if(BlackHoleOn === false){
					(stage.getChildAt(0) as Object).AmbientObj.LoadControlBeeps(true,999);
				}else{
					(stage.getChildAt(0) as Object).AmbientObj.LoadBlackHole(true,999);
				}
				
				
			},0.25);
		
		}
		//hit_calibrator
		//hit_console
	//hit_quantum
		private function FadeInBlackHole():void{
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ControlBeep",0,0.5,'stop');
			BlackHoleOn = true;
			(stage.getChildAt(0) as Object).MusicObj.LoadLightBeam(true,1);
			this.addChildAt(spinner_mc,1);
			BlackHoleTween = new Tween(blackhole, 3, Transitions.EASE_OUT);
			BlackHoleTween.fadeTo(1);
			BlackHoleTween.animate("width", 354);
			BlackHoleTween.animate("height", 354)
			//	game.SoundFXObj.PlaySFX_CosmicWaffle();
			BlackHoleTween.onComplete = function():void{
				//FadeInQuantaMc();
			//	Animating = false;
				FadeInOutQuanta();
			//	BlackHoleTween = null;
			}
			Starling.juggler.add(BlackHoleTween);
		}
		
		private function FadeInOutQuanta():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
			(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("SpinLoop");
			BlackHoleTween = null;
			wormHole.start();
			quanta_mc.stop();
			quanta_mc.alpha = 0;
			spinner_mc.stop();
			spinner_mc.currentFrame = 23;
			QuantaFadeTween = new Tween(quantum_shine, 1.5, Transitions.LINEAR);
			QuantaFadeTween.fadeTo(0);
			QuantaFadeTween.animate("width", ((quantum_shine.width)*4));
			QuantaFadeTween.animate("height", ((quantum_shine.height)*4))
			QuantaFadeTween.onComplete = function():void{
				quantum_shine.alpha = 0;
		//		quantum_shineWhole.alpha= 0;
			//	Animating = false;
				ShrinkWhole()
				QuantaFadeTween = null;
			}
			Starling.juggler.add(QuantaFadeTween);
		}
		
		private function ShrinkWhole():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TimeRip();
			BlackHoleTween = new Tween(quantum_shineWhole, 2.5, Transitions.EASE_OUT);
			
		//QuantaFadeTween.fadeTo(0);
			BlackHoleTween.animate("width", 20);
			BlackHoleTween.animate("height", 20)
			BlackHoleTween.onComplete = function():void{
				(stage.getChildAt(0) as Object).AmbientObj.LoadBlackHole(true,999);
				//quantum_shine.alpha = 0;
			//	quantum_shineWhole.alpha= 0;
				Animating = false;
				BlackHoleTween = null;
			}
			Starling.juggler.add(BlackHoleTween);
		}
		
		private function FadeInQuanta():void{
		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
			
			QuantaFadeTween = new Tween(quantum_shine, 1, Transitions.LINEAR);
			QuantaFadeTween.fadeTo(1);
		//	game.SoundFXObj.PlaySFX_CosmicWaffle();
			QuantaFadeTween.onComplete = function():void{
				FadeInQuantaMc();
			}
			Starling.juggler.add(QuantaFadeTween);
		}
		private function FadeInQuantaMc():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWave();
			QuantaFadeTween = new Tween(quanta_mc, 2, Transitions.LINEAR);
			QuantaFadeTween.fadeTo(1);
			//	game.SoundFXObj.PlaySFX_CosmicWaffle();
			QuantaFadeTween.onComplete = function():void{
				FadeInQuantaMcOnComplete();
				Animating = false;
			}
			Starling.juggler.add(QuantaFadeTween);
		}
		
		private function FadeInQuantaMcOnComplete():void{
			if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
				
				//Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).MusicObj.LoadSciFiWhistle(true,2);
					
			//	},0.5);
			}
		}
		
		private function TurnSpinnerOn():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerUp();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OhmTwo();
			calibrate_static_mc.alpha = 0;
			calibrate_pos_00.alpha = 1;
			calibrate_pos_01.alpha = 1;
			calibrate_pos_02.alpha = 1;
			calibrate_pos_03.alpha = 1;
			calibrate_pos_04.alpha = 1;
			calibrate_pos_05.alpha = 1;
			calibrate_pos_06.alpha = 1;
			calibrate_pos_07.alpha = 1;
			
			spinner_mc.play();
			Animating = false;
			
			if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('SpinLoop') === true){
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SpinLoop(999);
			}
			
			
		}
			
		
		private function CreateQuantumHit():void{
			hit_quantum = new Shape();
			hit_quantum.touchable = false;
			hit_quantum.graphics.beginFill(0xff0000);
			
			hit_quantum.graphics.lineTo(228,82);	
			hit_quantum.graphics.lineTo(309,4);	
			hit_quantum.graphics.lineTo(498,4);	
			hit_quantum.graphics.lineTo(571,82);	
			hit_quantum.graphics.lineTo(556,212);	
			hit_quantum.graphics.lineTo(498,292);	
			hit_quantum.graphics.lineTo(309,292);	
			hit_quantum.graphics.lineTo(228,212);	
			
			hit_quantum.graphics.endFill(false);
			hit_quantum.alpha = 0.0;
			
			hit_quantum.graphics.precisionHitTest = true;	
			this.addChild(hit_quantum);
		}
		
		private function CreateConsoleHit():void{
			hit_console = new Shape();
			hit_console.touchable = false;
			hit_console.graphics.beginFill(0xff0000);
			
			hit_console.graphics.lineTo(456,260);	
			hit_console.graphics.lineTo(482,243);	
			hit_console.graphics.lineTo(556,190);	
			hit_console.graphics.lineTo(609,180);	
			hit_console.graphics.lineTo(632,120);	
			hit_console.graphics.lineTo(741,129);	
			hit_console.graphics.lineTo(780,207);	
			hit_console.graphics.lineTo(736,362);	
			hit_console.graphics.lineTo(465,385);	
		
			hit_console.graphics.endFill(false);
			hit_console.alpha = 0.0;
			
			hit_console.graphics.precisionHitTest = true;	
			this.addChild(hit_console);
		}
		
		private function CreateCalibrateHit():void{
			hit_calibrator = new Shape();
			hit_calibrator.touchable = false;
			hit_calibrator.graphics.beginFill(0xff0000);
			
			hit_calibrator.graphics.lineTo(0,106);	
			hit_calibrator.graphics.lineTo(126,54);	
			hit_calibrator.graphics.lineTo(217,77);	
			hit_calibrator.graphics.lineTo(226,176);	
			hit_calibrator.graphics.lineTo(136,306);	
			hit_calibrator.graphics.lineTo(0,316);	
			
			hit_calibrator.graphics.endFill(false);
			hit_calibrator.alpha = 0.0;
			
			hit_calibrator.graphics.precisionHitTest = true;	
			this.addChild(hit_calibrator);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							if(BlackHoleOn === false){
								(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("SpinLoop");
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalSteps();
							//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((ContainmentHatch as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentHatchObj,false
								);
							}else{
								if(RONum == 0){
									RONum = 1;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The vortex... I can't escape it....");
								}else if(RONum == 1){
									RONum = 2;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The pull of the anomaly is too great.. I can only go forward....");;				
								}else if(RONum == 2){
									RONum = 0;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't go back, the gravity well is sucking me forward...");
								}
								
							}
						}else if(hit_calibrator.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(BlackHoleOn === false){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalSteps();
								FadeOut((ContainmentCalibrator as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentCalibratorObj,true
								);
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The pull of the vortex is too strong... All my strength is used just staying in one place.");
								
							}
						}else if(hit_console.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(BlackHoleOn === false){
								FadeOut((ContainmentConsole as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentConsoleObj,true
								);
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The pull of the vortex is too strong... All my strength is used just staying in one place.");
								
							}
						}else if(hit_quantum.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(ConsoleOn === false){
								
								if(BlackHoleOn === false){
									FadeOut((ContainmentQuantum as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentQuantumObj,true
									);
								}else{
									//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
								//	(stage.getChildAt(0) as Object).MusicObj.LoadLightBeam(true,1);
									FadeOut((OuttroWormhole as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.OuttroWormholeObj,true
									);
								}
								
							}else{
								if(BlackHoleOn === false){
									
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The machine is moving too fast, I can't get near it...");
								}else{
								
									FadeOut((OuttroWormhole as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.OuttroWormholeObj,true
									);
								}
								
							}
						}
					}
				}
			}
		}
		
		//ConsoleOn
		private function FadeOut(loadClass:Class,loadObj:Object,Fade:Boolean = false):void{
			trace("FADE OUT");
			this.removeEventListener(TouchEvent.TOUCH,TouchHandler);
			Starling.juggler.remove(delayedCall);
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
			
			
			
			this.assets.removeTexture("containmentInterior_bg",true);
			this.assets.removeTexture("ContainmentInterior_Sprite_03",true);
			this.assets.removeTextureAtlas("ContainmentInterior_Sprite_03",true);
			this.assets.removeTexture("ContainmentInterior_Sprite_02",true);
			this.assets.removeTextureAtlas("ContainmentInterior_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("containmentInterior_01");
			(stage.getChildAt(0) as Object).falseAsset("containmentInterior_02");
			(stage.getChildAt(0) as Object).falseAsset("containmentInterior_03");
			(stage.getChildAt(0) as Object).falseAsset("containmentInterior_04");
			(stage.getChildAt(0) as Object).falseAsset("containmentInterior_05");
			
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
