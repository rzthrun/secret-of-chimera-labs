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
	
	public class LobbyComputer extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var knub_entrance:Image;
		private var knub_elevator:Image;
		private var knub_door:Image;
		
		private var hightlight_entrance:Image;
		private var hightlight_elevator:Image;
		private var hightlight_door:Image;		
		
		private var picture:Image;
		private var lock:Image;
		private var text_lock:Image;
		private var text_status:Image;
		private var text_notes:Image;
		
		private var hit_entrance:Shape;
		private var hit_elevator:Shape;
		private var hit_door:Shape;
		private var hit_lock:Shape;
		private var hit_picture:Shape;
		
		private var Animating:Boolean = false;
				
		private var RONum:Boolean = false;
		
		private var currentPage:String = 'entrance';
		private var ElevatorUnlocked:Boolean = false;
		private var ElevatorFunctioning:Boolean = false;
		private var DoorUnlocked:Boolean = false;
		private var DoorOpen:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function LobbyComputer(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('lobbyComputer_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyComputer/lobbyComputer_bg.jpg'));
				game.TrackAssets('lobbyComputer_01');
			}
			if(game.CheckAsset('lobbyComputer_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyComputer/LobbyComputer_Sprite_01.png'));
				game.TrackAssets('lobbyComputer_02');
			}
			if(game.CheckAsset('lobbyComputer_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LobbyComputer/LobbyComputer_Sprite_01.xml'));
				game.TrackAssets('lobbyComputer_03');
			}
		
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("LobbyComputer","LobbyComputerObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		
		
		private function onLoadAssets():void{
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyComputer',SaveArray);
			bg = new Image(this.assets.getTexture('lobbyComputer_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			knub_entrance = new Image(this.assets.getTexture('knub_00'));
			knub_entrance.x = 268;
			knub_entrance.y = 157;
			knub_entrance.touchable = false;
			
			knub_elevator = new Image(this.assets.getTexture('knub_01'));
			knub_elevator.x = 268;
			knub_elevator.y = 235;
			knub_elevator.touchable = false;
			
			knub_door = new Image(this.assets.getTexture('knub_02'));
			knub_door.x = 268;
			knub_door.y = 314;
			knub_door.touchable = false;
			
			hightlight_entrance = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_entrance.x = 28;
			hightlight_entrance.y = 157;
			hightlight_entrance.touchable = false;
			
			hightlight_elevator = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_elevator.x = 28;
			hightlight_elevator.y = 235;
			hightlight_elevator.touchable = false;
			
			hightlight_door = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_door.x = 28;
			hightlight_door.y = 313;
			hightlight_door.touchable = false;
			
			picture = new Image(this.assets.getTexture('pic_entence'));
			picture.x = 468;
			picture.y = 70;
			picture.touchable = false;
			
			lock = new Image(this.assets.getTexture('lock_open'));
			lock.x = 326;
			lock.y = 76;
			lock.touchable = false;
			
			text_lock =  new Image(this.assets.getTexture('text_lockUnlock'));
			text_lock.x = 320;
			text_lock.y = 273;
			text_lock.touchable = false;
			
			text_status =  new Image(this.assets.getTexture('text_status_un'));
			text_status.x = 320;
			text_status.y = 316;
			text_status.touchable = false;
			
			text_notes =  new Image(this.assets.getTexture('text_notes_entrence'));
			text_notes.x = 320;
			text_notes.y = 384;
			text_notes.touchable = false;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Solved'] == 'Yes'){
					ElevatorFunctioning = true;
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby['OfficeDoor'] == 'open'){
					DoorOpen = true;
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer != undefined){
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['mgnt'] == 'Yes'){
					DoorUnlocked = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['elevator'] == 'Yes'){
					ElevatorUnlocked = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['currentPage'] == 'entrance'){
					currentPage = 'entrance';
					knub_entrance.alpha = 1;
					knub_elevator.alpha = 0;
					knub_door.alpha = 0;			
					hightlight_entrance.alpha = 1;
					hightlight_elevator.alpha = 0;
					hightlight_door.alpha = 0;
					picture.texture =  this.assets.getTexture('pic_entence');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['currentPage'] == 'elevator'){
					currentPage = 'elevator';
					knub_entrance.alpha = 0;
					knub_elevator.alpha = 1;
					knub_door.alpha = 0;			
					hightlight_entrance.alpha = 0;
					hightlight_elevator.alpha = 1;
					hightlight_door.alpha = 0;
					picture.texture = this.assets.getTexture('pic_elevator');
					
					if(ElevatorUnlocked === true){
						lock.texture = this.assets.getTexture('lock_open');
						text_lock.texture = this.assets.getTexture('text_lockUnlock');
						if(ElevatorFunctioning === true){
							text_status.texture = this.assets.getTexture('text_status_un');
							text_notes.texture = this.assets.getTexture('text_notes_elevator_on');
						}else{
							text_status.texture = this.assets.getTexture('text_status_ui');
							text_notes.texture = this.assets.getTexture('text_notes_elevator_off');
						}
						
					}else{
						lock.texture = this.assets.getTexture('lock_closed');
						text_lock.texture = this.assets.getTexture('text_lockLock');
						
						text_status.texture = this.assets.getTexture('text_status_li');
						text_notes.texture = this.assets.getTexture('text_notes_elevator_off');
					}
					
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer['currentPage'] == 'door'){
					currentPage = 'door';
					
					knub_entrance.alpha = 0;
					knub_elevator.alpha = 0;
					knub_door.alpha = 1;			
					hightlight_entrance.alpha = 0;
					hightlight_elevator.alpha = 0;
					hightlight_door.alpha = 1;
					if(DoorUnlocked === true){
						lock.texture = this.assets.getTexture('lock_open');
						text_lock.texture = this.assets.getTexture('text_lockUnlock');
						text_notes.texture = this.assets.getTexture('text_notes_door');
						text_status.texture = this.assets.getTexture('text_status_un');
						if(DoorOpen === true){
							picture.texture = this.assets.getTexture('pic_door_open');
						}else{
							picture.texture = this.assets.getTexture('pic_door_closed');
						}
					}else{
						lock.texture = this.assets.getTexture('lock_closed');
						text_lock.texture = this.assets.getTexture('text_lockLock');
						text_notes.texture = this.assets.getTexture('text_notes_door');
						text_status.texture = this.assets.getTexture('text_status_ln');
						picture.texture = this.assets.getTexture('pic_door_closed');
					}
				}else{
					knub_entrance.alpha = 1;
					knub_elevator.alpha = 0;
					knub_door.alpha = 0;			
					hightlight_entrance.alpha = 1;
					hightlight_elevator.alpha = 0;
					hightlight_door.alpha = 0;
				}
			}else{
				
				knub_entrance.alpha = 1;
				knub_elevator.alpha = 0;
				knub_door.alpha = 0;			
				hightlight_entrance.alpha = 1;
				hightlight_elevator.alpha = 0;
				hightlight_door.alpha = 0;
				
			}
			
		
			
			picture.alpha = 1;
			lock.alpha = 1;
			text_lock.alpha = 1;
			text_status.alpha = 1;
			text_notes.alpha = 1;
			
			this.addChildAt(knub_entrance,1);
			this.addChildAt(knub_elevator,2);
			this.addChildAt(knub_door,3);
			this.addChildAt(hightlight_entrance,4);
			this.addChildAt(hightlight_elevator,5);
			this.addChildAt(hightlight_door,6);
			this.addChildAt(picture,7);
			this.addChildAt(lock,8);
			this.addChildAt(text_lock,9);
			this.addChildAt(text_status,10);
			this.addChildAt(text_notes,11);
			
			CreateButtonHits();
			CreatePictureHit();
			CreateLockHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		/*
		private var hit_entrance:Shape;
		private var hit_elevator:Shape;
		private var hit_door:Shape;
		private var hit_lock:Shape;
		private var hit_picture:Shape;
		
		*/
		private function CreateLockHit():void{
			
			hit_lock = new Shape();
			hit_lock.touchable = false;
			hit_lock.graphics.beginFill(0xff0000);
			
			hit_lock.graphics.lineTo(316,72);	
			hit_lock.graphics.lineTo(458,72);	
			hit_lock.graphics.lineTo(458,303);	
			hit_lock.graphics.lineTo(316,303);	
			
			hit_lock.graphics.endFill(false);
			hit_lock.alpha = 0.0;
			
			hit_lock.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_lock);
		}
		
		private function CreatePictureHit():void{
			
			hit_picture = new Shape();
			hit_picture.touchable = false;
			hit_picture.graphics.beginFill(0xff0000);
			
			hit_picture.graphics.lineTo(470,71);	
			hit_picture.graphics.lineTo(663,71);	
			hit_picture.graphics.lineTo(769,113);	
			hit_picture.graphics.lineTo(766,369);	
			hit_picture.graphics.lineTo(470,365);	
		
			
			hit_picture.graphics.endFill(false);
			hit_picture.alpha = 0.0;
			
			hit_picture.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_picture);
		}
		
		private function CreateButtonHits():void{
			hit_entrance = new Shape();
			hit_entrance.touchable = false;
			hit_entrance.graphics.beginFill(0xff0000);
			
			hit_entrance.graphics.lineTo(20,148);	
			hit_entrance.graphics.lineTo(271,148);	
			hit_entrance.graphics.lineTo(271,211);	
			hit_entrance.graphics.lineTo(20,211);	
		
			hit_entrance.graphics.endFill(false);
			hit_entrance.alpha = 0.0;
			
			hit_entrance.graphics.precisionHitTest = true;	
			
			hit_elevator = new Shape();
			hit_elevator.touchable = false;
			hit_elevator.graphics.beginFill(0xff0000);
			
			hit_elevator.graphics.lineTo(20,228);	
			hit_elevator.graphics.lineTo(271,228);	
			hit_elevator.graphics.lineTo(271,290);	
			hit_elevator.graphics.lineTo(20,290);	
			
			hit_elevator.graphics.endFill(false);
			hit_elevator.alpha = 0.0;
			
			hit_elevator.graphics.precisionHitTest = true;	
			
			hit_door = new Shape();
			hit_door.touchable = false;
			hit_door.graphics.beginFill(0xff0000);
			
			hit_door.graphics.lineTo(20,305);	
			hit_door.graphics.lineTo(271,305);	
			hit_door.graphics.lineTo(271,368);	
			hit_door.graphics.lineTo(20,368);	
			
			hit_door.graphics.endFill(false);
			hit_door.alpha = 0.0;
			
			hit_door.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_entrance);
			this.addChild(hit_elevator);
			this.addChild(hit_door);
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
							FadeOut((LobbyDesk as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LobbyDeskObj,true
							);
						}else if(hit_entrance.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							
							if(currentPage == 'entrance'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								EntranceHandler();
								currentPage = 'entrance';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer;
								}
								SaveArray['currentPage'] = 'entrance';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyComputer',SaveArray);
							}
						}else if(hit_elevator.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							
							if(currentPage == 'elevator'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								ElevatorHandler();
								currentPage = 'elevator';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer;
								}
								SaveArray['currentPage'] = 'elevator';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyComputer',SaveArray);
							}
						}else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'door'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								DoorHandler();
								currentPage = 'door';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer;
								}
								SaveArray['currentPage'] = 'door';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyComputer',SaveArray);
							}
						}else if(hit_lock.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'entrance'){
								EntrenceLockHandler();
							}else if(currentPage == 'elevator'){
								ElevatorLockHandler();
							}else if(currentPage == 'door'){
								DoorLockHandler();
							}
						}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PictureHandler();
						}
					}
				}
			}
		}
		private function PictureHandler():void{			
			if(currentPage == 'entrance'){
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a grainy camera image of the front door.");			
				
				
			}else if(currentPage == 'elevator'){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A grainy camera image of the elevator just around the corner.");			
				
				
			}else if(currentPage == 'door'){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a grainy camera image of the door behind me.");			
				
			}
			
		}
		
		private function EntrenceLockHandler():void{			
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This looks like a control panel for locking/unlocking doors, in this case the front entrance.");			
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I probably shouldn't lock the front door for the time being... Don't want to accidentally lock myself out.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... i will leave the front door unlocked for now.");
				
			}
		
		
		}
		private function ElevatorLockHandler():void{
			
		
			if(ElevatorUnlocked === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiTwo();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer;
				}
				SaveArray['elevator'] = 'Yes';
				
				ElevatorUnlocked = true;
				lock.texture = this.assets.getTexture('lock_open');
				text_lock.texture = this.assets.getTexture('text_lockUnlock');
				if(ElevatorFunctioning === false){					
					text_status.texture = this.assets.getTexture('text_status_ui');
					
				}else{
					text_status.texture = this.assets.getTexture('text_status_un');
				}
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyComputer',SaveArray);
			}else{
				
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've already unlocked the elevator.");			
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Locking the elevator again won't help me right now.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The panel indicates that the elevator is unlocked.");
					
				}
			//	ElevatorUnlocked = false;
			//	lock.texture = this.assets.getTexture('lock_closed');
			//	text_lock.texture = this.assets.getTexture('text_lockLock');
			//	if(ElevatorFunctioning === false){					
			//		text_status.texture = this.assets.getTexture('text_status_li');
			//	}else{
			//		text_status.texture = this.assets.getTexture('text_status_ln');
			//	}
				
				
			}
		}
		private function DoorLockHandler():void{
		
			if(DoorUnlocked === false){				
				Animating = true;
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiTwo();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LobbyComputer;
				}
				SaveArray['mgnt'] = 'Yes';				
				
				DoorUnlocked = true;
				lock.texture = this.assets.getTexture('lock_open');
				text_lock.texture = this.assets.getTexture('text_lockUnlock');								
				text_status.texture = this.assets.getTexture('text_status_un');		
				
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LobbyComputer',SaveArray);
			
				Starling.juggler.delayCall(function():void{
					Animating = false;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_UnlockTwo();
				},1);
			}else{			
		//		DoorUnlocked = false;
		//		lock.texture = this.assets.getTexture('lock_closed');
		//		text_lock.texture = this.assets.getTexture('text_lockLock');
		//		text_status.texture = this.assets.getTexture('text_status_ln');				
				
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've already unlocked this door.");			
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Probably should leave this door unlocked for now.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The panel indicates that this door is unlocked.");
					
				}
				
			}
			
		}
		
		private function DoorHandler():void{
			knub_entrance.alpha = 0;
			knub_elevator.alpha = 0;
			knub_door.alpha = 1;
			
			hightlight_entrance.alpha = 0;
			hightlight_elevator.alpha = 0;
			hightlight_door.alpha = 1;
			
			if(DoorUnlocked === true){
				lock.texture = this.assets.getTexture('lock_open');
				text_lock.texture = this.assets.getTexture('text_lockUnlock');
				text_notes.texture = this.assets.getTexture('text_notes_door');
				text_status.texture = this.assets.getTexture('text_status_un');
				if(DoorOpen === true){
					picture.texture = this.assets.getTexture('pic_door_open');
				}else{
					picture.texture = this.assets.getTexture('pic_door_closed');
				}
			}else{
				lock.texture = this.assets.getTexture('lock_closed');
				text_lock.texture = this.assets.getTexture('text_lockLock');
				text_notes.texture = this.assets.getTexture('text_notes_door');
				text_status.texture = this.assets.getTexture('text_status_ln');
				picture.texture = this.assets.getTexture('pic_door_closed');
			}
			
			
			
		}
		
		private function EntranceHandler():void{
			knub_entrance.alpha = 1;
			knub_elevator.alpha = 0;
			knub_door.alpha = 0;
			
			hightlight_entrance.alpha = 1;
			hightlight_elevator.alpha = 0;
			hightlight_door.alpha = 0;
			
			lock.texture = this.assets.getTexture('lock_open');
			text_lock.texture = this.assets.getTexture('text_lockUnlock');
			
			text_status.texture = this.assets.getTexture('text_status_un');
			text_notes.texture = this.assets.getTexture('text_notes_entrence');
			
			picture.texture = this.assets.getTexture('pic_entence');
		}
	
		
		private function ElevatorHandler():void{
			
			knub_entrance.alpha = 0;
			knub_elevator.alpha = 1;
			knub_door.alpha = 0;
			
			hightlight_entrance.alpha = 0;
			hightlight_elevator.alpha = 1;
			hightlight_door.alpha = 0;
			
			
			if(ElevatorUnlocked === true){
				lock.texture = this.assets.getTexture('lock_open');
				text_lock.texture = this.assets.getTexture('text_lockUnlock');
				if(ElevatorFunctioning === true){
					text_status.texture = this.assets.getTexture('text_status_un');
					text_notes.texture = this.assets.getTexture('text_notes_elevator_on');
				}else{
					text_status.texture = this.assets.getTexture('text_status_ui');
					text_notes.texture = this.assets.getTexture('text_notes_elevator_off');
				}
				
			}else{
				lock.texture = this.assets.getTexture('lock_closed');
				text_lock.texture = this.assets.getTexture('text_lockLock');
			
				text_status.texture = this.assets.getTexture('text_status_li');
				text_notes.texture = this.assets.getTexture('text_notes_elevator_off');
			}
			
			picture.texture = this.assets.getTexture('pic_elevator');
			
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
			
			
			
			this.assets.removeTexture("lobbyComputer_bg",true);
			this.assets.removeTexture("LobbyComputer_Sprite_01",true);
			this.assets.removeTextureAtlas("LobbyComputer_Sprite_01",true);
			this.assets.removeTexture("LobbyComputer_Sprite_02",true);
			this.assets.removeTextureAtlas("LobbyComputer_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("lobbyComputer_01");
			(stage.getChildAt(0) as Object).falseAsset("lobbyComputer_02");
			(stage.getChildAt(0) as Object).falseAsset("lobbyComputer_03");
			(stage.getChildAt(0) as Object).falseAsset("lobbyComputer_04");
			(stage.getChildAt(0) as Object).falseAsset("lobbyComputer_05");
			
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
import screens.ingamescreens;

