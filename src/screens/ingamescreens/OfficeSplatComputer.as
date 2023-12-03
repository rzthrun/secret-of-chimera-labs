package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
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
	
	public class OfficeSplatComputer extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var knub_00:Image;
		private var knub_01:Image;
		private var knub_02:Image;
		
		private var hightlight_splat:Image;
		private var hightlight_motor:Image;
		private var hightlight_togu:Image;
		
		private var picture:Image;
	
		private var motor_sprite:Sprite;
		private var motor_Leg_pr:Image;
		private var motor_Leg_ar:Image;
		private var motor_Leg_pl:Image;
		private var motor_Leg_al:Image;
		private var hit_motor_pr:Shape;
		private var hit_motor_ar:Shape;
		private var hit_motor_pl:Shape;
		private var hit_motor_al:Shape;
		
		private var togu_sprite:Sprite;
		private var togu_button:Image;
		private var togu_text_00:Image;
		private var togu_text_01:Image;
		private var togu_text_02:Image;
		private var togu_text_03:Image;
		private var togu_text_04:Image;
		private var togu_text_05:Image;
		
		private var currentPage:String = 'splat_00';
	
		private var hit_splat:Shape;
		private var hit_motor:Shape;
		private var hit_togutech:Shape;
		private var hit_control:Shape;
		private var hit_picture:Shape;
		private var hit_togu_install:Shape;
		
		private var motorLeg_pr_Color:String = null;
		private var motorLeg_ar_Color:String = null;
		private var motorLeg_pl_Color:String = null;
		private var motorLeg_al_Color:String = null;
		
		private var RONum:int;
		
		private var ControllerAttached:Boolean = false;
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		
		public function OfficeSplatComputer(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('officeSplatComputer_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeSplatComputer/officeSplatComputer_bg.jpg'));
				game.TrackAssets('officeSplatComputer_01');
			}
			if(game.CheckAsset('officeSplatComputer_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeSplatComputer/OfficeSplatComputer_Sprite_01.png'));
				game.TrackAssets('officeSplatComputer_02');
			}
			if(game.CheckAsset('officeSplatComputer_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeSplatComputer/OfficeSplatComputer_Sprite_01.xml'));
				game.TrackAssets('officeSplatComputer_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("OfficeSplatComputer","OfficeSplatComputerObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('officeSplatComputer_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			/*	private var knub_splat:Image;
			private var knub_motor:Image;
			private var knub_togu:Image;
			*/
			knub_00 = new Image(this.assets.getTexture('knub_00'));
			knub_00.x = 268;
			knub_00.y = 157;
			knub_00.touchable = false;
			
			knub_01 = new Image(this.assets.getTexture('knub_01'));
			knub_01.x = 268;
			knub_01.y = 235;
			knub_01.touchable = false;
			
			knub_02 = new Image(this.assets.getTexture('knub_02'));
			knub_02.x = 268;
			knub_02.y = 314;
			knub_02.touchable = false;
			
			hightlight_splat = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_splat.x = 28;
			hightlight_splat.y = 157;
			hightlight_splat.touchable = false;
			
			hightlight_motor = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_motor.x = 28;
			hightlight_motor.y = 235;
			hightlight_motor.touchable = false;
			
			hightlight_togu = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_togu.x = 28;
			hightlight_togu.y = 313;
			hightlight_togu.touchable = false;
			
			picture = new Image(this.assets.getTexture('page_splat_00'));
			picture.x = 314;
			picture.y = 67;
			picture.touchable = false;
			
			togu_button = new Image(this.assets.getTexture('install_highlight'));
			togu_button.x = 314+11;
			togu_button.y = 67+64;
			togu_button.touchable = false;
			/*
			
			private var motorLeg_pr_Color:String = null;
			private var motorLeg_ar_Color:String = null;
			private var motorLeg_pl_Color:String = null;
			private var motorLeg_al_Color:String = null;
			
			*/	
			CreateMotorSprite();
			CreateToguSprite();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeProgrammer['Controller'] == 'Attached'){
					ControllerAttached = true;
				}else{
					
				}
			}else{
				
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['currentPage'] == 'splat_00'){
					motor_sprite.alpha = 0;
					togu_sprite.alpha = 0;
					currentPage = 'splat_00';
					
					knub_00.alpha = 1;
					knub_01.alpha = 0;
					knub_02.alpha = 0;
					
					hightlight_splat.alpha = 1;
					hightlight_motor.alpha = 0;
					hightlight_togu.alpha = 0;
					
					picture.texture = this.assets.getTexture('page_splat_01');
					
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['currentPage'] == 'splat_01'){
					motor_sprite.alpha = 0;
					togu_sprite.alpha = 0;
					currentPage = 'splat_01';
					
					knub_00.alpha = 1;
					knub_01.alpha = 0;
					knub_02.alpha = 0;
					
					hightlight_splat.alpha = 1;
					hightlight_motor.alpha = 0;
					hightlight_togu.alpha = 0;
					
					picture.texture = this.assets.getTexture('page_splat_01');
					
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['currentPage'] == 'motor'){
					motor_sprite.alpha = 1;
					togu_sprite.alpha = 0;
					currentPage = 'motor';
										
					knub_00.alpha = 0;
					knub_01.alpha = 1;
					knub_02.alpha = 0;
					
					hightlight_splat.alpha = 0;
					hightlight_motor.alpha = 1;
					hightlight_togu.alpha = 0;
					
					picture.texture = this.assets.getTexture('page_motorconf');
					
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['currentPage'] == 'togu'){
					motor_sprite.alpha = 0;
					togu_sprite.alpha = 1;
					currentPage = 'togu';
					
					knub_00.alpha = 0;
					knub_01.alpha = 0;
					knub_02.alpha = 1;
					
					hightlight_splat.alpha = 0;
					hightlight_motor.alpha = 0;
					hightlight_togu.alpha = 1;
					
					picture.texture = this.assets.getTexture('page_togu');
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg00Color'] == undefined){
					
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg00Color'] != 'empty'){
					motorLeg_ar_Color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg00Color'];
					motor_Leg_ar.texture = this.assets.getTexture('leg_ar_'+motorLeg_ar_Color);
					motor_Leg_ar.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg01Color'] == undefined){
					
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg01Color'] != 'empty'){
					motorLeg_al_Color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg01Color'];
					motor_Leg_al.texture = this.assets.getTexture('leg_al_'+motorLeg_al_Color);
					motor_Leg_al.alpha = 1;
					
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg02Color'] == undefined){
					
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg02Color'] != 'empty'){
					motorLeg_pr_Color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg02Color'];
					motor_Leg_pr.texture = this.assets.getTexture('leg_pr_'+motorLeg_pr_Color);
					motor_Leg_pr.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg03Color'] == undefined){
					
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg03Color'] != 'empty'){
					motorLeg_pl_Color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg03Color'];
				//	trace((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['splatLeg03Color']);
				//	trace("motorLeg_pl_Color: "+motorLeg_pl_Color);
					motor_Leg_pl.texture = this.assets.getTexture('leg_pl_'+motorLeg_pl_Color);
					motor_Leg_pl.alpha = 1;
				}
			}else{
				knub_00.alpha = 1;
				knub_01.alpha = 0;
				knub_02.alpha = 0;
				
				hightlight_splat.alpha = 1;
				hightlight_motor.alpha = 0;
				hightlight_togu.alpha = 0;
				
				
			}
			togu_button.alpha = 0;
			
			this.addChildAt(knub_00,1);
			this.addChildAt(knub_01,2);
			this.addChildAt(knub_02,3);
			this.addChildAt(hightlight_splat,4);
			this.addChildAt(hightlight_motor,5);
			this.addChildAt(hightlight_togu,6);
	
			this.addChildAt(picture,7);
			this.addChildAt(togu_button,8);
			
			CreateButtonHits();
			CreateControlHit();
			CreatePictureHit();
			CreateToguHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
		}
	
		private function CreateToguSprite():void{
			togu_sprite = new Sprite();
			togu_sprite.touchable = false;
			togu_sprite.x = 314+4;
			togu_sprite.y = 67+130;
			togu_sprite.alpha = 0;
			
			togu_text_00 = new Image(this.assets.getTexture('line_00_waiting'));
			togu_text_00.touchable = false;
			togu_text_00.x = 0;
			togu_text_00.y = 0;
			
			togu_text_01 = new Image(this.assets.getTexture('line_01_reading'));
			togu_text_01.touchable = false;
			togu_text_01.x = 0;
			togu_text_01.y = 35;
			
			togu_text_02 = new Image(this.assets.getTexture('line_02_checking'));
			togu_text_02.touchable = false;
			togu_text_02.x = 0;
			togu_text_02.y = 68;
			
			togu_text_03 = new Image(this.assets.getTexture('line_03_looking'));
			togu_text_03.touchable = false;
			togu_text_03.x = 0;
			togu_text_03.y = 100;
			
			togu_text_04 = new Image(this.assets.getTexture('line_04_writing'));
			togu_text_04.touchable = false;
			togu_text_04.x = 0;
			togu_text_04.y = 133;
			
			togu_text_05 = new Image(this.assets.getTexture('line_05_success'));
			togu_text_05.touchable = false;
			togu_text_05.x = 0;
			togu_text_05.y = 174;
			
			
			togu_text_00.alpha = 1;
			togu_text_01.alpha = 0;
			togu_text_02.alpha = 0;
			togu_text_03.alpha = 0;
			togu_text_04.alpha = 0;
			togu_text_05.alpha = 0;
			
			togu_sprite.addChildAt(togu_text_00,0)
			togu_sprite.addChildAt(togu_text_01,1)
			togu_sprite.addChildAt(togu_text_02,2)
			togu_sprite.addChildAt(togu_text_03,3)
			togu_sprite.addChildAt(togu_text_04,4)
			togu_sprite.addChildAt(togu_text_05,5)
			
			this.addChild(togu_sprite);
		}
		private function CreateMotorSprite():void{
			motor_sprite = new Sprite();
			motor_sprite.touchable = false;
			motor_sprite.x = 314;
			motor_sprite.y = 67;
			motor_sprite.alpha = 0;
		
			motor_Leg_pr = new Image(this.assets.getTexture('leg_pr_blue'));
			motor_Leg_pr.touchable = false;
			motor_Leg_pr.x = 40;
			motor_Leg_pr.y = 35;
			
			motor_Leg_ar = new Image(this.assets.getTexture('leg_ar_blue'));
			motor_Leg_ar.touchable = false;
			motor_Leg_ar.x = 270;
			motor_Leg_ar.y = 35;
			
			motor_Leg_pl = new Image(this.assets.getTexture('leg_pl_blue'));
			motor_Leg_pl.touchable = false;
			motor_Leg_pl.x = 40;
			motor_Leg_pl.y = 267;
			
			motor_Leg_al = new Image(this.assets.getTexture('leg_al_blue'));
			motor_Leg_al.touchable = false;
			motor_Leg_al.x = 271;
			motor_Leg_al.y = 267;
			
			motor_Leg_pr.alpha = 0;
			motor_Leg_ar.alpha = 0;
			motor_Leg_pl.alpha = 0;
			motor_Leg_al.alpha = 0;
			
			motor_sprite.addChildAt(motor_Leg_pr,0);
			motor_sprite.addChildAt(motor_Leg_ar,1);
			motor_sprite.addChildAt(motor_Leg_pl,2);
			motor_sprite.addChildAt(motor_Leg_al,3);
			
			hit_motor_pr = new Shape();
			hit_motor_pr.touchable = false;
			hit_motor_pr.graphics.beginFill(0xff0000);	
			
			hit_motor_pr.graphics.lineTo(325,76);	
			hit_motor_pr.graphics.lineTo(526,76);	
			hit_motor_pr.graphics.lineTo(524,272);	
			hit_motor_pr.graphics.lineTo(325,272);		
			
			hit_motor_pr.graphics.endFill(false);
			hit_motor_pr.alpha = 0.0;			
			hit_motor_pr.graphics.precisionHitTest = true;	
			
			hit_motor_ar = new Shape();
			hit_motor_ar.touchable = false;
			hit_motor_ar.graphics.beginFill(0xff0000);	
			
			hit_motor_ar.graphics.lineTo(528,76);	
			hit_motor_ar.graphics.lineTo(678,76);	
			hit_motor_ar.graphics.lineTo(720,106);					
			hit_motor_ar.graphics.lineTo(720,272);					
			hit_motor_ar.graphics.lineTo(528,272);					
			
			hit_motor_ar.graphics.endFill(false);
			hit_motor_ar.alpha = 0.0;			
			hit_motor_ar.graphics.precisionHitTest = true
			
			hit_motor_pl = new Shape();
			hit_motor_pl.touchable = false;
			hit_motor_pl.graphics.beginFill(0xff0000);	
			
			hit_motor_pl.graphics.lineTo(330,273);	
			hit_motor_pl.graphics.lineTo(525,272);	
			hit_motor_pl.graphics.lineTo(525,465);	
			hit_motor_pl.graphics.lineTo(330,465);	
									
			hit_motor_pl.graphics.endFill(false);
			hit_motor_pl.alpha = 0.0;			
			hit_motor_pl.graphics.precisionHitTest = true
					
			hit_motor_al = new Shape();
			hit_motor_al.touchable = false;
			hit_motor_al.graphics.beginFill(0xff0000);	
			
			hit_motor_al.graphics.lineTo(526,273);	
			hit_motor_al.graphics.lineTo(720,273);	
			hit_motor_al.graphics.lineTo(720,390);	
			hit_motor_al.graphics.lineTo(598,466);	
			hit_motor_al.graphics.lineTo(526,466);	
		
			hit_motor_al.graphics.endFill(false);
			hit_motor_al.alpha = 0.0;			
			hit_motor_al.graphics.precisionHitTest = true
				
		//motor_sprite.addChildAt(hit_motor_00,4);
			
			this.addChild(motor_sprite);
			this.addChild(hit_motor_pr);
			this.addChild(hit_motor_ar);
			this.addChild(hit_motor_pl);
			this.addChild(hit_motor_al);
		}
		
	
		private function CreatePictureHit():void{
			hit_picture = new Shape();
			hit_picture.touchable = false;
			hit_picture.graphics.beginFill(0xff0000);
			
			hit_picture.graphics.lineTo(323,67);	
			hit_picture.graphics.lineTo(654,64);	
			hit_picture.graphics.lineTo(755,127);	
			hit_picture.graphics.lineTo(751,384);	
			hit_picture.graphics.lineTo(591,458);	
			hit_picture.graphics.lineTo(326,456);	
			
			hit_picture.graphics.endFill(false);
			hit_picture.alpha = 0.0;
			
			hit_picture.graphics.precisionHitTest = true;	
			this.addChild(hit_picture);
		}
		
		//hit_togu_install
		
		private function CreateToguHit():void{
			hit_togu_install = new Shape();
			hit_togu_install.touchable = false;
			hit_togu_install.graphics.beginFill(0xff0000);
			
			hit_togu_install.graphics.lineTo(323,130);	
			hit_togu_install.graphics.lineTo(475,130);	
			hit_togu_install.graphics.lineTo(475,187);	
			hit_togu_install.graphics.lineTo(323,187);	
			
			hit_togu_install.graphics.endFill(false);
			hit_togu_install.alpha = 0.0;
			
			hit_togu_install.graphics.precisionHitTest = true;	
			this.addChild(hit_togu_install);
		}
		private function CreateControlHit():void{
			hit_control = new Shape();
			hit_control.touchable = false;
			hit_control.graphics.beginFill(0xff0000);
			
			hit_control.graphics.lineTo(578,63);	
			hit_control.graphics.lineTo(669,63);	
			hit_control.graphics.lineTo(670,116);	
			hit_control.graphics.lineTo(581,112);	
			
			hit_control.graphics.endFill(false);
			hit_control.alpha = 0.0;
			
			hit_control.graphics.precisionHitTest = true;	
			this.addChild(hit_control);
		}
		private function CreateButtonHits():void{
			hit_splat = new Shape();
			hit_splat.touchable = false;
			hit_splat.graphics.beginFill(0xff0000);
			
			hit_splat.graphics.lineTo(20,148);	
			hit_splat.graphics.lineTo(271,148);	
			hit_splat.graphics.lineTo(271,211);	
			hit_splat.graphics.lineTo(20,211);	
			
			hit_splat.graphics.endFill(false);
			hit_splat.alpha = 0.0;
			
			hit_splat.graphics.precisionHitTest = true;	
			
			hit_motor = new Shape();
			hit_motor.touchable = false;
			hit_motor.graphics.beginFill(0xff0000);
			
			hit_motor.graphics.lineTo(20,228);	
			hit_motor.graphics.lineTo(271,228);	
			hit_motor.graphics.lineTo(271,290);	
			hit_motor.graphics.lineTo(20,290);	
			
			hit_motor.graphics.endFill(false);
			hit_motor.alpha = 0.0;
			
			hit_motor.graphics.precisionHitTest = true;	
			
			hit_togutech = new Shape();
			hit_togutech.touchable = false;
			hit_togutech.graphics.beginFill(0xff0000);
			
			hit_togutech.graphics.lineTo(20,305);	
			hit_togutech.graphics.lineTo(271,305);	
			hit_togutech.graphics.lineTo(271,368);	
			hit_togutech.graphics.lineTo(20,368);	
			
			hit_togutech.graphics.endFill(false);
			hit_togutech.alpha = 0.0;
			
			hit_togutech.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_splat);
			this.addChild(hit_motor);
			this.addChild(hit_togutech);
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
							FadeOut((OfficeProgrammer as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeProgrammerObj,true
							);
						}else if(hit_splat.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'splat_00'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else if(currentPage == 'splat_01'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();	
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
							//	game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('splat');
								SplatHandler();
								currentPage = 'splat_00';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer;
								}
								SaveArray['currentPage'] = 'splat_00';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeSplatComputer',SaveArray);
							}
						}else if(hit_motor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'motor'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								MotorHandler();
								currentPage = 'motor';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer;
								}
								SaveArray['currentPage'] = 'motor';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeSplatComputer',SaveArray);
							}
						}else if(hit_togutech.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'togu'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								ToguHandler();
								currentPage = 'togu';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer;
								}
								SaveArray['currentPage'] = 'togu';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeSplatComputer',SaveArray);
							}
						}else if(currentPage == 'motor'){
							if(hit_motor_pr.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								MotorLegHandler('pr','02');
							}else if(hit_motor_ar.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								MotorLegHandler('ar','00');
							}else if(hit_motor_pl.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								MotorLegHandler('pl','03');
							}else if(hit_motor_al.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								MotorLegHandler('al','01');
							}
							
						}else if(currentPage == 'splat_00'){
							if(hit_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('splat');
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								picture.texture = this.assets.getTexture('page_splat_01');
								currentPage = 'splat_01';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer;
								}
								SaveArray['currentPage'] = 'splat_01';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeSplatComputer',SaveArray);
								
								game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('splat');
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}else if(currentPage == 'splat_01'){
							if(hit_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								picture.texture = this.assets.getTexture('page_splat_00');
								currentPage = 'splat_00';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer;
								}
								SaveArray['currentPage'] = 'splat_00';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeSplatComputer',SaveArray);
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}else if(currentPage == 'togu'){
							if(hit_togu_install.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								RunToguInstaller();
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}
					}
				}
			}
		}
		private function PictureHandler():void{
			if(currentPage == 'splat_00'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It appears that this robot is designed to go into areas humans can't reach.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The robot is controlled by a small programmable processor and circuit board.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The robot's design is modeled after arachnids.");
				}
			}else if(currentPage == 'splat_01'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The diagram shows details about the spider-bot’s motor-control system.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The diagram says four motors are used to move the 8 legs.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The diagram shows details about the spider-bot’s motor-control system.");
				}
			}
		}
	
		private function RunToguInstaller():void{
			togu_button.alpha = 1;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
			
			togu_text_00.texture = this.assets.getTexture('line_00_compiling');
			togu_text_00.alpha = 1;
			togu_text_01.alpha = 0;
			togu_text_02.alpha = 0;
			togu_text_03.alpha = 0;
			togu_text_04.alpha = 0;
			togu_text_05.alpha = 0;
			
			Animating = true;
			
			
			Starling.juggler.delayCall(PrintLineOne,1.2);
			
		}
		private function PrintLineOne():void{
			trace('Print Line One');
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			
			togu_text_01.alpha = 1;
			Starling.juggler.delayCall(PrintLineTwo,1.2);
		
			
		}
		private function PrintLineTwo():void{
			if(motorLeg_pr_Color == null || motorLeg_pr_Color == 'empty'){
			
				PrintLineTwoError();
			}else{
				if(motorLeg_ar_Color == null || motorLeg_ar_Color == 'empty'){
					PrintLineTwoError();
				}else{
					if(motorLeg_pl_Color == null || motorLeg_pl_Color == 'empty'){
						PrintLineTwoError();
					}else{
						if(motorLeg_al_Color == null || motorLeg_al_Color == 'empty'){
							PrintLineTwoError();
						}else{
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							
							togu_text_02.texture = this.assets.getTexture('line_02_checking');
							togu_text_02.alpha = 1;							
							Starling.juggler.delayCall(PrintLineThree,1.2);
						}
					}
				}
			}

		}
		
		private function PrintLineTwoError():void{
			togu_text_02.texture = this.assets.getTexture('line_02_error');
			togu_text_02.alpha = 1;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ErrorTwo();
			
			Starling.juggler.delayCall(PrintLineThreeCancel,0.5);
		}
		private function PrintLineTwoCancel():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			
			togu_button.alpha = 0;
			togu_text_02.texture = this.assets.getTexture('line_02_canceling');
			togu_text_02.alpha = 1;
			Animating = false
		}
		private function PrintLineThree():void{
			if(motorLeg_pr_Color != motorLeg_ar_Color){
				if(motorLeg_pr_Color != motorLeg_pl_Color){
					if(motorLeg_pr_Color != motorLeg_al_Color){
						if(motorLeg_ar_Color != motorLeg_pl_Color){
							if(motorLeg_ar_Color != motorLeg_al_Color){
								if(motorLeg_pl_Color != motorLeg_al_Color){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
									
									togu_text_03.texture = this.assets.getTexture('line_03_looking');
									togu_text_03.alpha = 1;		
									
									Starling.juggler.delayCall(PrintLineFour,1.2);
								
									
								}else{
									PrintLineThreeError();
								}
							}else{
								PrintLineThreeError();
							}
						}else{
							PrintLineThreeError();
						}
					}else{
						PrintLineThreeError();
					}
				}else{
					PrintLineThreeError();
				}
			}else{
				PrintLineThreeError();
			}
		
		}
		
		private function PrintLineThreeError():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ErrorTwo();
			
			togu_text_03.texture = this.assets.getTexture('line_03_error');
			togu_text_03.alpha = 1;		
		//	Animating = false;
			Starling.juggler.delayCall(PrintLineFourCancel,0.5);
		}
		private function PrintLineThreeCancel():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			
			togu_button.alpha = 0;
			togu_text_03.texture = this.assets.getTexture('line_03_canceling');
			togu_text_03.alpha = 1;		
			Animating = false;
		
		}
		private function PrintLineFour():void{
			if(ControllerAttached === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ErrorTwo();
				
				togu_text_04.texture = this.assets.getTexture('line_04_error');
				togu_text_04.alpha = 1;		
				
				Starling.juggler.delayCall(PrintLineFiveCancel,0.5);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
				
				togu_text_04.texture = this.assets.getTexture('line_04_writing');
				togu_text_04.alpha = 1;	
				Starling.juggler.delayCall(PrintLineFiveSuccess,0.5);
			}
			
		}
		private function PrintLineFourCancel():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			
			togu_button.alpha = 0;
			togu_text_04.texture = this.assets.getTexture('line_04_canceling');
			togu_text_04.alpha = 1;		
			Animating = false;
			
		}
		private function PrintLineFiveCancel():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			
			togu_button.alpha = 0;
			togu_text_05.texture = this.assets.getTexture('line_05_canceling');
			togu_text_05.alpha = 1;	
			Animating = false;
		}
		private function PrintLineFiveSuccess():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer;
			}
			
			SaveArray["SplatProgrammed"] = 'Yes';
			SaveArray['OutColor00'] = motorLeg_ar_Color;
			SaveArray['OutColor01'] = motorLeg_al_Color;
			SaveArray['OutColor02'] = motorLeg_pr_Color;
			SaveArray['OutColor03'] = motorLeg_pl_Color;
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeSplatComputer',SaveArray);
			
			togu_button.alpha = 0;
			togu_text_05.texture = this.assets.getTexture('line_05_success');
			togu_text_05.alpha = 1;	
			Animating = false;
		}
		/*
		private var motorLeg_pr_Color:String = null;
		private var motorLeg_ar_Color:String = null;
		private var motorLeg_pl_Color:String = null;
		private var motorLeg_al_Color:String = null;
		
		*/
		private function MotorLegHandler(leg:String, legNum:String):void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer;
			}
			//motor_LegPR
			if(this[("motorLeg_"+leg+"_Color")] == null){
				
				this[("motor_Leg_"+leg)].texture = this.assets.getTexture('leg_'+leg+'_green');
				this[("motor_Leg_"+leg)].alpha = 1;
				this[("motorLeg_"+leg+"_Color")] = 'green';
				SaveArray["splatLeg"+legNum+"Color"] = 'green';
				
			}else if(this[("motorLeg_"+leg+"_Color")] == 'green'){
				
				
				this[("motor_Leg_"+leg)].texture = this.assets.getTexture('leg_'+leg+'_blue');
				this[("motor_Leg_"+leg)].alpha = 1;
				this[("motorLeg_"+leg+"_Color")] = 'blue';
				SaveArray["splatLeg"+legNum+"Color"] = 'blue';
				
			}else if(this[("motorLeg_"+leg+"_Color")] == 'blue'){
				
				
				this[("motor_Leg_"+leg)].texture = this.assets.getTexture('leg_'+leg+'_red');
				this[("motor_Leg_"+leg)].alpha = 1;
				this[("motorLeg_"+leg+"_Color")] = 'red';
				SaveArray["splatLeg"+legNum+"Color"] = 'red';
				
			}else if(this[("motorLeg_"+leg+"_Color")] == 'red'){
				
				
				this[("motor_Leg_"+leg)].texture = this.assets.getTexture('leg_'+leg+'_yellow');
				this[("motor_Leg_"+leg)].alpha = 1;
				this[("motorLeg_"+leg+"_Color")] = 'yellow';
				SaveArray["splatLeg"+legNum+"Color"] = 'yellow';
				
			}else if(this[("motorLeg_"+leg+"_Color")] == 'yellow'){
				
				this[("motor_Leg_"+leg)].alpha = 0;
				this[("motorLeg_"+leg+"_Color")] = null;
				SaveArray["splatLeg"+legNum+"Color"] = 'empty';
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeSplatComputer',SaveArray);
			
			
		}
		
		private function ToguHandler():void{
			knub_00.alpha = 0;
			knub_01.alpha = 0;
			knub_02.alpha = 1;
			
			hightlight_splat.alpha = 0;
			hightlight_motor.alpha = 0;
			hightlight_togu.alpha = 1;
							
			motor_sprite.alpha = 0;
			togu_sprite.alpha = 1;
			picture.texture = this.assets.getTexture('page_togu');
		}
		
		private function MotorHandler():void{
			knub_00.alpha = 0;
			knub_01.alpha = 1;
			knub_02.alpha = 0;
			
			hightlight_splat.alpha = 0;
			hightlight_motor.alpha = 1;
			hightlight_togu.alpha = 0;			
			
			motor_sprite.alpha = 1;
			togu_sprite.alpha = 0;
			picture.texture = this.assets.getTexture('page_motorconf');
		}
		
		private function SplatHandler():void{
			knub_00.alpha = 1;
			knub_01.alpha = 0;
			knub_02.alpha = 0;
			
			hightlight_splat.alpha = 1;
			hightlight_motor.alpha = 0;
			hightlight_togu.alpha = 0;			
			
			motor_sprite.alpha = 0;
			togu_sprite.alpha = 0;
			picture.texture = this.assets.getTexture('page_splat_00');
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
			
			
			
			this.assets.removeTexture("officeSplatComputer_bg",true);
			this.assets.removeTexture("OfficeSplatComputer_Sprite_01",true);
			this.assets.removeTextureAtlas("OfficeSplatComputer_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("officeSplatComputer_01");
			(stage.getChildAt(0) as Object).falseAsset("officeSplatComputer_02");
			(stage.getChildAt(0) as Object).falseAsset("officeSplatComputer_03");
			
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
