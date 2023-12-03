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
	
	public class SecondFloorHall extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		public var SaveArray2:Array = new Array();
		public var SaveArray3:Array = new Array();
		
		private var bg:Image;
		
		private var serverdoor:Image;
		private var slime:Image;
		private var eyeglasses:Image;
		private var stick:Image;
		private var paperTowels:Image;
		private var spraycan:Image;
		private var door_left:Image;
		private var door_right:Image;
		private var chains:Image;
		private var lock:Image;
		private var lobby_door:Image;
		private var elevator_mc:MovieClip;
		private var elevator_close_mc:MovieClip;
		
		private var delayedCall:DelayedCall;
		
		private var hit_elevator_door:Shape;
		private var hit_dirLock:Shape;
		private var hit_bathroom_door:Shape;
		private var hit_table:Shape;
		private var hit_cart:Shape;
		private var hit_door_left:Shape;
		private var hit_door_right:Shape;
		private var hit_window:Shape;
		
		private var RONum:int = 0;
		
		private var DoorLeftOpen:Boolean = false;
		private var DoorRightOpen:Boolean = false;
		private var DoorUnlocked:Boolean = false;
		private var ChainsPickedUp:Boolean = false;
		private var ElevatorOpen:Boolean = false
		private var ElevatorUnlocked:Boolean = false
		private var Animating:Boolean = false;
		private var ElevatorWorking:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		
		public function SecondFloorHall(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('secondFloorHall_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/SecondFloorHall/secondFloorHall_bg.jpg'));
				game.TrackAssets('secondFloorHall_01');
			}
			if(game.CheckAsset('secondFloorHall_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/SecondFloorHall/SecondFloorHall_Sprite_01.png'));
				game.TrackAssets('secondFloorHall_02');
			}
			if(game.CheckAsset('secondFloorHall_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/SecondFloorHall/SecondFloorHall_Sprite_01.xml'));
				game.TrackAssets('secondFloorHall_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("SecondFloorHall","SecondFloorHallObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('secondFloorHall_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			/*
			private var eyeglasses:Image;
			private var stick:Image;
			private var paperTowels:Image;
			private var spraycan:Image;
			private var door_left:Image;
			private var door_right:Image;
			private var chains:Image;
			private var lock:Image;
			private var lobby_door:Image;
			private var elevator:MovieClip;
			*/
			elevator_mc = new MovieClip(this.assets.getTextures('elevator_door_frame_0'),12);
			//	elevator_mc.smoothing = TextureSmoothing.NONE;
			elevator_mc.x = 708;
			elevator_mc.y = 28;
			elevator_mc.touchable = false;
			elevator_mc.loop = false; 
			//	elevator_mc.play();

			elevator_close_mc = new MovieClip(this.assets.getTextures('elevator_door_frame_0').reverse(),12);
			//elevator_mc.smoothing = TextureSmoothing.NONE;
			elevator_close_mc.x = 708;
			elevator_close_mc.y = 28;
			elevator_close_mc.touchable = false;
			elevator_close_mc.loop = false; 
			
			serverdoor = new Image(this.assets.getTexture('office_server_door_closed'));
			serverdoor.x = 453;
			serverdoor.y = 157;			
			serverdoor.touchable = false;
			
			door_right = new Image(this.assets.getTexture('door_right_closed'));
			door_right.x = 478;
			door_right.y = 110;			
			door_right.touchable = false;
			
			door_left = new Image(this.assets.getTexture('door_left_closed'));
			door_left.x = 398;
			door_left.y = 111;
			door_left.touchable = false;
			
			chains = new Image(this.assets.getTexture('chains'));
			chains.x = 448;
			chains.y = 188;
			chains.touchable = false;
			
			lock = new Image(this.assets.getTexture('lock_empty'));
			lock.x = 468;
			lock.y = 211;
			lock.touchable = false;
			
			lobby_door = new Image(this.assets.getTexture('lobby_first_office_door_closed'));
			lobby_door.x = 52;
			lobby_door.y = 359;
			lobby_door.touchable = false;
			
			slime = new Image(this.assets.getTexture('detail_slime'));
			slime.x = 328;
			slime.y = 375;
			slime.touchable = false;
			
			eyeglasses = new Image(this.assets.getTexture('cart_glasses'));
			eyeglasses.x = 393;
			eyeglasses.y = 409;
			eyeglasses.touchable = false;
			
			spraycan = new Image(this.assets.getTexture('cart_spray_can'));
			spraycan.x = 442;
			spraycan.y = 347;
			spraycan.touchable = false;
			
			stick = new Image(this.assets.getTexture('cart_stick'));
			stick.x = 381;
			stick.y = 357;
			stick.touchable = false;
			
			paperTowels = new Image(this.assets.getTexture('cart_paper_towel'));
			paperTowels.x = 334;
			paperTowels.y = 230;
			paperTowels.touchable = false;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['elevator'] == 'Yes'){
					ElevatorUnlocked = true;
				}
			}
				
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock != undefined){
				trace("BARK 1");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['KnobAttached'] == 'Yes'){
					lock.texture = this.assets.getTexture('lock');
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['Solved'] == 'Yes'){
					trace("BARK 2");
					DoorUnlocked = true;
					lock.alpha = 0;		
				}else{
					door_left.alpha = 1;
					door_right.alpha = 1;
					chains.alpha = 1;
					lock.alpha = 1;
				}
			}else{
				door_left.alpha = 1;
				door_right.alpha = 1;
				chains.alpha = 1;
				lock.alpha = 1;
			}
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
				trace("HIPPY 02");
		/*		if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall['FirstTime'] == 'Yes'){
					trace("NOOF");
				}else{
					//if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall;
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorHall',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SurpriseOne();
						
					},1);
					//	}
				}
			*/
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall['ComingFromElevator'] == 'Yes'){
					trace("HIPPY 00");
					elevator_mc.alpha = 0;
					elevator_close_mc.alpha = 1;
					
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall;
					
					
					SaveArray['ComingFromElevator'] = 'No';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorHall',SaveArray);
					Animating = true;
					ElevatorOpen = false;
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorClose();
						trace('ANGER');
						
						
						elevator_close_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onElevatorCloseEnterFrame);
						elevator_close_mc.alpha = 1;
						
						elevator_close_mc.play();
						Starling.juggler.add(elevator_close_mc);
						//	Starling.juggler.add(elevator_mc);
					},1.25);
				}else{
					trace("HIPPY 01");
					elevator_mc.alpha = 1;
					elevator_close_mc.alpha = 0;
				}
				if(DoorUnlocked === true){
				trace("BARK 3");
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall['chains'] == 'PickedUp'){
						trace("BARK 4");
						chains.alpha = 0;
						ChainsPickedUp = true;
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall['door_left'] == 'open'){
							trace("BARK 5");
							door_left.alpha = 0;
							DoorLeftOpen = true;
							
						}else{
							trace("BARK 6");
							door_left.alpha = 1;
							chains.alpha = 0;
							lock.alpha= 0;
							Animating = true;
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
								SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall;
							}
							SaveArray['chains'] = "PickedUp";
							SaveArray['door_left'] = "open";
					/*		if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
								SaveArray['FirstTime'] = 'Yes';
								
								Starling.juggler.delayCall(function():void{
									(stage.getChildAt(0) as Object).MusicObj.LoadMouseTrap(true,3);
									
								},0.5);
							}
						*/
							
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorHall',SaveArray);
							
							
							delayedCall = new DelayedCall(function():void{									
								OpenDoorLeft();
								
							}, 2);
							Starling.juggler.add(delayedCall);		
							
							
						}
					}else{
						chains.alpha = 1;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall['door_right'] == 'open'){
						trace("BARK 7");
						door_right.alpha = 0;
						DoorRightOpen = true;
						
					}else{
						trace("BARK 8");
						door_right.alpha = 1;
					}
				}
				
				

			}else{
				elevator_mc.alpha = 1;
				elevator_close_mc.alpha = 0;
				chains.alpha = 1;
				ChainsPickedUp = true;
				door_left.alpha = 1;
				door_right.alpha = 1;
				
			
				
				
				if(DoorUnlocked === true){
					Animating = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall;
					}
					SaveArray['chains'] = "PickedUp";
					SaveArray['door_left'] = "open";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorHall',SaveArray);
					
					chains.alpha = 0;
					lock.alpha = 0;
					
					delayedCall = new DelayedCall(function():void{									
						OpenDoorLeft();
						
					}, 2);
					Starling.juggler.add(delayedCall);		
					
					
						
					
				
				}
			
			}
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['SlimeCleaned'] == 'Yes'){
					slime.alpha = 0;
					eyeglasses.texture = this.assets.getTexture('cart_glasses_no_slime');
				}else{
					slime.alpha = 1;
				}
			}else{
				slime.alpha = 1;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart['paperTowels'] == 'PickedUp'){
					paperTowels.alpha = 0;
				}else{
					paperTowels.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart['stick'] == 'PickedUp'){
					stick.alpha = 0;
				}else{
					stick.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart['eyeglasses'] == 'PickedUp'){
					eyeglasses.alpha = 0;
				}else{
					eyeglasses.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorCart['spraycan'] == 'PickedUp'){
					spraycan.alpha = 0;
				}else{
					spraycan.alpha = 1;
				}
				
			}else{
				eyeglasses.alpha = 1;
				spraycan.alpha = 1;
				stick.alpha = 1;
				paperTowels.alpha = 1;
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby['OfficeDoor'] == 'open'){
					lobby_door.alpha = 0;
				}else{
					lobby_door.alpha = 1;
				}
				
			}else{
				lobby_door.alpha = 1;
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Solved'] == 'Yes'){
					ElevatorWorking = true;
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['Door'] == 'Open'){	
					serverdoor.alpha = 1;
				}else{
					serverdoor.alpha = 0;
				}
			}else{
				serverdoor.alpha = 0;
			}
			
		//	door_left.alpha = 1;
		//	door_right.alpha = 1;
		//	chains.alpha = 1;
		//	lock.alpha = 1;
			
		
			
			
			this.addChildAt(elevator_mc,1);	
			this.addChildAt(serverdoor,2);	
			this.addChildAt(elevator_close_mc,3);	
			this.addChildAt(door_right,4);
			this.addChildAt(door_left,5);	
			this.addChildAt(chains,6);	
			this.addChildAt(lock,7);	
			this.addChildAt(lobby_door,8);	
			this.addChildAt(slime,9);	
			this.addChildAt(eyeglasses,10);	
			this.addChildAt(spraycan,11);	
			this.addChildAt(stick,12);	
			this.addChildAt(paperTowels,13);	
				
			
			CreateDoorHits();
			CreateCartHit();
			CreateElevatorDoorHit();
			CreateBathroomHit();
			CreateCorridorHit();
			CreateTableHit();
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadBuildingHum(true,999);
		//	(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
		//	(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall;
					}
					SaveArray['FirstTime'] = 'Yes';
					
					Starling.juggler.delayCall(function():void{
						if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
							(stage.getChildAt(0) as Object).MusicObj.LoadMacLeodOne(true,2);
						}
					},0.5);
				}
			}else{
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall;
					}
					SaveArray['FirstTime'] = 'Yes';
					
					Starling.juggler.delayCall(function():void{
						if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
							(stage.getChildAt(0) as Object).MusicObj.LoadMacLeodOne(true,2);
						}
						
					},0.5);
				}
			}
				
			
		}
		private function OpenDoorLeft():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CreakyDoorTwo();
			
			chains.alpha = 0;
			lock.alpha = 0;
			Animating = false;
			door_left.alpha = 0;
			DoorLeftOpen = true;
			
			
		}
		
		//hit_cart
		
		
		//hit_table
		private function CreateDoorHits():void{
			hit_door_left = new Shape();
			hit_door_left.touchable = false;
			hit_door_left.graphics.beginFill(0xff0000);
			
			hit_door_left.graphics.lineTo(398,109);	
			hit_door_left.graphics.lineTo(477,108);	
			hit_door_left.graphics.lineTo(476,306);	
			hit_door_left.graphics.lineTo(397,304);	
			
			hit_door_left.graphics.endFill(false);
			hit_door_left.alpha = 0.0;
			
			hit_door_left.graphics.precisionHitTest = true;	
			this.addChild(hit_door_left);
			
			hit_door_right = new Shape();
			hit_door_right.touchable = false;
			hit_door_right.graphics.beginFill(0xff0000);
			
			hit_door_right.graphics.lineTo(477,109);	
			hit_door_right.graphics.lineTo(561,107);	
			hit_door_right.graphics.lineTo(558,306);	
			hit_door_right.graphics.lineTo(475,305);	
		
			hit_door_right.graphics.endFill(false);
			hit_door_right.alpha = 0.0;
			
			hit_door_right.graphics.precisionHitTest = true;	
			this.addChild(hit_door_right);
		}
		
		
		
		private function CreateCartHit():void{
			hit_cart = new Shape();
			hit_cart.touchable = false;
			hit_cart.graphics.beginFill(0xff0000);
			
			hit_cart.graphics.lineTo(198,272);	
			hit_cart.graphics.lineTo(288,212);	
			hit_cart.graphics.lineTo(386,233);	
			hit_cart.graphics.lineTo(406,321);	
			hit_cart.graphics.lineTo(546,330);	
			hit_cart.graphics.lineTo(571,236);	
			hit_cart.graphics.lineTo(615,243);	
			hit_cart.graphics.lineTo(652,367);	
			hit_cart.graphics.lineTo(593,488);	
			hit_cart.graphics.lineTo(321,470);	
			hit_cart.graphics.lineTo(201,433);	
			
			
			hit_cart.graphics.endFill(false);
			hit_cart.alpha = 0.0;
			
			hit_cart.graphics.precisionHitTest = true;	
			this.addChild(hit_cart);
		}
		
		private function CreateTableHit():void{
			hit_table = new Shape();
			hit_table.touchable = false;
			hit_table.graphics.beginFill(0xff0000);
			
			hit_table.graphics.lineTo(0,110);	
			hit_table.graphics.lineTo(105,234);	
			hit_table.graphics.lineTo(143,236);	
			hit_table.graphics.lineTo(153,458);	
			hit_table.graphics.lineTo(89,508);	
			hit_table.graphics.lineTo(0,508);	
			
			
			hit_table.graphics.endFill(false);
			hit_table.alpha = 0.0;
			
			hit_table.graphics.precisionHitTest = true;	
			this.addChild(hit_table);
		}
		
		private function CreateBathroomHit():void{
			hit_bathroom_door = new Shape();
			hit_bathroom_door.touchable = false;
			hit_bathroom_door.graphics.beginFill(0xff0000);
			
			hit_bathroom_door.graphics.lineTo(617,58);	
			hit_bathroom_door.graphics.lineTo(671,7);	
			hit_bathroom_door.graphics.lineTo(695,17);	
			hit_bathroom_door.graphics.lineTo(683,274);	
			hit_bathroom_door.graphics.lineTo(614,240);	
			
			hit_bathroom_door.graphics.endFill(false);
			hit_bathroom_door.alpha = 0.0;
			
			hit_bathroom_door.graphics.precisionHitTest = true;	
			this.addChild(hit_bathroom_door);
		}
		
		private function CreateCorridorHit():void{
			hit_dirLock = new Shape();
			hit_dirLock.touchable = false;
			hit_dirLock.graphics.beginFill(0xff0000);
			
			hit_dirLock.graphics.lineTo(450,184);	
			hit_dirLock.graphics.lineTo(505,186);	
			hit_dirLock.graphics.lineTo(506,254);	
			hit_dirLock.graphics.lineTo(447,252);	
		
			hit_dirLock.graphics.endFill(false);
			hit_dirLock.alpha = 0.0;
			
			hit_dirLock.graphics.precisionHitTest = true;	
			this.addChild(hit_dirLock);
		}
		
		private function CreateElevatorDoorHit():void{
			hit_elevator_door = new Shape();
			hit_elevator_door.touchable = false;
			hit_elevator_door.graphics.beginFill(0xff0000);
			
			hit_elevator_door.graphics.lineTo(702,65);	
			hit_elevator_door.graphics.lineTo(790,12);	
			hit_elevator_door.graphics.lineTo(778,390);	
			hit_elevator_door.graphics.lineTo(714,400);	
			hit_elevator_door.graphics.lineTo(701,383);	
			
			hit_elevator_door.graphics.endFill(false);
			hit_elevator_door.alpha = 0.0;
			
			hit_elevator_door.graphics.precisionHitTest = true;	
			this.addChild(hit_elevator_door);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(hit_elevator_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ElevatorHandler();
						}else if(hit_dirLock.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DirLockHandler(e);
							
						}else if(hit_door_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DoorLeftHandler();
						}else if(hit_door_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
							DoorRightHandler();
						}else if(hit_cart.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((SecondFloorCart as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.SecondFloorCartObj,true
							);
						}else if(hit_table.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Steps();
							
							FadeOut((Lobby as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyObj,true
							);
						}else if(hit_bathroom_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((SecondFloorPainting as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.SecondFloorPaintingObj,true
							);
						}
					
					}
				
				}
			}
		}
		
		private function DoorLeftHandler():void{
			if(DoorLeftOpen === true){
				trace("Go to Office");
				FadeOut((Office as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeObj,true
				);
			}else{
				if(DoorUnlocked === true){
					if(ChainsPickedUp === false){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The chains must be removed from the door handles before it'll open.");
	
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.SFX_CreakyDoorTwo();
						door_left.alpha = 0;
						DoorLeftOpen = true;
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall;
						}
						SaveArray['door_left'] = "open";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorHall',SaveArray);
					}
				}else{
					LockedDoorHandler();
				}
			}
		}
		
		private function DoorRightHandler():void{
			if(DoorRightOpen === true){
				trace("Go to Office");
				FadeOut((Office as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeObj,true
				);
			}else{
				if(DoorUnlocked === true){
					if(ChainsPickedUp === false){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The chains must be removed from the door handles before it'll open.");
						
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CreakyDoorTwo();
						door_right.alpha = 0;
						DoorRightOpen = true;
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall;
						}
						SaveArray['door_right'] = "open";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorHall',SaveArray);
						
					}
				}else{
					LockedDoorHandler();

					
				}
			}
		}
		private function LockedDoorHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedDoor();
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The doors are chained shut. I can't open them.");				
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've got to remove the lock and chain if I'm going to get this door open.");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The doors are chained shut. I can't force them open.");
				
			}
		}
		private function DirLockHandler(e:Event):void{
			trace("ALPHA");
			if(DoorUnlocked === false){
				trace("BETA");
				FadeOut((DirLock as Class), 
							(stage.getChildAt(0) as Object).screenGamePlayHandler.DirLockObj,true
						);
			}else{
				trace("CAPPA");
				if(ChainsPickedUp === false){
					trace("DELTA");
					ChainHandler();
				}else{
					trace("EPSILON");
					if(hit_door_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						DoorLeftHandler();
					}else if(hit_door_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
						DoorRightHandler();
					}
					
				}
			}
				/*
				private var DoorUnlocked:Boolean = false;
				private var ChainPickedUp:Boolean = false;
				*/
		}
		
		private function ChainHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall['chains'] == 'PickedUp'){
					trace('Chain is picked Up');
				}else{
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_StoneDrag();
					chains.alpha = 0;
					ChainsPickedUp = true;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall;
					}
					SaveArray['chains'] = "PickedUp";
			//		(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorHall',SaveArray);
					
			//		(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
			//			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Chains,
			//			'item_Chains',
			//			'inven_chains_sm'
			//		);	
				}
			}else{
				chains.alpha = 0;
				ChainsPickedUp = true;
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SecondFloorHall;
				}
				SaveArray['chains'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SecondFloorHall',SaveArray);
				
		//		(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
		//			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Chains,
		//			'item_Chains',
		//			'inven_chains_sm'
		//		);	
			}
		}
		
		private function ElevatorHandler():void{
			if(ElevatorWorking === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorBeepsAccessDenied();
				if(ElevatorUnlocked === false){
					
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The elevator doors won't open...");			
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The elevator does not appear to be working.");				
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmm... the elevator is currently offline. Maybe I can get it back on.");
						
					}
				}else{
					
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... the elevator still does not respond on this floor.");				
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't open those doors manually.");				
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("More to do before the elevator works properly.");
						
					}
				}
				
			}else{
				if(ElevatorOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorOpen();
					ElevatorOpen = true;
					Animating = true;
					elevator_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onElevatorEnterFrame);
					
					elevator_mc.play();
					Starling.juggler.add(elevator_mc);
				}else{
					//Starling.juggler.remove(elevator_close_mc);
					Starling.juggler.remove(delayedCall);
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel != undefined){
						SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel;
					}
					SaveArray2['Floor'] = 2;
					SaveArray2['PrevFloor'] = 2;
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElevatorPanel',SaveArray2);
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator != undefined){
						
						SaveArray3 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Elevator;
					}
					SaveArray3['ComingFrom'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Elevator',SaveArray3);
					
					FadeOut((Elevator as Class), 
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ElevatorObj,true
					);
				}
			}

		}
		
		private function onElevatorEnterFrame():void{
			trace('FIRE ON FRAME');
			if(elevator_mc.currentFrame == 3){
				trace('FRAME THREE');
				elevator_mc.alpha = 0;
				
				elevator_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onElevatorEnterFrame);
				elevator_mc.stop();
				Animating = false;
				
				delayedCall = new DelayedCall(CloseElevator,4);
				
				Starling.juggler.add(delayedCall);
				
			//	Starling.juggler.delayCall(function():void{
					
					//	Starling.juggler.add(elevator_mc);
			//	},4);
				
			}
		}
		private function CloseElevator():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorClose();
			
			trace('ANGER');
			Animating = true;
			ElevatorOpen = false;
			elevator_close_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, onElevatorCloseEnterFrame);
			elevator_close_mc.alpha = 1;
			
			elevator_close_mc.play();
			Starling.juggler.add(elevator_close_mc);
			
		}
		
		private function onElevatorCloseEnterFrame():void{
			trace("E CLOSE ENTER FRAME");
			if(elevator_close_mc.currentFrame == 3){
				trace('close frame 3');
				elevator_mc.alpha = 1;
				elevator_close_mc.alpha = 0;
				
				elevator_close_mc.removeEventListener(EnterFrameEvent.ENTER_FRAME, onElevatorCloseEnterFrame);
				elevator_close_mc.stop();
				Animating = false;
			}
			if(elevator_close_mc.currentFrame == 4){
				trace('close frame 4');
			}
		}
		
		
		private function FadeOut(loadClass:Class,loadObj:Object,Fade:Boolean = false):void{
			trace("FADE OUT");
			this.removeEventListener(TouchEvent.TOUCH,TouchHandler);
			Starling.juggler.remove(delayedCall);
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
			
			
			
			this.assets.removeTexture("secondFloorHall_bg",true);
			this.assets.removeTexture("SecondFloorHall_Sprite_01",true);
			
			this.assets.removeTextureAtlas("SecondFloorHall_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("secondFloorHall_01");
			(stage.getChildAt(0) as Object).falseAsset("secondFloorHall_02");
			(stage.getChildAt(0) as Object).falseAsset("secondFloorHall_03");
			
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
