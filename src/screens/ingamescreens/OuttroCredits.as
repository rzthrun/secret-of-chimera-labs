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
	import starling.display.MovieClip;
	
	public class OuttroCredits extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var credit_mc:MovieClip;
		
		private var Animating:Boolean = false;
		
		private var CreditTween:Tween;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function OuttroCredits(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('outtroCredits_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OuttroCredits/outtroCredits_bg.jpg'));
				game.TrackAssets('outtroCredits_01');
			}
			if(game.CheckAsset('outtroCredits_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OuttroCredits/OuttroCredits_Sprite_01.png'));
				game.TrackAssets('outtroCredits_02');
			}
			if(game.CheckAsset('outtroCredits_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OuttroCredits/OuttroCredits_Sprite_01.xml'));
				game.TrackAssets('outtroCredits_03');
			}
			//OuttroCredits_Sprite_01
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
			bg = new Image(this.assets.getTexture('outtroCredits_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			credit_mc = new MovieClip(this.assets.getTextures("cred_00"),0.25);
			credit_mc.pivotX = 400;
			credit_mc.pivotY = 256;
	//		credit_mc.pivotY = 79.5;
			credit_mc.x = 400;
			credit_mc.y = 256;			
			credit_mc.touchable = false;
			credit_mc.loop = false; 
		
			credit_mc.addFrameAt(1,this.assets.getTexture("cred_01"), null, 2.5);
			credit_mc.addFrameAt(2,this.assets.getTexture("cred_02"), null, 7);
			credit_mc.addFrameAt(3,this.assets.getTexture("cred_03"), null, 7);
			credit_mc.addFrameAt(4,this.assets.getTexture("cred_04"), null, 7);
			credit_mc.addFrameAt(5,this.assets.getTexture("cred_05"), null, 7);
			//credit_mc.addFrameAt(6,this.assets.getTexture("cred_00"), null, 3);
			
			
			credit_mc.currentFrame = 1;
			credit_mc.play();
			
			credit_mc.addEventListener(Event.COMPLETE, OnCreditEnd);
			this.addChildAt(credit_mc,1);
			
			Starling.juggler.add(credit_mc);
			
			CreditTween = new Tween(credit_mc, 40, Transitions.LINEAR);
			CreditTween.animate('scaleX',0.1);		
			CreditTween.animate('scaleY',0.1);		
		
			Starling.juggler.add(CreditTween);	
			(stage.getChildAt(0) as Object).MusicObj.soundManager.tweenVolumeComplex("LightBeam",0,2,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
			(stage.getChildAt(0) as Object).MusicObj.LoadMarsLanding(true,2);
			
		//	this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		private function OnCreditEnd():void{	
			(stage.getChildAt(0) as Object).MusicObj.soundManager.tweenVolumeComplex("MarsLanding",0,2,'stop');
			
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.BlackOutRectangleFade(1,2,
				(stage.getChildAt(0) as Object).addMainMenuFromFinish
			);
			
			Animating = false;
			
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						
					}
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
			
			
			
			this.assets.removeTexture("outtroCredits_bg",true);
			
			//	this.assets.removeTextureAtlas("Raft_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("outtroCredits_01");
			
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