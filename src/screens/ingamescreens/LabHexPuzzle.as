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
	
	public class LabHexPuzzle extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var highlight:Image;
		private var popupSprite:Sprite;
		private var popup_bg:Image;
		private var popup_text:Image
		
		private var pos_00:Image;
		private var pos_01:Image;
		private var pos_02:Image;
		private var pos_03:Image;
		private var pos_04:Image;
		private var pos_05:Image;
		private var pos_06:Image;
		private var pos_07:Image;
		private var pos_08:Image;
		private var pos_09:Image;
		private var pos_10:Image;
		private var pos_11:Image;
		private var pos_12:Image;
		private var pos_13:Image;
		private var pos_14:Image;
		private var pos_15:Image;
		private var pos_16:Image;
		private var pos_17:Image;
		private var pos_18:Image;
		private var pos_19:Image;
		private var pos_20:Image;
		private var pos_21:Image;
		private var pos_22:Image;
		private var pos_23:Image;
		private var pos_24:Image;
		private var pos_25:Image;
		private var pos_26:Image;
		private var pos_27:Image;
		private var pos_28:Image;
		private var pos_29:Image;
		
		
		private var hit_pos_00:Shape;
		private var hit_pos_01:Shape;
		private var hit_pos_02:Shape;
		private var hit_pos_03:Shape;
		private var hit_pos_04:Shape;
		private var hit_pos_05:Shape;
		private var hit_pos_06:Shape;
		private var hit_pos_07:Shape;
		private var hit_pos_08:Shape;
		private var hit_pos_09:Shape;
		private var hit_pos_10:Shape;
		private var hit_pos_11:Shape;
		private var hit_pos_12:Shape;
		private var hit_pos_13:Shape;
		private var hit_pos_14:Shape;
		private var hit_pos_15:Shape;
		private var hit_pos_16:Shape;
		private var hit_pos_17:Shape;
		private var hit_pos_18:Shape;
		private var hit_pos_19:Shape;
		private var hit_pos_20:Shape;
		private var hit_pos_21:Shape;
		private var hit_pos_22:Shape;
		private var hit_pos_23:Shape;
		private var hit_pos_24:Shape;
		private var hit_pos_25:Shape;
		private var hit_pos_26:Shape;
		private var hit_pos_27:Shape;
		private var hit_pos_28:Shape;
		private var hit_pos_29:Shape;
		
		private var hit_one:Shape;
		private var hit_two:Shape;
		private var hit_three_left:Shape;
		private var hit_three_right:Shape;
		private var hit_four_foot:Shape;
		private var hit_four_x:Shape;
		
		private var hit_rotate_counterwise:Shape;
		private var hit_rotate_clockwise:Shape;
		private var hit_clear_select:Shape;
		private var hit_clear_all:Shape;
		private var hit_push:Shape;
		
		private var Animating:Boolean = false;
		private var Solved:Boolean = false;
		private var PopUpOpen:Boolean = false;
		private var TubeAttached:Boolean = false;
		
		private var SelectedHex:String = '09';
		private var hexArray:Array = new Array();
		private var hexRotArray:Array = new Array();
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;
		
		public function LabHexPuzzle(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('labHexPuzzle_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabHexPuzzle/labHexPuzzle_bg.jpg'));
				game.TrackAssets('labHexPuzzle_01');
			}
			if(game.CheckAsset('labHexPuzzle_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabHexPuzzle/LabHexPuzzle_Sprite_01.png'));
				game.TrackAssets('labHexPuzzle_02');
			}
			if(game.CheckAsset('labHexPuzzle_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabHexPuzzle/LabHexPuzzle_Sprite_01.xml'));
				game.TrackAssets('labHexPuzzle_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("LabHexPuzzle","LabHexPuzzleObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('labHexPuzzle_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			hexArray['00'] = null;
			hexArray['01'] = null;
			hexArray['02'] = null;
			hexArray['03'] = null;
			hexArray['04'] = null;
			hexArray['05'] = null;
			hexArray['06'] = null;
			hexArray['07'] = null;
			hexArray['08'] = null;
			hexArray['09'] = null;
			hexArray['10'] = null;
			hexArray['11'] = null;
			hexArray['12'] = null;
			hexArray['13'] = null;
			hexArray['14'] = null;
			hexArray['15'] = null;
			hexArray['16'] = null;
			hexArray['17'] = null;
			hexArray['18'] = null;
			hexArray['19'] = null;
			hexArray['20'] = null;
			hexArray['21'] = null;
			hexArray['22'] = null;
			hexArray['23'] = null;
			hexArray['24'] = null;
			hexArray['25'] = null;
			hexArray['26'] = null;
			hexArray['27'] = null;
			hexArray['28'] = null;
			hexArray['29'] = null;
			//hexRotArray
			hexRotArray['00'] = 0;
			hexRotArray['01'] = 0;
			hexRotArray['02'] = 0;
			hexRotArray['03'] = 0;
			hexRotArray['04'] = 0;
			hexRotArray['05'] = 0;
			hexRotArray['06'] = 0;
			hexRotArray['07'] = 0;
			hexRotArray['08'] = 0;
			hexRotArray['09'] = 0;
			hexRotArray['10'] = 0;
			hexRotArray['11'] = 0;
			hexRotArray['12'] = 0;
			hexRotArray['13'] = 0;
			hexRotArray['14'] = 0;
			hexRotArray['15'] = 0;
			hexRotArray['16'] = 0;
			hexRotArray['17'] = 0;
			hexRotArray['18'] = 0;
			hexRotArray['19'] = 0;
			hexRotArray['20'] = 0;
			hexRotArray['21'] = 0;
			hexRotArray['22'] = 0;
			hexRotArray['23'] = 0;
			hexRotArray['24'] = 0;
			hexRotArray['25'] = 0;
			hexRotArray['26'] = 0;
			hexRotArray['27'] = 0;
			hexRotArray['28'] = 0;
			hexRotArray['29'] = 0;
			
			CreatePos();
			CreatePosHits();
			CreateControlHits();
			
			CreatePopUp();
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk['TubeAttached'] == "Yes"){
					TubeAttached = true;
				}
			}
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle != undefined){
				trace("BIO PUZZLE EXISTS");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle['SelectedHex'] != undefined){
					SelectedHex = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle['SelectedHex'];
				
					highlight.x = this['pos_'+SelectedHex].x;
					highlight.y = this['pos_'+SelectedHex].y;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle['HexArray'] != undefined){
					trace("HEXARRAY EXISTS");
					hexArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle['HexArray'];
					hexRotArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle['HexRotArray'];
					
					
					for(var i:int = 0; i<30;i++){
						trace("SAVED HEX: "+i);
						if(i < 10){
							if(hexArray['0'+i] != null){
								this['pos_0'+i].texture = this.assets.getTexture(hexArray['0'+i]);
								this['pos_0'+i].alpha = 1;
							}
							if(hexRotArray['0'+i] == 0){
								this['pos_0'+i].rotation = deg2rad(0);
							}else if(hexRotArray['0'+i] == 1){;
								this['pos_0'+i].rotation = deg2rad(60);
							}else if(hexRotArray['0'+i] == 2){
								this['pos_0'+i].rotation = deg2rad(120);
							}else if(hexRotArray['0'+i] == 3){
								this['pos_0'+i].rotation = deg2rad(180);
							}else if(hexRotArray['0'+i] == 4){
								this['pos_0'+i].rotation = deg2rad(-120);
							}else if(hexRotArray['0'+i] == 5){
								this['pos_0'+i].rotation = deg2rad(-60);
							}
							
						}else{
							if(hexArray[i] != null){
								this['pos_'+i].texture = this.assets.getTexture(hexArray[i]);
								this['pos_'+i].alpha = 1;
							}
							if(hexRotArray[i] == 0){
								this['pos_'+i].rotation = deg2rad(0);
							}else if(hexRotArray[i] == 1){;
								this['pos_'+i].rotation = deg2rad(60);
							}else if(hexRotArray[i] == 2){
								this['pos_'+i].rotation = deg2rad(120);
							}else if(hexRotArray[i] == 3){
								this['pos_'+i].rotation = deg2rad(180);
							}else if(hexRotArray[i] == 4){
								this['pos_'+i].rotation = deg2rad(-120);
							}else if(hexRotArray[i] == 5){
								this['pos_'+i].rotation = deg2rad(-60);
							}
						}
					}
				}
			}
			
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		/*
		private var popupSprite:Sprite;
		private var popup_bg:Image;
		private var popup_text:Image
		
		*/
		private function CreatePopUp():void{
			popupSprite = new Sprite();
			popupSprite.touchable = false;
			popupSprite.x = 289;
			popupSprite.y = 155;
			
			popup_bg = new Image(this.assets.getTexture('popup'));
			popup_bg.touchable = false;
			popup_bg.x = 0;
			popup_bg.y = 0;
			
			popup_text = new Image(this.assets.getTexture('popup_text_commencing'));
			popup_text.touchable = false;
			popup_text.x = 26;
			popup_text.y = 16;
			
			popup_bg.alpha = 1;
			popupSprite.alpha = 0;
			
			popupSprite.addChildAt(popup_bg,0);
			popupSprite.addChildAt(popup_text,1);
			
			
			this.addChild(popupSprite);
		}
		
		private function CreateControlHits():void{
			hit_one = new Shape();
			hit_one.touchable = false;
			hit_one.graphics.beginFill(0xff0000);
			
			hit_one.graphics.lineTo(0,33);	
			hit_one.graphics.lineTo(80,33);	
			hit_one.graphics.lineTo(80,112);	
			hit_one.graphics.lineTo(0,112);	
			
			hit_one.graphics.endFill(false);
			hit_one.alpha = 0.0;
			
			hit_one.graphics.precisionHitTest = true;	
			
			hit_two = new Shape();
			hit_two.touchable = false;
			hit_two.graphics.beginFill(0x0000ff);
			
			hit_two.graphics.lineTo(81,33);	
			hit_two.graphics.lineTo(161,33);	
			hit_two.graphics.lineTo(161,112);	
			hit_two.graphics.lineTo(81,112);	
				
			hit_two.graphics.endFill(false);
			hit_two.alpha = 0.0;
			
			hit_two.graphics.precisionHitTest = true;	
			
			hit_three_left = new Shape();
			hit_three_left.touchable = false;
			hit_three_left.graphics.beginFill(0xff0000);
			
			hit_three_left.graphics.lineTo(0,113);		
			hit_three_left.graphics.lineTo(80,113);		
			hit_three_left.graphics.lineTo(80,192);		
			hit_three_left.graphics.lineTo(0,192);		
			
			hit_three_left.graphics.endFill(false);
			hit_three_left.alpha = 0.0;
						
			hit_three_right = new Shape();
			hit_three_right.touchable = false;
			hit_three_right.graphics.beginFill(0x0000ff);
			
			hit_three_right.graphics.lineTo(81,113);		
			hit_three_right.graphics.lineTo(161,113);		
			hit_three_right.graphics.lineTo(161,192);		
			hit_three_right.graphics.lineTo(81,192);		
			
			hit_three_right.graphics.endFill(false);
			hit_three_right.alpha = 0.0;
			
			hit_three_right.graphics.precisionHitTest = true;	
			
			hit_four_foot = new Shape();
			hit_four_foot.touchable = false;
			hit_four_foot.graphics.beginFill(0xff0000);
			
			hit_four_foot.graphics.lineTo(0,193);		
			hit_four_foot.graphics.lineTo(80,193);		
			hit_four_foot.graphics.lineTo(80,270);		
			hit_four_foot.graphics.lineTo(0,270);		
		
			hit_four_foot.graphics.endFill(false);
			hit_four_foot.alpha = 0.0;
			
			hit_four_foot.graphics.precisionHitTest = true;	
			
			
			hit_four_x = new Shape();
			hit_four_x.touchable = false;
			hit_four_x.graphics.beginFill(0x0000ff);
			
			hit_four_x.graphics.lineTo(81,193);		
			hit_four_x.graphics.lineTo(161,193);		
			hit_four_x.graphics.lineTo(161,270);		
			hit_four_x.graphics.lineTo(81,270);		
			
			hit_four_x.graphics.endFill(false);
			hit_four_x.alpha = 0.0;
			
			hit_four_x.graphics.precisionHitTest = true;	
			
			
			hit_rotate_counterwise = new Shape();
			hit_rotate_counterwise.touchable = false;
			hit_rotate_counterwise.graphics.beginFill(0xff0000);
			
			hit_rotate_counterwise.graphics.lineTo(0,284);		
			hit_rotate_counterwise.graphics.lineTo(80,284);		
			hit_rotate_counterwise.graphics.lineTo(80,373);		
			hit_rotate_counterwise.graphics.lineTo(0,373);		
						
			hit_rotate_counterwise.graphics.endFill(false);
			hit_rotate_counterwise.alpha = 0.0;
			
			hit_rotate_counterwise.graphics.precisionHitTest = true;	
			
			
			hit_rotate_clockwise = new Shape();
			hit_rotate_clockwise.touchable = false;
			hit_rotate_clockwise.graphics.beginFill(0x0000ff);
			
			hit_rotate_clockwise.graphics.lineTo(81,284);		
			hit_rotate_clockwise.graphics.lineTo(161,284);		
			hit_rotate_clockwise.graphics.lineTo(161,373);		
			hit_rotate_clockwise.graphics.lineTo(81,373);		
			
			hit_rotate_clockwise.graphics.endFill(false);
			hit_rotate_clockwise.alpha = 0.0;
			
			hit_rotate_clockwise.graphics.precisionHitTest = true;	
			
					
			hit_clear_select = new Shape();
			hit_clear_select.touchable = false;
			hit_clear_select.graphics.beginFill(0xff0000);
			
			hit_clear_select.graphics.lineTo(171,0);		
			hit_clear_select.graphics.lineTo(225,0);		
			hit_clear_select.graphics.lineTo(225,83);		
			hit_clear_select.graphics.lineTo(204,104);		
			hit_clear_select.graphics.lineTo(171,104);		
						
			hit_clear_select.graphics.endFill(false);
			hit_clear_select.alpha = 0.0;
			
			hit_clear_select.graphics.precisionHitTest = true;	
			
			
			hit_clear_all = new Shape();
			hit_clear_all.touchable = false;
			hit_clear_all.graphics.beginFill(0x0000ff);
			
			hit_clear_all.graphics.lineTo(333,464);		
			hit_clear_all.graphics.lineTo(358,441);		
			hit_clear_all.graphics.lineTo(482,441);		
			hit_clear_all.graphics.lineTo(508,464);		
			hit_clear_all.graphics.lineTo(508,503);		
			hit_clear_all.graphics.lineTo(333,503);		
					
			hit_clear_all.graphics.endFill(false);
			hit_clear_all.alpha = 0.0;
			
			hit_clear_all.graphics.precisionHitTest = true;	
			
			
			hit_push = new Shape();
			hit_push.touchable = false;
			hit_push.graphics.beginFill(0x0000ff);
			
			hit_push.graphics.lineTo(115,390);		
			hit_push.graphics.lineTo(218,390);		
			hit_push.graphics.lineTo(218,499);		
			hit_push.graphics.lineTo(115,499);		
			
			hit_push.graphics.endFill(false);
			hit_push.alpha = 0.0;
			
			hit_push.graphics.precisionHitTest = true;	
			
			this.addChild(hit_one);
			this.addChild(hit_two);
			this.addChild(hit_three_left);
			this.addChild(hit_three_right);
			this.addChild(hit_four_foot);
			this.addChild(hit_four_x);
			this.addChild(hit_rotate_counterwise);
			this.addChild(hit_rotate_clockwise);
			this.addChild(hit_clear_select);
			this.addChild(hit_clear_all);
			this.addChild(hit_push);
		}
		/*
		
		
		private var hit_rotate_counterwise:Shape;
		private var hit_rotate_clockwise:Shape;
		
		*/
		
		
		private function CreatePosHits():void{
			
			hit_pos_00 = new Shape();
			hit_pos_00.touchable = false;
			hit_pos_00.graphics.beginFill(0x0000ff);
				
			hit_pos_00.graphics.lineTo(246,57);	
			hit_pos_00.graphics.lineTo(267,19);	
			hit_pos_00.graphics.lineTo(311,19);	
			hit_pos_00.graphics.lineTo(330,57);	
			hit_pos_00.graphics.lineTo(311,93);	
			hit_pos_00.graphics.lineTo(267,93);	
			
			hit_pos_00.graphics.endFill(false);
			hit_pos_00.alpha = 0.0;
				
			hit_pos_00.graphics.precisionHitTest = true;	
			
			hit_pos_01 = new Shape();
			hit_pos_01.touchable = false;
			hit_pos_01.graphics.beginFill(0x0000ff);
			
			hit_pos_01.graphics.lineTo(184,169);	
			hit_pos_01.graphics.lineTo(205,131);	
			hit_pos_01.graphics.lineTo(246,131);	
			hit_pos_01.graphics.lineTo(267,169);	
			hit_pos_01.graphics.lineTo(246,206);	
			hit_pos_01.graphics.lineTo(205,206);				
			
			hit_pos_01.graphics.endFill(false);
			hit_pos_01.alpha = 0.0;
			
			hit_pos_01.graphics.precisionHitTest = true;	
			
			
			hit_pos_02 = new Shape();
			hit_pos_02.touchable = false;
			hit_pos_02.graphics.beginFill(0x00ff00);
			
			hit_pos_02.graphics.lineTo(184+64,169-36);	
			hit_pos_02.graphics.lineTo(205+64,131-36);	
			hit_pos_02.graphics.lineTo(246+64,131-36);	
			hit_pos_02.graphics.lineTo(267+64,169-36);	
			hit_pos_02.graphics.lineTo(246+64,206-36);	
			hit_pos_02.graphics.lineTo(205+64,206-36);				
			
			hit_pos_02.graphics.endFill(false);
			hit_pos_02.alpha = 0.0;
			
			hit_pos_02.graphics.precisionHitTest = true;	
			
					
			hit_pos_03 = new Shape();
			hit_pos_03.touchable = false;
			hit_pos_03.graphics.beginFill(0x00ff00);
			
			hit_pos_03.graphics.lineTo(184+(64*2),169-(36*2));	
			hit_pos_03.graphics.lineTo(205+(64*2),131-(36*2));	
			hit_pos_03.graphics.lineTo(246+(64*2),131-(36*2));	
			hit_pos_03.graphics.lineTo(267+(64*2),169-(36*2));	
			hit_pos_03.graphics.lineTo(246+(64*2),206-(36*2));	
			hit_pos_03.graphics.lineTo(205+(64*2),206-(36*2));				
			
			hit_pos_03.graphics.endFill(false);
			hit_pos_03.alpha = 0.0;
			
			hit_pos_03.graphics.precisionHitTest = true;	
			
			
			hit_pos_04 = new Shape();
			hit_pos_04.touchable = false;
			hit_pos_04.graphics.beginFill(0x00ff00);
			
			hit_pos_04.graphics.lineTo(184+(64*3)-2,169-(36*3)-1);	
			hit_pos_04.graphics.lineTo(205+(64*3)-2,131-(36*3)-1);	
			hit_pos_04.graphics.lineTo(246+(64*3)-2,131-(36*3)-1);	
			hit_pos_04.graphics.lineTo(267+(64*3)-2,169-(36*3)-1);	
			hit_pos_04.graphics.lineTo(246+(64*3)-2,206-(36*3)-1);	
			hit_pos_04.graphics.lineTo(205+(64*3)-2,206-(36*3)-1);				
			
			hit_pos_04.graphics.endFill(false);
			hit_pos_04.alpha = 0.0;
			
			hit_pos_04.graphics.precisionHitTest = true;	
			
			
			hit_pos_05 = new Shape();
			hit_pos_05.touchable = false;
			hit_pos_05.graphics.beginFill(0x00ff00);
			
			hit_pos_05.graphics.lineTo(248,206);	
			hit_pos_05.graphics.lineTo(268,169);	
			hit_pos_05.graphics.lineTo(310,169);	
			hit_pos_05.graphics.lineTo(331,206);	
			hit_pos_05.graphics.lineTo(310,242);	
			hit_pos_05.graphics.lineTo(268,242);	
		
			hit_pos_05.graphics.endFill(false);
			hit_pos_05.alpha = 0.0;
			
			hit_pos_05.graphics.precisionHitTest = true;	

			
			hit_pos_06 = new Shape();
			hit_pos_06.touchable = false;
			hit_pos_06.graphics.beginFill(0x00ff00);
			
			hit_pos_06.graphics.lineTo(497,53);	
			hit_pos_06.graphics.lineTo(519,16);	
			hit_pos_06.graphics.lineTo(562,16);	
			hit_pos_06.graphics.lineTo(582,53);	
			hit_pos_06.graphics.lineTo(561,92);	
			hit_pos_06.graphics.lineTo(519,92);		
			
			hit_pos_06.graphics.endFill(false);
			hit_pos_06.alpha = 0.0;
			
			hit_pos_06.graphics.precisionHitTest = true;	
			
			
			hit_pos_07 = new Shape();
			hit_pos_07.touchable = false;
			hit_pos_07.graphics.beginFill(0x00ff00);
			
			hit_pos_07.graphics.lineTo(184,318);	
			hit_pos_07.graphics.lineTo(206,279);	
			hit_pos_07.graphics.lineTo(247,279);	
			hit_pos_07.graphics.lineTo(267,318);	
			hit_pos_07.graphics.lineTo(247,353);	
			hit_pos_07.graphics.lineTo(206,353);	
			
			hit_pos_07.graphics.endFill(false);
			hit_pos_07.alpha = 0.0;
			
			hit_pos_07.graphics.precisionHitTest = true;	
			
			
			hit_pos_08 = new Shape();
			hit_pos_08.touchable = false;
			hit_pos_08.graphics.beginFill(0x00ff00);
			
			hit_pos_08.graphics.lineTo(184+64,318-36);	
			hit_pos_08.graphics.lineTo(206+64,279-36);	
			hit_pos_08.graphics.lineTo(247+64,279-36);	
			hit_pos_08.graphics.lineTo(267+64,318-36);	
			hit_pos_08.graphics.lineTo(247+64,353-36);	
			hit_pos_08.graphics.lineTo(206+64,353-36);	
			
			hit_pos_08.graphics.endFill(false);
			hit_pos_08.alpha = 0.0;
			
			hit_pos_08.graphics.precisionHitTest = true;	
					
			
			hit_pos_09 = new Shape();
			hit_pos_09.touchable = false;
			hit_pos_09.graphics.beginFill(0x0000ff);
			
			hit_pos_09.graphics.lineTo(184+(64*2),318-(36*2));	
			hit_pos_09.graphics.lineTo(206+(64*2),279-(36*2));	
			hit_pos_09.graphics.lineTo(247+(64*2),279-(36*2));	
			hit_pos_09.graphics.lineTo(267+(64*2),318-(36*2));	
			hit_pos_09.graphics.lineTo(247+(64*2),353-(36*2));	
			hit_pos_09.graphics.lineTo(206+(64*2),353-(36*2));	
			
			hit_pos_09.graphics.endFill(false);
			hit_pos_09.alpha = 0.0;
			
			hit_pos_09.graphics.precisionHitTest = true;	
			
			hit_pos_10 = new Shape();
			hit_pos_10.touchable = false;
			hit_pos_10.graphics.beginFill(0x00ff00);
			
			hit_pos_10.graphics.lineTo(184+(64*3)-2,318-(36*3)-1);	
			hit_pos_10.graphics.lineTo(206+(64*3)-2,279-(36*3)-1);	
			hit_pos_10.graphics.lineTo(247+(64*3)-2,279-(36*3)-1);	
			hit_pos_10.graphics.lineTo(267+(64*3)-2,318-(36*3)-1);	
			hit_pos_10.graphics.lineTo(247+(64*3)-2,353-(36*3)-1);	
			hit_pos_10.graphics.lineTo(206+(64*3)-2,353-(36*3)-1);	
			
			hit_pos_10.graphics.endFill(false);
			hit_pos_10.alpha = 0.0;
			
			hit_pos_10.graphics.precisionHitTest = true;	

			
			hit_pos_11 = new Shape();
			hit_pos_11.touchable = false;
			hit_pos_11.graphics.beginFill(0x0000ff);
			
			hit_pos_11.graphics.lineTo(184+(63*4),318-(37*4));	
			hit_pos_11.graphics.lineTo(206+(63*4),279-(37*4));	
			hit_pos_11.graphics.lineTo(247+(63*4),279-(37*4));	
			hit_pos_11.graphics.lineTo(267+(63*4),318-(37*4));	
			hit_pos_11.graphics.lineTo(247+(63*4),353-(37*4));	
			hit_pos_11.graphics.lineTo(206+(63*4),353-(37*4));	
			
			hit_pos_11.graphics.endFill(false);
			hit_pos_11.alpha = 0.0;
			
			hit_pos_11.graphics.precisionHitTest = true;	
			
			
			hit_pos_12 = new Shape();
			hit_pos_12.touchable = false;
			hit_pos_12.graphics.beginFill(0x00ff00);
			
			hit_pos_12.graphics.lineTo(184+(63*5),318-(37*5));	
			hit_pos_12.graphics.lineTo(206+(63*5),279-(37*5));	
			hit_pos_12.graphics.lineTo(247+(63*5),279-(37*5));	
			hit_pos_12.graphics.lineTo(267+(63*5),318-(37*5));	
			hit_pos_12.graphics.lineTo(247+(63*5),353-(37*5));	
			hit_pos_12.graphics.lineTo(206+(63*5),353-(37*5));	
			
			hit_pos_12.graphics.endFill(false);
			hit_pos_12.alpha = 0.0;
			
			hit_pos_12.graphics.precisionHitTest = true;	
			
			hit_pos_13 = new Shape();
			hit_pos_13.touchable = false;
			hit_pos_13.graphics.beginFill(0x0000ff);
			
			hit_pos_13.graphics.lineTo(184+(63*6),318-(37*6));	
			hit_pos_13.graphics.lineTo(206+(63*6),279-(37*6));	
			hit_pos_13.graphics.lineTo(247+(63*6),279-(37*6));	
			hit_pos_13.graphics.lineTo(267+(63*6),318-(37*6));	
			hit_pos_13.graphics.lineTo(247+(63*6),353-(37*6));	
			hit_pos_13.graphics.lineTo(206+(63*6),353-(37*6));	
			
			hit_pos_13.graphics.endFill(false);
			hit_pos_13.alpha = 0.0;
			
			hit_pos_13.graphics.precisionHitTest = true;	
			
			
			hit_pos_14 = new Shape();
			hit_pos_14.touchable = false;
			hit_pos_14.graphics.beginFill(0x0000ff);
			
			hit_pos_14.graphics.lineTo(311,316);	
			hit_pos_14.graphics.lineTo(332,278);	
			hit_pos_14.graphics.lineTo(374,278);	
			hit_pos_14.graphics.lineTo(393,316);	
			hit_pos_14.graphics.lineTo(374,352);	
			hit_pos_14.graphics.lineTo(332,352);	
					
			hit_pos_14.graphics.endFill(false);
			hit_pos_14.alpha = 0.0;
			
			hit_pos_14.graphics.precisionHitTest = true;	
			
			
			hit_pos_15 = new Shape();
			hit_pos_15.touchable = false;
			hit_pos_15.graphics.beginFill(0x0000ff);
			
			hit_pos_15.graphics.lineTo(311+(63*2),316-(37*2));	
			hit_pos_15.graphics.lineTo(332+(63*2),278-(37*2));	
			hit_pos_15.graphics.lineTo(374+(63*2),278-(37*2));	
			hit_pos_15.graphics.lineTo(393+(63*2),316-(37*2));	
			hit_pos_15.graphics.lineTo(374+(63*2),352-(37*2));	
			hit_pos_15.graphics.lineTo(332+(63*2),352-(37*2));	
			
			hit_pos_15.graphics.endFill(false);
			hit_pos_15.alpha = 0.0;
			
			hit_pos_15.graphics.precisionHitTest = true;	
			
			
			hit_pos_16 = new Shape();
			hit_pos_16.touchable = false;
			hit_pos_16.graphics.beginFill(0x0000ff);
			
			hit_pos_16.graphics.lineTo(311+(63*4),316-(37*4));	
			hit_pos_16.graphics.lineTo(332+(63*4),278-(37*4));	
			hit_pos_16.graphics.lineTo(374+(63*4),278-(37*4));	
			hit_pos_16.graphics.lineTo(393+(63*4),316-(37*4));	
			hit_pos_16.graphics.lineTo(374+(63*4),352-(37*4));	
			hit_pos_16.graphics.lineTo(332+(63*4),352-(37*4));	
			
			hit_pos_16.graphics.endFill(false);
			hit_pos_16.alpha = 0.0;
			
			hit_pos_16.graphics.precisionHitTest = true;	
			
			hit_pos_17 = new Shape();
			hit_pos_17.touchable = false;
			hit_pos_17.graphics.beginFill(0x0000ff);
			
			hit_pos_17.graphics.lineTo(247,427);	
			hit_pos_17.graphics.lineTo(268,389);	
			hit_pos_17.graphics.lineTo(311,389);	
			hit_pos_17.graphics.lineTo(331,427);	
			hit_pos_17.graphics.lineTo(311,463);	
			hit_pos_17.graphics.lineTo(268,463);	
					
			hit_pos_17.graphics.endFill(false);
			hit_pos_17.alpha = 0.0;
			
			hit_pos_17.graphics.precisionHitTest = true;	
			
			
			hit_pos_18 = new Shape();
			hit_pos_18.touchable = false;
			hit_pos_18.graphics.beginFill(0x0000ff);
			
			hit_pos_18.graphics.lineTo(247+(63*1),427-(37*1));	
			hit_pos_18.graphics.lineTo(268+(63*1),389-(37*1));	
			hit_pos_18.graphics.lineTo(311+(63*1),389-(37*1));	
			hit_pos_18.graphics.lineTo(331+(63*1),427-(37*1));	
			hit_pos_18.graphics.lineTo(311+(63*1),463-(37*1));	
			hit_pos_18.graphics.lineTo(268+(63*1),463-(37*1));	
			
			hit_pos_18.graphics.endFill(false);
			hit_pos_18.alpha = 0.0;
			
			hit_pos_18.graphics.precisionHitTest = true;	
								
			hit_pos_19 = new Shape();
			hit_pos_19.touchable = false;
			hit_pos_19.graphics.beginFill(0x0000ff);
			
			hit_pos_19.graphics.lineTo(247+(63*2),427-(37*2));	
			hit_pos_19.graphics.lineTo(268+(63*2),389-(37*2));	
			hit_pos_19.graphics.lineTo(311+(63*2),389-(37*2));	
			hit_pos_19.graphics.lineTo(331+(63*2),427-(37*2));	
			hit_pos_19.graphics.lineTo(311+(63*2),463-(37*2));	
			hit_pos_19.graphics.lineTo(268+(63*2),463-(37*2));	
			
			hit_pos_19.graphics.endFill(false);
			hit_pos_19.alpha = 0.0;
			
			hit_pos_19.graphics.precisionHitTest = true;	
			
			hit_pos_20 = new Shape();
			hit_pos_20.touchable = false;
			hit_pos_20.graphics.beginFill(0x0000ff);
			
			hit_pos_20.graphics.lineTo(247+(63*4),427-(37*4));	
			hit_pos_20.graphics.lineTo(268+(63*4),389-(37*4));	
			hit_pos_20.graphics.lineTo(311+(63*4),389-(37*4));	
			hit_pos_20.graphics.lineTo(331+(63*4),427-(37*4));	
			hit_pos_20.graphics.lineTo(311+(63*4),463-(37*4));	
			hit_pos_20.graphics.lineTo(268+(63*4),463-(37*4));	
			
			hit_pos_20.graphics.endFill(false);
			hit_pos_20.alpha = 0.0;
			
			hit_pos_20.graphics.precisionHitTest = true;	
			
			
			hit_pos_21 = new Shape();
			hit_pos_21.touchable = false;
			hit_pos_21.graphics.beginFill(0x0000ff);
			
			hit_pos_21.graphics.lineTo(247+(63*5),427-(37*5));	
			hit_pos_21.graphics.lineTo(268+(63*5),389-(37*5));	
			hit_pos_21.graphics.lineTo(311+(63*5),389-(37*5));	
			hit_pos_21.graphics.lineTo(331+(63*5),427-(37*5));	
			hit_pos_21.graphics.lineTo(311+(63*5),463-(37*5));	
			hit_pos_21.graphics.lineTo(268+(63*5),463-(37*5));	
			
			hit_pos_21.graphics.endFill(false);
			hit_pos_21.alpha = 0.0;
			
			hit_pos_21.graphics.precisionHitTest = true;	
			
			
			hit_pos_22 = new Shape();
			hit_pos_22.touchable = false;
			hit_pos_22.graphics.beginFill(0x0000ff);
			
			hit_pos_22.graphics.lineTo(247+(63*6),427-(37*6));	
			hit_pos_22.graphics.lineTo(268+(63*6),389-(37*6));	
			hit_pos_22.graphics.lineTo(311+(63*6),389-(37*6));	
			hit_pos_22.graphics.lineTo(331+(63*6),427-(37*6));	
			hit_pos_22.graphics.lineTo(311+(63*6),463-(37*6));	
			hit_pos_22.graphics.lineTo(268+(63*6),463-(37*6));	
			
			hit_pos_22.graphics.endFill(false);
			hit_pos_22.alpha = 0.0;
			
			hit_pos_22.graphics.precisionHitTest = true;	
			
			
			hit_pos_23 = new Shape();
			hit_pos_23.touchable = false;
			hit_pos_23.graphics.beginFill(0x0000ff);
			
			hit_pos_23.graphics.lineTo(247+(63*7),427-(37*7));	
			hit_pos_23.graphics.lineTo(268+(63*7),389-(37*7));	
			hit_pos_23.graphics.lineTo(311+(63*7),389-(37*7));	
			hit_pos_23.graphics.lineTo(331+(63*7),427-(37*7));	
			hit_pos_23.graphics.lineTo(311+(63*7),463-(37*7));	
			hit_pos_23.graphics.lineTo(268+(63*7),463-(37*7));	
			
			hit_pos_23.graphics.endFill(false);
			hit_pos_23.alpha = 0.0;
			
			hit_pos_23.graphics.precisionHitTest = true;	
			
			
			hit_pos_24 = new Shape();
			hit_pos_24.touchable = false;
			hit_pos_24.graphics.beginFill(0x0000ff);
			
			hit_pos_24.graphics.lineTo(561,313);	
			hit_pos_24.graphics.lineTo(581,277);	
			hit_pos_24.graphics.lineTo(624,277);	
			hit_pos_24.graphics.lineTo(644,313);	
			hit_pos_24.graphics.lineTo(624,349);	
			hit_pos_24.graphics.lineTo(581,349);	
			
			hit_pos_24.graphics.endFill(false);
			hit_pos_24.alpha = 0.0;
			
			hit_pos_24.graphics.precisionHitTest = true;	
			
			
			hit_pos_25 = new Shape();
			hit_pos_25.touchable = false;
			hit_pos_25.graphics.beginFill(0x0000ff);
			
			hit_pos_25.graphics.lineTo(561+(63*2),313-(37*2));	
			hit_pos_25.graphics.lineTo(581+(63*2),277-(37*2));	
			hit_pos_25.graphics.lineTo(624+(63*2),277-(37*2));	
			hit_pos_25.graphics.lineTo(644+(63*2),313-(37*2));	
			hit_pos_25.graphics.lineTo(624+(63*2),349-(37*2));	
			hit_pos_25.graphics.lineTo(581+(63*2),349-(37*2));	
			
			hit_pos_25.graphics.endFill(false);
			hit_pos_25.alpha = 0.0;
			
			hit_pos_25.graphics.precisionHitTest = true;	
			
			
			hit_pos_26 = new Shape();
			hit_pos_26.touchable = false;
			hit_pos_26.graphics.beginFill(0xff00ff);
			
			hit_pos_26.graphics.lineTo(496,426);	
			hit_pos_26.graphics.lineTo(518,388);	
			hit_pos_26.graphics.lineTo(561,388);	
			hit_pos_26.graphics.lineTo(581,424);	
			hit_pos_26.graphics.lineTo(561,461);	
			hit_pos_26.graphics.lineTo(518,461);	
			
			hit_pos_26.graphics.endFill(false);
			hit_pos_26.alpha = 0.0;
			
			hit_pos_26.graphics.precisionHitTest = true;	
						
			
			hit_pos_27 = new Shape();
			hit_pos_27.touchable = false;
			hit_pos_27.graphics.beginFill(0x0000ff);
			
			hit_pos_27.graphics.lineTo(496+(63*1),426-(37*1));	
			hit_pos_27.graphics.lineTo(518+(63*1),388-(37*1));	
			hit_pos_27.graphics.lineTo(561+(63*1),388-(37*1));	
			hit_pos_27.graphics.lineTo(581+(63*1),424-(37*1));	
			hit_pos_27.graphics.lineTo(561+(63*1),461-(37*1));	
			hit_pos_27.graphics.lineTo(518+(63*1),461-(37*1));	
			
			hit_pos_27.graphics.endFill(false);
			hit_pos_27.alpha = 0.0;
			
			hit_pos_27.graphics.precisionHitTest = true;	
			
			
			hit_pos_28 = new Shape();
			hit_pos_28.touchable = false;
			hit_pos_28.graphics.beginFill(0x0000ff);
			
			hit_pos_28.graphics.lineTo(496+(63*2),426-(37*2));	
			hit_pos_28.graphics.lineTo(518+(63*2),388-(37*2));	
			hit_pos_28.graphics.lineTo(561+(63*2),388-(37*2));	
			hit_pos_28.graphics.lineTo(581+(63*2),424-(37*2));	
			hit_pos_28.graphics.lineTo(561+(63*2),461-(37*2));	
			hit_pos_28.graphics.lineTo(518+(63*2),461-(37*2));	
			
			hit_pos_28.graphics.endFill(false);
			hit_pos_28.alpha = 0.0;
			
			hit_pos_28.graphics.precisionHitTest = true;	
			
			hit_pos_29 = new Shape();
			hit_pos_29.touchable = false;
			hit_pos_29.graphics.beginFill(0x0000ff);
			
			hit_pos_29.graphics.lineTo(622,54);	
			hit_pos_29.graphics.lineTo(644,15);	
			hit_pos_29.graphics.lineTo(686,15);	
			hit_pos_29.graphics.lineTo(707,54);	
			hit_pos_29.graphics.lineTo(686,90);	
			hit_pos_29.graphics.lineTo(644,90);	
		
		
			hit_pos_29.graphics.endFill(false);
			hit_pos_29.alpha = 0.0;
			
			hit_pos_29.graphics.precisionHitTest = true;	
			
			this.addChild(hit_pos_00);
			this.addChild(hit_pos_01);
			this.addChild(hit_pos_02);
			this.addChild(hit_pos_03);
			this.addChild(hit_pos_04);
			this.addChild(hit_pos_05);
			this.addChild(hit_pos_06);
			this.addChild(hit_pos_07);
			this.addChild(hit_pos_08);
			this.addChild(hit_pos_09);
			this.addChild(hit_pos_10);
			this.addChild(hit_pos_11);
			this.addChild(hit_pos_12);
			this.addChild(hit_pos_13);
			this.addChild(hit_pos_14);
			this.addChild(hit_pos_15);
			this.addChild(hit_pos_16);
			this.addChild(hit_pos_17);
			this.addChild(hit_pos_18);
			this.addChild(hit_pos_19);
			this.addChild(hit_pos_20);
			this.addChild(hit_pos_21);
			this.addChild(hit_pos_22);
			this.addChild(hit_pos_23);
			this.addChild(hit_pos_24);
			this.addChild(hit_pos_25);
			this.addChild(hit_pos_26);
			this.addChild(hit_pos_27);
			this.addChild(hit_pos_28);
			this.addChild(hit_pos_29);
			
		}
		
		private function CreatePos():void{
			pos_00 = new Image(this.assets.getTexture('one'));
			pos_00.touchable = false;
			pos_00.pivotX = 40;
			pos_00.pivotY = 40;
			pos_00.x = 291;
			pos_00.y = 60;
			
			pos_01 = new Image(this.assets.getTexture('one'));
			pos_01.touchable = false;
			pos_01.pivotX = 40;
			pos_01.pivotY = 40;
			pos_01.x = 227;
			pos_01.y = 171;
			
			pos_02 = new Image(this.assets.getTexture('one'));
			pos_02.touchable = false;
			pos_02.pivotX = 40;
			pos_02.pivotY = 40;
			pos_02.x = 291;
			pos_02.y = 134;
			
			pos_03 = new Image(this.assets.getTexture('one'));
			pos_03.touchable = false;
			pos_03.pivotX = 40;
			pos_03.pivotY = 40;
			pos_03.x = 291+62;
			pos_03.y = 134-37;
			
			pos_04 = new Image(this.assets.getTexture('one'));
			pos_04.touchable = false;
			pos_04.pivotX = 40;
			pos_04.pivotY = 40;
			pos_04.x = 291+62+62;
			pos_04.y = 134-37-36;
						
			pos_05 = new Image(this.assets.getTexture('one'));
			pos_05.touchable = false;
			pos_05.pivotX = 40;
			pos_05.pivotY = 40;
			pos_05.x = 291;
			pos_05.y = 208;
					
			pos_06 = new Image(this.assets.getTexture('one'));
			pos_06.touchable = false;
			pos_06.pivotX = 40;
			pos_06.pivotY = 40;
			pos_06.x = 541;
			pos_06.y = 60;
			
			pos_07 = new Image(this.assets.getTexture('one'));
			pos_07.touchable = false;
			pos_07.pivotX = 40;
			pos_07.pivotY = 40;
			pos_07.x = 227;
			pos_07.y = 319;
			
			pos_08 = new Image(this.assets.getTexture('one'));
			pos_08.touchable = false;
			pos_08.pivotX = 40;
			pos_08.pivotY = 40;
			pos_08.x = 227+63;
			pos_08.y = 319-37;
			
			pos_09 = new Image(this.assets.getTexture('one'));
			pos_09.touchable = false;
			pos_09.pivotX = 40;
			pos_09.pivotY = 40;
			pos_09.x = 227+62+62+1;
			pos_09.y = 319-36-36-3;
			
			pos_10 = new Image(this.assets.getTexture('one'));
			pos_10.touchable = false;
			pos_10.pivotX = 40;
			pos_10.pivotY = 40;
			pos_10.x = 227+(62*3)+2;
			pos_10.y = 319-(36*3)-5;
			
			pos_11 = new Image(this.assets.getTexture('one'));
			pos_11.touchable = false;
			pos_11.pivotX = 40;
			pos_11.pivotY = 40;
			pos_11.x = 227+(62*4)+3;
			pos_11.y = 319-(36*4)-5;
			
			pos_12 = new Image(this.assets.getTexture('one'));
			pos_12.touchable = false;
			pos_12.pivotX = 40;
			pos_12.pivotY = 40;
			pos_12.x = 227+(62*5)+4;
			pos_12.y = 319-(36*5)-7;
			
			pos_13 = new Image(this.assets.getTexture('one'));
			pos_13.touchable = false;
			pos_13.pivotX = 40;
			pos_13.pivotY = 40;
			pos_13.x = 227+(62*6)+5;
			pos_13.y = 319-(36*6)-8;
			
			pos_14 = new Image(this.assets.getTexture('one'));
			pos_14.touchable = false;
			pos_14.pivotX = 40;
			pos_14.pivotY = 40;
			pos_14.x = 353;
			pos_14.y = 318;
			
			pos_15 = new Image(this.assets.getTexture('one'));
			pos_15.touchable = false;
			pos_15.pivotX = 40;
			pos_15.pivotY = 40;
			pos_15.x = 227+(62*4)+3;
			pos_15.y = 319-36-36-4;
			
			pos_16 = new Image(this.assets.getTexture('one'));
			pos_16.touchable = false;
			pos_16.pivotX = 40;
			pos_16.pivotY = 40;
			pos_16.x = 227+(62*6)+5;
			pos_16.y = 319-(36*4)-6;
			
			pos_17 = new Image(this.assets.getTexture('one'));
			pos_17.touchable = false;
			pos_17.pivotX = 40;
			pos_17.pivotY = 40;
			pos_17.x = 291;
			pos_17.y = 428;
			
			pos_18 = new Image(this.assets.getTexture('one'));
			pos_18.touchable = false;
			pos_18.pivotX = 40;
			pos_18.pivotY = 40;
			pos_18.x = 353;
			pos_18.y = 428-36;
			
			pos_19 = new Image(this.assets.getTexture('one'));
			pos_19.touchable = false;
			pos_19.pivotX = 40;
			pos_19.pivotY = 40;
			pos_19.x = 353+62;
			pos_19.y = 428-36-36-2;
			
			pos_20 = new Image(this.assets.getTexture('one'));
			pos_20.touchable = false;
			pos_20.pivotX = 40;
			pos_20.pivotY = 40;
			pos_20.x = 227+(62*5)+4;
			pos_20.y = 319-35-4;
			
			pos_21 = new Image(this.assets.getTexture('one'));
			pos_21.touchable = false;
			pos_21.pivotX = 40;
			pos_21.pivotY = 40;
			pos_21.x = 227+(62*6)+4;
			pos_21.y = 319-37-36-3;
			
			pos_22 = new Image(this.assets.getTexture('one'));
			pos_22.touchable = false;
			pos_22.pivotX = 40;
			pos_22.pivotY = 40;
			pos_22.x = 227+(62*7)+5;
			pos_22.y = 319-37-36-36-6;
			
			pos_23 = new Image(this.assets.getTexture('one'));
			pos_23.touchable = false;
			pos_23.pivotX = 40;
			pos_23.pivotY = 40;
			pos_23.x = 227+(62*8)+5;
			pos_23.y = 319-37-36-36-36-7;
						
			pos_24 = new Image(this.assets.getTexture('one'));
			pos_24.touchable = false;
			pos_24.pivotX = 40;
			pos_24.pivotY = 40;
			pos_24.x = 603;
			pos_24.y = 318-2;
						
			pos_25 = new Image(this.assets.getTexture('one'));
			pos_25.touchable = false;
			pos_25.pivotX = 40;
			pos_25.pivotY = 40;
			pos_25.x = 227+(62*8)+6;
			pos_25.y = 319-37-36-6;
			
			pos_26 = new Image(this.assets.getTexture('one'));
			pos_26.touchable = false;
			pos_26.pivotX = 40;
			pos_26.pivotY = 40;
			pos_26.x = 227+(62*5)+4;
			pos_26.y = 428;
			
			pos_27 = new Image(this.assets.getTexture('one'));
			pos_27.touchable = false;
			pos_27.pivotX = 40;
			pos_27.pivotY = 40;
			pos_27.x = 227+(62*6)+5;
			pos_27.y = 428-37-1;
			
			pos_28 = new Image(this.assets.getTexture('one'));
			pos_28.touchable = false;
			pos_28.pivotX = 40;
			pos_28.pivotY = 40;
			pos_28.x = 227+(62*7)+6;
			pos_28.y = 428-37-36-3;
			
			pos_29 = new Image(this.assets.getTexture('one'));
			pos_29.touchable = false;
			pos_29.pivotX = 40;
			pos_29.pivotY = 40;
			pos_29.x = 227+(62*7)+6;
			pos_29.y = 319-(36*7)-9;

			highlight = new Image(this.assets.getTexture('select_hex'));
			highlight.touchable = false;
			highlight.pivotX = 50.5;
			highlight.pivotY = 50.5;
			highlight.x = 227+62+62+1;
			highlight.y = 319-36-36-3;
			
			
			pos_00.alpha = 0;
			pos_01.alpha = 0;
			pos_02.alpha = 0;
			pos_03.alpha = 0;
			pos_04.alpha = 0;
			pos_05.alpha = 0;
			pos_06.alpha = 0;
			pos_07.alpha = 0;
			pos_08.alpha = 0;
			pos_09.alpha = 0;
			pos_10.alpha = 0;
			pos_11.alpha = 0;
			pos_12.alpha = 0;
			pos_13.alpha = 0;
			pos_14.alpha = 0;
			pos_15.alpha = 0;
			pos_16.alpha = 0;
			pos_17.alpha = 0;
			pos_18.alpha = 0;
			pos_19.alpha = 0;
			pos_20.alpha = 0;
			pos_21.alpha = 0;
			pos_22.alpha = 0;
			pos_23.alpha = 0;
			pos_24.alpha = 0;
			pos_25.alpha = 0;
			pos_26.alpha = 0;
			pos_27.alpha = 0;
			pos_28.alpha = 0;
			pos_29.alpha = 0;
			highlight.alpha = 0.5;
			
			this.addChildAt(pos_00,1);
			this.addChildAt(pos_01,2);
			this.addChildAt(pos_02,3);
			this.addChildAt(pos_03,4);
			this.addChildAt(pos_04,5);
			this.addChildAt(pos_05,6);
			this.addChildAt(pos_06,7);
			this.addChildAt(pos_07,8);
			this.addChildAt(pos_08,9);
			this.addChildAt(pos_09,10);
			this.addChildAt(pos_10,11);
			this.addChildAt(pos_11,12);
			this.addChildAt(pos_12,13);
			this.addChildAt(pos_13,14);
			this.addChildAt(pos_14,15);
			this.addChildAt(pos_15,16);
			this.addChildAt(pos_16,17);
			this.addChildAt(pos_17,18);
			this.addChildAt(pos_18,18);
			this.addChildAt(pos_19,20);
			this.addChildAt(pos_20,21);
			this.addChildAt(pos_21,22);
			this.addChildAt(pos_22,23);
			this.addChildAt(pos_23,24);
			this.addChildAt(pos_24,25);
			this.addChildAt(pos_25,26);
			this.addChildAt(pos_26,27);
			this.addChildAt(pos_27,28);
			this.addChildAt(pos_28,29);
			this.addChildAt(pos_29,30);
			this.addChildAt(highlight,31);
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
							FadeOut((LabDesk as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LabDeskObj,true
							);
						}else if(Solved === false){
							if(PopUpOpen === false){
								if(hit_one.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFi();
									hexArray[''+SelectedHex] = 'one';
									this['pos_'+SelectedHex].texture = this.assets.getTexture('one');
									this['pos_'+SelectedHex].alpha = 1;
									SaveHexArray();
								}else if(hit_two.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFi();
									hexArray[''+SelectedHex] = 'two';
									this['pos_'+SelectedHex].texture = this.assets.getTexture('two');
									this['pos_'+SelectedHex].alpha = 1;
									SaveHexArray();
								}else if(hit_three_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFi();
									hexArray[''+SelectedHex] = 'three_left';
									this['pos_'+SelectedHex].texture = this.assets.getTexture('three_left');
									this['pos_'+SelectedHex].alpha = 1;
									SaveHexArray();
								}else if(hit_three_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFi();
									hexArray[''+SelectedHex] = 'three_right';
									this['pos_'+SelectedHex].texture = this.assets.getTexture('three_right');
									this['pos_'+SelectedHex].alpha = 1;
									SaveHexArray();
								}else if(hit_four_foot.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFi();
									hexArray[''+SelectedHex] = 'four_foot';
									this['pos_'+SelectedHex].texture = this.assets.getTexture('four_foot');
									this['pos_'+SelectedHex].alpha = 1;
									SaveHexArray();
								}else if(hit_four_x.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFi();
									hexArray[''+SelectedHex] = 'four_x';
									this['pos_'+SelectedHex].texture = this.assets.getTexture('four_x');
									this['pos_'+SelectedHex].alpha = 1;
									SaveHexArray();
								}else if(hit_rotate_counterwise.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									RotateCC();
								}else if(hit_rotate_clockwise.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									RotateCW();
								}else if(hit_clear_select.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InputTiny();
									hexArray[''+SelectedHex] = null;
									this['pos_'+SelectedHex].alpha = 0;
									this['pos_'+SelectedHex].rotation = deg2rad(0);
									
									SaveHexArray();
								}else if(hit_clear_all.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									ClearAll();
								}else if(hit_push.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									PushHandler();
								}else{
								
									for(var i:int = 0; i<30;i++){
										//	trace(i);
										if(i < 10){
											if(this[('hit_pos_0'+i)].graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
												trace('hit_pos_0'+i);
												HexHandler('0'+i);
												return;
											}
										}else{
											if(this[('hit_pos_'+i)].graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
												trace('hit_pos_'+i);
												
												HexHandler(''+i);
												return;
											}
										}
									}
								}
							}else{
								PopUpOpen = false;
								popupSprite.alpha = 0;
								
							}
							
						}
					}
				}
			}
		}
		
		private function RotateCC():void{
			if(hexArray[''+SelectedHex] != null){
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiTwo();
				
				if(hexRotArray[''+SelectedHex] == 0){
					hexRotArray[''+SelectedHex] = 5;
				}else{
					hexRotArray[''+SelectedHex] = hexRotArray[''+SelectedHex]-1;
				}
				this['pos_'+SelectedHex].rotation = this['pos_'+SelectedHex].rotation-deg2rad(60);
				SaveHexArray();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
			}
		}
		
		private function RotateCW():void{
			if(hexArray[''+SelectedHex] != null){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiTwo();
				if(hexRotArray[''+SelectedHex] == 5){
					hexRotArray[''+SelectedHex] = 0;
				}else{
					hexRotArray[''+SelectedHex] = hexRotArray[''+SelectedHex]+1;
				}
				this['pos_'+SelectedHex].rotation = this['pos_'+SelectedHex].rotation+deg2rad(60);
				SaveHexArray();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
			}
		}
		
		private function SaveHexArray():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle;
			}
			SaveArray['HexArray'] = hexArray;
			SaveArray['HexRotArray'] = hexRotArray;
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabHexPuzzle',SaveArray);
		}
		
		private function PushHandler():void{
		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InputTiny();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();	
			
			trace('pos_00: '+hexArray['00']);
			trace(hexRotArray['00']);		
			trace(rad2deg(pos_00.rotation));		
			
			if(hexArray['00'] == 'two'){
				if(hexRotArray['00'] == 5){
					if(hexArray['01'] == 'two'){
						if(hexRotArray['01'] == 4){
							if(hexArray['02'] == 'four_x'){
								if(hexRotArray['02'] == 0 || hexRotArray['02'] == 3){
									if(hexArray['03'] == 'three_left'){
										if(hexRotArray['03'] == 1){
											if(hexArray['04'] == 'one'){
												if(hexRotArray['04'] == 1){
													if(hexArray['05'] == 'four_x'){
														if(hexRotArray['05'] == 2 || hexRotArray['05'] == 5){
															if(hexArray['06'] == 'two'){
																if(hexRotArray['06'] == 5){
																	if(hexArray['07'] == 'one'){
																		if(hexRotArray['07'] == 4){
																			if(hexArray['08'] == 'four_foot'){
																				if(hexRotArray['08'] == 4){
																					if(hexArray['09'] == 'four_foot'){
																						if(hexRotArray['09'] == 1){
																							if(hexArray['10'] == 'three_left'){
																								if(hexRotArray['10'] == 4){
																									if(hexArray['11'] == 'three_right'){
																										if(hexRotArray['11'] == 1){
																											if(hexArray['12'] == 'four_foot'){
																												if(hexRotArray['12'] == 4){
																													if(hexArray['13'] == 'four_foot'){
																														if(hexRotArray['13'] == 1){
																															if(hexArray['14'] == 'four_x'){
																																if(hexRotArray['14'] == 5 || hexRotArray['14'] == 2){
																																	if(hexArray['15'] == 'three_left'){
																																		if(hexRotArray['15'] == 2){
																																			if(hexArray['16'] == 'four_x'){
																																				if(hexRotArray['16'] == 5 || hexRotArray['16'] == 2){
																																					if(hexArray['17'] == 'one'){
																																						if(hexRotArray['17'] == 4){
																																							if(hexArray['18'] == 'three_right'){
																																								if(hexRotArray['18'] == 4){
																																									if(hexArray['19'] == 'two'){
																																										if(hexRotArray['19'] == 1){
																																											if(hexArray['20'] == 'three_right'){
																																												if(hexRotArray['20'] == 5){
																																													if(hexArray['21'] == 'four_x'){
																																														if(hexRotArray['21'] == 0 || hexRotArray['21'] == 3){
																																															if(hexArray['22'] == 'four_x'){
																																																if(hexRotArray['22'] == 1 || hexRotArray['22'] == 4){
																																																	if(hexArray['23'] == 'two'){
																																																		if(hexRotArray['23'] == 0){
																																																			if(hexArray['24'] == 'four_x'){
																																																				if(hexRotArray['24'] == 5 || hexRotArray['24'] == 2){
																																																					if(hexArray['25'] == 'two'){
																																																						if(hexRotArray['25'] == 2){
																																																							if(hexArray['26'] == 'one'){
																																																								if(hexRotArray['26'] == 4){
																																																									if(hexArray['27'] == 'three_right'){
																																																										if(hexRotArray['27'] == 4){
																																																											if(hexArray['28'] == 'two'){
																																																												if(hexRotArray['28'] == 1){
																																																													if(hexArray['29'] == 'one'){
																																																														if(hexRotArray['29'] == 1){
																																																															trace("SOLVED");
																																																															trace("SOLVED");
																																																															trace("SOLVED");
																																																															Animating = true;
																																																															if(TubeAttached === false){
																																																																popup_text.texture = this.assets.getTexture('popup_text_commencing');
																																																																PopUpOpen = true;
																																																																popupSprite.alpha = 1;
																																																																
																																																																Starling.juggler.delayCall(ShowFailureNoTubeDialogue,2);
																																																															}else{
																																																																popup_text.texture = this.assets.getTexture('popup_text_commencing');
																																																																(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicProcess();	
																																																																if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle != undefined){
																																																																	SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle;
																																																																}
																																																																SaveArray['Solved'] = 'Yes';
																																																																
																																																																(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabHexPuzzle',SaveArray);
																																																																
																																																																PopUpOpen = true;
																																																																popupSprite.alpha = 1;
																																																																
																																																																Starling.juggler.delayCall(function():void{
																																																																	SetPopUpOnSuccess();
																																																																},1.25);
																																																																
																																																																Starling.juggler.delayCall(RunSolve,2.5);
																																																															}
																																																															
																																																														}else{
																																																															trace("FAIL ON 29");
																																																															RunSolveFailure();
																																																														}
																																																													}else{
																																																														trace("FAIL ON 29");
																																																														RunSolveFailure();
																																																													}
																																																												}else{
																																																													trace("FAIL ON 28");
																																																													RunSolveFailure();
																																																												}
																																																											}else{
																																																												trace("FAIL ON 28");
																																																												RunSolveFailure();
																																																											}
																																																										}else{
																																																											trace("FAIL ON 27");
																																																											RunSolveFailure();
																																																										}
																																																									}else{
																																																										trace("FAIL ON 27");
																																																										RunSolveFailure();
																																																									}
																																																								}else{
																																																									trace("FAIL ON 26");
																																																									RunSolveFailure();
																																																								}
																																																							}else{
																																																								trace("FAIL ON 26");
																																																								RunSolveFailure();
																																																							}
																																																						}else{
																																																							trace("FAIL ON 25");
																																																							RunSolveFailure();
																																																						}
																																																					}else{
																																																						trace("FAIL ON 25");
																																																						RunSolveFailure();
																																																					}
																																																				}else{
																																																					trace("FAIL ON 24");
																																																					RunSolveFailure();
																																																				}
																																																			}else{
																																																				trace("FAIL ON 24");
																																																				RunSolveFailure();
																																																			}
																																																		}else{
																																																			trace("FAIL ON 23");
																																																			RunSolveFailure();
																																																		}
																																																	}else{
																																																		trace("FAIL ON 23");
																																																		RunSolveFailure();
																																																	}
																																																}else{
																																																	trace("FAIL ON 22");
																																																	RunSolveFailure();
																																																}
																																															}else{
																																																trace("FAIL ON 22");
																																																RunSolveFailure();
																																															}
																																														}else{
																																															trace("FAIL ON 21");
																																															RunSolveFailure();
																																														}
																																													}else{
																																														trace("FAIL ON 21");
																																														RunSolveFailure();
																																													}
																																												}else{
																																													trace("FAIL ON 20");
																																													RunSolveFailure();
																																												}
																																											}else{
																																												trace("FAIL ON 20");
																																												RunSolveFailure();
																																											}
																																										}else{
																																											trace("FAIL ON 19");
																																											RunSolveFailure();
																																										}
																																									}else{
																																										trace("FAIL ON 19");
																																										RunSolveFailure();
																																									}
																																								}else{
																																									trace("FAIL ON 18");
																																									RunSolveFailure();
																																								}
																																							}else{
																																								trace("FAIL ON 18");
																																								RunSolveFailure();
																																							}
																																						}else{
																																							trace("FAIL ON 17");
																																							RunSolveFailure();
																																						}
																																					}else{
																																						trace("FAIL ON 17");
																																						RunSolveFailure();
																																					}
																																				}else{
																																					trace("FAIL ON 16");
																																					RunSolveFailure();
																																				}
																																			}else{
																																				trace("FAIL ON 16");
																																				RunSolveFailure();
																																			}
																																		}else{
																																			trace("FAIL ON 15");
																																			RunSolveFailure();
																																		}
																																	}else{
																																		trace("FAIL ON 15");
																																		RunSolveFailure();
																																	}
																																}else{
																																	trace("FAIL ON 14");
																																	RunSolveFailure();
																																}
																															}else{
																																trace("FAIL ON 14");
																																RunSolveFailure();
																															}
																														}else{
																															trace("FAIL ON 13");
																															RunSolveFailure();
																														}
																													}else{
																														trace("FAIL ON 13");
																														RunSolveFailure();
																													}
																												}else{
																													trace("FAIL ON 12");
																													RunSolveFailure();
																												}
																											}else{
																												trace("FAIL ON 12");
																												RunSolveFailure();
																											}
																										}else{
																											trace("FAIL ON 11");
																											RunSolveFailure();
																										}
																									}else{
																										trace("FAIL ON 11");
																										RunSolveFailure();
																									}
																								}else{
																									trace("FAIL ON 10");
																									RunSolveFailure();
																								}
																							}else{
																								trace("FAIL ON 10");
																								RunSolveFailure();
																							}
																						}else{
																							trace("FAIL ON 09");
																							RunSolveFailure();
																						}
																					}else{
																						trace("FAIL ON 09");
																						RunSolveFailure();
																					}
																				}else{
																					trace("FAIL ON 09");
																					RunSolveFailure();
																				}
																			}else{
																				trace("FAIL ON 08");
																				RunSolveFailure();
																			}
																		}else{
																			trace("FAIL ON 07");
																			RunSolveFailure();
																		}
																	}else{
																		trace("FAIL ON 07");
																		RunSolveFailure();
																	}
																}else{
																	trace("FAIL ON 06");
																	RunSolveFailure();
																}
															}else{
																trace("FAIL ON 06");
																RunSolveFailure();
															}
														}else{
															trace("FAIL ON 05");
															RunSolveFailure();
														}
													}else{
														trace("FAIL ON 05");
														RunSolveFailure();
													}
												}else{
													trace("FAIL ON 04");
													RunSolveFailure();
												}
											}else{
												trace("FAIL ON 04");
												RunSolveFailure();
											}
										}else{
											trace("FAIL ON 03");
											RunSolveFailure();
										}
									}else{
										trace("FAIL ON 03");
										RunSolveFailure();
									}
								}else{
									trace("FAIL ON 02");
									RunSolveFailure();
								}
							}else{
								trace("FAIL ON 02");
								RunSolveFailure();
							}
						}else{
							trace("FAIL ON 01");
							RunSolveFailure();
						}
					}else{
						trace("FAIL ON 01");
						RunSolveFailure();
					}
				}else{
					trace("FAIL ON 00");
					RunSolveFailure();
				}
			}else{
				trace("FAIL ON 00")
				RunSolveFailure();
			}
//			starling.juggler.delayCall()
		}
		
		private function SetPopUpOnSuccess():void{
			popup_text.texture = this.assets.getTexture('popup_text_inparams');
		}
		
		private function RunSolve():void{
			
			
			FadeOut((LabDesk as Class), 
				(stage.getChildAt(0) as Object).screenGamePlayHandler.LabDeskObj,true
			);
		}
		
		private function RunSolveFailure():void{

			Animating = true;
			popup_text.texture = this.assets.getTexture('popup_text_commencing');
			PopUpOpen = true;
			popupSprite.alpha = 1;
			
			Starling.juggler.delayCall(ShowFailureDialogue,2)
		}
		
		private function ShowFailureNoTubeDialogue():void{
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();	
			popup_text.texture = this.assets.getTexture('popup_text_receptacle');
			Animating = false; 
		}
		private function ShowFailureDialogue():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();	
			popup_text.texture = this.assets.getTexture('popup_text_unstable');
			Animating = false; 
		}
		
		private function ClearAll():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InputTiny();
			hexArray = new Array(
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null,
				null
			);
			pos_00.alpha = 0;
			pos_01.alpha = 0;
			pos_02.alpha = 0;
			pos_03.alpha = 0;
			pos_04.alpha = 0;
			pos_05.alpha = 0;
			pos_06.alpha = 0;
			pos_07.alpha = 0;
			pos_08.alpha = 0;
			pos_09.alpha = 0;
			pos_10.alpha = 0;
			pos_11.alpha = 0;
			pos_12.alpha = 0;
			pos_13.alpha = 0;
			pos_14.alpha = 0;
			pos_15.alpha = 0;
			pos_16.alpha = 0;
			pos_17.alpha = 0;
			pos_18.alpha = 0;
			pos_19.alpha = 0;
			pos_20.alpha = 0;
			pos_21.alpha = 0;
			pos_22.alpha = 0;
			pos_23.alpha = 0;
			pos_24.alpha = 0;
			pos_25.alpha = 0;
			pos_26.alpha = 0;
			pos_27.alpha = 0;
			pos_28.alpha = 0;
			pos_29.alpha = 0;
			
			pos_00.rotation = deg2rad(0);
			pos_01.rotation = deg2rad(0);
			pos_02.rotation = deg2rad(0);
			pos_03.rotation = deg2rad(0);
			pos_04.rotation = deg2rad(0);
			pos_05.rotation = deg2rad(0);
			pos_06.rotation = deg2rad(0);
			pos_07.rotation = deg2rad(0);
			pos_08.rotation = deg2rad(0);
			pos_09.rotation = deg2rad(0);
			pos_10.rotation = deg2rad(0);
			pos_11.rotation = deg2rad(0);
			pos_12.rotation = deg2rad(0);
			pos_13.rotation = deg2rad(0);
			pos_14.rotation = deg2rad(0);
			pos_15.rotation = deg2rad(0);
			pos_16.rotation = deg2rad(0);
			pos_17.rotation = deg2rad(0);
			pos_18.rotation = deg2rad(0);
			pos_19.rotation = deg2rad(0);
			pos_20.rotation = deg2rad(0);
			pos_21.rotation = deg2rad(0);
			pos_22.rotation = deg2rad(0);
			pos_23.rotation = deg2rad(0);
			pos_24.rotation = deg2rad(0);
			pos_25.rotation = deg2rad(0);
			pos_26.rotation = deg2rad(0);
			pos_27.rotation = deg2rad(0);
			pos_28.rotation = deg2rad(0);
			pos_29.rotation = deg2rad(0);
			
			SaveHexArray();
		}
		
		private function HexHandler(hex_id:String):void{
			if(SelectedHex ==hex_id){
				RotateCC();
			}else{			
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
				SelectedHex = hex_id;
				
				highlight.x = this['pos_'+hex_id].x;
				highlight.y = this['pos_'+hex_id].y;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle;
				}
				SaveArray['SelectedHex'] = SelectedHex;
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabHexPuzzle',SaveArray);
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
			
			this.assets.removeTexture("labHexPuzzle_bg",true);
			this.assets.removeTexture("LabHexPuzzle_Sprite_01",true);			
			this.assets.removeTextureAtlas("LabHexPuzzle_Sprite_01",true);
			(stage.getChildAt(0) as Object).falseAsset("labHexPuzzle_01");
			(stage.getChildAt(0) as Object).falseAsset("labHexPuzzle_02");
			(stage.getChildAt(0) as Object).falseAsset("labHexPuzzle_03");
			
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
