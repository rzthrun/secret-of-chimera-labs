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
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;

	public class GreenHouseVenus extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var big_mc:MovieClip;
		private var big_open_mc:MovieClip;
		
		private var disc_mc:MovieClip;
		private var disc_open_mc:MovieClip;
		
		private var left_mc:MovieClip;
		private var right_mc:MovieClip;
		
		private var metal:Image;
		
		private var hit_mouth:Shape;
		private var hit_left:Shape;
		private var hit_right:Shape;
	//	private var hit_stem:Shape;
		
		private var MetalAttached:Boolean = false;
		
		private var delayCallRight:DelayedCall;
		private var delayCallLeft:DelayedCall;
		private var delayCallBig:DelayedCall;
		
		private var MouthClosed:Boolean = false;
		private var LeftClosed:Boolean = false;
		private var RightClosed:Boolean = false;
		
		
		private var DiscPickedUp:Boolean = false;
		private var Animating:Boolean = false;
		
		private var RightAnimating:Boolean = false;
		private var LeftAnimating:Boolean = false;
		private var MouthAnimating:Boolean = false;
		
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function GreenHouseVenus(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('greenHouseVenus_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseVenus/greenHouseVenus_bg.jpg'));
				game.TrackAssets('greenHouseVenus_01');
			}
		/*	if(game.CheckAsset('greenHouseVenus_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseVenus/GreenHouseVenus_Sprite_01.png'));
				game.TrackAssets('greenHouseVenus_02');
			}
			if(game.CheckAsset('greenHouseVenus_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseVenus/GreenHouseVenus_Sprite_01.xml'));
				game.TrackAssets('greenHouseVenus_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GreenHouseVenus","GreenHouseVenusObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		/*	(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_SyringeFull,
				'item_SyringeFull',
				'inven_syringeFull_sm'
			);
			
			SaveArray = null;
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouse',SaveArray);
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseSpore',SaveArray);
		*/	
			
		
			
			delayCallRight = new DelayedCall(PlayVenusRight,4);
			delayCallLeft = new DelayedCall(PlayVenusLeft,2);
			delayCallBig = new DelayedCall(PlayVenusBig,6);
			
			bg = new Image(this.assets.getTexture('greenHouseVenus_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			//(stage.getChildAt(0) as Object).GreenHouseVenusImages.assets.getTextures("main_0");
			big_mc = new MovieClip((stage.getChildAt(0) as Object).GreenHouseVenusImages.assets.getTextures("main_0"),9);
		//	big_mc = new MovieClip(this.assets.getTextures("main_0"),9);
			big_mc.x = 159;
			big_mc.y = 0;
			big_mc.touchable = false;
			big_mc.loop = false; 

//			big_open_mc = new MovieClip(this.assets.getTextures("main_0").reverse(),6);
//			big_open_mc.x = 159;
//			big_open_mc.y = 0;
//			big_open_mc.touchable = false;
//			big_open_mc.loop = false; 
			
			disc_mc = new MovieClip((stage.getChildAt(0) as Object).GreenHouseVenusImages.assets.getTextures("disc_0"),9);
		//	disc_mc = new MovieClip(this.assets.getTextures("disc_0"),9);
			disc_mc.x = 358;
			disc_mc.y = 189;
			disc_mc.touchable = false;
			disc_mc.loop = false; 
			

			
			left_mc = new MovieClip((stage.getChildAt(0) as Object).GreenHouseVenusImages.assets.getTextures("left_0"),12);
		//left_mc = new MovieClip(this.assets.getTextures("left_0"),12);
			left_mc.x = 41;
			left_mc.y = 323;
			left_mc.touchable = false;
			left_mc.loop = false; 
			
			
			right_mc = new MovieClip((stage.getChildAt(0) as Object).GreenHouseVenusImages.assets.getTextures("right_0"),12);
		//	right_mc = new MovieClip(this.assets.getTextures("right_0"),12);
			right_mc.x = 553;
			right_mc.y = 291;
			right_mc.touchable = false;
			right_mc.loop = false; 

			metal = new Image((stage.getChildAt(0) as Object).GreenHouseVenusImages.assets.getTexture("metal"));
		//	metal = new Image(this.assets.getTexture('metal'));
			metal.touchable = false;
			metal.x = 248;
			metal.y = 124;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['MetalAttached'] == 'Yes'){
					MetalAttached = true;
					metal.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['Disc'] == 'PickedUp'){
						DiscPickedUp = true;
						disc_mc.alpha = 0;
					}else{
						disc_mc.alpha = 1;
					}
				}else{
					metal.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['Mouth'] == 'Closed'){
								
					MouthClosed = true;
					big_mc.reverse = true;	
					big_mc.alpha = 1;
					disc_mc.reverse = true;	
				}else{
					big_mc.alpha = 1;	
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['Left'] == 'Closed'){
					LeftClosed = true;
					left_mc.reverse = true;	
					left_mc.alpha = 1;
					
				}else{
					left_mc.alpha = 1;	
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['Right'] == 'Closed'){
					RightClosed = true;
					right_mc.reverse = true;	
					right_mc.alpha = 1;
					
				}else{
					right_mc.alpha = 1;
				}
			}else{
				big_mc.alpha = 1;
				disc_mc.alpha = 1;
				left_mc.alpha = 1;
				right_mc.alpha = 1;
				metal.alpha = 0;
			}
			
			
			
			this.addChildAt(left_mc,1);
			this.addChildAt(right_mc,2);
			this.addChildAt(big_mc,3);
//			this.addChildAt(big_open_mc,2);
			this.addChildAt(disc_mc,4);
			this.addChildAt(metal,5);
//			this.addChildAt(disc_open_mc,4);
		
			CreateMouthHit();
			CreateLeftHit();
			CreateRightHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			disc_mc.stop();
			big_mc.stop();
			left_mc.stop();
			right_mc.stop();
			
		
			Starling.juggler.add(disc_mc);
			Starling.juggler.add(big_mc);
			Starling.juggler.add(left_mc);
			Starling.juggler.add(right_mc);
			
			Starling.juggler.add(delayCallRight);
			Starling.juggler.add(delayCallLeft);
			if(MetalAttached === false){
				Starling.juggler.add(delayCallBig);
			}		
			
		//	big_mc.play();
		//	Starling.juggler.add(big_mc);
		}
		//hit_stem
		
		
		
		private function CreateRightHit():void{
			hit_right = new Shape();
			hit_right.touchable = false;
			hit_right.graphics.beginFill(0xff0000);
			
			hit_right.graphics.lineTo(629,306);	
			hit_right.graphics.lineTo(709,316);	
			hit_right.graphics.lineTo(774,369);	
			hit_right.graphics.lineTo(774,408);	
			hit_right.graphics.lineTo(682,408);	
			hit_right.graphics.lineTo(571,395);	
			
			hit_right.graphics.endFill(false);
			hit_right.alpha = 0.0;
			
			hit_right.graphics.precisionHitTest = true;	
			this.addChild(hit_right);
		}
		
		private function CreateLeftHit():void{
			hit_left = new Shape();
			hit_left.touchable = false;
			hit_left.graphics.beginFill(0xff0000);
			
			hit_left.graphics.lineTo(72,406);	
			hit_left.graphics.lineTo(143,346);	
			hit_left.graphics.lineTo(274,361);	
			hit_left.graphics.lineTo(285,449);	
			hit_left.graphics.lineTo(180,490);	
		
			hit_left.graphics.endFill(false);
			hit_left.alpha = 0.0;
			
			hit_left.graphics.precisionHitTest = true;	
			this.addChild(hit_left);
		}
		private function CreateMouthHit():void{
			hit_mouth = new Shape();
			hit_mouth.touchable = false;
			hit_mouth.graphics.beginFill(0xff0000);
			
			hit_mouth.graphics.lineTo(240,213);	
			hit_mouth.graphics.lineTo(233,128);	
			hit_mouth.graphics.lineTo(254,97);	
			hit_mouth.graphics.lineTo(342,80);	
			hit_mouth.graphics.lineTo(430,110);	
			hit_mouth.graphics.lineTo(490,206);	
			hit_mouth.graphics.lineTo(460,328);	
			hit_mouth.graphics.lineTo(379,343);	
			hit_mouth.graphics.lineTo(278,274);	
			
			hit_mouth.graphics.endFill(false);
			hit_mouth.alpha = 0.0;
			
			hit_mouth.graphics.precisionHitTest = true;	
			this.addChild(hit_mouth);
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
							return;
						}else if(hit_mouth.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(MouthAnimating === false){
								MouthHandler();
								return;
							}
							
						}else if(hit_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(LeftAnimating === false){
								LeftHandler();
								return;
							}
						}else if(hit_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(RightAnimating === false){
								RightHandler();
								return;
							}
								
								
						
						}
					}
				}
			}
		}
		
		private function PlayVenusBig():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus;
			}
			
			if(MouthClosed === false){
				MouthClosed = true;
				MouthAnimating = true;
				big_mc.addEventListener(Event.COMPLETE, onMouthComplete);
				SaveArray['Mouth'] = 'Closed';
				big_mc.play();
				disc_mc.play();
			}else{
				MouthClosed = false;
				MouthAnimating = true;
				big_mc.addEventListener(Event.COMPLETE, onMouthOpenComplete);
				SaveArray['Mouth'] = 'Open';
				big_mc.play();	
				disc_mc.play();
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray);
			
		}
		private function PlayVenusLeft():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus;
			}
			
			if(LeftClosed === false){
				LeftClosed = true;
				LeftAnimating = true;
				left_mc.addEventListener(Event.COMPLETE, onLeftComplete);
				SaveArray['Left'] = 'Closed';
				left_mc.play();
				
			}else{
				LeftClosed = false;
				LeftAnimating = true;
				left_mc.addEventListener(Event.COMPLETE, onLeftOpenComplete);
				SaveArray['Left'] = 'Open';
				left_mc.play();			
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray);
		}
		private function PlayVenusRight():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus;
			}
			
			if(RightClosed === false){
				RightClosed = true;
				RightAnimating = true;
				right_mc.addEventListener(Event.COMPLETE, onRightComplete);
				SaveArray['Right'] = 'Closed';
				right_mc.play();
				
			}else{
				RightClosed = false;
				RightAnimating = true;
				right_mc.addEventListener(Event.COMPLETE, onRightOpenComplete);
				SaveArray['Right'] = 'Open';
				right_mc.play();			
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray);
		}
		private function RightHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
			Starling.juggler.remove(delayCallRight);
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus;
			}
		
			if(RightClosed === false){
				RightClosed = true;
				RightAnimating = true;
				right_mc.addEventListener(Event.COMPLETE, onRightComplete);
				SaveArray['Right'] = 'Closed';
				right_mc.play();
				
			}else{
				RightClosed = false;
				RightAnimating = true;
				right_mc.addEventListener(Event.COMPLETE, onRightOpenComplete);
				SaveArray['Right'] = 'Open';
				right_mc.play();			
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray);
		}
		
		private function onRightComplete():void{
			Starling.juggler.remove(delayCallRight);
			trace('right_mc: '+right_mc.currentFrame);
			
			trace("SMART PLUG");
			right_mc.removeEventListener(Event.COMPLETE, onRightComplete);			
			right_mc.pause();			
			right_mc.reverse = true;							
		//	right_mc.stop();
			
		//	if(left_mc.isPlaying === false){
		//		if(big_mc.isPlaying === false){
			RightAnimating = false;
		//		}
		//	}
			
			
			
			if(RONum == 0){
				RONum = 1;
				delayCallRight.reset(PlayVenusRight,4);			
			}else if(RONum == 1){
				RONum = 2;
				delayCallRight.reset(PlayVenusRight,8);
			}else if(RONum == 2){
				RONum = 0;
				delayCallRight.reset(PlayVenusRight,2);
			}
			
			Starling.juggler.add(delayCallRight);
			
		}
		
		private function onRightOpenComplete():void{
			trace('right_mc: '+right_mc.currentFrame);			
			trace("bart PLUG");
			right_mc.removeEventListener(Event.COMPLETE, onRightOpenComplete);		
			right_mc.pause();		
			right_mc.reverse = false;	
		//	right_mc.stop();
	//	if(left_mc.isPlaying === false){
	//			if(big_mc.isPlaying === false){
			RightAnimating = false;
	//			}
	//		}
				
			
			
			if(RONum == 0){
				RONum = 1;
				delayCallRight.reset(PlayVenusRight,4);			
			}else if(RONum == 1){
				RONum = 2;
				delayCallRight.reset(PlayVenusRight,8);
			}else if(RONum == 2){
				RONum = 0;
				delayCallRight.reset(PlayVenusRight,2);
			}
			
			Starling.juggler.add(delayCallRight);
			
		}
		
		
		
		private function LeftHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
			Starling.juggler.remove(delayCallLeft);
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus;
			}
			
			if(LeftClosed === false){
				LeftClosed = true;
				LeftAnimating = true;
				SaveArray['Left'] = 'Closed';
				left_mc.addEventListener(Event.COMPLETE, onLeftComplete);
			
				left_mc.play();

			}else{
				LeftClosed = false;
				LeftAnimating = true;
				SaveArray['Left'] = 'Open';
				left_mc.addEventListener(Event.COMPLETE, onLeftOpenComplete);
			
				left_mc.play();			
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray);
		}
		
		private function onLeftComplete():void{
			trace('left_mc: '+left_mc.currentFrame);
			
			trace("SMART PLUG");
			left_mc.removeEventListener(Event.COMPLETE, onLeftComplete);			
			left_mc.pause();	
		//	left_mc.stop();	
			left_mc.reverse = true;	
							
		//	if(right_mc.isPlaying === false){
		//		if(big_mc.isPlaying === false){
			LeftAnimating = false;
		//		}
		//	}
			
			
			
			if(RONum == 0){
				RONum = 1;
				delayCallLeft.reset(PlayVenusLeft,4);			
			}else if(RONum == 1){
				RONum = 2;
				delayCallLeft.reset(PlayVenusLeft,8);
			}else if(RONum == 2){
				RONum = 0;
				delayCallLeft.reset(PlayVenusLeft,2);
			}
			
			Starling.juggler.add(delayCallLeft);
		}
	
		private function onLeftOpenComplete():void{
			trace('left_mc: '+left_mc.currentFrame);			
			trace("bart PLUG");
			left_mc.removeEventListener(Event.COMPLETE, onLeftOpenComplete);		
			left_mc.pause();		
		//	left_mc.stop();
			left_mc.reverse = false;	
			
			
		//	if(right_mc.isPlaying === false){
		//		if(big_mc.isPlaying === false){
			LeftAnimating = false;
		//		}
		//	}
			if(RONum == 0){
				RONum = 1;
				delayCallLeft.reset(PlayVenusLeft,4);			
			}else if(RONum == 1){
				RONum = 2;
				delayCallLeft.reset(PlayVenusLeft,8);
			}else if(RONum == 2){
				RONum = 0;
				delayCallLeft.reset(PlayVenusLeft,2);
			}
		
			Starling.juggler.add(delayCallLeft);
			
		//	(stage.getChildAt(0) as Object).AmbientObj.LoadHorrorBreath(true,4);
		//	Starling.juggler.delayCall(function():void{	
				(stage.getChildAt(0) as Object).AmbientObj.LoadSlipperyPlants(true,999);					
		//	},0.5);
		}
		
		
		private function MouthHandler():void{
			
			Starling.juggler.remove(delayCallBig);
			
			if(MetalAttached === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Metal)
					
				{
					if(MouthClosed === false){
						
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakThree();
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus;
						}
						SaveArray['MetalAttached'] = 'Yes';
						SaveArray['Mouth'] = 'Open';
						MetalAttached = true;
						metal.alpha = 1;
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray);
						
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_Metal,
								"item_Metal"
							);
						
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus;
						}
						MouthClosed = false;
						MouthAnimating = true;
						big_mc.addEventListener(Event.COMPLETE, onMouthOpenComplete);
						
					
						SaveArray['Mouth'] = 'Open';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray);
						
						disc_mc.play();
						big_mc.play();
					}
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_CoffeePotFull)
					
				{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I don't think biochemical waste will improve this situation...");
					
				}else{					
					if(MouthClosed === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus;
						}
						SaveArray['Mouth'] = 'Closed';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray);
						
						MouthClosed = true;
						MouthAnimating = true;
						big_mc.addEventListener(Event.COMPLETE, onMouthComplete);
						//	big_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onMouthOpenEnterFrame);
						
						disc_mc.play();
						big_mc.play();
						
						
						if(RONum == 0){
							RONum = 1;
						//	(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It closes its mouth as soon as I try to reach for the disc !.");				
						}else if(RONum == 1){
							RONum = 2;
					//		(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Ah... hmm, I need to try and keep my appendages.");							
						}else if(RONum == 2){
							RONum = 0;
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I won't be able to get the disc so long as it keeps closing.");
							
						}
						
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus;
						}
						SaveArray['Mouth'] = 'Open';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray);
						
						
						MouthClosed = false;
						MouthAnimating = true;
						big_mc.addEventListener(Event.COMPLETE, onMouthOpenComplete);
						
						//	big_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onMouthOpenEnterFrame);
						
						disc_mc.play();
						big_mc.play();
						//	Starling.juggler.add(disc_mc);
						//	Starling.juggler.add(big_mc);
					}
				}			
			}else{
				if(DiscPickedUp === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					DiscPickedUp = true;
					disc_mc.alpha = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_KomaDial,
						'item_KomaDial',
						'inven_komaDial_sm'
					);
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus;
					}
					SaveArray['Disc'] = 'PickedUp';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray);
					
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The piece of metal is preventing the plant from closing its mouth.");
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'd better not try to touch... it still could be dangerous.");
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The piece of metal has wedged the mouth of the plant open.");
					}
				}
			}
		}
		
		private function onMouthComplete():void{
			trace('big_mc: '+big_mc.currentFrame);
		
				trace("SMART PLUG");
				big_mc.removeEventListener(Event.COMPLETE, onMouthComplete);
			
				big_mc.pause();
				disc_mc.pause();
				
			//	disc_mc.alpha = 0;
				big_mc.reverse = true;
				disc_mc.reverse = true;	
				big_mc.stop();
				disc_mc.stop();
				
		//		if(right_mc.isPlaying === false){
		//			if(left_mc.isPlaying === false){
						MouthAnimating = false;
			//		}
			//	}
				
				if(RONum == 0){
					RONum = 1;
					delayCallBig.reset(PlayVenusBig,4);			
				}else if(RONum == 1){
					RONum = 2;
					delayCallBig.reset(PlayVenusBig,8);
				}else if(RONum == 2){
					RONum = 0;
					delayCallBig.reset(PlayVenusBig,2);
				}
				
				Starling.juggler.add(delayCallBig);
		}
		
		private function onMouthOpenComplete():void{
			trace('big_mc: '+big_mc.currentFrame);
		
			trace("bart PLUG");
			big_mc.removeEventListener(Event.COMPLETE, onMouthOpenComplete);
			
			big_mc.pause();		
			disc_mc.pause();
			
			big_mc.reverse = false;
			disc_mc.reverse = false;	
			big_mc.stop();
			disc_mc.stop();
			
		//	if(right_mc.isPlaying === false){
		//		if(left_mc.isPlaying === false){
			MouthAnimating = false;
		//		}
		//	}
			
			if(RONum == 0){
				RONum = 1;
				delayCallBig.reset(PlayVenusBig,4);			
			}else if(RONum == 1){
				RONum = 2;
				delayCallBig.reset(PlayVenusBig,8);
			}else if(RONum == 2){
				RONum = 0;
				delayCallBig.reset(PlayVenusBig,2);
			}
			
			Starling.juggler.add(delayCallBig);
		
		}
		private function FadeOut(loadClass:Class,loadObj:Object,Fade:Boolean = false):void{
			
			trace("FADE OUT");
			
			this.removeEventListener(TouchEvent.TOUCH,TouchHandler);
			left_mc.removeEventListener(Event.COMPLETE, onLeftComplete);		
			right_mc.removeEventListener(Event.COMPLETE, onRightComplete);		
			big_mc.removeEventListener(Event.COMPLETE, onMouthComplete);		
			
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
			Starling.juggler.remove(delayCallRight);
			Starling.juggler.remove(delayCallLeft);
			Starling.juggler.remove(delayCallBig);
			
			
			this.assets.removeTexture("greenHouseVenus_bg",true);
		//	this.assets.removeTexture("GreenHouseVenus_Sprite_01",true);
		//	this.assets.removeTextureAtlas("GreenHouseVenus_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("greenHouseVenus_01");
		//	(stage.getChildAt(0) as Object).falseAsset("greenHouseVenus_02");
		//	(stage.getChildAt(0) as Object).falseAsset("greenHouseVenus_03");
			
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
