package screens.ingamescreens
{
	import com.bkde.as3.parsers.CompiledObject;
	import com.bkde.as3.parsers.MathParser;
	
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
	
	public class ElevatorFuse extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var fuse_red:Image;
		private var fuse_green:Image;
		private var fuse_blue:Image;
		
		private var RedTween:Tween;
		private var GreenTween:Tween;
		private var BlueTween:Tween;
		
		private var md_red_00:Image;
		private var md_red_01:Image;
		private var md_red_02:Image;
		private var md_red_03:Image;
		
		private var sm_red_00:Image;
		private var sm_red_01:Image;
		private var sm_red_02:Image;		
		
		private var lg_red:Image;
		
		private var md_green_00:Image;
		private var md_green_01:Image;
		private var md_green_02:Image;
		private var md_green_03:Image;
		
		private var sm_green_00:Image;
		private var sm_green_01:Image;
		private var sm_green_02:Image;	
		
		private var lg_green:Image;
		
		private var md_blue_00:Image;
		private var md_blue_01:Image;
		private var md_blue_02:Image;
		private var md_blue_03:Image;
		
		private var sm_blue_00:Image;
		private var sm_blue_01:Image;
		private var sm_blue_02:Image;
		
		private var lg_blue:Image;
		
		private var md_red_text_00:Image;
		private var md_red_text_01:Image;
		private var md_red_text_02:Image;
		private var md_red_text_03:Image;
		
		private var sm_red_text_00:Image;
		private var sm_red_text_01:Image;
		private var sm_red_text_02:Image;
		
		private var lg_red_text:TextField;
		
		private var md_green_text_00:Image;
		private var md_green_text_01:Image;
		private var md_green_text_02:Image;
		private var md_green_text_03:Image;
		
		private var sm_green_text_00:Image;
		private var sm_green_text_01:Image;
		private var sm_green_text_02:Image;
		
		private var lg_green_text:TextField;
		
		private var md_blue_text_00:Image;
		private var md_blue_text_01:Image;
		private var md_blue_text_02:Image;
		private var md_blue_text_03:Image;
		
		private var sm_blue_text_00:Image;
		private var sm_blue_text_01:Image;
		private var sm_blue_text_02:Image;
		
		private var lg_blue_text:TextField;
		
		
		private var hit_red_socket:Shape;
		private var hit_green_socket:Shape;
		private var hit_blue_socket:Shape;
		
		private var hit_red_00:Shape;
		private var hit_red_01:Shape;
		private var hit_red_02:Shape;
		private var hit_red_03:Shape;
		private var hit_red_op_00:Shape;
		private var hit_red_op_01:Shape;
		private var hit_red_op_02:Shape;
		private var hit_red_score:Shape;
		
		private var hit_green_00:Shape;
		private var hit_green_01:Shape;
		private var hit_green_02:Shape;
		private var hit_green_03:Shape;
		private var hit_green_op_00:Shape;
		private var hit_green_op_01:Shape;
		private var hit_green_op_02:Shape;
		private var hit_green_score:Shape;
		
		private var hit_blue_00:Shape;
		private var hit_blue_01:Shape;
		private var hit_blue_02:Shape;
		private var hit_blue_03:Shape;
		private var hit_blue_op_00:Shape;
		private var hit_blue_op_01:Shape;
		private var hit_blue_op_02:Shape;
		private var hit_blue_score:Shape;
		
//		private var hit_bg:Shape;
		
		private var RONum:int;
		
		private var red_sprite:Sprite;
		private var green_sprite:Sprite;
		private var blue_sprite:Sprite;
		
		private var RedAttached:Boolean = false;
		private var GreenAttached:Boolean = false;
		private var BlueAttached:Boolean = false;	
		
		
		private var Red_00:int = 4;
		private var Red_01:int = 10;
		private var Red_02:int = 5;
		private var Red_03:int = 30;
		private var RedOp_00:String = '-';
		private var RedOp_01:String = '+';
		private var RedOp_02:String = '+';
		
		private var Blue_00:int = 42;
		private var Blue_01:int = 9;
		private var Blue_02:int = 7;
		private var Blue_03:int = 5;
		private var BlueOp_00:String = '+';
		private var BlueOp_01:String = '+';
		private var BlueOp_02:String = '+';
		
		private var Green_00:int = 96;
		private var Green_01:int = 2;
		private var Green_02:int = 32;
		private var Green_03:int = 36;
		private var GreenOp_00:String = '+';
		private var GreenOp_01:String = '/';
		private var GreenOp_02:String = '+';

		private var delayedCall:DelayedCall;
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function ElevatorFuse(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('elevatorFuse_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ElevatorFuse/elevatorFuse_bg.jpg'));
				game.TrackAssets('elevatorFuse_01');
			}
			if(game.CheckAsset('elevatorFuse_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ElevatorFuse/ElevatorFuse_Sprite_01.png'));
				game.TrackAssets('elevatorFuse_02');
			}
			if(game.CheckAsset('elevatorFuse_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ElevatorFuse/ElevatorFuse_Sprite_01.xml'));
				game.TrackAssets('elevatorFuse_03');
			}
			if(game.CheckAsset('elevatorFuse_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ElevatorFuse/ElevatorFuse_Sprite_02.png'));
				game.TrackAssets('elevatorFuse_04');
			}
			if(game.CheckAsset('elevatorFuse_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ElevatorFuse/ElevatorFuse_Sprite_02.xml'));
				game.TrackAssets('elevatorFuse_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ElevatorFuse","ElevatorFuseObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('elevatorFuse_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			fuse_red = new Image(this.assets.getTexture('fuse_red'));
			fuse_red.touchable = false;
			fuse_red.x = 31;
			fuse_red.y = 117;
			
			fuse_green = new Image(this.assets.getTexture('fuse_green'));
			fuse_green.touchable = false;
			fuse_green.x = 276;
			fuse_green.y = 15;
			
			fuse_blue = new Image(this.assets.getTexture('fuse_blue'));
			fuse_blue.touchable = false;
			fuse_blue.x = 523;
			fuse_blue.y = 217;
						
	
			red_sprite = new Sprite();
			red_sprite.touchable = false;
			red_sprite.x = 0;
			red_sprite.y = 0;
			
			green_sprite = new Sprite();
			green_sprite.touchable = false;
			green_sprite.x = 0;
			green_sprite.y = 0;
			
			blue_sprite = new Sprite();
			blue_sprite.touchable = false;
			blue_sprite.x = 0;
			blue_sprite.y = 0;
			
			md_red_00 = new Image(this.assets.getTexture('mid_red'));
			md_red_00.touchable = false;
			md_red_00.x = 56;
			md_red_00.y = 29;
					
			md_red_01 = new Image(this.assets.getTexture('mid_red'));
			md_red_01.touchable = false;
			md_red_01.x = 56;
			md_red_01.y = 132;
			
			md_red_02 = new Image(this.assets.getTexture('mid_white'));
			md_red_02.touchable = false;
			md_red_02.x = 58;
			md_red_02.y = 236;

			md_red_03 = new Image(this.assets.getTexture('mid_red'));
			md_red_03.touchable = false;
			md_red_03.x = 58;
			md_red_03.y = 340;

			md_green_00 = new Image(this.assets.getTexture('mid_white'));
			md_green_00.touchable = false;
			md_green_00.x = 305;
			md_green_00.y = 27;
	
			md_green_01 = new Image(this.assets.getTexture('mid_green'));
			md_green_01.touchable = false;
			md_green_01.x = 306;
			md_green_01.y = 130;
	
			md_green_02 = new Image(this.assets.getTexture('mid_green'));
			md_green_02.touchable = false;
			md_green_02.x = 307;
			md_green_02.y = 235;

			md_green_03 = new Image(this.assets.getTexture('mid_green'));
			md_green_03.touchable = false;
			md_green_03.x = 307;
			md_green_03.y = 339;
			
			md_blue_00 = new Image(this.assets.getTexture('mid_blue'));
			md_blue_00.touchable = false;
			md_blue_00.x = 552;
			md_blue_00.y = 25;

			md_blue_01 = new Image(this.assets.getTexture('mid_white'));
			md_blue_01.touchable = false;
			md_blue_01.x = 553;
			md_blue_01.y = 128;
		
			md_blue_02 = new Image(this.assets.getTexture('mid_blue'));
			md_blue_02.touchable = false;
			md_blue_02.x = 554;
			md_blue_02.y = 233;

			md_blue_03 = new Image(this.assets.getTexture('mid_blue'));
			md_blue_03.touchable = false;
			md_blue_03.x = 554;
			md_blue_03.y = 337;		
			
			sm_red_00 = new Image(this.assets.getTexture('sm_white'));
			sm_red_00.touchable = false;
			sm_red_00.x = 149;
			sm_red_00.y = 81;

			sm_red_01 = new Image(this.assets.getTexture('sm_red'));
			sm_red_01.touchable = false;
			sm_red_01.x = 149;
			sm_red_01.y = 184;
		
			sm_red_02 = new Image(this.assets.getTexture('sm_red'));
			sm_red_02.touchable = false;
			sm_red_02.x = 150;
			sm_red_02.y = 286;
	
			sm_green_00 = new Image(this.assets.getTexture('sm_green'));
			sm_green_00.touchable = false;
			sm_green_00.x = 399;
			sm_green_00.y = 79;
			
			sm_green_01 = new Image(this.assets.getTexture('sm_white'));
			sm_green_01.touchable = false;
			sm_green_01.x = 399;
			sm_green_01.y = 182;

			sm_green_02 = new Image(this.assets.getTexture('sm_green'));
			sm_green_02.touchable = false;
			sm_green_02.x = 400;
			sm_green_02.y = 284;

			sm_blue_00 = new Image(this.assets.getTexture('sm_blue'));
			sm_blue_00.touchable = false;
			sm_blue_00.x = 638;
			sm_blue_00.y = 78;
		
			sm_blue_01 = new Image(this.assets.getTexture('sm_white'));
			sm_blue_01.touchable = false;
			sm_blue_01.x = 639;
			sm_blue_01.y = 180;
			
			sm_blue_02 = new Image(this.assets.getTexture('sm_blue'));
			sm_blue_02.touchable = false;
			sm_blue_02.x = 640;
			sm_blue_02.y = 282;
			
			
			lg_red = new Image(this.assets.getTexture('lg_red'));
			lg_red.touchable = false;
			lg_red.x = 101;
			lg_red.y = 403;
			
			lg_green = new Image(this.assets.getTexture('lg_green'));
			lg_green.touchable = false;
			lg_green.x = 317;
			lg_green.y = 401;
			
			lg_blue = new Image(this.assets.getTexture('lg_blue'));
			lg_blue.touchable = false;
			lg_blue.x = 529;
			lg_blue.y = 400;
			
			
			
			md_red_text_00 = new Image(this.assets.getTexture('num_004'));
			md_red_text_00.touchable = false;
			md_red_text_00.x = 81;
			md_red_text_00.y = 29;
		
			md_red_text_01 = new Image(this.assets.getTexture('num_010'));
			md_red_text_01.touchable = false;
			md_red_text_01.x = 81;
			md_red_text_01.y = 132;

			md_red_text_02 = new Image(this.assets.getTexture('num_005'));
			md_red_text_02.touchable = false;
			md_red_text_02.x = 82;
			md_red_text_02.y = 236;

			md_red_text_03 = new Image(this.assets.getTexture('num_030'));
			md_red_text_03.touchable = false;
			md_red_text_03.x = 82;
			md_red_text_03.y = 340;
			
			
			sm_red_text_00 = new Image(this.assets.getTexture('op_minus'));
			sm_red_text_00.touchable = false;
			sm_red_text_00.x = 148;
			sm_red_text_00.y = 82;
			
			sm_red_text_01 = new Image(this.assets.getTexture('op_add'));
			sm_red_text_01.touchable = false;
			sm_red_text_01.x = 148;
			sm_red_text_01.y = 185;
			
			sm_red_text_02 = new Image(this.assets.getTexture('op_add'));
			sm_red_text_02.touchable = false;
			sm_red_text_02.x = 149;
			sm_red_text_02.y = 287;
		
			
			
			md_green_text_00 = new Image(this.assets.getTexture('num_096'));
			md_green_text_00.touchable = false;
			md_green_text_00.x = 330;
			md_green_text_00.y = 27;
			
			md_green_text_01 = new Image(this.assets.getTexture('num_002'));
			md_green_text_01.touchable = false;
			md_green_text_01.x = 331;
			md_green_text_01.y = 130;
			
			md_green_text_02 = new Image(this.assets.getTexture('num_032'));
			md_green_text_02.touchable = false;
			md_green_text_02.x = 332;
			md_green_text_02.y = 235;
			
			md_green_text_03 = new Image(this.assets.getTexture('num_036'));
			md_green_text_03.touchable = false;
			md_green_text_03.x = 332;
			md_green_text_03.y = 339;
			
			
			sm_green_text_00 = new Image(this.assets.getTexture('op_add'));
			sm_green_text_00.touchable = false;
			sm_green_text_00.x = 398;
			sm_green_text_00.y = 80;
			
			sm_green_text_01 = new Image(this.assets.getTexture('op_divide'));
			sm_green_text_01.touchable = false;
			sm_green_text_01.x = 398;
			sm_green_text_01.y = 183;
			
			sm_green_text_02 = new Image(this.assets.getTexture('op_add'));
			sm_green_text_02.touchable = false;
			sm_green_text_02.x = 399;
			sm_green_text_02.y = 285;
			
			
			md_blue_text_00 = new Image(this.assets.getTexture('num_042'));
			md_blue_text_00.touchable = false;
			md_blue_text_00.x = 576;
			md_blue_text_00.y = 25;
			
			md_blue_text_01 = new Image(this.assets.getTexture('num_009'));
			md_blue_text_01.touchable = false;
			md_blue_text_01.x = 577;
			md_blue_text_01.y = 128;
			
			md_blue_text_02 = new Image(this.assets.getTexture('num_007'));
			md_blue_text_02.touchable = false;
			md_blue_text_02.x = 578;
			md_blue_text_02.y = 233;
			
			md_blue_text_03 = new Image(this.assets.getTexture('num_005'));
			md_blue_text_03.touchable = false;
			md_blue_text_03.x = 579;
			md_blue_text_03.y = 337;
			
			
			sm_blue_text_00 = new Image(this.assets.getTexture('op_add'));
			sm_blue_text_00.touchable = false;
			sm_blue_text_00.x = 637;
			sm_blue_text_00.y = 79;
			
			sm_blue_text_01 = new Image(this.assets.getTexture('op_add'));
			sm_blue_text_01.touchable = false;
			sm_blue_text_01.x = 638;
			sm_blue_text_01.y = 181;
			
			sm_blue_text_02 = new Image(this.assets.getTexture('op_add'));
			sm_blue_text_02.touchable = false;
			sm_blue_text_02.x = 639;
			sm_blue_text_02.y = 283;
			

			lg_red_text = new TextField(135,100,"49","digital", 54, 0x000000);
			lg_red_text.hAlign = starling.utils.HAlign.RIGHT;
			lg_red_text.x = 90;
			lg_red_text.y = 377;
			
			//lg_red_text
			/*lg_red_text = new Image(this.assets.getTexture('score_high'));
			lg_red_text.touchable = false;
			lg_red_text.x = 111;
			lg_red_text.y = 408;
*/
			lg_green_text = new TextField(135,100,"166","digital", 54, 0x000000);
			lg_green_text.hAlign = starling.utils.HAlign.RIGHT;
			lg_green_text.x = 307;
			lg_green_text.y = 375;
			
			/*
			lg_green_text = new Image(this.assets.getTexture('score_high'));
			lg_green_text.touchable = false;
			lg_green_text.x = 327;
			lg_green_text.y = 406;
			*/
			lg_blue_text = new TextField(135,100,"73","digital", 54, 0x000000);
			lg_blue_text.hAlign = starling.utils.HAlign.RIGHT;
			lg_blue_text.x = 520;
			lg_blue_text.y = 373;
			
			/*lg_blue_text = new Image(this.assets.getTexture('score_high'));
			lg_blue_text.touchable = false;
			lg_blue_text.x = 540;
			lg_blue_text.y = 405;
			*/
			
		//	lg_red_text:Image;

			fuse_red.alpha = 0;	
			fuse_green.alpha = 0;
			fuse_blue.alpha = 0;
			
			md_red_00.alpha = 1;
			md_red_01.alpha = 1;
			md_red_02.alpha = 1;
			md_red_03.alpha = 1;
			md_green_00.alpha = 1;
			md_green_01.alpha = 1;
			md_green_02.alpha = 1;
			md_green_03.alpha = 1;
			md_blue_00.alpha = 1;
			md_blue_01.alpha = 1;
			md_blue_02.alpha = 1;
			md_blue_03.alpha = 1;
			
			sm_red_00.alpha = 1;
			sm_red_01.alpha = 1;
			sm_red_02.alpha = 1;
			sm_green_00.alpha = 1;
			sm_green_01.alpha = 1;
			sm_green_02.alpha = 1;
			sm_blue_00.alpha = 1;
			sm_blue_01.alpha = 1;
			sm_blue_02.alpha = 1;
			
			lg_red.alpha = 0;
			lg_green.alpha = 0;
			lg_blue.alpha = 0;
	
			md_red_text_00.alpha = 0;
			md_red_text_01.alpha = 0;
			md_red_text_02.alpha = 0;
			md_red_text_03.alpha = 0;
			
			sm_red_text_00.alpha = 0;
			sm_red_text_01.alpha = 0;
			sm_red_text_02.alpha = 0;
			
			lg_red_text.alpha = 0;

			md_green_text_00.alpha = 0;
			md_green_text_01.alpha = 0;
			md_green_text_02.alpha = 0;
			md_green_text_03.alpha = 0;
			
			sm_green_text_00.alpha = 0;
			sm_green_text_01.alpha = 0;
			sm_green_text_02.alpha = 0;
			
			lg_green_text.alpha = 0;
			
			
			md_blue_text_00.alpha = 0;
			md_blue_text_01.alpha = 0;
			md_blue_text_02.alpha = 0;
			md_blue_text_03.alpha = 0;
			
			sm_blue_text_00.alpha = 0;
			sm_blue_text_01.alpha = 0;
			sm_blue_text_02.alpha = 0;
			
			lg_blue_text.alpha = 0;
			
			
			red_sprite.alpha = 0;
			green_sprite.alpha = 0;
			blue_sprite.alpha = 0;
			

			red_sprite.addChildAt(md_red_00,0);
			red_sprite.addChildAt(md_red_01,1);
			red_sprite.addChildAt(md_red_02,2);
			red_sprite.addChildAt(md_red_03,3);
			red_sprite.addChildAt(sm_red_00,4);
			red_sprite.addChildAt(sm_red_01,5);
			red_sprite.addChildAt(sm_red_02,6);
			red_sprite.addChildAt(lg_red,7);
			red_sprite.addChildAt(md_red_text_00,8);
			red_sprite.addChildAt(md_red_text_01,9);
			red_sprite.addChildAt(md_red_text_02,10);
			red_sprite.addChildAt(md_red_text_03,11);
			red_sprite.addChildAt(sm_red_text_00,12);
			red_sprite.addChildAt(sm_red_text_01,13);
			red_sprite.addChildAt(sm_red_text_02,14);
			red_sprite.addChildAt(lg_red_text,15);
			
			green_sprite.addChildAt(md_green_00,0);
			green_sprite.addChildAt(md_green_01,1);
			green_sprite.addChildAt(md_green_02,2);
			green_sprite.addChildAt(md_green_03,3);
			green_sprite.addChildAt(sm_green_00,4);
			green_sprite.addChildAt(sm_green_01,5);
			green_sprite.addChildAt(sm_green_02,6);
			green_sprite.addChildAt(lg_green,7);
			green_sprite.addChildAt(md_green_text_00,8);
			green_sprite.addChildAt(md_green_text_01,9);
			green_sprite.addChildAt(md_green_text_02,10);
			green_sprite.addChildAt(md_green_text_03,11);
			green_sprite.addChildAt(sm_green_text_00,12);
			green_sprite.addChildAt(sm_green_text_01,13);
			green_sprite.addChildAt(sm_green_text_02,14);
			green_sprite.addChildAt(lg_green_text,15);
			
			blue_sprite.addChildAt(md_blue_00,0);
			blue_sprite.addChildAt(md_blue_01,1);
			blue_sprite.addChildAt(md_blue_02,2);
			blue_sprite.addChildAt(md_blue_03,3);
			blue_sprite.addChildAt(sm_blue_00,4);
			blue_sprite.addChildAt(sm_blue_01,5);
			blue_sprite.addChildAt(sm_blue_02,6);
			blue_sprite.addChildAt(lg_blue,7);
			blue_sprite.addChildAt(md_blue_text_00,8);
			blue_sprite.addChildAt(md_blue_text_01,9);
			blue_sprite.addChildAt(md_blue_text_02,10);
			blue_sprite.addChildAt(md_blue_text_03,11);
			blue_sprite.addChildAt(sm_blue_text_00,12);
			blue_sprite.addChildAt(sm_blue_text_01,13);
			blue_sprite.addChildAt(sm_blue_text_02,14);
			blue_sprite.addChildAt(lg_blue_text,15);

			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse;
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['RedAttached'] == 'Yes'){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Red_00'] != undefined){
						Red_00 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Red_00'];
						if(Red_00 > 5){
							md_red_text_00.texture = this.assets.getTexture(('num_0'+Red_00));
							
						}else{
							md_red_text_00.texture = this.assets.getTexture(('num_00'+Red_00));
						}
						
						
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Red_01'] != undefined){
						Red_01 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Red_01'];
						if(Red_01 > 5){
							md_red_text_01.texture = this.assets.getTexture(('num_0'+Red_01));
							
						}else{
							md_red_text_01.texture = this.assets.getTexture(('num_00'+Red_01));
						}
						
						
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Red_02'] != undefined){
						Red_02 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Red_02'];
						trace('Red_02: '+Red_02);
						if(Red_02 > 5){
							md_red_text_02.texture = this.assets.getTexture(('num_0'+Red_02));
							
						}else{
							md_red_text_02.texture = this.assets.getTexture(('num_00'+Red_02));
						}
						
						
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Red_03'] != undefined){
						Red_03 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Red_03'];
						if(Red_03 > 5){
							md_red_text_03.texture = this.assets.getTexture(('num_0'+Red_03));
							
						}else{
							md_red_text_03.texture = this.assets.getTexture(('num_00'+Red_03));
						}
						
						
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['RedOp_00'] != undefined){
						RedOp_00 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['RedOp_00'];
						if(RedOp_00 == '+'){
							trace('RedOp_00: '+RedOp_00);
							sm_red_text_00.texture = this.assets.getTexture(('op_add'));
						}else if(RedOp_00 == '-'){
							trace('RedOp_00: '+RedOp_01);
							sm_red_text_00.texture = this.assets.getTexture(('op_minus'));
						}else if(RedOp_00 == '*'){
							trace('RedOp_00: '+RedOp_02);
							sm_red_text_00.texture = this.assets.getTexture(('op_multiply'));
						}else if(RedOp_00 == '/'){
							trace('RedOp_00: '+RedOp_02);
							sm_red_text_00.texture = this.assets.getTexture(('op_divide'));
						}
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['RedOp_01'] != undefined){
						RedOp_01 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['RedOp_01'];
						if(RedOp_01 == '+'){
							sm_red_text_01.texture = this.assets.getTexture(('op_add'));
						}else if(RedOp_01 == '-'){
							sm_red_text_01.texture = this.assets.getTexture(('op_minus'));
						}else if(RedOp_01 == '*'){
							sm_red_text_01.texture = this.assets.getTexture(('op_multiply'));
						}else if(RedOp_01 == '/'){
							sm_red_text_01.texture = this.assets.getTexture(('op_divide'));
						}
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['RedOp_02'] != undefined){
						RedOp_02 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['RedOp_02'];
						if(RedOp_02 == '+'){
							sm_red_text_02.texture = this.assets.getTexture(('op_add'));
						}else if(RedOp_02 == '-'){
							sm_red_text_02.texture = this.assets.getTexture(('op_minus'));
						}else if(RedOp_02 == '*'){
							sm_red_text_02.texture = this.assets.getTexture(('op_multiply'));
						}else if(RedOp_02 == '/'){
							sm_red_text_02.texture = this.assets.getTexture(('op_divide'));
						}
					}
					
					RedCalc();
					
					fuse_red.alpha = 1;
					red_sprite.alpha = 1;
					sm_red_text_00.alpha = 1;
					sm_red_text_01.alpha = 1;
					sm_red_text_02.alpha = 1;		
					md_red_text_00.alpha = 1;
					md_red_text_01.alpha = 1;
					md_red_text_02.alpha = 1;
					md_red_text_03.alpha = 1;
					lg_red.alpha = 1;
					lg_red_text.alpha = 1;
					RedAttached = true;
				}else{
					fuse_red.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['GreenAttached'] == 'Yes'){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Green_00'] != undefined){
						Green_00 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Green_00'];
						if(Green_00 > 2){
							md_green_text_00.texture = this.assets.getTexture(('num_0'+Green_00));
							
						}else{
							md_green_text_00.texture = this.assets.getTexture(('num_00'+Green_00));
						}
						
						
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Green_01'] != undefined){
						Green_01 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Green_01'];
						if(Green_01 > 2){
							md_green_text_01.texture = this.assets.getTexture(('num_0'+Green_01));
							
						}else{
							md_green_text_01.texture = this.assets.getTexture(('num_00'+Green_01));
						}
						
						
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Green_02'] != undefined){
						Green_02 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Green_02'];
						trace('Green_02: '+Green_02);
						if(Green_02 > 2){
							md_green_text_02.texture = this.assets.getTexture(('num_0'+Green_02));
							
						}else{
							md_green_text_02.texture = this.assets.getTexture(('num_00'+Green_02));
						}
						
						
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Green_03'] != undefined){
						Green_03 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Green_03'];
						if(Green_03 > 2){
							md_green_text_03.texture = this.assets.getTexture(('num_0'+Green_03));
							
						}else{
							md_green_text_03.texture = this.assets.getTexture(('num_00'+Green_03));
						}
						
						
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['GreenOp_00'] != undefined){
						GreenOp_00 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['GreenOp_00'];
						if(GreenOp_00 == '+'){
							trace('GreenOp_00: '+GreenOp_00);
							sm_green_text_00.texture = this.assets.getTexture(('op_add'));
						}else if(GreenOp_00 == '-'){
							trace('GreenOp_00: '+GreenOp_01);
							sm_green_text_00.texture = this.assets.getTexture(('op_minus'));
						}else if(GreenOp_00 == '*'){
							trace('GreenOp_00: '+GreenOp_02);
							sm_green_text_00.texture = this.assets.getTexture(('op_multiply'));
						}else if(GreenOp_00 == '/'){
							trace('GreenOp_00: '+GreenOp_02);
							sm_green_text_00.texture = this.assets.getTexture(('op_divide'));
						}
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['GreenOp_01'] != undefined){
						GreenOp_01 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['GreenOp_01'];
						if(GreenOp_01 == '+'){
							sm_green_text_01.texture = this.assets.getTexture(('op_add'));
						}else if(GreenOp_01 == '-'){
							sm_green_text_01.texture = this.assets.getTexture(('op_minus'));
						}else if(GreenOp_01 == '*'){
							sm_green_text_01.texture = this.assets.getTexture(('op_multiply'));
						}else if(GreenOp_01 == '/'){
							sm_green_text_01.texture = this.assets.getTexture(('op_divide'));
						}
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['GreenOp_02'] != undefined){
						GreenOp_02 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['GreenOp_02'];
						if(GreenOp_02 == '+'){
							sm_green_text_02.texture = this.assets.getTexture(('op_add'));
						}else if(GreenOp_02 == '-'){
							sm_green_text_02.texture = this.assets.getTexture(('op_minus'));
						}else if(GreenOp_02 == '*'){
							sm_green_text_02.texture = this.assets.getTexture(('op_multiply'));
						}else if(GreenOp_02 == '/'){
							sm_green_text_02.texture = this.assets.getTexture(('op_divide'));
						}
					}
					
					GreenCalc();
					
					fuse_green.alpha = 1;
					green_sprite.alpha = 1;
					sm_green_text_00.alpha = 1;
					sm_green_text_01.alpha = 1;
					sm_green_text_02.alpha = 1;		
					md_green_text_00.alpha = 1;
					md_green_text_01.alpha = 1;
					md_green_text_02.alpha = 1;
					md_green_text_03.alpha = 1;
					lg_green.alpha = 1;
					lg_green_text.alpha = 1;
					GreenAttached = true;
				}else{
					fuse_green.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['BlueAttached'] == 'Yes'){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Blue_00'] != undefined){
						Blue_00 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Blue_00'];
						if(Blue_00 > 9){
							md_blue_text_00.texture = this.assets.getTexture(('num_0'+Blue_00));
							
						}else{
							md_blue_text_00.texture = this.assets.getTexture(('num_00'+Blue_00));
						}
						
						
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Blue_01'] != undefined){
						Blue_01 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Blue_01'];
						if(Blue_01 > 9){
							md_blue_text_01.texture = this.assets.getTexture(('num_0'+Blue_01));
							
						}else{
							md_blue_text_01.texture = this.assets.getTexture(('num_00'+Blue_01));
						}
						
						
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Blue_02'] != undefined){
						Blue_02 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Blue_02'];
						trace('Green_02: '+Blue_02);
						if(Blue_02 > 9){
							md_blue_text_02.texture = this.assets.getTexture(('num_0'+Blue_02));
							
						}else{
							md_blue_text_02.texture = this.assets.getTexture(('num_00'+Blue_02));
						}
						
						
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Blue_03'] != undefined){
						Blue_03 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Blue_03'];
						if(Blue_03 > 9){
							md_blue_text_03.texture = this.assets.getTexture(('num_0'+Blue_03));
							
						}else{
							md_blue_text_03.texture = this.assets.getTexture(('num_00'+Blue_03));
						}
						
						
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['BlueOp_00'] != undefined){
						BlueOp_00 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['BlueOp_00'];
						if(BlueOp_00 == '+'){
							trace('BlueOp_00: '+BlueOp_00);
							sm_blue_text_00.texture = this.assets.getTexture(('op_add'));
						}else if(BlueOp_00 == '-'){
							trace('BlueOp_00: '+BlueOp_01);
							sm_blue_text_00.texture = this.assets.getTexture(('op_minus'));
						}else if(BlueOp_00 == '*'){
							trace('BlueOp_00: '+GreenOp_02);
							sm_blue_text_00.texture = this.assets.getTexture(('op_multiply'));
						}else if(BlueOp_00 == '/'){
							trace('BlueOp_00: '+BlueOp_02);
							sm_blue_text_00.texture = this.assets.getTexture(('op_divide'));
						}
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['BlueOp_01'] != undefined){
						BlueOp_01 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['BlueOp_01'];
						if(BlueOp_01 == '+'){
							sm_blue_text_01.texture = this.assets.getTexture(('op_add'));
						}else if(BlueOp_01 == '-'){
							sm_blue_text_01.texture = this.assets.getTexture(('op_minus'));
						}else if(BlueOp_01 == '*'){
							sm_blue_text_01.texture = this.assets.getTexture(('op_multiply'));
						}else if(BlueOp_01 == '/'){
							sm_blue_text_01.texture = this.assets.getTexture(('op_divide'));
						}
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['BlueOp_02'] != undefined){
						BlueOp_02 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['BlueOp_02'];
						if(BlueOp_02 == '+'){
							sm_blue_text_02.texture = this.assets.getTexture(('op_add'));
						}else if(BlueOp_02 == '-'){
							sm_blue_text_02.texture = this.assets.getTexture(('op_minus'));
						}else if(BlueOp_02 == '*'){
							sm_blue_text_02.texture = this.assets.getTexture(('op_multiply'));
						}else if(BlueOp_02 == '/'){
							sm_blue_text_02.texture = this.assets.getTexture(('op_divide'));
						}
					}
					
					BlueCalc();
					
					fuse_blue.alpha = 1;
					blue_sprite.alpha = 1;
					sm_blue_text_00.alpha = 1;
					sm_blue_text_01.alpha = 1;
					sm_blue_text_02.alpha = 1;		
					md_blue_text_00.alpha = 1;
					md_blue_text_01.alpha = 1;
					md_blue_text_02.alpha = 1;
					md_blue_text_03.alpha = 1;
					lg_blue.alpha = 1;
					lg_blue_text.alpha = 1;
					BlueAttached = true;
				}else{
					fuse_blue.alpha = 0;
				}
			}else{
				fuse_red.alpha = 0;
				fuse_green.alpha = 0;
				fuse_blue.alpha = 0;
				
			}
			
			
			this.addChildAt(fuse_red,1);
			this.addChildAt(fuse_green,2);
			this.addChildAt(fuse_blue,3);
			
			
			
			this.addChildAt(red_sprite,4);
			this.addChildAt(green_sprite,5);
			this.addChildAt(blue_sprite,6);

	//		CreateBgHit();
			
			CreateSocketHits();
			CreateBlueHit();
			CreateGreenHit();
			CreateRedHit();
			
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		/*
		hit_red_socket
		*/
	/*	private function CreateBgHit():void{
			hit_bg = new Shape();
			hit_bg.touchable = false;
			hit_bg.graphics.beginFill(0xff0000);	
			
			hit_bg.graphics.lineTo(0,0);	
			hit_bg.graphics.lineTo(800,0);	
			hit_bg.graphics.lineTo(800,512);	
			hit_bg.graphics.lineTo(0,512);	
					
			hit_bg.graphics.endFill(false);
			hit_bg.alpha = 0.0;
			hit_bg.graphics.precisionHitTest = true;
			
			this.addChild(hit_bg);
		}
	*/	
		private function CreateSocketHits():void{
			hit_blue_socket = new Shape();
			hit_blue_socket.touchable = false;
			hit_blue_socket.graphics.beginFill(0xff0000);		
			hit_blue_socket.graphics.lineTo(523,211);	
			hit_blue_socket.graphics.lineTo(723,211);	
			hit_blue_socket.graphics.lineTo(723,277);	
			hit_blue_socket.graphics.lineTo(523,277);	
			
			hit_blue_socket.graphics.endFill(false);
			hit_blue_socket.alpha = 0.0;
			hit_blue_socket.graphics.precisionHitTest = true;
			
			hit_green_socket = new Shape();
			hit_green_socket.touchable = false;
			hit_green_socket.graphics.beginFill(0xff0000);		
			hit_green_socket.graphics.lineTo(276,9);	
			hit_green_socket.graphics.lineTo(477,9);	
			hit_green_socket.graphics.lineTo(477,75);	
			hit_green_socket.graphics.lineTo(276,75);	
			
			hit_green_socket.graphics.endFill(false);
			hit_green_socket.alpha = 0.0;
			hit_green_socket.graphics.precisionHitTest = true;
			
			hit_red_socket = new Shape();
			hit_red_socket.touchable = false;
			hit_red_socket.graphics.beginFill(0xff0000);		
			hit_red_socket.graphics.lineTo(27,112);	
			hit_red_socket.graphics.lineTo(233,112);	
			hit_red_socket.graphics.lineTo(233,181);	
			hit_red_socket.graphics.lineTo(27,181);	
									
			hit_red_socket.graphics.endFill(false);
			hit_red_socket.alpha = 0.0;
			hit_red_socket.graphics.precisionHitTest = true;
			
			
			this.addChild(hit_blue_socket);
			this.addChild(hit_green_socket);
			this.addChild(hit_red_socket);
		}
		
		private function CreateBlueHit():void{
			hit_blue_00 = new Shape();
			hit_blue_00.touchable = false;
			hit_blue_00.graphics.beginFill(0xff0000);		
			hit_blue_00.graphics.lineTo(545,17);	
			hit_blue_00.graphics.lineTo(622,17);	
			hit_blue_00.graphics.lineTo(622,60);	
			hit_blue_00.graphics.lineTo(545,60);							
			hit_blue_00.graphics.endFill(false);
			hit_blue_00.alpha = 0.0;
			hit_blue_00.graphics.precisionHitTest = true;
			
			hit_blue_01 = new Shape();
			hit_blue_01.touchable = false;
			hit_blue_01.graphics.beginFill(0xff0000);		
			hit_blue_01.graphics.lineTo(545,120);	
			hit_blue_01.graphics.lineTo(625,120);	
			hit_blue_01.graphics.lineTo(625,161);	
			hit_blue_01.graphics.lineTo(545,161);	
			hit_blue_01.graphics.endFill(false);
			hit_blue_01.alpha = 0.0;
			hit_blue_01.graphics.precisionHitTest = true;
			
			hit_blue_02 = new Shape();
			hit_blue_02.touchable = false;
			hit_blue_02.graphics.beginFill(0xff0000);		
			hit_blue_02.graphics.lineTo(545,224);	
			hit_blue_02.graphics.lineTo(625,224);	
			hit_blue_02.graphics.lineTo(625,265);	
			hit_blue_02.graphics.lineTo(545,265);							
			hit_blue_02.graphics.endFill(false);
			hit_blue_02.alpha = 0.0;
			hit_blue_02.graphics.precisionHitTest = true;
						
			hit_blue_03 = new Shape();
			hit_blue_03.touchable = false;
			hit_blue_03.graphics.beginFill(0xff0000);		
			hit_blue_03.graphics.lineTo(545,329);	
			hit_blue_03.graphics.lineTo(626,329);	
			hit_blue_03.graphics.lineTo(626,370);	
			hit_blue_03.graphics.lineTo(545,370);				
			hit_blue_03.graphics.endFill(false);
			hit_blue_03.alpha = 0.0;
			hit_blue_03.graphics.precisionHitTest = true;
			
			hit_blue_op_00 = new Shape();
			hit_blue_op_00.touchable = false;
			hit_blue_op_00.graphics.beginFill(0xff0000);			
			hit_blue_op_00.graphics.lineTo(629,68);	
			hit_blue_op_00.graphics.lineTo(675,68);	
			hit_blue_op_00.graphics.lineTo(675,112);	
			hit_blue_op_00.graphics.lineTo(629,112);	
								
			hit_blue_op_00.graphics.endFill(false);
			hit_blue_op_00.alpha = 0.0;			
			hit_blue_op_00.graphics.precisionHitTest = true;
			
			
			hit_blue_op_01 = new Shape();
			hit_blue_op_01.touchable = false;
			hit_blue_op_01.graphics.beginFill(0xff0000);			
			hit_blue_op_01.graphics.lineTo(630,172);	
			hit_blue_op_01.graphics.lineTo(675,172);	
			hit_blue_op_01.graphics.lineTo(675,213);	
			hit_blue_op_01.graphics.lineTo(630,213);	
			hit_blue_op_01.graphics.endFill(false);
			hit_blue_op_01.alpha = 0.0;			
			hit_blue_op_01.graphics.precisionHitTest = true;
			
			hit_blue_op_02 = new Shape();
			hit_blue_op_02.touchable = false;
			hit_blue_op_02.graphics.beginFill(0xff0000);			
			hit_blue_op_02.graphics.lineTo(632,273);	
			hit_blue_op_02.graphics.lineTo(676,273);	
			hit_blue_op_02.graphics.lineTo(676,317);	
			hit_blue_op_02.graphics.lineTo(632,317);	
					
			hit_blue_op_02.graphics.endFill(false);
			hit_blue_op_02.alpha = 0.0;			
			hit_blue_op_02.graphics.precisionHitTest = true;
			
			
			hit_blue_score = new Shape();
			hit_blue_score.touchable = false;
			hit_blue_score.graphics.beginFill(0xff0000);			
			hit_blue_score.graphics.lineTo(523,395);	
			hit_blue_score.graphics.lineTo(662,395);	
			hit_blue_score.graphics.lineTo(662,451);	
			hit_blue_score.graphics.lineTo(523,451);	
			
			hit_blue_score.graphics.endFill(false);
			hit_blue_score.alpha = 0.0;			
			hit_blue_score.graphics.precisionHitTest = true;
			
			
			this.addChild(hit_blue_00);
			this.addChild(hit_blue_01);
			this.addChild(hit_blue_02);
			this.addChild(hit_blue_03);
			this.addChild(hit_blue_op_00);
			this.addChild(hit_blue_op_01);
			this.addChild(hit_blue_op_02);
			this.addChild(hit_blue_score);
			
			
			
		}
		
		private function CreateGreenHit():void{
			hit_green_00 = new Shape();
			hit_green_00.touchable = false;
			hit_green_00.graphics.beginFill(0x0000ff);		
			hit_green_00.graphics.lineTo(298,18);	
			hit_green_00.graphics.lineTo(378,18);	
			hit_green_00.graphics.lineTo(378,62);	
			hit_green_00.graphics.lineTo(298,62);					
			hit_green_00.graphics.endFill(false);
			hit_green_00.alpha = 0.0;
			hit_green_00.graphics.precisionHitTest = true;
			
			hit_green_01 = new Shape();
			hit_green_01.touchable = false;
			hit_green_01.graphics.beginFill(0x0000ff);		
			hit_green_01.graphics.lineTo(298,122);	
			hit_green_01.graphics.lineTo(378,122);	
			hit_green_01.graphics.lineTo(378,164);	
			hit_green_01.graphics.lineTo(298,164);				
			hit_green_01.graphics.endFill(false);
			hit_green_01.alpha = 0.0;
			hit_green_01.graphics.precisionHitTest = true;
			
			hit_green_02 = new Shape();
			hit_green_02.touchable = false;
			hit_green_02.graphics.beginFill(0x0000ff);		
			hit_green_02.graphics.lineTo(298,225);	
			hit_green_02.graphics.lineTo(378,225);	
			hit_green_02.graphics.lineTo(378,268);	
			hit_green_02.graphics.lineTo(298,268);					
			hit_green_02.graphics.endFill(false);
			hit_green_02.alpha = 0.0;
			hit_green_02.graphics.precisionHitTest = true;
			
			hit_green_03 = new Shape();
			hit_green_03.touchable = false;
			hit_green_03.graphics.beginFill(0x0000ff);		
			hit_green_03.graphics.lineTo(299,330);	
			hit_green_03.graphics.lineTo(380,330);	
			hit_green_03.graphics.lineTo(380,374);	
			hit_green_03.graphics.lineTo(299,374);				
			hit_green_03.graphics.endFill(false);
			hit_green_03.alpha = 0.0;
			hit_green_03.graphics.precisionHitTest = true;
			
			hit_green_op_00 = new Shape();
			hit_green_op_00.touchable = false;
			hit_green_op_00.graphics.beginFill(0x0000ff);			
			hit_green_op_00.graphics.lineTo(390,69);	
			hit_green_op_00.graphics.lineTo(436,69);	
			hit_green_op_00.graphics.lineTo(436,114);	
			hit_green_op_00.graphics.lineTo(390,114);								
			hit_green_op_00.graphics.endFill(false);
			hit_green_op_00.alpha = 0.0;			
			hit_green_op_00.graphics.precisionHitTest = true;
			
			hit_green_op_01 = new Shape();
			hit_green_op_01.touchable = false;
			hit_green_op_01.graphics.beginFill(0x0000ff);			
			hit_green_op_01.graphics.lineTo(392,172);	
			hit_green_op_01.graphics.lineTo(437,172);	
			hit_green_op_01.graphics.lineTo(437,216);	
			hit_green_op_01.graphics.lineTo(392,216);				
			hit_green_op_01.graphics.endFill(false);
			hit_green_op_01.alpha = 0.0;			
			hit_green_op_01.graphics.precisionHitTest = true;
			
			hit_green_op_02 = new Shape();
			hit_green_op_02.touchable = false;
			hit_green_op_02.graphics.beginFill(0x0000ff);			
			hit_green_op_02.graphics.lineTo(392,274);	
			hit_green_op_02.graphics.lineTo(438,274);	
			hit_green_op_02.graphics.lineTo(438,319);	
			hit_green_op_02.graphics.lineTo(392,319);			
			hit_green_op_02.graphics.endFill(false);
			hit_green_op_02.alpha = 0.0;			
			hit_green_op_02.graphics.precisionHitTest = true;
			
			hit_green_score = new Shape();
			hit_green_score.touchable = false;
			hit_green_score.graphics.beginFill(0x0000ff);			
			hit_green_score.graphics.lineTo(310,394);	
			hit_green_score.graphics.lineTo(449,392);		
			hit_green_score.graphics.lineTo(449,452);		
			hit_green_score.graphics.lineTo(310,452);					
			hit_green_score.graphics.endFill(false);
			hit_green_score.alpha = 0.0;			
			hit_green_score.graphics.precisionHitTest = true;
			
			this.addChild(hit_green_00);
			this.addChild(hit_green_01);
			this.addChild(hit_green_02);
			this.addChild(hit_green_03);
			this.addChild(hit_green_op_00);
			this.addChild(hit_green_op_01);
			this.addChild(hit_green_op_02);
			this.addChild(hit_green_score);
		}
		
		private function CreateRedHit():void{
			hit_red_00 = new Shape();
			hit_red_00.touchable = false;
			hit_red_00.graphics.beginFill(0x0000ff);		
			hit_red_00.graphics.lineTo(43,16);	
			hit_red_00.graphics.lineTo(135,16);	
			hit_red_00.graphics.lineTo(135,65);	
			hit_red_00.graphics.lineTo(43,65);			
			hit_red_00.graphics.endFill(false);
			hit_red_00.alpha = 0.0;
			hit_red_00.graphics.precisionHitTest = true;
			
			
			hit_red_01 = new Shape();
			hit_red_01.touchable = false;
			hit_red_01.graphics.beginFill(0x0000ff);			
			hit_red_01.graphics.lineTo(42,117);	
			hit_red_01.graphics.lineTo(134,117);	
			hit_red_01.graphics.lineTo(134,170);	
			hit_red_01.graphics.lineTo(42,170);			
			hit_red_01.graphics.endFill(false);
			hit_red_01.alpha = 0.0;
			hit_red_01.graphics.precisionHitTest = true;
			
			hit_red_02 = new Shape();
			hit_red_02.touchable = false;
			hit_red_02.graphics.beginFill(0x0000ff);			
			hit_red_02.graphics.lineTo(41,224);	
			hit_red_02.graphics.lineTo(135,224);	
			hit_red_02.graphics.lineTo(135,273);	
			hit_red_02.graphics.lineTo(41,273);						
			hit_red_02.graphics.endFill(false);
			hit_red_02.alpha = 0.0;			
			hit_red_02.graphics.precisionHitTest = true;
			
			
			hit_red_03 = new Shape();
			hit_red_03.touchable = false;
			hit_red_03.graphics.beginFill(0x0000ff);			
			hit_red_03.graphics.lineTo(41,327);	
			hit_red_03.graphics.lineTo(136,327);	
			hit_red_03.graphics.lineTo(136,378);	
			hit_red_03.graphics.lineTo(41,378);							
			hit_red_03.graphics.endFill(false);
			hit_red_03.alpha = 0.0;			
			hit_red_03.graphics.precisionHitTest = true;
			
			hit_red_op_00 = new Shape();
			hit_red_op_00.touchable = false;
			hit_red_op_00.graphics.beginFill(0x0000ff);			
			hit_red_op_00.graphics.lineTo(136,70);	
			hit_red_op_00.graphics.lineTo(190,70);	
			hit_red_op_00.graphics.lineTo(190,119);	
			hit_red_op_00.graphics.lineTo(136,119);						
			hit_red_op_00.graphics.endFill(false);
			hit_red_op_00.alpha = 0.0;			
			hit_red_op_00.graphics.precisionHitTest = true;
			
			hit_red_op_01 = new Shape();
			hit_red_op_01.touchable = false;
			hit_red_op_01.graphics.beginFill(0x0000ff);			
			hit_red_op_01.graphics.lineTo(136,170);	
			hit_red_op_01.graphics.lineTo(195,170);	
			hit_red_op_01.graphics.lineTo(195,220);	
			hit_red_op_01.graphics.lineTo(136,220);								
			hit_red_op_01.graphics.endFill(false);
			hit_red_op_01.alpha = 0.0;			
			hit_red_op_01.graphics.precisionHitTest = true;
			
			hit_red_op_02 = new Shape();
			hit_red_op_02.touchable = false;
			hit_red_op_02.graphics.beginFill(0x0000ff);			
			hit_red_op_02.graphics.lineTo(135,272);	
			hit_red_op_02.graphics.lineTo(193,272);	
			hit_red_op_02.graphics.lineTo(193,326);	
			hit_red_op_02.graphics.lineTo(135,326);										
			hit_red_op_02.graphics.endFill(false);
			hit_red_op_02.alpha = 0.0;			
			hit_red_op_02.graphics.precisionHitTest = true;
			
			hit_red_score = new Shape();
			hit_red_score.touchable = false;
			hit_red_score.graphics.beginFill(0x0000ff);			
			hit_red_score.graphics.lineTo(88,392);	
			hit_red_score.graphics.lineTo(238,392);	
			hit_red_score.graphics.lineTo(238,456);	
			hit_red_score.graphics.lineTo(88,456);	
												
			hit_red_score.graphics.endFill(false);
			hit_red_score.alpha = 0.0;			
			hit_red_score.graphics.precisionHitTest = true;
			
			//hit_red_score
			
			this.addChild(hit_red_00);
			this.addChild(hit_red_01);
			this.addChild(hit_red_02);
			this.addChild(hit_red_03);
			this.addChild(hit_red_op_00);
			this.addChild(hit_red_op_01);
			this.addChild(hit_red_op_02);
			this.addChild(hit_red_score);
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
							FadeOut((Elevator as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ElevatorObj,true
							);
						}else{
							if(RedAttached === false){
								if(hit_red_socket.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									RedSocketHandler();
									return;
								}
							}else{
								
								if(hit_red_score.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Maybe I need to try to calibrate all three of these circuits...");
								}else{
									RedEquationHandler(e);
								}
								
								
								
							}
							if(GreenAttached === false){
								if(hit_green_socket.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									GreenSocketHandler();
									return;
								}
							}else{
								
								if(hit_green_score.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This screen shows the output of the above equation.");
								}else{
									GreenEquationHandler(e);
								}
								
							}
							if(BlueAttached === false){
								if(hit_blue_socket.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									BlueSocketHandler();
									return;
								}
							}else{
								if(hit_blue_score.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The screen at the bottom shows the output of the above equation.");
								}else{
									BlueEquationHandler(e);
								}
								
								
							}
						}
					}
				}
			}
		}
		
		/*
		private var Red_00:int = 4;
		private var Red_01:int = 10;
		private var Red_02:int = 30;
		private var Red_03:int = 5;
		*/
		private function EmptySocketHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... A slot exists where it looks like another fuse is supposed to go.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This must be the reason the elevator isn't working...");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... A slot exists where it looks like another fuse is supposed to go.");

			}
		}
		
		
		private function RedEquationHandler(e:Event):void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse;
			}
			
			
			if(hit_red_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				trace('red 00');
				if(Red_00 == 4){
					Red_00 = 5;
					md_red_text_00.texture = this.assets.getTexture('num_005');
				}else if(Red_00 == 5){
					Red_00 = 10;
					md_red_text_00.texture = this.assets.getTexture('num_010');
				}else if(Red_00 == 10){
					Red_00 = 30;
					md_red_text_00.texture = this.assets.getTexture('num_030');
				}else if(Red_00 == 30){
					Red_00 = 4;
					md_red_text_00.texture = this.assets.getTexture('num_004');
				}
				SaveArray['Red_00'] = Red_00;
				
				
			}else if(hit_red_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				trace('red_01');
				if(Red_01 == 4){
					Red_01 = 5;
					md_red_text_01.texture = this.assets.getTexture('num_005');
				}else if(Red_01 == 5){
					Red_01 = 10;
					md_red_text_01.texture = this.assets.getTexture('num_010');
				}else if(Red_01 == 10){
					Red_01 = 30;
					md_red_text_01.texture = this.assets.getTexture('num_030');
				}else if(Red_01 == 30){
					Red_01 = 4;
					md_red_text_01.texture = this.assets.getTexture('num_004');
				}
				SaveArray['Red_01'] = Red_01;
				
				
			}else if(hit_red_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... this voltage seems fixed.");
				
			/*	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				trace('red_02');
				if(Red_02 == 4){
					Red_02 = 5;
					md_red_text_02.texture = this.assets.getTexture('num_005');
				}else if(Red_02 == 5){
					Red_02 = 10;
					md_red_text_02.texture = this.assets.getTexture('num_010');
				}else if(Red_02 == 10){
					Red_02 = 30;
					md_red_text_02.texture = this.assets.getTexture('num_030');
				}else if(Red_02 == 30){
					Red_02 = 4;
					md_red_text_02.texture = this.assets.getTexture('num_004');
				}
				SaveArray['Red_02'] = Red_02;
			*/	
			}else if(hit_red_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				trace('red_03');
				if(Red_03 == 4){
					Red_03 = 5;
					md_red_text_03.texture = this.assets.getTexture('num_005');
				}else if(Red_03 == 5){
					Red_03 = 10;
					md_red_text_03.texture = this.assets.getTexture('num_010');
				}else if(Red_03 == 10){
					Red_03 = 30;
					md_red_text_03.texture = this.assets.getTexture('num_030');
				}else if(Red_03 == 30){
					Red_03 = 4;
					md_red_text_03.texture = this.assets.getTexture('num_004');
				}
				SaveArray['Red_03'] = Red_03;
			}else if(hit_red_op_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This one doesn't change.");
			/*	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				if(RedOp_00 == '+'){
					RedOp_00 = '-';
					sm_red_text_00.texture = this.assets.getTexture('op_minus');
				}else if(RedOp_00 == '-'){
					RedOp_00 = '*';
					sm_red_text_00.texture = this.assets.getTexture('op_multiply');
				}else if(RedOp_00 == '*'){
					RedOp_00 = '/'
					sm_red_text_00.texture = this.assets.getTexture('op_divide');
				}else if(RedOp_00 == '/'){
					RedOp_00 = '+'
					sm_red_text_00.texture = this.assets.getTexture('op_add');
				}
				SaveArray['RedOp_00'] = RedOp_00;
				*/
			}else if(hit_red_op_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				if(RedOp_01 == '+'){
					RedOp_01 = '-';
					sm_red_text_01.texture = this.assets.getTexture('op_minus');
				}else if(RedOp_01 == '-'){
					RedOp_01 = '*';
					sm_red_text_01.texture = this.assets.getTexture('op_multiply');
				}else if(RedOp_01 == '*'){
					RedOp_01 = '/'
					sm_red_text_01.texture = this.assets.getTexture('op_divide');
				}else if(RedOp_01 == '/'){
					RedOp_01 = '+'
					sm_red_text_01.texture = this.assets.getTexture('op_add');
				}
				SaveArray['RedOp_01'] = RedOp_01;
			}else if(hit_red_op_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			//	(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This one doesn't change.");
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				if(RedOp_02 == '+'){
					RedOp_02 = '-';
					sm_red_text_02.texture = this.assets.getTexture('op_minus');
				}else if(RedOp_02 == '-'){
					RedOp_02 = '*';
					sm_red_text_02.texture = this.assets.getTexture('op_multiply');
				}else if(RedOp_02 == '*'){
					RedOp_02 = '/'
					sm_red_text_02.texture = this.assets.getTexture('op_divide');
				}else if(RedOp_02 == '/'){
					RedOp_02 = '+'
					sm_red_text_02.texture = this.assets.getTexture('op_add');
				}
				SaveArray['RedOp_02'] = RedOp_02;
				
			}
			
			RedCalc();
		}
		
		private function RedCalc():void{
		
			var TempRedString:String = '('+Red_00+RedOp_00+Red_01+RedOp_01+Red_02+')'+RedOp_02+Red_03;
				
			
			var TempRedCalc:Number = MathTest(TempRedString);
			if(TempRedCalc > 9999){
				lg_red_text.text ='>9999';
			}else if(TempRedCalc < -9999){
				lg_red_text.text ='<9999';
			}else{
				lg_red_text.text = (''+(TempRedCalc));
			}
			SaveArray['lg_red_text'] = lg_red_text.text;
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElevatorFuse',SaveArray);
			
			Solve();
			
		}
		
		private function MathTest(Equation:String):Number {
			var parser:MathParser = new MathParser([]);
			var compiledObj:CompiledObject = parser.doCompile(Equation);
			var answer:Number = parser.doEval(compiledObj.PolishArray, []);
			
			// EDIT: In case you wanted variables
		//	var xyParser:MathParser = new MathParser(["x", "y"]);
		//	var xyCompiledObj:CompiledObject = xyParser.doCompile("(x/3)*y+10");
		//	var xyAnswer:Number = xyParser.doEval(xyCompiledObj.PolishArray, [10, 4]);
			
			return answer;
		}
		
		
		private function RedSocketHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_FuseRed)
				
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
				Animating = true; 
				RedAttached = true;
				fuse_red.alpha = 1;
				red_sprite.alpha = 0;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse;
				}
				SaveArray['RedAttached'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElevatorFuse',SaveArray);
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_FuseRed,
						"item_FuseRed"
					);
				
				AnimateRed();
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_FuseGreen)
				
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Maybe I should try placing the fuse in one of the other slots...");	
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_FuseBlue)
				
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think this fuse goes in this slot....");	
			}else{
				EmptySocketHandler();
			}
		}
		
		private function AnimateRed():void{
			RedTween = new Tween(red_sprite, 1, Transitions.LINEAR);
			RedTween.fadeTo(1);
			game.SoundFXObj.PlaySFX_CosmicWaffle();
			RedTween.onComplete = function():void{
				game.SoundFXObj.PlaySFX_ThakOne();
				sm_red_text_00.alpha = 1;
				sm_red_text_01.alpha = 1;
				sm_red_text_02.alpha = 1;				
				Starling.juggler.delayCall(function():void{
					ShowRedText();
				},0.75);

			}
			Starling.juggler.add(RedTween);
		}
		
		private function ShowRedText():void{
			game.SoundFXObj.PlaySFX_ThakOne();
			md_red_text_00.alpha = 1;
			md_red_text_01.alpha = 1;
			md_red_text_02.alpha = 1;
			md_red_text_03.alpha = 1;
			
			Starling.juggler.delayCall(function():void{
				ShowRedScore();	
			},0.75);	
		}
		private function ShowRedScore():void{
			game.SoundFXObj.PlaySFX_ThakOne();
			lg_red.alpha = 1;
			lg_red_text.alpha = 1;
			
			Animating = false;
			RedTween = null;
		}
		
		
		
		
		
		private function GreenEquationHandler(e:Event):void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse;
			}
			
			if(hit_green_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The value is fixed.");
			/*	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				trace('Green 00');
				if(Green_00 == 2){
					Green_00 = 32;
					md_green_text_00.texture = this.assets.getTexture('num_032');
				}else if(Green_00 == 32){
					Green_00 = 36;
					md_green_text_00.texture = this.assets.getTexture('num_036');
				}else if(Green_00 == 36){
					Green_00 = 96;
					md_green_text_00.texture = this.assets.getTexture('num_096');
				}else if(Green_00 == 96){
					Green_00 = 2;
					md_green_text_00.texture = this.assets.getTexture('num_002');
				}
				SaveArray['Green_00'] = Green_00;
			*/	
			}else if(hit_green_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				trace('blue_01');
				if(Green_01 == 2){
					Green_01 = 32;
					md_green_text_01.texture = this.assets.getTexture('num_032');
					trace("green_01 was 5 now 7");
				}else if(Green_01 == 32){
					Green_01 = 36;
					md_green_text_01.texture = this.assets.getTexture('num_036');
					trace("green_01 was 7 now 9");
				}else if(Green_01 == 36){
					Green_01 = 96;
					md_green_text_01.texture = this.assets.getTexture('num_096');
					trace("green_01 was 9 now 42");
				}else if(Green_01 == 96){
					Green_01 = 2;
					md_green_text_01.texture = this.assets.getTexture('num_002');
					trace("green_01 was 42 now 5");
				}
				SaveArray['Green_01'] = Green_01;
			}else if(hit_green_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				trace('green_02');
				if(Green_02 == 2){
					Green_02 = 32;
					md_green_text_02.texture = this.assets.getTexture('num_032');
				}else if(Green_02 == 32){
					Green_02 = 36;
					md_green_text_02.texture = this.assets.getTexture('num_036');
				}else if(Green_02 == 36){
					Green_02 = 96;
					md_green_text_02.texture = this.assets.getTexture('num_096');
				}else if(Green_02 == 96){
					Green_02 = 2;
					md_green_text_02.texture = this.assets.getTexture('num_002');
				}
				SaveArray['Green_02'] = Green_02;
			}else if(hit_green_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				trace('Green_03');
				if(Green_03 == 2){
					Green_03 = 32;
					md_green_text_03.texture = this.assets.getTexture('num_032');
				}else if(Green_03 == 32){
					Green_03 = 36;
					md_green_text_03.texture = this.assets.getTexture('num_036');
				}else if(Green_03 == 36){
					Green_03 = 96;
					md_green_text_03.texture = this.assets.getTexture('num_096');
				}else if(Green_03 == 96){
					Green_03 = 2;
					md_green_text_03.texture = this.assets.getTexture('num_002');
				}
				SaveArray['Green_03'] = Green_03;
			}else if(hit_green_op_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				if(GreenOp_00 == '+'){
					GreenOp_00 = '-';
					sm_green_text_00.texture = this.assets.getTexture('op_minus');
				}else if(GreenOp_00 == '-'){
					GreenOp_00 = '*';
					sm_green_text_00.texture = this.assets.getTexture('op_multiply');
				}else if(GreenOp_00 == '*'){
					GreenOp_00 = '/'
					sm_green_text_00.texture = this.assets.getTexture('op_divide');
				}else if(GreenOp_00 == '/'){
					GreenOp_00 = '+'
					sm_green_text_00.texture = this.assets.getTexture('op_add');
				}
				SaveArray['GreenOp_00'] = GreenOp_00;
			}else if(hit_green_op_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The operator value is fixed...");
			/*	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				if(GreenOp_01 == '+'){
					GreenOp_01 = '-';
					sm_green_text_01.texture = this.assets.getTexture('op_minus');
				}else if(GreenOp_01 == '-'){
					GreenOp_01 = '*';
					sm_green_text_01.texture = this.assets.getTexture('op_multiply');
				}else if(GreenOp_01 == '*'){
					GreenOp_01 = '/'
					sm_green_text_01.texture = this.assets.getTexture('op_divide');
				}else if(GreenOp_01 == '/'){
					GreenOp_01 = '+'
					sm_green_text_01.texture = this.assets.getTexture('op_add');
				}
				SaveArray['GreenOp_01'] = GreenOp_01;
				
			*/	
			}else if(hit_green_op_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				if(GreenOp_02 == '+'){
					GreenOp_02 = '-';
					sm_green_text_02.texture = this.assets.getTexture('op_minus');
				}else if(GreenOp_02 == '-'){
					GreenOp_02 = '*';
					sm_green_text_02.texture = this.assets.getTexture('op_multiply');
				}else if(GreenOp_02 == '*'){
					GreenOp_02 = '/'
					sm_green_text_02.texture = this.assets.getTexture('op_divide');
				}else if(GreenOp_02 == '/'){
					GreenOp_02 = '+'
					sm_green_text_02.texture = this.assets.getTexture('op_add');
				}
				SaveArray['GreenOp_02'] = GreenOp_02;
			}
			
			GreenCalc();
		}
		
		private function GreenCalc():void{
			
			var TempGreenString:String = '('+Green_00+GreenOp_00+Green_01+')'+GreenOp_01+Green_02+GreenOp_02+Green_03;
			trace("TempGreenString:  "+TempGreenString);
			
			var TempGreenCalc:Number = MathTest(TempGreenString);
			if(TempGreenCalc > 9999){
				lg_green_text.text ='>9999';
			}else if(TempGreenCalc < -9999){
				lg_green_text.text ='<9999';
			}else{
				lg_green_text.text = (''+(TempGreenCalc));
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElevatorFuse',SaveArray);
			Solve();
			
		}
		private function GreenSocketHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_FuseGreen)
				
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
				Animating = true; 
				GreenAttached = true;
				
				fuse_green.alpha = 1;
				green_sprite.alpha = 0;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse;
				}
				SaveArray['GreenAttached'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElevatorFuse',SaveArray);
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_FuseGreen,
						"item_FuseGreen"
					);
				
				AnimateGreen();
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_FuseRed)
				
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Maybe I should try placing the fuse in one of the other slots...");	
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_FuseBlue)
				
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think this fuse goes in this slot....");	
			}else{
				EmptySocketHandler();
			}
		}
		
		private function AnimateGreen():void{
			
			GreenTween = new Tween(green_sprite, 1, Transitions.LINEAR);
			GreenTween.fadeTo(1);
			game.SoundFXObj.PlaySFX_CosmicWaffle();
			GreenTween.onComplete = function():void{
				game.SoundFXObj.PlaySFX_ThakOne();
				sm_green_text_00.alpha = 1;
				sm_green_text_01.alpha = 1;
				sm_green_text_02.alpha = 1;				
				Starling.juggler.delayCall(function():void{
					ShowGreenText();
				},0.75);
				
			}
			Starling.juggler.add(GreenTween);
		}
		
		private function ShowGreenText():void{
			game.SoundFXObj.PlaySFX_ThakOne();
			md_green_text_00.alpha = 1;
			md_green_text_01.alpha = 1;
			md_green_text_02.alpha = 1;
			md_green_text_03.alpha = 1;
			
			Starling.juggler.delayCall(function():void{
				ShowGreenScore();
			},0.75);	
		}
		private function ShowGreenScore():void{
			game.SoundFXObj.PlaySFX_ThakOne();
			lg_green.alpha = 1;
			lg_green_text.alpha = 1;
			
			Animating = false;
			GreenTween = null;
		}
		
		
		
		private function BlueEquationHandler(e:Event):void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse;
			}
			
			if(hit_blue_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				trace('blue 00');
				if(Blue_00 == 5){
					Blue_00 = 7;
					md_blue_text_00.texture = this.assets.getTexture('num_007');
				}else if(Blue_00 == 7){
					Blue_00 = 9;
					md_blue_text_00.texture = this.assets.getTexture('num_009');
				}else if(Blue_00 == 9){
					Blue_00 = 42;
					md_blue_text_00.texture = this.assets.getTexture('num_042');
				}else if(Blue_00 == 42){
					Blue_00 = 5;
					md_blue_text_00.texture = this.assets.getTexture('num_005');
				}
				SaveArray['Blue_00'] = Blue_00;
			}else if(hit_blue_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The number won't change...");
			/*	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				trace('blue_01');
				if(Blue_01 == 5){
					Blue_01 = 7;
					md_blue_text_01.texture = this.assets.getTexture('num_007');
					trace("Blue_01 was 5 now 7");
				}else if(Blue_01 == 7){
					Blue_01 = 9;
					md_blue_text_01.texture = this.assets.getTexture('num_009');
					trace("Blue_01 was 7 now 9");
				}else if(Blue_01 == 9){
					Blue_01 = 42;
					md_blue_text_01.texture = this.assets.getTexture('num_042');
					trace("Blue_01 was 9 now 42");
				}else if(Blue_01 == 42){
					Blue_01 = 5;
					md_blue_text_01.texture = this.assets.getTexture('num_005');
					trace("Blue_01 was 42 now 5");
				}
				SaveArray['Blue_01'] = Blue_01;
			*/
			}else if(hit_blue_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				trace('blue_02');
				if(Blue_02 == 5){
					Blue_02 = 7;
					md_blue_text_02.texture = this.assets.getTexture('num_007');
				}else if(Blue_02 == 7){
					Blue_02 = 9;
					md_blue_text_02.texture = this.assets.getTexture('num_009');
				}else if(Blue_02 == 9){
					Blue_02 = 42;
					md_blue_text_02.texture = this.assets.getTexture('num_042');
				}else if(Blue_02 == 42){
					Blue_02 = 5;
					md_blue_text_02.texture = this.assets.getTexture('num_005');
				}
				SaveArray['Blue_02'] = Blue_02;
			}else if(hit_blue_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				trace('blue_03');
				if(Blue_03 == 5){
					Blue_03 = 7;
					md_blue_text_03.texture = this.assets.getTexture('num_007');
				}else if(Blue_03 == 7){
					Blue_03 = 9;
					md_blue_text_03.texture = this.assets.getTexture('num_009');
				}else if(Blue_03 == 9){
					Blue_03 = 42;
					md_blue_text_03.texture = this.assets.getTexture('num_042');
				}else if(Blue_03 == 42){
					Blue_03 = 5;
					md_blue_text_03.texture = this.assets.getTexture('num_005');
				}
				SaveArray['Blue_03'] = Blue_03;
			}else if(hit_blue_op_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				if(BlueOp_00 == '+'){
					BlueOp_00 = '-';
					sm_blue_text_00.texture = this.assets.getTexture('op_minus');
				}else if(BlueOp_00 == '-'){
					BlueOp_00 = '*';
					sm_blue_text_00.texture = this.assets.getTexture('op_multiply');
				}else if(BlueOp_00 == '*'){
					BlueOp_00 = '/'
					sm_blue_text_00.texture = this.assets.getTexture('op_divide');
				}else if(BlueOp_00 == '/'){
					BlueOp_00 = '+'
					sm_blue_text_00.texture = this.assets.getTexture('op_add');
				}
				SaveArray['BlueOp_00'] = BlueOp_00;
			}else if(hit_blue_op_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The operator value is fixed...");
		/* 	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				if(BlueOp_01 == '+'){
					BlueOp_01 = '-';
					sm_blue_text_01.texture = this.assets.getTexture('op_minus');
				}else if(BlueOp_01 == '-'){
					BlueOp_01 = '*';
					sm_blue_text_01.texture = this.assets.getTexture('op_multiply');
				}else if(BlueOp_01 == '*'){
					BlueOp_01 = '/'
					sm_blue_text_01.texture = this.assets.getTexture('op_divide');
				}else if(BlueOp_01 == '/'){
					BlueOp_01 = '+'
					sm_blue_text_01.texture = this.assets.getTexture('op_add');
				}
				SaveArray['BlueOp_01'] = BlueOp_01;
				*/
			}else if(hit_blue_op_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				if(BlueOp_02 == '+'){
					BlueOp_02 = '-';
					sm_blue_text_02.texture = this.assets.getTexture('op_minus');
				}else if(BlueOp_02 == '-'){
					BlueOp_02 = '*';
					sm_blue_text_02.texture = this.assets.getTexture('op_multiply');
				}else if(BlueOp_02 == '*'){
					BlueOp_02 = '/'
					sm_blue_text_02.texture = this.assets.getTexture('op_divide');
				}else if(BlueOp_02 == '/'){
					BlueOp_02 = '+'
					sm_blue_text_02.texture = this.assets.getTexture('op_add');
				}
				SaveArray['BlueOp_02'] = BlueOp_02;
			}
			
			BlueCalc();
		}
		
		private function BlueCalc():void{
			trace("BlueCalc");
			var TempBlueString:String = '('+Blue_00+BlueOp_00+Blue_01+')'+BlueOp_01+'('+Blue_02+BlueOp_02+Blue_03+')';
			trace("TempBlueString:  "+TempBlueString);
			
			var TempBlueCalc:Number = MathTest(TempBlueString);
			if(TempBlueCalc > 9999){
				lg_blue_text.text ='>9999';
			}else if(TempBlueCalc < -9999){
				lg_blue_text.text ='<9999';
			}else{
				lg_blue_text.text = (''+(TempBlueCalc));
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElevatorFuse',SaveArray);
			Solve();
			
		}
		private function BlueSocketHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_FuseBlue)
				
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
				Animating = true; 
				BlueAttached = true;
				
				fuse_blue.alpha = 1;
				blue_sprite.alpha = 0;
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse;
				}
				SaveArray['BlueAttached'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElevatorFuse',SaveArray);
				
				
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_FuseBlue,
						"item_FuseBlue"
					);
				
				AnimateBlue();
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_FuseRed)
				
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Maybe I should try placing the fuse in one of the other slots...");	
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_FuseGreen)
				
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think this fuse goes in this slot....");	
			}else{
				EmptySocketHandler();
			}
		}
		
		private function AnimateBlue():void{
			BlueTween = new Tween(blue_sprite, 1, Transitions.LINEAR);
			BlueTween.fadeTo(1);
			game.SoundFXObj.PlaySFX_CosmicWaffle();
			BlueTween.onComplete = function():void{
				game.SoundFXObj.PlaySFX_ThakOne();
				sm_blue_text_00.alpha = 1;
				sm_blue_text_01.alpha = 1;
				sm_blue_text_02.alpha = 1;				
				Starling.juggler.delayCall(function():void{
					ShowBlueText();
				},0.75);
				
			}
			Starling.juggler.add(BlueTween);
		}
		
		private function ShowBlueText():void{			
			game.SoundFXObj.PlaySFX_ThakOne();
			md_blue_text_00.alpha = 1;
			md_blue_text_01.alpha = 1;
			md_blue_text_02.alpha = 1;
			md_blue_text_03.alpha = 1;
			
			Starling.juggler.delayCall(function():void{
				ShowBlueScore();
			},0.75);	
		}
		private function ShowBlueScore():void{
			game.SoundFXObj.PlaySFX_ThakOne();
			lg_blue.alpha = 1;
			lg_blue_text.alpha = 1;
			
			Animating = false;
			BlueTween = null;
		}
		
		private function Solve():void{
			if(lg_blue_text.text == '100'){
				if(lg_red_text.text == '100'){
					if(lg_green_text.text == '100'){
						trace('SOLVED');
						trace('SOLVED');
						trace('SOLVED');
						game.SoundFXObj.PlaySFX_CosmicWaffle();
						
						Animating = true;
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse;
						}
						SaveArray['Solved'] = 'Yes';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElevatorFuse',SaveArray);
						
						game.assets.purgeQueue();
						Starling.juggler.delayCall(RunSolve,2);
						
				/*		delayedCall = new DelayedCall(function():void{
							
							game.SoundFXObj.PlaySFX_EnergyPulse();
						
							FadeOut((Elevator as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ElevatorObj,true
							);
							Animating = false;
							
							RunSolve();
						}, 2);
						Starling.juggler.add(delayedCall);
				*/
						
					}else{
						trace('GREEN FAILS');
					}
				}else{
					trace('RED FAILS');
				}
			}else{
				trace('BLUE FAILS');
			}
		}
		
		private function RunSolve():void{
			trace("SMOO 00");
			game.SoundFXObj.PlaySFX_EnergyPulse();
			trace("SMOO 01");
			FadeOut((Elevator as Class), 
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ElevatorObj,true
			);
			trace("SMOO 02");
			Animating = false;
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
			
			
			
			this.assets.removeTexture("elevatorFuse_bg",true);
			this.assets.removeTexture("ElevatorFuse_Sprite_01",true);
			this.assets.removeTextureAtlas("ElevatorFuse_Sprite_01",true);
			this.assets.removeTexture("ElevatorFuse_Sprite_02",true);
			this.assets.removeTextureAtlas("ElevatorFuse_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("elevatorFuse_01");
			(stage.getChildAt(0) as Object).falseAsset("elevatorFuse_02");
			(stage.getChildAt(0) as Object).falseAsset("elevatorFuse_03");
			(stage.getChildAt(0) as Object).falseAsset("elevatorFuse_04");
			(stage.getChildAt(0) as Object).falseAsset("elevatorFuse_05");
			
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
