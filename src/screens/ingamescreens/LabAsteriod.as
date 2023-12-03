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
	import starling.utils.rad2deg;
	
	public class LabAsteriod extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var asteriodSprite:Sprite;
		private var asteriod:Image;
		private var asteriod_p00:Image;
		private var asteriod_p01:Image;
		private var asteriod_p02:Image;
		private var asteriod_p03:Image;
		private var asteriod_p04:Image;
		private var asteriod_pball:Image;
		private var asteriod_lit:Image;
		private var asteriod_cracks:Image;
		
		
		private var hit_asteriod:Shape;
	
		private var brokenAsteriodSprite:Sprite;
		private var brokenDebris:Image;
		private var brokenAsteriod_p00:Image;
		private var brokenAsteriod_p01:Image;
		private var brokenAsteriod_p02:Image;
		private var brokenAsteriod_p03:Image;
		private var brokenAsteriod_p04:Image;
		private var brokenAsteriod_p05:Image;
		private var brokenPearl:Image;
		
		private var light_blow:Image;
		private var whiteOut:Image;
		
		private var hit_pearl:Shape;
		
		private var hit_arm_00:Shape;
		private var hit_arm_01:Shape;
		private var hit_bottom:Shape;
		private var hit_top:Shape;
	
		private var prevY:Number = 100;
		
		private var WhiteOutTween:Tween;
		private var WhiteOutTween2:Tween;
		private var WhiteOutTween3:Tween;
		
		private var Animating:Boolean = false;
		
		private var AsteroidBroken:Boolean = false;
		private var PuzzleSolved:Boolean = false;
		private var PearlPickedUp:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		
		public function LabAsteriod(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('labAsteriod_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabAsteriod/labAsteriod_bg.jpg'));
				game.TrackAssets('labAsteriod_01');
			}
			if(game.CheckAsset('labAsteriod_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabAsteriod/LabAsteriod_Sprite_01.png'));
				game.TrackAssets('labAsteriod_02');
			}
			if(game.CheckAsset('labAsteriod_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabAsteriod/LabAsteriod_Sprite_01.xml'));
				game.TrackAssets('labAsteriod_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("LabAsteriod","LabAsteriodObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('labAsteriod_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Solved'] == 'Yes'){	
					PuzzleSolved = true;
				}
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod['AsteroidBroken'] == 'Yes'){	
					AsteroidBroken = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod['Pearl'] == 'PickedUp'){	
					PearlPickedUp = true;
				}
			}
			
			if(AsteroidBroken === false){
				if(PuzzleSolved === false){	
					CreateAsteriodSprite();					
					CreateAsteriodHit();
				}else{
					CreateAsteriodSprite();		
					CreateBrokenAsteriodSprite(true);	
					CreatePearlHit();
				}
			
				
			}else{
				CreateBrokenAsteriodSprite();	
				CreatePearlHit();
			}
		
			light_blow  = new Image(this.assets.getTexture('light_blow'));
			light_blow.touchable = false;
			light_blow.pivotX = 209;
			light_blow.pivotY = 108;
			light_blow.width = 800;
			light_blow.height = 512;
			light_blow.x = 418;
			light_blow.y = 216;
			
			whiteOut = new Image(this.assets.getTexture('white_block'));
			whiteOut.touchable = false;
			whiteOut.width = 800;
			whiteOut.height = 512;
			whiteOut.x = 0;
			whiteOut.y = 0;
			
			light_blow.alpha = 0;
			whiteOut.alpha = 0;
			
			this.addChild(light_blow);
			this.addChild(whiteOut);
			
			CreateArm00Hit();
			CreateArm01Hit();
			CreateBottomHit();
			CreateTopHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			if(AsteroidBroken === false){
				if(PuzzleSolved === false){
					this.addEventListener(Event.ENTER_FRAME, AsteriodAnimation);
				}else{
					Animating = true;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod;	
					}
					
					SaveArray['AsteroidBroken'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabAsteriod',SaveArray);
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AstroidBoom();
					//PlaySFX_AstroidBoom
					AsteroidBroken = true;
					this.addEventListener(Event.ENTER_FRAME, ShakeAsteriodAnimation);
					Starling.juggler.delayCall(function():void{
						BreakAsteriord();
					//	BreakAsteriord();
					},3.2);
				}
				
			}else{
				this.addEventListener(Event.ENTER_FRAME, BrokenAsteriodAnimation);
			}
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("RumblePulse",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadDrone(true,999);			
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).AmbientObj.LoadSpaceHumPower(true,999);
			},0.5);
			
		
		}
		
		
		
		private function BreakAsteriord():void{
			this.removeEventListener(Event.ENTER_FRAME, ShakeAsteriodAnimation);
			light_blow.alpha = 1;
			WhiteOutTween = new Tween(whiteOut, 1, Transitions.LINEAR);
			WhiteOutTween.fadeTo(1);
			WhiteOutTween.onComplete = function():void{
				Animating = false;
				DelayCompleteWhite();
				WhiteOutTween = null;
				
			};
			Starling.juggler.add(WhiteOutTween);	
		}
		private function DelayCompleteWhite():void{
			asteriodSprite.alpha = 0;
			brokenAsteriodSprite.alpha = 1;
			Starling.juggler.delayCall(FadeOutWhite,0.5)
		}
		private function FadeOutWhite():void{
			WhiteOutTween3  = new Tween(whiteOut, 1, Transitions.LINEAR);
			WhiteOutTween3.fadeTo(0);
			WhiteOutTween3.onComplete = function():void{
				Animating = false;
				CompleteWhiteOut();
				WhiteOutTween3 = null;
			};
			Starling.juggler.add(WhiteOutTween3);	
		}
		
		
		
		private function CompleteWhiteOut():void{
		//	asteriodSprite.alpha = 0;
		//	brokenAsteriodSprite.alpha = 1;
			light_blow.alpha = 1;
			whiteOut.alpha = 0;
			
			this.addEventListener(Event.ENTER_FRAME, BrokenAsteriodAnimation);
			
			WhiteOutTween2 = new Tween(light_blow, 2, Transitions.EASE_IN);
			WhiteOutTween2.scaleTo(0);
			WhiteOutTween2.fadeTo(1);
			WhiteOutTween2.onComplete = function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ping();
				Animating = false;
				PlayStarryNight();
				WhiteOutTween2 = null;
				
			};
			Starling.juggler.add(WhiteOutTween2);	
		}
		
		private function PlayStarryNight():void{
			if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
			
				(stage.getChildAt(0) as Object).MusicObj.LoadStarryNight(true,2);
			
			}
		}
		
		private function ShakeAsteriodAnimation():void{
			
			
			asteriodSprite.x = asteriodSprite.x + (Math.random()*2-1)*2;
			asteriodSprite.y = asteriodSprite.y + (Math.random()*2-1)*2;
		/*	var currentDate:Date = new Date();
			if(asteriodSprite.y >= 110){
				asteriodSprite.y = 110- (Math.cos(currentDate.getTime()*0.0005)*10);
			}else{
				asteriodSprite.y = 110+ (Math.cos(currentDate.getTime()*0.0005)*10);
			}
			
			if(asteriodSprite.x >= 248){
				asteriodSprite.x = 248- (Math.cos(currentDate.getTime()*0.0005)*10);
			}else{
				asteriodSprite.x = 248+ (Math.cos(currentDate.getTime()*0.0005)*10);
			}
			trace("x,y:"+asteriodSprite.x+","+asteriodSprite.y);
			
			if(((asteriodSprite.y)-prevY) > 18){
				BreakAsteriord();
			}else{
				prevY = asteriodSprite.y;
			}
		*/	
			
			
		//	asteriodSprite.y = 110+ (Math.cos(currentDate.getTime()*0.0025)*10);
		//	asteriodSprite.x = 248+ (Math.cos(currentDate.getTime()*0.0025)*10);
		//	asteriodSprite.rotation = rad2deg((Math.cos(currentDate.getTime()*0.0025)*10));
		}
		
		private function BrokenAsteriodAnimation():void{
			var currentDate:Date = new Date();
			brokenDebris.y = 65- (Math.cos(currentDate.getTime()*0.0025)*1);
			brokenAsteriod_p00.y = 102+ (Math.cos(currentDate.getTime()*0.0025)*2);
			brokenAsteriod_p01.y = 78- (Math.cos(currentDate.getTime()*0.0025)*2);
			brokenAsteriod_p02.y = 242+ (Math.cos(currentDate.getTime()*0.0025)*5);
			brokenAsteriod_p03.y = 151- (Math.cos(currentDate.getTime()*0.0025)*3);
			brokenAsteriod_p04.y = 80+ (Math.cos(currentDate.getTime()*0.0025)*4);
			brokenAsteriod_p05.y = 253- (Math.cos(currentDate.getTime()*0.0025)*2);
			brokenPearl.y 		 = 145+ (Math.cos(currentDate.getTime()*0.0025)*1);
			//asteriodSprite.x = 250+ (Math.sin(currentDate.getTime()*0.002)*3);
		}

		private function AsteriodAnimation():void{
			var currentDate:Date = new Date();
			asteriodSprite.y = 110+ (Math.cos(currentDate.getTime()*0.0025)*5);
			//asteriodSprite.x = 250+ (Math.sin(currentDate.getTime()*0.002)*3);
		}
		
		private function CreateBrokenAsteriodSprite(invis:Boolean = false):void{
			brokenAsteriodSprite = new Sprite();
			brokenAsteriodSprite.touchable = false;
			brokenAsteriodSprite. x = 0;
			brokenAsteriodSprite. y = 0;
			
			brokenDebris = new Image(this.assets.getTexture('debris'));
			brokenDebris.touchable = false;
			brokenDebris.x = 239;
			brokenDebris.y = 65;
			
			brokenAsteriod_p00 = new Image(this.assets.getTexture('broken_00'));
			brokenAsteriod_p00.touchable = false;
			brokenAsteriod_p00.x = 361;
			brokenAsteriod_p00.y = 102;
				
			brokenAsteriod_p01 = new Image(this.assets.getTexture('broken_01'));
			brokenAsteriod_p01.touchable = false;
			brokenAsteriod_p01.x = 250;
			brokenAsteriod_p01.y = 78;
			
			brokenAsteriod_p02 = new Image(this.assets.getTexture('broken_02'));
			brokenAsteriod_p02.touchable = false;
			brokenAsteriod_p02.x = 213;
			brokenAsteriod_p02.y = 242;
			
			brokenAsteriod_p03 = new Image(this.assets.getTexture('broken_03'));
			brokenAsteriod_p03.touchable = false;
			brokenAsteriod_p03.x = 427;
			brokenAsteriod_p03.y = 151;			
			
			brokenAsteriod_p04 = new Image(this.assets.getTexture('broken_04'));
			brokenAsteriod_p04.touchable = false;
			brokenAsteriod_p04.x = 390;
			brokenAsteriod_p04.y = 80;
			
			brokenAsteriod_p05 = new Image(this.assets.getTexture('broken_05'));
			brokenAsteriod_p05.touchable = false;
			brokenAsteriod_p05.x = 313;
			brokenAsteriod_p05.y = 253;
			
			brokenPearl = new Image(this.assets.getTexture('pearl'));
			brokenPearl.touchable = false;
			brokenPearl.x = 343;
			brokenPearl.y = 145;
			
			brokenAsteriod_p00.alpha = 1;
			brokenAsteriod_p01.alpha = 1;
			brokenAsteriod_p02.alpha = 1;
			brokenAsteriod_p03.alpha = 1;
			brokenAsteriod_p04.alpha = 1;
			brokenAsteriod_p05.alpha = 1;
		
			brokenDebris.alpha = 1;
			
			if(PearlPickedUp === true){
				brokenPearl.alpha = 0;
			}else{
				brokenPearl.alpha = 1;
			}
			
			
			brokenAsteriodSprite.addChildAt(brokenDebris,0);
			brokenAsteriodSprite.addChildAt(brokenAsteriod_p00,1);
			brokenAsteriodSprite.addChildAt(brokenAsteriod_p01,2);
			brokenAsteriodSprite.addChildAt(brokenAsteriod_p02,3);
			brokenAsteriodSprite.addChildAt(brokenAsteriod_p03,4);
			brokenAsteriodSprite.addChildAt(brokenAsteriod_p04,5);
			brokenAsteriodSprite.addChildAt(brokenAsteriod_p05,6);
			brokenAsteriodSprite.addChildAt(brokenPearl,7);
			
			if(invis === true){
				brokenAsteriodSprite.alpha = 0;
			}
			
			this.addChild(brokenAsteriodSprite);
			/*
			private var brokenAsteriod_p03:Image;
			private var brokenAsteriod_p04:Image;
			private var brokenAsteriod_p05:Image;
			*/
		}
		
		private function CreateAsteriodSprite():void{
			asteriodSprite = new Sprite();
			asteriodSprite.touchable = false;
			asteriodSprite. x = 248;
			asteriodSprite. y = 110;
			
			asteriod = new Image(this.assets.getTexture('asteriod'));
			asteriod.touchable = false;
			asteriod.x = 0;
			asteriod.y = 0;
			
			asteriod_p00 = new Image(this.assets.getTexture('rock_pos_00'));
			asteriod_p00.touchable = false;
			asteriod_p00.x = 142;
			asteriod_p00.y = 29;
			
			asteriod_p01 = new Image(this.assets.getTexture('rock_pos_01'));
			asteriod_p01.touchable = false;
			asteriod_p01.x = 85;
			asteriod_p01.y = 29;
			
			asteriod_p02 = new Image(this.assets.getTexture('rock_pos_02'));
			asteriod_p02.touchable = false;
			asteriod_p02.x = 81;
			asteriod_p02.y = 71;
			
			asteriod_p03 = new Image(this.assets.getTexture('rock_pos_03'));
			asteriod_p03.touchable = false;
			asteriod_p03.x = 112;
			asteriod_p03.y = 119;
			
			asteriod_p04 = new Image(this.assets.getTexture('rock_pos_04'));
			asteriod_p04.touchable = false;
			asteriod_p04.x = 168;
			asteriod_p04.y = 56;
			
			asteriod_pball = new Image(this.assets.getTexture('rock_pos_ball'));
			asteriod_pball.touchable = false;
			asteriod_pball.x = 140;
			asteriod_pball.y = 90;
			
			asteriod_lit = new Image(this.assets.getTexture('rock_lit'));
			asteriod_lit.touchable = false;
			asteriod_lit.x = 82;
			asteriod_lit.y = 30;
			
			asteriod_cracks= new Image(this.assets.getTexture('cracks'));
			asteriod_cracks.touchable = false;
			asteriod_cracks.x = 0;
			asteriod_cracks.y = 0;
			
			/*
			private var asteriod_p00:Image;
			private var asteriod_p01:Image;
			private var asteriod_p02:Image;
			private var asteriod_p03:Image;
			private var asteriod_p04:Image;
			private var asteriod_pball:Image;
			private var asteriod_lit:Image;
			*/
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				trace(":00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['RingsActive'] == 'Yes'){
					asteriod_p00.alpha = 0;
					asteriod_p01.alpha = 0;
					asteriod_p02.alpha = 0;
					asteriod_p03.alpha = 0;
					asteriod_p04.alpha = 0;
					asteriod_pball.alpha = 0;
					asteriod_lit.alpha = 1;
				}else{
					asteriod_p01.alpha = 1;
					asteriod_p03.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece00Attached'] == 'Yes'){
						asteriod_p00.alpha = 1;
					}else{
						asteriod_p00.alpha = 0;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece02Attached'] == 'Yes'){
						asteriod_p02.alpha = 1;
					}else{
						asteriod_p02.alpha = 0;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece04Attached'] == 'Yes'){
						asteriod_p04.alpha = 1;
					}else{
						asteriod_p04.alpha = 0;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['PieceBallAttached'] == 'Yes'){
						asteriod_pball.alpha = 1;
					}else{
						asteriod_pball.alpha = 0;
					}
					asteriod_lit.alpha = 0;
				}
			}else{				
						
				asteriod_p00.alpha = 0;
				asteriod_p01.alpha = 1;
				asteriod_p02.alpha = 0;
				asteriod_p03.alpha = 1;
				asteriod_p04.alpha = 0;
				asteriod_pball.alpha = 0;
				asteriod_lit.alpha = 0;
			}
			if(PuzzleSolved === true){
				asteriod_cracks.alpha = 1;
			}else{
				asteriod_cracks.alpha = 0;
			}
			
			asteriod.alpha = 1;		
			
			asteriodSprite.addChildAt(asteriod,0);
			
			asteriodSprite.addChildAt(asteriod_p00,1);
			asteriodSprite.addChildAt(asteriod_p01,2);
			asteriodSprite.addChildAt(asteriod_p02,3);
			asteriodSprite.addChildAt(asteriod_p03,4);
			asteriodSprite.addChildAt(asteriod_p04,5);
			asteriodSprite.addChildAt(asteriod_pball,6);
			asteriodSprite.addChildAt(asteriod_lit,7);
			asteriodSprite.addChildAt(asteriod_cracks,8);
			this.addChild(asteriodSprite);
			//private var asteriodSprite:Sprite;
			//private var asteriod:Image;
		}
	
		private function CreateTopHit():void{
			hit_top = new Shape();
			hit_top.touchable = false;
			hit_top.graphics.beginFill(0xff0000);
			
			hit_top.graphics.lineTo(286,35);	
			hit_top.graphics.lineTo(306,0);	
			hit_top.graphics.lineTo(541,0);	
			hit_top.graphics.lineTo(561,55);	
			hit_top.graphics.lineTo(428,97);	
			hit_top.graphics.lineTo(296,87);	
			
			hit_top.graphics.endFill(false);
			hit_top.alpha = 0.0;
			
			hit_top.graphics.precisionHitTest = true;	
			this.addChild(hit_top);
		}
		
		private function CreateBottomHit():void{
			hit_bottom = new Shape();
			hit_bottom.touchable = false;
			hit_bottom.graphics.beginFill(0xff0000);
			
			hit_bottom.graphics.lineTo(130,450);	
			hit_bottom.graphics.lineTo(213,391);	
			hit_bottom.graphics.lineTo(295,374);	
			hit_bottom.graphics.lineTo(524,374);	
			hit_bottom.graphics.lineTo(643,411);	
			hit_bottom.graphics.lineTo(608,508);	
			hit_bottom.graphics.lineTo(145,507);	
		
			hit_bottom.graphics.endFill(false);
			hit_bottom.alpha = 0.0;
			
			hit_bottom.graphics.precisionHitTest = true;	
			this.addChild(hit_bottom);
		}
		
		private function CreateArm01Hit():void{
			hit_arm_01 = new Shape();
			hit_arm_01.touchable = false;
			hit_arm_01.graphics.beginFill(0xff0000);
			
			hit_arm_01.graphics.lineTo(720,122);	
			hit_arm_01.graphics.lineTo(718,124);	
			hit_arm_01.graphics.lineTo(719,193);	
			hit_arm_01.graphics.lineTo(633,222);	
			hit_arm_01.graphics.lineTo(638,264);	
			hit_arm_01.graphics.lineTo(790,235);	
			hit_arm_01.graphics.lineTo(781,104);	
		
			hit_arm_01.graphics.endFill(false);
			hit_arm_01.alpha = 0.0;
			
			hit_arm_01.graphics.precisionHitTest = true;	
			this.addChild(hit_arm_01);
		}
		
		
		private function CreateArm00Hit():void{
			hit_arm_00 = new Shape();
			hit_arm_00.touchable = false;
			hit_arm_00.graphics.beginFill(0xff0000);
			
			hit_arm_00.graphics.lineTo(0,137);	
			hit_arm_00.graphics.lineTo(113,0);	
			hit_arm_00.graphics.lineTo(231,71);	
			hit_arm_00.graphics.lineTo(228,110);	
			hit_arm_00.graphics.lineTo(195,122);	
			hit_arm_00.graphics.lineTo(86,72);	
			hit_arm_00.graphics.lineTo(61,194);	
			hit_arm_00.graphics.lineTo(212,250);	
			hit_arm_00.graphics.lineTo(186,300);	
			hit_arm_00.graphics.lineTo(0,229);	
			
			hit_arm_00.graphics.endFill(false);
			hit_arm_00.alpha = 0.0;
			
			hit_arm_00.graphics.precisionHitTest = true;	
			this.addChild(hit_arm_00);
		}
		
		private function CreatePearlHit():void{
			hit_pearl = new Shape();
			hit_pearl.touchable = false;
			hit_pearl.graphics.beginFill(0xff0000);
			
			hit_pearl.graphics.lineTo(360,213);	
			hit_pearl.graphics.lineTo(386,162);	
			hit_pearl.graphics.lineTo(451,168);	
			hit_pearl.graphics.lineTo(478,222);	
			hit_pearl.graphics.lineTo(455,272);	
			hit_pearl.graphics.lineTo(386,273);	
			
			hit_pearl.graphics.endFill(false);
			hit_pearl.alpha = 0.0;
			
			hit_pearl.graphics.precisionHitTest = true;	
			this.addChild(hit_pearl);
		}
		private function CreateAsteriodHit():void{
			hit_asteriod = new Shape();
			hit_asteriod.touchable = false;
			hit_asteriod.graphics.beginFill(0xff0000);
			
			hit_asteriod.graphics.lineTo(233,175);	
			hit_asteriod.graphics.lineTo(281,96);	
			hit_asteriod.graphics.lineTo(402,101);	
			hit_asteriod.graphics.lineTo(527,166);	
			hit_asteriod.graphics.lineTo(554,228);	
			hit_asteriod.graphics.lineTo(537,348);	
			hit_asteriod.graphics.lineTo(438,419);	
			hit_asteriod.graphics.lineTo(339,386);	
			hit_asteriod.graphics.lineTo(258,300);	
		
			hit_asteriod.graphics.endFill(false);
			hit_asteriod.alpha = 0.0;
			
			hit_asteriod.graphics.precisionHitTest = true;	
			this.addChild(hit_asteriod);
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
							FadeOut((Lab as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LabObj,true
							);
						}else if(AsteroidBroken === false){
							if(hit_asteriod.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((LabAsteriodPuzzle as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.LabAsteriodPuzzleObj,true
								);
								
							}else if(hit_arm_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
							}else if(hit_arm_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
							}else if(hit_bottom.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
							}else if(hit_top.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
							}
						}else{
							if(hit_pearl.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PearlHandler();
							}else if(hit_arm_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
							}else if(hit_arm_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
							}else if(hit_bottom.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
							}else if(hit_top.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
							}
						}
							
						/*
						private var hit_arm_00:Shape;
						private var hit_arm_01:Shape;
						private var hit_bottom:Shape;
						private var hit_top:Shape;
						*/
					}
				}
			}
		}
		
		
		private function PearlHandler():void{
			if(PearlPickedUp === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWaveTwo();
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PearlBlue,
					'item_PearlBlue',
					'inven_pearlBlue_sm'
				);
				brokenPearl.alpha = 0;
				PearlPickedUp = true;
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod;	
				}
				
				SaveArray['Pearl'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabAsteriod',SaveArray);
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
			
			
			
			this.assets.removeTexture("labAsteriod_bg",true);
			this.assets.removeTexture("LabAsteriod_Sprite_01",true);
			this.assets.removeTextureAtlas("LabAsteriod_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("labAsteriod_01");
			(stage.getChildAt(0) as Object).falseAsset("labAsteriod_02");
			(stage.getChildAt(0) as Object).falseAsset("labAsteriod_03");
			
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
