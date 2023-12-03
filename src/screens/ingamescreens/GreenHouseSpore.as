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
	
	public class GreenHouseSpore extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
	/*	private var star_00:Image;
		private var star_01:Image;
		private var star_02:Image;
		private var star_03:Image;
		private var star_04:Image;
		private var star_05:Image;
		private var star_06:Image;
		private var star_07:Image;
		private var star_08:Image;
		private var star_09:Image;
	*/	
		private var lightUpStars:Image;
		
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
			
		private var syringe_sprite:Sprite;
		private var syringe:Image;
		private var syringe_glow:Image;
		
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
		
		private var pos_00_color:String = 'black';
		private var pos_01_color:String = 'magenta';
		private var pos_02_color:String = 'red';
		private var pos_03_color:String = 'white';
		private var pos_04_color:String = 'green';
		private var pos_05_color:String = 'white';
		private var pos_06_color:String = 'black';
		private var pos_07_color:String = 'magenta';
		private var pos_08_color:String = 'green';
		private var pos_09_color:String = 'black';
		
		private var GreenTween:Tween;
		private var SyringeTween:Tween;
		
		
		private var SyringeAttached:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function GreenHouseSpore(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('greenHouseSpore_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseSpore/greenHouseSpore_bg.jpg'));
				game.TrackAssets('greenHouseSpore_01');
			}
			if(game.CheckAsset('greenHouseSpore_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseSpore/GreenHouseSpore_Sprite_01.png'));
				game.TrackAssets('greenHouseSpore_02');
			}
			if(game.CheckAsset('greenHouseSpore_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseSpore/GreenHouseSpore_Sprite_01.xml'));
				game.TrackAssets('greenHouseSpore_03');
			}
			if(game.CheckAsset('greenHouseSpore_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseSpore/GreenHouseSpore_Sprite_02.png'));
				game.TrackAssets('greenHouseSpore_04');
			}
			if(game.CheckAsset('greenHouseSpore_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseSpore/GreenHouseSpore_Sprite_02.xml'));
				game.TrackAssets('greenHouseSpore_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GreenHouseSpore","GreenHouseSporeObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('greenHouseSpore_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['Syringe'] == 'Attached'){	
					SyringeAttached = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_00_color'] != undefined){	
					pos_00_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_00_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_01_color'] != undefined){	
					pos_01_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_01_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_02_color'] != undefined){	
					pos_02_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_02_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_03_color'] != undefined){	
					pos_03_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_03_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_04_color'] != undefined){	
					pos_04_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_04_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_05_color'] != undefined){	
					pos_05_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_05_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_06_color'] != undefined){	
					pos_06_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_06_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_07_color'] != undefined){	
					pos_07_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_07_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_08_color'] != undefined){	
					pos_08_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_08_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_09_color'] != undefined){	
					pos_09_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['pos_09_color'];
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseSpore',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadMacLeodTwo(true,3);
							
						},0.5);
					}
				}
			}else{
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					//	SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseSpore',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadMacLeodTwo(true,3);
						
					},0.5);
				}
			}
			
			lightUpStars = new Image(this.assets.getTexture('greens'));
			lightUpStars.touchable = false;
			lightUpStars.x = 0;
			lightUpStars.y = 0;
			
			pos_00 = new Image(this.assets.getTexture('pos_00_'+pos_00_color));
			pos_00.touchable = false;
			pos_00.x = 162;
			pos_00.y = 38;
			
			pos_01 = new Image(this.assets.getTexture('pos_01_'+pos_01_color));
			pos_01.touchable = false;
			pos_01.x = 355;
			pos_01.y = 32;
			
			pos_02 = new Image(this.assets.getTexture('pos_02_'+pos_02_color));
			pos_02.touchable = false;
			pos_02.x = 555;
			pos_02.y = 50;
			
			pos_03 = new Image(this.assets.getTexture('pos_03_'+pos_03_color));
			pos_03.touchable = false;
			pos_03.x = 69;
			pos_03.y = 187;
			
			pos_04 = new Image(this.assets.getTexture('pos_04_'+pos_04_color));
			pos_04.touchable = false;
			pos_04.x = 240;
			pos_04.y = 197;
			
			pos_05 = new Image(this.assets.getTexture('pos_05_'+pos_05_color));
			pos_05.touchable = false;
			pos_05.x = 433;
			pos_05.y = 181;
			
			pos_06 = new Image(this.assets.getTexture('pos_06_'+pos_06_color));
			pos_06.touchable = false;
			pos_06.x = 612;
			pos_06.y = 210;
			
			pos_07 = new Image(this.assets.getTexture('pos_07_'+pos_07_color));
			pos_07.touchable = false;
			pos_07.x = 141;
			pos_07.y = 356;
			
			pos_08 = new Image(this.assets.getTexture('pos_08_'+pos_08_color));
			pos_08.touchable = false;
			pos_08.x = 329;
			pos_08.y = 337;
			
			pos_09 = new Image(this.assets.getTexture('pos_09_'+pos_09_color));
			pos_09.touchable = false;
			pos_09.x = 524;
			pos_09.y = 363;
			
			
			syringe = new Image(this.assets.getTexture('syringebody'));
			syringe.touchable = false;
			syringe.x = 0;
			syringe.y = 0;
			
			syringe_glow = new Image(this.assets.getTexture('syringecover'));
			syringe_glow.touchable = false;
			syringe_glow.x = 0;
			syringe_glow.y = 0;
	
			syringe.alpha = 1;
			syringe_glow.alpha = 1;
	
			syringe_sprite = new Sprite();
			syringe_sprite.touchable = false;
			syringe_sprite.x = 456;
			syringe_sprite.y = 189;
			
			syringe_sprite.alpha = 0;
			
			syringe_sprite.addChildAt(syringe,0);
			syringe_sprite.addChildAt(syringe_glow,1);
			
			lightUpStars.alpha = 0;
			if(SyringeAttached === true){
				pos_00.alpha = 1;
				pos_01.alpha = 1;
				pos_02.alpha = 1;
				pos_03.alpha = 1;
				pos_04.alpha = 1;
				pos_05.alpha = 1;
				pos_06.alpha = 1;
				pos_07.alpha = 1;
				pos_08.alpha = 1;
				pos_09.alpha = 1;
			}else{
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
			}
		
			/*
			private var pos_00:Image;
			private var pos_01:Image;
			private var pos_02:Image;
			private var pos_03:Image;
			private var pos_04:Image;
			private var pos_05:Image;
			private var pos_06:Image;
			private var pos_07:Image;
			private var pos_08:Image;
			
			*/
			
		/*	this.addChildAt(star_00,1);
			this.addChildAt(star_01,2);
			this.addChildAt(star_02,3);
			this.addChildAt(star_03,4);
			this.addChildAt(star_04,5);
			this.addChildAt(star_05,6);
			this.addChildAt(star_06,7);
			this.addChildAt(star_07,8);
			this.addChildAt(star_08,9);
			this.addChildAt(star_09,10);
		*/	
			this.addChildAt(lightUpStars,1);
			this.addChildAt(pos_00,2);
			this.addChildAt(pos_01,3);
			this.addChildAt(pos_02,4);
			this.addChildAt(pos_03,5);
			this.addChildAt(pos_04,6);
			this.addChildAt(pos_05,7);
			this.addChildAt(pos_06,8);
			this.addChildAt(pos_07,9);
			this.addChildAt(pos_08,10);
			this.addChildAt(pos_09,11);
			this.addChildAt(syringe_sprite,12);
			
			CreateSporeHits();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		/*
		private var hit_pos_00:Image;
		private var hit_pos_01:Image;
		private var hit_pos_02:Image;
		private var hit_pos_03:Image;
		private var hit_pos_04:Image;
		private var hit_pos_05:Image;
		private var hit_pos_06:Image;
		private var hit_pos_07:Image;
		private var hit_pos_08:Image;
		private var hit_pos_09:Image;
		*/
		private function CreateSporeHits():void{
			hit_pos_00 = new Shape();
			hit_pos_00.touchable = false;
			hit_pos_00.graphics.beginFill(0xff0000);
			
			hit_pos_00.graphics.lineTo(120,64);	
			hit_pos_00.graphics.lineTo(169,13);	
			hit_pos_00.graphics.lineTo(250,19);	
			hit_pos_00.graphics.lineTo(280,85);	
			hit_pos_00.graphics.lineTo(228,152);	
			hit_pos_00.graphics.lineTo(145,137);	
			
			hit_pos_00.graphics.endFill(false);
			hit_pos_00.alpha = 0.0;
			
			hit_pos_00.graphics.precisionHitTest = true;	
			
			
			hit_pos_01 = new Shape();
			hit_pos_01.touchable = false;
			hit_pos_01.graphics.beginFill(0xff0000);
			
			hit_pos_01.graphics.lineTo(321,72);	
			hit_pos_01.graphics.lineTo(370,3);	
			hit_pos_01.graphics.lineTo(441,12);	
			hit_pos_01.graphics.lineTo(473,65);	
			hit_pos_01.graphics.lineTo(444,132);	
			hit_pos_01.graphics.lineTo(350,133);	
						
			hit_pos_01.graphics.endFill(false);
			hit_pos_01.alpha = 0.0;
			
			hit_pos_01.graphics.precisionHitTest = true;	
			
			
			hit_pos_02 = new Shape();
			hit_pos_02.touchable = false;
			hit_pos_02.graphics.beginFill(0xff0000);
			
			hit_pos_02.graphics.lineTo(531,64);	
			hit_pos_02.graphics.lineTo(612,26);	
			hit_pos_02.graphics.lineTo(670,91);	
			hit_pos_02.graphics.lineTo(625,161);	
			hit_pos_02.graphics.lineTo(545,147);	
			
			hit_pos_02.graphics.endFill(false);
			hit_pos_02.alpha = 0.0;
			
			hit_pos_02.graphics.precisionHitTest = true;	
			
			
			hit_pos_03 = new Shape();
			hit_pos_03.touchable = false;
			hit_pos_03.graphics.beginFill(0xff0000);
			
			hit_pos_03.graphics.lineTo(42,181);	
			hit_pos_03.graphics.lineTo(136,159);	
			hit_pos_03.graphics.lineTo(171,231);	
			hit_pos_03.graphics.lineTo(141,286);	
			hit_pos_03.graphics.lineTo(52,279);	
			
			hit_pos_03.graphics.endFill(false);
			hit_pos_03.alpha = 0.0;
			
			hit_pos_03.graphics.precisionHitTest = true;	
			
			
			hit_pos_04 = new Shape();
			hit_pos_04.touchable = false;
			hit_pos_04.graphics.beginFill(0xff0000);
			
			hit_pos_04.graphics.lineTo(210,226);	
			hit_pos_04.graphics.lineTo(246,173);	
			hit_pos_04.graphics.lineTo(323,171);	
			hit_pos_04.graphics.lineTo(360,241);	
			hit_pos_04.graphics.lineTo(330,306);	
			hit_pos_04.graphics.lineTo(243,304);	
			
			hit_pos_04.graphics.endFill(false);
			hit_pos_04.alpha = 0.0;
			
			hit_pos_04.graphics.precisionHitTest = true;	
			
			
			hit_pos_05 = new Shape();
			hit_pos_05.touchable = false;
			hit_pos_05.graphics.beginFill(0xff0000);
			
			hit_pos_05.graphics.lineTo(399,229);	
			hit_pos_05.graphics.lineTo(453,154);	
			hit_pos_05.graphics.lineTo(530,169);	
			hit_pos_05.graphics.lineTo(553,236);	
			hit_pos_05.graphics.lineTo(510,300);	
			hit_pos_05.graphics.lineTo(436,297);	
			
			hit_pos_05.graphics.endFill(false);
			hit_pos_05.alpha = 0.0;
			
			hit_pos_05.graphics.precisionHitTest = true;	
			
			
			hit_pos_06 = new Shape();
			hit_pos_06.touchable = false;
			hit_pos_06.graphics.beginFill(0xff0000);
			
			hit_pos_06.graphics.lineTo(588,241);	
			hit_pos_06.graphics.lineTo(643,196);	
			hit_pos_06.graphics.lineTo(714,219);	
			hit_pos_06.graphics.lineTo(723,288);	
			hit_pos_06.graphics.lineTo(693,332);	
			hit_pos_06.graphics.lineTo(618,326);	
			
			hit_pos_06.graphics.endFill(false);
			hit_pos_06.alpha = 0.0;
			
			hit_pos_06.graphics.precisionHitTest = true;	
			
			
			hit_pos_07 = new Shape();
			hit_pos_07.touchable = false;
			hit_pos_07.graphics.beginFill(0xff0000);
			
			hit_pos_07.graphics.lineTo(124,400);	
			hit_pos_07.graphics.lineTo(160,332);	
			hit_pos_07.graphics.lineTo(230,334);	
			hit_pos_07.graphics.lineTo(260,402);	
			hit_pos_07.graphics.lineTo(241,447);	
			hit_pos_07.graphics.lineTo(172,464);	
			
			hit_pos_07.graphics.endFill(false);
			hit_pos_07.alpha = 0.0;
			
			hit_pos_07.graphics.precisionHitTest = true;	
			
			
			hit_pos_08 = new Shape();
			hit_pos_08.touchable = false;
			hit_pos_08.graphics.beginFill(0xff0000);
			
			hit_pos_08.graphics.lineTo(309,405);	
			hit_pos_08.graphics.lineTo(345,318);	
			hit_pos_08.graphics.lineTo(429,323);	
			hit_pos_08.graphics.lineTo(457,396);	
			hit_pos_08.graphics.lineTo(433,459);	
			hit_pos_08.graphics.lineTo(355,465);	
			
			hit_pos_08.graphics.endFill(false);
			hit_pos_08.alpha = 0.0;
			
			hit_pos_08.graphics.precisionHitTest = true;	
			
			
			hit_pos_09 = new Shape();
			hit_pos_09.touchable = false;
			hit_pos_09.graphics.beginFill(0xff0000);
			
			hit_pos_09.graphics.lineTo(483,392);	
			hit_pos_09.graphics.lineTo(530,324);	
			hit_pos_09.graphics.lineTo(613,344);	
			hit_pos_09.graphics.lineTo(636,433);	
			hit_pos_09.graphics.lineTo(541,477);	
			
			hit_pos_09.graphics.endFill(false);
			hit_pos_09.alpha = 0.0;
			
			hit_pos_09.graphics.precisionHitTest = true;	
			
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
							FadeOut((GreenHouse as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseObj,true
							);
						}else if(hit_pos_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SyringeAttached === true){
								ColorHandler(0);
							}else{
								SyringeHandler();
							}
						}else if(hit_pos_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SyringeAttached === true){
								ColorHandler(1);
							}else{
								SyringeHandler();
							}
						}else if(hit_pos_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SyringeAttached === true){
								ColorHandler(2);
							}else{
								SyringeHandler();
							}
						}else if(hit_pos_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SyringeAttached === true){
								ColorHandler(3);
							}else{
								SyringeHandler();
							}
						}else if(hit_pos_04.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SyringeAttached === true){
								ColorHandler(4);
							}else{
								SyringeHandler();
							}
						}else if(hit_pos_05.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SyringeAttached === true){
								ColorHandler(5);
							}else{
								SyringeHandler();
							}
						}else if(hit_pos_06.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SyringeAttached === true){
								ColorHandler(6);
							}else{
								SyringeHandler();
							}
						}else if(hit_pos_07.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SyringeAttached === true){
								ColorHandler(7);
							}else{
								SyringeHandler();
							}
						}else if(hit_pos_08.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SyringeAttached === true){
								ColorHandler(8);
							}else{
								SyringeHandler();
							}
						}else if(hit_pos_09.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SyringeAttached === true){
								ColorHandler(9);
							}else{
								SyringeHandler();
							}
						}
										
					}
				}
			}
		}
		
		
		private function RandNoiseHandler(PosNum:int = 0):void{
			if(PosNum == 0){
				
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
			}else if(PosNum == 1){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
			}else if(PosNum == 2){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
					
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
			}else if(PosNum == 3){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
			}else if(PosNum == 4){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
			}else if(PosNum == 5){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
			}else if(PosNum == 6){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
			}else if(PosNum == 7){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
			}else if(PosNum == 8){
				if(RONum == 0){
					RONum = 1;
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
			}else if(PosNum == 9){
				if(RONum == 0){
					RONum = 1;
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
			}
		}
		
		private function SyringeHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_SyringeFull)
			{
				
				Animating = true;
				SyringeAttached = true;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore;	
				}
				SaveArray['Syringe'] = 'Attached';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseSpore',SaveArray);
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_SyringeFull,
						"item_SyringeFull"
					);
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirDecompress();
				syringe_sprite.alpha = 1;				
				SyringeTween = new Tween(syringe_glow, 3, Transitions.EASE_IN);
				SyringeTween.fadeTo(0);
				SyringeTween.onComplete = function():void{
					syringe_sprite.alpha = 0;	
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PipeRingOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					GreenTweenFunc();
					SyringeTween = null;						
					};
				Starling.juggler.add(SyringeTween);	
				
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_CoffeePotFull)
				
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I don't think bio-chemical waste will improve this situation...");
				
			
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
				
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A bizarre organic growth has covered the door.");				
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Under a soft outer layer, it appears to have a rigid structure.");
					
				}else if(RONum == 2){
					RONum = 0;	
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The spores appear to be somewhere between a plant and a mold...");
				}
				
			}
		}
		
		private function GreenTweenFunc():void{
			GreenTween = new Tween(lightUpStars, 2, Transitions.LINEAR);
			GreenTween.fadeTo(1);
			GreenTween.onComplete = function():void{
				TurnOnEyes();
				GreenTween = null;			
				};
			Starling.juggler.add(GreenTween);	
		}
		
		private function TurnOnEyes():void{
			pos_05.alpha = 1;
			
			
			Starling.juggler.delayCall(function():void{
				pos_04.alpha = 1;
				pos_01.alpha = 1;	
			},0.5);
			Starling.juggler.delayCall(function():void{
				pos_03.alpha = 1;
				pos_08.alpha = 1;	
			},1);
			Starling.juggler.delayCall(function():void{
				pos_09.alpha = 1;
				pos_02.alpha = 1;	
			},1.5);
			Starling.juggler.delayCall(function():void{
				pos_06.alpha = 1;
				pos_07.alpha = 1;
				pos_00.alpha = 1;		
				FadeOutGreens();
			},2);
		}
		
		private function FadeOutGreens():void{
			GreenTween = new Tween(lightUpStars, 2, Transitions.LINEAR);
			GreenTween.fadeTo(0);
			GreenTween.onComplete = function():void{
				Animating = false;
				GreenTween = null;
				//TweenStarTwo();				
			};
			Starling.juggler.add(GreenTween);	
		}

		
		private function ColorHandler(pos:int):void{
			RandNoiseHandler(pos);
			
			if(this['pos_0'+pos+'_color'] == 'black'){
				this['pos_0'+pos+'_color'] = 'blue';
				this['pos_0'+pos].texture = this.assets.getTexture('pos_0'+pos+'_blue');
				
			}else if(this['pos_0'+pos+'_color'] == 'blue'){
				this['pos_0'+pos+'_color'] = 'magenta';
				this['pos_0'+pos].texture = this.assets.getTexture('pos_0'+pos+'_magenta');
								
			}else if(this['pos_0'+pos+'_color'] == 'magenta'){
				this['pos_0'+pos+'_color'] = 'red';
				this['pos_0'+pos].texture = this.assets.getTexture('pos_0'+pos+'_red');
			
			}else if(this['pos_0'+pos+'_color'] == 'red'){
				
				this['pos_0'+pos+'_color'] = 'yellow';
				this['pos_0'+pos].texture = this.assets.getTexture('pos_0'+pos+'_yellow');
				
			}else if(this['pos_0'+pos+'_color'] == 'yellow'){
				this['pos_0'+pos+'_color'] = 'cyan';
				this['pos_0'+pos].texture = this.assets.getTexture('pos_0'+pos+'_cyan');			
								
			}else if(this['pos_0'+pos+'_color'] == 'cyan'){
				this['pos_0'+pos+'_color'] = 'green';
				this['pos_0'+pos].texture = this.assets.getTexture('pos_0'+pos+'_green');
				
			}else if(this['pos_0'+pos+'_color'] == 'green'){
				this['pos_0'+pos+'_color'] = 'white';
				this['pos_0'+pos].texture = this.assets.getTexture('pos_0'+pos+'_white');
				
			}else if(this['pos_0'+pos+'_color'] == 'white'){
				this['pos_0'+pos+'_color'] = 'black';
				this['pos_0'+pos].texture = this.assets.getTexture('pos_0'+pos+'_black');
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore;	
			}
			SaveArray['pos_0'+pos+'_color'] = this['pos_0'+pos+'_color'];
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseSpore',SaveArray);
			
			Solve();

		}
		
		private function Solve():void{
			if(pos_00_color == 'black'){
				if(pos_01_color == 'yellow'){
					if(pos_02_color == 'cyan'){
						if(pos_03_color == 'blue'){
							if(pos_04_color == 'red'){
								if(pos_05_color == 'green'){
									if(pos_06_color == 'black'){
										if(pos_07_color == 'magenta'){
											if(pos_08_color == 'white'){
												if(pos_09_color == 'green'){
													trace('SOLVE');
													trace('SOLVE');
													trace('SOLVE');
													Animating = true;
													
													if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore != undefined){	
														SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore;	
													}
													SaveArray['Solved'] = 'Yes';
													(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseSpore',SaveArray);
												
													Starling.juggler.delayCall(function():void{
														(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OhmTwo();
														(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
														//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
														ChangeSolveColors();
													},1.5);
													
													Starling.juggler.delayCall(function():void{
														(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
														(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
														FadeOut((GreenHouse as Class), 
															(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseObj,true
														);
													},3);
												}else{
													trace('FAIL ON 9');
												}
											}else{
												trace('FAIL ON 8');
											}
										}else{
											trace('FAIL ON 7');
										}
									}else{
										trace('FAIL ON 6');
									}
								}else{
									trace('FAIL ON 5');
								}
							}else{
								trace('FAIL ON 4');
							}
						}else{
							trace('FAIL ON 3');
						}
					}else{
						trace('FAIL ON 2');
					}
				}else{
					trace('FAIL ON 1');
				}
			}else{
				trace('FAIL ON 0');
			}
		}
		
		public function ChangeSolveColors():void{
			pos_00.texture = this.assets.getTexture('pos_00_white');
			pos_01.texture = this.assets.getTexture('pos_01_white');
			pos_02.texture = this.assets.getTexture('pos_02_white');
			pos_03.texture = this.assets.getTexture('pos_03_white');
			pos_04.texture = this.assets.getTexture('pos_04_white');
			pos_05.texture = this.assets.getTexture('pos_05_white');
			pos_06.texture = this.assets.getTexture('pos_06_white');
			pos_07.texture = this.assets.getTexture('pos_07_white');
			pos_08.texture = this.assets.getTexture('pos_08_white');
			pos_09.texture = this.assets.getTexture('pos_09_white');
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
			
			
			
			this.assets.removeTexture("greenHouseSpore_bg",true);
			this.assets.removeTexture("GreenHouseSpore_Sprite_01",true);
			this.assets.removeTexture("GreenHouseSpore_Sprite_02",true);
			this.assets.removeTextureAtlas("GreenHouseSpore_Sprite_01",true);
			this.assets.removeTextureAtlas("GreenHouseSpore_Sprite_02",true);
			
			//	this.assets.removeTextureAtlas("Raft_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("greenHouseSpore_01");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseSpore_02");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseSpore_03");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseSpore_04");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseSpore_05");
			
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
