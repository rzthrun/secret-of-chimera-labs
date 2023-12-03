package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	import screens.ingamescreens.SpinWheelArm;
	
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
	import starling.text.TextField;
	import starling.utils.AssetManager;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	import starling.utils.deg2rad;
	import starling.utils.rad2deg;
	
	
	public class SpinWheel extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		public var SaveArray2:Array = new Array();
		
		private var bg:Image;
		private var template:Image;
		
		private var wheel_mc:MovieClip;
		private var hood:Image;
		private var center_hood:Image;
		private var center_purple:Image;
		
		
		private var hit_wheel:Shape;
		
		private var Animating:Boolean = false;
		private var WheelActive:Boolean = false;
		private var FlipWheel:Boolean = false;
		
		private var MouseCurrentAngle:Number = 180;
		private var MousePrevAngle:Number = 180;
		
		private var center_arm:Sprite;
		private var c_ball_00:Image;
		private var c_ball_01:Image;
		private var c_ball_02:Image;
		private var c_ball_03:Image;
		private var c_ball_04:Image;
		private var c_ball_05:Image;
		private var c_ball_06:Image;
		private var c_ball_07:Image;
		private var c_ball_08:Image;
		private var c_ball_09:Image;
		private var c_ball_10:Image;
		private var c_ball_11:Image;
		private var c_ball_12:Image;
		private var c_ball_13:Image;
		private var c_ball_14:Image;
		private var c_ball_15:Image;
		private var c_ball_16:Image;
		private var c_ball_17:Image;
		
		private var retainer:Sprite;
		private var r_ball_00:Image;
		private var r_ball_01:Image;
		private var r_ball_02:Image;
		private var r_ball_03:Image;
		private var r_ball_04:Image;
		private var r_ball_05:Image;
		private var r_ball_06:Image;
		private var r_ball_07:Image;
		private var r_ball_08:Image;
		private var r_ball_09:Image;
		private var r_ball_10:Image;
		private var r_ball_11:Image;
		private var r_ball_12:Image;
		private var r_ball_13:Image;
		private var r_ball_14:Image;
		private var r_ball_15:Image;
		private var r_ball_16:Image;
		private var r_ball_17:Image;
		private var r_ball_18:Image;
		private var r_ball_19:Image;
		private var r_ball_20:Image;
		private var r_ball_21:Image;
		private var r_ball_22:Image;
		private var r_ball_23:Image;
		private var r_ball_24:Image;
		private var r_ball_25:Image;
		private var r_ball_26:Image;
		private var r_ball_27:Image;
		private var r_ball_28:Image;
		private var r_ball_29:Image;
		private var r_ball_30:Image;
		private var r_ball_31:Image;
		private var r_ball_32:Image;
		private var r_ball_33:Image;
		private var r_ball_34:Image;
		private var r_ball_35:Image;
		private var r_ball_36:Image;
		private var r_ball_37:Image;
		private var r_ball_38:Image;
		private var r_ball_39:Image;
		private var r_ball_40:Image;
		private var r_ball_41:Image;
		private var r_ball_42:Image;
		private var r_ball_43:Image;
		private var r_ball_44:Image;
		private var r_ball_45:Image;
		private var r_ball_46:Image;
		private var r_ball_47:Image;
		private var r_ball_48:Image;
		private var r_ball_49:Image;
		private var r_ball_50:Image;
		private var r_ball_51:Image;
		private var r_ball_52:Image;
		private var r_ball_53:Image;
		private var r_ball_54:Image;
		private var r_ball_55:Image;
		private var r_ball_56:Image;
		private var r_ball_57:Image;
		private var r_ball_58:Image;
		private var r_ball_59:Image;
		private var r_ball_60:Image;
		private var r_ball_61:Image;
		private var r_ball_62:Image;
		private var r_ball_63:Image;
		private var r_ball_64:Image;
		private var r_ball_65:Image;
		
		private var armHolder:Sprite;
		private var arm_00:SpinWheelArm;
		private var arm_01:SpinWheelArm;
		private var arm_02:SpinWheelArm;
		private var arm_03:SpinWheelArm;
		private var arm_04:SpinWheelArm;
		private var arm_05:SpinWheelArm;
		private var arm_06:SpinWheelArm;
		private var arm_07:SpinWheelArm;
		private var arm_08:SpinWheelArm;
		private var arm_09:SpinWheelArm;
		
		private var hit_hood_button_01:Shape;
		private var hit_hood_button_02:Shape;
		private var hit_center_button_01:Shape;
		private var hit_center_button_02:Shape;
		private var hit_template:Shape;
		
		private var Arm00Count:int = 0;
		private var Arm01Count:int = 0;
		private var Arm02Count:int = 0;
		private var Arm03Count:int = 0;
		private var Arm04Count:int = 0;
		private var Arm05Count:int = 0;
		private var Arm06Count:int = 0;
		private var Arm07Count:int = 0;
		private var Arm08Count:int = 0;
		private var Arm09Count:int = 0;
		
		private var RetainerCount:int = 65;
		
		private var CenterCount:int = 0;
		
		private var Anima00Tween:Tween;
		private var Anima01Tween:Tween;
		private var Anima02Tween:Tween;
		private var Anima03Tween:Tween;
		private var Anima04Tween:Tween;
		private var Anima05Tween:Tween;
		private var Anima06Tween:Tween;
		private var Anima07Tween:Tween;
		private var Anima08Tween:Tween;
		private var Anima09Tween:Tween;
		
		private var CenterTweenOne:Tween; 
		private var CenterTweenTwo:Tween; 
		
		private var TemplateAttached:Boolean = false;
		private var TemplateFull:Boolean = false;	
		
		private var RONum:int = 0;
		private var RONum2:int = 0;
		
		private var indicatorText:TextField;
		private var indicatorText2:TextField;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		private var currentPos:int = 0;
		
		private var Arm00Arm05Pass:Boolean = false;
		private var Arm01Arm06Pass:Boolean = false;
		private var Arm02Arm07Pass:Boolean = false;
		private var Arm03Arm08Pass:Boolean = false;
		private var Arm04Arm09Pass:Boolean = false;
		private var CenterPass:Boolean = false;
		
		public function SpinWheel(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('spinWheel_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/SpinWheel/spinWheel_bg.jpg'));
				game.TrackAssets('spinWheel_01');
			}
	/*		if(game.CheckAsset('spinWheel_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/SpinWheel/SpinWheel_Sprite_01.png'));
				game.TrackAssets('spinWheel_02');
			}
			if(game.CheckAsset('spinWheel_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/SpinWheel/SpinWheel_Sprite_01.xml'));
				game.TrackAssets('spinWheel_03');
			}
		*/
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("SpinWheel","SpinWheelObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			
		/*	if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
			}
			SaveArray["TemplateFull"] = 'No';
			SaveArray["TemplateAttached"] = 'Yes';
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
		*/	
			bg = new Image(this.assets.getTexture('spinWheel_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
		//	(stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('chinese_page_03')
			wheel_mc = new MovieClip((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTextures("spinwheel__0"),12);
			wheel_mc.width = 800;
			wheel_mc.height = 512;
			wheel_mc.x = 0;
			wheel_mc.y = 0;
			wheel_mc.touchable = false;
			wheel_mc.loop = false; 
			wheel_mc.stop();
			wheel_mc.alpha = 1;
		
			
			hood = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('back_hood'));
			hood.touchable = false;
			hood.x = 475;
			hood.y = 0;
			
			
			
			template = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('template'));
			template.touchable = false;
			template.x = 475+65;
			template.y = 157;
				
			center_hood = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('center_hood'));
			center_hood.touchable = false;
			center_hood.x = 159;
			center_hood.y = 166;
			
			center_purple = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('center_hood_purple'));
			center_purple.touchable = false;
			center_purple.x = 159;
			center_purple.y = 166;
			
			indicatorText = new TextField(200,200,"--","Fake Receipt", 50, 0x66cccc);
			indicatorText.vAlign = starling.utils.VAlign.TOP;
			indicatorText.hAlign = starling.utils.HAlign.LEFT;
			indicatorText.x = 583;
			indicatorText.y = 25;
			
			indicatorText2 = new TextField(200,200,"--","Fake Receipt", 35, 0x66cccc);
			indicatorText2.vAlign = starling.utils.VAlign.TOP;
			indicatorText2.hAlign = starling.utils.HAlign.LEFT;
			indicatorText2.x = 650;
			indicatorText2.y = 92;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){			
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['RetainerCount'] != undefined){
					RetainerCount = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['RetainerCount'];
					
		//			indicatorText.text = ''+(RetainerCount+1);
					
				}

				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['TemplateAttached'] == 'Yes'){
					TemplateAttached = true;
					template.alpha = 1;
				}else{
					template.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['TemplateFull'] == 'Yes'){
					TemplateFull = true;
				//	indicatorText2.text = '66';
					
					
				}
				
				
				
				
			}else{
				template.alpha = 0;
				
			}
			
			hood.alpha = 1;
			
			center_hood.alpha = 1;
			center_purple.alpha = 0
			Starling.juggler.add(wheel_mc);
					
			this.addChildAt(wheel_mc,1);		
			this.addChildAt(hood,2);
			this.addChildAt(template,3);
			CreateRetainer();
			
			this.addChild(center_hood);
			
			CreateArmHolder();
			CreateCenterArm();
			
			this.addChild(center_purple);
			this.addChild(indicatorText);
			this.addChild(indicatorText2);
			
			CreateWheelHit();
			CreatehoodButtonHit();
			CreateCenterButtonHits();
			CreateTemplateHits();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		private function CreateArmHolder():void{
			
			
			armHolder = new Sprite();
			armHolder.width = 512;
			armHolder.height = 512;
			armHolder.pivotX = 256;
			armHolder.pivotY = 256;
			armHolder.x = 263;
			armHolder.y = 256;
			
			
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['currentPos'] != undefined){
					currentPos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['currentPos'];
					trace((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['currentPos']);
					if(currentPos > 0){
						trace("BARKBARK");
						var rot:int = (currentPos)*-36;
						armHolder.rotation = deg2rad(rot);
					}
					trace("rot :"+rot);
					trace("currentPos "+currentPos);
					trace("armHolder.rotation: "+armHolder.rotation);
					trace("armHolder.rotation: "+rad2deg(armHolder.rotation));
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm00Count'] != undefined){
					
					Arm00Count = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm00Count'];
									}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm01Count'] != undefined){
					Arm01Count = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm01Count'];
							
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm02Count'] != undefined){
					Arm02Count = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm02Count'];
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm03Count'] != undefined){
					Arm03Count = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm03Count'];
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm04Count'] != undefined){
					Arm04Count = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm04Count'];
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm05Count'] != undefined){
					Arm05Count = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm05Count'];
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm06Count'] != undefined){
					Arm06Count = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm06Count'];
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm07Count'] != undefined){
					Arm07Count = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm07Count'];
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm08Count'] != undefined){
					Arm08Count = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm08Count'];
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm09Count'] != undefined){
					Arm09Count = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['Arm09Count'];
					
				}
				
			}else{
				
			}
			
			armHolder.alpha = 1;
			
			
			arm_00 = new SpinWheelArm(assets,Arm00Count);
			arm_00.x = 256;
			arm_00.y = 256;
			arm_00.rotation = deg2rad(0);
			arm_00.alpha = 1;
					
			arm_01 = new SpinWheelArm(assets,Arm01Count);
			arm_01.x = 256;
			arm_01.y = 256;
			arm_01.rotation = deg2rad(36*1);
			arm_01.alpha = 1;
			
			arm_02 = new SpinWheelArm(assets,Arm02Count);
			arm_02.x = 256;
			arm_02.y = 256;
			arm_02.rotation = deg2rad(36*2);
			arm_02.alpha = 1;
			
			arm_03 = new SpinWheelArm(assets,Arm03Count);
			arm_03.x = 256;
			arm_03.y = 256;
			arm_03.rotation = deg2rad(36*3);
			arm_03.alpha = 1;
			
			arm_04 = new SpinWheelArm(assets,Arm04Count);
			arm_04.x = 256;
			arm_04.y = 256;
			arm_04.rotation = deg2rad(36*4);
			arm_04.alpha = 1;
			
			arm_05 = new SpinWheelArm(assets,Arm05Count);
			arm_05.x = 256;
			arm_05.y = 256;
			arm_05.rotation = deg2rad(36*5);
			arm_05.alpha = 1;
			
			arm_06 = new SpinWheelArm(assets,Arm06Count);
			arm_06.x = 256;
			arm_06.y = 256;
			arm_06.rotation = deg2rad(36*6);
			arm_06.alpha = 1;
			
			arm_07 = new SpinWheelArm(assets,Arm07Count);
			arm_07.x = 256;
			arm_07.y = 256;
			arm_07.rotation = deg2rad(36*7);
			arm_07.alpha = 1;
			
			arm_08 = new SpinWheelArm(assets,Arm08Count);
			arm_08.x = 256;
			arm_08.y = 256;
			arm_08.rotation = deg2rad(36*8);
			arm_08.alpha = 1;
			
			arm_09 = new SpinWheelArm(assets,Arm09Count);
			arm_09.x = 256;
			arm_09.y = 256;
			arm_09.rotation = deg2rad(36*9);
			arm_09.alpha = 1;
			
			
			
			
			
			armHolder.addChild(arm_00);
			armHolder.addChild(arm_01);
			armHolder.addChild(arm_02);
			armHolder.addChild(arm_03);
			armHolder.addChild(arm_04);
			armHolder.addChild(arm_05);
			armHolder.addChild(arm_06);
			armHolder.addChild(arm_07);
			armHolder.addChild(arm_08);
			armHolder.addChild(arm_09);
			
			
	//		armHolder.addChild(retainer);
	//		armHolder.addChild(r_ball_01);
			
			this.addChild(armHolder);
			trace("BANANA");
			
		}
		
		private function CreateCenterArm():void{
			center_arm = new Sprite();
			center_arm.touchable = false;
			center_arm.x = 255;
			center_arm.y = 250;
			center_arm.alpha = 1;
			
			c_ball_00 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_00.x = 0;
			c_ball_00.y = 0;
			c_ball_00.touchable = false;
			
			
			c_ball_01 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_01.x = -18;
			c_ball_01.y = -18;
			c_ball_01.touchable = false;
			
			c_ball_02 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_02.x = 18;
			c_ball_02.y = 18;
			c_ball_02.touchable = false;
			
			c_ball_03 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_03.x = -18;
			c_ball_03.y = 18;
			c_ball_03.touchable = false;
			
			c_ball_04 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_04.x = 18;
			c_ball_04.y = -18;
			c_ball_04.touchable = false;
			
			c_ball_05 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_05.x = 220-255;
			c_ball_05.y = 257-250;
			c_ball_05.touchable = false;
			
			c_ball_06 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_06.x = 241-255;
			c_ball_06.y = 212-250;
			c_ball_06.touchable = false;
			
			c_ball_07 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_07.x = 302-255;
			c_ball_07.y = 212-250;
			c_ball_07.touchable = false;
			
			c_ball_08 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_08.x = 243-255;
			c_ball_08.y = 286-250;
			c_ball_08.touchable = false;
			
			c_ball_09 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_09.x = 302-255;
			c_ball_09.y = 257-250;
			c_ball_09.touchable = false;
			
			c_ball_10 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_10.x = 260-255;
			c_ball_10.y = 305-250;
			c_ball_10.touchable = false;
			
			
			c_ball_11 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_11.x = 218-255;
			c_ball_11.y = 220-250;
			c_ball_11.touchable = false;
			
			c_ball_12 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_12.x = 220-255;
			c_ball_12.y = 284-250;
			c_ball_12.touchable = false;
			
			c_ball_13 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_13.x = 283-255;
			c_ball_13.y = 248-250;
			c_ball_13.touchable = false;
			
			c_ball_14 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_14.x = 285-255;
			c_ball_14.y = 293-250;
			c_ball_14.touchable = false;
						
			c_ball_15 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_15.x = 270-255;
			c_ball_15.y = 203-250;
			c_ball_15.touchable = false;
			
			c_ball_16 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_16.x = 210-255;
			c_ball_16.y = 238-250;
			c_ball_16.touchable = false;
			
			c_ball_17 =  new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
			c_ball_17.x = 247-255;
			c_ball_17.y = 196-250;
			c_ball_17.touchable = false;
			
			c_ball_00.alpha = 0;
			c_ball_01.alpha = 0;
			c_ball_02.alpha = 0;
			c_ball_03.alpha = 0;
			c_ball_04.alpha = 0;
			c_ball_05.alpha = 0;
			c_ball_06.alpha = 0;
			c_ball_07.alpha = 0;
			c_ball_08.alpha = 0;
			c_ball_09.alpha = 0;
			c_ball_10.alpha = 0;
			c_ball_11.alpha = 0;
			c_ball_12.alpha = 0;
			c_ball_13.alpha = 0;
			c_ball_14.alpha = 0;
			c_ball_15.alpha = 0;
			c_ball_16.alpha = 0;
			c_ball_17.alpha = 0;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['CenterCount'] != undefined){
					CenterCount = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['CenterCount'];
					for (var i:int = 0; i < CenterCount; i++){
						if(i < 10){
							this[('c_ball_0'+[i])].alpha = 1;
						}else{
							this[('c_ball_'+[i])].alpha = 1;
						}
					}
					
				}
			}
			
			
			center_arm.addChild(c_ball_00);
			center_arm.addChild(c_ball_01);
			center_arm.addChild(c_ball_02);
			center_arm.addChild(c_ball_03);
			center_arm.addChild(c_ball_04);
			center_arm.addChild(c_ball_05);
			center_arm.addChild(c_ball_06);
			center_arm.addChild(c_ball_07);
			center_arm.addChild(c_ball_08);
			center_arm.addChild(c_ball_09);
			center_arm.addChild(c_ball_10);
			center_arm.addChild(c_ball_11);
			center_arm.addChild(c_ball_12);
			center_arm.addChild(c_ball_13);
			center_arm.addChild(c_ball_14);
			center_arm.addChild(c_ball_15);
			center_arm.addChild(c_ball_16);
			center_arm.addChild(c_ball_17);
			
			this.addChild(center_arm);
			
			
			if(TemplateFull === true){
				if(RetainerCount > -1){
					indicatorText2.text = '66';
					CheckNumbs(false);
					indicatorText.text = ''+(66-(RetainerCount+1));
				}else{
					CheckNumbs(true);
				}
			}
		}
		
		private function CreateRetainer():void{
			var xMuliple:int = 17;
			var yMuliple:int = 17;
			var xCounter:int = 0;
			var yCounter:int = 0;
			
			retainer = new Sprite();
			retainer.touchable = false;
			retainer.x = 593;
			retainer.y = 173;
			retainer.alpha = 1;
			
			
			
			
			for (var i:int = 0; i <= 65; i++){
				if(i < 10){
					this[('r_ball_0'+[i])] = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
					
					this[('r_ball_0'+[i])].touchable = false;
					this[('r_ball_0'+[i])].x = xCounter*xMuliple;
					this[('r_ball_0'+[i])].y = yCounter*yMuliple;
					if(RetainerCount >= i){
						this[('r_ball_0'+[i])].alpha = 1;
					}else{
						this[('r_ball_0'+[i])].alpha = 0;
					}
					retainer.addChild(this[('r_ball_0'+[i])]);
					
					
					
				}else{
					this[('r_ball_'+[i])] = new Image((stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball'));
					
					
					this[('r_ball_'+[i])].x = xCounter*xMuliple;
					this[('r_ball_'+[i])].y = yCounter*yMuliple;
					
					if(RetainerCount >= i){
						this[('r_ball_'+[i])].alpha = 1;
					}else{
						this[('r_ball_'+[i])].alpha = 0;
					}
					
					retainer.addChild(this[('r_ball_'+[i])]);
				}
				
				if(xCounter == 5){
					xCounter = 0;
					yCounter = yCounter+1;
				}else{
					xCounter = xCounter+1;
				}
	
			}
			
			this.addChild(retainer);
			
			if(TemplateFull === false){
				retainer.alpha = 0;
			}
			
			/*
			private var CellAttached:Boolean = false;
			private var CellFull:Boolean = false;
			
			*/
			
		}
		/*
		
		private var hit_center_button_01:Shape;
		private var hit_center_button_02:Shape;
		
		*/
		//hit_template
		
		private function CreateTemplateHits():void{
			
			hit_template = new Shape();
			hit_template.touchable = false;
			hit_template.graphics.beginFill(0x0000ff);
			
			hit_template.graphics.lineTo(554,221);	
			hit_template.graphics.lineTo(578,209);	
			hit_template.graphics.lineTo(578,153);	
			hit_template.graphics.lineTo(711,158);	
			hit_template.graphics.lineTo(708,405);	
			hit_template.graphics.lineTo(580,405);	
			hit_template.graphics.lineTo(577,297);	
			hit_template.graphics.lineTo(555,277);	
		
			hit_template.graphics.endFill(false);
			hit_template.alpha = 0.0;
			
			hit_template.graphics.precisionHitTest = true;	
			this.addChild(hit_template);
		}
		
		
		private function CreateCenterButtonHits():void{
			
			hit_center_button_01 = new Shape();
			hit_center_button_01.touchable = false;
			hit_center_button_01.graphics.beginFill(0x0000ff);
			
			hit_center_button_01.graphics.lineTo(156,229);	
			hit_center_button_01.graphics.lineTo(208,229);	
			hit_center_button_01.graphics.lineTo(208,279);	
			hit_center_button_01.graphics.lineTo(156,279);	
			
			hit_center_button_01.graphics.endFill(false);
			hit_center_button_01.alpha = 0.0;
			
			hit_center_button_01.graphics.precisionHitTest = true;	
			this.addChild(hit_center_button_01);
			
			hit_center_button_02 = new Shape();
			hit_center_button_02.touchable = false;
			hit_center_button_02.graphics.beginFill(0x0000ff);
			
			hit_center_button_02.graphics.lineTo(315,230);	
			hit_center_button_02.graphics.lineTo(368,230);	
			hit_center_button_02.graphics.lineTo(368,283);	
			hit_center_button_02.graphics.lineTo(315,283);	
			
			hit_center_button_02.graphics.endFill(false);
			hit_center_button_02.alpha = 0.0;
			
			hit_center_button_02.graphics.precisionHitTest = true;	
			this.addChild(hit_center_button_02);
		}
		
		private function CreatehoodButtonHit():void{
			hit_hood_button_01 = new Shape();
			hit_hood_button_01.touchable = false;
			hit_hood_button_01.graphics.beginFill(0x0000ff);
			
			hit_hood_button_01.graphics.lineTo(487,183);	
			hit_hood_button_01.graphics.lineTo(551,147);	
			hit_hood_button_01.graphics.lineTo(577,167);	
			hit_hood_button_01.graphics.lineTo(567,208);	
			hit_hood_button_01.graphics.lineTo(513,228);	
		
			hit_hood_button_01.graphics.endFill(false);
			hit_hood_button_01.alpha = 0.0;
			
			hit_hood_button_01.graphics.precisionHitTest = true;	
			this.addChild(hit_hood_button_01);
			
			hit_hood_button_02 = new Shape();
			hit_hood_button_02.touchable = false;
			hit_hood_button_02.graphics.beginFill(0x0000ff);
			
			hit_hood_button_02.graphics.lineTo(477,313);	
			hit_hood_button_02.graphics.lineTo(513,266);	
			hit_hood_button_02.graphics.lineTo(576,309);	
			hit_hood_button_02.graphics.lineTo(553,357);	
			
			hit_hood_button_02.graphics.endFill(false);
			hit_hood_button_02.alpha = 0.0;
			
			hit_hood_button_02.graphics.precisionHitTest = true;	
			this.addChild(hit_hood_button_02);
		}
		
		private function CreateWheelHit():void{
			hit_wheel = new Shape();
			hit_wheel.touchable = false;
			hit_wheel.graphics.beginFill(0xff0000);
			
			hit_wheel.graphics.lineTo(0,241);	
			hit_wheel.graphics.lineTo(56,82);	
			hit_wheel.graphics.lineTo(195,0);	
			hit_wheel.graphics.lineTo(345,0);	
			hit_wheel.graphics.lineTo(472,85);	
			hit_wheel.graphics.lineTo(523,252);	
			hit_wheel.graphics.lineTo(451,435);	
			hit_wheel.graphics.lineTo(306,509);	
			hit_wheel.graphics.lineTo(186,507);	
			hit_wheel.graphics.lineTo(65,442);	
			
			hit_wheel.graphics.endFill(false);
			hit_wheel.alpha = 0.0;
			
			hit_wheel.graphics.precisionHitTest = true;	
			this.addChild(hit_wheel);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.BEGAN) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(hit_hood_button_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(TemplateFull === true){
								if(RetainerCount > -1){
									AddFromRetainerHandler();
								}else{
									
								}
							}
						}else if(hit_hood_button_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(TemplateFull === true){
								AddToRetainerHandler();
							}
							
							
						}else if(hit_center_button_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(TemplateFull === true){
								RemoveFromCenter();
							}
						}else if(hit_center_button_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(TemplateFull === true){
								AddToCenter();
							}
						} 
						
						else if(hit_template.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						//	if(TemplateFull === false){
								TemplateHandler();
						//	}
						}
						
						else if(hit_wheel.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
								MousePrevAngle = (
									((Math.atan2(touches[0].globalY-252, touches[0].globalX-263))
										*180
									)/ Math.PI
								)+180;
						//		)+180;
								
								WheelActive = true;
						}
						if(TemplateFull == true){
							if(RetainerCount > -1){
								indicatorText2.text = '66';
								CheckNumbs(false);
							}else{
								CheckNumbs(true);
							}
						}
						 
					}else if(touches[0].phase == TouchPhase.ENDED){
					//	trace("touch end");
						if(targ == goback.SourceImage){
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((GeneticsRoomDesk as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomDeskObj,true
							);
						}else if(WheelActive === true){
							if(hit_wheel.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								trace("MousePrevAngle: "+MousePrevAngle);
								trace("MouseCurrentAngle: "+MouseCurrentAngle);
								WheelActive = false;
								MouseCurrentAngle = (
									((Math.atan2(touches[0].globalY-252, touches[0].globalX-263))
										*180
									)/ Math.PI
								)+180;
//								)+180;
						//		trace((Math.abs(MouseCurrentAngle - MousePrevAngle)));
								if(Math.abs(MouseCurrentAngle - MousePrevAngle) > 10){
								//	RandNoiseHandler();
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WindUp(1);
									Animating = true;
									if(Math.abs(MouseCurrentAngle - MousePrevAngle) > 180){
										FlipWheel = true;
									}
									wheel_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onWheelFrame);
								}else{
									WheelActive = false;
								}
								
								
							}else{
								Animating = false;	
								WheelActive = false;
								
								
							}
							
						}else{
							
						}
					
					}
				}
			}
		}
		
		private function TemplateHandler():void{
			if(TemplateAttached === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Cell)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
					}
					SaveArray["TemplateAttached"] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
					
					TemplateAttached = true;
					template.alpha = 1;
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_Cell,
							"item_Cell"
						);
					
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_CellFull)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
					}
					SaveArray["TemplateAttached"] = 'Yes';
					SaveArray["TemplateFull"] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
					
					TemplateAttached = true;
					template.alpha = 1;
					
					TemplateAttached = true;
					TemplateFull = true;
					template.alpha = 1;
					retainer.alpha = 1;
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_CellFull,
							"item_CellFull"
						);
				}else{
					
					
			//		(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A retangular slot is moulded into");
				}
			}else if(TemplateFull === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_InjectorFull)
				{					
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
					}
					
					SaveArray["TemplateFull"] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
					
					TemplateFull = true;
					
					
					
					for (var i:int = 0; i <= 65; i++){
						if(i < 10){
							this[('r_ball_0'+[i])].alpha = 0;
						}else{
							this[('r_ball_'+[i])].alpha = 0;
						}									
					}
					
					
					retainer.alpha = 1;
					Animating = true;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
					AnimateRetainer00();
				//	Starling.juggler.delayCall(AnimateRetainer00,0.5);
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_InjectorFull,
							"item_InjectorFull"
						);
					
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					!= 
					false)
				{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I don't think that item will help here.");	
					
				}else{
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
					}
					SaveArray["TemplateAttached"] = 'No';
				
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
					
					
					TemplateAttached = false;
					template.alpha = 0;
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Cell,
						'item_Cell',
						'inven_cell_sm'
					);
					
				}
				
			}else{
			//	(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I don't think that item will help here.");	
				
			}
		}
		
		private function AnimateRetainer00():void{		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
			r_ball_00.alpha = 1;
			r_ball_01.alpha = 1;
			r_ball_02.alpha = 1;
			r_ball_03.alpha = 1;
			r_ball_04.alpha = 1;
			r_ball_05.alpha = 1;
			Starling.juggler.delayCall(AnimateRetainer01,0.15);
		}
		private function AnimateRetainer01():void{		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Squirt();
			r_ball_06.alpha = 1;
			r_ball_07.alpha = 1;
			r_ball_08.alpha = 1;
			r_ball_09.alpha = 1;
			r_ball_10.alpha = 1;
			r_ball_11.alpha = 1;
			Starling.juggler.delayCall(AnimateRetainer02,0.15);
		}
		private function AnimateRetainer02():void{		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Squirt();
			r_ball_12.alpha = 1;
			r_ball_13.alpha = 1;
			r_ball_14.alpha = 1;
			r_ball_15.alpha = 1;
			r_ball_16.alpha = 1;
			r_ball_17.alpha = 1;
			Starling.juggler.delayCall(AnimateRetainer03,0.15);
		}
		private function AnimateRetainer03():void{		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Squirt();
			r_ball_18.alpha = 1;
			r_ball_19.alpha = 1;
			r_ball_20.alpha = 1;
			r_ball_21.alpha = 1;
			r_ball_22.alpha = 1;
			r_ball_23.alpha = 1;
			Starling.juggler.delayCall(AnimateRetainer04,0.15);
		}
		private function AnimateRetainer04():void{		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Squirt();
			r_ball_24.alpha = 1;
			r_ball_25.alpha = 1;
			r_ball_26.alpha = 1;
			r_ball_27.alpha = 1;
			r_ball_28.alpha = 1;
			r_ball_29.alpha = 1;
			Starling.juggler.delayCall(AnimateRetainer05,0.15);
		}
		private function AnimateRetainer05():void{		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Squirt();r_ball_30.alpha = 1;
			r_ball_31.alpha = 1;
			r_ball_32.alpha = 1;
			r_ball_33.alpha = 1;;
			r_ball_34.alpha = 1;
			r_ball_35.alpha = 1;
			Starling.juggler.delayCall(AnimateRetainer06,0.15);
		}
		private function AnimateRetainer06():void{		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Squirt();
			r_ball_36.alpha = 1;
			r_ball_37.alpha = 1;
			r_ball_38.alpha = 1;
			r_ball_39.alpha = 1;
			r_ball_40.alpha = 1;
			r_ball_41.alpha = 1;
			Starling.juggler.delayCall(AnimateRetainer07,0.15);
		}
		private function AnimateRetainer07():void{		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Squirt();
			r_ball_42.alpha = 1;
			r_ball_43.alpha = 1;
			r_ball_44.alpha = 1;
			r_ball_45.alpha = 1;
			r_ball_46.alpha = 1;
			r_ball_47.alpha = 1;
			Starling.juggler.delayCall(AnimateRetainer08,0.15);
		}
		private function AnimateRetainer08():void{		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Squirt();
			r_ball_48.alpha = 1;
			r_ball_49.alpha = 1;
			r_ball_50.alpha = 1;
			r_ball_51.alpha = 1;
			r_ball_52.alpha = 1;
			r_ball_53.alpha = 1;
			Starling.juggler.delayCall(AnimateRetainer09,0.15);
		}
		private function AnimateRetainer09():void{		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Squirt();
			r_ball_54.alpha = 1;
			r_ball_55.alpha = 1;
			r_ball_56.alpha = 1;
			r_ball_57.alpha = 1;
			r_ball_58.alpha = 1;
			r_ball_59.alpha = 1;
			Starling.juggler.delayCall(AnimateRetainer10,0.15);
		}
		private function AnimateRetainer10():void{		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
			r_ball_60.alpha = 1;
			r_ball_61.alpha = 1;
			r_ball_62.alpha = 1;
			r_ball_63.alpha = 1;
			r_ball_64.alpha = 1;
			r_ball_65.alpha = 1;
			Animating = false
			//Starling.juggler.delayCall(AnimateRetainer10,0.3);
		}
		private function RemoveFromCenter():void{
		//	if(CenterCoun
			var FarPos:int;
			if(currentPos == 0){
				FarPos = 5;
			}else if(currentPos == 1){
				FarPos = 6;
			}else if(currentPos == 2){
				FarPos = 7;
			}else if(currentPos == 3){
				FarPos = 8;
			}else if(currentPos == 4){
				FarPos = 9;
			}else if(currentPos == 5){
				FarPos = 0;
			}else if(currentPos == 6){
				FarPos = 1;
			}else if(currentPos == 7){
				FarPos = 2;
			}else if(currentPos == 8){
				FarPos = 3;
			}else if(currentPos == 9){
				FarPos = 4;
			}
			
			
			
			trace("currentPos: "+currentPos);
			trace("FarPos: "+FarPos);
			
			trace("FarPos: "+FarPos);
			var FarC4:int = this[('Arm0'+FarPos+'Count')];
			var cenC4:int = CenterCount;
			trace("cenC4: "+cenC4);
			
			if(FarC4 <11){
				if(cenC4 > 0){
					RandNoiseHandler();
					if(FarC4 < 10){
						this[('arm_0'+FarPos)][('ball_0'+FarC4)].alpha = 1;
					}else{
						this[('arm_0'+FarPos)][('ball_'+FarC4)].alpha = 1;
					}
					FarC4 = FarC4+1;
					this[('Arm0'+FarPos+'Count')] = FarC4;
					cenC4 = cenC4-1;
					if(cenC4 > 9){
						this[('c_ball_'+[cenC4])].alpha = 0;
					}else{
						this[('c_ball_0'+[cenC4])].alpha = 0;
					}
					
					CenterCount = cenC4;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
					}
					SaveArray["CenterCount"] = CenterCount;
					SaveArray["Arm0"+FarPos+"Count"] = FarC4;
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
					
					Solve();
				}
			}
			trace("cenC4: "+cenC4);
		}
		
		private function AddToCenter():void{
			var curC3:int = this[('Arm0'+currentPos+'Count')];
			var cenC3:int = CenterCount;
			
			trace('cenC3: '+cenC3);
			trace('curC3: '+curC3);
			if(cenC3 < 18){
				if(curC3 > 0){
					RandNoiseHandler();
					curC3 = curC3-1;
					if(curC3 == 10){
						this[('arm_0'+currentPos)][('ball_'+curC3)].alpha = 0;
					}else{
						this[('arm_0'+currentPos)][('ball_0'+curC3)].alpha = 0;
					}
					this[('Arm0'+currentPos+'Count')] = curC3;
					
					if(cenC3 < 10){
						//trace("DOG WALK 02");
						this[('c_ball_0'+[cenC3])].alpha = 1;
					}else{
					//	trace("DOG WALK 03");
						this[('c_ball_'+[cenC3])].alpha = 1;
					}
					cenC3 = cenC3+1;
					CenterCount = cenC3;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
					}
					SaveArray["CenterCount"] = CenterCount;
					SaveArray["Arm0"+currentPos+"Count"] = curC3;
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
					
					Solve();
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
				}
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
			}
			trace('cenC3: '+cenC3);
			trace('curC3: '+curC3);
			trace('CenterCount: '+CenterCount);
			trace(this[('Arm0'+currentPos+'Count')] );
			
		}
		
		private function AddToRetainerHandler():void{
			trace("RetainerCount: "+RetainerCount);
			var curC2:int = this[('Arm0'+currentPos+'Count')];
			trace("curC: "+curC2);
			if(curC2 > 0){
				RandNoiseHandler();
				curC2 = curC2-1;
				if(curC2 == 10){
					this[('arm_0'+currentPos)][('ball_'+curC2)].alpha = 0;
				}else{
					this[('arm_0'+currentPos)][('ball_0'+curC2)].alpha = 0;
				}
				
				RetainerCount = RetainerCount+1;
				var tempRetainer:int = (66-(RetainerCount+1));
				//	var tempRetainer:int = RetainerCount+1;
				trace("RetainerCount: "+RetainerCount);
				if(RetainerCount < 10){
					trace("DOG WALK 00");
					
					this[('r_ball_0'+[RetainerCount])].alpha = 1;
			//		indicatorText.text = '0'+tempRetainer;
					
				}else{
					trace("DOG WALK 01");
					
					this[('r_ball_'+[RetainerCount])].alpha = 1;
				//	indicatorText.text = ''+tempRetainer;	
					
				}
				if(tempRetainer < 10){
					indicatorText.text = '0'+tempRetainer;	
				}else{
					indicatorText.text = ''+tempRetainer;
				}
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
			}
			this[('Arm0'+currentPos+'Count')] = curC2;
			trace("curC: "+curC2);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
			}
			SaveArray["RetainerCount"] = RetainerCount;
			SaveArray["Arm0"+currentPos+"Count"] = curC2;
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
			
			
		}
		
		private function AddFromRetainerHandler():void{
			

			var curC:int = this[('Arm0'+currentPos+'Count')];
			trace("curC: "+curC);
			if(curC < 11){
				RandNoiseHandler();
				if(curC == 10){
					this[('arm_0'+currentPos)][('ball_'+curC)].alpha = 1;
				}else{
					this[('arm_0'+currentPos)][('ball_0'+curC)].alpha = 1;
				}
				trace("this[('Arm0'+currentPos+'Count')] : "+this[('Arm0'+currentPos+'Count')]);
				curC = curC+1
			//	this[('Arm0'+currentPos+'Count')] = curC+1;
			//	this[('Arm0'+currentPos+'Count')] = this[('Arm0'+currentPos+'Count')]+1;
				var tempRetainer:int = (66-(RetainerCount));
			//	var tempRetainer: int = RetainerCount+0;
				if(RetainerCount < 10){
					trace("DOG WALK 02");
					
					this[('r_ball_0'+[RetainerCount])].alpha = 0;
			//		indicatorText.text = '0'+tempRetainer;
					//indicatorText.text = '0'+tempRetainer;
				}else{
					trace("DOG WALK 03");
					
					this[('r_ball_'+[RetainerCount])].alpha = 0;
			//		indicatorText.text = ''+tempRetainer;
					//indicatorText.text = ''+tempRetainer;
				}
				if(tempRetainer < 10){
					indicatorText.text = '0'+tempRetainer;	
				}else{
					indicatorText.text = ''+tempRetainer;
				}
				
				RetainerCount = RetainerCount-1;
				this[('Arm0'+currentPos+'Count')] = curC;
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
				}
				SaveArray["RetainerCount"] = RetainerCount;
				SaveArray["Arm0"+currentPos+"Count"] = curC;
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
				
				Solve()
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
			}
			trace("curC: "+curC);
			trace("this[('Arm0'+currentPos+'Count')] : "+this[('Arm0'+currentPos+'Count')])

		}
		
		private function onWheelFrame():void{
			
			if(MousePrevAngle > MouseCurrentAngle){
				if(FlipWheel === true){
					trace("BARK 1");
					if(wheel_mc.currentFrame == 1){
						wheel_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onWheelFrame);
						
						wheel_mc.currentFrame = 0;
						FlipWheel = false;
						Animating = false;
						if(currentPos == 0){
							currentPos = 9;
						}else{
							currentPos = currentPos-1;
						}
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
						}
						SaveArray["currentPos"] = currentPos;
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
						
						
					}else if(wheel_mc.currentFrame == 0){
						wheel_mc.currentFrame = 5;
					}else{
						wheel_mc.currentFrame = wheel_mc.currentFrame-1;
					}
					
					
					armHolder.rotation = armHolder.rotation+deg2rad(6);
				}else{
					trace("BARK 2");
					if(wheel_mc.currentFrame == 5){
						wheel_mc.currentFrame = 0;
						wheel_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onWheelFrame);
						FlipWheel = false;
						Animating = false;
						if(currentPos == 9){
							currentPos = 0;
						}else{
							currentPos = currentPos+1;
						}
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
						}
						SaveArray["currentPos"] = currentPos;
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
						
						
					}else{
						wheel_mc.currentFrame = wheel_mc.currentFrame+1;
					}
					
					armHolder.rotation = armHolder.rotation-deg2rad(6);
				}
				
			}else if(MousePrevAngle < MouseCurrentAngle){
				if(FlipWheel === true){
					trace("BARK 3");
					if(wheel_mc.currentFrame == 5){
						wheel_mc.currentFrame = 0;
						wheel_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onWheelFrame);
						FlipWheel = false;
						Animating = false;
						if(currentPos == 9){
							currentPos = 0;
						}else{
							currentPos = currentPos+1;
						}
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
						}
						SaveArray["currentPos"] = currentPos;
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
						
					}else{
						wheel_mc.currentFrame = wheel_mc.currentFrame+1;
					}
					
					
					armHolder.rotation = armHolder.rotation-deg2rad(6);
				}else{
					trace("BARK 4");
					if(wheel_mc.currentFrame == 1){
						wheel_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onWheelFrame);
						wheel_mc.currentFrame = 0;
						FlipWheel = false;
						Animating = false;
						if(currentPos == 0){
							currentPos = 9;
						}else{
							currentPos = currentPos-1;
						}
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
						}
						SaveArray["currentPos"] = currentPos;
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
						
					}else if(wheel_mc.currentFrame == 0){
						wheel_mc.currentFrame = 5;
					}else{
						wheel_mc.currentFrame = wheel_mc.currentFrame-1;
					}
					
					
					armHolder.rotation = armHolder.rotation+deg2rad(6);
				}
			}
			trace("currentPos: "+currentPos);
	
		}
		
		
		private function RandNoiseHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
			if(RONum2 == 0){
				
				if(RONum == 0){
					RONum = 1;
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
				RONum2 = 1;
			}else if(RONum2 == 1){
				if(RONum == 0){
					RONum = 1;
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
					
				}else if(RONum == 2){
					RONum = 0;
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
				RONum2 = 2;
			}else if(RONum2 == 2){
				if(RONum == 0){
					RONum = 1;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
		//			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
					
				}else if(RONum == 2){
					RONum = 0;
		//			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
				RONum2 = 3;
			}else if(RONum2 == 3){
				if(RONum == 0){
					RONum = 1;
		//			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
		//			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
		//			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
				RONum2 = 4;
			}else if(RONum2 == 4){
				if(RONum == 0){
					RONum = 1;
		//			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
				RONum2 = 5;
			}else if(RONum2 == 5){
				if(RONum == 0){
					RONum = 1;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
//					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
				RONum2 = 6;
			}else if(RONum2 == 6){
				if(RONum == 0){
					RONum = 1;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
				RONum2 = 7;
			}else if(RONum2 == 7){
				if(RONum == 0){
					RONum = 1;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
				RONum2 = 8;
			}else if(RONum2 == 8){
				if(RONum == 0){
					RONum = 1;
					
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
				RONum2 = 9;
			}else if(RONum2 == 9){
				if(RONum == 0){
					RONum = 1;
					
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;					
	//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
				RONum2 = 0;
			}
		}
	
		/*
		private var Arm00Arm05Pass:Boolean = false;
		private var Arm01Arm06Pass:Boolean = false;
		private var Arm02Arm07Pass:Boolean = false;
		private var Arm03Arm08Pass:Boolean = false;
		private var Arm04Arm09Pass:Boolean = false;
		*/
		private function CheckNumbs(TurnOn:Boolean = true):void{
			
				var topNum:int = 0;
				if((Arm00Count+CenterCount+Arm05Count) == 18){
					trace("00-center-05 = 18");
					//	topNum = topNum+1;
					if(CheckArm00() === true){
						trace("CheckArm00 true");
						if(CheckArm05() === true){
							trace("CheckArm05 true");
							topNum = topNum+1;
							if(Arm00Arm05Pass === false){
								
								arm_00.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_00.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_00.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_00.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_00.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_00.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_00.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_00.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_00.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_00.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_00.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								
								arm_05.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_05.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_05.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_05.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_05.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_05.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_05.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_05.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_05.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_05.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_05.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								Arm00Arm05Pass = true;
							}	
						}else{
							ResetArm0005();
							Arm00Arm05Pass = false;
						}
					}else{
						ResetArm0005();
						Arm00Arm05Pass = false;
					}
					
				}else{
					if(Arm00Arm05Pass === true){					
						ResetArm0005();
						Arm00Arm05Pass = false;
					}
				}
				if((Arm01Count+CenterCount+Arm06Count) == 18){
				//	topNum = topNum+1;
					trace("01-center-06 = 18");
					if(CheckArm01() === true){
						trace("CheckArm01 true");
						if(CheckArm06() === true){
							trace("CheckArm06 true");
							topNum = topNum+1;
							if(Arm01Arm06Pass === false){
								
								arm_01.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_01.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_01.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_01.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_01.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_01.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_01.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_01.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_01.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_01.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_01.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								
								arm_06.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_06.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_06.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_06.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_06.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_06.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_06.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_06.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_06.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_06.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_06.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								Arm01Arm06Pass = true;
							}
						}else{
							ResetArm0106();
							Arm01Arm06Pass = false;
						}
					}else{
						ResetArm0106();
						Arm01Arm06Pass = false;
					}
				}else if(Arm01Arm06Pass === true){					
							ResetArm0106();
							Arm01Arm06Pass = false;
						
					
				}
				if((Arm02Count+CenterCount+Arm07Count) == 18){
				//	topNum = topNum+1;
					trace("02-center-07 = 18");
					if(CheckArm02() === true){
						trace("CheckArm02 true");
						if(CheckArm07() === true){
							trace("CheckArm07 true");
							topNum = topNum+1;
							if(Arm02Arm07Pass === false){					
								arm_02.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_02.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_02.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_02.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_02.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_02.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_02.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_02.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_02.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_02.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_02.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								
								arm_07.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_07.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_07.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_07.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_07.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_07.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_07.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_07.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_07.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_07.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_07.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								Arm02Arm07Pass = true;
							}
						}else{
							ResetArm0207();
							Arm02Arm07Pass = false;		
						}
					}else{
						ResetArm0207();
						Arm02Arm07Pass = false;		
					}
				}else if(Arm02Arm07Pass === true){					
							ResetArm0207();
							Arm02Arm07Pass = false;				
				}
				if((Arm03Count+CenterCount+Arm08Count) == 18){
					//topNum = topNum+1;
					trace("03-center-08 = 18");
					if(CheckArm03() === true){
						trace("CheckArm03 true");
						if(CheckArm08() === true){
							trace("CheckArm08 true");
							topNum = topNum+1;
							if(Arm03Arm08Pass === false){					
								arm_03.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_03.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_03.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_03.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_03.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_03.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_03.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_03.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_03.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_03.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_03.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								
								arm_08.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_08.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_08.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_08.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_08.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_08.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_08.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_08.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_08.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_08.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_08.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								Arm03Arm08Pass = true;
							}
						}else{
							ResetArm0308();
							Arm03Arm08Pass = false;
						}
					}else{
						ResetArm0308();
						Arm03Arm08Pass = false;
					}
				}else if(Arm03Arm08Pass === true){					
							ResetArm0308();
							Arm03Arm08Pass = false;
						
					
				}
				if((Arm04Count+CenterCount+Arm09Count) == 18){
					trace("03-center-08 = 18");
					if(CheckArm04() === true){
						trace("CheckArm04");
						if(CheckArm09() === true){
							trace("CheckArm09");
							topNum = topNum+1;
							if(Arm04Arm09Pass === false){					
								arm_04.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_04.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_04.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_04.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_04.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_04.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_04.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_04.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_04.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_04.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_04.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								
								arm_09.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_09.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_09.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_09.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_09.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_09.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_09.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_09.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_09.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_09.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								arm_09.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
								Arm04Arm09Pass = true;
							}
						}else{
							ResetArm0409();
							Arm04Arm09Pass = false;
						}
					}else{
						ResetArm0409();
						Arm04Arm09Pass = false;
					}
				}else if(Arm04Arm09Pass === true){					
							ResetArm0409();
							Arm04Arm09Pass = false;
						
					
				}
				
				if(topNum > 0){
					if(CenterPass === false){
						c_ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_11.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_12.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_13.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_14.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_15.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_16.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						c_ball_17.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball_pink');
						CenterPass = true;
					}
				}else{
					if(CenterPass === true){
						c_ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_11.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_12.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_13.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_14.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_15.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_16.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						c_ball_17.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
						CenterPass = false;
					}
				}
				
				if(TurnOn === true){
					indicatorText.text = '0'+topNum;
					indicatorText2.text = '05';
				}else{
					if(indicatorText2.text != '66'){
						indicatorText2.text = '66';
					}
				}
		}
		
		private function ResetArm0005():void{
			arm_00.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_00.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_00.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_00.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_00.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_00.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_00.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_00.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_00.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_00.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_00.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			
			arm_05.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_05.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_05.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_05.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_05.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_05.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_05.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_05.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_05.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_05.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_05.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
		}
		
		private function ResetArm0106():void{
			arm_01.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_01.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_01.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_01.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_01.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_01.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_01.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_01.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_01.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_01.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_01.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			
			arm_06.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_06.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_06.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_06.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_06.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_06.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_06.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_06.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_06.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_06.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_06.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
		}
		private function ResetArm0207():void{
			arm_02.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_02.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_02.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_02.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_02.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_02.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_02.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_02.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_02.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_02.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_02.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			
			arm_07.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_07.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_07.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_07.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_07.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_07.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_07.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_07.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_07.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_07.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_07.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
		}
		private function ResetArm0308():void{
			arm_03.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_03.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_03.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_03.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_03.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_03.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_03.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_03.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_03.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_03.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_03.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			
			arm_08.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_08.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_08.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_08.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_08.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_08.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_08.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_08.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_08.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_08.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_08.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
		}
		private function ResetArm0409():void{
			arm_04.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_04.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_04.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_04.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_04.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_04.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_04.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_04.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_04.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_04.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_04.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			
			arm_09.ball_00.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_09.ball_01.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_09.ball_02.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_09.ball_03.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_09.ball_04.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_09.ball_05.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_09.ball_06.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_09.ball_07.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_09.ball_08.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_09.ball_09.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			arm_09.ball_10.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('ball');
			
		}
		
		private function Solve():void{
			trace("SOLVING");
			if(CenterCount == 6){
				trace(":0");
				if((Arm00Count+Arm05Count) == 12){				
					trace(":1");
					if((Arm01Count+Arm06Count) == 12){				
						trace(":2");
						if((Arm02Count+Arm07Count) == 12){					
							trace(":3");
							if((Arm03Count+Arm08Count) == 12){
								trace(":4");
								if((Arm04Count+Arm09Count) == 12){
									trace(":5");
									if(CheckArm00() === true){
										trace(":6");
										if(CheckArm01() === true){
											trace(":7");
											if(CheckArm02() === true){
												trace(":8");
												if(CheckArm03() === true){
													trace(":9");
													if(CheckArm04() === true){
														trace(":10");
														if(CheckArm05() === true){
															trace(":11");
															if(CheckArm06() === true){
																trace(":12");
																if(CheckArm07() === true){
																	trace(":13");
																	if(CheckArm08() === true){
																		trace(":14");
																		if(CheckArm09() === true){
																			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();	
																			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();	
																			
																			Animating = true;
																			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
																				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;
																			}
																			SaveArray["Solved"] = 'Yes';
																			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
																			
																			
																			Starling.juggler.delayCall(function():void{
																				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerPulse();	
																				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MachineTwo();	
																				RunSolve();
																				//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();	
																			},1);
																		}
																	}
																}
															}
														}
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}
			
		}
		
		private function RunSolve():void{
			Animating = true;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirDecompress();	
			//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerPulse();	
			Anima00Tween = new Tween(arm_00, 0.6, Transitions.LINEAR);
			Anima00Tween.fadeTo(0);
			Anima00Tween.onComplete = function():void{				
				Anima00Tween = null;				
			};
			Anima05Tween  = new Tween(arm_05, 0.6, Transitions.LINEAR);
			Anima05Tween.fadeTo(0);
			Anima05Tween.onComplete = function():void{			
				AnimateOne();
				Anima05Tween = null;	
			};
			
			Starling.juggler.add(Anima00Tween);	
			Starling.juggler.add(Anima05Tween);	

		}
		private function AnimateOne():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirDecompress();	
			Anima01Tween = new Tween(arm_01, 0.6, Transitions.LINEAR);
			Anima01Tween.fadeTo(0);
			Anima01Tween.onComplete = function():void{				
				Anima01Tween = null;				
			};
			
			Anima06Tween = new Tween(arm_06, 0.6, Transitions.LINEAR);
			Anima06Tween.fadeTo(0);
			Anima06Tween.onComplete = function():void{				
				AnimateTwo();
				Anima06Tween = null;				
			};
			
			Starling.juggler.add(Anima01Tween);	
			Starling.juggler.add(Anima06Tween);	
		}
		private function AnimateTwo():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirDecompress();	
			Anima02Tween = new Tween(arm_02, 0.6, Transitions.LINEAR);
			Anima02Tween.fadeTo(0);
			Anima02Tween.onComplete = function():void{				
				Anima02Tween = null;				
			};
			Anima07Tween = new Tween(arm_07, 0.6, Transitions.LINEAR);
			Anima07Tween.fadeTo(0);
			Anima07Tween.onComplete = function():void{				
				AnimateThree();
				Anima07Tween = null;				
			};
			
			CenterTweenOne = new Tween(center_purple, 1.8, Transitions.LINEAR);
			CenterTweenOne.fadeTo(1);
			CenterTweenOne.onComplete = function():void{				
				CenterTweenOneComplete();
				CenterTweenOne = null;				
			};
			
			Starling.juggler.add(Anima02Tween);	
			Starling.juggler.add(Anima07Tween);	
			Starling.juggler.add(CenterTweenOne);	
		}
		private function AnimateThree():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirDecompress();	
			Anima03Tween = new Tween(arm_03, 0.6, Transitions.LINEAR);
			Anima03Tween.fadeTo(0);
			Anima03Tween.onComplete = function():void{				
				Anima03Tween = null;				
			};
			Anima08Tween = new Tween(arm_08, 0.6, Transitions.LINEAR);
			Anima08Tween.fadeTo(0);
			Anima08Tween.onComplete = function():void{				
				AnimateFour();
				Anima08Tween = null;				
			};
			Starling.juggler.add(Anima03Tween);	
			Starling.juggler.add(Anima08Tween);	
		}
		private function AnimateFour():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirDecompress();	
			Anima04Tween = new Tween(arm_04, 0.6, Transitions.LINEAR);
			Anima04Tween.fadeTo(0);
			Anima04Tween.onComplete = function():void{				
				Anima04Tween = null;				
			};
			Anima09Tween = new Tween(arm_09, 0.6, Transitions.LINEAR);
			Anima09Tween.fadeTo(0);
			Anima09Tween.onComplete = function():void{				
				Anima09Tween = null;				
			};
			Starling.juggler.add(Anima04Tween);	
			Starling.juggler.add(Anima09Tween);	
		}
		
		private function CenterTweenOneComplete():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();	
			center_arm.alpha = 0;
			center_hood.texture = (stage.getChildAt(0) as Object).SpinWheelImages.assets.getTexture('center_hood_red');
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
			CenterTweenTwo = new Tween(center_purple, 1.8, Transitions.LINEAR);
			CenterTweenTwo.fadeTo(0);
			CenterTweenTwo.onComplete = function():void{				
				
				CenterTweenTwoComplete();
				CenterTweenTwo = null;				
			};
			
			Starling.juggler.add(CenterTweenTwo);	
			
		}
		private function CenterTweenTwoComplete():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicProcess();	
			Starling.juggler.delayCall(function():void{
				Animating = false;
				FadeOut((GeneticsRoomDesk as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomDeskObj,true
				);
			},1);
		}
				
		private function CheckArm09():Boolean{
			if(Arm09Count != Arm01Count){
				if(Arm09Count != Arm02Count){
					if(Arm09Count != Arm03Count){
						if(Arm09Count != Arm04Count){
							if(Arm09Count != Arm05Count){
								if(Arm09Count != Arm06Count){
									if(Arm09Count != Arm07Count){
										if(Arm09Count != Arm08Count){
											if(Arm00Count != Arm09Count){
												return true;
											}else{
												return false;
											}
										}else{
											return false;
										}
									}else{
										return false;
									}
								}else{
									return false;
								}
							}else{
								return false;
							}
						}else{
							return false;
						}
					}else{
						return false;
					}
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
		
		private function CheckArm08():Boolean{
			if(Arm08Count != Arm01Count){
				if(Arm08Count != Arm02Count){
					if(Arm08Count != Arm03Count){
						if(Arm08Count != Arm04Count){
							if(Arm08Count != Arm05Count){
								if(Arm08Count != Arm06Count){
									if(Arm08Count != Arm07Count){
										if(Arm00Count != Arm08Count){
											if(Arm08Count != Arm09Count){
												return true;
											}else{
												return false;
											}
										}else{
											return false;
										}
									}else{
										return false;
									}
								}else{
									return false;
								}
							}else{
								return false;
							}
						}else{
							return false;
						}
					}else{
						return false;
					}
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
		
		private function CheckArm07():Boolean{
			if(Arm07Count != Arm01Count){
				if(Arm07Count != Arm02Count){
					if(Arm07Count != Arm03Count){
						if(Arm07Count != Arm04Count){
							if(Arm07Count != Arm05Count){
								if(Arm07Count != Arm06Count){
									if(Arm00Count != Arm07Count){
										if(Arm07Count != Arm08Count){
											if(Arm07Count != Arm09Count){
												return true;
											}else{
												return false;
											}
										}else{
											return false;
										}
									}else{
										return false;
									}
								}else{
									return false;
								}
							}else{
								return false;
							}
						}else{
							return false;
						}
					}else{
						return false;
					}
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
		
		private function CheckArm06():Boolean{
			if(Arm06Count != Arm01Count){
				if(Arm06Count != Arm02Count){
					if(Arm06Count != Arm03Count){
						if(Arm06Count != Arm04Count){
							if(Arm06Count != Arm05Count){
								if(Arm00Count != Arm06Count){
									if(Arm06Count != Arm07Count){
										if(Arm06Count != Arm08Count){
											if(Arm06Count != Arm09Count){
												return true;
											}else{
												return false;
											}
										}else{
											return false;
										}
									}else{
										return false;
									}
								}else{
									return false;
								}
							}else{
								return false;
							}
						}else{
							return false;
						}
					}else{
						return false;
					}
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
		private function CheckArm05():Boolean{
			if(Arm05Count != Arm01Count){
				if(Arm05Count != Arm02Count){
					if(Arm05Count != Arm03Count){
						if(Arm05Count != Arm04Count){
							if(Arm00Count != Arm05Count){
								if(Arm05Count != Arm06Count){
									if(Arm05Count != Arm07Count){
										if(Arm05Count != Arm08Count){
											if(Arm05Count != Arm09Count){
												return true;
											}else{
												return false;
											}
										}else{
											return false;
										}
									}else{
										return false;
									}
								}else{
									return false;
								}
							}else{
								return false;
							}
						}else{
							return false;
						}
					}else{
						return false;
					}
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
		
		private function CheckArm04():Boolean{
			if(Arm04Count != Arm01Count){
				if(Arm04Count != Arm02Count){
					if(Arm04Count != Arm03Count){
						if(Arm00Count != Arm04Count){
							if(Arm04Count != Arm05Count){
								if(Arm04Count != Arm06Count){
									if(Arm04Count != Arm07Count){
										if(Arm04Count != Arm08Count){
											if(Arm04Count != Arm09Count){
												return true;
											}else{
												return false;
											}
										}else{
											return false;
										}
									}else{
										return false;
									}
								}else{
									return false;
								}
							}else{
								return false;
							}
						}else{
							return false;
						}
					}else{
						return false;
					}
				}else{
					return false;
				}
			}else{
				return false;
			}
			
		}
		
		
		private function CheckArm03():Boolean{
			if(Arm03Count != Arm01Count){
				if(Arm03Count != Arm02Count){
					if(Arm00Count != Arm03Count){
						if(Arm03Count != Arm04Count){
							if(Arm03Count != Arm05Count){
								if(Arm03Count != Arm06Count){
									if(Arm03Count != Arm07Count){
										if(Arm03Count != Arm08Count){
											if(Arm03Count != Arm09Count){
												return true;
											}else{
												return false;
											}
										}else{
											return false;
										}
									}else{
										return false;
									}
								}else{
									return false;
								}
							}else{
								return false;
							}
						}else{
							return false;
						}
					}else{
						return false;
					}
				}else{
					return false;
				}
			}else{
				return false;
			}
			
		}
		
		
		private function CheckArm02():Boolean{
			if(Arm02Count != Arm01Count){
				if(Arm01Count != Arm02Count){
					if(Arm02Count != Arm03Count){
						if(Arm02Count != Arm04Count){
							if(Arm02Count != Arm05Count){
								if(Arm02Count != Arm06Count){
									if(Arm02Count != Arm07Count){
										if(Arm02Count != Arm08Count){
											if(Arm02Count != Arm09Count){
												return true;
											}else{
												return false;
											}
										}else{
											return false;
										}
									}else{
										return false;
									}
								}else{
									return false;
								}
							}else{
								return false;
							}
						}else{
							return false;
						}
					}else{
						return false;
					}
				}else{
					return false;
				}
			}else{
				return false;
			}
			
		}
		
		
		
		private function CheckArm01():Boolean{
			if(Arm01Count != Arm00Count){
				if(Arm01Count != Arm02Count){
					if(Arm01Count != Arm03Count){
						if(Arm01Count != Arm04Count){
							if(Arm01Count != Arm05Count){
								if(Arm01Count != Arm06Count){
									if(Arm01Count != Arm07Count){
										if(Arm01Count != Arm08Count){
											if(Arm01Count != Arm09Count){
												return true;
											}else{
												return false;
											}
										}else{
											return false;
										}
									}else{
										return false;
									}
								}else{
									return false;
								}
							}else{
								return false;
							}
						}else{
							return false;
						}
					}else{
						return false;
					}
				}else{
					return false;
				}
			}else{
				return false;
			}
		}
		
		private function CheckArm00():Boolean{
			if(Arm00Count != Arm01Count){
				if(Arm00Count != Arm02Count){
					if(Arm00Count != Arm03Count){
						if(Arm00Count != Arm04Count){
							if(Arm00Count != Arm05Count){
								if(Arm00Count != Arm06Count){
									if(Arm00Count != Arm07Count){
										if(Arm00Count != Arm08Count){
											if(Arm00Count != Arm09Count){
												return true;
											}else{
												return false;
											}
										}else{
											return false;
										}
									}else{
										return false;
									}
								}else{
									return false;
								}
							}else{
								return false;
							}
						}else{
							return false;
						}
					}else{
						return false;
					}
				}else{
					return false;
				}
			}else{
				return false;
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
			
			
			
			this.assets.removeTexture("spinWheel_bg",true);
	//		this.assets.removeTexture("SpinWheel_Sprite_01",true);
			
	//		this.assets.removeTextureAtlas("SpinWheel_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("spinWheel_01");
	//		(stage.getChildAt(0) as Object).falseAsset("spinWheel_02");
	//		(stage.getChildAt(0) as Object).falseAsset("spinWheel_03");
			
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
import starling.utils.AssetManager;

