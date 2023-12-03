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
	import starling.extensions.PDParticleSystem;
	import starling.utils.AssetManager;
	import starling.utils.deg2rad;
	
	public class OuttroWormhole extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
	//	private var bg:Image;
		
		private var star_bright:Image;
		
		private var stars_mc:MovieClip;
	//	private var wormhole_mc:MovieClip;
		private var white:Shape;
		private var wormHolePE:PDParticleSystem;
	
		
		private var WhiteTween:Tween;
		private var WhiteTweenOut:Tween;
		private var StarTween:Tween;
		
		private var rotationDeg:Number = deg2rad(360);
		
		private var Animating:Boolean = false;
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		private var SeenIt:Boolean = false;
		
		public function OuttroWormhole(_assets:AssetManager,_game:Game)
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
			
			
		
			if(game.CheckAsset('outtroWormhole_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OuttroWormhole/OuttroWormhole_Sprite_02.png'));
				game.TrackAssets('outtroWormhole_01');
			}
			if(game.CheckAsset('outtroWormhole_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OuttroWormhole/OuttroWormhole_Sprite_02.xml'));
				game.TrackAssets('outtroWormhole_02');
			}
			
			//outtroWormHole_bg
			
			if(game.CheckAsset('outtroWormhole_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/particles/wormhole/vortex.pex'));
				game.TrackAssets('outtroWormhole_03');
			}
			if(game.CheckAsset('outtroWormhole_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/particles/wormhole/vortex.png'));
				game.TrackAssets('outtroWormhole_04');
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
			
			
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.removeInventory();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Outtro != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Outtro	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Outtro['SeenIt'] == 'Yes'){
					SeenIt = true;
					SaveArray['SeenIt'] = 'No';
					
				}else{
					SaveArray['SeenIt'] = 'Yes';
				}
			}else{
				SaveArray['SeenIt'] = 'Yes';
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Outtro',SaveArray);
		
	//		wormhole_mc_2 = new MovieClip(this.assets.getTextures("wormhole_f_"),24);
	//
			
		//	stars_mc = new MovieClip(this.assets.getTextures("stars_frame__"),24);
		//	stars_mc.x = 0;
		//	stars_mc.y = 0;
		//	stars_mc.width = stars_mc.width*2;
		//	stars_mc.height = stars_mc.height*2;
		//	stars_mc.touchable = true;
		//	stars_mc.loop = true; 
			
		//	stars_mc.play();
			
			star_bright = new Image(this.assets.getTexture('light'));
			star_bright.touchable = false;
			star_bright.pivotX = 142.5;
			star_bright.pivotY = 142.5;
			star_bright.width = 0;
			star_bright.height = 0;
			star_bright.x = 400;
			star_bright.y = 256;
			
			white = new Shape();
			white.touchable = false;
			white.graphics.beginFill(0xffffff);
			white.graphics.lineTo(0,0);	
			white.graphics.lineTo(800,0);	
			white.graphics.lineTo(800,512);	
			white.graphics.lineTo(0,512);	
			white.graphics.endFill(false);
			white.alpha = 1;
			
			
			
			wormHolePE = new PDParticleSystem(this.assets.getXml('vortex'),this.assets.getTexture('vortex'));			
			wormHolePE.x = 400;
			wormHolePE.y = 256;
			Starling.juggler.add(wormHolePE);
			wormHolePE.stop();
		
			
	//		wormhole_mc.alpha = 0;
	//		wormhole_mc_2.alpha = 0;
			
	//		this.addChildAt(wormhole_mc_2,0);
	//		this.addChildAt(wormhole_mc,1);		
		//	this.addChildAt(wormhole_mc,0);	
		//	this.addChildAt(stars_mc,0);	
			this.addChildAt(wormHolePE,0);
			this.addChildAt(star_bright,1);
			
			this.addChildAt(white,2);
		
			if(SeenIt == true){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.removeMenuButton();
			}else{
				
			}
			
			Starling.juggler.delayCall(function():void{
				
				FadeWhite(0,1.0,true);
			},1.5);
		//	this.addEventListener(EnterFrameEvent.ENTER_FRAME, OnMCFrame);
		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
			
			(stage.getChildAt(0) as Object).MusicObj.LoadLightBeam(true,1);
	//		Starling.juggler.add(stars_mc);
	//	Starling.juggler.add(wormhole_mc);
			(stage.getChildAt(0) as Object).MusicObj.soundManager.tweenVolumeComplex("StarryNight",0,2,'stop');
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BlackHole",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("QuantumBalls",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("QuantumDrone",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ShipGroansOne",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BasementBongs",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("DuctVibe",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
		
		}
		
		private function FadeWhite(fadeval:int,duration:int,starStar:Boolean):void{
		//	starsPE.start();
		//	wormhole_mc.play();
			wormHolePE.start();
			WhiteTween  =  new Tween(white, duration, Transitions.LINEAR);
			WhiteTween.fadeTo(fadeval);
			
			WhiteTween.onComplete = function():void{
				
					StarAnimation();
				
				
				WhiteTween = null;
				
			}
			Starling.juggler.add(WhiteTween);
		}
		
		private function StarAnimation():void{
			
			Starling.juggler.delayCall(function():void{
				
				StarTween = new Tween(star_bright, 5, Transitions.LINEAR);
				//StarTween.animate('rotation', rotationDeg);
				StarTween.scaleTo(8);
			//	StarTween.animate("width", 2048);
			//	StarTween.animate("height", 2048)
				StarTween.onComplete = function():void{
					StarTween = null;
				}
				Starling.juggler.add(StarTween);
			},2);
			Starling.juggler.delayCall(FadeOutWhite,5.5);
			
		}
		
		private function FadeOutWhite():void{
			WhiteTweenOut  =  new Tween(white, 1.5, Transitions.LINEAR);
			WhiteTweenOut.fadeTo(1);
			
			WhiteTweenOut.onComplete = function():void{
				
				TransitionOut();
				
				WhiteTweenOut = null;
				
			}
			Starling.juggler.add(WhiteTweenOut);
			
		
		}
		
		private function TransitionOut():void{
			if(SeenIt === false){
				
				FadeOut((OuttroJupiter as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.OuttroJupiterObj,false
				);
			}else{
				
				//MarsLanding
				FadeOut((OuttroCredits as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.OuttroCreditsObj,false
				);
			
			}
		}
		
		private function FadeOut(loadClass:Class,loadObj:Object,Fade:Boolean = false):void{
			trace("FADE OUT");
		
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
			
			
			
	//	this.assets.removeTexture("outtroWormHole_bg",true);
		//	this.assets.removeTextureAtlas("OuttroStars_Sprite",true);
		//	this.assets.removeTexture("OuttroWormhole_Sprite_01",true);
			this.assets.removeTexture("OuttroWormhole_Sprite_02",true);
		//	this.assets.removeTextureAtlas("OuttroWormhole_Sprite_01",true);
			this.assets.removeTextureAtlas("OuttroWormhole_Sprite_02",true);
			
	//		(stage.getChildAt(0) as Object).falseAsset("outtroWormhole_01");
	//		(stage.getChildAt(0) as Object).falseAsset("outtroWormhole_02");
			(stage.getChildAt(0) as Object).falseAsset("outtroWormhole_01");
			(stage.getChildAt(0) as Object).falseAsset("outtroWormhole_02");
		//	(stage.getChildAt(0) as Object).falseAsset("outtroWormhole_03");
		//	(stage.getChildAt(0) as Object).falseAsset("outtroWormhole_04");
			//(stage.getChildAt(0) as Object).falseAsset("outtroWormhole_03");
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