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
	
	public class Bathroom extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var cab_on:Image;
		private var cab_off:Image;
		private var cab_iodine:Image;
		private var cab_sample:Image;
		private var mirror_on:Image;
		private var mirror_off:Image;
		private var vent_on:Image;
		private var vent_off:Image;
		private var waterFlow:Image;
		
		private var hit_duct:Shape;
		private var hit_wall:Shape;
		
		private var hit_mirror:Shape;
		private var hit_cab_lid:Shape;
		private var hit_cab_int:Shape;
		private var hit_vent:Shape;
		private var hit_book:Shape;
		
		private var hit_toilet:Shape;
		private var hit_trashcan:Shape;
		private var hit_fan:Shape;
		private var hit_sink:Shape;
		private var hit_underSink:Shape;
		private var hit_utensils:Shape;
		private var hit_flower:Shape;
		private var hit_tp:Shape;
		
		private var hit_floor:Shape;
		private var hit_sign:Shape;
		private var hit_soap:Shape;
		
		private var VentOpen:Boolean = false;
		private var VentUnlocked:Boolean = false;
		private var CabLidOpen:Boolean = false;
		
		private var MirrorOpen:Boolean = false;
		private var MirrorUnlocked:Boolean = false;
		
		private var WaterTweenIn:Tween;
		private var WaterTweenOut:Tween;
				
		private var openBookbg:Shape;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookcurrentPage:Number = 0;
		private var hit_openBookBack:Shape;
		private var hit_openBookNext:Shape;
		public var OpenBookTween:Tween;
		private var BookIsOpen:Boolean = false;
		private var ComputerOn:Boolean = false;
		
		private var WaterPickedUp:Boolean = false;
		private var RONum:int = 0;
		
		private var SinkAnimating:Boolean = false;
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
				
		
		public function Bathroom(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('bathroom_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Bathroom/bathroom_bg.jpg'));
				game.TrackAssets('bathroom_01');
			}
			if(game.CheckAsset('bathroom_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Bathroom/Bathroom_Sprite_01.png'));
				game.TrackAssets('bathroom_02');
			}
			if(game.CheckAsset('bathroom_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Bathroom/Bathroom_Sprite_01.xml'));
				game.TrackAssets('bathroom_03');
			}
			
		/*	if(game.CheckAsset('bathroom_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Bathroom/MadMag_Sprite_01.png'));
				game.TrackAssets('bathroom_04');
			}
			if(game.CheckAsset('bathroom_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Bathroom/MadMag_Sprite_01.xml'));
				game.TrackAssets('bathroom_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("Bathroom","BathroomObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			
			bg = new Image(this.assets.getTexture('bathroom_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);

			cab_iodine = new Image(this.assets.getTexture('cab_iodine'));
			cab_iodine.touchable = false;
			cab_iodine.x = 423;
			cab_iodine.y = 60;
			
			cab_sample = new Image(this.assets.getTexture('cab_sample'));
			cab_sample.touchable = false;
			cab_sample.x = 452;
			cab_sample.y = 119;
			
			cab_on = new Image(this.assets.getTexture('cab_on'));
			cab_on.touchable = false;
			cab_on.x = 423;
			cab_on.y = 56;
			
			cab_off = new Image(this.assets.getTexture('cab_off'));
			cab_off.touchable = false;
			cab_off.x = 350;
			cab_off.y = 42;
			
			vent_on = new Image(this.assets.getTexture('vent_on'));
			vent_on.touchable = false;
			vent_on.x = 545;
			vent_on.y = 5;
			
			vent_off = new Image(this.assets.getTexture('vent_off'));
			vent_off.touchable = false;
			vent_off.x = 430;
			vent_off.y = 336;
			
			mirror_on = new Image(this.assets.getTexture('mirror_on'));
			mirror_on.touchable = false;
			mirror_on.x = 209;
			mirror_on.y = 35;
			
			mirror_off = new Image(this.assets.getTexture('mirror_off'));
			mirror_off.touchable = false;
			mirror_off.x = 215;
			mirror_off.y = 316;
			
			waterFlow = new Image(this.assets.getTexture('sink_waterflow'));
			waterFlow.touchable = false;
			waterFlow.x = 295;
			waterFlow.y = 216;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom['VentUnlocked'] == 'Yes'){	
					VentUnlocked = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom['Vent'] == 'Open'){	
					VentOpen = true;
					vent_on.alpha = 0;
					vent_off.alpha = 1;
					CreateDuctHit();
				}else{
					vent_on.alpha = 1;
					vent_off.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom['MirrorUnlocked'] == 'Yes'){	
					MirrorUnlocked = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom['Mirror'] == 'Open'){	
					MirrorOpen = true;
					mirror_on.alpha = 0;
					mirror_off.alpha = 1;
					CreateWallHit();
				}else{
					mirror_on.alpha = 1;
					mirror_off.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom['Water'] == 'PickedUp'){	
					WaterPickedUp = true;
				}
				//WaterPickedUp
	//			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom['CabLid'] == 'Open'){	
	//				CabLidOpen = true;
	//				cab_on.alpha = 0;
	//				cab_off.alpha = 1;
	//				CreateCabIntHit();
					
	//				cab_iodine.alpha = 1;
	//				cab_sample.alpha = 1;
	//			}else{
	//				cab_on.alpha = 1;
	//				cab_off.alpha = 0;
	//			}
			}else{
				vent_on.alpha = 1;
				vent_off.alpha = 0;
				mirror_on.alpha = 1;
				mirror_off.alpha = 0;
				
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet['Lid'] == 'Open'){	
					cab_on.alpha = 0;
					cab_off.alpha = 1;
				}else{
					cab_on.alpha = 1;
					cab_off.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet['Iodine'] == 'PickedUp'){
					cab_iodine.alpha = 0;
				}else{
					cab_iodine.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BathroomCabinet['Sample'] == 'PickedUp'){
					cab_sample.alpha = 0;
				}else{
					cab_sample.alpha = 1;
				}
			}else{
				cab_on.alpha = 1;
				cab_off.alpha = 0;
				cab_iodine.alpha = 1;
				cab_sample.alpha = 1;
			}
			
			waterFlow.alpha = 0;
			
			this.addChildAt(cab_iodine,1);
			this.addChildAt(cab_sample,2);
			this.addChildAt(cab_on,3);
			this.addChildAt(cab_off,4);
			this.addChildAt(vent_on,5);
			this.addChildAt(vent_off,6);
			this.addChildAt(mirror_on,7);
			this.addChildAt(mirror_off,8);
			this.addChildAt(waterFlow,9);
			
			
			
		//	CreateDuctHit();
		//	CreateWallHit();
			
		//	CreateCabLidHit(CabLidOpen);
			CreateFanHit();
			CreateToiletHit();
			CreateTrashCanHit();
			CreateSinkHit();
			CreateUnderSinkHit();
			CreateUtensilHit();
			CreateFlowerHit();
			CreateTpHit();
			CreateFloorHit();
			CreateSignHit();
			CreateSoapHit();
			
			CreateCabIntHit();
			CreateVentHit(VentOpen);
			CreateMirrorHit(MirrorOpen);
			CreateBookHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom["Book"] == "open"){
					BookIsOpen = true;
					OpenBook();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom["BookCurrentPage"] == 0){
						openBookcurrentPage = 0;
					//	openBookPages.texture = this.assets.getTexture('madmag_page_00');
						openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_00");
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom["BookCurrentPage"] == 1){
						openBookcurrentPage = 1;
				//		openBookPages.texture = this.assets.getTexture('madmag_page_01');
						openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_01");
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom["BookCurrentPage"] == 2){
						openBookcurrentPage = 2;
				//		openBookPages.texture = this.assets.getTexture('madmag_page_02');
						openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_02");
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom["BookCurrentPage"] == 3){
						openBookcurrentPage = 3;
				//		openBookPages.texture = this.assets.getTexture('madmag_page_03');
						openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_03");
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom["BookCurrentPage"] == 4){
						openBookcurrentPage = 4;
					//	openBookPages.texture = this.assets.getTexture('madmag_page_04');
						openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_04");
					}else{
						openBookcurrentPage = 0;
					//	openBookPages.texture = this.assets.getTexture('madmag_page_00');
						openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_00");
					}
					
					this.addChild(goback);
				}
			}
			
			
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			//(stage.getChildAt(0) as Object).AmbientObj.currentAmbient = 'Waterfall';
			
		//	
			//(stage.getChildA(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BuildingHum",0,0.5,'stop');t(0) as Object).AmbientObj.LoadBuildingHum(true,999);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("WindHowl",0,0.5,'stop');
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("MotorFan",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDuctVibe(true,999);
			
			Starling.juggler.delayCall(function():void{
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadBathroomDrip(true,999);				
				(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolume("DuctVibe",((stage.getChildAt(0) as Object).AmbientObj.globalVol/2),1.0);
				PlayBuildingAmb();
				
			},0.5);
			
		}
		private function PlayBuildingAmb():void{
			Starling.juggler.delayCall(function():void{
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadBuildingHum(true,999);
				(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolume("BuildingHum",((stage.getChildAt(0) as Object).AmbientObj.globalVol/2),1.0);
				
			},0.5);
			
		}

		private function CreateSoapHit():void{
			hit_soap = new Shape();
			hit_soap.touchable = false;
			hit_soap.graphics.beginFill(0xff0000);
			
			hit_soap.graphics.lineTo(142,136);	
			hit_soap.graphics.lineTo(206,137);	
			hit_soap.graphics.lineTo(209,204);	
			hit_soap.graphics.lineTo(181,220);	
			
			hit_soap.graphics.endFill(false);
			hit_soap.alpha = 0.0;
			
			hit_soap.graphics.precisionHitTest = true;	
			this.addChild(hit_soap);
		}
		
		private function CreateSignHit():void{
			hit_sign = new Shape();
			hit_sign.touchable = false;
			hit_sign.graphics.beginFill(0xff0000);
			
			hit_sign.graphics.lineTo(141,37);	
			hit_sign.graphics.lineTo(205,42);	
			hit_sign.graphics.lineTo(205,125);	
			hit_sign.graphics.lineTo(143,123);	
		
			hit_sign.graphics.endFill(false);
			hit_sign.alpha = 0.0;
			
			hit_sign.graphics.precisionHitTest = true;	
			this.addChild(hit_sign);
		}
		
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0xff0000);
			
			hit_floor.graphics.lineTo(230,432);	
			hit_floor.graphics.lineTo(572,394);	
			hit_floor.graphics.lineTo(623,421);	
			hit_floor.graphics.lineTo(601,508);	
			hit_floor.graphics.lineTo(90,508);	
			
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		
		
		private function CreateTpHit():void{
			hit_tp = new Shape();
			hit_tp.touchable = false;
			hit_tp.graphics.beginFill(0xff0000);
			
			hit_tp.graphics.lineTo(558,320);	
			hit_tp.graphics.lineTo(540,301);	
			hit_tp.graphics.lineTo(541,277);	
			hit_tp.graphics.lineTo(568,249);	
			hit_tp.graphics.lineTo(606,261);	
			hit_tp.graphics.lineTo(600,335);	
		
			hit_tp.graphics.endFill(false);
			hit_tp.alpha = 0.0;
			
			hit_tp.graphics.precisionHitTest = true;	
			this.addChild(hit_tp);
		}
		
		private function CreateFlowerHit():void{
			hit_flower = new Shape();
			hit_flower.touchable = false;
			hit_flower.graphics.beginFill(0xff0000);
			
			hit_flower.graphics.lineTo(423,168);	
			hit_flower.graphics.lineTo(470,167);	
			hit_flower.graphics.lineTo(457,231);	
			hit_flower.graphics.lineTo(436,232);	
		
			hit_flower.graphics.endFill(false);
			hit_flower.alpha = 0.0;
			
			hit_flower.graphics.precisionHitTest = true;	
			this.addChild(hit_flower);
		}
		
		private function CreateUtensilHit():void{
			hit_utensils = new Shape();
			hit_utensils.touchable = false;
			hit_utensils.graphics.beginFill(0xff0000);
			
			hit_utensils.graphics.lineTo(342,304);	
			hit_utensils.graphics.lineTo(393,287);	
			hit_utensils.graphics.lineTo(413,417);	
			hit_utensils.graphics.lineTo(343,421);	
			
			hit_utensils.graphics.endFill(false);
			hit_utensils.alpha = 0.0;
			
			hit_utensils.graphics.precisionHitTest = true;	
			this.addChild(hit_utensils);
		}
		
		private function CreateUnderSinkHit():void{
			hit_underSink = new Shape();
			hit_underSink.touchable = false;
			hit_underSink.graphics.beginFill(0xff0000);
			
			hit_underSink.graphics.lineTo(250,288);	
			hit_underSink.graphics.lineTo(344,280);	
			hit_underSink.graphics.lineTo(320,387);	
			hit_underSink.graphics.lineTo(285,391);	
			
			hit_underSink.graphics.endFill(false);
			hit_underSink.alpha = 0.0;
			
			hit_underSink.graphics.precisionHitTest = true;	
			this.addChild(hit_underSink);
		}
		
		private function CreateSinkHit():void{
			hit_sink = new Shape();
			hit_sink.touchable = false;
			hit_sink.graphics.beginFill(0xff0000);
			
			hit_sink.graphics.lineTo(218,220);	
			hit_sink.graphics.lineTo(270,193);	
			hit_sink.graphics.lineTo(349,195);	
			hit_sink.graphics.lineTo(388,236);	
			hit_sink.graphics.lineTo(380,265);	
			hit_sink.graphics.lineTo(245,278);	
		
			hit_sink.graphics.endFill(false);
			hit_sink.alpha = 0.0;
			
			hit_sink.graphics.precisionHitTest = true;	
			this.addChild(hit_sink);
		}
		
		private function CreateTrashCanHit():void{
			hit_trashcan = new Shape();
			hit_trashcan.touchable = false;
			hit_trashcan.graphics.beginFill(0xff0000);
			
			hit_trashcan.graphics.lineTo(51,310);	
			hit_trashcan.graphics.lineTo(120,282);	
			hit_trashcan.graphics.lineTo(188,306);	
			hit_trashcan.graphics.lineTo(216,437);	
			hit_trashcan.graphics.lineTo(184,475);	
			hit_trashcan.graphics.lineTo(78,472);	
			
			hit_trashcan.graphics.endFill(false);
			hit_trashcan.alpha = 0.0;
			
			hit_trashcan.graphics.precisionHitTest = true;	
			this.addChild(hit_trashcan);
		}
		
		private function CreateToiletHit():void{
			hit_toilet = new Shape();
			hit_toilet.touchable = false;
			hit_toilet.graphics.beginFill(0xff0000);
			
			hit_toilet.graphics.lineTo(411,245);	
			hit_toilet.graphics.lineTo(496,238);	
			hit_toilet.graphics.lineTo(497,290);	
			hit_toilet.graphics.lineTo(550,311);	
			hit_toilet.graphics.lineTo(555,349);	
			hit_toilet.graphics.lineTo(535,442);	
			hit_toilet.graphics.lineTo(433,397);	
			hit_toilet.graphics.lineTo(430,326);	
			hit_toilet.graphics.lineTo(401,311);	
			
			hit_toilet.graphics.endFill(false);
			hit_toilet.alpha = 0.0;
			
			hit_toilet.graphics.precisionHitTest = true;	
			this.addChild(hit_toilet);
		}
		
		private function CreateFanHit():void{
			hit_fan = new Shape();
			hit_fan.touchable = false;
			hit_fan.graphics.beginFill(0xff0000);
			
			hit_fan.graphics.lineTo(13,79);	
			hit_fan.graphics.lineTo(137,87);	
			hit_fan.graphics.lineTo(138,178);	
			hit_fan.graphics.lineTo(15,180);	
						
			hit_fan.graphics.endFill(false);
			hit_fan.alpha = 0.0;
			
			hit_fan.graphics.precisionHitTest = true;	
			this.addChild(hit_fan);
		}
		
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(651,257);	
			hit_book.graphics.lineTo(717,268);	
			hit_book.graphics.lineTo(710,369);	
			hit_book.graphics.lineTo(653,352);	
							
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
		private function CreateCabLidHit(open:Boolean = false):void{
			hit_cab_lid = new Shape();		
			hit_cab_lid.x = 0;
			hit_cab_lid.y = 0;
			hit_cab_lid.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_cab_lid.graphics.lineTo(418,50);					
				hit_cab_lid.graphics.lineTo(501,58);					
				hit_cab_lid.graphics.lineTo(499,149);					
				hit_cab_lid.graphics.lineTo(419,149);					
				
				
			}else{				
				hit_cab_lid.graphics.lineTo(372,38);
				hit_cab_lid.graphics.lineTo(423,53);
				hit_cab_lid.graphics.lineTo(420,148);
				hit_cab_lid.graphics.lineTo(369,147);
					
			}				
			hit_cab_lid.graphics.endFill(false);			
			hit_cab_lid.alpha = 0.1;			
			hit_cab_lid.graphics.precisionHitTest = true;	
			hit_cab_lid.touchable = false
			this.addChild(hit_cab_lid);
			
			
		}
		
		private function CreateVentHit(open:Boolean = false):void{
			hit_vent = new Shape();		
			hit_vent.x = 0;
			hit_vent.y = 0;
			hit_vent.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_vent.graphics.lineTo(546,16);	
				hit_vent.graphics.lineTo(641,0);	
				hit_vent.graphics.lineTo(658,0);	
				hit_vent.graphics.lineTo(651,142);	
				hit_vent.graphics.lineTo(541,149);			
				
				
			}else{				
				hit_vent.graphics.lineTo(468,346);
				hit_vent.graphics.lineTo(580,334);
				hit_vent.graphics.lineTo(606,437);
				hit_vent.graphics.lineTo(590,468);
				hit_vent.graphics.lineTo(490,487);			
			}				
			hit_vent.graphics.endFill(false);			
			hit_vent.alpha = 0.0;			
			hit_vent.graphics.precisionHitTest = true;	
			hit_vent.touchable = false
			this.addChild(hit_vent);
			
			
		}
		private function CreateMirrorHit(open:Boolean = false):void{
			hit_mirror = new Shape();		
			hit_mirror.x = 0;
			hit_mirror.y = 0;
			hit_mirror.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_mirror.graphics.lineTo(211,32);	
				hit_mirror.graphics.lineTo(340,42);	
				hit_mirror.graphics.lineTo(346,170);	
				hit_mirror.graphics.lineTo(215,170);						
						
				
			}else{
				
				hit_mirror.graphics.lineTo(235,310);
				hit_mirror.graphics.lineTo(356,330);
				hit_mirror.graphics.lineTo(330,474);
				hit_mirror.graphics.lineTo(215,440);
			
			}				
			hit_mirror.graphics.endFill(false);			
			hit_mirror.alpha = 0.0;			
			hit_mirror.graphics.precisionHitTest = true;	
			hit_mirror.touchable = false
			this.addChild(hit_mirror);
			
			
		}
		//hit_cab_int
		private function CreateCabIntHit():void{
			hit_cab_int = new Shape();
			hit_cab_int.touchable = false;
			hit_cab_int.graphics.beginFill(0xff0000);
			
			hit_cab_int.graphics.lineTo(398,49);	
			hit_cab_int.graphics.lineTo(500,59);	
			hit_cab_int.graphics.lineTo(498,151);	
			hit_cab_int.graphics.lineTo(391,145);	
			
			hit_cab_int.graphics.endFill(false);
			hit_cab_int.alpha = 0.0;
			
			hit_cab_int.graphics.precisionHitTest = true;	
			this.addChild(hit_cab_int);
		}
		
		private function CreateWallHit():void{
			hit_wall = new Shape();
			hit_wall.touchable = false;
			hit_wall.graphics.beginFill(0xff0000);
			
			hit_wall.graphics.lineTo(211,32);	
			hit_wall.graphics.lineTo(340,42);	
			hit_wall.graphics.lineTo(346,170);	
			hit_wall.graphics.lineTo(215,170);	
			
			hit_wall.graphics.endFill(false);
			hit_wall.alpha = 0.0;
			
			hit_wall.graphics.precisionHitTest = true;	
			this.addChild(hit_wall);
		}
		
		private function CreateDuctHit():void{
			hit_duct = new Shape();
			hit_duct.touchable = false;
			hit_duct.graphics.beginFill(0xff0000);
			
			hit_duct.graphics.lineTo(546,16);	
			hit_duct.graphics.lineTo(641,0);	
			hit_duct.graphics.lineTo(658,0);	
			hit_duct.graphics.lineTo(651,142);	
			hit_duct.graphics.lineTo(541,149);	
			
			hit_duct.graphics.endFill(false);
			hit_duct.alpha = 0.0;
			
			hit_duct.graphics.precisionHitTest = true;	
			this.addChild(hit_duct);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						if(BookIsOpen === false){		
							trace(touches[0].globalX+" ,"+touches[0].globalY);
							if(VentOpen === true){
								if(hit_duct.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangOne();
									FadeOut((BathroomDuct as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.BathroomDuctObj,false
									);
									return;
								}
							}	
							if(MirrorOpen === true){
								if(hit_wall.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									FadeOut((BathroomWall as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.BathroomWallObj,true
									);
									return;
								}
							}
							
						
							
						//	if(CabLidOpen === true){
						//		if(hit_cab_int.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						//			FadeOut((BathroomCabinet as Class), 
						//				(stage.getChildAt(0) as Object).screenGamePlayHandler.BathroomCabinetObj,true
						//			);
						//			
						//		}
						//	}	
							
							 if(targ == goback.SourceImage){
								
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								
								FadeOut((OfficeKitchen as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeKitchenObj,false
								);
								return;
							}else if(hit_mirror.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								MirrorHandler();
								return;
							}else if(hit_cab_int.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((BathroomCabinet as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.BathroomCabinetObj,true
									);
								return;
					//		}else if(hit_cab_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
					//			CabLidHandler();
							}else if(hit_vent.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								VentHandler();
								return;
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								BookIsOpen = true;
								OpenBook(true, openBookcurrentPage);
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom;
								}		
								SaveArray['Book'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Bathroom',SaveArray);
								return;
							}else if(hit_toilet.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'm fine right now, thank you.");
							}else if(hit_trashcan.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								TrashHandler();
							}else if(hit_fan.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FanHandler();
							}else if(hit_sink.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if((stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.armedItem
									== 
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.inventoryBarObj
									.item_Jar)
								{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
										(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFull,
										'item_JarFull',
										'inven_jarFull_sm',
										(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Jar,
										'item_Jar'
									);
									WaterPickedUp = true;
									
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){	
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom;	
									}
									SaveArray['Water'] = "PickedUp";

									SinkHandler();
								}else if((stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.armedItem
									== 
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.inventoryBarObj
									.item_JarRock)
								{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
										(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFullRock,
										'item_JarFullRock',
										'inven_jarFullRock_sm',
										(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarRock,
										'item_JarRock'
									);
									WaterPickedUp = true;
									
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){	
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom									}
									SaveArray['Water'] = "PickedUp";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Bathroom',SaveArray);
									
									SinkHandler();
								}else if((stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.armedItem
									== 
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.inventoryBarObj
									.item_JarRockIodine)
								{								
									(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
										(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFullRockIodine,
										'item_JarFullRockIodine',
										'inven_jarFullRockIodine_sm',
										(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarRockIodine,
										'item_JarRockIodine'
									);
									WaterPickedUp = true;
									
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){	
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom;	
									}
									SaveArray['Water'] = "PickedUp";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Bathroom',SaveArray);
									SinkHandler();
								}else if((stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.armedItem
										== 
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.inventoryBarObj
										.item_JarIodine)
									{	
										(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
											(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarFullIodine,
											'item_JarFullIodine',
											'inven_jarFullIodine_sm',
											(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_JarIodine,
											'item_JarIodine'
										);
										WaterPickedUp = true;
										
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){	
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom;	
										}
										SaveArray['Water'] = "PickedUp";
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Bathroom',SaveArray);
										SinkHandler();
								}else{
									SinkHandler();
								}
								
							}else if(hit_underSink.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Water pipes connected to the sink.");
							}else if(hit_utensils.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								UtensilHandler();
							}else if(hit_flower.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FlowerHandler();
							}else if(hit_tp.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Out of toilet paper... What is going on around here?");
							}else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The floor is wet and slippery.");
							}else if(hit_sign.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'Wash hands before returning to work...,' good advice.");
							}else if(hit_soap.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A soap dispenser");
							}
							 
							 /*
							 private var hit_floor:Shape;
							 private var hit_sign:Shape;
							 private var hit_soap:Shape;e
							 */
							 
							 
							 
						}else{
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
						//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterFlow();
								
								trace("GoBackClick");
								RemoveBook();
								BookIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom;
								}		
								SaveArray['Book'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Bathroom',SaveArray);
								return;
							}
							else if(hit_openBookNext.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom;
								}
								
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
							//		openBookPages.texture = this.assets.getTexture('madmag_page_01');
									openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_01");
								}else if(openBookcurrentPage == 1){
									
									SaveArray['BookCurrentPage'] = 2
									openBookcurrentPage = 2;
							//		openBookPages.texture = this.assets.getTexture('madmag_page_02');
									openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_02");
								}else if(openBookcurrentPage == 2){
									SaveArray['BookCurrentPage'] = 3
									openBookcurrentPage = 3;
								//	openBookPages.texture = this.assets.getTexture('madmag_page_03');
									openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_03");
								}else if(openBookcurrentPage == 3){
									SaveArray['BookCurrentPage'] = 4
									openBookcurrentPage = 4;
							//		openBookPages.texture = this.assets.getTexture('madmag_page_04');
									openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_04");
								}else if(openBookcurrentPage == 4){																	
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
							//	openBookPages.texture = this.assets.getTexture('madmag_page_00');
									openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_00");
								}
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Bathroom',SaveArray);
								return;
							}
							else if(hit_openBookBack.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom;
								}
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 4;
									openBookcurrentPage = 4;
								//	openBookPages.texture = this.assets.getTexture('madmag_page_04');
									openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_04");
								}else if(openBookcurrentPage == 4){
									SaveArray['BookCurrentPage'] = 3;
									openBookcurrentPage = 3;
								//	openBookPages.texture = this.assets.getTexture('madmag_page_03');		
									openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_03");
								}else if(openBookcurrentPage == 3){
									SaveArray['BookCurrentPage'] = 2;
									openBookcurrentPage = 2;
								//	openBookPages.texture = this.assets.getTexture('madmag_page_02');
									openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_02");
								}else if(openBookcurrentPage == 2){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
							//		openBookPages.texture = this.assets.getTexture('madmag_page_01');
									openBookPages.texture =	(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_01");
								}else if(openBookcurrentPage == 1){
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
							//		openBookPages.texture = this.assets.getTexture('madmag_page_00');
									openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_00");
									
								}
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Bathroom',SaveArray);
								return;
								
							}		
						}
						
					}
				}
			}
		}
		private function SinkHandler():void{
			if(SinkAnimating === false){
				SinkAnimating = true;
				Animating = true;
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterFlow();
				WaterTweenIn = new Tween(waterFlow, 1, Transitions.EASE_OUT);
				WaterTweenIn.fadeTo(1);
				WaterTweenIn.onComplete = function():void{
					SinkOut();
					SinkAnimating = false;
					WaterTweenIn = null;
					
				};
				Starling.juggler.add(WaterTweenIn);	
			}
		}
		private function SinkOut():void{
			WaterTweenOut = new Tween(waterFlow, 1, Transitions.EASE_IN);
			WaterTweenOut.fadeTo(0);
			WaterTweenOut.onComplete = function():void{
				
				Animating = false;
				WaterTweenOut = null;
				
			};
			Starling.juggler.add(WaterTweenOut);	
		}
		//UtensilHandler
		private function UtensilHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A plunger and toilet brush.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I don't think I need to touch those.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Always good to be prepared...");	
			}
		}
		
		private function FlowerHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small pink-purple flower in a delicate vase.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The scent of the flower perfumes the air.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small pink-purple flower in a delicate vase.");	
			}
		}
		
		private function TrashHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The trash bin is empty besides a few crumpled paper hand towels.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are a few used crumpled paper hand towels beside the trash bin.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There's nothing of interest inside the trash bin.");
			}
			
		}
		
		private function FanHandler():void{
			if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('BathroomFan') === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hot air blows out of the fan.");
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BathroomFan();
			}
			
		}
		
		
		private function OpenBook(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openBook = new Sprite();
			openBook.alpha = 0;
			CreateOpenBookBg();
			//openBookPages = new Image(this.assets.getTexture('madmag_page_00'));
			openBookPages = new Image((stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_00"));
			this.openBook.addChildAt(openBookbg,0);
			openBook.addChild(openBookPages);
			openBookPages.touchable = false;
			
			
			this.addChildAt(openBook,10);
			this.addChildAt(goback,11);
			
			if(openBookcurrentPage == 0){
		//		openBookPages.texture = this.assets.getTexture('madmag_page_00');
				openBookPages.texture = (stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_00");
			}else if(openBookcurrentPage == 1){
		//		openBookPages.texture = this.assets.getTexture('madmag_page_01');
				openBookPages.texture = (stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_01");
			}else if(openBookcurrentPage == 2){
		//		openBookPages.texture = this.assets.getTexture('madmag_page_02');
				openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_02");
			}else if(openBookcurrentPage == 3){
		//		openBookPages.texture = this.assets.getTexture('madmag_page_03');
				openBookPages.texture =(stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_03");
			}else if(openBookcurrentPage == 4){
		//		openBookPages.texture = this.assets.getTexture('madmag_page_04');
				openBookPages.texture = (stage.getChildAt(0) as Object).MadMagImages.assets.getTexture("madmag_page_04");
			}
			CreateOpenBookHit()
			//	CreateOpenBookHit(openBookcurrentPage);
			
			if(Fade === false){
				Animating = false;
				openBook.alpha = 1;
				
			}else{
				
				OpenBookTween = new Tween(openBook, 0.5, Transitions.LINEAR);
				OpenBookTween.fadeTo(1);
				OpenBookTween.onComplete = function():void{
					Animating = false; 
					//	CreateOpenNotePadHit();
				};
				Starling.juggler.add(OpenBookTween);	
				
			}
			//	CreateOpenBookHit(page);
		}
		
		private function RemoveBook():void{
			Animating = true;
			Starling.juggler.purge();
			OpenBookTween = new Tween(openBook, 0.5, Transitions.LINEAR);
			OpenBookTween.fadeTo(0);
			OpenBookTween.onComplete = function():void{
				Animating = false;
				//hit_OpenBook.graphics.clear();
				//	hit_openBookBack.graphics.clear();
				//	hit_openBookNext.graphics.clear();
				CloseBook();
				
			};
			Starling.juggler.add(OpenBookTween);		
		}
		
		public function CloseBook():void{
			this.removeChild(openBook);
			openBook.dispose();
		}
		
		
		private function CreateOpenBookHit():void{
			hit_openBookBack = new Shape();
			openBook.addChild(hit_openBookBack);
			hit_openBookBack.graphics.beginFill(0x00ff00);
			hit_openBookBack.graphics.lineTo(65,15);		
			hit_openBookBack.graphics.lineTo(287,0);		
			hit_openBookBack.graphics.lineTo(380,7);		
			hit_openBookBack.graphics.lineTo(385,490);		
			hit_openBookBack.graphics.lineTo(269,493);		
			hit_openBookBack.graphics.lineTo(50,504);		
			
			hit_openBookBack.graphics.endFill(false);
			hit_openBookBack.alpha = 0.0;
			hit_openBookBack.touchable = false;
			hit_openBookBack.graphics.precisionHitTest = true;	
			
			hit_openBookNext = new Shape();
			openBook.addChild(hit_openBookNext);
			hit_openBookNext.graphics.beginFill(0xff0000);
			hit_openBookNext.graphics.lineTo(390,5);		
			hit_openBookNext.graphics.lineTo(667,3);		
			hit_openBookNext.graphics.lineTo(714,384);		
			hit_openBookNext.graphics.lineTo(395,494);		
			
			hit_openBookNext.graphics.endFill(false);
			hit_openBookNext.alpha = 0.0;
			hit_openBookNext.touchable = false;
			hit_openBookNext.graphics.precisionHitTest = true;	
		}
		
		private function CreateOpenBookBg():void{
			openBookbg = new Shape();
			openBookbg.graphics.beginFill(0x000000);
			openBookbg.graphics.lineTo(0,0);	
			openBookbg.graphics.lineTo(800,0);	
			openBookbg.graphics.lineTo(800,512);	
			openBookbg.graphics.lineTo(0,512);	
			openBookbg.touchable = false;
			openBookbg.graphics.endFill(false);
			openBookbg.alpha = 0.5;
			//	openBookbg.graphics.precisionHitTest = true;				
			
		}		
		
	
		private function VentHandler():void{
			if(VentUnlocked === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Screwdriver)
					
				{
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom;	
					}
					SaveArray['VentUnlocked'] = 'Yes';
					SaveArray['Vent'] = 'Open';
					VentUnlocked = true;
					VentOpen = true;
					vent_off.alpha = 1;
					vent_on.alpha = 0;
					hit_vent.graphics.clear();
					CreateVentHit(true);		
					CreateDuctHit();
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Bathroom',SaveArray);
									
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxOpen();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat != undefined){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat['CoverRemoved'] == 'Yes'){
							if(MirrorUnlocked === true){
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
									.InventoryObj.removeItemFromInventory(
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.item_Screwdriver,
										"item_Screwdriver"
									);
							}
							
						}
						
					}
					
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Drill)
					
				{	
					if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('DrillSlow') === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrillSlow();
					}
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The drill barely makes a dent in the hard steel of vent.");

				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoorTwo();
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The vent cover is screwed into place.");
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't pull the vent cover off with my hands... I'll need to remove the screws.");	
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The dusty vent cover is screwed tightly in place");	
					}
					

				}
			}else{
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom;	
				}
				if(VentOpen === false){
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxOpen();
					VentOpen = true;
					vent_off.alpha = 1;
					vent_on.alpha = 0;
					SaveArray['Vent'] = 'Open';
					hit_vent.graphics.clear();
					CreateVentHit(true);			
					CreateDuctHit();
					
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxClose();
					VentOpen = false;
					vent_off.alpha = 0;
					vent_on.alpha = 1;
					SaveArray['Vent'] = 'Closed';
					hit_vent.graphics.clear();
					hit_duct.graphics.clear();
					CreateVentHit(false);
					
				}
				
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Bathroom',SaveArray);
			}
			
			
		}
		
		private function CabLidHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom;	
			}
			if(CabLidOpen === false){
				CabLidOpen = true;
				cab_off.alpha = 1;
				cab_on.alpha = 0;
				SaveArray['CabLid'] = 'Open';
				hit_cab_lid.graphics.clear();
				CreateCabLidHit(true);
				CreateCabIntHit();
			}else{
				CabLidOpen = false;
				cab_off.alpha = 0;
				cab_on.alpha = 1;
				SaveArray['CabLid'] = 'Closed';
				hit_cab_lid.graphics.clear();
				hit_cab_int.graphics.clear();
				CreateCabLidHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Bathroom',SaveArray);
		}
		
		private function MirrorHandler():void{
			if(MirrorUnlocked === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Screwdriver)
					
				{
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom;	
					}
					SaveArray['MirrorUnlocked'] = 'Yes';
					SaveArray['Mirror'] = 'Open';
					MirrorUnlocked = true;
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxTwo_Open();
					MirrorOpen = true;
					mirror_off.alpha = 1;
					mirror_on.alpha = 0;
					
					hit_mirror.graphics.clear();
					CreateMirrorHit(true);
					CreateWallHit();
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Bathroom',SaveArray);
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxOpen();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat != undefined){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat['CoverRemoved'] == 'Yes'){
							if(VentUnlocked === true){
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
									.InventoryObj.removeItemFromInventory(
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.item_Screwdriver,
										"item_Screwdriver"
									);
							}
							
						}
						
					}else if((stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.armedItem
						== 
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.inventoryBarObj
						.item_Drill)
						
					{	
						if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('DrillSlow') === false){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrillSlow();
						}
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The drill does nothing to remove the screws that hold the mirror up.");
					}
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakThree();
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A handful of screws hold the mirror in place.");
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't pull the mirror off the wall with my hands... I'll need to remove the screws.");	
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Four screws afix the mirror to the wall.");	
					}
				}
			}else{
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom;	
				}
				if(MirrorOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxTwo_Open();
					MirrorOpen = true;
					mirror_off.alpha = 1;
					mirror_on.alpha = 0;
					SaveArray['Mirror'] = 'Open';
					hit_mirror.graphics.clear();
					CreateMirrorHit(true);
					CreateWallHit();
				}else{(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxTwo_Bunk();
					MirrorOpen = false;
					mirror_off.alpha = 0;
					mirror_on.alpha = 1;
					SaveArray['Mirror'] = 'Closed';
					hit_mirror.graphics.clear();
					hit_wall.graphics.clear();
					CreateMirrorHit(false);
				}
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Bathroom',SaveArray);
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
			
			
			
			this.assets.removeTexture("bathroom_bg",true);
			this.assets.removeTexture("Bathroom_Sprite_01",true);							
			this.assets.removeTextureAtlas("Bathroom_Sprite_01",true);
		//	this.assets.removeTexture("MadMag_Sprite_01",true);		
		//	this.assets.removeTextureAtlas("MadMag_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("bathroom_01");
			(stage.getChildAt(0) as Object).falseAsset("bathroom_02");
			(stage.getChildAt(0) as Object).falseAsset("bathroom_03");
		//	(stage.getChildAt(0) as Object).falseAsset("bathroom_04");
		//	(stage.getChildAt(0) as Object).falseAsset("bathroom_05");
			
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


