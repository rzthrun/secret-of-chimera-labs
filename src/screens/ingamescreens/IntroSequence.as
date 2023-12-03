package screens.ingamescreens
{
	import flash.filesystem.File;
	
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
	import starling.utils.deg2rad;
	
	public class IntroSequence extends Sprite
	{
		

		private var assets:AssetManager;
		
		private var hit_area:Shape;
		
		private var nightSky:Image;
		private var dark_bg:Image;
		private var light_bg:Image;
		
		private var leaf00:Image;
		private var leaf01:Image;
		private var leaf02:Image;
		
		private var phone_dark_mc:MovieClip;
		private var phone_light_mc:MovieClip;
		
		private var phone:Image;
		
		private var currentPage:Number = 0;
		private var pageTween:Tween;
		private var pageExtraTween:Tween;
		private var page_text:Image;
		private var page_text_extra:Image;
		
		//	private var cabinSprite:Sprite;
		//	private var cabin_ocean:Image;
		//	private var cabin_bg:Image;
		//	private var cabin_screen:Image;
		//	private var cabin_screenShot:Image;
		
		//	private var cabinTween:Tween;
		//	private var cabinscreenShotTween:Tween;
		
		
		//	private var emailSprite:Sprite;
		//	private var email_doctor:Image;
		//	private var email_bg:Image;
		//	private var email_back:Image;
		//	private var email_text:Image;
		
		//	private var email_doctorTween:Tween;
		//	private var email_bgTween:Tween;
		//	private var email_textTween:Tween;
		
		//	private var emailCurrentPage:Number = 0;
		
		private var delayedCall:DelayedCall;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		
		private var Animating:Boolean = true;
		
		private var game:Game;
		
		
		public function IntroSequence(_assets:AssetManager,_game:Game)
		{
			super();
			assets = _assets;
			game = _game;
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
			
		}
		public function onAddedToStage(event:starling.events.Event):void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			//	if(game.CheckAsset('intro_01') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/IntroSequence/IntroSequence_cabin.png'));
			//		game.TrackAssets('intro_01');
			//	}
			
			if(game.CheckAsset('intro_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/IntroSequence/IntroSequence_spriteSheet.png'));
				game.TrackAssets('intro_01');
			}
			if(game.CheckAsset('intro_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/IntroSequence/IntroSequence_spriteSheet.xml'));
				game.TrackAssets('intro_02');
			}
			if(game.CheckAsset('intro_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/IntroSequence/IntroSequence_spriteSheet_02.png'));
				game.TrackAssets('intro_03');
			}
			if(game.CheckAsset('intro_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/IntroSequence/IntroSequence_spriteSheet_02.xml'));
				game.TrackAssets('intro_04');
			}
			//	if(game.CheckAsset('intro_05') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/IntroSequence/IntroSequence_spriteSheet_02.png'));
			//		game.TrackAssets('intro_05');
			//	}
			//	if(game.CheckAsset('intro_06') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/IntroSequence/IntroSequence_spriteSheet_02.xml'));
			//		game.TrackAssets('intro_06');
			//	}
			
			
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
				}				
			});	
			
		}
		private function onLoadAssets():void{
			nightSky = new Image(this.assets.getTexture('night'));
			nightSky.touchable = false;
			nightSky.x = 146;
			nightSky.y = 0;
						
			
			
			leaf02 = new Image(this.assets.getTexture('leaf_02'));
			leaf02.touchable = false;
			leaf02.x = 197;
			leaf02.y = 103;
			
			leaf00 = new Image(this.assets.getTexture('leaf_00'));
			leaf00.touchable = false;
			leaf00.x = 134;
			leaf00.y = 138;
			
			leaf01 = new Image(this.assets.getTexture('leaf_01'));
			leaf01.touchable = false;
			leaf01.pivotX = 302;
			leaf01.x = 340+302;
			leaf01.y = 80;
		
			
			dark_bg = new Image(this.assets.getTexture('IntroSequence_dark'));
			dark_bg.touchable = true;
			dark_bg.x = 0;
			dark_bg.y = 0;
				
			
			phone_dark_mc = new MovieClip(this.assets.getTextures("phone_dark_00"),20);
			phone_dark_mc.x = 383;
			phone_dark_mc.y = 159;
			phone_dark_mc.touchable = false;
			phone_dark_mc.loop = false; 
			phone_dark_mc.stop();
			
			phone_dark_mc.addFrameAt(1,this.assets.getTexture("phone_dark_01"), null, 0.05);
			phone_dark_mc.addFrameAt(2,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(3,this.assets.getTexture("phone_dark_02"), null, 0.05);
			phone_dark_mc.addFrameAt(4,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(5,this.assets.getTexture("phone_dark_01"), null, 0.05);
			phone_dark_mc.addFrameAt(6,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(7,this.assets.getTexture("phone_dark_02"), null, 0.05);
			phone_dark_mc.addFrameAt(8,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(9,this.assets.getTexture("phone_dark_01"), null, 0.05);
			phone_dark_mc.addFrameAt(10,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(11,this.assets.getTexture("phone_dark_02"), null, 0.05);
			phone_dark_mc.addFrameAt(12,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(13,this.assets.getTexture("phone_dark_01"), null, 0.05);
			phone_dark_mc.addFrameAt(14,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(15,this.assets.getTexture("phone_dark_02"), null, 0.05);
			phone_dark_mc.addFrameAt(16,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(17,this.assets.getTexture("phone_dark_01"), null, 0.05);
			phone_dark_mc.addFrameAt(18,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(19,this.assets.getTexture("phone_dark_02"), null, 0.05);
			phone_dark_mc.addFrameAt(20,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(21,this.assets.getTexture("phone_dark_01"), null, 0.05);
			phone_dark_mc.addFrameAt(22,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(23,this.assets.getTexture("phone_dark_02"), null, 0.05);
			phone_dark_mc.addFrameAt(24,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(25,this.assets.getTexture("phone_dark_01"), null, 0.05);
			phone_dark_mc.addFrameAt(26,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(27,this.assets.getTexture("phone_dark_02"), null, 0.05);
			phone_dark_mc.addFrameAt(28,this.assets.getTexture("phone_dark_00"), null, 0.05);
			phone_dark_mc.addFrameAt(29,this.assets.getTexture("phone_dark_01"), null, 0.05);
			phone_dark_mc.addFrameAt(30,this.assets.getTexture("phone_dark_00"), null, 0.05);
//			phone_dark_mc.addFrameAt(31,this.assets.getTexture("phone_dark_02"), null, 0.05);
//			phone_dark_mc.addFrameAt(32,this.assets.getTexture("phone_dark_00"), null, 0.05);
//			phone_dark_mc.addFrameAt(33,this.assets.getTexture("phone_dark_01"), null, 0.05);
//			phone_dark_mc.addFrameAt(34,this.assets.getTexture("phone_dark_00"), null, 0.05);
//			phone_dark_mc.addFrameAt(35,this.assets.getTexture("phone_dark_02"), null, 0.05);
//			phone_dark_mc.addFrameAt(36,this.assets.getTexture("phone_dark_00"), null, 0.05);
//			phone_dark_mc.addFrameAt(37,this.assets.getTexture("phone_dark_01"), null, 0.05);
//			phone_dark_mc.addFrameAt(38,this.assets.getTexture("phone_dark_00"), null, 0.05);
//			phone_dark_mc.addFrameAt(39,this.assets.getTexture("phone_dark_02"), null, 0.05);
//			phone_dark_mc.addFrameAt(40,this.assets.getTexture("phone_dark_00"), null, 0.05);
			
			light_bg = new Image(this.assets.getTexture('IntroSequence_lit'));
			light_bg.touchable = false;
			light_bg.x = 0;
			light_bg.y = 0;
			
			
			phone_light_mc = new MovieClip(this.assets.getTextures("phone_0"),24);
			phone_light_mc.x = 383;
			phone_light_mc.y = 159;
			phone_light_mc.touchable = false;
			phone_light_mc.loop = false; 
			phone_light_mc.stop();
			
			phone_light_mc.addFrameAt(1,this.assets.getTexture("phone_01"), null, 0.05);
			phone_light_mc.addFrameAt(2,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(3,this.assets.getTexture("phone_02"), null, 0.05);
			phone_light_mc.addFrameAt(4,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(5,this.assets.getTexture("phone_01"), null, 0.05);
			phone_light_mc.addFrameAt(6,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(7,this.assets.getTexture("phone_02"), null, 0.05);
			phone_light_mc.addFrameAt(8,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(9,this.assets.getTexture("phone_01"), null, 0.05);
			phone_light_mc.addFrameAt(10,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(11,this.assets.getTexture("phone_02"), null, 0.05);
			phone_light_mc.addFrameAt(12,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(13,this.assets.getTexture("phone_01"), null, 0.05);
			phone_light_mc.addFrameAt(14,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(15,this.assets.getTexture("phone_02"), null, 0.05);
			phone_light_mc.addFrameAt(16,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(17,this.assets.getTexture("phone_01"), null, 0.05);
			phone_light_mc.addFrameAt(18,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(19,this.assets.getTexture("phone_02"), null, 0.05);
			phone_light_mc.addFrameAt(20,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(21,this.assets.getTexture("phone_01"), null, 0.05);
			phone_light_mc.addFrameAt(22,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(23,this.assets.getTexture("phone_02"), null, 0.05);
			phone_light_mc.addFrameAt(24,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(25,this.assets.getTexture("phone_01"), null, 0.05);
			phone_light_mc.addFrameAt(26,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(27,this.assets.getTexture("phone_02"), null, 0.05);
			phone_light_mc.addFrameAt(28,this.assets.getTexture("phone_00"), null, 0.05);
			phone_light_mc.addFrameAt(29,this.assets.getTexture("phone_01"), null, 0.05);
			phone_light_mc.addFrameAt(30,this.assets.getTexture("phone_00"), null, 0.05);

			
			phone= new Image(this.assets.getTexture('phone_off'));
			phone.touchable = false;
			phone.x = 517;
			phone.y = 18;
			
			page_text = new Image(this.assets.getTexture('eng_text_00'));
			page_text.touchable = false;
			page_text.x = 0;
			page_text.y = 0;
			
			page_text_extra = new Image(this.assets.getTexture('eng_text_04'));
			page_text_extra.touchable = false;
			page_text_extra.x = 0;
			page_text_extra.y = 0;
			
			nightSky.alpha = 1;
			leaf00.alpha = 1;
			leaf01.alpha = 1;
			leaf02.alpha = 1;
			dark_bg.alpha = 1;
			phone_dark_mc.alpha = 1;
			light_bg.alpha = 0;
			phone_light_mc.alpha = 0;
			phone.alpha = 0;
			page_text.alpha = 0;
			page_text_extra.alpha = 0;
			
			this.addChildAt(nightSky,0);
			this.addChildAt(leaf02,1);
			this.addChildAt(leaf00,2);
			this.addChildAt(leaf01,3);
			
			this.addChildAt(dark_bg,4);
			this.addChildAt(phone_dark_mc,5);
			this.addChildAt(light_bg,6);
			this.addChildAt(phone_light_mc,7);
			this.addChildAt(phone,8);
			this.addChildAt(page_text,9);
			this.addChildAt(page_text_extra,10);
			
			/*	
			//	cabinSprite = new Sprite();
			//	cabinSprite.x = 0;
			//	cabinSprite.y = 0;
			
			
			cabin_ocean = new Image(this.assets.getTexture('cabin_ocean'));
			cabin_ocean.pivotX = 59;
			cabin_ocean.pivotY = 59;
			cabin_ocean.width = cabin_ocean.width*2;
			cabin_ocean.height = cabin_ocean.height*2;
			cabin_ocean.x = 250;
			cabin_ocean.y = 118;
			cabin_ocean.alpha = 1;
			this.cabinSprite.addChildAt(cabin_ocean,0);
			
			cabin_bg = new Image(this.assets.getTexture('IntroSequence_cabin'));
			cabin_bg.x = 0;
			cabin_bg.y = 0;
			cabin_bg.alpha = 1;
			this.cabinSprite.addChildAt(cabin_bg,1);
			
			cabin_screen= new Image(this.assets.getTexture('IntroSequence_cabin_overlay'));
			cabin_screen.x = 800-cabin_screen.width;
			cabin_screen.y = 0;
			cabin_screen.alpha = 0;
			this.cabinSprite.addChildAt(cabin_screen,2);
			
			cabin_screenShot = new Image(this.assets.getTexture('screen'));
			cabin_screenShot.x = 470;
			cabin_screenShot.y = 128;
			cabin_screenShot.alpha = 0;
			this.cabinSprite.addChildAt(cabin_screenShot,3);
			this.addChildAt(cabinSprite,0);
			
			*/
			(stage.getChildAt(0) as Object).screenGamePlayHandler.BlackOutRectangleFade(0,2,this.OnReady,1,false);
			Animating = true;
			this.addEventListener(Event.ENTER_FRAME, LeafAnimation);
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("WindOne",0,0.5,'stop');
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadWindOne(true,999);
		}
		
		
		private function LeafAnimation():void{
			var currentDate:Date = new Date();
			leaf02.rotation = deg2rad(Math.cos(currentDate.getTime()*0.002)*2);
			leaf00.rotation = deg2rad(Math.sin(currentDate.getTime()*0.002)*-3);
			leaf01.rotation = deg2rad(Math.sin(currentDate.getTime()*0.002)*3);
		//	leaf01.x = 250+ (Math.sin(currentDate.getTime()*0.002)*3);
		}
		
		public function OnReady(blackOut:Boolean = false):void{
			
			Starling.juggler.delayCall(StartPhone,0.5);
			
			
		}
		
		public function StartPhone():void{			
			Starling.juggler.add(phone_dark_mc);
			Starling.juggler.add(phone_light_mc);
			
			phone_dark_mc.play();
			phone_light_mc.play();
			PlayPhone();
		}
		public function PlayPhone():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Phone();
			Starling.juggler.delayCall(PlayPhoneTwo,3);
		}
		public function PlayPhoneTwo():void{
			phone_dark_mc.stop();
			phone_light_mc.stop();
			light_bg.alpha = 1;
			phone_light_mc.alpha = 1;
			phone_dark_mc.alpha = 0;
			dark_bg.alpha = 0;
			phone_dark_mc.play();
			phone_light_mc.play();
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Phone();
			Starling.juggler.delayCall(PlayPhoneFour,1.5);
		}
		public function PlayPhoneThree():void{
			phone_dark_mc.stop();
			phone_light_mc.stop();
			
			phone_dark_mc.play();
			phone_light_mc.play();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Phone();
			//Starling.juggler.delayCall(StartPhone,1.5);
			Starling.juggler.delayCall(PlayPhoneFour,1);
		}
		public function PlayPhoneFour():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PhonePutDown();
		//	(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("Phone");
			phone.alpha = 1;
			phone_light_mc.alpha = 0;
			phone_dark_mc.alpha = 0;
			
			pageTween = new Tween(page_text, 0.5, Transitions.LINEAR);
			pageTween.fadeTo(1);
			pageTween.onComplete = function():void{
				Animating = false;
				
				ActivateText();
				pageTween = null;
				//	CreateOpenNotePadHit();
			};
			Starling.juggler.add(pageTween);	
		}
		
		public function ActivateText():void{
			trace("ROOOFFF");
			Animating = false;
		}
	

		private function addTouchListener():void{
			//cabinSprite.touchable = true;
			
				this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
		}
		
		private function TextFadeIn():void{
			pageTween = new Tween(page_text, 0.5, Transitions.LINEAR);
			pageTween.fadeTo(1);
			pageTween.onComplete = function():void{
				Animating = false;
				TextFadeInOnComplete();
			
			}
			Starling.juggler.add(pageTween);
		}
		private function TextFadeInOnComplete():void{
			if(currentPage == 3){
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gong();
				
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SurpriseOne();
				
			}
		}
		
		private function TextExtraFadeIn():void{
			pageExtraTween = new Tween(page_text_extra, 0.5, Transitions.LINEAR);
			pageExtraTween.fadeTo(1);
			pageExtraTween.onComplete = function():void{
				Animating = false;
				TextFadeInOnComplete();
				
			}
			Starling.juggler.add(pageExtraTween);
		}
		
		private function TextFadeOut(num:Number):void{
			Animating = true;
			//	removeChild(hit_area);
			pageTween = new Tween(page_text, 0.5, Transitions.LINEAR);
			pageTween.fadeTo(0);
			pageTween.onComplete = function():void{
				SwapText(num);
				
			}
			Starling.juggler.add(pageTween);
		}
		
		private function SwapText(num:Number):void{
			if(num == 1){
				page_text.texture = this.assets.getTexture('eng_text_01');
		
			}else if(num == 2){
				page_text.texture = this.assets.getTexture('eng_text_02');
			
			}else if(num == 3){
				page_text.texture = this.assets.getTexture('eng_text_03');
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gong();
				(stage.getChildAt(0) as Object).MusicObj.LoadMonsterBeat(true,1);
//				(stage.getChildAt(0) as Object).MusicObj.LoadCharmsSoft(true,1);
			
			}
			TextFadeIn();
			
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			
			if(Animating === false){
				if (touches.length > 0){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						///*	if(hit_area.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						if(currentPage == 0){
							currentPage = 1;
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							TextFadeOut(1);
						}else if(currentPage == 1){
							currentPage = 2;
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							TextFadeOut(2);
						}else if(currentPage == 2){
							
						
							currentPage = 3;
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							TextFadeOut(3);
						}else if(currentPage == 3){
							currentPage = 4;
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							TextExtraFadeIn();
							//FadeOut
								
						}else if(currentPage == 4){
							
					//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							FadeOut();
						}
						//	}
					}
				}
			}
		}
		
		
		
		
		
		
		
		
		private function FadeOut():void{
			trace("FADE OUT");
			
			this.touchable = false;
			/*
			(stage.getChildAt(0) as Object).screenGamePlayHandler.addInventory();
			*/
			(stage.getChildAt(0) as Object).screenGamePlayHandler.BlackOutRectangleFade(1,2,this.delayExit,false);
		//	(stage.getChildAt(0) as Object).screenGamePlayHandler.BlackOutRectangleFade(1,2,this.Exit,false);
			
		}
		
		private function delayExit(blackOut:Boolean = false):void{
			
			
			nightSky.alpha = 0;
			dark_bg.alpha = 0;
			light_bg.alpha = 0;
			leaf00.alpha = 0;
			leaf01.alpha = 0;
			leaf02.alpha = 0;
			phone_dark_mc.alpha = 0;
			phone_light_mc.alpha = 0;
			phone.alpha = 0;
			page_text.alpha = 0;
			page_text_extra.alpha = 0
			/*
			private var nightSky:Image;
			private var dark_bg:Image;
			private var light_bg:Image;
			
			private var leaf00:Image;
			private var leaf01:Image;
			private var leaf02:Image;
			
			private var phone_dark_mc:MovieClip;
			private var phone_light_mc:MovieClip;
			
			private var phone:Image;
			*/
		//	bgTwo.alpha = 0;
		//	rain.alpha = 0;
			Starling.juggler.delayCall(FadeSounds,0.5)	
				
			Starling.juggler.delayCall(this.Exit,2);
			
		}
		
		private function FadeSounds():void{
			(stage.getChildAt(0) as Object).MusicObj.soundManager.tweenVolumeComplex("MonsterBeat",0,1,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("WindOne",0,1,'stop');
		}
		
		private function Exit(blackOut:Boolean = false):void{
			(stage.getChildAt(0) as Object).screenGamePlayHandler.addInventory();
			Starling.juggler.purge();
			this.removeEventListeners();
			
	//		delayedCall = null;
	//		touches = null;
	//		targ.dispose();
	//		targ = null;
			
			
			
			this.assets.removeTexture("IntroSequence_spriteSheet",true);
			this.assets.removeTextureAtlas("IntroSequence_spriteSheet",true);
			//	this.assets.removeTexture("IntroSequence_cabin",true);
			this.assets.removeTexture("IntroSequence_spriteSheet_02",true);
			this.assets.removeTextureAtlas("IntroSequence_spriteSheet_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("intro_01");
			(stage.getChildAt(0) as Object).falseAsset("intro_02");
			(stage.getChildAt(0) as Object).falseAsset("intro_03");
			(stage.getChildAt(0) as Object).falseAsset("intro_04");
			//	(stage.getChildAt(0) as Object).falseAsset("intro_05");
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.
				LoadScene(
					Exterior, 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorObj
				);			
			
			/*
			(stage.getChildAt(0) as Object).screenGamePlayHandler.
				LoadScene(
					IntroSequencePartTwo, 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.IntroSequencePartTwoObj
				);			
			*/
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.BlackOutRectangleFade(0,1.5,null,2,false);
			
			//	trace("EXIT INTRO");
			(stage.getChildAt(0) as Object).SavedGame.DeclareSavedGame();
			//	(stage.getChildAt(0) as Object).SavedGame.DeclareSavedGame();
			(stage.getChildAt(0) as Object).screenGamePlayHandler.UnloadScene();
			super.dispose();
			
		}
		
	}
}

