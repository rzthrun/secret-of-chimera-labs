package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.DelayedCall;
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
	import starling.text.TextField;
	import starling.utils.AssetManager;
	import starling.utils.HAlign;
	
	
	
	public class BuildingOfficePushBox extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var pushbox:Image;
		private var backLights:Image;
		
		private var pos_00_lit:Image;
		private var pos_01_lit:Image;
		private var pos_02_lit:Image;
		private var pos_03_lit:Image;
		private var pos_04_lit:Image;
		private var pos_05_lit:Image;
		//	private var hit_elevator_door:Shape;
		
		private var tBlock00:TextField;
		private var tBlock01:TextField;
		private var tBlock02:TextField;
		private var tBlock03:TextField;
		private var tBlock04:TextField;
		private var tBlock05:TextField;
	
		private var hit_pushbox:Shape;
		private var hit_button_up:Shape;
		private var hit_button_down:Shape;
		private var hit_button_left:Shape;
		private var hit_button_right:Shape;
		private var hit_button_clear:Shape;
		private var hit_button_enter:Shape
		
		private var hit_screen_00:Shape;
		private var hit_screen_01:Shape;
		private var hit_screen_02:Shape;
		private var hit_screen_03:Shape;
		private var hit_screen_04:Shape;
		private var hit_screen_05:Shape;
		
		private var hit_numbers:Shape;
		
		private var BackLightsTween:Tween;
		
		private var RONum:int = 0;
		
		private var CurrentPos:int = 0;
		private var PushBoxAttached:Boolean = false;
		private var Animating:Boolean = false;
		
		private var delayedCall:DelayedCall;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;
		
		public function BuildingOfficePushBox(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('buildingOfficePushBox_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficePushBox/buildingOfficePushBox_bg.jpg'));
				game.TrackAssets('buildingOfficePushBox_01');
			}
			if(game.CheckAsset('buildingOfficePushBox_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficePushBox/BuildingOfficePushBox_Sprite.png'));
				game.TrackAssets('buildingOfficePushBox_02');
			}
			if(game.CheckAsset('buildingOfficePushBox_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficePushBox/BuildingOfficePushBox_Sprite.xml'));
				game.TrackAssets('buildingOfficePushBox_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BuildingOfficePushBox","BuildingOfficePushBoxObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('buildingOfficePushBox_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			//	CreateElevatorDoorHit();
			/*
			private var pushbox:Image;
			
			private var bg_lit_00:Image;
			private var bg_lit_01:Image;
			private var bg_lit_02:Image;
			private var bg_lit_03:Image;
			private var bg_lit_04:Image;
			private var bg_lit_05:Image;
			*/
			
			pushbox = new Image(this.assets.getTexture('push_box'));
			pushbox.touchable = false;
			pushbox.x = 415;
			pushbox.y = 28;
			
			backLights = new Image(this.assets.getTexture('lights'));
			backLights.touchable = false;
			backLights.x = 116;
			backLights.y = 30;
			
			pos_00_lit = new Image(this.assets.getTexture('pos_00_lit'));
			pos_00_lit.touchable = false;
			pos_00_lit.x = 116;
			pos_00_lit.y = 30;
						
			pos_01_lit = new Image(this.assets.getTexture('pos_01_lit'));
			pos_01_lit.touchable = false;
			pos_01_lit.x = 270;
			pos_01_lit.y = 30;
			
			pos_02_lit = new Image(this.assets.getTexture('pos_02_lit'));
			pos_02_lit.touchable = false;
			pos_02_lit.x = 117;
			pos_02_lit.y = 180;
						
			pos_03_lit = new Image(this.assets.getTexture('pos_03_lit'));
			pos_03_lit.touchable = false;
			pos_03_lit.x = 270;
			pos_03_lit.y = 181;
			
			pos_04_lit = new Image(this.assets.getTexture('pos_04_lit'));
			pos_04_lit.touchable = false;
			pos_04_lit.x = 117;
			pos_04_lit.y = 339;
			
			pos_05_lit = new Image(this.assets.getTexture('pos_05_lit'));
			pos_05_lit.touchable = false;
			pos_05_lit.x = 269;
			pos_05_lit.y = 339;
			
			tBlock00 = new TextField(150,135,"*","digital", 135, 0x000000);
			tBlock00.touchable = false;
			tBlock00.hAlign = starling.utils.HAlign.LEFT;
			tBlock00.x = 145;
			tBlock00.y = 25;
			
			tBlock01 = new TextField(150,135,"*","digital", 135, 0x000000);
			tBlock01.touchable = false;
			tBlock01.hAlign = starling.utils.HAlign.LEFT;
			tBlock01.x = 300;
			tBlock01.y = 25;
			
			tBlock02 = new TextField(150,135,"*","digital", 135, 0x000000);
			tBlock02.touchable = false;
			tBlock02.hAlign = starling.utils.HAlign.LEFT;
			tBlock02.x = 145;
			tBlock02.y = 180;
			
			tBlock03 = new TextField(150,135,"*","digital", 135, 0x000000);
			tBlock03.touchable = false;
			tBlock03.hAlign = starling.utils.HAlign.LEFT;
			tBlock03.x = 300;
			tBlock03.y = 180;
			
			tBlock04 = new TextField(150,135,"*","digital", 135, 0x000000);
			tBlock04.touchable = false;
			tBlock04.hAlign = starling.utils.HAlign.LEFT;
			tBlock04.x = 145;
			tBlock04.y = 335;
			
			tBlock05 = new TextField(150,135,"*","digital", 135, 0x000000);
			tBlock05.touchable = false;
			tBlock05.hAlign = starling.utils.HAlign.LEFT;
			tBlock05.x = 300;
			tBlock05.y = 335;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['PushBox'] == 'Attached'){	
					PushBoxAttached = true;
					pushbox.alpha = 1;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['tBlock00'] != undefined){
						tBlock00.text = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['tBlock00'];
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['tBlock01'] != undefined){
						tBlock01.text = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['tBlock01'];
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['tBlock02'] != undefined){
						tBlock02.text = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['tBlock02'];
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['tBlock03'] != undefined){
						tBlock03.text = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['tBlock03'];
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['tBlock04'] != undefined){
						tBlock04.text = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['tBlock04'];
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['tBlock05'] != undefined){
						tBlock05.text = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['tBlock05'];
					}
					
					
					backLights.alpha = 1;
					tBlock00.alpha = 1;
					tBlock01.alpha = 1;
					tBlock02.alpha = 1;
					tBlock03.alpha = 1;
					tBlock04.alpha = 1;
					tBlock05.alpha = 1;
					pos_00_lit.alpha = 0;
					pos_01_lit.alpha = 0;
					pos_02_lit.alpha = 0;
					pos_03_lit.alpha = 0;
					pos_04_lit.alpha = 0;
					pos_05_lit.alpha = 0;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['CurrentPos'] == '0'){	
						CurrentPos = 0;
						pos_00_lit.alpha = 1;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['CurrentPos'] == '1'){	
						CurrentPos = 1;
						pos_01_lit.alpha = 1;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['CurrentPos'] == '2'){
						CurrentPos = 2;
						pos_02_lit.alpha = 1;			
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['CurrentPos'] == '3'){
						CurrentPos = 3;
						pos_03_lit.alpha = 1;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['CurrentPos'] == '4'){
						CurrentPos = 4;
						pos_04_lit.alpha = 1;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox['CurrentPos'] == '5'){
						CurrentPos = 5;
						pos_05_lit.alpha = 1;
					}else{
						CurrentPos = 0;
						pos_00_lit.alpha = 1;
					}
				}else{
					pushbox.alpha = 0;
					backLights.alpha = 0;
					pos_00_lit.alpha = 0;
					pos_01_lit.alpha = 0;
					pos_02_lit.alpha = 0;
					pos_03_lit.alpha = 0;
					pos_04_lit.alpha = 0;
					pos_05_lit.alpha = 0;
					
					tBlock00.alpha = 0;
					tBlock01.alpha = 0;
					tBlock02.alpha = 0;
					tBlock03.alpha = 0;
					tBlock04.alpha = 0;
					tBlock05.alpha = 0;
				}
			}else{
				
				pushbox.alpha = 0;
				backLights.alpha = 0;
				pos_00_lit.alpha = 0;
				pos_01_lit.alpha = 0;
				pos_02_lit.alpha = 0;
				pos_03_lit.alpha = 0;
				pos_04_lit.alpha = 0;
				pos_05_lit.alpha = 0;
				
				tBlock00.alpha = 0;
				tBlock01.alpha = 0;
				tBlock02.alpha = 0;
				tBlock03.alpha = 0;
				tBlock04.alpha = 0;
				tBlock05.alpha = 0;
			}
			
			
			
		//	backLights.alpha = 0;
			this.addChildAt(pushbox,1);
			this.addChildAt(backLights,2);
			this.addChildAt(pos_00_lit,3);
			this.addChildAt(pos_01_lit,4);
			this.addChildAt(pos_02_lit,5);
			this.addChildAt(pos_03_lit,6);
			this.addChildAt(pos_04_lit,7);
			this.addChildAt(pos_05_lit,8);
			
			this.addChildAt(tBlock00,9);
			this.addChildAt(tBlock01,10);
			this.addChildAt(tBlock02,11);
			this.addChildAt(tBlock03,12);
			this.addChildAt(tBlock04,13);
			this.addChildAt(tBlock05,14);
			CreateNumbersHit();
			
			CreateScreenHits();
			CreatePushBoxHit();
			CreateButtonHits();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		
		
		private function CreateScreenHits():void{
			hit_screen_00 = new Shape();
			hit_screen_00.touchable = false;
			hit_screen_00.graphics.beginFill(0xff0000);
			
			hit_screen_00.graphics.lineTo(110,23);	
			hit_screen_00.graphics.lineTo(235,28);	
			hit_screen_00.graphics.lineTo(233,156);	
			hit_screen_00.graphics.lineTo(111,148);	
			
			hit_screen_00.graphics.endFill(false);
			hit_screen_00.alpha = 0.0;
			
			hit_screen_00.graphics.precisionHitTest = true;	
			
			
			hit_screen_01 = new Shape();
			hit_screen_01.touchable = false;
			hit_screen_01.graphics.beginFill(0xff0000);
			
			hit_screen_01.graphics.lineTo(269,26);	
			hit_screen_01.graphics.lineTo(388,28);	
			hit_screen_01.graphics.lineTo(385,156);	
			hit_screen_01.graphics.lineTo(266,154);	
				
			hit_screen_01.graphics.endFill(false);
			hit_screen_01.alpha = 0.0;
			
			hit_screen_01.graphics.precisionHitTest = true;	
			
			
			hit_screen_02 = new Shape();
			hit_screen_02.touchable = false;
			hit_screen_02.graphics.beginFill(0xff0000);
			
			hit_screen_02.graphics.lineTo(109,179);	
			hit_screen_02.graphics.lineTo(236,183);	
			hit_screen_02.graphics.lineTo(230,309);	
			hit_screen_02.graphics.lineTo(109,305);	
			
			hit_screen_02.graphics.endFill(false);
			hit_screen_02.alpha = 0.0;
			
			hit_screen_02.graphics.precisionHitTest = true;	
			
			
			hit_screen_02 = new Shape();
			hit_screen_02.touchable = false;
			hit_screen_02.graphics.beginFill(0xff0000);
			
			hit_screen_02.graphics.lineTo(109,179);	
			hit_screen_02.graphics.lineTo(236,183);	
			hit_screen_02.graphics.lineTo(230,309);	
			hit_screen_02.graphics.lineTo(109,305);	
			
			hit_screen_02.graphics.endFill(false);
			hit_screen_02.alpha = 0.0;
			
			hit_screen_02.graphics.precisionHitTest = true;	
			
			
			hit_screen_03 = new Shape();
			hit_screen_03.touchable = false;
			hit_screen_03.graphics.beginFill(0xff0000);
			
			hit_screen_03.graphics.lineTo(267,179);	
			hit_screen_03.graphics.lineTo(393,181);	
			hit_screen_03.graphics.lineTo(390,308);	
			hit_screen_03.graphics.lineTo(267,303);	
			
			hit_screen_03.graphics.endFill(false);
			hit_screen_03.alpha = 0.0;
			
			hit_screen_03.graphics.precisionHitTest = true;	
			
			
			hit_screen_04 = new Shape();
			hit_screen_04.touchable = false;
			hit_screen_04.graphics.beginFill(0xff0000);
			
			hit_screen_04.graphics.lineTo(108,336);	
			hit_screen_04.graphics.lineTo(231,337);	
			hit_screen_04.graphics.lineTo(233,467);	
			hit_screen_04.graphics.lineTo(108,466);	
			
			hit_screen_04.graphics.endFill(false);
			hit_screen_04.alpha = 0.0;
			
			hit_screen_04.graphics.precisionHitTest = true;	
			
			
			hit_screen_05 = new Shape();
			hit_screen_05.touchable = false;
			hit_screen_05.graphics.beginFill(0xff0000);
			
			hit_screen_05.graphics.lineTo(265,337);	
			hit_screen_05.graphics.lineTo(389,338);	
			hit_screen_05.graphics.lineTo(387,464);	
			hit_screen_05.graphics.lineTo(266,464);	
			
			
			hit_screen_05.graphics.endFill(false);
			hit_screen_05.alpha = 0.0;
			
			hit_screen_05.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_screen_00);
			this.addChild(hit_screen_01);
			this.addChild(hit_screen_02);
			this.addChild(hit_screen_03);
			this.addChild(hit_screen_04);
			this.addChild(hit_screen_05);
		}
		
		
		
		private function CreatePushBoxHit():void{
			hit_pushbox = new Shape();
			hit_pushbox.touchable = false;
			hit_pushbox.graphics.beginFill(0xff0000);
			
			hit_pushbox.graphics.lineTo(432,42);	
			hit_pushbox.graphics.lineTo(641,42);	
			hit_pushbox.graphics.lineTo(717,112);	
			hit_pushbox.graphics.lineTo(720,393);	
			hit_pushbox.graphics.lineTo(596,454);	
			hit_pushbox.graphics.lineTo(432,455);	
			
			hit_pushbox.graphics.endFill(false);
			hit_pushbox.alpha = 0.0;
			
			hit_pushbox.graphics.precisionHitTest = true;	
			this.addChild(hit_pushbox);
		}
		/*
		
		private var hit_button_up:Shape;
		private var hit_button_down:Shape;
		private var hit_button_left:Shape;
		private var hit_button_right:Shape;
		private var hit_button_clear:Shape;
		private var hit_button_enter:Shape
		hit_numbers
		*/
		private function CreateNumbersHit():void{
			hit_numbers = new Shape();
			hit_numbers.touchable = false;
			hit_numbers.graphics.beginFill(0xff0000);
			
			hit_numbers.graphics.lineTo(0,54);			
			hit_numbers.graphics.lineTo(105,58);			
			hit_numbers.graphics.lineTo(93,414);			
			hit_numbers.graphics.lineTo(0,403);			
			
			hit_numbers.graphics.endFill(false);
			hit_numbers.alpha = 0.0;
			
			hit_numbers.graphics.precisionHitTest = true;	
			this.addChild(hit_numbers);
		}
		
		private function CreateButtonHits():void{
			hit_button_up = new Shape();
			hit_button_up.touchable = false;
			hit_button_up.graphics.beginFill(0xff0000);
			
			hit_button_up.graphics.lineTo(458,64);	
			hit_button_up.graphics.lineTo(561,64);	
			hit_button_up.graphics.lineTo(561,168);	
			hit_button_up.graphics.lineTo(458,168);	
			
			hit_button_up.graphics.endFill(false);
			hit_button_up.alpha = 0.0;
			
			hit_button_up.graphics.precisionHitTest = true;	
			
			
			hit_button_down = new Shape();
			hit_button_down.touchable = false;
			hit_button_down.graphics.beginFill(0xff0000);
			
			hit_button_down.graphics.lineTo(585,64);	
			hit_button_down.graphics.lineTo(690,64);	
			hit_button_down.graphics.lineTo(690,168);	
			hit_button_down.graphics.lineTo(585,168);	

			hit_button_down.graphics.endFill(false);
			hit_button_down.alpha = 0.0;
			
			hit_button_down.graphics.precisionHitTest = true;	
			
						
			hit_button_left = new Shape();
			hit_button_left.touchable = false;
			hit_button_left.graphics.beginFill(0xff0000);
			
			hit_button_left.graphics.lineTo(458,189);	
			hit_button_left.graphics.lineTo(561,189);	
			hit_button_left.graphics.lineTo(561,296);	
			hit_button_left.graphics.lineTo(458,296);	
			
			hit_button_left.graphics.endFill(false);
			hit_button_left.alpha = 0.0;
			0
			hit_button_left.graphics.precisionHitTest = true;	
			
			
			
			hit_button_right = new Shape();
			hit_button_right.touchable = false;
			hit_button_right.graphics.beginFill(0xff0000);
			
			hit_button_right.graphics.lineTo(585,189);	
			hit_button_right.graphics.lineTo(690,189);	
			hit_button_right.graphics.lineTo(690,296);	
			hit_button_right.graphics.lineTo(585,296);	
			
			hit_button_right.graphics.endFill(false);
			hit_button_right.alpha = 0.0;
			
			hit_button_right.graphics.precisionHitTest = true;	
			
			
			hit_button_clear = new Shape();
			hit_button_clear.touchable = false;
			hit_button_clear.graphics.beginFill(0xff0000);
			
			hit_button_clear.graphics.lineTo(458,328);	
			hit_button_clear.graphics.lineTo(561,328);	
			hit_button_clear.graphics.lineTo(561,428);	
			hit_button_clear.graphics.lineTo(458,428);	
			
			hit_button_clear.graphics.endFill(false);
			hit_button_clear.alpha = 0.0;
			
			hit_button_clear.graphics.precisionHitTest = true;	
			
			
			hit_button_enter = new Shape();
			hit_button_enter.touchable = false;
			hit_button_enter.graphics.beginFill(0xff0000);
			
			hit_button_enter.graphics.lineTo(585,328);	
			hit_button_enter.graphics.lineTo(690,328);	
			hit_button_enter.graphics.lineTo(690,428);	
			hit_button_enter.graphics.lineTo(585,428);	
			
			hit_button_enter.graphics.endFill(false);
			hit_button_enter.alpha = 0.0;
			
			hit_button_enter.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_button_up);
			this.addChild(hit_button_down);
			this.addChild(hit_button_left);
			this.addChild(hit_button_right);
			this.addChild(hit_button_clear);
			this.addChild(hit_button_enter);
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
							FadeOut((BuildingOffice as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeObj,true
							);
						}else if(hit_numbers.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							NumbersHandler();
						}else if(PushBoxAttached === false){
							if(hit_pushbox.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PushBoxHandler();
							}
							else if(hit_screen_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								OffScreenHandler();
							}
							else if(hit_screen_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								OffScreenHandler();
							}
							else if(hit_screen_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								OffScreenHandler();
							}
							else if(hit_screen_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								OffScreenHandler();
							}
							else if(hit_screen_04.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								OffScreenHandler();
							}
							else if(hit_screen_05.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								OffScreenHandler();
							}
							/*
							private var hit_screen_00:Shape;
							private var hit_screen_01:Shape;
							private var hit_screen_02:Shape;
							private var hit_screen_03:Shape;
							private var hit_screen_04:Shape;
							private var hit_screen_05:Shape;
							*/
						}else{
							if(hit_button_clear.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ResetHandlervoid();
							}else if(hit_button_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ChangePosHandler('left');
							}else if(hit_button_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ChangePosHandler('right');
							}else if(hit_button_up.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								BlockHandler(''+CurrentPos,'Up');
							}else if(hit_button_down.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								BlockHandler(''+CurrentPos,'Down');
							}else if(hit_button_enter.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								Solve();
							}else if(hit_screen_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SetPosHandler(0);
							}
							else if(hit_screen_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SetPosHandler(1);
							}
							else if(hit_screen_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SetPosHandler(2);
							}
							else if(hit_screen_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SetPosHandler(3);
							}
							else if(hit_screen_04.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SetPosHandler(4);
							}
							else if(hit_screen_05.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								SetPosHandler(5);
							}
							
							//Solve()
						}
					}
				}
			}
		}
		
		private function NumbersHandler():void{
			
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are pieces of push-label tape stuck to the side of the console.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The tape reads 1, 2, 3 from top to bottom.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("These are not part of the original design...");
			}
		}
		
		private function OffScreenHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are six small LCD screens.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The screens don't display anything currently; they are not active.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are six small LCD screens.");
			}
		}
		
		private function SetPosHandler(WPos:int):void{
			if(WPos == 0){
				if(CurrentPos == 0){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
				}				
				CurrentPos = 0;
				pos_00_lit.alpha = 1;			
				pos_01_lit.alpha = 0;			
				pos_02_lit.alpha = 0;			
				pos_03_lit.alpha = 0;			
				pos_04_lit.alpha = 0;			
				pos_05_lit.alpha = 0;			
			}else if(WPos == 1){
				if(CurrentPos == 1){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
				}	
				CurrentPos = 1;
				pos_00_lit.alpha = 0;			
				pos_01_lit.alpha = 1;			
				pos_02_lit.alpha = 0;			
				pos_03_lit.alpha = 0;			
				pos_04_lit.alpha = 0;			
				pos_05_lit.alpha = 0;					
			}else if(WPos == 2){
				if(CurrentPos == 2){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
				}	
				CurrentPos = 2;
				pos_00_lit.alpha = 0;			
				pos_01_lit.alpha = 0;			
				pos_02_lit.alpha = 1;			
				pos_03_lit.alpha = 0;			
				pos_04_lit.alpha = 0;			
				pos_05_lit.alpha = 0;				
			}else if(WPos == 3){
				if(CurrentPos == 3){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
				}	
				CurrentPos = 3;
				pos_00_lit.alpha = 0;			
				pos_01_lit.alpha = 0;			
				pos_02_lit.alpha = 0;			
				pos_03_lit.alpha = 1;			
				pos_04_lit.alpha = 0;			
				pos_05_lit.alpha = 0;			
			}else if(WPos == 4){
				if(CurrentPos == 4){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
				}	
				CurrentPos = 4;
				pos_00_lit.alpha = 0;			
				pos_01_lit.alpha = 0;			
				pos_02_lit.alpha = 0;			
				pos_03_lit.alpha = 0;			
				pos_04_lit.alpha = 1;			
				pos_05_lit.alpha = 0;					
			}else if(WPos == 5){
				if(CurrentPos == 5){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
				}	
				CurrentPos = 5;
				pos_00_lit.alpha = 0;			
				pos_01_lit.alpha = 0;			
				pos_02_lit.alpha = 0;			
				pos_03_lit.alpha = 0;			
				pos_04_lit.alpha = 0;			
				pos_05_lit.alpha = 1;				
			}
		}
		
		private function ChangePosHandler(LeftRight:String):void{
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox;
			}
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
			if(LeftRight == 'left'){
				if(CurrentPos == 0){
					CurrentPos = 5;
					pos_00_lit.alpha = 0;
					pos_05_lit.alpha = 1;
				}else if(CurrentPos == 1){
					CurrentPos = 0;
					pos_01_lit.alpha = 0;
					pos_00_lit.alpha = 1;
				}else if(CurrentPos == 2){
					CurrentPos = 1;
					pos_02_lit.alpha = 0;
					pos_01_lit.alpha = 1;
				}else if(CurrentPos == 3){
					CurrentPos = 2;
					pos_03_lit.alpha = 0;
					pos_02_lit.alpha = 1;
				}else if(CurrentPos == 4){
					CurrentPos = 3;
					pos_04_lit.alpha = 0;
					pos_03_lit.alpha = 1;
				}else if(CurrentPos == 5){
					CurrentPos = 4;
					pos_05_lit.alpha = 0;
					pos_04_lit.alpha = 1;
				}
			}else{
				if(CurrentPos == 0){
					CurrentPos = 1;
					pos_00_lit.alpha = 0;
					pos_01_lit.alpha = 1;
				}else if(CurrentPos == 1){
					CurrentPos = 2;
					pos_01_lit.alpha = 0;
					pos_02_lit.alpha = 1;
				}else if(CurrentPos == 2){
					CurrentPos = 3;
					pos_02_lit.alpha = 0;
					pos_03_lit.alpha = 1;
				}else if(CurrentPos == 3){
					CurrentPos = 4;
					pos_03_lit.alpha = 0;
					pos_04_lit.alpha = 1;
				}else if(CurrentPos == 4){
					CurrentPos = 5;
					pos_04_lit.alpha = 0;
					pos_05_lit.alpha = 1;
				}else if(CurrentPos == 5){
					CurrentPos = 0;
					pos_05_lit.alpha = 0;
					pos_00_lit.alpha = 1;
				}
			}
			SaveArray['CurrentPos'] = ''+CurrentPos;
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePushBox',SaveArray);
			
		}
		
		private function BlockHandler(blockNum:String,blockDirc:String):void{
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
		//	screen.texture = this.assets.getTexture('access_star');
			if(this[('tBlock0'+blockNum)].text == '*'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'z';
				}else{
					this[('tBlock0'+blockNum)].text = '9';
				}
			}
			else if(this[('tBlock0'+blockNum)].text == '9'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = '*';
				}else{
					this[('tBlock0'+blockNum)].text = '8';
				}
			}
			else if(this[('tBlock0'+blockNum)].text == '8'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = '9';
				}else{
					this[('tBlock0'+blockNum)].text = '7';
				}
			}
			else if(this[('tBlock0'+blockNum)].text == '7'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = '8';
				}else{
					this[('tBlock0'+blockNum)].text = '6';
				}
			}
			else if(this[('tBlock0'+blockNum)].text == '6'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = '7';
				}else{
					this[('tBlock0'+blockNum)].text = '5';
				}
			}
			else if(this[('tBlock0'+blockNum)].text == '5'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = '6';
				}else{
					this[('tBlock0'+blockNum)].text = '4';
				}
			}
			else if(this[('tBlock0'+blockNum)].text == '4'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = '5';
				}else{
					this[('tBlock0'+blockNum)].text = '3';
				}
			}
			else if(this[('tBlock0'+blockNum)].text == '3'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = '4';
				}else{
					this[('tBlock0'+blockNum)].text = '2';
				}
			}
			else if(this[('tBlock0'+blockNum)].text == '2'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = '3';
				}else{
					this[('tBlock0'+blockNum)].text = '1';
				}
			}
			else if(this[('tBlock0'+blockNum)].text == '1'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = '2';
				}else{
					this[('tBlock0'+blockNum)].text = '0';
				}
			}
			else if(this[('tBlock0'+blockNum)].text == '0'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = '1';
				}else{
					this[('tBlock0'+blockNum)].text = 'a';
				}
			}
			else if(this[('tBlock0'+blockNum)].text == 'a'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = '0';
				}else{
					this[('tBlock0'+blockNum)].text = 'b';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'b'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'a';
				}else{
					this[('tBlock0'+blockNum)].text = 'c';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'c'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'b';
				}else{
					this[('tBlock0'+blockNum)].text = 'd';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'd'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'c';
				}else{
					this[('tBlock0'+blockNum)].text = 'e';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'e'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'd';
				}else{
					this[('tBlock0'+blockNum)].text = 'f';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'f'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'e';
				}else{
					this[('tBlock0'+blockNum)].text = 'g';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'g'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'f';
				}else{
					this[('tBlock0'+blockNum)].text = 'h';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'h'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'g';
				}else{
					this[('tBlock0'+blockNum)].text = 'i';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'i'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'h';
				}else{
					this[('tBlock0'+blockNum)].text = 'j';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'j'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'i';
				}else{
					this[('tBlock0'+blockNum)].text = 'k';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'k'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'j';
				}else{
					this[('tBlock0'+blockNum)].text = 'l';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'l'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'k';
				}else{
					this[('tBlock0'+blockNum)].text = 'm';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'm'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'l';
				}else{
					this[('tBlock0'+blockNum)].text = 'n';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'n'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'm';
				}else{
					this[('tBlock0'+blockNum)].text = 'o';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'o'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'n';
				}else{
					this[('tBlock0'+blockNum)].text = 'p';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'p'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'o';
				}else{
					this[('tBlock0'+blockNum)].text = 'q';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'q'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'p';
				}else{
					this[('tBlock0'+blockNum)].text = 'r';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'r'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'q';
				}else{
					this[('tBlock0'+blockNum)].text = 's';
				}
			}else if(this[('tBlock0'+blockNum)].text == 's'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'r';
				}else{
					this[('tBlock0'+blockNum)].text = 't';
				}
			}else if(this[('tBlock0'+blockNum)].text == 't'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 's';
				}else{
					this[('tBlock0'+blockNum)].text = 'u';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'u'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 't';
				}else{
					this[('tBlock0'+blockNum)].text = 'v';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'v'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'u';
				}else{
					this[('tBlock0'+blockNum)].text = 'w';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'w'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'v';
				}else{
					this[('tBlock0'+blockNum)].text = 'x';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'x'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'w';
				}else{
					this[('tBlock0'+blockNum)].text = 'y';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'y'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'x';
				}else{
					this[('tBlock0'+blockNum)].text = 'z';
				}
			}else if(this[('tBlock0'+blockNum)].text == 'z'){
				if(blockDirc == 'Up'){
					this[('tBlock0'+blockNum)].text = 'y';
				}else{
					this[('tBlock0'+blockNum)].text = '*';
				}
			}
			
			SaveBlockVal(blockNum);
			
		}
		private function SaveBlockVal(blockNum:String):void{
			trace("blockNum :"+blockNum);
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox;
			}
			SaveArray['tBlock0'+blockNum] = this[('tBlock0'+blockNum)].text;
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePushBox',SaveArray);
		}
		
		
		private function ResetHandlervoid():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
		//	screen.texture = this.assets.getTexture('access_star');
			
			tBlock00.text = '*';
			tBlock01.text = '*';
			tBlock02.text = '*';
			tBlock03.text = '*';
			tBlock04.text = '*';
			tBlock05.text = '*';
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox;
			}
			
			SaveArray['tBlock00'] = '*';
			SaveArray['tBlock01'] = '*';
			SaveArray['tBlock02'] = '*';
			SaveArray['tBlock03'] = '*';
			SaveArray['tBlock04'] = '*';
			SaveArray['tBlock05'] = '*';
		
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePushBox',SaveArray);
			
			
		}
		
		
		private function PushBoxHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_PushBox)
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox;	
				}
				SaveArray['PushBox'] = "Attached";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePushBox',SaveArray);
				PushBoxAttached = true;
				
				pushbox.alpha = 1;
			//	pos_00_lit.alpha = 0;
			//	backLights.alpha = 0;
				
				
				Animating = true;
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_PushBox,
						"item_PushBox"
					);
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Machine();
				BackLightsTween = new Tween(backLights, 2, Transitions.LINEAR);
				BackLightsTween.fadeTo(1);
				BackLightsTween.onComplete = function():void{
					Animating = false;
					tBlock00.alpha = 1;
					tBlock01.alpha = 1;
					tBlock02.alpha = 1;
					tBlock03.alpha = 1;
					tBlock04.alpha = 1;
					tBlock05.alpha = 1;
					
					pos_00_lit.alpha = 1;
				};
				Starling.juggler.add(BackLightsTween);	
				
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Controller)
			{	
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The micro-controller doesn't go here. The slot looks like it's fitted for something specific.");
			
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				!= 
				false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("That item doesn't help here...");
				
			}else{
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a recess with several electrical hook-ups in the panel.");
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The worn sticker indicates this is a SecureSys security... err... something or other");
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The recess is roughly the size of my hand.");
				}
			}
		}
		private function Solve():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
			
			trace("SOLVING");
			if(tBlock00.text == 'x'){
				trace("x");
				if(tBlock01.text == 'k'){
					trace("A");
					if(tBlock02.text == 'o'){
						trace("U");
						if(tBlock03.text == 'c'){
							trace("T");
							if(tBlock04.text == 'q'){
								trace("I");
								if(tBlock05.text == 'p'){	
									
									Animating = true;
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InputAccept();
									
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
									
									trace('Solved');
									//greenLight.alpha = 1;
									//errorText.text = "Opening Capsule Hatch...";
									
									
									
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox;
									}
									SaveArray['Solved'] = 'Yes';
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePushBox',SaveArray);
									
									
									delayedCall = new DelayedCall(function():void{
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
										tBlock00.text = 'a';
										tBlock01.text = 'c';
										tBlock02.text = 'c';
										tBlock03.text = 'e';
										tBlock04.text = 's';
										tBlock05.text = 's';
										
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
										//access_number
									//	ChangeScreenTexture(false);
										
										FadeOut((BuildingOffice as Class), 
											(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeObj,true
										);
										Animating = false;
									}, 1.5);
									Starling.juggler.add(delayedCall);
								}else{
									SolveRejection();
								}
							}else{
								SolveRejection();
							}
						}else{
							SolveRejection();
						}
					}else{
						SolveRejection();
					}
				}else{
					SolveRejection();
				}
			}else{
				SolveRejection();
			}
					
		}
		
		private function SolveRejection():void{
			
			Animating = true;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
			
			
			delayedCall = new DelayedCall(function():void{
			//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ErrorTwo();
			//	ChangeScreenTexture(true);
	//			CurrentPos = 0;
	//			pos_00_lit.alpha = 1;
	//			pos_01_lit.alpha = 0;
	//			pos_02_lit.alpha = 0;
	//			pos_03_lit.alpha = 0;
	//			pos_04_lit.alpha = 0;
	//			pos_05_lit.alpha = 0;
	//			tBlock00.text = '*';
	//			tBlock01.text = '*';
	//			tBlock02.text = '*';
	//			tBlock03.text = '*';
	//			tBlock04.text = '*';
	//			tBlock05.text = '*';
	//			
	//			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox != undefined){
	//				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePushBox;
	//			}
	//			SaveArray['CurrentPos'] = CurrentPos;
	//			SaveArray['tBlock00'] = tBlock00.text;
	//			SaveArray['tBlock01'] = tBlock01.text;
		//		SaveArray['tBlock02'] = tBlock02.text;
	//			SaveArray['tBlock03'] = tBlock03.text;
	//			SaveArray['tBlock04'] = tBlock04.text;
	//			SaveArray['tBlock05'] = tBlock05.text;
				
	//			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficePushBox',SaveArray);
			
				Animating = false;
			}, 1);
			Starling.juggler.add(delayedCall);
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
			
			
			
			this.assets.removeTexture("buildingOfficePushBox_bg",true);
			this.assets.removeTexture("BuildingOfficePushBox_Sprite",true);
			this.assets.removeTextureAtlas("BuildingOfficePushBox_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficePushBox_01");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficePushBox_02");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficePushBox_03");
			
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
