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
	import starling.utils.deg2rad;
	import starling.utils.rad2deg;
	
	
	public class LabAsteriodPuzzle extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		
		
		private var piecesBall:Image;
		private var pieces00:Image;
		private var pieces01:Image;
		private var pieces02:Image;
		private var pieces03:Image;
		private var pieces04:Image;
		
		private var ring_01:Image;
		private var ring_02:Image;
		private var ring_03:Image;
		private var ring_04:Image;
		
		private var swatch_1:Image;
		private var swatch_2:Image;
		private var swatch_3:Image;
		private var swatch_4:Image;
		private var swatch_5:Image;
	
		private var hit_ball:Shape;
		private var hit_piece_00:Shape;
		private var hit_piece_01:Shape;
		private var hit_piece_02:Shape;
		private var hit_piece_03:Shape;
		private var hit_piece_04:Shape;
		
		private var hit_ring_01:Shape
		private var hit_ring_02:Shape
		private var hit_ring_03:Shape
		private var hit_ring_04:Shape
				
		private var Swatch01Tween:Tween;
		private var Swatch02Tween:Tween;
		private var Piece01Tween:Tween;
		private var Piece02Tween:Tween;		
		
		private var Animating:Boolean = false;
		private var RingFlag:String = null; 
		
		private var Piece00Attached:Boolean = false;
		private var Piece01Attached:Boolean = true;
		private var Piece02Attached:Boolean = false;
		private var Piece03Attached:Boolean = true;
		private var Piece04Attached:Boolean = false;
		private var PieceBallAttached:Boolean = false;
		
		private var RingsActive:Boolean = false;
		private var WindUpPlaying:Boolean = false;
		
		private var Solved:Boolean = false;
		private var MouseCurrentAngle:Number = 180;
		private var MousePrevAngle:Number = 180;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function LabAsteriodPuzzle(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('labAsteriodPuzzle_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabAsteriodPuzzle/labAsteriodPuzzle_bg.jpg'));
				game.TrackAssets('labAsteriodPuzzle_01');
			}
			if(game.CheckAsset('labAsteriodPuzzle_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabAsteriodPuzzle/LabAsteriodPuzzle_Sprite_01.png'));
				game.TrackAssets('labAsteriodPuzzle_02');
			}
			if(game.CheckAsset('labAsteriodPuzzle_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabAsteriodPuzzle/LabAsteriodPuzzle_Sprite_01.xml'));
				game.TrackAssets('labAsteriodPuzzle_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("LabAsteriodPuzzle","LabAsteriodPuzzleObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('labAsteriodPuzzle_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			
			swatch_1 = new Image(this.assets.getTexture('swatch_1'));
			swatch_1.touchable = false;					
			swatch_1.x = 184;
			swatch_1.y = 53;
			
			swatch_2 = new Image(this.assets.getTexture('swatch_2'));
			swatch_2.touchable = false;					
			swatch_2.x = 599;
			swatch_2.y = 82;
			
			swatch_3 = new Image(this.assets.getTexture('swatch_3'));
			swatch_3.touchable = false;					
			swatch_3.x = 607;
			swatch_3.y = 360;
			
			swatch_4 = new Image(this.assets.getTexture('swatch_4'));
			swatch_4.touchable = false;					
			swatch_4.x = 347;
			swatch_4.y = 493;
			
			swatch_5 = new Image(this.assets.getTexture('swatch_5'));
			swatch_5.touchable = false;					
			swatch_5.x = 105;
			swatch_5.y = 307;
			/*
			
			private var swatch_1:Image;
			private var swatch_2:Image;
			private var swatch_3:Image;
			private var swatch_4:Image;
			private var swatch_5:Image;
			*/
			
			
			ring_04 = new Image(this.assets.getTexture('ring_04'));
			ring_04.touchable = false;			
			ring_04.pivotX = 236;
			ring_04.pivotY = 236;
			ring_04.x = 150+254.5-5;
			ring_04.y = 255;
			
			
			ring_03 = new Image(this.assets.getTexture('ring_03'));
			ring_03.touchable = false;			
			ring_03.pivotX = 188;
			ring_03.pivotY = 188;
			ring_03.x = 208+197-5;
			ring_03.y = 57+197;
			
			
			ring_02 = new Image(this.assets.getTexture('ring_02'));
			ring_02.touchable = false;			
			ring_02.pivotX = 120;
			ring_02.pivotY = 120;
			ring_02.x = 273+133.5-5;
			ring_02.y = 120+133.5;	
			
			ring_01 = new Image(this.assets.getTexture('ring_01'));
			ring_01.touchable = false;			
			ring_01.pivotX = 58;
			ring_01.pivotY = 58;
			ring_01.x = 340+67-5;
			ring_01.y = 188+67;	
			
			
			/*
			private var piecesBall:Image;
			private var pieces00:Image;
			private var pieces01:Image;
			private var pieces02:Image;
			private var pieces03:Image;
			private var pieces04:Image;
			*/
			
			piecesBall = new Image(this.assets.getTexture('p_ball'));
			piecesBall.touchable = false;						
			piecesBall.x = 347;
			piecesBall.y = 201;				
			
			pieces00 = new Image(this.assets.getTexture('p_00'));
			pieces00.touchable = false;						
			pieces00.x = 344;
			pieces00.y = 19;	
						
			pieces01 = new Image(this.assets.getTexture('p_01'));
			pieces01.touchable = false;						
			pieces01.x = 184;
			pieces01.y = 24;	
			
			pieces02 = new Image(this.assets.getTexture('p_02'));
			pieces02.touchable = false;						
			pieces02.x = 165;
			pieces02.y = 179;	
			
			pieces03 = new Image(this.assets.getTexture('p_03'));
			pieces03.touchable = false;						
			pieces03.x = 266;
			pieces03.y = 297;	
			
			pieces04 = new Image(this.assets.getTexture('p_04'));
			pieces04.touchable = false;						
			pieces04.x = 439;
			pieces04.y = 115;	
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				trace(":00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['RingsActive'] == 'Yes'){
					trace(":01");
					RingsActive = true;
					Piece01Attached = true;
					Piece02Attached = true;
					Piece04Attached = true;
					
					
					ring_04.alpha = 1;
					ring_03.alpha = 1;
					ring_02.alpha = 1;
					ring_01.alpha = 1;
					
					piecesBall.alpha = 0;
					pieces00.alpha = 0;
					pieces01.alpha = 0;
					pieces02.alpha = 0;
					pieces03.alpha = 0;
					pieces04.alpha = 0;
					
					//ring_01
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['ring_01_pos'] != undefined){
						ring_01.rotation = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['ring_01_pos']; 
						trace(":02");
					}					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['ring_02_pos'] != undefined){
						ring_02.rotation = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['ring_02_pos']; 
						trace(":03");
					}					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['ring_03_pos'] != undefined){
						ring_03.rotation = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['ring_03_pos']; 
						trace(":04");
					}					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['ring_04_pos'] != undefined){
						ring_04.rotation = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['ring_04_pos']; 
						trace(":05");
					}
					
				}else{
					trace(":06");
					swatch_1.alpha = 0;
					swatch_2.alpha = 0;
					swatch_3.alpha = 0;
					swatch_4.alpha = 0;
					swatch_5.alpha = 0;
					
					ring_04.alpha = 0;
					ring_03.alpha = 0;
					ring_02.alpha = 0;
					ring_01.alpha = 0;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece00Attached'] == 'Yes'){
						trace(":07");
						pieces00.alpha = 1;
						Piece00Attached = true;
					}else{
						trace(":08");
						pieces00.alpha = 0;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece02Attached'] == 'Yes'){
						trace(":09");
						pieces02.alpha = 1;
						Piece02Attached = true;
					}else{
						trace(":10");
						pieces02.alpha = 0;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece04Attached'] == 'Yes'){
						trace(":11");
						pieces04.alpha = 1;
						Piece04Attached = true;
					}else{
						trace(":12");
						pieces04.alpha = 0;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['PieceBallAttached'] == 'Yes'){
						trace(":13");
						piecesBall.alpha = 1;
						PieceBallAttached = true;
					}else{
						trace(":14");
						piecesBall.alpha = 0;
					}
				}
			}else{
				trace(":14");
				piecesBall.alpha = 0;
				pieces00.alpha = 0;
				pieces01.alpha = 1;
				pieces02.alpha = 0;
				pieces03.alpha = 1;
				pieces04.alpha = 0;
				
				swatch_1.alpha = 0;
				swatch_2.alpha = 0;
				swatch_3.alpha = 0;
				swatch_4.alpha = 0;
				swatch_5.alpha = 0;
				
				ring_04.alpha = 0;
				ring_03.alpha = 0;
				ring_02.alpha = 0;
				ring_01.alpha = 0;
			}
		
			/*
			private var piecesBall:Image;
			private var pieces00:Image;
			private var pieces01:Image;
			private var pieces02:Image;
			private var pieces03:Image;
			private var pieces04:Image;
			*/
			
			this.addChildAt(piecesBall,1);
			this.addChildAt(pieces00,2);
			this.addChildAt(pieces01,3);
			this.addChildAt(pieces02,4);
			this.addChildAt(pieces03,5);
			this.addChildAt(pieces04,6);
			this.addChildAt(swatch_1,7);
			this.addChildAt(swatch_2,8);
			this.addChildAt(swatch_3,9);
			this.addChildAt(swatch_4,10);
			this.addChildAt(swatch_5,11);
			this.addChildAt(ring_04,12);
			this.addChildAt(ring_03,13);
			this.addChildAt(ring_02,14);
			this.addChildAt(ring_01,15);
			
			CreatePieceHits();
			CreateHitRing04();
			CreateHitRing03();
			CreateHitRing02();
			CreateHitRing01();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDrone(true,999);			
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).AmbientObj.LoadRumblePulse(true,999);
			},0.5);
		
		}
		
		/*
		
		private var hit_ball:Shape;
		private var hit_piece_00:Shape;
		private var hit_piece_01:Shape;
		private var hit_piece_02:Shape;
		private var hit_piece_03:Shape;
		private var hit_piece_04:Shape;
		*/
		private function CreatePieceHits():void{
			hit_ball = new Shape();
			hit_ball.touchable = false;
			hit_ball.graphics.beginFill(0xFF0000);
			
			hit_ball.graphics.lineTo(340,243);	
			hit_ball.graphics.lineTo(367,201);	
			hit_ball.graphics.lineTo(413,197);	
			hit_ball.graphics.lineTo(451,226);	
			hit_ball.graphics.lineTo(452,277);	
			hit_ball.graphics.lineTo(418,309);	
			hit_ball.graphics.lineTo(367,303);	
			hit_ball.graphics.lineTo(347,277);	
		
			hit_ball.graphics.endFill(false);
			hit_ball.alpha = 0.0;
			
			hit_ball.graphics.precisionHitTest = true;	
			
			hit_piece_00 = new Shape();
			hit_piece_00.touchable = false;
			hit_piece_00.graphics.beginFill(0x0000FF);
			
			hit_piece_00.graphics.lineTo(346,133);	
			hit_piece_00.graphics.lineTo(371,9);	
			hit_piece_00.graphics.lineTo(471,19);	
			hit_piece_00.graphics.lineTo(578,92);	
			hit_piece_00.graphics.lineTo(575,120);	
			hit_piece_00.graphics.lineTo(521,161);	
			hit_piece_00.graphics.lineTo(461,184);	
			hit_piece_00.graphics.lineTo(437,208);	
			hit_piece_00.graphics.lineTo(378,199);	
			
			hit_piece_00.graphics.endFill(false);
			hit_piece_00.alpha = 0.0;
			
			hit_piece_00.graphics.precisionHitTest = true;	
			
			hit_piece_01 = new Shape();
			hit_piece_01.touchable = false;
			hit_piece_01.graphics.beginFill(0xFF0000);
			
			hit_piece_01.graphics.lineTo(176,159);	
			hit_piece_01.graphics.lineTo(241,65);	
			hit_piece_01.graphics.lineTo(371,17);	
			hit_piece_01.graphics.lineTo(345,135);	
			hit_piece_01.graphics.lineTo(373,200);	
			hit_piece_01.graphics.lineTo(341,244);	
			hit_piece_01.graphics.lineTo(304,238);	
			hit_piece_01.graphics.lineTo(179,175);	
			
			hit_piece_01.graphics.endFill(false);
			hit_piece_01.alpha = 0.0;
			
			hit_piece_01.graphics.precisionHitTest = true;	
			
			
			hit_piece_02 = new Shape();
			hit_piece_02.touchable = false;
			hit_piece_02.graphics.beginFill(0x00FF00);
			
			hit_piece_02.graphics.lineTo(171,172);	
			hit_piece_02.graphics.lineTo(302,238);	
			hit_piece_02.graphics.lineTo(343,241);			
			hit_piece_02.graphics.lineTo(370,306);			
			hit_piece_02.graphics.lineTo(327,371);			
			hit_piece_02.graphics.lineTo(243,439);			
			hit_piece_02.graphics.lineTo(163,319);			
			
			hit_piece_02.graphics.endFill(false);
			hit_piece_02.alpha = 0.0;
			
			hit_piece_02.graphics.precisionHitTest = true;	
			
			hit_piece_03 = new Shape();
			hit_piece_03.touchable = false;
			hit_piece_03.graphics.beginFill(0x0000FF);
			
			hit_piece_03.graphics.lineTo(251,433);	
			hit_piece_03.graphics.lineTo(322,375);	
			hit_piece_03.graphics.lineTo(369,304);	
			hit_piece_03.graphics.lineTo(445,294);	
			hit_piece_03.graphics.lineTo(470,313);	
			hit_piece_03.graphics.lineTo(518,460);	
			hit_piece_03.graphics.lineTo(387,491);	
			hit_piece_03.graphics.lineTo(269,456);	
			
			hit_piece_03.graphics.endFill(false);
			hit_piece_03.alpha = 0.0;
			
			hit_piece_03.graphics.precisionHitTest = true;	
			
			hit_piece_04 = new Shape();
			hit_piece_04.touchable = false;
			hit_piece_04.graphics.beginFill(0xFF0000);
			
			hit_piece_04.graphics.lineTo(438,212);	
			hit_piece_04.graphics.lineTo(461,185);	
			hit_piece_04.graphics.lineTo(537,149);	
			hit_piece_04.graphics.lineTo(638,212);	
			hit_piece_04.graphics.lineTo(626,337);	
			hit_piece_04.graphics.lineTo(518,456);	
			hit_piece_04.graphics.lineTo(468,312);	
						
			hit_piece_04.graphics.endFill(false);
			hit_piece_04.alpha = 0.0;
			
			hit_piece_04.graphics.precisionHitTest = true;	
			
			this.addChild(hit_piece_00);
			this.addChild(hit_piece_01);
			this.addChild(hit_piece_02);
			this.addChild(hit_piece_03);
			this.addChild(hit_piece_04);
			this.addChild(hit_ball);
		}
		
		private function CreateHitRing01():void{
			hit_ring_01 = new Shape();
			hit_ring_01.touchable = false;
			hit_ring_01.graphics.beginFill(0xFF0000);
			
			hit_ring_01.graphics.lineTo(339,244);	
			hit_ring_01.graphics.lineTo(360,205);	
			hit_ring_01.graphics.lineTo(396,193);	
			hit_ring_01.graphics.lineTo(439,205);	
			hit_ring_01.graphics.lineTo(460,237);	
			hit_ring_01.graphics.lineTo(450,285);	
			hit_ring_01.graphics.lineTo(411,310);	
			hit_ring_01.graphics.lineTo(366,303);	
			hit_ring_01.graphics.lineTo(348,281);			
			
			hit_ring_01.graphics.endFill(false);
			hit_ring_01.alpha = 0.0;
			
			hit_ring_01.graphics.precisionHitTest = true;	
			this.addChild(hit_ring_01);
		}
		
		private function CreateHitRing02():void{
			hit_ring_02 = new Shape();
			hit_ring_02.touchable = false;
			hit_ring_02.graphics.beginFill(0x0000ff);
			
			hit_ring_02.graphics.lineTo(278,252);
			hit_ring_02.graphics.lineTo(303,181);
			hit_ring_02.graphics.lineTo(378,137);
			hit_ring_02.graphics.lineTo(454,149);
			hit_ring_02.graphics.lineTo(509,206);
			hit_ring_02.graphics.lineTo(511,292);
			hit_ring_02.graphics.lineTo(458,355);
			hit_ring_02.graphics.lineTo(381,369);
			hit_ring_02.graphics.lineTo(303,321);		
		
			hit_ring_02.graphics.endFill(false);
			hit_ring_02.alpha = 0.0;
			
			hit_ring_02.graphics.precisionHitTest = true;	
			this.addChild(hit_ring_02);
		}
		
		private function CreateHitRing03():void{
			hit_ring_03 = new Shape();
			hit_ring_03.touchable = false;
			hit_ring_03.graphics.beginFill(0x00ff00);
			
			hit_ring_03.graphics.lineTo(210,257);	
			hit_ring_03.graphics.lineTo(245,144);	
			hit_ring_03.graphics.lineTo(348,70);	
			hit_ring_03.graphics.lineTo(459,75);	
			hit_ring_03.graphics.lineTo(557,154);	
			hit_ring_03.graphics.lineTo(578,297);	
			hit_ring_03.graphics.lineTo(495,411);	
			hit_ring_03.graphics.lineTo(346,432);	
			hit_ring_03.graphics.lineTo(243,355);		
	
			hit_ring_03.graphics.endFill(false);
			hit_ring_03.alpha = 0.0;
			
			hit_ring_03.graphics.precisionHitTest = true;	
			this.addChild(hit_ring_03);
		}
		
		private function CreateHitRing04():void{
			hit_ring_04 = new Shape();
			hit_ring_04.touchable = false;
			hit_ring_04.graphics.beginFill(0x0000ff);
			
			hit_ring_04.graphics.lineTo(154,234);	
			hit_ring_04.graphics.lineTo(208,94);	
			hit_ring_04.graphics.lineTo(348,9);	
			hit_ring_04.graphics.lineTo(508,34);	
			hit_ring_04.graphics.lineTo(615,143);	
			hit_ring_04.graphics.lineTo(638,292);	
			hit_ring_04.graphics.lineTo(572,428);	
			hit_ring_04.graphics.lineTo(401,494);	
			hit_ring_04.graphics.lineTo(230,435);	
		
			//hit_ring_04.graphics.lineTo(131,243);	
			
			hit_ring_04.graphics.endFill(false);
			hit_ring_04.alpha = 0.0;
			
			hit_ring_04.graphics.precisionHitTest = true;	
			this.addChild(hit_ring_04);
		}
		
	//RingsActive
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				
				if(Animating === false){
					if(RingsActive === false){
						if (touches[0].phase == TouchPhase.BEGAN) {		
							trace(touches[0].globalX+" ,"+touches[0].globalY);
							if(targ == goback.SourceImage){
							
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((LabAsteriod as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.LabAsteriodObj,true
								);
							}else if(hit_ball.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
								BallHandler();
							}else if(hit_piece_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								Pos00Handler();
							}else if(hit_piece_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								Pos01Handler();
							}else if(hit_piece_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								Pos02Handler();
							}else if(hit_piece_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								Pos03Handler();
								
							}else if(hit_piece_04.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								Pos04Handler();
							}
						}
					}else{
						if (touches[0].phase == TouchPhase.BEGAN) {		
							trace(touches[0].globalX+" ,"+touches[0].globalY+"  -YAR");
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((LabAsteriod as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.LabAsteriodObj,true
								);
								
							}else if(hit_ring_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								MousePrevAngle = (
									((Math.atan2(touches[0].globalY-252, touches[0].globalX-404))
										*180
									)/ Math.PI
								)+180;
									trace("ring_01");
									RingFlag = 'ring_01';
					
							}else if(hit_ring_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								MousePrevAngle = (
									((Math.atan2(touches[0].globalY-252, touches[0].globalX-404))
										*180
									)/ Math.PI
								)+180;
								
								trace("ring_02");
								RingFlag = 'ring_02';
							}else if(hit_ring_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								MousePrevAngle = (
									((Math.atan2(touches[0].globalY-252, touches[0].globalX-404))
										*180
									)/ Math.PI
								)+180;
								
								trace("ring_03");
								RingFlag = 'ring_03';
							}else if(hit_ring_04.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								MousePrevAngle = (
									((Math.atan2(touches[0].globalY-252, touches[0].globalX-404))
										*180
									)/ Math.PI
								)+180;
								
								trace("ring_04");
								RingFlag = 'ring_04';
							}else{
								
								RingFlag = null;
							}	
						
						}else if(touches[0].phase == TouchPhase.MOVED){
							DiscMover();
						}else if(touches[0].phase == TouchPhase.ENDED){
							if(RingFlag != null){
								SaveRingPositions();
								trace(RingFlag+" rotation: "+rad2deg(this[(RingFlag)].rotation));
							}
							trace("MouseUP");
							WindUpPlaying = false;
							(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("WindUp");
							if(Solved === false){
								RingFlag = null;
								MousePrevAngle = 180;
								MouseCurrentAngle = 180;
								//SaveHandPositions();
								Solve();
							}else{
								trace("MouseUP on Solve");
							}
						}
					}
				}
				

			}
		}
		
		private function CheckActivation():void{
			if(Piece00Attached === true){
				if(Piece01Attached === true){
					if(Piece02Attached === true){
						if(Piece03Attached === true){
							if(Piece04Attached === true){
								if(PieceBallAttached === true){
									Animating = true;
									RingsActive = true;
								
									
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){	
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle;	
									}
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicWaffle();
									SaveArray['RingsActive'] = "Yes";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabAsteriodPuzzle',SaveArray);
									
									
									AnimateRing1();
								}
							}
						}
					}
				}
			}			
		}
		/*
		swatch_1.alpha = 1;
		swatch_2.alpha = 1;
		swatch_3.alpha = 1;
		swatch_4.alpha = 1;
		swatch_5.alpha = 1;
		
		ring_04.alpha = 1;
		ring_03.alpha = 1;
		ring_02.alpha = 1;
		ring_01.alpha = 1;
		
		private var Swatch01Tween:Tween;
		private var Swatch02Tween:Tween;
		private var Piece01Tween:Tween;
		private var Piece02Tween:Tween;
		*/
		
		
		
		private function AnimateRing1():void{			
			Piece01Tween = new Tween(ring_01, 0.75, Transitions.LINEAR);
			Piece01Tween.fadeTo(1);
			Piece01Tween.onComplete = function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
				AnimateRing2();
				Piece01Tween = null;
			};
			Starling.juggler.add(Piece01Tween);	
		}
		private function AnimateRing2():void{			
			Piece02Tween = new Tween(ring_02, 0.75, Transitions.LINEAR);
			Piece02Tween.fadeTo(1);
			Piece02Tween.onComplete = function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
				AnimateRing3();
				Piece01Tween = null;
			};
			Starling.juggler.add(Piece02Tween);	
		}
		private function AnimateRing3():void{			
			Piece01Tween = new Tween(ring_03, 0.75, Transitions.LINEAR);
			Piece01Tween.fadeTo(1);
			Piece01Tween.onComplete = function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
				AnimateRing4();
				Piece01Tween = null;
			};
			Starling.juggler.add(Piece01Tween);	
		}
		private function AnimateRing4():void{			
			Piece02Tween = new Tween(ring_04, 0.75, Transitions.LINEAR);
			Piece02Tween.fadeTo(1);
			Piece02Tween.onComplete = function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
			
				TurnOnSwatches();
				Animating = false;
				Piece02Tween = null;
			};
			Starling.juggler.add(Piece02Tween);	
		}
		private function TurnOnSwatches():void{
			
			swatch_1.alpha = 1;
			swatch_2.alpha = 1;
			swatch_3.alpha = 1;
			swatch_4.alpha = 1;
			swatch_5.alpha = 1;
			
			piecesBall.alpha = 0;
			pieces00.alpha = 0;
			pieces01.alpha = 0;
			pieces02.alpha = 0;
			pieces03.alpha = 0;
			pieces04.alpha = 0;
			
		}
		
		private function BallHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Orb)
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpThree();
				PieceBallAttached = true;	
				piecesBall.alpha = 1;
				
				CheckActivation();
						
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle;	
				}
				
				SaveArray['PieceBallAttached'] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabAsteriodPuzzle',SaveArray);				
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_Orb,
						"item_Orb"
					);
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a round hole in the center of the radial pattern...");	
			}
		}
		
		private function Pos04Handler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_StoneThree)
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpThree();
				Piece04Attached = true;	
				pieces04.alpha = 1;
				
				CheckActivation();
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle;	
				}
				
				SaveArray['Piece04Attached'] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabAsteriodPuzzle',SaveArray);
				
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_StoneThree,
						"item_StoneThree"
					);
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_StoneOne)
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The piece doesn't seem to fit there, better try another spot.");	
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_StoneTwo)
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The piece doesn't fit into that area... maybe try another.");	
			}else{
				if(Piece04Attached === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A section of the meteor seems to have been cut or knocked out.");	
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The stone fits neatly into the meteor.");	
				}
			}
		}
		private function Pos03Handler():void{
			(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't tell if this is a naturally occurring form or not...");	
		}
		private function Pos02Handler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_StoneOne)
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpThree();
				Piece02Attached = true;	
				pieces02.alpha = 1;
				
				CheckActivation();
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle;	
				}
				
				SaveArray['Piece02Attached'] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabAsteriodPuzzle',SaveArray);
				
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_StoneOne,
						"item_StoneOne"
					);
						
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_StoneThree)
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The piece doesn't seem to fit there, better try another spot.");	
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_StoneTwo)
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The piece doesn't fit into that area... maybe try another.");	
			}else{
				if(Piece02Attached === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A section of the meteor seems to have been cut or knocked out.");	
				}else{
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The stone fits neatly into the meteor.");	
				}
			}
		}
		private function Pos01Handler():void{
			(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This section of the meteor differs significantly in mineral make-up and content.");	
		}
		private function Pos00Handler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_StoneTwo)
			{
				Piece00Attached = true;	
				pieces00.alpha = 1;
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpThree();
				CheckActivation();
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle;	
				}
				
				SaveArray['Piece00Attached'] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabAsteriodPuzzle',SaveArray);
				
			
				(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_StoneTwo,
							"item_StoneTwo"
						);
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_StoneThree)
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The piece doesn't seem to fit there, better try another spot.");	
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_StoneOne)
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The piece doesn't fit into that area... maybe try another.");	
			}else{
				if(Piece00Attached === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A section of the meteor seems to have been cut or knocked out.");	
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The stone fits neatly into the meteor.");	
				}
			}
			
		}
		
		
		private function DiscMover():void{
			//trace("MOUSE MOVED");
			MouseCurrentAngle = (
				((Math.atan2(touches[0].globalY-252, touches[0].globalX-404))
					*180
				)/ Math.PI
			)+180;
			//	if((Math.abs(MouseCurrentAngle-MousePrevAngle)) > 1){
			
			
			if(RingFlag == 'ring_04'){
				if((Math.abs(MouseCurrentAngle-MousePrevAngle)) > 0.1){
					if(WindUpPlaying === false){
						WindUpPlaying = true;
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WindUp();
					}
					if(MousePrevAngle > MouseCurrentAngle){
						ring_04.rotation = ring_04.rotation-(deg2rad(0.25));
					}else if(MousePrevAngle < MouseCurrentAngle){
						ring_04.rotation = ring_04.rotation+(deg2rad(0.25));
					}
				}
				
			}
			else if(RingFlag == 'ring_03'){
				if((Math.abs(MouseCurrentAngle-MousePrevAngle)) > 0.2){
					if(WindUpPlaying === false){
						WindUpPlaying = true;
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WindUp();
					}
					if(MousePrevAngle > MouseCurrentAngle){
						ring_03.rotation = ring_03.rotation-(deg2rad(0.5));
					}else if(MousePrevAngle < MouseCurrentAngle){
						ring_03.rotation = ring_03.rotation+(deg2rad(0.5));
					}
				}
			}
			else if(RingFlag == 'ring_02'){
				if((Math.abs(MouseCurrentAngle-MousePrevAngle)) > 0.3){
					if(WindUpPlaying === false){
						WindUpPlaying = true;
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WindUp();
					}
					if(MousePrevAngle > MouseCurrentAngle){
						ring_02.rotation = ring_02.rotation-(deg2rad(0.75));
					}else if(MousePrevAngle < MouseCurrentAngle){
						ring_02.rotation = ring_02.rotation+(deg2rad(0.75));
					}
				}
				
			}
			else if(RingFlag == 'ring_01'){
				if((Math.abs(MouseCurrentAngle-MousePrevAngle)) > 0.4){
					if(WindUpPlaying === false){
						WindUpPlaying = true;
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WindUp();
					}
					if(MousePrevAngle > MouseCurrentAngle){
						ring_01.rotation = ring_01.rotation-(deg2rad(1));
					}else if(MousePrevAngle < MouseCurrentAngle){
						ring_01.rotation = ring_01.rotation+(deg2rad(1));
					}
				}
				
			}
			
			
			
			//	}
			MousePrevAngle = MouseCurrentAngle;
		}
		
		private function SaveRingPositions():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle;
			}
			
			SaveArray[RingFlag+"_pos"] = this[(RingFlag)].rotation;
			//	SaveArray['HourHand'] = hourHandHolder.rotation;
			//	SaveArray['MinuteHand'] = minuteHandHolder.rotation;
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabAsteriodPuzzle',SaveArray);
		}
		
		
		
		private function Solve():void{
			if(ring_04.rotation > deg2rad(-103) && ring_04.rotation < deg2rad(-92)){
				if(ring_03.rotation > deg2rad(150) && ring_03.rotation < deg2rad(157)){
					if(ring_02.rotation > deg2rad(24) && ring_02.rotation < deg2rad(31)){
						if(ring_01.rotation > deg2rad(-147) && ring_01.rotation < deg2rad(-141)){
							trace("SOLVE");
							trace("SOLVE");
							trace("SOLVE");
							Animating = true;
							
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){	
								SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle;	
							}
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_EnergyPulse();
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
							SaveArray['Solved'] = "Yes";
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabAsteriodPuzzle',SaveArray);
							
							Starling.juggler.delayCall(function():void{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
								FadeOut((LabAsteriod as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.LabAsteriodObj,true
								);
							},2);
						
						}else{
							trace("FAIL ON 1");
						}
					}else{
						trace("FAIL ON 2");
					}
				}else{
					trace("FAIL ON 3");
				}
			}else{
				trace("FAIL ON 4");
			}
			
			trace("ring_01.rotation: "+rad2deg(ring_01.rotation));
			//ring_01.rotation: -144.00000000000102
			trace("ring_02.rotation: "+rad2deg(ring_02.rotation));
			//ring_02.rotation: 27.000000000000014
			trace("ring_03.rotation: "+rad2deg(ring_03.rotation));
			//ring_03.rotation: 153.00000000000165
			trace("ring_04.rotation: "+rad2deg(ring_04.rotation));
			//ring_04.rotation: -99.24999999999923
			trace("Attempting solve");
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
			
			
			
			this.assets.removeTexture("labAsteriodPuzzle_bg",true);
			this.assets.removeTexture("LabAsteriodPuzzle_Sprite_01",true);
			this.assets.removeTextureAtlas("LabAsteriodPuzzle_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("labAsteriodPuzzle_01");
			(stage.getChildAt(0) as Object).falseAsset("labAsteriodPuzzle_02");
			(stage.getChildAt(0) as Object).falseAsset("labAsteriodPuzzle_03");
			
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
