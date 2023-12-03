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
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;
	
	public class OuttroJupiter extends Sprite
	{
		
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var europa:Image;
		private var station:Image;
		private var window:Image;
		private var awesome:Image;
		
		private var TextBlockSprite:Sprite;
		
		private var tblock00:Image;
		private var tblock01:Image;
		
		private var yes:Image;
		private var no:Image;
		private var YesNo:Sprite;
		
		private var currentPos:int = 0;
		private var TBlockHalfText:Boolean = false;
		
		private var TextTween00:Tween;
		private var TextTween01:Tween;
		private var TextTween02:Tween;
		private var YesNoTween:Tween;
	
		private var hit_yes:Shape;
		private var hit_no:Shape;
		
		private var bgTween:Tween;
		private var EuropaTween:Tween;
		private var StationTween:Tween;
		private var WindowTween:Tween;
		private var AwesomeTween:Tween;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		
		public function OuttroJupiter(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('outtroJupiter_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OuttroJupiter/outtroJupiter_bg.jpg'));
				game.TrackAssets('outtroJupiter_01');
			}
			if(game.CheckAsset('outtroJupiter_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OuttroJupiter/OuttroJupiter_Sprite_01.png'));
				game.TrackAssets('outtroJupiter_02');
			}
			if(game.CheckAsset('outtroJupiter_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OuttroJupiter/OuttroJupiter_Sprite_01.xml'));
				game.TrackAssets('outtroJupiter_03');
			}
			if(game.CheckAsset('outtroJupiter_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OuttroJupiter/OuttroJupiter_Sprite_02.png'));
				game.TrackAssets('outtroJupiter_04');
			}
			if(game.CheckAsset('outtroJupiter_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OuttroJupiter/OuttroJupiter_Sprite_02.xml'));
				game.TrackAssets('outtroJupiter_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ContainmentInterior","ContainmentInteriorObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('outtroJupiter_bg'));
			bg.pivotX = 512;
			bg.pivotY = 327.5;
			bg.x = 400;
			bg.y = 256;
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			europa = new Image(this.assets.getTexture('europa'));
			europa.touchable = false;
			europa.x = 669;
			europa.y = 11;			
			europa.alpha = 1;
						
			station = new Image(this.assets.getTexture('spacestation'));
			station.touchable = false;
			station.x = -98;
			station.y = 135;			
			station.alpha = 1;
			
			window = new Image(this.assets.getTexture('window'));
			window.touchable = false;
			window.pivotX = 400;
			window.pivotY = 256;
			window.width = 2048;
			window.height = 1310;
			window.x = 400;
			window.y = 256;			
			window.alpha = 1;
			
			awesome = new Image(this.assets.getTexture('awesome'));
			awesome.touchable = false;
			awesome.x = 423;
			awesome.y = 44;			
			awesome.alpha = 0;
			
			
			
			
			
			this.addChildAt(europa,1);
			this.addChildAt(station,2);
			this.addChildAt(window,3);
			this.addChildAt(awesome,4);
			
			CreateTBlock();
			CreateYesNo();
			CreateYesNoHit();
			Animating = true;
			Starling.juggler.delayCall(AnimateBg,0.5);
		
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			this.addEventListener(EnterFrameEvent.ENTER_FRAME, onFrameTick);
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BlackHole",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("QuantumBalls",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("QuantumDrone",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ShipGroansOne",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BasementBongs",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("DuctVibe",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
			
			
			(stage.getChildAt(0) as Object).MusicObj.LoadErrieAlley(true,1);
			(stage.getChildAt(0) as Object).MusicObj.soundManager.tweenVolumeComplex("LightBeam",0,0.5,'stop');
		}
		
		/*
		private var hit_yes:Shape;
		private var hit_no:Shape;
		
		*/
		
		private function CreateYesNoHit():void{
			hit_yes = new Shape();
			hit_yes.touchable = false;
			hit_yes.graphics.beginFill(0xff0000);
			
			hit_yes.graphics.lineTo(132+300,329);
			hit_yes.graphics.lineTo(321+300,329);
			hit_yes.graphics.lineTo(321+300,424);
			hit_yes.graphics.lineTo(132+300,424);
		
			hit_yes.graphics.endFill(false);
			hit_yes.alpha = 0.0;
			
			hit_yes.graphics.precisionHitTest = true;	
			
			
			hit_no = new Shape();
			hit_no.touchable = false;
			hit_no.graphics.beginFill(0xff0000);
			
			hit_no.graphics.lineTo(132,329);
			hit_no.graphics.lineTo(321,329);
			hit_no.graphics.lineTo(321,424);
			hit_no.graphics.lineTo(132,424);
			
			hit_no.graphics.endFill(false);
			hit_no.alpha = 0.0;
			
			hit_no.graphics.precisionHitTest = true;	
			
			this.addChild(hit_no);
			this.addChild(hit_yes);
		}
		
		
		
		private function CreateYesNo():void{
			YesNo = new Sprite();
			YesNo.touchable = false;
			YesNo.x = 129;
			YesNo.y = 338;
			
			yes = new Image(this.assets.getTexture('yes'));
			yes.touchable = false;
			yes.x = 300;
			yes.y = 0;			
			yes.alpha = 1; 
			
			no = new Image(this.assets.getTexture('no'));
			no.touchable = false;
			no.x = 0;
			no.y = 0;			
			no.alpha = 1; 
			/*
			private var yes:Image;
			private var no:Image;
			private var YesNo:Sprite;
			*/
			YesNo.addChildAt(no,0);
			YesNo.addChildAt(yes,0);
			
			YesNo.alpha = 0;
			this.addChild(YesNo);
		}
		
		private function onFrameTick():void{
			if(station.x < 801){
				station.x = station.x+0.5;
				if(station.x < 401){
					station.y = station.y+0.1
				}else{
					station.y = station.y-0.1
				}
			}
			
			if(europa.y < 514){
				europa.y = europa.y+0.1;
				europa.x = europa.x-0.25;
			}
		}
		
		private function CreateTBlock():void{
			
			TextBlockSprite = new Sprite();
			TextBlockSprite.touchable = false;
			TextBlockSprite.x = 27;
			TextBlockSprite.y = 91;
			
			
			tblock00 = new Image(this.assets.getTexture('text_s00p00'));
			tblock00.touchable = false;
			tblock00.x = 0;
			tblock00.y = 0;			
			tblock00.alpha = 1; 
					
			tblock01 = new Image(this.assets.getTexture('text_s00p01'));
			tblock01.touchable = false;
			tblock01.x = 0;
			tblock01.y = 0;			
			tblock01.alpha = 0; 
			
			TextBlockSprite.alpha = 0;
			
			TextBlockSprite.addChildAt(tblock00,0);
			TextBlockSprite.addChildAt(tblock01,1);
			this.addChild(TextBlockSprite);
			
		}
		
		
		
		private function AnimateBg():void{
			bgTween = new Tween(bg, 8, Transitions.EASE_IN_OUT);
			bgTween.animate("width", 800);
			bgTween.animate("height", 512)		
			bgTween.onComplete = function():void{
				AnimateWindow();
				bgTween = null;
			}
			Starling.juggler.add(bgTween);	
	
		}
		
		private function AnimateWindow():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_EnergyPulse();
			(stage.getChildAt(0) as Object).AmbientObj.LoadSpaceHumPower(true,999);
			WindowTween = new Tween(window, 8, Transitions.EASE_OUT);
			WindowTween.animate("width", 800);
			WindowTween.animate("height", 512)		
			WindowTween.onComplete = function():void{
				FadeInAwesome();
				WindowTween = null;
			}
			Starling.juggler.add(WindowTween);	
		}
		
		private function FadeInAwesome():void{
			AwesomeTween = new Tween(awesome, 1.5, Transitions.LINEAR);
			AwesomeTween.fadeTo(1);		
			AwesomeTween.onComplete = function():void{
				(stage.getChildAt(0) as Object).MusicObj.LoadStarryNight(true,2);
				TextFaderPart00();
				AwesomeTween = null;
			}
			Starling.juggler.add(AwesomeTween);	
		}
		
		private function TextFaderPart00():void{
			
			trace("MUSH 00");
			Animating = true;
			TextTween00 = new Tween(TextBlockSprite, 0.5, Transitions.LINEAR);
			TextTween00.fadeTo(1);		
			TextTween00.onComplete = function():void{
				trace("MUSH 01");
				//TextFaderPart01();
				if(currentPos <= 3){
					trace("MUSH 02");
					TextFaderPart00onComplete();
				}else{
					trace("MUSH 03");
					if(currentPos == 4){
						trace("MUSH 04");
						YesNoDelay();
					
					}else if(currentPos >= 5){
						trace("MUSH 05");
						TextFaderPart00onComplete();
						
						//	TextFaderPart01();
					}
				
					
				}
				
				TextTween00 = null;
			}
			Starling.juggler.add(TextTween00);	
		}
		private function YesNoDelay():void{
			trace("MUSH 08");
			Animating = true;
			Starling.juggler.delayCall(FadeInYesNo,1);
			
		}
		
		private function TextFaderPart00onComplete():void{
			trace("MUSH 09");
			
			if(currentPos == 3){
				trace("BARK 00");
				Animating = false;
			}else if(currentPos == 6){
				Animating = false;
			}else if(currentPos == 5){
				trace("BARK 01");
				Animating = true;
				Starling.juggler.delayCall(TextFaderPart01,0.75)
			}else{
				trace("BARK 01");
				Animating = true;
				Starling.juggler.delayCall(TextFaderPart01,0.75)
			}
				
		}
		
		private function TextFaderPart01():void{
			trace("MUSH 10");
			Animating = true;
			TextTween01 = new Tween(tblock01, 0.5, Transitions.LINEAR);
			TextTween01.fadeTo(1);		
			TextTween01.onComplete = function():void{
				trace("MUSH 11");
				
				
				Animating = false;
				
			//	TextFaderPart02();
				
				TextTween01 = null;
			}
			Starling.juggler.add(TextTween01);	
		}
		private function TextFaderPart02(YN:int = 0):void{
			trace("MUSH 12");
			Animating = true;
			
			if(currentPos > 3){
				FadeOutYN();
			}
			
			TextTween02 = new Tween(TextBlockSprite, 0.5, Transitions.LINEAR);
			TextTween02.fadeTo(0);		
			TextTween02.onComplete = function():void{
				trace("MUSH 13");
				TextFaderPart00();
				TextFadeOutOnComplete(YN);
				
				TextTween02 = null;
			}
			
			
				
				
			Starling.juggler.add(TextTween02);	
		}
		private function FadeOutYN():void{
			Animating = true;
			trace("SMURF 02");
			YesNoTween = new Tween(YesNo, 0.5, Transitions.LINEAR);
			YesNoTween.fadeTo(0);		
			YesNoTween.onComplete = function():void{
			//	Animating = false;
				//	TextFadeOutOnComplete();
				
				YesNoTween = null;
			}
			Starling.juggler.add(YesNoTween);	
		}
		
		private function TextFadeOutOnComplete(YN:int = 0):void{
			trace("MUSH 14");
			//Animating = false;
			tblock01.alpha = 0;
			
			if(currentPos == 0){
				tblock00.texture = this.assets.getTexture('text_s01p00');
				tblock01.texture = this.assets.getTexture('text_s01p01');
				currentPos = 1;
			}else if(currentPos == 1){
				tblock00.texture = this.assets.getTexture('text_s02p00');
				tblock01.texture = this.assets.getTexture('text_s02p01');
				currentPos = 2;
			}else if(currentPos == 2){
				tblock00.texture = this.assets.getTexture('text_s03p00');
				currentPos = 3;
			}else if(currentPos == 3){
				tblock00.texture = this.assets.getTexture('text_s04p00');
				currentPos = 4;
			
			}else if(currentPos == 4){
				trace("SMURF 03");
				if(YN == 0){
					trace("SMURF 04");
					tblock00.texture = this.assets.getTexture('text_s05p00');
					tblock01.texture = this.assets.getTexture('text_s05p01');
					currentPos = 5;
					//EndIt(YN);
				}else{
					trace("SMURF 05");
					currentPos = 6;
					tblock00.texture = this.assets.getTexture('text_s06p00');
					
				//	EndIt(YN);
				}
			}
			
		}
		
		private function FadeInYesNo():void{
			Animating = true;
			trace("SMURF 02");
			YesNoTween = new Tween(YesNo, 0.5, Transitions.LINEAR);
			YesNoTween.fadeTo(1);		
			YesNoTween.onComplete = function():void{
				Animating = false;
			//	TextFadeOutOnComplete();
				
				YesNoTween = null;
			}
			Starling.juggler.add(YesNoTween);	
		}
		
		/*
		
		private var YesTween:Tween;
		private var NoTween:Tween;
		private var TextTween00:Tween;
		private var TextTween01:Tween;
		*/
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
						if(currentPos < 4){
							TextFaderPart02();
						}else{
							
							if(currentPos == 4){
								if(hit_yes.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									
									EndIt(0);
								}else if(hit_no.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									EndIt(1);
								}
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
		private function EndIt(YN:int = 0):void{
			Animating = true;
			trace("SMURF 00");
			TextFaderPart02(YN);
			Animating = true;
		//	FadeInYesNo(YN);
			
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

			this.assets.removeTexture("outtroJupiter_bg",true);
			this.assets.removeTexture("OuttroJupiter_Sprite_01",true);
			this.assets.removeTextureAtlas("OuttroJupiter_Sprite_01",true);
			this.assets.removeTexture("OuttroJupiter_Sprite_02",true);
			this.assets.removeTextureAtlas("OuttroJupiter_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("outtroJupiter_01");
			(stage.getChildAt(0) as Object).falseAsset("outtroJupiter_02");
			(stage.getChildAt(0) as Object).falseAsset("outtroJupiter_03");
			(stage.getChildAt(0) as Object).falseAsset("outtroJupiter_04");
			(stage.getChildAt(0) as Object).falseAsset("outtroJupiter_05");
			
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

