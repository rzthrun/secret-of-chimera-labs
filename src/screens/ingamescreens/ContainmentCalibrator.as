package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.DelayedCall;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;
	
	
	public class ContainmentCalibrator extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
	
		private var indicator_letter_mc:MovieClip;
		private var indicator_color_mc:MovieClip;
		private var screens_static_mc:MovieClip;
		
		private var pos_00_screen:Image;
		private var pos_00_letter:Image;		
		private var pos_01_screen:Image;
		private var pos_01_letter:Image;		
		private var pos_02_screen:Image;
		private var pos_02_letter:Image;	
		private var pos_03_screen:Image;
		private var pos_03_letter:Image;		
		private var pos_04_screen:Image;
		private var pos_04_letter:Image;		
		private var pos_05_screen:Image;
		private var pos_05_letter:Image;		
		private var pos_06_screen:Image;
		private var pos_06_letter:Image;		
		private var pos_07_screen:Image;
		private var pos_07_letter:Image;
		
		private var toggle_switch:Image;
		
		private var hit_toggle_switch:Shape;
		private var hit_pos_00:Shape;
		private var hit_pos_01:Shape;
		private var hit_pos_02:Shape;
		private var hit_pos_03:Shape;
		private var hit_pos_04:Shape;
		private var hit_pos_05:Shape;
		private var hit_pos_06:Shape;
		private var hit_pos_07:Shape;
		
		private var MouseCurrentAngle:Number = 180;
		private var MousePrevAngle:Number = 180;
		
		private var ToggleSwitchDown:Boolean = false;
		private var SwitchFlag:Boolean = false;
		
		private var delayedCall:DelayedCall;
		private var Solved:Boolean = false;
		
		private var RONum:int = 0;
		
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
		private var LetterArray:Array = new Array(
			0,
			1,
			2,
			3,
			4,
			5,
			6,
			7
		);
		private var LetterColorArray:Array = new Array(
			'white',
			'black',
			'black',
			'black',
			'black',
			'black',
			'white',
			'white'
		);
		
		private var Animating:Boolean = false;
		private var ConsoleOn:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		
		public function ContainmentCalibrator(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('containmentCalibrator_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentCalibrator/containmentCalibrator_bg.jpg'));
				game.TrackAssets('containmentCalibrator_01');
			}
			if(game.CheckAsset('containmentCalibrator_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentCalibrator/ContainmentCalibrator_Sprite_00.png'));
				game.TrackAssets('containmentCalibrator_02');
			}
			if(game.CheckAsset('containmentCalibrator_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentCalibrator/ContainmentCalibrator_Sprite_00.xml'));
				game.TrackAssets('containmentCalibrator_03');
			}
			if(game.CheckAsset('containmentCalibrator_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentCalibrator/ContainmentCalibrator_Sprite_01.png'));
				game.TrackAssets('containmentCalibrator_04');
			}
			if(game.CheckAsset('containmentCalibrator_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentCalibrator/ContainmentCalibrator_Sprite_01.xml'));
				game.TrackAssets('containmentCalibrator_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ContainmentCalibrator","ContainmentCalibratorObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		/*	if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior;
			}			
			SaveArray['PreviousStartUp'] = 'No';
			SaveArray['SpinnerOn'] = 'No';
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentInterior',SaveArray);
			
			SaveArray = new Array();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentConsole != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentConsole;
			}			
			SaveArray['PreviousStartUp'] = 'No';
			SaveArray['SpinnerOn'] = 'No';	
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentConsole',SaveArray);
		
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentInterior;
			}
			
		
			SaveArray['BlackHoleOn'] = 'No';
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentInterior',SaveArray);
		//	SaveArray = null;
			*/	
			
			bg = new Image(this.assets.getTexture('containmentCalibrator_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			/*
			private var indicator_letter_mc:MovieClip;
			private var indicator_color_mc:MovieClip;
			private var screens_static_mc:MovieClip;
			*/
			
			indicator_letter_mc = new MovieClip((stage.getChildAt(0) as Object).ContaimentCalibratorImages.assets.getTextures("screen_blue_0"),4);
		//	indicator_letter_mc = new MovieClip(this.assets.getTextures("screen_blue_0"),4);
			indicator_letter_mc.x = 498;
			indicator_letter_mc.y = 67;
			indicator_letter_mc.touchable = false;
			indicator_letter_mc.loop = true; 			
			indicator_letter_mc.play();
			
			indicator_color_mc = new MovieClip((stage.getChildAt(0) as Object).ContaimentCalibratorImages.assets.getTextures("screen_orange_0"),4);
			//indicator_color_mc = new MovieClip(this.assets.getTextures("screen_orange_0"),4);
			indicator_color_mc.x = 498;
			indicator_color_mc.y = 67;
			indicator_color_mc.touchable = false;
			indicator_color_mc.loop = true; 			
			indicator_color_mc.stop();
			
			screens_static_mc = new MovieClip((stage.getChildAt(0) as Object).ContaimentCalibratorImages.assets.getTextures("static_0"),8);
		//	screens_static_mc = new MovieClip(this.assets.getTextures("static_0"),8);
			screens_static_mc.x = 39;
			screens_static_mc.y = 47;
			screens_static_mc.touchable = false;
			screens_static_mc.loop = true; 			
			screens_static_mc.play();
			
			
			toggle_switch  = new Image((stage.getChildAt(0) as Object).ContaimentCalibratorImages.assets.getTexture("lever_up"));
			//toggle_switch  = new Image(this.assets.getTexture('lever_up'));
			toggle_switch.touchable = false;
			toggle_switch.x = 635;
			toggle_switch.y = 132;	
		
			//635
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentConsole != undefined){
				trace("RUFF 00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentConsole['SpinnerOn'] == 'Yes'){
					trace("RUFF 01");
					ConsoleOn = true;
					if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('SpinLoop') === true){
						
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SpinLoop(999);
					}
					
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['Solved'] == 'Yes'){
					Solved = true;
				}
				//Solved
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['ToggleSwitchDown'] == 'Yes'){
					ToggleSwitchDown = true;
					
					toggle_switch.texture = (stage.getChildAt(0) as Object).ContaimentCalibratorImages.assets.getTexture("lever_down");
					
					//toggle_switch.texture = (stage.getChildAt(0) as Object).ContaimentCalibratorImages.assets.getTexture("lever_down");
					//toggle_switch.texture = this.assets.getTexture('lever_down');
					indicator_letter_mc.alpha = 0;
					indicator_color_mc.alpha = 1;
										
					indicator_letter_mc.stop();
					indicator_color_mc.play();
				}else{
					indicator_letter_mc.alpha = 1;
					indicator_color_mc.alpha = 0;
				
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['0_LetterArray'] != null){
					LetterArray[0] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['0_LetterArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['1_LetterArray'] != null){
					LetterArray[1] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['1_LetterArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['2_LetterArray'] != null){
					LetterArray[2] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['2_LetterArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['3_LetterArray'] != null){
					LetterArray[3] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['3_LetterArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['4_LetterArray'] != null){
					LetterArray[4] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['4_LetterArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['5_LetterArray'] != null){
					LetterArray[5] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['5_LetterArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['6_LetterArray'] != null){
					LetterArray[6] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['6_LetterArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['7_LetterArray'] != null){
					LetterArray[7] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['7_LetterArray'];
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['0_LetterColorArray'] != null){
					LetterColorArray[0] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['0_LetterColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['1_LetterColorArray'] != null){
					LetterColorArray[1] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['1_LetterColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['2_LetterColorArray'] != null){
					LetterColorArray[2] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['2_LetterColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['3_LetterColorArray'] != null){
					LetterColorArray[3] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['3_LetterColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['4_LetterColorArray'] != null){
					LetterColorArray[4] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['4_LetterColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['5_LetterColorArray'] != null){
					LetterColorArray[5] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['5_LetterColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['6_LetterColor'] != null){
					LetterColorArray[6] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['6_LetterColorArray'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['7_LetterColor'] != null){
					LetterColorArray[7] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator['7_LetterColorArray'];
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
				indicator_letter_mc.alpha = 1;
				indicator_color_mc.alpha = 0;
				
			}
			pos_00_screen = new Image(this.assets.getTexture('pos_00_bg_'+ColorArray[0]));
			pos_00_screen.touchable = false;
			pos_00_screen.x = 206;
			pos_00_screen.y = 47;
			
			pos_00_letter  = new Image(this.assets.getTexture('pos_00_letter_0'+LetterArray[0]+'_'+LetterColorArray[0]));
			pos_00_letter.touchable = false;
			pos_00_letter.x = 219;
			pos_00_letter.y = 54;	
			
			
			pos_01_screen = new Image(this.assets.getTexture('pos_01_bg_'+ColorArray[1]));
			pos_01_screen.touchable = false;
			pos_01_screen.x = 341;
			pos_01_screen.y = 77;
			
			pos_01_letter  = new Image(this.assets.getTexture('pos_01_letter_0'+LetterArray[1]+'_'+LetterColorArray[1]));
			pos_01_letter.touchable = false;
			pos_01_letter.x = 349;
			pos_01_letter.y = 83;	
			
			
			pos_02_screen = new Image(this.assets.getTexture('pos_02_bg_'+ColorArray[2]));
			pos_02_screen.touchable = false;
			pos_02_screen.x = 39;
			pos_02_screen.y = 162;
			
			pos_02_letter  = new Image(this.assets.getTexture('pos_02_letter_0'+LetterArray[2]+'_'+LetterColorArray[2]));
			pos_02_letter.touchable = false;
			pos_02_letter.x = 46;
			pos_02_letter.y = 176;	
			
			
			pos_03_screen = new Image(this.assets.getTexture('pos_03_bg_'+ColorArray[3]));
			pos_03_screen.touchable = false;
			pos_03_screen.x = 201;
			pos_03_screen.y = 176;
			
			pos_03_letter  = new Image(this.assets.getTexture('pos_03_letter_0'+LetterArray[3]+'_'+LetterColorArray[3]));
			pos_03_letter.touchable = false;
			pos_03_letter.x = 204;
			pos_03_letter.y = 189;	
			
			
			pos_04_screen = new Image(this.assets.getTexture('pos_04_bg_'+ColorArray[4]));
			pos_04_screen.touchable = false;
			pos_04_screen.x = 337;
			pos_04_screen.y = 185;
			
			pos_04_letter  = new Image(this.assets.getTexture('pos_04_letter_0'+LetterArray[4]+'_'+LetterColorArray[4]));
			pos_04_letter.touchable = false;
			pos_04_letter.x = 341;
			pos_04_letter.y = 195;	
			
			
			pos_05_screen = new Image(this.assets.getTexture('pos_05_bg_'+ColorArray[5]));
			pos_05_screen.touchable = false;
			pos_05_screen.x = 433;
			pos_05_screen.y = 192;
			
			pos_05_letter  = new Image(this.assets.getTexture('pos_05_letter_0'+LetterArray[5]+'_'+LetterColorArray[5]));
			pos_05_letter.touchable = false;
			pos_05_letter.x = 437;
			pos_05_letter.y = 198;	
			
			
			pos_06_screen = new Image(this.assets.getTexture('pos_06_bg_'+ColorArray[6]));
			pos_06_screen.touchable = false;
			pos_06_screen.x = 211;
			pos_06_screen.y = 322;
			
			pos_06_letter  = new Image(this.assets.getTexture('pos_06_letter_0'+LetterArray[6]+'_'+LetterColorArray[6]));
			pos_06_letter.touchable = false;
			pos_06_letter.x = 220;
			pos_06_letter.y = 331;	
			
			
			pos_07_screen = new Image(this.assets.getTexture('pos_07_bg_'+ColorArray[7]));
			pos_07_screen.touchable = false;
			pos_07_screen.x = 353;
			pos_07_screen.y = 309;
			
			pos_07_letter  = new Image(this.assets.getTexture('pos_07_letter_0'+LetterArray[7]+'_'+LetterColorArray[7]));
			pos_07_letter.touchable = false;
			pos_07_letter.x = 358;
			pos_07_letter.y = 315;	
		
			/*
			
			SaveArray[pos+'_LetterArray'] = LetterArray[pos];
			SaveArray[pos+'_LetterColorArray'] = LetterColorArray[pos];
			
			SaveArray[pos+'_ColorArray'] = ColorArray[pos];
			SaveArray[pos+'LetterColorArray'] = LetterColorArray[pos];
			*/
			
			if(ConsoleOn === true){
				screens_static_mc.alpha = 0;
				
				pos_00_screen.alpha = 1;
				pos_00_letter.alpha = 1;
				pos_01_screen.alpha = 1;
				pos_01_letter.alpha = 1;
				pos_02_screen.alpha = 1;
				pos_02_letter.alpha = 1;
				pos_03_screen.alpha = 1;
				pos_03_letter.alpha = 1;
				pos_04_screen.alpha = 1;
				pos_04_letter.alpha = 1;
				pos_05_screen.alpha = 1;
				pos_05_letter.alpha = 1;
				pos_06_screen.alpha = 1;
				pos_06_letter.alpha = 1;
				pos_07_screen.alpha = 1;
				pos_07_letter.alpha = 1;
			}else{
				screens_static_mc.alpha = 1;
				
				pos_00_screen.alpha = 0;
				pos_00_letter.alpha = 0;
				pos_01_screen.alpha = 0;
				pos_01_letter.alpha = 0;
				pos_02_screen.alpha = 0;
				pos_02_letter.alpha = 0;
				pos_03_screen.alpha = 0;
				pos_03_letter.alpha = 0;
				pos_04_screen.alpha = 0;
				pos_04_letter.alpha = 0;
				pos_05_screen.alpha = 0;
				pos_05_letter.alpha = 0;
				pos_06_screen.alpha = 0;
				pos_06_letter.alpha = 0;
				pos_07_screen.alpha = 0;
				pos_07_letter.alpha = 0;
			}
			
			

			
			this.addChildAt(indicator_letter_mc,1);
			this.addChildAt(indicator_color_mc,2);
			this.addChildAt(screens_static_mc,3);
			
			this.addChildAt(pos_00_screen,4);
			this.addChildAt(pos_00_letter,5);
			this.addChildAt(pos_01_screen,6);
			this.addChildAt(pos_01_letter,7);
			this.addChildAt(pos_02_screen,8);
			this.addChildAt(pos_02_letter,9);
			this.addChildAt(pos_03_screen,10);
			this.addChildAt(pos_03_letter,11);
			this.addChildAt(pos_04_screen,12);
			this.addChildAt(pos_04_letter,13);
			this.addChildAt(pos_05_screen,14);
			this.addChildAt(pos_05_letter,15);
			this.addChildAt(pos_06_screen,16);
			this.addChildAt(pos_06_letter,17);
			this.addChildAt(pos_07_screen,18);
			this.addChildAt(pos_07_letter,19);
			this.addChildAt(toggle_switch,20);
			
			CreateSwitchHit();
			CreateScreenHits();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
					
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			Starling.juggler.add(indicator_letter_mc);
			Starling.juggler.add(indicator_color_mc);
			Starling.juggler.add(screens_static_mc);
		
			
			if(Solved === true){
				(stage.getChildAt(0) as Object).AmbientObj.LoadQuantumDrone(true,999);			
			}
		
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).AmbientObj.LoadSpaceHumPower(true,999);
				
			},0.5);
			delayedCall = new DelayedCall(LoadDrone,1);
			Starling.juggler.add(delayedCall);
		}
		
		private function LoadDrone():void{
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).AmbientObj.LoadControlBeeps(true,999);
			},0.25);
			
			
		}
		
		
		
		/*
	
		private var hit_toggle_switch:Shape;
		private var hit_pos_00:Shape;
		private var hit_pos_01:Shape;
		private var hit_pos_02:Shape;
		private var hit_pos_03:Shape;
		private var hit_pos_04:Shape;
		private var hit_pos_05:Shape;
		private var hit_pos_06:Shape;
		private var hit_pos_07:Shape;
		*/
		private function CreateScreenHits():void{
			hit_pos_00 = new Shape();
			hit_pos_00.touchable = false;
			hit_pos_00.graphics.beginFill(0xff0000);
			
			hit_pos_00.graphics.lineTo(242,32);	
			hit_pos_00.graphics.lineTo(345,59);	
			hit_pos_00.graphics.lineTo(298,154);	
			hit_pos_00.graphics.lineTo(187,146);	
					
			hit_pos_00.graphics.endFill(false);
			hit_pos_00.alpha = 0.0;
			
			hit_pos_00.graphics.precisionHitTest = true;	
			
			hit_pos_01 = new Shape();
			hit_pos_01.touchable = false;
			hit_pos_01.graphics.beginFill(0xff0000);
			
			hit_pos_01.graphics.lineTo(381,68);	
			hit_pos_01.graphics.lineTo(457,87);	
			hit_pos_01.graphics.lineTo(405,165);	
			hit_pos_01.graphics.lineTo(329,159);	
					
			hit_pos_01.graphics.endFill(false);
			hit_pos_01.alpha = 0.0;
			
			hit_pos_01.graphics.precisionHitTest = true;	
			
					
			hit_pos_02 = new Shape();
			hit_pos_02.touchable = false;
			hit_pos_02.graphics.beginFill(0xff0000);
			
			hit_pos_02.graphics.lineTo(36,148);	
			hit_pos_02.graphics.lineTo(155,166);	
			hit_pos_02.graphics.lineTo(162,295);	
			hit_pos_02.graphics.lineTo(39,307);	
			
			hit_pos_02.graphics.endFill(false);
			hit_pos_02.alpha = 0.0;
			
			hit_pos_02.graphics.precisionHitTest = true;	
			
			
			hit_pos_03 = new Shape();
			hit_pos_03.touchable = false;
			hit_pos_03.graphics.beginFill(0xff0000);
			
			hit_pos_03.graphics.lineTo(196,166);	
			hit_pos_03.graphics.lineTo(301,174);	
			hit_pos_03.graphics.lineTo(307,290);	
			hit_pos_03.graphics.lineTo(202,295);	
		
			hit_pos_03.graphics.endFill(false);
			hit_pos_03.alpha = 0.0;
			
			hit_pos_03.graphics.precisionHitTest = true;	
			
			
			hit_pos_04 = new Shape();
			hit_pos_04.touchable = false;
			hit_pos_04.graphics.beginFill(0xff0000);
			
			hit_pos_04.graphics.lineTo(332,173);	
			hit_pos_04.graphics.lineTo(411,182);	
			hit_pos_04.graphics.lineTo(417,284);	
			hit_pos_04.graphics.lineTo(334,287);	
						
			hit_pos_04.graphics.endFill(false);
			hit_pos_04.alpha = 0.0;
			
			hit_pos_04.graphics.precisionHitTest = true;	
			
			
			hit_pos_05 = new Shape();
			hit_pos_05.touchable = false;
			hit_pos_05.graphics.beginFill(0xff0000);
			
			hit_pos_05.graphics.lineTo(432,184);	
			hit_pos_05.graphics.lineTo(508,188);	
			hit_pos_05.graphics.lineTo(513,277);	
			hit_pos_05.graphics.lineTo(434,282);	
			
			hit_pos_05.graphics.endFill(false);
			hit_pos_05.alpha = 0.0;
			
			hit_pos_05.graphics.precisionHitTest = true;	
						
			
			hit_pos_06 = new Shape();
			hit_pos_06.touchable = false;
			hit_pos_06.graphics.beginFill(0xff0000);
			
			hit_pos_06.graphics.lineTo(200,323);	
			hit_pos_06.graphics.lineTo(307,313);	
			hit_pos_06.graphics.lineTo(355,411);	
			hit_pos_06.graphics.lineTo(248,434);	
		
			hit_pos_06.graphics.endFill(false);
			hit_pos_06.alpha = 0.0;
			
			hit_pos_06.graphics.precisionHitTest = true;	
			
			
			
			hit_pos_07 = new Shape();
			hit_pos_07.touchable = false;
			hit_pos_07.graphics.beginFill(0xff0000);
			
			hit_pos_07.graphics.lineTo(341,308);	
			hit_pos_07.graphics.lineTo(421,300);	
			hit_pos_07.graphics.lineTo(468,388);	
			hit_pos_07.graphics.lineTo(387,409);	
		
			hit_pos_07.graphics.endFill(false);
			hit_pos_07.alpha = 0.0;
			
			hit_pos_07.graphics.precisionHitTest = true;	
			
			this.addChild(hit_pos_00);
			this.addChild(hit_pos_01);
			this.addChild(hit_pos_02);
			this.addChild(hit_pos_03);
			this.addChild(hit_pos_04);
			this.addChild(hit_pos_05);
			this.addChild(hit_pos_06);
			this.addChild(hit_pos_07);
		}
		
		private function CreateSwitchHit():void{
			hit_toggle_switch = new Shape();
			hit_toggle_switch.touchable = false;
			hit_toggle_switch.graphics.beginFill(0xff0000);
			
			hit_toggle_switch.graphics.lineTo(604,147);	
			hit_toggle_switch.graphics.lineTo(646,121);	
			hit_toggle_switch.graphics.lineTo(737,128);	
			hit_toggle_switch.graphics.lineTo(713,269);	
			hit_toggle_switch.graphics.lineTo(606,283);	
			
						
			hit_toggle_switch.graphics.endFill(false);
			hit_toggle_switch.alpha = 0.0;
			
			hit_toggle_switch.graphics.precisionHitTest = true;	
			this.addChild(hit_toggle_switch);
		}
		
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.BEGAN) {
						if(hit_toggle_switch.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(ConsoleOn === true){
								SwitchFlag = true;
								MousePrevAngle = touches[0].globalY;
							}
						}
					}else if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							
	//						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalSteps();
							FadeOut((ContainmentInterior as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentInteriorObj,true
							);
							return;
						
						}else if(hit_pos_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PosAcceptor(0);
							return;
						}else if(hit_pos_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PosAcceptor(1);
							return;
						}else if(hit_pos_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PosAcceptor(2);
							return;
						}else if(hit_pos_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PosAcceptor(3);
							return;
						}else if(hit_pos_04.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PosAcceptor(4);
							return;
						}else if(hit_pos_05.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PosAcceptor(5);
							return;
						}else if(hit_pos_06.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PosAcceptor(6);
							return;
						}else if(hit_pos_07.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PosAcceptor(7);
							return;
						}else if(hit_toggle_switch.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(ConsoleOn === true){
								if(SwitchFlag === true){
									MouseCurrentAngle = touches[0].globalY;
									SwitchHandler();
									SwitchFlag = false;
									return;
								}else{
									SwitchFlag = false;
								}
								
							
							}else{
								SwitchFlag = false;
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The lever won't move...");
								return;
							}
						}
						
						/*
						private var hit_toggle_switch:Shape;
						private var hit_pos_00:Shape;
						private var hit_pos_01:Shape;
						private var hit_pos_02:Shape;
						private var hit_pos_03:Shape;	
						private var hit_pos_04:Shape;
						private var hit_pos_05:Shape;
						private var hit_pos_06:Shape;
						private var hit_pos_07:Shape;
						*/
					}
				}
			}
		}
		private function PosAcceptor(pos:int):void{
			if(Solved === false){
				if(ConsoleOn === true){
					if(ToggleSwitchDown === true){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
						PosColorSwapper(pos);
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
						PosLetterSwapper(pos);
					}
				}else{
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Static...");	
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmmm... the console is out-putting only a bunch of noisy, formless data...");
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The screens are unresponsive.");
					}
				}
			}else{
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think I'm done with this control console.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think it's better to leave this the way it is for now...");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think I'm done with this control console.");
				}
			}
		}
		
		private function PosLetterSwapper(pos:int):void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator;
			}

			LetterArray[pos] = LetterArray[pos]+1;
			
			if(LetterArray[pos] == 10){
				LetterArray[pos] = 0;
			}
			
			if(ColorArray[pos] == 'red'){
				LetterColorArray[pos] = 'white';
			}else if(ColorArray[pos] == 'purple'){
				LetterColorArray[pos] = 'white';
			}else if(ColorArray[pos] == 'deepblue'){
				LetterColorArray[pos] = 'white';
			}else{
				LetterColorArray[pos] = 'black';
			}

			this['pos_0'+pos+'_letter'].texture = this.assets.getTexture('pos_0'+pos+'_letter_0'+LetterArray[pos]+'_'+LetterColorArray[pos]);
			
			SaveArray[pos+'_LetterArray'] = LetterArray[pos];
			SaveArray[pos+'_LetterColorArray'] = LetterColorArray[pos];
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentCalibrator',SaveArray);
			
			Solve();
		}
		
		private function PosColorSwapper(pos:int):void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator;
			}
			
			if(ColorArray[pos] == 'deepblue'){
				ColorArray[pos] = 'green';
				LetterColorArray[pos] = 'black';
			}else if(ColorArray[pos] == 'green'){
				ColorArray[pos] = 'lightblue';
				LetterColorArray[pos] = 'black';
			}else if(ColorArray[pos] == 'lightblue'){
				ColorArray[pos] = 'magenta';
				LetterColorArray[pos] = 'black';
			}else if(ColorArray[pos] == 'magenta'){
				ColorArray[pos] = 'red';
				LetterColorArray[pos] = 'white';
			}else if(ColorArray[pos] == 'red'){
				ColorArray[pos] = 'orange';
				LetterColorArray[pos] = 'black';
			}else if(ColorArray[pos] == 'orange'){
				ColorArray[pos] = 'puke';
				LetterColorArray[pos] = 'black';
			}else if(ColorArray[pos] == 'puke'){
				ColorArray[pos] = 'purple';
				LetterColorArray[pos] = 'white';
			}else if(ColorArray[pos] == 'purple'){
				ColorArray[pos] = 'teal';
				LetterColorArray[pos] = 'black';
			}else if(ColorArray[pos] == 'teal'){
				ColorArray[pos] = 'yellow';
				LetterColorArray[pos] = 'black';
			}else if(ColorArray[pos] == 'yellow'){
				ColorArray[pos] = 'deepblue';
				LetterColorArray[pos] = 'white';
			}
			
			
			
			this['pos_0'+pos+'_screen'].texture = this.assets.getTexture('pos_0'+pos+'_bg_'+ColorArray[pos]);
			this['pos_0'+pos+'_letter'].texture = this.assets.getTexture('pos_0'+pos+'_letter_0'+LetterArray[pos]+'_'+LetterColorArray[pos]);
			
			
			SaveArray[pos+'_ColorArray'] = ColorArray[pos];
			SaveArray[pos+'_LetterColorArray'] = LetterColorArray[pos];
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentCalibrator',SaveArray);
			
			Solve();
		}
		
		private function SwitchHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator;
			}
			
			if(ToggleSwitchDown === false){
				if(MousePrevAngle < MouseCurrentAngle){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawSlideClosed();
					ToggleSwitchDown = true;
					indicator_color_mc.alpha = 1;
					indicator_letter_mc.alpha = 0;
					indicator_color_mc.play();
					indicator_letter_mc.stop();
					SaveArray['ToggleSwitchDown'] = 'Yes';
					//toggle_switch.texture = this.assets.getTexture('lever_down');
					toggle_switch.texture = (stage.getChildAt(0) as Object).ContaimentCalibratorImages.assets.getTexture("lever_down");
				}
			}else{
				if(MousePrevAngle > MouseCurrentAngle){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawSlideOpen();
					ToggleSwitchDown = false;
					indicator_letter_mc.alpha = 1;
					indicator_color_mc.alpha = 0;
					indicator_color_mc.stop();
					indicator_letter_mc.play();
					SaveArray['ToggleSwitchDown'] = 'No';
					toggle_switch.texture = this.assets.getTexture('lever_up');
					toggle_switch.texture = (stage.getChildAt(0) as Object).ContaimentCalibratorImages.assets.getTexture("lever_up");

				}
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentCalibrator',SaveArray);
		}
		
		private function Solve():void{
			if(LetterArray[0] == 0){	
				if(ColorArray[0] == 'teal'){
				
					if(LetterArray[1] == 2){	
						if(ColorArray[1] == 'deepblue'){
							
							if(LetterArray[2] == 7){	
								if(ColorArray[2] == 'red'){
									
									if(LetterArray[3] == 3){	
										if(ColorArray[3] == 'yellow'){
											
											if(LetterArray[4] == 6){	
												if(ColorArray[4] == 'magenta'){
													
													if(LetterArray[5] == 8){	
														if(ColorArray[5] == 'green'){
															
															if(LetterArray[6] == 9){	
																if(ColorArray[6] == 'purple'){
																	
																	if(LetterArray[7] == 0){	
																		if(ColorArray[7] == 'teal'){
																			
																			trace("SOLVE");
																			trace("SOLVE");
																			trace("SOLVE");
																		
																			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
																			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
																			
																			Solved = true;
																			
																			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator != undefined){
																				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentCalibrator;
																			}
																			SaveArray['Solved'] = 'Yes';
																			
																			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentCalibrator',SaveArray);
																			
																			Starling.juggler.delayCall(function():void{
																				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_EnergyPulse();
																				FadeOut((ContainmentInterior as Class), 
																					(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentInteriorObj,true
																				);
																			},1.5);
																			
																			
																		}else{
																			trace("FAIL ColorArray[7]");
																		}
																	}else{
																		trace("FAIL LetterArray[7]");
																	}
																	
																	
																	
																}else{
																	trace("FAIL ColorArray[6]");
																}
															}else{
																trace("FAIL LetterArray[6]");
															}
															
															
														}else{
															trace("FAIL ColorArray[5]");
														}
													}else{
														trace("FAIL LetterArray[5]");
													}
													
												}else{
													trace("FAIL ColorArray[4]");
												}
											}else{
												trace("FAIL LetterArray[4]");
											}
											
										}else{
											trace("FAIL ColorArray[3]");
											trace("ColorArray[3]: "+ColorArray[3]);
										}
									}else{
										trace("FAIL LetterArray[3]");
									}
									
								}else{
									trace("FAIL ColorArray[2]");
								}
							}else{
								trace("FAIL LetterArray[2]");
							}
							
						}else{
							trace("FAIL ColorArray[1]");
						}
					}else{
						trace("FAIL LetterArray[1]");
					}
					
				}else{
					trace("FAIL ColorArray[0]");
				}
			}else{
				trace("FAIL LetterArray[0]");
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
			
			
			
			this.assets.removeTexture("containmentCalibrator_bg",true);
			this.assets.removeTexture("ContainmentCalibrator_Sprite_00",true);
			this.assets.removeTextureAtlas("ContainmentCalibrator_Sprite_00",true);
			this.assets.removeTexture("ContainmentCalibrator_Sprite_01",true);
			this.assets.removeTextureAtlas("ContainmentCalibrator_Sprite_01",true);
		
			
			(stage.getChildAt(0) as Object).falseAsset("containmentCalibrator_01");
			(stage.getChildAt(0) as Object).falseAsset("containmentCalibrator_02");
			(stage.getChildAt(0) as Object).falseAsset("containmentCalibrator_03");
			(stage.getChildAt(0) as Object).falseAsset("containmentCalibrator_04");
			(stage.getChildAt(0) as Object).falseAsset("containmentCalibrator_05");
			
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
