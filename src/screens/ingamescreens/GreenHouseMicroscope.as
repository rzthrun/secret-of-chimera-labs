package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import events.ImageLoadEvent;
	
	import screens.hud.GoBackButton;
	
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
	import starling.utils.AssetManager;
	import starling.utils.deg2rad;
	
	public class GreenHouseMicroscope extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		private var hood:Image;
		
		private var top_cap:Image;
		private var top_cap_wolf:Image;
		private var top_cap_goat:Image;
		private var top_cap_cabbage:Image;
		private var hit_top_wolf:Shape;
		private var hit_top_goat:Shape;
		private var hit_top_cabbage:Shape;
		
		private var top_button_mc:MovieClip;
		private var hit_top_button:Shape;
		
		private var wolfSprite:Sprite;
		private var wolf:Image;
		private var hit_wolf:Shape;
		
		private var goatSprite:Sprite;
		private var goat:Image;
		private var hit_goat:Shape;
		
		private var cabbageSprite:Sprite;
		private var cabbage:Image;
		private var hit_cabbage:Shape;
		
		private var hit_toggle:Shape;
		
		private var walls_mc:MovieClip;
		private var walls_reverse_mc:MovieClip;
		private var hit_walls:Shape;
		private var hit_walls_far:Shape;
		
		private var tcSprite:Sprite;
		private var transport_cell:Image;
		private var hit_transport:Shape;
		
		
		
		private var nucelus:Image;
		
		private var anima_mult:Number = 0.01;
		
		private var ToggleState:Boolean = false;
		private var Animating:Boolean = false;
		private var ActiveAnimal:String = null;
		
		private var wolfOnClose:Boolean = false;
		private var goatOnClose:Boolean = false;
		private var cabbageOnClose:Boolean = false;
		
		private var wolfOnTransporter:Boolean = false;
		private var goatOnTransporter:Boolean = false;
		private var cabbageOnTransporter:Boolean = false;
		
		private var wolfOnFar:Boolean = false;
		private var goatOnFar:Boolean = false;
		private var cabbageOnFar:Boolean = false;
		
		private var tcCount:int = 0;
		
		private var MouseX:Number = 0;
		private var MouseY:Number = 0;
		
		private var GoatAttached:Boolean = false;
		private var CabbageAttached:Boolean = false;
		private var SyringeAttached:Boolean = false;
		
		private var GoatTween:Tween;
		private var WolfTween:Tween;
		private var CabbageTween:Tween;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	

		private var SolvedAlmost:Boolean = false;
		
		public function GreenHouseMicroscope(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('greenHouseMicroscope_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseMicroscope/greenHouseMicroscope_bg.jpg'));
				game.TrackAssets('greenHouseMicroscope_01');
			}
			if(game.CheckAsset('greenHouseMicroscope_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseMicroscope/GreenHouseMicroscope_Sprite_01.png'));
				game.TrackAssets('greenHouseMicroscope_02');
			}
			if(game.CheckAsset('greenHouseMicroscope_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseMicroscope/GreenHouseMicroscope_Sprite_01.xml'));
				game.TrackAssets('greenHouseMicroscope_03');
			}
			if(game.CheckAsset('greenHouseMicroscope_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseMicroscope/GreenHouseMicroscope_Sprite_02.png'));
				game.TrackAssets('greenHouseMicroscope_04');
			}
			if(game.CheckAsset('greenHouseMicroscope_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseMicroscope/GreenHouseMicroscope_Sprite_02.xml'));
				game.TrackAssets('greenHouseMicroscope_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GreenHouseMicroscope","GreenHouseMicroscopeObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseMicroscope',SaveArray);
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['Syringe'] == 'Attached'){
					SyringeAttached = true;
				}
			}
			
			bg = new Image(this.assets.getTexture('greenHouseMicroscope_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			//	CreateElevatorDoorHit();
			walls_mc = new MovieClip(this.assets.getTextures("walls_"),16);
			walls_mc.x = 0;
			walls_mc.y = 0;
			walls_mc.width = 800;
			walls_mc.height = 512;
			walls_mc.touchable = false;
			walls_mc.loop = false; 
			
		//	walls_mc.addFrameAt(12,this.assets.getTexture("walls_00"), null, (1/12));
			
			
			walls_reverse_mc = new MovieClip(this.assets.getTextures("walls_"),16);
			walls_reverse_mc.x = 0;
			walls_reverse_mc.y = 0;
			walls_reverse_mc.width = 800;
			walls_reverse_mc.height = 512;
			walls_reverse_mc.touchable = false;
			walls_reverse_mc.loop = false; 
			walls_reverse_mc.reverse = true;
			
	//		walls_reverse_mc.addFrameAt(0,this.assets.getTexture("walls_00"), null, (1/12));
			
			hood = new Image(this.assets.getTexture('mic_hood'));
			hood.touchable = false;
			hood.x = 0;
			hood.y = 0;
						
			top_cap = new Image(this.assets.getTexture('top_cap'));
			top_cap.touchable = false;
			top_cap.x = 168+6;
			top_cap.y = 0;
			
			/*
			private var top_cap_wolf:Image;
			private var top_cap_goat:Image;
			private var top_cap_cabbage:Image;
			*/
			
			top_cap_wolf = new Image(this.assets.getTexture('top_cap_wolf'));
			top_cap_wolf.touchable = false;
			top_cap_wolf.x = 168+238+6;
			top_cap_wolf.y = 8;
			
			top_cap_cabbage = new Image(this.assets.getTexture('top_cap_cabbage'));
			top_cap_cabbage.touchable = false;
			top_cap_cabbage.x = 168+45+6;
			top_cap_cabbage.y = 8;
			
			top_cap_goat = new Image(this.assets.getTexture('top_cap_goat'));
			top_cap_goat.touchable = false;
			top_cap_goat.x = 168+141+6;
			top_cap_goat.y = 8;
		
			top_button_mc = new MovieClip(this.assets.getTextures("upload_button_0"),2);
			top_button_mc.x = 168+6+320;
			top_button_mc.y = 0;
			top_button_mc.touchable = false;
			top_button_mc.loop = true; 
			top_button_mc.stop();
			/*
			private var top_button_mc:MovieClip;
			private var hit_top_button:Shape;
			*/
			
			nucelus = new Image(this.assets.getTexture('nucelus'));
			nucelus.touchable = false;
			nucelus.pivotX = 78;
			nucelus.pivotY = 78;
			nucelus.x = 398;
			nucelus.y = 426;
						
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['BlueTube'] == 'Attached'){
					CabbageAttached = true;
					top_cap_cabbage.alpha = 1;					
				}else{
					top_cap_cabbage.alpha = 0;
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['RedTube'] == 'Attached'){
					GoatAttached = true;
					top_cap_goat.alpha = 1;
				}else{					
					top_cap_goat.alpha = 0;
				}
				
			}else{
				top_cap_goat.alpha = 0;
				top_cap_cabbage.alpha = 0;
			}
		/*
			
			SaveArray['goatOnClose'] = goatOnClose;
			SaveArray['cabbageOnClose'] = cabbageOnClose;
			
			SaveArray['goatOnTransporter'] = goatOnTransporter;
			SaveArray['cabbageOnTransporter'] = cabbageOnTransporter;
		
			SaveArray['goatOnFar'] = goatOnFar;
			SaveArray['cabbageOnFar'] = cabbageOnFar;
			*/
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['Solved'] === 'Almost'){
					SolvedAlmost = true;
					top_button_mc.alpha = 1;
					top_button_mc.play();
					Starling.juggler.add(top_button_mc);
				}else{
					top_button_mc.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['wolfOnClose'] === true){
					wolfOnClose = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['goatOnClose'] === true){
					goatOnClose = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['cabbageOnClose'] === true){
					cabbageOnClose = true;
				}				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['wolfOnTransporter'] === true){
					wolfOnTransporter = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['goatOnTransporter'] === true){
					goatOnTransporter = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['cabbageOnTransporter'] === true){
					cabbageOnTransporter = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['wolfOnFar'] === true){
					wolfOnFar = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['goatOnFar'] === true){
					goatOnFar = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['cabbageOnFar'] === true){
					cabbageOnFar = true;
				}			
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['ToggleState'] === true){
					ToggleState = true;
				}
				
				
				trace('wolfOnClose: '+wolfOnClose);
				trace('goatOnClose: '+goatOnClose);
				trace('cabbageOnClose: '+cabbageOnClose);
				trace('wolfOnTransporter: '+wolfOnTransporter);
				trace('goatOnTransporter: '+goatOnTransporter);
				trace('cabbageOnTransporter: '+cabbageOnTransporter);
				trace('wolfOnFar: '+wolfOnFar);
				trace('goatOnFar: '+goatOnFar);
				trace('cabbageOnFar: '+cabbageOnFar);
				trace('ToggleState: '+ToggleState);
			}else{
				top_button_mc.alpha = 0;
			}
			hood.alpha = 1;
			walls_mc.alpha = 1;
			walls_reverse_mc.alpha = 0;
			top_cap.alpha = 1;
			top_cap_wolf.alpha = 1;

			
			
			nucelus.alpha = 1;
			
			this.addChildAt(walls_mc,1);
			this.addChildAt(walls_reverse_mc,2);
			CreateTCSprite();
			CreateAnimalSprites();
			this.addChild(nucelus);
			this.addChild(hood);
			this.addChild(top_cap);
			this.addChild(top_cap_wolf);
			this.addChild(top_cap_cabbage);
			this.addChild(top_cap_goat);
			this.addChild(top_button_mc);
			
			
			CreateWallsHit();
			CreateToggleHit();
			CreateTopHits();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			walls_mc.stop();
			walls_reverse_mc.stop();
			Starling.juggler.add(walls_mc);
			Starling.juggler.add(walls_reverse_mc);
			
			this.addEventListener(EnterFrameEvent.ENTER_FRAME,RotateTransportCell);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDrone(true,999);			
			Starling.juggler.delayCall(function():void{
			//	(stage.getChildAt(0) as Object).AmbientObj.LoadSpaceHumPower(true,999);
				
			},0.5);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("HorrorBreath",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SlipperyPlants",0,0.5,'stop');
			
		}
		
		/*
		private var hit_top_wolf:Shape;
		private var hit_top_goat:Shape;
		private var hit_top_cabbage:Shape; 
		
		*/
		
		private function CreateTopHits():void{
			//hit_top_goat
			hit_top_cabbage = new Shape();
			hit_top_cabbage.touchable = false;
			hit_top_cabbage.graphics.beginFill(0xff0000);
			
			hit_top_cabbage.graphics.lineTo(214+6,7);			
			hit_top_cabbage.graphics.lineTo(290+6,7);			
			hit_top_cabbage.graphics.lineTo(290+6,81);			
			hit_top_cabbage.graphics.lineTo(215+6,81);			
			
			hit_top_cabbage.graphics.endFill(false);
			hit_top_cabbage.alpha = 0.0;
			
			hit_top_cabbage.graphics.precisionHitTest = true;	
			
			//hit_top_goat
			hit_top_goat = new Shape();
			hit_top_goat.touchable = false;
			hit_top_goat.graphics.beginFill(0x0000ff);
			
			hit_top_goat.graphics.lineTo(308+6,7);			
			hit_top_goat.graphics.lineTo(390+6,7);			
			hit_top_goat.graphics.lineTo(390+6,81);			
			hit_top_goat.graphics.lineTo(308+6,81);		
			
			hit_top_goat.graphics.endFill(false);
			hit_top_goat.alpha = 0.0;
			
			hit_top_goat.graphics.precisionHitTest = true;	
			
			//hit_top_wolf
			hit_top_wolf = new Shape();
			hit_top_wolf.touchable = false;
			hit_top_wolf.graphics.beginFill(0x00ff00);
			
			hit_top_wolf.graphics.lineTo(406+6,7);			
			hit_top_wolf.graphics.lineTo(483+6,7);			
			hit_top_wolf.graphics.lineTo(483+6,81);			
			hit_top_wolf.graphics.lineTo(406+6,81);								
			
			hit_top_wolf.graphics.endFill(false);
			hit_top_wolf.alpha = 0.0;
			
			hit_top_wolf.graphics.precisionHitTest = true;	
			
			
			hit_top_button = new Shape();
			hit_top_button.touchable = false;
			hit_top_button.graphics.beginFill(0x00ff00);
			
			hit_top_button.graphics.lineTo(501,7);			
			hit_top_button.graphics.lineTo(585,7);			
			hit_top_button.graphics.lineTo(585,81);			
			hit_top_button.graphics.lineTo(501,81);			
			
			hit_top_button.graphics.endFill(false);
			hit_top_button.alpha = 0.0;
			
			hit_top_button.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_top_wolf);
			this.addChild(hit_top_cabbage);
			this.addChild(hit_top_goat);
			this.addChild(hit_top_button);
		}
		
		private function CreateAnimalSprites():void{
			wolfSprite = new Sprite();
			wolfSprite.touchable = false;			
			wolfSprite.pivotX = 66;
			wolfSprite.pivotY = 60;
			wolfSprite.x = 100;
			wolfSprite.y = 139;
			
			wolf = new Image(this.assets.getTexture('wolf'));
			wolf.touchable = false;
			wolf.x = 0;
			wolf.y = 0;
			wolfSprite.addChild(wolf);		
			
			hit_wolf = new Shape();
			hit_wolf.touchable = false;
			hit_wolf.graphics.beginFill(0xff0000);
			
			hit_wolf.graphics.lineTo(0,60);			
			hit_wolf.graphics.lineTo(9,27);			
			hit_wolf.graphics.lineTo(34,0);			
			hit_wolf.graphics.lineTo(81,0);	
			hit_wolf.graphics.lineTo(119,15);
			hit_wolf.graphics.lineTo(131,49);			
			hit_wolf.graphics.lineTo(129,90);			
			hit_wolf.graphics.lineTo(96,118);			
			hit_wolf.graphics.lineTo(48,118);			
			hit_wolf.graphics.lineTo(16,101);			
						
	
			hit_wolf.graphics.endFill(false);
			hit_wolf.alpha = 0.0;
			
			hit_wolf.graphics.precisionHitTest = true;	
			wolfSprite.addChild(hit_wolf);
			
			
			goatSprite = new Sprite();
			goatSprite.touchable = false;	
			goatSprite.pivotX = 38;
			goatSprite.pivotY = 37;
			goatSprite.x = 55;
			goatSprite.y = 223;
			
			goat = new Image(this.assets.getTexture('goat'));
			goat.touchable = false;
			goat.x = 0;
			goat.y = 0;
			goatSprite.addChild(goat);	
			
			hit_goat = new Shape();
			hit_goat.touchable = false;
			hit_goat.graphics.beginFill(0xff0000);
			
			hit_goat.graphics.lineTo(0,37);			
			hit_goat.graphics.lineTo(3,18);			
			hit_goat.graphics.lineTo(17,4);			
			hit_goat.graphics.lineTo(38,0);			
			hit_goat.graphics.lineTo(72,21);			
			hit_goat.graphics.lineTo(76,34);			
			hit_goat.graphics.lineTo(69,57);			
			hit_goat.graphics.lineTo(57,69);			
			hit_goat.graphics.lineTo(39,74);			
			hit_goat.graphics.lineTo(18,69);			
			hit_goat.graphics.lineTo(3,54);			
		
			hit_goat.graphics.endFill(false);
			hit_goat.alpha = 0.0;
			
			hit_goat.graphics.precisionHitTest = true;	
			goatSprite.addChild(hit_goat);
			
			
			cabbageSprite = new Sprite();
			cabbageSprite.touchable = false;	
			cabbageSprite.pivotX = 24;
			cabbageSprite.pivotY = 23;
			cabbageSprite.x = 94;
			cabbageSprite.y = 322;
			
			hit_cabbage = new Shape();
			hit_cabbage.touchable = false;
			hit_cabbage.graphics.beginFill(0xff0000);
			
			hit_cabbage.graphics.lineTo(0,20);			
			hit_cabbage.graphics.lineTo(20,0);			
			hit_cabbage.graphics.lineTo(50,0);			
			hit_cabbage.graphics.lineTo(68,17);			
			hit_cabbage.graphics.lineTo(68,47);			
			hit_cabbage.graphics.lineTo(50,66);			
			hit_cabbage.graphics.lineTo(18,66);			
			hit_cabbage.graphics.lineTo(0,44);			
			
			
			hit_cabbage.graphics.endFill(false);
			hit_cabbage.alpha = 0.0;
			
			hit_cabbage.graphics.precisionHitTest = true;	
			cabbageSprite.addChild(hit_cabbage);
			
			cabbage = new Image(this.assets.getTexture('cabbage'));
			cabbage.touchable = false;
			cabbage.x = 10;
			cabbage.y = 6;
			
			cabbageSprite.addChildAt(cabbage,0);
											
			/*
			SaveArray['wolfOnClose'] = wolfOnTransporter;
			SaveArray[''] = wolfOnTransporter;
			SaveArray['wolfOnFar'] = wolfOnFar;
			*/
			
			if(cabbageOnTransporter === true){
				cabbageSprite.x = 81;
				cabbageSprite.y = 81;
				cabbageSprite.alpha = 1;
				tcSprite.addChildAt(cabbageSprite,1);
			}else if(cabbageOnClose === true){
				cabbageSprite.alpha = 1;
				this.addChildAt(cabbageSprite,4);
			}else if(cabbageOnFar === true){
				cabbageSprite.alpha = 1;
				cabbageSprite.x = 675;	
				cabbageSprite.y = 347;
				this.addChildAt(cabbageSprite,4);
			}else{
				cabbageSprite.alpha = 0;
				this.addChildAt(cabbageSprite,4);
			}
			
			if(goatOnTransporter === true){
				goatSprite.x = 81;
				goatSprite.y = 81;
				goatSprite.alpha = 1;
				tcSprite.addChildAt(goatSprite,1);
			}else if(goatOnClose === true){
				goatSprite.alpha = 1;
				this.addChildAt(goatSprite,4);
			}else if(goatOnFar === true){
				goatSprite.alpha = 1;
				goatSprite.x = 710;	
				goatSprite.y = 238;
				this.addChildAt(goatSprite,4);
			}else{
				goatSprite.alpha = 0;
				this.addChildAt(goatSprite,4);
			}
			
			if(wolfOnTransporter === true){
				wolfSprite.x = 81;
				wolfSprite.y = 81;
				wolfSprite.alpha = 1;
				tcSprite.addChildAt(wolfSprite,1);
			}else if(wolfOnClose === true){
				wolfSprite.alpha = 1;
				this.addChildAt(wolfSprite,4);
			}else if(wolfOnFar === true){
				wolfSprite.alpha = 1;
				wolfSprite.x = 660;	
				wolfSprite.y = 131;
				this.addChildAt(wolfSprite,4);
			}else{
				wolfSprite.alpha = 0;
				this.addChildAt(wolfSprite,4);
			}
	
		}
		
		private function CreateTCSprite():void{
			tcSprite = new Sprite();
			tcSprite.touchable = false;
			tcSprite.width = 162;
			tcSprite.height = 162;
		
			if(ToggleState === false){
				tcSprite.x = 135;
				tcSprite.y = 163;
			}else{
				tcSprite.x = 521;
				tcSprite.y = 164;
			}
			
			
			transport_cell = new Image(this.assets.getTexture('cell'));
			transport_cell.touchable = false;
			transport_cell.pivotX = 81;
			transport_cell.pivotY = 81;
			transport_cell.x = 81;
			transport_cell.y = 81;
			
			transport_cell.alpha = 1;
			
			hit_transport  = new Shape();
			hit_transport.touchable = false;
			hit_transport.graphics.beginFill(0x0000ff);
			
			hit_transport.graphics.lineTo(0,80);			
			hit_transport.graphics.lineTo(9,40);			
			hit_transport.graphics.lineTo(40,10);			
			hit_transport.graphics.lineTo(80,0);	
			hit_transport.graphics.lineTo(120,10);
			hit_transport.graphics.lineTo(151,40);
			hit_transport.graphics.lineTo(162,80);
			hit_transport.graphics.lineTo(151,120);
			hit_transport.graphics.lineTo(120,151);
			hit_transport.graphics.lineTo(80,162);
			hit_transport.graphics.lineTo(40,151);
			hit_transport.graphics.lineTo(9,120);
					
						
			hit_transport.graphics.endFill(false);
			hit_transport.alpha = 0.0;
			
			hit_transport.graphics.precisionHitTest = true;	
						
			tcSprite.alpha = 1;
			tcSprite.addChildAt(transport_cell,0);
			tcSprite.addChild(hit_transport);
			this.addChild(tcSprite);
			
		}
		
		private function RotateTransportCell():void{
			transport_cell.rotation = transport_cell.rotation-deg2rad(0.25);
			wolfSprite.rotation = wolfSprite.rotation-deg2rad(0.125);
			goatSprite.rotation = goatSprite.rotation+deg2rad(0.125);
			cabbageSprite.rotation = cabbageSprite.rotation-deg2rad(0.125);
			nucelus.rotation = nucelus.rotation+deg2rad(0.125);
		//	var currentDate:Date=new Date();
		//	wolfSprite.y=wolfSprite.y+(Math.cos(currentDate.getTime()*0.0001)*0.1);
		}
		
		//hit_walls
		private function CreateWallsHit():void{
			hit_walls = new Shape();
			hit_walls.touchable = false;
			hit_walls.graphics.beginFill(0xff0000);
			
			hit_walls.graphics.lineTo(35,232);	
			hit_walls.graphics.lineTo(58,142);	
			hit_walls.graphics.lineTo(89,77);	
			hit_walls.graphics.lineTo(150,160);	
			hit_walls.graphics.lineTo(283,203);	
			hit_walls.graphics.lineTo(278,288);	
			hit_walls.graphics.lineTo(143,335);	
			hit_walls.graphics.lineTo(77,408);	
			hit_walls.graphics.lineTo(70,426);	
			hit_walls.graphics.lineTo(32,315);	

			
			hit_walls.graphics.endFill(false);
			hit_walls.alpha = 0.0;
			
			hit_walls.graphics.precisionHitTest = true;	
			
		
			hit_walls_far = new Shape();
			hit_walls_far.touchable = false;
			hit_walls_far.graphics.beginFill(0xff0000);
			
			hit_walls_far.graphics.lineTo(541,193);	
			hit_walls_far.graphics.lineTo(616,159);	
			hit_walls_far.graphics.lineTo(677,105);	
			hit_walls_far.graphics.lineTo(724,106);	
			hit_walls_far.graphics.lineTo(768,241);	
			hit_walls_far.graphics.lineTo(745,389);	
			hit_walls_far.graphics.lineTo(678,412);	
			hit_walls_far.graphics.lineTo(629,342);	
			hit_walls_far.graphics.lineTo(535,289);
		
			
			hit_walls_far.graphics.endFill(false);
			hit_walls_far.alpha = 0.0;
			
			hit_walls_far.graphics.precisionHitTest = true;	
			
			this.addChild(hit_walls);
			this.addChild(hit_walls_far);
		}
		
		private function CreateToggleHit():void{
			hit_toggle = new Shape();
			hit_toggle.touchable = false;
			hit_toggle.graphics.beginFill(0xff0000);
			
			hit_toggle.graphics.lineTo(329,437);	
			hit_toggle.graphics.lineTo(338,401);	
			hit_toggle.graphics.lineTo(368,370);	
			hit_toggle.graphics.lineTo(402,362);	
			hit_toggle.graphics.lineTo(443,376);	
			hit_toggle.graphics.lineTo(468,409);	
			hit_toggle.graphics.lineTo(463,460);	
			hit_toggle.graphics.lineTo(431,494);	
			hit_toggle.graphics.lineTo(388,499);	
			hit_toggle.graphics.lineTo(347,472);	
			hit_toggle.graphics.lineTo(334,451);	
			
			hit_toggle.graphics.endFill(false);
			hit_toggle.alpha = 0.0;
			
			hit_toggle.graphics.precisionHitTest = true;	
			this.addChild(hit_toggle);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.BEGAN) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((GreenHouseTable as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseTableObj,false
							);
						//	return;
						}else if(hit_toggle.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
							
							Animating = true;
							ToggleMotion();
						//	return;
						}else if(hit_cabbage.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
					//		if(Solved === false){
								if(cabbageOnClose === true){
									if(ActiveAnimal == null){
										ActiveAnimal = 'cabbage';
									}
								}else if(cabbageOnFar === true){
									if(ActiveAnimal == null){
										ActiveAnimal = 'cabbage';
									}	
								}else if(cabbageOnTransporter === true){
									if(ActiveAnimal == null){
										ActiveAnimal = 'cabbage';
									}
								}	
					//		}
						}else if(hit_goat.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						
							if(goatOnClose === true){
								if(ActiveAnimal == null){
									ActiveAnimal = 'goat';
								}	
							}else if(goatOnFar === true){
								if(ActiveAnimal == null){
									ActiveAnimal = 'goat';
								}	
							}else if(goatOnTransporter === true){
								if(ActiveAnimal == null){
									ActiveAnimal = 'goat';
								}	
							}	
							
						
						}else if(hit_wolf.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(wolfOnClose === true){
								if(ActiveAnimal == null){
									trace("Wolf ACTIVATED");
									ActiveAnimal = 'wolf';
								}
							}else if(wolfOnFar === true){
								if(ActiveAnimal == null){
									trace("Wolf ACTIVATED");
									ActiveAnimal = 'wolf';
								}
							}else if(wolfOnTransporter === true){
								if(ActiveAnimal == null){
									trace("Wolf ACTIVATED");
									ActiveAnimal = 'wolf';
								}
							}		
							
						}else if(hit_top_wolf.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(wolfOnClose === false){
								if(wolfOnFar === false){
									if(wolfOnTransporter === false){
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpThree();
										wolfOnClose = true;
										wolf.texture = this.assets.getTexture('wolf');
										wolfSprite.x = 100;
										wolfSprite.y = 139;
										wolfSprite.alpha = 1;
									}
								}
							}						
						}else if(hit_top_goat.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(GoatAttached === true){
								if(goatOnClose === false){
									if(goatOnFar === false){
										if(goatOnTransporter === false){
											(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpThree();
											goat.texture = this.assets.getTexture('goat');
											goatOnClose = true;
											goatSprite.x = 55;
											goatSprite.y = 223;
											goatSprite.alpha = 1;
										}
									}
								}		
							}
						}else if(hit_top_cabbage.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(CabbageAttached === true){
								if(cabbageOnClose === false){
									if(cabbageOnFar === false){
										if(cabbageOnTransporter === false){
											(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpThree();
											cabbageOnClose = true;
											cabbage.texture = this.assets.getTexture('cabbage');
											cabbageSprite.x = 94;
											cabbageSprite.y = 322;
											cabbageSprite.alpha = 1;
										}
									}
								}		
							}
						
						}else if(hit_top_button.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SolvedAlmost === true){
								if(SyringeAttached === true){
									Solve();

								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The symbol is now flashing... I think it means it's trying to process something.");
								}
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The symbol might indicate replication....");
							}
						}
						
						/*
						private var wolfOnClose:Boolean = false;
						private var goatOnClose:Boolean = false;
						private var cabbageOnClose:Boolean = false;
						*/
					
					}else if(touches[0].phase == TouchPhase.MOVED) {
						if(ActiveAnimal == null){
							
						}else{														
							
							//hit_walls
							if(hit_walls.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(this[ActiveAnimal+'OnFar'] === false){
									MouseX = touches[0].globalX;
									MouseY = touches[0].globalY;
									MoveAnimal();
								}
							}else if(hit_walls_far.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(this[ActiveAnimal+'OnFar'] === true){	
									MouseX = touches[0].globalX;
									MouseY = touches[0].globalY;
									MoveAnimal();
								}
							}
						
						}
					}else if(touches[0].phase == TouchPhase.ENDED) {
						trace("SMURF");
						if(ActiveAnimal == null){
							
							ActiveAnimal = null;
							MouseX = 0;
							MouseY = 0;
						}else{						
							(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("TuneForkHumOne");
							if(hit_transport.graphics.shapeHitTest(this[ActiveAnimal+'Sprite'].x,this[ActiveAnimal+'Sprite'].y) === true){
								if(tcCount < 2){
									AddAminalToTransporter(ActiveAnimal);
								}
								ActiveAnimal = null;
								MouseX = 0;
								MouseY = 0;
							}else if(hit_walls_far.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
							//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thak();
								ActiveAnimal = null;
								MouseX = 0;
								MouseY = 0;	
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
								ActiveAnimal = null;
								MouseX = 0;
								MouseY = 0;
							}	
						}
						if(wolfOnTransporter === true){
							if(goatOnTransporter === true){
								if(cabbageOnTransporter === true){
									tcCount = 3;
								}else{
									tcCount = 2;
								}
							}else{
								if(cabbageOnTransporter === true){
									tcCount = 2;
								}else{
									tcCount = 1;
								}
							}
						}else{
							if(goatOnTransporter === true){
								if(cabbageOnTransporter === true){
									tcCount = 2;
								}else{
									tcCount = 1;
								}
							}else{
								if(cabbageOnTransporter === true){
									tcCount = 1;
								}else{
									tcCount = 0;
								}
							}
						}
						
						if(wolfOnFar === true){
							if(wolfOnTransporter === false){
								if(goatOnTransporter === false){
									if(cabbageOnTransporter === false){
									//	if(SolvedAlmost === false){
											Solve();
									//	}
									}else{
										CancelSolve();
									}
								}else{
									CancelSolve();
								}								
							}else{
								CancelSolve();
							}							
						}else if(goatOnFar === true){
							if(wolfOnTransporter === false){
								if(goatOnTransporter === false){
									if(cabbageOnTransporter === false){
									//	if(SolvedAlmost === false){
											Solve();
									//	}
									}else{
										CancelSolve();
									}
								}else{
									CancelSolve();
								}								
							}else{
								CancelSolve();
							}		
						}else if(cabbageOnFar === true){
							if(wolfOnTransporter === false){
								if(goatOnTransporter === false){
									if(cabbageOnTransporter === false){
									//	if(SolvedAlmost === false){
											Solve();
									//	}
									}else{
										CancelSolve();
									}
								}else{
									CancelSolve();
								}
							}else{
								CancelSolve();
							}		
						}
						trace("HAMMER HEAD");
						SaveBooleans();
					}
				//	
				}
			}
		}
		private function SaveBooleans():void{
			
			trace("tcCount: "+tcCount);
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope;
			}		
			//SaveArray['Solved'] = "Yes";
			SaveArray['wolfOnClose'] = wolfOnClose;
			SaveArray['goatOnClose'] = goatOnClose;
			SaveArray['cabbageOnClose'] = cabbageOnClose;
			SaveArray['wolfOnTransporter'] = wolfOnTransporter;
			SaveArray['goatOnTransporter'] = goatOnTransporter;
			SaveArray['cabbageOnTransporter'] = cabbageOnTransporter;
			SaveArray['wolfOnFar'] = wolfOnFar;
			SaveArray['goatOnFar'] = goatOnFar;
			SaveArray['cabbageOnFar'] = cabbageOnFar;
			SaveArray['ToggleState'] = ToggleState;
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseMicroscope',SaveArray);
			
			
			
			trace('----------------------------');
			trace('wolfOnClose: '+wolfOnClose);
			trace('goatOnClose: '+goatOnClose);
			trace('cabbageOnClose: '+cabbageOnClose);
			trace('wolfOnTransporter: '+wolfOnTransporter);
			trace('goatOnTransporter: '+goatOnTransporter);
			trace('cabbageOnTransporter: '+cabbageOnTransporter);
			trace('wolfOnFar: '+wolfOnFar);
			trace('goatOnFar: '+goatOnFar);
			trace('cabbageOnFar: '+cabbageOnFar);
			trace('ToggleState: '+ToggleState);
			trace('----------------------------');	
		}

		private function AddAminalToTransporter(animalname:String):void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
			//	this[ActiveAnimal+'OnFar'] = false;
				this[animalname+'OnTransporter'] = true;
				this[animalname+'Sprite'].x = 81;
				this[animalname+'Sprite'].y = 81;
				
				tcSprite.addChild(this[animalname+'Sprite']);
			
			/*	if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope;
				}		
				//SaveArray['Solved'] = "Yes";
				SaveArray[animalname+'OnTransporter'] = true;
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseMicroscope',SaveArray);
			*/	
		//	ActiveAnimal = null;
		//	MouseX = 0;
		//	MouseY = 0;
		//	return;
		}
		
		private function MoveAnimal():void{
		//	this[ActiveAnimal+'OnTransporter'] = false;
			
			if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('TuneForkHumOne') === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TuneForkHumOne(999);
			}
			if(this[ActiveAnimal+'OnTransporter'] === true){
				this[ActiveAnimal+'OnTransporter'] = false;
				if(ActiveAnimal == 'wolf'){					
					this.addChildAt(this[ActiveAnimal+'Sprite'],4);
					
				}else if(ActiveAnimal == 'goat'){
					this.addChildAt(this[ActiveAnimal+'Sprite'],5);
		
				}else if(ActiveAnimal == 'cabbage'){
					this.addChildAt(this[ActiveAnimal+'Sprite'],6);
				
				}
			}
			
			this[ActiveAnimal+'Sprite'].x = MouseX;
			this[ActiveAnimal+'Sprite'].y = MouseY;
				
			
		}
		
		
		private function ToggleMotion():void{
			Animating = true;
			if(ToggleState === false){
				if(wolfOnTransporter === true){
					wolfOnFar = true;
					wolfOnClose = false;
				}
				if(goatOnTransporter === true){
					goatOnFar = true;
					goatOnClose = false;
				}
				if(cabbageOnTransporter === true){
					cabbageOnFar = true;
					cabbageOnClose = false;
				}
				
				ToggleState = true;
				walls_mc.alpha = 1;
				walls_reverse_mc.alpha = 0;
				this.addEventListener(EnterFrameEvent.ENTER_FRAME,GoRightFrameHandler);
				walls_mc.play();
			}else{
				if(wolfOnTransporter === true){
					wolfOnFar = false;
					wolfOnClose = true;
				}
				if(goatOnTransporter === true){
					goatOnFar = false;
					goatOnClose = true;
				}
				if(cabbageOnTransporter === true){
					cabbageOnFar = false;
					cabbageOnClose = true;
				}
				
				ToggleState = false;
				walls_mc.alpha = 0;
				walls_reverse_mc.alpha = 1;
				walls_reverse_mc.play();
				this.addEventListener(EnterFrameEvent.ENTER_FRAME,GoLeftFrameHandler);
				
				
			}
			SaveBooleans();
		}
		private function GoLeftFrameHandler():void{
			trace(walls_reverse_mc.currentFrame)
			if(walls_reverse_mc.currentFrame == 12){
				Animating = false;
				this.removeEventListener(EnterFrameEvent.ENTER_FRAME,GoLeftFrameHandler);
				walls_mc.stop();
				walls_reverse_mc.stop();
				walls_mc.alpha = 1;
				walls_reverse_mc.alpha = 0;
				walls_reverse_mc.currentFrame = 0;
				tcSprite.x = 135;
				tcSprite.y = 163;
				
				
			}else if(walls_reverse_mc.currentFrame == 1){								
				tcSprite.x = 492;
				tcSprite.y = 162;
			}else if(walls_reverse_mc.currentFrame == 2){								
				tcSprite.x = 470;
				tcSprite.y = 162;
			}else if(walls_reverse_mc.currentFrame == 3){								
				tcSprite.x = 443;
				tcSprite.y = 162;
			}else if(walls_reverse_mc.currentFrame == 4){							
				tcSprite.x = 404;
				tcSprite.y = 163;
			}else if(walls_reverse_mc.currentFrame == 5){
				tcSprite.x = 362;
				tcSprite.y = 162;			
			}else if(walls_reverse_mc.currentFrame == 6){
				tcSprite.x = 348;
				tcSprite.y = 163;
			}else if(walls_reverse_mc.currentFrame == 7){
				tcSprite.x = 317;
				tcSprite.y = 163;
			}else if(walls_reverse_mc.currentFrame == 8){
				tcSprite.x = 277;
				tcSprite.y = 161;
			}else if(walls_reverse_mc.currentFrame == 9){
				tcSprite.x = 228;
				tcSprite.y = 162;
			}else if(walls_reverse_mc.currentFrame == 10){
				tcSprite.x = 189;
				tcSprite.y = 163;
			}else if(walls_reverse_mc.currentFrame == 11){
				tcSprite.x = 163;
				tcSprite.y = 161;
			}
		}
		private function GoRightFrameHandler():void{
			trace(walls_mc.currentFrame)
			if(walls_mc.currentFrame == 12){
				Animating = false;
				this.removeEventListener(EnterFrameEvent.ENTER_FRAME,GoRightFrameHandler);
				walls_mc.stop();
				walls_reverse_mc.stop();
				walls_mc.alpha = 0;
				walls_reverse_mc.alpha = 1;
				walls_mc.currentFrame = 0;
				tcSprite.x = 521;
				tcSprite.y = 164;
				
				
			}else if(walls_mc.currentFrame == 1){
				tcSprite.x = 163;
				tcSprite.y = 161;
			}else if(walls_mc.currentFrame == 2){
				tcSprite.x = 189;
				tcSprite.y = 163;
			}else if(walls_mc.currentFrame == 3){
				tcSprite.x = 228;
				tcSprite.y = 162;
			}else if(walls_mc.currentFrame == 4){
				tcSprite.x = 277;
				tcSprite.y = 161;
			}else if(walls_mc.currentFrame == 5){
				tcSprite.x = 317;
				tcSprite.y = 163;
			}else if(walls_mc.currentFrame == 6){
				tcSprite.x = 348;
				tcSprite.y = 163;
			}else if(walls_mc.currentFrame == 7){
				tcSprite.x = 362;
				tcSprite.y = 162;
			}else if(walls_mc.currentFrame == 8){
				tcSprite.x = 404;
				tcSprite.y = 163;
			}else if(walls_mc.currentFrame == 9){
				tcSprite.x = 443;
				tcSprite.y = 162;
			}else if(walls_mc.currentFrame == 10){
				tcSprite.x = 470;
				tcSprite.y = 162;
			}else if(walls_mc.currentFrame == 11){
				tcSprite.x = 492;
				tcSprite.y = 162;
			}
			/*
			transport_cell.x = 521+81;
			transport_cell.y = 164+81;
			*/
		}
		
		private function Solve():void{
			if(wolfOnFar === true){
				trace("B:00");
				if(goatOnFar === true){
					trace("B:01");
					if(cabbageOnFar === true){
						trace("B:02");
						if(wolfOnTransporter === false){
							trace("B:03");
							if(goatOnTransporter === false){
								trace("B:04");
								if(cabbageOnTransporter === false){
									trace("B:05");
									trace("SOLVED");
									trace("SOLVED");
									trace("SOLVED");
									
									
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope;
									}	
									
									if(SyringeAttached === true){
										trace("B:06");
										Animating = true;
										
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicProcess();
										SaveArray['Solved'] = "Yes";
										
										
										
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
										Starling.juggler.delayCall(function():void{
											
											//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
											FadeOut((GreenHouseTable as Class), 
												(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseTableObj,true
											);
											Animating = false;
										},2);
									}else{
										trace("B:07");
										SolvedAlmost = true;
										SaveArray['Solved'] = "Almost";
										top_button_mc.alpha = 1;
										top_button_mc.play();
										Starling.juggler.add(top_button_mc);
									}
									
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseMicroscope',SaveArray);
									
								}else{
									trace("B:08");
									CancelSolve();
								}
							}else{
								trace("B:09");
								CancelSolve();
							}
						}else{
							trace("B:10");
							CancelSolve();
						}
						
					}else{
						trace("B:11");
						if(wolfOnTransporter === false){
							trace("B:12");
							if(goatOnTransporter === false){
								trace("B:13");
								wolfOnFar = false;
								goatOnFar = false;
								wolfOnClose = false;
								goatOnClose = false;
								Animating = true;
								WolfTween = new Tween(wolfSprite, 1.5, Transitions.EASE_IN_OUT);
								WolfTween.animate("y",goatSprite.y);
								WolfTween.animate("x",goatSprite.x);
								//	WolfTween.fadeTo(1);
								WolfTween.onComplete = function():void{									
									FadeOutGoat();		
									WolfTween = null;
								};
								Starling.juggler.add(WolfTween);	
							}
							
						}
						CancelSolve();
						
					}
				}else if(cabbageOnFar === true){
					trace("B:14");
					if(cabbageOnTransporter === false){
						
					}	
					SolvedAlmost = false;
					top_button_mc.alpha = 0;
					top_button_mc.stop();
				}else{
					trace("B:15");
					if(wolfOnTransporter === false){
						wolfOnFar = false;
						wolfOnClose = false;
						Animating = true;
						BreakUpWolf();	
					}
					CancelSolve();
				}
			}else if(goatOnFar === true){
				trace("B:16");
				if(cabbageOnFar === true){
					trace("B:17");
					if(goatOnTransporter === false){
						trace("B:18");
						if(cabbageOnTransporter === false){
							trace("B:19");
							cabbageOnFar = false;
							goatOnFar = false;
							cabbageOnClose = false;
							goatOnClose = false;
							Animating = true;
							GoatTween = new Tween(goatSprite, 1.5, Transitions.EASE_IN_OUT);
							GoatTween.animate("y",cabbageSprite.y);
							GoatTween.animate("x",cabbageSprite.x);
							//	WolfTween.fadeTo(1);
							GoatTween.onComplete = function():void{								
								FadeOutCabbage();	
								GoatTween = null;
							};
							Starling.juggler.add(GoatTween);	
						}
					}
					CancelSolve();
				}else{
					trace("B:20");
					if(cabbageOnTransporter === false){
						trace("B:21");
						Animating = true;
						goatOnFar = false;
						goatOnClose = false;
						goat.texture = this.assets.getTexture('goat_broken');
						GoatTween = new Tween(goatSprite, 1.5, Transitions.LINEAR);
						GoatTween.fadeTo(0);
						GoatTween.onComplete = function():void{
							Animating = false;
							GoatTween = null;
							
						};
						Starling.juggler.add(GoatTween);	
					}
				}
				CancelSolve();
			}else if(cabbageOnFar === true){
				trace("B:22");
				if(cabbageOnTransporter === false){
					trace("B:23");
					Animating = true;
					cabbageOnFar = false;
					cabbageOnClose = false;
					cabbage.texture = this.assets.getTexture('cabbage_broken');
					CabbageTween = new Tween(cabbageSprite, 1.5, Transitions.LINEAR);
					CabbageTween.fadeTo(0);
					CabbageTween.onComplete = function():void{
						Animating = false;
						CabbageTween = null;
					
					};
					Starling.juggler.add(CabbageTween);	
				}
				CancelSolve();
				
			}
		}
		private function CancelSolve():void{
			trace('Muppet');
			SolvedAlmost = false;
			top_button_mc.alpha = 0;
			top_button_mc.stop();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope;
			}		
			SaveArray['Solved'] = "No";
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseMicroscope',SaveArray);
		}
		
		private function FadeOutCabbage():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpThree();
			cabbage.texture = this.assets.getTexture('cabbage_broken');
			CabbageTween = new Tween(cabbageSprite, 1.5, Transitions.LINEAR);
			CabbageTween.fadeTo(0);
			CabbageTween.onComplete = function():void{
				CabbageTween = null;
				BreakUpGoat();							
			};
			Starling.juggler.add(CabbageTween);	
		}
		private function BreakUpGoat():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpThree();
			goat.texture = this.assets.getTexture('goat_broken');
			GoatTween = new Tween(goatSprite, 1.5, Transitions.LINEAR);
			GoatTween.fadeTo(0);
			GoatTween.onComplete = function():void{
				Animating = false;
				GoatTween = null;					
			};
			Starling.juggler.add(GoatTween);	
		}
		
		private function FadeOutGoat():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpThree();
			goat.texture = this.assets.getTexture('goat_broken');
			GoatTween = new Tween(goatSprite, 1.5, Transitions.LINEAR);
			GoatTween.fadeTo(0);
			GoatTween.onComplete = function():void{
				GoatTween = null;
				BreakUpWolf();							
			};
			Starling.juggler.add(GoatTween);	
		}
		private function BreakUpWolf():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpThree();
			wolf.texture = this.assets.getTexture('wolf_broken');
			WolfTween = new Tween(wolfSprite, 1.5, Transitions.LINEAR);
			WolfTween.fadeTo(0);
			WolfTween.onComplete = function():void{
				Animating = false;
				
				WolfTween = null;
									
			};
			Starling.juggler.add(WolfTween);	
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
			
			
			
			this.assets.removeTexture("greenHouseMicroscope_bg",true);
			this.assets.removeTexture("GreenHouseMicroscope_Sprite_01",true);		
			this.assets.removeTextureAtlas("GreenHouseMicroscope_Sprite_01",true);
			this.assets.removeTexture("GreenHouseMicroscope_Sprite_02",true);
			this.assets.removeTextureAtlas("GreenHouseMicroscope_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("greenHouseMicroscope_01");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseMicroscope_02");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseMicroscope_03");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseMicroscope_04");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseMicroscope_05");
			
			// stage.getChildAt(0) as Object).falseAsset("coastSurf_02");
			
			if(blackOut === true){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.BlackOutRectangleFade(0,0.5);
			}
			(stage.getChildAt(0) as Object).screenGamePlayHandler.
				UnloadScene(
					
				);			
			
			this.dispose();
			
		}
	}
}
