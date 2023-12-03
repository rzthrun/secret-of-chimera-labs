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
	
	
	public class OfficeKitchen extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var door:Image;
		private var icebox_closed:Image;
		private var fridge_closed:Image;
		private var fridge_open:Image;
		private var microwave_closed:Image;
		private var microwave_open:Image;
		private var cab_lower_left_closed:Image;
		private var cab_lower_left_open:Image;
		private var cab_lower_right_closed:Image;
		private var cab_lower_right_open:Image;
		private var cab_upper_left_closed:Image;
		private var cab_upper_left_open:Image;
		private var cab_upper_right_closed:Image;
		private var cab_upper_right_open:Image;
		private var eggplant:Image;
		private var tongs:Image;
		private var slime:Image;
		private var coffee_pot:Image;
		private var sink_lid_on:Image;
		private var sink_lid_off:Image;
		
		
		private var hit_bathroom:Shape;
		
		private var hit_lowerCabLeft:Shape;
		private var hit_lowerCabRight:Shape;
		private var hit_upperCabLeft:Shape;
		private var hit_upperCabRight:Shape;
		private var hit_fridge:Shape;
		private var hit_microwave:Shape;
		private var hit_eggplant:Shape;
		
		private var hit_book:Shape;
		private var hit_sink:Shape;
		
		private var hit_upp_cab_int:Shape;
		private var hit_low_cab_int:Shape;
		private var hit_floor:Shape;
		private var hit_dishes:Shape;
		private var hit_board:Shape;
		//private var hit_fridge_int:Shape;
		
		private var openBookbg:Shape;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookcurrentPage:Number = 0;
		
		private var hit_OpenBook:Shape;
		
		private var RONum:int = 0;
		
		public var OpenBookTween:Tween;
		private var BookIsOpen:Boolean = false;
		
		//	private var hit_elevator_door:Shape;
		
		private var LowerCabLeftOpen:Boolean = false;
		private var LowerCabRightOpen:Boolean = false;
		private var UpperCabLeftOpen:Boolean = false;
		private var UpperCabRightOpen:Boolean = false;
		private var FridgeOpen:Boolean = false;
		private var MicrowaveOpen:Boolean = false;
		private var DoorOpen:Boolean = false;
		private var EggplantPickedUp:Boolean = false;
		
		private var SlimeSoaped:Boolean = false;
		private var SlimeCleaned:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function OfficeKitchen(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('officeKitchen_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeKitchen/officeKitchen_bg.jpg'));
				game.TrackAssets('officeKitchen_01');
			}
			if(game.CheckAsset('officeKitchen_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeKitchen/OfficeKitchen_Sprite_01.png'));
				game.TrackAssets('officeKitchen_02');
			}
			if(game.CheckAsset('officeKitchen_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeKitchen/OfficeKitchen_Sprite_01.xml'));
				game.TrackAssets('officeKitchen_03');
			}
			if(game.CheckAsset('officeKitchen_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeKitchen/FactorChart_Sprite_01.png'));
				game.TrackAssets('officeKitchen_04');
			}
			if(game.CheckAsset('officeKitchen_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeKitchen/FactorChart_Sprite_01.xml'));
				game.TrackAssets('officeKitchen_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("OfficeKitchen","OfficeKitchenObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		
			
			bg = new Image(this.assets.getTexture('officeKitchen_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			
			
			door = new Image(this.assets.getTexture('door'));
			door.touchable = false;
			door.x = 189;
			door.y = 63;
			
			eggplant = new Image(this.assets.getTexture('eggplant'));
			eggplant.touchable = false;
			eggplant.x = 576;
			eggplant.y = 343;
			
			icebox_closed = new Image(this.assets.getTexture('ice_box_door_closed'));
			icebox_closed.touchable = false;
			icebox_closed.x = 537;
			icebox_closed.y = 290;
			
			fridge_closed = new Image(this.assets.getTexture('fridge_door_closed'));
			fridge_closed.touchable = false;
			fridge_closed.x = 540;
			fridge_closed.y = 283;
			
			fridge_open = new Image(this.assets.getTexture('fridge_door_open'));
			fridge_open.touchable = false;
			fridge_open.x = 651;
			fridge_open.y = 288;
			
			microwave_closed = new Image(this.assets.getTexture('microwave_closed'));
			microwave_closed.touchable = false;
			microwave_closed.x = 580;
			microwave_closed.y = 68;
			
			microwave_open = new Image(this.assets.getTexture('microwave_open'));
			microwave_open.touchable = false;
			microwave_open.x = 550;
			microwave_open.y = 60;
			
			cab_lower_left_closed = new Image(this.assets.getTexture('lower_cab_left_closed'));
			cab_lower_left_closed.touchable = false;
			cab_lower_left_closed.x = 334;
			cab_lower_left_closed.y = 268;
			
			cab_lower_left_open = new Image(this.assets.getTexture('lower_cab_left_open'));
			cab_lower_left_open.touchable = false;
			cab_lower_left_open.x = 294;
			cab_lower_left_open.y = 268;
			
			cab_lower_right_closed = new Image(this.assets.getTexture('lower_cab_right_closed'));
			cab_lower_right_closed.touchable = false;
			cab_lower_right_closed.x = 428;
			cab_lower_right_closed.y = 273;
			
			cab_lower_right_open = new Image(this.assets.getTexture('lower_cab_right_open'));
			cab_lower_right_open.touchable = false;
			cab_lower_right_open.x = 514;
			cab_lower_right_open.y = 276;
			
			cab_upper_left_closed = new Image(this.assets.getTexture('upper_cab_left_closed'));
			cab_upper_left_closed.touchable = false;
			cab_upper_left_closed.x = 342;
			cab_upper_left_closed.y = 20;
			
			cab_upper_left_open = new Image(this.assets.getTexture('upper_cab_left_open'));
			cab_upper_left_open.touchable = false;
			cab_upper_left_open.x = 304;
			cab_upper_left_open.y = 9;
			
			cab_upper_right_closed = new Image(this.assets.getTexture('upper_cab_right_closed'));
			cab_upper_right_closed.touchable = false;
			cab_upper_right_closed.x = 428;
			cab_upper_right_closed.y = 13;
			
			cab_upper_right_open = new Image(this.assets.getTexture('upper_cab_right_open'));
			cab_upper_right_open.touchable = false;
			cab_upper_right_open.x = 509;
			cab_upper_right_open.y = 0;
			
			tongs = new Image(this.assets.getTexture('sink_tongs'));
			tongs.touchable = false;
			tongs.x = 367;
			tongs.y = 241;
			
			slime = new Image(this.assets.getTexture('slime'));
			slime.touchable = false;
			slime.x = 284;
			slime.y = 206;
			
			coffee_pot = new Image(this.assets.getTexture('sink_coffee_pot'));
			coffee_pot.touchable = false;
			coffee_pot.x = 501;
			coffee_pot.y = 213;
			
			sink_lid_on = new Image(this.assets.getTexture('sink_lid_on'));
			sink_lid_on.touchable = false;
			sink_lid_on.x = 504;
			sink_lid_on.y = 173;
			
			sink_lid_off = new Image(this.assets.getTexture('sink_lid_off'));
			sink_lid_off.touchable = false;
			sink_lid_off.x = 524;
			sink_lid_off.y = 144;
			/*
			524
			private var sink_lid_on:Image;
			private var sink_lid_off:Image;
			
			private var tongs:Image;
			private var slime:Image;

			*/
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['Door'] == 'Open'){	
					DoorOpen = true;
					door.alpha = 0;
				}else{
					door.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['LowerCabLeftOpen'] == 'Open'){	
					LowerCabLeftOpen = true;
					cab_lower_left_closed.alpha = 0;
					cab_lower_left_open.alpha = 1;
				}else{
					cab_lower_left_closed.alpha = 1;
					cab_lower_left_open.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['LowerCabRightOpen'] == 'Open'){	
					LowerCabRightOpen = true;
					cab_lower_right_closed.alpha = 0;
					cab_lower_right_open.alpha = 1;
				}else{
					cab_lower_right_closed.alpha = 1;
					cab_lower_right_open.alpha = 0;
				}
				//UpperCabLeftOpen
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['UpperCabLeftOpen'] == 'Open'){	
					UpperCabLeftOpen = true;
					cab_upper_left_closed.alpha = 0;
					cab_upper_left_open.alpha = 1;
				}else{
					cab_upper_left_closed.alpha = 1;
					cab_upper_left_open.alpha = 0;
				}
				//UpperCabRightOpen
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['UpperCabRightOpen'] == 'Open'){	
					UpperCabRightOpen = true;
					cab_upper_right_closed.alpha = 0;
					cab_upper_right_open.alpha = 1;
				}else{
					cab_upper_right_closed.alpha = 1;
					cab_upper_right_open.alpha = 0;
				}
				//FridgeOpen
				//eggplant
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['Eggplant'] == 'PickedUp'){	
					EggplantPickedUp = true;					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['FridgeOpen'] == 'Open'){	
					FridgeOpen = true;
					fridge_closed.alpha = 0;
					fridge_open.alpha = 1;
					if(EggplantPickedUp === false){
						eggplant.alpha = 1;
					}else{
						eggplant.alpha = 0;
					}
					CreateEggplantHit();
				}else{	
					fridge_closed.alpha = 1;
					fridge_open.alpha = 0;
					eggplant.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['MicrowaveOpen'] == 'Open'){	
					MicrowaveOpen = true;
					microwave_closed.alpha = 0;
					microwave_open.alpha = 1;
				}else{	
					microwave_closed.alpha = 1;
					microwave_open.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['SlimeSoaped'] == 'Yes'){
					SlimeSoaped = true;
					slime.texture = this.assets.getTexture('slime_soap');
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['SlimeCleaned'] == 'Yes'){
					SlimeCleaned = true;
					slime.alpha = 0;
				}else{
					slime.alpha = 1;
				}
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadRansomRetreat(true,3);
							
						},0.5);
					}
				}
				
				
				//MicrowaveOpen
			}else{
				door.alpha = 1;
				eggplant.alpha = 0;
				cab_lower_left_closed.alpha = 1;
				cab_lower_left_open.alpha = 0;
				cab_lower_right_closed.alpha = 1;
				cab_lower_right_open.alpha = 0;
				cab_upper_left_closed.alpha = 1;
				cab_upper_left_open.alpha = 0;
				cab_upper_right_closed.alpha = 1;
				cab_upper_right_open.alpha = 0;
				fridge_closed.alpha = 1;
				fridge_open.alpha = 0;
				microwave_closed.alpha = 1;
				microwave_open.alpha = 0;
				slime.alpha = 1;
				
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadRansomRetreat(true,3);
						
					},0.5);
				}
			}
			
			
		
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink != undefined){	
			//	if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink['Tongs'] == 'PickedUp'){	
			//		tongs.alpha = 0;
			//	}else{
			//		tongs.alpha = 1;
			//	}
			//	if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink['CoffeePot'] == 'PickedUp'){	
			//		coffee_pot.alpha = 0;
			//	}else{
			//		coffee_pot.alpha = 1;
			//	}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchenSink['Lid'] == 'Open'){	
					sink_lid_on.alpha = 0;
					sink_lid_off.alpha = 1;
				}else{
					sink_lid_on.alpha = 1;
					sink_lid_off.alpha = 0;
				}
			}else{
				tongs.alpha = 1;
			//	coffee_pot.alpha = 1;
			//	sink_lid_on.alpha = 1;
				sink_lid_off.alpha = 0;
			}
			
			/*
			524
			private var sink_lid_on:Image;
			private var sink_lid_off:Image;
			
			private var tongs:Image;
			private var slime:Image;
			
			*/
			
			icebox_closed.alpha = 1;
			tongs.alpha = 0;
			coffee_pot.alpha = 0;
			
			this.addChildAt(door,1);
			this.addChildAt(eggplant,2);			
			this.addChildAt(icebox_closed,3);
			this.addChildAt(fridge_closed,4);
			this.addChildAt(fridge_open,5);
			this.addChildAt(microwave_closed,6);
			this.addChildAt(microwave_open,7);
			this.addChildAt(slime,8);
			this.addChildAt(cab_lower_left_closed,9);
			this.addChildAt(cab_lower_left_open,10);
			this.addChildAt(cab_lower_right_closed,11);
			this.addChildAt(cab_lower_right_open,12);
			this.addChildAt(cab_upper_left_closed,13);
			this.addChildAt(cab_upper_left_open,14);
			this.addChildAt(cab_upper_right_closed,15);
			this.addChildAt(cab_upper_right_open,16);
			this.addChildAt(tongs,17);
			this.addChildAt(coffee_pot,18);
			
			this.addChildAt(sink_lid_on,19);
			this.addChildAt(sink_lid_off,20);
			
			CreateUpperCabIntHit();
			CreateUpperLowIntHit();
			CreateFloorHit();
			CreateDishesHit();
			CreateBoardHit();
			/*
			sink_lid_on.alpha = 1;
			sink_lid_off.alpha = 0;
			private var :Boolean = false;
			private var :Boolean = false;
			private var :Boolean = false;
			private var :Boolean = false;
			private var :Boolean = false;
			private var :Boolean = false;
			*/
			CreateSinkHit();
			CreateBathroomDoorHit();
			CreateMicrowaveHit(MicrowaveOpen);
			CreateFridgeHit(FridgeOpen);
			CreateUpperCabLeftHit(UpperCabLeftOpen);
			CreateUpperCabRightHit(UpperCabRightOpen);			
			CreateLowerCabLeftHit(LowerCabLeftOpen);
			CreateLowerCabRightHit(LowerCabRightOpen);
			CreateBookHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen["Book"] == "open"){
					trace("Book is Open");
					BookIsOpen = true;
					//	OpenBook();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen["BookCurrentPage"] == 0){
						openBookcurrentPage = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen["BookCurrentPage"] == 1){
						openBookcurrentPage = 1;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen["BookCurrentPage"] == 2){
						openBookcurrentPage = 2;
					}else{
						openBookcurrentPage = 0;
					}
					OpenBook();
					this.addChild(goback);
				}
				
			}else{
				
			}
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("BathroomDrip",0,0.0,'stop');
			
		}
		
		private function CreateBoardHit():void{
			hit_board = new Shape();
			hit_board.touchable = false;
			hit_board.graphics.beginFill(0xff0000);
			
			hit_board.graphics.lineTo(29,24);	
			hit_board.graphics.lineTo(145,23);	
			hit_board.graphics.lineTo(148,121);	
			hit_board.graphics.lineTo(33,124);	
					
			hit_board.graphics.endFill(false);
			hit_board.alpha = 0.0;
			
			hit_board.graphics.precisionHitTest = true;	
			this.addChild(hit_board);
		}
		
		private function CreateDishesHit():void{
			hit_dishes = new Shape();
			hit_dishes.touchable = false;
			hit_dishes.graphics.beginFill(0xff0000);
			
			hit_dishes.graphics.lineTo(608,176);	
			hit_dishes.graphics.lineTo(716,184);	
			hit_dishes.graphics.lineTo(706,264);	
			hit_dishes.graphics.lineTo(600,260);	
		
			hit_dishes.graphics.endFill(false);
			hit_dishes.alpha = 0.0;
			
			hit_dishes.graphics.precisionHitTest = true;	
			this.addChild(hit_dishes);
		}
		
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0xff0000);
			
			hit_floor.graphics.lineTo(221,385);	
			hit_floor.graphics.lineTo(611,421);	
			hit_floor.graphics.lineTo(600,508);	
			hit_floor.graphics.lineTo(226,505);	
			
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		private function CreateUpperLowIntHit():void{
			hit_low_cab_int = new Shape();
			hit_low_cab_int.touchable = false;
			hit_low_cab_int.graphics.beginFill(0xff0000);
			
			hit_low_cab_int.graphics.lineTo(343,277);	
			hit_low_cab_int.graphics.lineTo(508,287);	
			hit_low_cab_int.graphics.lineTo(505,393);	
			hit_low_cab_int.graphics.lineTo(345,378);	
			
			hit_low_cab_int.graphics.endFill(false);
			hit_low_cab_int.alpha = 0.0;
			
			hit_low_cab_int.graphics.precisionHitTest = true;	
			this.addChild(hit_low_cab_int);
		}
		private function CreateUpperCabIntHit():void{
			hit_upp_cab_int = new Shape();
			hit_upp_cab_int.touchable = false;
			hit_upp_cab_int.graphics.beginFill(0xff0000);
			
			hit_upp_cab_int.graphics.lineTo(354,31);	
			hit_upp_cab_int.graphics.lineTo(499,22);	
			hit_upp_cab_int.graphics.lineTo(503,122);	
			hit_upp_cab_int.graphics.lineTo(352,124);	
			
			hit_upp_cab_int.graphics.endFill(false);
			hit_upp_cab_int.alpha = 0.0;
			
			hit_upp_cab_int.graphics.precisionHitTest = true;	
			this.addChild(hit_upp_cab_int);
		}
		
		private function CreateMicrowaveHit(open:Boolean = false):void{
			hit_microwave = new Shape();		
			hit_microwave.x = 0;
			hit_microwave.y = 0;
			hit_microwave.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_microwave.graphics.lineTo(579,67);
				hit_microwave.graphics.lineTo(669,65);
				hit_microwave.graphics.lineTo(667,136);
				hit_microwave.graphics.lineTo(575,136);
				
			}else{
				
				hit_microwave.graphics.lineTo(548,54);
				hit_microwave.graphics.lineTo(561,56);
				hit_microwave.graphics.lineTo(585,71);
				hit_microwave.graphics.lineTo(581,135);
				hit_microwave.graphics.lineTo(567,136);
				hit_microwave.graphics.lineTo(546,131);
				
			}				
			hit_microwave.graphics.endFill(false);			
			hit_microwave.alpha = 0.0;			
			hit_microwave.graphics.precisionHitTest = true;	
			hit_microwave.touchable = false
			this.addChild(hit_microwave);
			
			
		}
		
		private function CreateFridgeHit(open:Boolean = false):void{
			hit_fridge = new Shape();		
			hit_fridge.x = 0;
			hit_fridge.y = 0;
			hit_fridge.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_fridge.graphics.lineTo(540,280);					
				hit_fridge.graphics.lineTo(684,286);					
				hit_fridge.graphics.lineTo(676,422);					
				hit_fridge.graphics.lineTo(538,408);					
				
			}else{
				
				hit_fridge.graphics.lineTo(648,377);
				hit_fridge.graphics.lineTo(665,286);
				hit_fridge.graphics.lineTo(692,286);
				hit_fridge.graphics.lineTo(734,312);
				hit_fridge.graphics.lineTo(729,395);
				hit_fridge.graphics.lineTo(665,424);
				
			}				
			hit_fridge.graphics.endFill(false);			
			hit_fridge.alpha = 0.0;			
			hit_fridge.graphics.precisionHitTest = true;	
			hit_fridge.touchable = false
			this.addChild(hit_fridge);
			
			
		}
		
		private function CreateUpperCabRightHit(open:Boolean = false):void{
			hit_upperCabRight = new Shape();		
			hit_upperCabRight.x = 0;
			hit_upperCabRight.y = 0;
			hit_upperCabRight.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_upperCabRight.graphics.lineTo(426,16);					
				hit_upperCabRight.graphics.lineTo(516,12);					
				hit_upperCabRight.graphics.lineTo(514,133);					
				hit_upperCabRight.graphics.lineTo(426,133);					
								
				
			}else{
				
				hit_upperCabRight.graphics.lineTo(506,13);
				hit_upperCabRight.graphics.lineTo(529,0);
				hit_upperCabRight.graphics.lineTo(549,0);
				hit_upperCabRight.graphics.lineTo(545,122);
				hit_upperCabRight.graphics.lineTo(513,129);
				hit_upperCabRight.graphics.lineTo(508,128);
				
			}				
			hit_upperCabRight.graphics.endFill(false);			
			hit_upperCabRight.alpha = 0.0;			
			hit_upperCabRight.graphics.precisionHitTest = true;	
			hit_upperCabRight.touchable = false
			this.addChild(hit_upperCabRight);
			
			
		}
		
		private function CreateUpperCabLeftHit(open:Boolean = false):void{
			hit_upperCabLeft = new Shape();		
			hit_upperCabLeft.x = 0;
			hit_upperCabLeft.y = 0;
			hit_upperCabLeft.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_upperCabLeft.graphics.lineTo(341,23);					
				hit_upperCabLeft.graphics.lineTo(421,19);					
				hit_upperCabLeft.graphics.lineTo(421,133);					
				hit_upperCabLeft.graphics.lineTo(343,132);					
				
			}else{
				
				hit_upperCabLeft.graphics.lineTo(300,6);
				hit_upperCabLeft.graphics.lineTo(308,6);
				hit_upperCabLeft.graphics.lineTo(350,26);
				hit_upperCabLeft.graphics.lineTo(348,133);
				hit_upperCabLeft.graphics.lineTo(302,126);
				
			}				
			hit_upperCabLeft.graphics.endFill(false);			
			hit_upperCabLeft.alpha = 0.0;			
			hit_upperCabLeft.graphics.precisionHitTest = true;	
			hit_upperCabLeft.touchable = false
			this.addChild(hit_upperCabLeft);
			
			
		}
		
		private function CreateLowerCabRightHit(open:Boolean = false):void{
			hit_lowerCabRight = new Shape();		
			hit_lowerCabRight.x = 0;
			hit_lowerCabRight.y = 0;
			hit_lowerCabRight.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_lowerCabRight.graphics.lineTo(428,270);					
				hit_lowerCabRight.graphics.lineTo(525,275);					
				hit_lowerCabRight.graphics.lineTo(521,404);					
				hit_lowerCabRight.graphics.lineTo(428,397);					
								
				
			}else{
				
				hit_lowerCabRight.graphics.lineTo(512,274);
				hit_lowerCabRight.graphics.lineTo(523,273);
				hit_lowerCabRight.graphics.lineTo(538,291);
				hit_lowerCabRight.graphics.lineTo(536,433);
				hit_lowerCabRight.graphics.lineTo(528,434);
				hit_lowerCabRight.graphics.lineTo(510,400);
				
			}				
			hit_lowerCabRight.graphics.endFill(false);			
			hit_lowerCabRight.alpha = 0.0;			
			hit_lowerCabRight.graphics.precisionHitTest = true;	
			hit_lowerCabRight.touchable = false
			this.addChild(hit_lowerCabRight);
			
			
		}
		
		private function CreateLowerCabLeftHit(open:Boolean = false):void{
			hit_lowerCabLeft = new Shape();		
			hit_lowerCabLeft.x = 0;
			hit_lowerCabLeft.y = 0;
			hit_lowerCabLeft.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_lowerCabLeft.graphics.lineTo(333,267);					
				hit_lowerCabLeft.graphics.lineTo(425,270);					
				hit_lowerCabLeft.graphics.lineTo(423,396);					
				hit_lowerCabLeft.graphics.lineTo(333,391);					
				
			}else{
				
				hit_lowerCabLeft.graphics.lineTo(291,279);
				hit_lowerCabLeft.graphics.lineTo(335,264);
				hit_lowerCabLeft.graphics.lineTo(341,266);
				hit_lowerCabLeft.graphics.lineTo(340,387);
				hit_lowerCabLeft.graphics.lineTo(301,417);
				hit_lowerCabLeft.graphics.lineTo(291,416);
				
			}				
			hit_lowerCabLeft.graphics.endFill(false);			
			hit_lowerCabLeft.alpha = 0.0;			
			hit_lowerCabLeft.graphics.precisionHitTest = true;	
			hit_lowerCabLeft.touchable = false
			this.addChild(hit_lowerCabLeft);
			
			
		}
		//hit_sink
		private function CreateSinkHit():void{
			hit_sink = new Shape();
			hit_sink.touchable = false;
			hit_sink.graphics.beginFill(0xff0000);
			
			hit_sink.graphics.lineTo(330,243);	
			hit_sink.graphics.lineTo(360,162);	
			hit_sink.graphics.lineTo(556,163);	
			hit_sink.graphics.lineTo(599,204);	
			hit_sink.graphics.lineTo(597,259);	
			hit_sink.graphics.lineTo(563,266);	
			hit_sink.graphics.lineTo(329,257);	
			
			hit_sink.graphics.endFill(false);
			hit_sink.alpha = 0.0;
			
			hit_sink.graphics.precisionHitTest = true;	
			this.addChild(hit_sink);
		}
		//hit_eggplant
		private function CreateEggplantHit():void{
			hit_eggplant = new Shape();
			hit_eggplant.touchable = false;
			hit_eggplant.graphics.beginFill(0xff0000);
			
			hit_eggplant.graphics.lineTo(561,346);	
			hit_eggplant.graphics.lineTo(575,325);	
			hit_eggplant.graphics.lineTo(614,327);	
			hit_eggplant.graphics.lineTo(626,349);	
			hit_eggplant.graphics.lineTo(611,407);	
			hit_eggplant.graphics.lineTo(563,403);	
		
			hit_eggplant.graphics.endFill(false);
			hit_eggplant.alpha = 0.0;
			
			hit_eggplant.graphics.precisionHitTest = true;	
			this.addChild(hit_eggplant);
		}
		private function CreateBathroomDoorHit():void{
			hit_bathroom = new Shape();
			hit_bathroom.touchable = false;
			hit_bathroom.graphics.beginFill(0xff0000);
			
			hit_bathroom.graphics.lineTo(183,61);	
			hit_bathroom.graphics.lineTo(320,55);	
			hit_bathroom.graphics.lineTo(318,358);	
			hit_bathroom.graphics.lineTo(252,352);	
			hit_bathroom.graphics.lineTo(270,324);	
			hit_bathroom.graphics.lineTo(273,300);	
			hit_bathroom.graphics.lineTo(191,290);	
			
			hit_bathroom.graphics.endFill(false);
			hit_bathroom.alpha = 0.0;
			
			hit_bathroom.graphics.precisionHitTest = true;	
			this.addChild(hit_bathroom);
		}
		
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(18,304);	
			hit_book.graphics.lineTo(85,282);	
			hit_book.graphics.lineTo(187,288);	
			hit_book.graphics.lineTo(255,304);	
			hit_book.graphics.lineTo(258,329);	
			hit_book.graphics.lineTo(159,353);	
			hit_book.graphics.lineTo(76,359);	
			hit_book.graphics.lineTo(36,350);	
			
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		private function CreateOpenBookHit():void{
			hit_OpenBook = new Shape();
			hit_OpenBook.touchable = false;
			hit_OpenBook.graphics.beginFill(0xff0000);
			
			hit_OpenBook.graphics.lineTo(211,0);	
			hit_OpenBook.graphics.lineTo(585,0);	
			hit_OpenBook.graphics.lineTo(585,512);	
			hit_OpenBook.graphics.lineTo(211,512);	
			
			
			hit_OpenBook.graphics.endFill(false);
			hit_OpenBook.alpha = 0.0;
			
			hit_OpenBook.graphics.precisionHitTest = true;	
			this.addChild(hit_OpenBook);
		}
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){				
				if (touches[0].phase == TouchPhase.ENDED) {
					if(Animating === false){
						if(BookIsOpen === false){
							trace(touches[0].globalX+" ,"+touches[0].globalY);
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
									FadeOut((Office as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeObj,true
								);
							}else if(hit_sink.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((OfficeKitchenSink as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeKitchenSinkObj,true
								);
								return;
							}else if(hit_microwave.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								MicrowaveHandler();
								return;
							}else if(hit_fridge.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FridgeHandler();		
								return;
							}else if(hit_upperCabLeft.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
								UpperCabLeftHandler();
								return;
							}else if(hit_upperCabRight.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){	
								UpperCabRightHandler();
								return;
							}else if(hit_lowerCabRight.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){		
								LowerCabRightHandler();
								return;
							}else if(hit_lowerCabLeft.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){		
								LowerCabLeftHandler();
								return;
							}else if(hit_bathroom.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								DoorHandler();
								return;
							}else if(hit_upp_cab_int.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The cabinet is empty.");
								return;
							}else if(hit_low_cab_int.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The cabinet under the sink is empty except for the pipes.");
								return;
							}else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The carpet around the kitchen is well besmirched.");
								return;
							}else if(hit_dishes.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Recently washed dishes.");
								return;
							}else if(hit_board.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A push-board with notes and reminders pinned to it.");
								return;
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								BookIsOpen = true;
								OpenBook(true, 0);
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;
								}		
								SaveArray['Book'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
								return;
							}
							else if(FridgeOpen === true){
								if(hit_eggplant.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									EggplantHandler();
								}
							}
							
							
							/*		
							private var hit_upp_cab_int:Shape;
							private var hit_low_cab_int:Shape;
							private var hit_floor:Shape;
							private var hit_dishes:Shape;
							private var hit_board:Shape;		
							*/
							
						}else{
							
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								trace("GoBackClick");
								RemoveBook();
								BookIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;
								}		
								SaveArray['Book'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
							}else if(hit_OpenBook.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;
								}
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
									openBookPages.texture = this.assets.getTexture('FactorChart_page_1');
								}else if(openBookcurrentPage == 1){
									SaveArray['BookCurrentPage'] = 2;
									openBookcurrentPage = 2;
									openBookPages.texture = this.assets.getTexture('FactorChart_page_2');
								}else if(openBookcurrentPage == 2){
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
									openBookPages.texture = this.assets.getTexture('FactorChart_page_0');
								}
								
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
								
							}
						}
					}
				}
			}
		}
		
		
		private function OpenBook(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openBook = new Sprite();
			openBook.alpha = 0;
			CreateOpenBookBg();
			openBookPages = new Image(this.assets.getTexture('FactorChart_page_0'));
			this.openBook.addChildAt(openBookbg,0);
			openBook.addChild(openBookPages);
			openBookPages.touchable = false;
			
			
			this.addChild(openBook);
			this.addChild(goback);
			
			if(openBookcurrentPage == 0){
				openBookPages.texture = this.assets.getTexture('FactorChart_page_0');
			}else if(openBookcurrentPage == 1){
				openBookPages.texture = this.assets.getTexture('FactorChart_page_1');
			}else if(openBookcurrentPage == 2){
				openBookPages.texture = this.assets.getTexture('FactorChart_page_2');
			}
			
			CreateOpenBookHit();
			//CreateOpenBookHit(openBookcurrentPage);
			
			if(Fade === false){
				Animating = false;
				openBook.alpha = 1;
				//	CreateOpenBookHit();
			}else{
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookDouble('numbers_page_00','numbers_page_01');
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
				hit_OpenBook.graphics.clear();
				Animating = false;
				CloseBook();
				
			};
			Starling.juggler.add(OpenBookTween);		
		}
		
		public function CloseBook():void{
			this.removeChild(openBook);
			openBook.dispose();
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
		
		private function EggplantHandler():void{
			if(EggplantPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;	
				}
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Eggplant,
					'item_Eggplant',
					'inven_eggplant_sm'
				);
				
				EggplantPickedUp = true;
				eggplant.alpha = 0;
				SaveArray['Eggplant'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
				
				
			}else{
				
			}
		}
		
		private function DoorHandler():void{
			/*
			
			private var SlimeSoaped:Boolean = false;
			private var SlimeCleaned:Boolean = false;
			*/
			if(SlimeCleaned === true){			
				if(DoorOpen === false){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;	
					}
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CreakyDoorTwo();
					DoorOpen = true;
					door.alpha = 0;
					
					SaveArray['Door'] = 'Open';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
				}else{
					FadeOut((Bathroom as Class), 
						(stage.getChildAt(0) as Object).screenGamePlayHandler.BathroomObj,false
					);
				}
			}else if(SlimeSoaped === true){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_PaperTowels)
					
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Wipe();
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've cleaned the green slime off the door handle.");

					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;	
					}
					SlimeCleaned = true;
					slime.alpha = 0;
					SaveArray['SlimeCleaned'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_PaperTowels,
							"item_PaperTowels"
						);
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I need something to wipe away the slime...");
				}
			}else{
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_SprayCan)
					
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Spray();
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've sprayed the liquid cleaning solution on to the slime.");
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;	
					}
					SlimeSoaped = true;
					slime.texture = this.assets.getTexture('slime_soap');
					SaveArray['SlimeSoaped'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_SprayCan,
							"item_SprayCan"
						);
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_PaperTowels)
					
				{	
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The slime is too sticky for the paper towels alone. I need to apply some sort of cleaner first.");
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LockedTwo();
					
					if(RONum == 0){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The door handle is covered in the sticky green slime.");
						RONum = 1;
					}else if(RONum == 1){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I must remove the green slime before turning the handle. I don't want to touch it directly...");					
						RONum = 2;
					}else if(RONum == 2){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The green slime on the handle is preventing me from opening the door...");	
						RONum = 0;
					}
					
					
				}
			}
			
		}
		
		private function LowerCabLeftHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;	
			}
			if(LowerCabLeftOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxOpen();
				LowerCabLeftOpen = true;
				SaveArray['LowerCabLeftOpen'] = 'Open';
				cab_lower_left_closed.alpha = 0;
				cab_lower_left_open.alpha = 1;
				hit_lowerCabLeft.graphics.clear();
				CreateLowerCabLeftHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxClose();
				LowerCabLeftOpen = false;
				SaveArray['LowerCabLeftOpen'] = 'Closed';
				cab_lower_left_closed.alpha = 1;
				cab_lower_left_open.alpha = 0;
				hit_lowerCabLeft.graphics.clear();
				CreateLowerCabLeftHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
		}
		
		
		
		private function LowerCabRightHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;	
			}
			if(LowerCabRightOpen === false){
			
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxOpen();
				LowerCabRightOpen = true;
				SaveArray['LowerCabRightOpen'] = 'Open';
				cab_lower_right_closed.alpha = 0;
				cab_lower_right_open.alpha = 1;
				hit_lowerCabRight.graphics.clear();
				CreateLowerCabRightHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxClose();
				LowerCabRightOpen = false;
				SaveArray['LowerCabRightOpen'] = 'Closed';
				cab_lower_right_closed.alpha = 1;
				cab_lower_right_open.alpha = 0;
				hit_lowerCabRight.graphics.clear();
				CreateLowerCabRightHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
		}		
		
		private function UpperCabLeftHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;	
			}
			if(UpperCabLeftOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxOpen();
				UpperCabLeftOpen = true;
				SaveArray['UpperCabLeftOpen'] = 'Open';
				cab_upper_left_closed.alpha = 0;
				cab_upper_left_open.alpha = 1;
				hit_upperCabLeft.graphics.clear();
				CreateUpperCabLeftHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxClose();
				UpperCabLeftOpen = false;
				SaveArray['UpperCabLeftOpen'] = 'Closed';
				cab_upper_left_closed.alpha = 1;
				cab_upper_left_open.alpha = 0;
				hit_upperCabLeft.graphics.clear();
				CreateUpperCabLeftHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);

		}
		
		private function UpperCabRightHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;	
			}
			if(UpperCabRightOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxOpen();
				UpperCabRightOpen = true;
				SaveArray['UpperCabRightOpen'] = 'Open';
				cab_upper_right_closed.alpha = 0;
				cab_upper_right_open.alpha = 1;
				hit_upperCabRight.graphics.clear();
				CreateUpperCabRightHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxClose();
				UpperCabRightOpen = false;
				SaveArray['UpperCabRightOpen'] = 'Closed';
				cab_upper_right_closed.alpha = 1;
				cab_upper_right_open.alpha = 0;
				hit_upperCabRight.graphics.clear();
				CreateUpperCabRightHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
		}
		
		private function FridgeHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;	
			}
			if(FridgeOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeOpen();
				FridgeOpen = true;
				SaveArray['FridgeOpen'] = 'Open';
				fridge_closed.alpha = 0;
				fridge_open.alpha = 1;
				if(EggplantPickedUp === false){
					eggplant.alpha = 1;
				}else{
					eggplant.alpha = 0;

				}
				hit_fridge.graphics.clear();
				CreateFridgeHit(true);
				CreateEggplantHit();
			}else{
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeClose();
				FridgeOpen = false;
				SaveArray['FridgeOpen'] = 'Closed';
				fridge_closed.alpha = 1;
				fridge_open.alpha = 0;
				eggplant.alpha = 0;
				hit_fridge.graphics.clear();
				hit_eggplant.graphics.clear();
				CreateFridgeHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
		}
		
		private function MicrowaveHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeKitchen;	
			}
			if(MicrowaveOpen === false){
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeOpen();
				MicrowaveOpen = true;
				SaveArray['MicrowaveOpen'] = 'Open';
				microwave_closed.alpha = 0;
				microwave_open.alpha = 1;
				hit_microwave.graphics.clear();
				CreateMicrowaveHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_FridgeClose();
				MicrowaveOpen = false;
				SaveArray['MicrowaveOpen'] = 'Closed';
				microwave_closed.alpha = 1;
				microwave_open.alpha = 0;
				hit_microwave.graphics.clear();
				CreateMicrowaveHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeKitchen',SaveArray);
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
			
			
			
			this.assets.removeTexture("officeKitchen_bg",true);
			this.assets.removeTexture("OfficeKitchen_Sprite_01",true);
			this.assets.removeTextureAtlas("OfficeKitchen_Sprite_01",true);
			this.assets.removeTexture("FactorChart_Sprite_01",true);
			this.assets.removeTextureAtlas("FactorChart_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("officeKitchen_01");
			(stage.getChildAt(0) as Object).falseAsset("officeKitchen_02");
			(stage.getChildAt(0) as Object).falseAsset("officeKitchen_03");
			(stage.getChildAt(0) as Object).falseAsset("officeKitchen_04");
			(stage.getChildAt(0) as Object).falseAsset("officeKitchen_05");
			
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