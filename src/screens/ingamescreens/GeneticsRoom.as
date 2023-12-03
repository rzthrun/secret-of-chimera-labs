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
	
	public class GeneticsRoom extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		public var SaveArray2:Array = new Array();
		
		private var bg:Image;
		
		private var door:Image;
		
		private var box_door_open:Image;
		private var box_door_closed:Image;
		private var box_hand:Image;
		
		private var table_door_closed:Image;
		private var table_door_open:Image;
		private var table_cup:Image;
		private var table_slot:Image;
		private var table_tube:Image;
		private var table_stone:Image;
		
		private var micro_bottle_g:Image;
		private var micro_bottle_a:Image;
		private var micro_bottle_c:Image;
		private var micro_bottle_t:Image;
		
		private var micro_test_tube:Image;
		private var micro_dna:Image;
		private var micro_hose:Image;
		
		private var hit_electron:Shape;
		private var hit_desk:Shape;
		private var hit_box:Shape;
		private var hit_door:Shape;
		
		private var hit_ceiling:Shape;
		
		private var DoorOpen:Boolean = false;	
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function GeneticsRoom(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('geneticsRoom_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoom/geneticsRoom_bg.jpg'));
				game.TrackAssets('geneticsRoom_01');
			}
			if(game.CheckAsset('geneticsRoom_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoom/GeneticsRoom_Sprite_01.png'));
				game.TrackAssets('geneticsRoom_02');
			}
			if(game.CheckAsset('geneticsRoom_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoom/GeneticsRoom_Sprite_01.xml'));
				game.TrackAssets('geneticsRoom_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GeneticsRoom","GeneticsRoomObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			
			/*(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CellFull,
				'item_CellFull',
				'inven_cellFull_sm'
			);
			*/
			//item_CellFull
		/*
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk != undefined){	
				SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk;	
			}
			SaveArray2['LidUnlocked'] = "no";
			SaveArray2['Lid'] = "Closed";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomDesk',SaveArray2);
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel;	
			}
			SaveArray['Solved'] = "No";
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('SpinWheel',SaveArray);
		*/	
			
		/*	
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle != undefined){
			SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle;
			}
			SaveArray["Solved"] = "No";
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomLensPuzzle',SaveArray);
			SaveArray = null;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox;
			}
			SaveArray["HandGrown"] = "No";
			SaveArray["Hand"] = "No";
			SaveArray["FirstFire"] = "No";
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomBox',SaveArray);
			SaveArray = null;
		*/	
			
			
			bg = new Image(this.assets.getTexture('geneticsRoom_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			door = new Image(this.assets.getTexture('exit_door'));
			door.touchable = false;
			door.x = 638;
			door.y = 161;
			
			box_door_open = new Image(this.assets.getTexture('box_door_open'));
			box_door_open.touchable = false;
			box_door_open.x = 287;
			box_door_open.y = 138;
			
			box_hand = new Image(this.assets.getTexture('box_hand'));
			box_hand.touchable = false;
			box_hand.x = 396;
			box_hand.y = 183;
			
			box_door_closed = new Image(this.assets.getTexture('box_door_closed'));
			box_door_closed.touchable = false;
			box_door_closed.x = 352;
			box_door_closed.y = 142;
			
			table_cup = new Image(this.assets.getTexture('table_cup'));
			table_cup.touchable = false;
			table_cup.x = 491;
			table_cup.y = 273;
			
			table_door_closed = new Image(this.assets.getTexture('table_door_closed'));
			table_door_closed.touchable = false;
			table_door_closed.x = 479;
			table_door_closed.y = 260;
			
			table_door_open = new Image(this.assets.getTexture('table_door_open'));
			table_door_open.touchable = false;
			table_door_open.x = 457;
			table_door_open.y = 260;
			
			table_slot = new Image(this.assets.getTexture('table_slot'));
			table_slot.touchable = false;
			table_slot.x = 609;
			table_slot.y = 251;
			
			table_stone= new Image(this.assets.getTexture('table_stone'));
			table_stone.touchable = false;
			table_stone.x = 473;
			table_stone.y = 301;
			
			table_tube = new Image(this.assets.getTexture('table_tube'));
			table_tube.touchable = false;
			table_tube.x = 427;
			table_tube.y = 273;
			
			micro_bottle_t = new Image(this.assets.getTexture('micro_bottle_t_full'));
			micro_bottle_t.touchable = false;
			micro_bottle_t.x = 226;
			micro_bottle_t.y = 212;	
			
			micro_bottle_c = new Image(this.assets.getTexture('micro_bottle_c_full'));
			micro_bottle_c.touchable = false;
			micro_bottle_c.x = 217;
			micro_bottle_c.y = 211;		
					
			micro_bottle_a = new Image(this.assets.getTexture('micro_bottle_a_full'));
			micro_bottle_a.touchable = false;
			micro_bottle_a.x = 210;
			micro_bottle_a.y = 213;		
			
			micro_bottle_g = new Image(this.assets.getTexture('micro_bottle_g_full'));
			micro_bottle_g.touchable = false;
			micro_bottle_g.x = 195;
			micro_bottle_g.y = 213;		
			
			micro_test_tube = new Image(this.assets.getTexture('micro_test_tube_empty'));
			micro_test_tube.touchable = false;
			micro_test_tube.x = 176;
			micro_test_tube.y = 209;		
					
			micro_dna = new Image(this.assets.getTexture('micro_dna_full'));
			micro_dna.touchable = false;
			micro_dna.x = 121;
			micro_dna.y = 220;	
			
			micro_hose = new Image(this.assets.getTexture('micro_hose_on'));
			micro_hose.touchable = false;
			micro_hose.x = 156;
			micro_hose.y = 215;	
			/*
			
			
			private var micro_test_tuber:Image;
			private var micro_dna:Image;
			private var micro_hose:Image;
			
			*/
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoom != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoom['Door'] == 'Open'){	
					door.alpha = 0;
					DoorOpen = true;
				}else{
					door.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoom['FirstTime'] == 'Yes'){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoom['SecondTime'] == 'Yes'){
						
					}else{
						if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoom;
							SaveArray['SecondTime'] = 'Yes';
							
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoom',SaveArray);
							
							Starling.juggler.delayCall(function():void{
								(stage.getChildAt(0) as Object).MusicObj.LoadWierdScifi(true,2);
								
							},0.5);
						}
					}
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoom;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoom',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadDarkDance(true,3);
							
						},0.5);
					}
				}
				
			}else{
				door.alpha = 1;
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoom',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadDarkDance(true,3);
						
					},0.5);
				}
				
				
			}
		
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox['HandGrown'] == 'Yes'){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox['Hand'] == 'PickedUp'){
						box_hand.alpha = 0;
					}else{
						box_hand.alpha = 1;
						box_door_closed.texture = this.assets.getTexture('box_door_closed_hand');
					}
				}else{
					box_hand.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox['Door'] == 'Open'){
					box_door_open.alpha = 1;
					box_door_closed.alpha = 0;
				}else{
					box_door_closed.alpha = 1;
					box_door_open.alpha = 0;
				}
			}else{
				
				box_door_open.alpha = 0;
				box_hand.alpha = 0;
				box_door_closed.alpha = 1;
			}
			
		
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk['Tube'] == 'PickedUp'){
					table_tube.alpha = 0;
				}else{
					table_tube.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk['Stone'] == 'PickedUp'){
					table_stone.alpha = 0;
				}else{
					table_stone.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk['Lid'] == 'Open'){
					table_door_closed.alpha = 0;
					table_door_open.alpha = 1;
				}else{
					table_door_closed.alpha = 1;
					table_door_open.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk['Cup'] == 'PickedUp'){
					table_cup.alpha = 0;
				}else{
					table_cup.alpha = 1;
				}
			}else{
				table_cup.alpha = 1;
				table_door_closed.alpha = 1;
				table_door_open.alpha = 0;
				
				table_stone.alpha = 1;
				table_tube.alpha = 1;
				
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['TemplateAttached'] == 'Yes'){
					table_slot.alpha = 1;
				}else{
					table_slot.alpha = 0;
				}			
			}else{
				table_slot.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['HoseAttached'] == 'Yes'){
					micro_hose.alpha = 1;
				}else{
					micro_hose.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['TestTubeFilled'] == 'Yes'){
					micro_test_tube.texture = this.assets.getTexture('micro_test_tube_full');
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['TestTubePickedUp'] == 'Yes'){
					micro_test_tube.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['DNAAttached'] == 'Yes'){
					micro_dna.alpha = 1;
				}else{
					micro_dna.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['WheelTurned'] == 'Yes'){
					micro_dna.texture = this.assets.getTexture('micro_dna_empty');
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_g'] == 'Yes'){
					micro_bottle_g.alpha = 0;
				}else{
					micro_bottle_g.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['Bottle_a_Attached'] == 'Yes'){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_a'] == 'Yes'){
						micro_bottle_a.texture = this.assets.getTexture('micro_bottle_a_empty');
						micro_bottle_a.alpha = 1;
					}else{
						micro_bottle_a.alpha = 1;
					}
				}else{
					micro_bottle_a.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['Bottle_c_Attached'] == 'Yes'){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_c'] == 'Yes'){
						micro_bottle_c.texture = this.assets.getTexture('micro_bottle_c_empty');
						micro_bottle_c.alpha = 1;
					}else{
						micro_bottle_c.alpha = 1;
					}
				}else{
					micro_bottle_c.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_t'] == 'Yes'){
					micro_bottle_t.alpha = 0;
				}else{
					micro_bottle_t.alpha = 1;
				}
			}else{
				micro_test_tube.alpha = 1;
				micro_dna.alpha = 0;
				
				micro_bottle_g.alpha = 1;
				micro_bottle_a.alpha = 0;
				micro_bottle_c.alpha = 0;
				micro_bottle_t.alpha = 1;		
				
				micro_hose.alpha = 0;
				micro_test_tube.alpha = 1;
			}
		
		
			
			this.addChildAt(door,1);
			this.addChildAt(box_door_open,2);
			this.addChildAt(box_hand,3);
			this.addChildAt(box_door_closed,4);
			this.addChildAt(table_cup,5);
			this.addChildAt(table_door_open,6);
			this.addChildAt(table_door_closed,7);
			this.addChildAt(table_slot,8);
			this.addChildAt(table_stone,9);
			this.addChildAt(table_tube,10);
			this.addChildAt(micro_bottle_t,11);
			this.addChildAt(micro_bottle_c,12);
			this.addChildAt(micro_bottle_a,13);
			this.addChildAt(micro_bottle_g,14);
			this.addChildAt(micro_test_tube,15);
			this.addChildAt(micro_dna,16);
			this.addChildAt(micro_hose,17);
			
			CreateElectronsHit();
			CreateDeskHit();
			CreateDoorHit();
			CreateBoxHit();
			CreateCeilingHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ShipGroansOne",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("CityHum",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("WindHowl",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Drone",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadSpaceHumPower(true,999);
		//(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
		}
		//hit_ceiling
		private function CreateCeilingHit():void{
			hit_ceiling = new Shape();
			hit_ceiling.touchable = false;
			hit_ceiling.graphics.beginFill(0xff0000);
			
			hit_ceiling.graphics.lineTo(187,0);	
			hit_ceiling.graphics.lineTo(614,0);	
			hit_ceiling.graphics.lineTo(596,132);	
			hit_ceiling.graphics.lineTo(299,114);	
			hit_ceiling.graphics.lineTo(185,72);			
			
			hit_ceiling.graphics.endFill(false);
			hit_ceiling.alpha = 0.0;
			
			hit_ceiling.graphics.precisionHitTest = true;	
			this.addChild(hit_ceiling);
		}
		
		private function CreateDoorHit():void{
			hit_door = new Shape();
			hit_door.touchable = false;
			hit_door.graphics.beginFill(0xff0000);
			
			hit_door.graphics.lineTo(634,293);	
			hit_door.graphics.lineTo(637,158);	
			hit_door.graphics.lineTo(738,158);	
			hit_door.graphics.lineTo(736,328);	
			hit_door.graphics.lineTo(652,323);	
		
			hit_door.graphics.endFill(false);
			hit_door.alpha = 0.0;
			
			hit_door.graphics.precisionHitTest = true;	
			this.addChild(hit_door);
		}
		
		private function CreateBoxHit():void{
			hit_box = new Shape();
			hit_box.touchable = false;
			hit_box.graphics.beginFill(0xff0000);
			
			hit_box.graphics.lineTo(328,119);	
			hit_box.graphics.lineTo(475,122);	
			hit_box.graphics.lineTo(475,190);	
			hit_box.graphics.lineTo(426,257);	
			hit_box.graphics.lineTo(350,255);	
			hit_box.graphics.lineTo(331,231);	
		
			hit_box.graphics.endFill(false);
			hit_box.alpha = 0.0;
			
			hit_box.graphics.precisionHitTest = true;	
			this.addChild(hit_box);
		}
		
		private function CreateDeskHit():void{
			hit_desk = new Shape();
			hit_desk.touchable = false;
			hit_desk.graphics.beginFill(0xff0000);
			
			hit_desk.graphics.lineTo(411,316);	
			hit_desk.graphics.lineTo(457,208);	
			hit_desk.graphics.lineTo(542,167);	
			hit_desk.graphics.lineTo(628,227);	
			hit_desk.graphics.lineTo(632,314);	
			hit_desk.graphics.lineTo(579,391);	
			hit_desk.graphics.lineTo(463,373);	
		
			
			hit_desk.graphics.endFill(false);
			hit_desk.alpha = 0.0;
			
			hit_desk.graphics.precisionHitTest = true;	
			this.addChild(hit_desk);
		}
		
		private function CreateElectronsHit():void{
			hit_electron = new Shape();
			hit_electron.touchable = false;
			hit_electron.graphics.beginFill(0xff0000);
			
			hit_electron.graphics.lineTo(86,242);	
			hit_electron.graphics.lineTo(124,140);	
			hit_electron.graphics.lineTo(216,161);	
			hit_electron.graphics.lineTo(303,243);	
			hit_electron.graphics.lineTo(281,306);	
			hit_electron.graphics.lineTo(170,320);	
			hit_electron.graphics.lineTo(99,304);	
		
			hit_electron.graphics.endFill(false);
			hit_electron.alpha = 0.0;
			
			hit_electron.graphics.precisionHitTest = true;	
			this.addChild(hit_electron);
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
							FadeOut((Lab as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LabObj,false
							);
						}else if(hit_electron.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((GeneticsRoomElectron as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomElectronObj,true
							);
							
						}else if(hit_desk.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((GeneticsRoomDesk as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomDeskObj,true
							);
							
						}else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DoorHandler();
							
						}else if(hit_box.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((GeneticsRoomBox as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomBoxObj,true
							);
						}else if(hit_ceiling.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Ventilation ducts cover the ceiling.");

						}
						
					}
				}
			}
		}
		
		private function DoorHandler():void{
			if(DoorOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HeavyMetalDoorOpen();
				DoorOpen = true;
				door.alpha = 0;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoom != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoom;	
				}
				SaveArray['Door'] = "Open";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoom',SaveArray);
				
			}else{
				FadeOut((ExteriorFireEscapeUpper as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorFireEscapeUpperObj,true
				);
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
			
			
			
			this.assets.removeTexture("geneticsRoom_bg",true);
			this.assets.removeTexture("GeneticsRoom_Sprite_01",true);
			this.assets.removeTextureAtlas("GeneticsRoom_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoom_01");
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoom_02");
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoom_03");
			
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
