package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.DelayedCall;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;
	
	
	public class RocketRoomComputer extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var highlight_cupid:Image;
		private var highlight_regulus:Image;
		private var highlight_mpp:Image;
		private var highlight_budget:Image;
		
		private var knub_00:Image;
		private var knub_01:Image;
		private var knub_02:Image;
		private var knub_03:Image;
		
		private var picture:Image;
		
		private var mpp_button:Image;	
		
		private var mpp_sprite:Sprite;
		private var mpp_text_00:Image;
		private var mpp_text_01:Image;
		private var mpp_text_02:Image;
		private var mpp_text_03:Image;
		private var mpp_text_04:Image;
		
		private var hit_cupid:Shape;
		private var hit_regulus:Shape;
		private var hit_mpp:Shape;
		private var hit_budget:Shape;
		
		private var hit_control:Shape;
		private var hit_install:Shape;
		private var hit_picture:Shape;
	
		
		private var currentPage:String = 'cupid_00';
		
		private var RONum:int = 0;
		
		private var CubeAttached:Boolean = false
		private var CubeDamageAttached:Boolean = false;
		private var HDAttached:Boolean = false;
		
		private var Animating:Boolean = false;
	//public var delayedCall:DelayedCall;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function RocketRoomComputer(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('rocketRoomComputer_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomComputer/rocketRoomComputer_bg.jpg'));
				game.TrackAssets('rocketRoomComputer_01');
			}
			if(game.CheckAsset('rocketRoomComputer_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomComputer/RocketRoomComputer_Sprite_01.png'));
				game.TrackAssets('rocketRoomComputer_02');
			}
			if(game.CheckAsset('rocketRoomComputer_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomComputer/RocketRoomComputer_Sprite_01.xml'));
				game.TrackAssets('rocketRoomComputer_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RocketRoomComputer","RocketRoomComputerObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('rocketRoomComputer_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			knub_00 = new Image(this.assets.getTexture('knub_00'));
			knub_00.touchable = false;
			knub_00.x = 265;
			knub_00.y = 100;
			
			knub_01 = new Image(this.assets.getTexture('knub_01'));
			knub_01.touchable = false;
			knub_01.x = 264;
			knub_01.y = 176;
			
			knub_02 = new Image(this.assets.getTexture('knub_02'));
			knub_02.touchable = false;
			knub_02.x = 265;
			knub_02.y = 254;
			
			knub_03 = new Image(this.assets.getTexture('knub_03'));
			knub_03.touchable = false;
			knub_03.x = 264;
			knub_03.y = 332;
			
			highlight_cupid = new Image(this.assets.getTexture('highlight_rect'));
			highlight_cupid.touchable = false;	
			highlight_cupid.x = 28;
			highlight_cupid.y = 97;
			
			highlight_regulus = new Image(this.assets.getTexture('highlight_rect'));
			highlight_regulus.touchable = false;
			highlight_regulus.x = 28;
			highlight_regulus.y = 175;
			
			highlight_mpp = new Image(this.assets.getTexture('highlight_rect'));
			highlight_mpp.touchable = false;
			highlight_mpp.x = 28;
			highlight_mpp.y = 254;
			
			highlight_budget = new Image(this.assets.getTexture('highlight_rect'));
			highlight_budget.touchable = false;
			highlight_budget.x = 28;
			highlight_budget.y = 331;
			
			picture = new Image(this.assets.getTexture('page_cupid_00'));
			picture.touchable = false;
			picture.x = 304;
			picture.y = 66;
						
			mpp_button = new Image(this.assets.getTexture('install_highlight'));
			mpp_button.x = 312;
			mpp_button.y = 130;
			mpp_button.touchable = false;
			
			CreateMPPSprite();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer['currentPage'] == 'cupid_00'){
					currentPage = 'cupid_00';
					
					knub_00.alpha = 1;
					knub_01.alpha = 0;
					knub_02.alpha = 0;
					knub_03.alpha = 0;
					
					highlight_cupid.alpha = 1;
					highlight_regulus.alpha = 0;
					highlight_mpp.alpha = 0;
					highlight_budget.alpha = 0;		
					
					mpp_sprite.alpha = 0;
					
					picture.texture = this.assets.getTexture('page_cupid_00');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer['currentPage'] == 'cupid_01'){
					currentPage = 'cupid_01';
				
					knub_00.alpha = 1;
					knub_01.alpha = 0;
					knub_02.alpha = 0;
					knub_03.alpha = 0;
					
					highlight_cupid.alpha = 1;
					highlight_regulus.alpha = 0;
					highlight_mpp.alpha = 0;
					highlight_budget.alpha = 0;		
					
					mpp_sprite.alpha = 0;
					
					picture.texture = this.assets.getTexture('page_cupid_01');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer['currentPage'] == 'regulus_00'){
					currentPage = 'regulus_00';
					
					knub_00.alpha = 0;
					knub_01.alpha = 1;
					knub_02.alpha = 0;
					knub_03.alpha = 0;
					
					highlight_cupid.alpha = 0;
					highlight_regulus.alpha = 1;
					highlight_mpp.alpha = 0;
					highlight_budget.alpha = 0;		
					
					mpp_sprite.alpha = 0;
					
					picture.texture = this.assets.getTexture('page_regulus_00');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer['currentPage'] == 'regulus_01'){
					currentPage = 'regulus_01';
					knub_00.alpha = 0;
					knub_01.alpha = 1;
					knub_02.alpha = 0;
					knub_03.alpha = 0;
					
					highlight_cupid.alpha = 0;
					highlight_regulus.alpha = 1;
					highlight_mpp.alpha = 0;
					highlight_budget.alpha = 0;		
					
					mpp_sprite.alpha = 0;
					
					picture.texture = this.assets.getTexture('page_regulus_01');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer['currentPage'] == 'mpp'){
					currentPage = 'mpp';
					knub_00.alpha = 0;
					knub_01.alpha = 0;
					knub_02.alpha = 1;
					knub_03.alpha = 0;
					
					highlight_cupid.alpha = 0;
					highlight_regulus.alpha = 0;
					highlight_mpp.alpha = 1;
					highlight_budget.alpha = 0;		
					
					mpp_sprite.alpha = 1;
					
					picture.texture = this.assets.getTexture('page_mpp');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer['currentPage'] == 'budget'){
					currentPage = 'budget';
					knub_00.alpha = 0;
					knub_01.alpha = 0;
					knub_02.alpha = 0;
					knub_03.alpha = 1;
					
					highlight_cupid.alpha = 0;
					highlight_regulus.alpha = 0;
					highlight_mpp.alpha = 0;
					highlight_budget.alpha = 1;		
					
					mpp_sprite.alpha = 0;
					
					picture.texture = this.assets.getTexture('page_budget');
				}
				
			}else{				
				highlight_cupid.alpha = 1;
				highlight_regulus.alpha = 0;
				highlight_mpp.alpha = 0;
				highlight_budget.alpha = 0;
				
				knub_00.alpha = 1;
				knub_01.alpha = 0;
				knub_02.alpha = 0;
				knub_03.alpha = 0;				
				picture.alpha = 1;;				
			}
			
			mpp_button.alpha = 0;
		
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['CubeDamage'] == 'Attached'){	
					CubeDamageAttached = true;
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['Cube'] == 'Attached'){	
					CubeAttached = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['HDD'] == 'Attached'){	
					HDAttached = true;
				}
			}

			this.addChildAt(knub_00,1);
			this.addChildAt(knub_01,2);
			this.addChildAt(knub_02,3);
			this.addChildAt(knub_03,4);			
			this.addChildAt(highlight_cupid,5);
			this.addChildAt(highlight_regulus,6);
			this.addChildAt(highlight_mpp,7);
			this.addChildAt(highlight_budget,8);			
			this.addChildAt(picture,9)
			this.addChildAt(mpp_button,10)
			
			CreateControlHit();
			CreatePictureHit();
				
			CreateMPPHit();
			CreateBudgetHit();
			CreateRegulusHit();
			CreateCupidHit();
			CreateInstallHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		
		
		private function CreateMPPSprite():void{
			mpp_sprite = new Sprite();
			mpp_sprite.touchable = false;
			mpp_sprite.x = 310;
			mpp_sprite.y = 67+130;
			mpp_sprite.alpha = 0;
			
			mpp_text_00 = new Image(this.assets.getTexture('line_00_waiting'));
			mpp_text_00.touchable = false;
			mpp_text_00.x = 0;
			mpp_text_00.y = 0;
			
			mpp_text_01 = new Image(this.assets.getTexture('line_01_error'));
			mpp_text_01.touchable = false;
			mpp_text_01.x = 0;
			mpp_text_01.y = 35;
			
			mpp_text_02 = new Image(this.assets.getTexture('line_02_error'));
			mpp_text_02.touchable = false;
			mpp_text_02.x = 0;
			mpp_text_02.y = 68;
			
			mpp_text_03 = new Image(this.assets.getTexture('line_03_installing'));
			mpp_text_03.touchable = false;
			mpp_text_03.x = 0;
			mpp_text_03.y = 100;
			
			mpp_text_04 = new Image(this.assets.getTexture('line_04_success'));
			mpp_text_04.touchable = false;
			mpp_text_04.x = 0;
			mpp_text_04.y = 133;
			
		
			
			mpp_text_00.alpha = 1;
			mpp_text_01.alpha = 0;
			mpp_text_02.alpha = 0;
			mpp_text_03.alpha = 0;
			mpp_text_04.alpha = 0;
			
			
			mpp_sprite.addChildAt(mpp_text_00,0)
			mpp_sprite.addChildAt(mpp_text_01,1)
			mpp_sprite.addChildAt(mpp_text_02,2)
			mpp_sprite.addChildAt(mpp_text_03,3)
			mpp_sprite.addChildAt(mpp_text_04,4)
			
			this.addChild(mpp_sprite);
		}
		
		/*
		hit_install
		private var hit_cupid:Shape;
		private var hit_regulus:Shape;
		private var hit_mpp:Shape;
		private var hit_budget:Shape;
		*/
		private function CreateInstallHit():void{
			hit_install = new Shape();
			hit_install.touchable = false;
			hit_install.graphics.beginFill(0xff0000);
			
			hit_install.graphics.lineTo(323-7,130);	
			hit_install.graphics.lineTo(475-7,130);	
			hit_install.graphics.lineTo(475,187);	
			hit_install.graphics.lineTo(323,187);	
			
			hit_install.graphics.endFill(false);
			hit_install.alpha = 0.0;
			
			hit_install.graphics.precisionHitTest = true;	
			this.addChild(hit_install);
		}
		
		private function CreateControlHit():void{
			hit_control = new Shape();
			hit_control.touchable = false;
			hit_control.graphics.beginFill(0xff0000);
			
			hit_control.graphics.lineTo(578-20,63);	
			hit_control.graphics.lineTo(669,63);	
			hit_control.graphics.lineTo(670,116);	
			hit_control.graphics.lineTo(581-20,112);	
			
			hit_control.graphics.endFill(false);
			hit_control.alpha = 0.0;
			
			hit_control.graphics.precisionHitTest = true;	
			this.addChild(hit_control);
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
		
		private function CreateCupidHit():void{
			hit_cupid = new Shape();
			hit_cupid.touchable = false;
			hit_cupid.graphics.beginFill(0xff0000);
			
			hit_cupid.graphics.lineTo(22,93);	
			hit_cupid.graphics.lineTo(266,92);	
			hit_cupid.graphics.lineTo(268,151);	
			hit_cupid.graphics.lineTo(23,151);	
			
			hit_cupid.graphics.endFill(false);
			hit_cupid.alpha = 0.0;
			
			hit_cupid.graphics.precisionHitTest = true;	
			this.addChild(hit_cupid);
		}
		
		
		
		private function CreateRegulusHit():void{
			hit_regulus = new Shape();
			hit_regulus.touchable = false;
			hit_regulus.graphics.beginFill(0xff0000);
			
			hit_regulus.graphics.lineTo(23,170);	
			hit_regulus.graphics.lineTo(269,169);	
			hit_regulus.graphics.lineTo(266,228);	
			hit_regulus.graphics.lineTo(22,228);	
			
			hit_regulus.graphics.endFill(false);
			hit_regulus.alpha = 0.0;
			
			hit_regulus.graphics.precisionHitTest = true;	
			this.addChild(hit_regulus);
		}
		
		
		/*
		hit_cupid.alpha = 1;
		hit_regulus.alpha = 0;
		hit_mpp.alpha = 0;
		hit_budget.alpha = 0;
		*/
		
		private function CreateMPPHit():void{
			hit_mpp = new Shape();
			hit_mpp.touchable = false;
			hit_mpp.graphics.beginFill(0xff0000);
			
			hit_mpp.graphics.lineTo(21,247);	
			hit_mpp.graphics.lineTo(270,247);	
			hit_mpp.graphics.lineTo(269,308);	
			hit_mpp.graphics.lineTo(21,309);	
			
			
			hit_mpp.graphics.endFill(false);
			hit_mpp.alpha = 0.0;
			
			hit_mpp.graphics.precisionHitTest = true;	
			this.addChild(hit_mpp);
		}

	
		private function CreateBudgetHit():void{
			hit_budget = new Shape();
			hit_budget.touchable = false;
			hit_budget.graphics.beginFill(0xff0000);
			
			hit_budget.graphics.lineTo(21,325);	
			hit_budget.graphics.lineTo(270,325);	
			hit_budget.graphics.lineTo(270,385);	
			hit_budget.graphics.lineTo(21,385);	
							
			hit_budget.graphics.endFill(false);
			hit_budget.alpha = 0.0;
			
			hit_budget.graphics.precisionHitTest = true;	
			this.addChild(hit_budget);
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
							FadeOut((RocketRoomComputerDesk as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomComputerDeskObj,true
							);
						}else if(hit_cupid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'cupid_00'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else if(currentPage == 'cupid_01'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								CupidHandler();
								currentPage = 'cupid_00';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer;
								}
								SaveArray['currentPage'] = 'cupid_00';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputer',SaveArray);
							}
						}else if(hit_regulus.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'regulus_00'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else if(currentPage == 'regulus_01'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								RegulusHandler();
								//	CupidHandler();
								currentPage = 'regulus_00';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer;
								}
								SaveArray['currentPage'] = 'regulus_00';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputer',SaveArray);
							}
						}else if(hit_mpp.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'mpp'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								MPPHandler();
								// RegulusHandler();
								//	CupidHandler();
								currentPage = 'mpp';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer;
								}
								SaveArray['currentPage'] = 'mpp';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputer',SaveArray);
							}
						}else if(hit_budget.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'budget'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								BudgetHandler();
								// MPPHandler();
								// RegulusHandler();
								//	CupidHandler();
								currentPage = 'budget';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer;
								}
								SaveArray['currentPage'] = 'budget';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputer',SaveArray);
							}
						}else if(currentPage === 'cupid_00'){
							if(hit_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){							
								game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('regulas_page_00');
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								picture.texture = this.assets.getTexture('page_cupid_01');
								currentPage = 'cupid_01';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer;
								}
								SaveArray['currentPage'] = 'cupid_01';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputer',SaveArray);
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}else if(currentPage === 'cupid_01'){
							if(hit_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){							
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								picture.texture = this.assets.getTexture('page_cupid_00');
								currentPage = 'cupid_00';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer;
								}
								SaveArray['currentPage'] = 'cupid_00';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputer',SaveArray);
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}else if(currentPage === 'regulus_00'){
							if(hit_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){							
								game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('regulas_page_01');
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								picture.texture = this.assets.getTexture('page_regulus_01');
								currentPage = 'regulus_01';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer;
								}
								SaveArray['currentPage'] = 'regulus_01';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputer',SaveArray);
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}else if(currentPage === 'regulus_01'){
							if(hit_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){		
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								picture.texture = this.assets.getTexture('page_regulus_00');
								currentPage = 'regulus_00';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer;
								}
								SaveArray['currentPage'] = 'regulus_00';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputer',SaveArray);
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}else if(currentPage === 'mpp'){
							if(hit_install.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								RunMPPInstaller();
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}else if(currentPage === 'budget'){
							if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}
					
					}
				}
			}

		}
		
		private function RunMPPInstaller():void{
			mpp_button.alpha = 1;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
			
			mpp_text_00.texture = this.assets.getTexture('line_00_looking');
			mpp_text_00.alpha = 1;
			mpp_text_01.alpha = 0;
			mpp_text_02.alpha = 0;
			mpp_text_03.alpha = 0;
			mpp_text_04.alpha = 0;
			
			Animating = true;
			
			
			Starling.juggler.delayCall(PrintLineOne,1.2);
			
		}
		private function PrintLineOne():void{
			if(HDAttached === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ErrorTwo();
				mpp_text_01.texture = this.assets.getTexture('line_01_error');
				mpp_text_01.alpha = 1;
				Starling.juggler.delayCall(PrintLineTwoCancel,1.2);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
				mpp_text_01.texture = this.assets.getTexture('line_01_detecting');
				mpp_text_01.alpha = 1;
				Starling.juggler.delayCall(PrintLineTwo,1.2);
			}
	
		}
		
		private function PrintLineTwoCancel():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			
			mpp_button.alpha = 0;
			mpp_text_02.texture = this.assets.getTexture('line_02_cancel');
			mpp_text_02.alpha = 1;
			Animating = false
		}
		
		private function PrintLineTwo():void{
			if(CubeAttached === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ErrorTwo();
				mpp_text_02.texture = this.assets.getTexture('line_02_error');
				mpp_text_02.alpha = 1;
				Starling.juggler.delayCall(PrintLineThreeCancel,1.2);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
				mpp_text_02.texture = this.assets.getTexture('line_02_establish');
				mpp_text_02.alpha = 1;
				Starling.juggler.delayCall(PrintLineThree,1.2);
			}
	
		}
		
		private function PrintLineThreeCancel():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			
			mpp_button.alpha = 0;
			mpp_text_03.texture = this.assets.getTexture('line_03_cancel');
			mpp_text_03.alpha = 1;
			Animating = false
		}
		
		private function PrintLineThree():void{
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer;
			}
			SaveArray['WriteSuccess'] = 'Yes';
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputer',SaveArray);
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			mpp_text_03.texture = this.assets.getTexture('line_03_installing');
			mpp_text_03.alpha = 1;
			Starling.juggler.delayCall(PrintLineFour,1.2);
		}
		private function PrintLineFour():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
			mpp_text_04.texture = this.assets.getTexture('line_04_success');
			mpp_text_04.alpha = 1;
			Starling.juggler.delayCall(RunSolve,1.5);

			
			
		}
		private function RunSolve():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Machine();
			FadeOut((RocketRoomComputerDesk as Class), 
				(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomComputerDeskObj,true
			);
		}
		
		private function PictureHandler():void{
			
			if(currentPage == 'cupid_00'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The diagram lists the various parts and pieces of a satellite.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The satellite pictured here I think is the same one as in the corner of the room...");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The diagram indicates that the satellite is a long-range telescope.");
				}
			}else if(currentPage == 'cupid_01'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It appears the satellite focused on a particular star.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Planck-scale Interferometry Detector...?");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The satellite was looking for particular magenetic fields in deep space...'");
				}
			}else if(currentPage == 'regulus_00'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This must be part of the data returned from the satellite.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The 2-dimensional graph has the central area enlarged to greater resolution.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'm not entirely sure what I'm looking at here...");
				}
			}else if(currentPage == 'regulus_01'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("On the screen is a granular piece of data returned from the satellite.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... apparently an artificial intelligence found a pattern of prime numbers?");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I believe the circular forms correspond to the prime numbers listed.");
				}
			}else if(currentPage == 'mpp'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a picture of the device to the left.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think the device is used to put information on an 'ADIMM' unit.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a picture of the device to the left.");
				}
			}else if(currentPage == 'budget'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmmm... Seems like Chimera Corp would like to keep at least a few things secret.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder how they've been spending all the money.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I guess everyone could brush up a bit on their social-engineering.");
				}
			
			}
		}
		
		
		private function BudgetHandler():void{
			knub_00.alpha = 0;
			knub_01.alpha = 0;
			knub_02.alpha = 0;
			knub_03.alpha = 1;
			
			highlight_cupid.alpha = 0;
			highlight_regulus.alpha = 0;
			highlight_mpp.alpha = 0;
			highlight_budget.alpha = 1;		
			
			mpp_sprite.alpha = 0;
			
			picture.texture = this.assets.getTexture('page_budget');
		}
		
		private function MPPHandler():void{
			knub_00.alpha = 0;
			knub_01.alpha = 0;
			knub_02.alpha = 1;
			knub_03.alpha = 0;
			
			highlight_cupid.alpha = 0;
			highlight_regulus.alpha = 0;
			highlight_mpp.alpha = 1;
			highlight_budget.alpha = 0;		
			
			mpp_sprite.alpha = 1;
			
			picture.texture = this.assets.getTexture('page_mpp');
		}
		private function RegulusHandler():void{
			knub_00.alpha = 0;
			knub_01.alpha = 1;
			knub_02.alpha = 0;
			knub_03.alpha = 0;
			
			highlight_cupid.alpha = 0;
			highlight_regulus.alpha = 1;
			highlight_mpp.alpha = 0;
			highlight_budget.alpha = 0;		
			
			mpp_sprite.alpha = 0;
			
			picture.texture = this.assets.getTexture('page_regulus_00');
		}
		private function CupidHandler():void{
			knub_00.alpha = 1;
			knub_01.alpha = 0;
			knub_02.alpha = 0;
			knub_03.alpha = 0;
			
			highlight_cupid.alpha = 1;
			highlight_regulus.alpha = 0;
			highlight_mpp.alpha = 0;
			highlight_budget.alpha = 0;	
			
			mpp_sprite.alpha = 0;
			
			picture.texture = this.assets.getTexture('page_cupid_00');
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
			
			
			
			this.assets.removeTexture("rocketRoomComputer_bg",true);
			this.assets.removeTexture("RocketRoomComputer_Sprite_01",true);
			this.assets.removeTextureAtlas("RocketRoomComputer_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomComputer_01");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomComputer_02");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomComputer_03");
			
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
