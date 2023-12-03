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
	import starling.utils.AssetManager;

	public class ContainmentControl extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var pos_00:Image;
		private var pos_01:Image;
		private var pos_02:Image;
		private var pos_03:Image;
		private var pos_04:Image;
		private var pos_05:Image;
		
		private var breachScreen:Image;
		private var screen_one:MovieClip;
		private var screen_two:MovieClip;
		
		private var hit_pos_00:Shape;
		private var hit_pos_01:Shape;
		private var hit_pos_02:Shape;
		private var hit_pos_03:Shape;
		private var hit_pos_04:Shape;
		private var hit_pos_05:Shape;
		
		private var hit_screen_main:Shape;
		private var hit_screen_00:Shape;
		private var hit_console:Shape;
		
		private var pos_00_pos:String = '1';
		private var pos_01_pos:String = '1';
		private var pos_02_pos:String = '1';
		private var pos_03_pos:String = '1';
		private var pos_04_pos:String = '1';
		private var pos_05_pos:String = '1';
		
		
		private var MouseCurrentAngle:Number = 180;
		private var MousePrevAngle:Number = 180;
		
		private var Solved:Boolean = false;
		private var HandAttached:Boolean = false;
		private var HatchOpen:Boolean = false;
		private var LeverAttached:Boolean = false;
		private var HandFlag:String = null
			
			
		private var Animating:Boolean = false;
		public var delayedcall:DelayedCall;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function ContainmentControl(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('containmentControl_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentControl/containmentControl_bg.jpg'));
				game.TrackAssets('containmentControl_01');
			}
			if(game.CheckAsset('containmentControl_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentControl/ContainmentControl_Sprite_01.png'));
				game.TrackAssets('containmentControl_02');
			}
			if(game.CheckAsset('containmentControl_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentControl/ContainmentControl_Sprite_01.xml'));
				game.TrackAssets('containmentControl_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ContainmentControl","ContainmentControlObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('containmentControl_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			breachScreen = new Image(this.assets.getTexture('breach_secure'));
			breachScreen.touchable = false;
			breachScreen.x = 504;
			breachScreen.y = 147;
			
			screen_one = new MovieClip(this.assets.getTextures("screen_one_0"),0.5);
			screen_one.x = 478;
			screen_one.y = 46;			
			screen_one.touchable = false;
			screen_one.loop = true; 
			
			screen_two = new MovieClip(this.assets.getTextures("screen_two_0"),1);
			screen_two.x = 626;
			screen_two.y = 52;			
			screen_two.touchable = false;
			screen_two.loop = true; 
			
			pos_00 = new Image(this.assets.getTexture('pos_00_01'));
			pos_00.touchable = false;
			pos_00.x = 37;
			pos_00.y = 10;
						
			pos_01 = new Image(this.assets.getTexture('pos_01_01'));
			pos_01.touchable = false;
			pos_01.x = 231;
			pos_01.y = 59;
					
			pos_02 = new Image(this.assets.getTexture('pos_02_01'));
			pos_02.touchable = false;
			pos_02.x = 361;
			pos_02.y = 89;
					
			pos_03 = new Image(this.assets.getTexture('pos_03_01'));
			pos_03.touchable = false;
			pos_03.x = 38;
			pos_03.y = 238;
						
			pos_04 = new Image(this.assets.getTexture('pos_04_01'));
			pos_04.touchable = false;
			pos_04.x = 228;
			pos_04.y = 245;
			
			pos_05 = new Image(this.assets.getTexture('pos_05_01'));
			pos_05.touchable = false;
			pos_05.x = 360;
			pos_05.y = 249;

			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch['Hand'] == 'Attached'){	
					HandAttached = true;
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentHatch['Hatch'] == 'Open'){	
					HatchOpen = true;
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl != undefined){		
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['Solved'] == 'Yes'){
					if(HandAttached === true){
						if(HatchOpen === true){
							breachScreen.texture = this.assets.getTexture('breach_open');
						}else{
							breachScreen.texture = this.assets.getTexture('breach_unlocked');
						}
					}else{
						breachScreen.texture = this.assets.getTexture('breach_awaiting');
					}
					
				
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['pos_00'] == '2'){
					pos_00.texture = this.assets.getTexture('pos_00_02');
					pos_00_pos = '2';
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['pos_00'] == '0'){
					pos_00.texture = this.assets.getTexture('pos_00_00');
					pos_00_pos = '0';
				}else{
					pos_00.texture = this.assets.getTexture('pos_00_01');
					pos_00_pos = '1';
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['pos_01'] == '2'){
					pos_01.texture = this.assets.getTexture('pos_01_02');
					pos_01_pos = '2';
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['pos_01'] == '0'){
					pos_01.texture = this.assets.getTexture('pos_01_00');
					pos_01_pos = '0';
				}else{
					pos_01.texture = this.assets.getTexture('pos_01_01');
					pos_01_pos = '1';
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['pos_02'] == '2'){
					pos_02.texture = this.assets.getTexture('pos_02_02');
					pos_02_pos = '2';
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['pos_02'] == '0'){
					pos_02.texture = this.assets.getTexture('pos_02_00');
					pos_02_pos = '0';
				}else{
					pos_02.texture = this.assets.getTexture('pos_02_01');
					pos_02_pos = '1';
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['pos_03'] == '2'){
					pos_03.texture = this.assets.getTexture('pos_03_02');
					pos_03_pos = '2';
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['pos_03'] == '0'){
					pos_03.texture = this.assets.getTexture('pos_03_00');
					pos_03_pos = '0';
				}else{
					pos_03.texture = this.assets.getTexture('pos_03_01');
					pos_03_pos = '1';
				}
				//if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['Lever'] == 'Attached'){
				//	LeverAttached = true;
				//	pos_04.alpha = 1;
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['pos_04'] == '2'){
					pos_04.texture = this.assets.getTexture('pos_04_02');
					pos_04_pos = '2';
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['pos_04'] == '0'){
					pos_04.texture = this.assets.getTexture('pos_04_00');
					pos_04_pos = '0';
				}else{
					pos_04.texture = this.assets.getTexture('pos_04_01');
					pos_04_pos = '1';
				}	
				
				//		}else{
				//			pos_04.alpha = 0;
				//		}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['pos_05'] == '2'){
					pos_05.texture = this.assets.getTexture('pos_05_02');
					pos_05_pos = '2';
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl['pos_05'] == '0'){
					pos_05.texture = this.assets.getTexture('pos_05_00');
					pos_05_pos = '0';
				}else{
					pos_05.texture = this.assets.getTexture('pos_05_01');
					pos_05_pos = '1';
				}
			}
			
			
			pos_00.alpha = 1;
			pos_01.alpha = 1;
			pos_02.alpha = 1;
			pos_03.alpha = 1;
			pos_04.alpha = 1;
			pos_05.alpha = 1;
			
			breachScreen.alpha = 1;
			screen_one.alpha = 1;
			screen_two.alpha = 1;
			
			this.addChildAt(breachScreen,1);
			this.addChildAt(screen_one,2);
			this.addChildAt(screen_two,3);		
			this.addChildAt(pos_00,4);
			this.addChildAt(pos_01,5);
			this.addChildAt(pos_02,6);
			this.addChildAt(pos_03,7);
			this.addChildAt(pos_04,8);
			this.addChildAt(pos_05,9);
			
			CreatePosHit();
		//	CreatePosHit();
			CreateScreenConsoleHit();
			CreateScreenZeroHit();
			CreateScreenMainHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			
			Starling.juggler.add(screen_one);
			Starling.juggler.add(screen_two);
		}
		
	
		private function CreateScreenConsoleHit():void{
			hit_console = new Shape();
			hit_console.touchable = false;
			hit_console.graphics.beginFill(0xff0000);
			
			hit_console.graphics.lineTo(443,418);
			hit_console.graphics.lineTo(492,329);
			hit_console.graphics.lineTo(777,345);
			hit_console.graphics.lineTo(719,398);
			hit_console.graphics.lineTo(598,451);
			
			hit_console.graphics.endFill(false);
			hit_console.alpha = 0.0;
			
			hit_console.graphics.precisionHitTest = true;	
			this.addChild(hit_console);
		}
		
		private function CreateScreenZeroHit():void{
			hit_screen_00 = new Shape();
			hit_screen_00.touchable = false;
			hit_screen_00.graphics.beginFill(0xff0000);
			
			hit_screen_00.graphics.lineTo(477,47);
			hit_screen_00.graphics.lineTo(611,43);
			hit_screen_00.graphics.lineTo(673,54);
			hit_screen_00.graphics.lineTo(697,126);
			hit_screen_00.graphics.lineTo(608,144);
			hit_screen_00.graphics.lineTo(479,140);
			
			hit_screen_00.graphics.endFill(false);
			hit_screen_00.alpha = 0.0;
			
			hit_screen_00.graphics.precisionHitTest = true;	
			this.addChild(hit_screen_00);
		}
		
		private function CreateScreenMainHit():void{
			hit_screen_main = new Shape();
			hit_screen_main.touchable = false;
			hit_screen_main.graphics.beginFill(0xff0000);
			
			hit_screen_main.graphics.lineTo(501,162);
			hit_screen_main.graphics.lineTo(742,142);
			hit_screen_main.graphics.lineTo(746,327);
			hit_screen_main.graphics.lineTo(503,316);
		
			hit_screen_main.graphics.endFill(false);
			hit_screen_main.alpha = 0.0;
			
			hit_screen_main.graphics.precisionHitTest = true;	
			this.addChild(hit_screen_main);
		}
		
		
		private function CreatePosHit():void{
			hit_pos_00 = new Shape();
			hit_pos_00.touchable = false;
			hit_pos_00.graphics.beginFill(0x0000ff);
			
			hit_pos_00.graphics.lineTo(66,19);	
			hit_pos_00.graphics.lineTo(172,34);	
			hit_pos_00.graphics.lineTo(206,98);	
			hit_pos_00.graphics.lineTo(203,180);	
			hit_pos_00.graphics.lineTo(146,223);	
			hit_pos_00.graphics.lineTo(45,188);	
			
			hit_pos_00.alpha = 0.0;
			hit_pos_00.graphics.endFill(false);
			hit_pos_00.graphics.precisionHitTest = true;	
			this.addChild(hit_pos_00);
			
			//---------------------------
			hit_pos_01 = new Shape();
			hit_pos_01.touchable = false;
			hit_pos_01.graphics.beginFill(0x0000ff);
			
			hit_pos_01.graphics.lineTo(230,49);	
			hit_pos_01.graphics.lineTo(308,54);	
			hit_pos_01.graphics.lineTo(343,85);	
			hit_pos_01.graphics.lineTo(363,149);	
			hit_pos_01.graphics.lineTo(336,217);	
			hit_pos_01.graphics.lineTo(296,233);	
			hit_pos_01.graphics.lineTo(220,222);	
		
			hit_pos_01.alpha = 0.0;
			hit_pos_01.graphics.endFill(false);
			hit_pos_01.graphics.precisionHitTest = true;	
			this.addChild(hit_pos_01);
			
			//---------------------------
			hit_pos_02 = new Shape();
			hit_pos_02.touchable = false;
			hit_pos_02.graphics.beginFill(0x0000ff);
			
			hit_pos_02.graphics.lineTo(368,84);	
			hit_pos_02.graphics.lineTo(428,96);	
			hit_pos_02.graphics.lineTo(478,142);	
			hit_pos_02.graphics.lineTo(478,183);	
			hit_pos_02.graphics.lineTo(424,230);	
			hit_pos_02.graphics.lineTo(363,221);	
		
			hit_pos_02.alpha = 0.0;
			hit_pos_02.graphics.endFill(false);
			hit_pos_02.graphics.precisionHitTest = true;	
			this.addChild(hit_pos_02);
			
			//---------------------------
			hit_pos_03 = new Shape();
			hit_pos_03.touchable = false;
			hit_pos_03.graphics.beginFill(0x0000ff);
						
			hit_pos_03.graphics.lineTo(58,253);	
			hit_pos_03.graphics.lineTo(161,249);	
			hit_pos_03.graphics.lineTo(193,280);	
			hit_pos_03.graphics.lineTo(202,343);	
			hit_pos_03.graphics.lineTo(158,424);	
			hit_pos_03.graphics.lineTo(66,432);	
			
			hit_pos_03.alpha = 0.0;
			hit_pos_03.graphics.endFill(false);
			hit_pos_03.graphics.precisionHitTest = true;	
			this.addChild(hit_pos_03);
			
			//---------------------------
			hit_pos_04 = new Shape();
			hit_pos_04.touchable = false;
			hit_pos_04.graphics.beginFill(0x0000ff);
			
			hit_pos_04.graphics.lineTo(238,243);	
			hit_pos_04.graphics.lineTo(322,245);	
			hit_pos_04.graphics.lineTo(362,292);	
			hit_pos_04.graphics.lineTo(358,360);	
			hit_pos_04.graphics.lineTo(304,398);	
			hit_pos_04.graphics.lineTo(231,407);	
			
			
			hit_pos_04.alpha = 0.0;
			hit_pos_04.graphics.endFill(false);
			hit_pos_04.graphics.precisionHitTest = true;	
			this.addChild(hit_pos_04);
			
			//---------------------------
			hit_pos_05 = new Shape();
			hit_pos_05.touchable = false;
			hit_pos_05.graphics.beginFill(0x0000ff);
			
			hit_pos_05.graphics.lineTo(375,250);	
			hit_pos_05.graphics.lineTo(431,249);	
			hit_pos_05.graphics.lineTo(476,281);	
			hit_pos_05.graphics.lineTo(471,343);	
			hit_pos_05.graphics.lineTo(419,383);	
			hit_pos_05.graphics.lineTo(368,382);	
			
			hit_pos_05.alpha = 0.0;
			hit_pos_05.graphics.endFill(false);
			hit_pos_05.graphics.precisionHitTest = true;	
			this.addChild(hit_pos_05);
			
			
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.BEGAN) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalSteps();
						//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((Containment as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentObj,true
							);
						}else if(hit_screen_main.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							MainScreenHandler();
						}else if(hit_screen_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Minute bits of data stream out of the giant system...");
						}else if(hit_console.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A console of gauges and switches... I'm not sure what they measure or control...");
							/*
							private var hit_screen_main:Shape;
							private var hit_screen_00:Shape;
							private var hit_console:Shape;
							*/	
							
						}else if(Solved === false){
							
							if(hit_pos_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								HandFlag = "pos_00";
								MousePrevAngle = touches[0].globalY;
							}else if(hit_pos_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								HandFlag = "pos_01";		
								MousePrevAngle = touches[0].globalY;
							}else if(hit_pos_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								HandFlag = "pos_02";	
								MousePrevAngle = touches[0].globalY;
							}else if(hit_pos_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								HandFlag = "pos_03";	
								MousePrevAngle = touches[0].globalY;
							}else if(hit_pos_04.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							//	if(LeverAttached === true){
									HandFlag = "pos_04";
									MousePrevAngle = touches[0].globalY;	
							//	}else{
							//		LeverHandler();
						//		}			
							}else if(hit_pos_05.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								HandFlag = "pos_05";		
								MousePrevAngle = touches[0].globalY;
							}
						}
					}else if(touches[0].phase == TouchPhase.ENDED){
						if(Solved === false){
							if(HandFlag != null){
								MouseCurrentAngle = touches[0].globalY;
								HandHandler();
							}
						}
						
					}
				}
			}
		}
		
		private function MainScreenHandler():void{
			if(Solved === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The screen indicates the portal is secure.");
			}else{				
				if(HandAttached === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The system indicates it needs biometric data input to continue.");
				}else{
					if(HatchOpen === false){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The system believes Dr. Teresa Von Awesome has just released the lock on the hatch.");	
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The screen shows a warning because the hatch is open.");	
					}
				}			
			}
		}
		
		private function HandHandler():void{
			
			if(MousePrevAngle > MouseCurrentAngle){
				
				if(this[(HandFlag+"_pos")] == '0'){
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawSlideOpen();
					this[(HandFlag)].texture = this.assets.getTexture(HandFlag+'_01');
					this[(HandFlag+"_pos")] = '1';
				}else if(this[(HandFlag+"_pos")] == '1'){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawSlideOpen();
					this[(HandFlag)].texture = this.assets.getTexture(HandFlag+'_02');
					this[(HandFlag+"_pos")] = '2';
				}else if(this[(HandFlag+"_pos")] == '2'){
					
				}
			}else if(MousePrevAngle < MouseCurrentAngle){
				if(this[(HandFlag+"_pos")] == '0'){
					
				}else if(this[(HandFlag+"_pos")] == '1'){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawSlideClosed();
					this[(HandFlag)].texture = this.assets.getTexture(HandFlag+'_00');
					this[(HandFlag+"_pos")] = '0';	
				}else if(this[(HandFlag+"_pos")] == '2'){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawSlideClosed();
					this[(HandFlag)].texture = this.assets.getTexture(HandFlag+'_01');
					this[(HandFlag+"_pos")] = '1';	
				}
			}
			SaveHandVal(HandFlag);	
			HandFlag = null;
			
			Solve();
		}
		
		private function SaveHandVal(HandFlagVal:String):void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl			
			}
			SaveArray[HandFlagVal] = this[(HandFlagVal+"_pos")];
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentControl',SaveArray);
		
		}
		
		
		private function Solve():void{
			
			
			if(pos_00_pos == '0'){
				if(pos_01_pos == '1'){
					if(pos_02_pos == '2'){
						if(pos_03_pos == '2'){
							if(pos_04_pos == '0'){
								if(pos_05_pos == '2'){
									trace("Solved");
									trace("SOLVE!!!!");
									Animating = true;
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerUp();
								//	Animating = true;
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
									//breachScreen.texture = this.assets.getTexture('breach_awaiting');
									breachScreen.alpha = 1;
									
								//(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("CaveDrips",0,0.5,'stop');
									trace("Solved");
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentControl;
									}
									SaveArray['Solved'] = 'Yes'; 
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentControl',SaveArray);	
									delayedcall = new DelayedCall(function():void{
										
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_EnergyPulse();
										Animating = false;
										FadeOut(Containment,(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentObj,true)
									},1.5);
									
									Starling.juggler.add(delayedcall);
									
								}else{
									trace("Not Solved");
								}
							}else{
								trace("Not Solved");
							}
						}else{
							trace("Not Solved");
						}
					}else{
						trace("Not Solved");
					}
					
				}else{
					trace("Not Solved");
				}
			}else{
				trace("Not Solved");
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
			
			
			
			this.assets.removeTexture("containmentControl_bg",true);
			this.assets.removeTexture("ContainmentControl_Sprite_01",true);
			this.assets.removeTextureAtlas("ContainmentControl_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("containmentControl_01");
			(stage.getChildAt(0) as Object).falseAsset("containmentControl_02");
			(stage.getChildAt(0) as Object).falseAsset("containmentControl_03");
			
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
