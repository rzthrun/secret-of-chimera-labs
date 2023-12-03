package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
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
	
	
	public class ServerRoom extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		private var door:Image;
		private var bigBox_lid:Image;
		private var lilBox_lid:Image;
		private var shine_light:Image;
		private var green_light:Image;
		
		private var pal_eye:Image;
		private var pal_screen:Image;
		private var pal_lid_on:Image;
		private var pal_lid_off:Image;
		private var pal_cube:Image;
		private var pal_core:Image;
		
		private var vent_on:Image;
		private var vent_off:Image;
		private var vent_off_fall:Image;
		
		private var spider_eyes_mc:MovieClip;
		
		private var pos_00:Image;
		private var pos_01:Image;
		private var pos_02:Image;
		private var pos_03:Image;
		private var pos_04:Image;
		private var pos_05:Image;
		
		//	private var hit_elevator_door:Shape;
		private var hit_electricBox:Shape;		
		private var hit_electricBoxSmall:Shape;
		
		private var hit_door:Shape;
		private var hit_office:Shape;
		
		private var hit_bigbox_lid:Shape;
		private var hit_lilbox_lid:Shape;		
		private var hit_table:Shape;		
		private var hit_vent:Shape;
		private var hit_pal:Shape;
		
		private var hit_ventoff:Shape;
		
		private var hit_spider_eyes:Shape;
		private var hit_floor:Shape;
		private var hit_stool:Shape;
		private var hit_ceiling:Shape;
		private var hit_stacks:Shape;
		private var hit_light:Shape;
		
		private var EyeTween:Tween;
		private var Animating:Boolean = false;
		
		private var turnonSprite:Sprite;
		private var turnon_door:Image;
		private var turnon_bg:Image;
		private var TurnOnTween:Tween;
		
		private var VentCoverOn:Boolean = false;
		private var VentCoverFirst:Boolean = false;
		
		private var DoorIsOpen:Boolean = false
		private var BigBoxIsOpen:Boolean = false;
		private var LilBoxIsOpen:Boolean = false;
		private var LightsOn:Boolean = false;
		private var ComputerOn:Boolean = false;
		private var EggplantAttached:Boolean = false;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		private var fruit_arr:Array = new Array(
			'sphere',
			'apple',
			'eggplant',
			'cylinder',
			'orange',
			'cube'
		);
		
		
		public function ServerRoom(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('serverRoom_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoom/ServerRoom_Sprite_01.jpg'));
				game.TrackAssets('serverRoom_01');
			}
			if(game.CheckAsset('serverRoom_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoom/ServerRoom_Sprite_01.xml'));
				game.TrackAssets('serverRoom_02');
			}
			if(game.CheckAsset('serverRoom_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoom/ServerRoom_Sprite_02.png'));
				game.TrackAssets('serverRoom_03');
			}
			if(game.CheckAsset('serverRoom_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoom/ServerRoom_Sprite_02.xml'));
				game.TrackAssets('serverRoom_04');
			}
			if(game.CheckAsset('serverRoom_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoom/ServerRoom_Sprite_03.png'));
				game.TrackAssets('serverRoom_05');
			}
			if(game.CheckAsset('serverRoom_06') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoom/ServerRoom_Sprite_03.xml'));
				game.TrackAssets('serverRoom_06');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ServerRoom","ServerRoomObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomPal',SaveArray);
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomComputer',SaveArray);
			
			
		//	(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
		//		(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CubeDamage,
		//		'item_CubeDamage',
		//		'inven_cubeDamage_sm'
		//	);
			
	//		(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElectricBoxSmall',SaveArray);
	//		(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElectricBox',SaveArray);
	//		(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
	//		(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomTable',SaveArray);
			
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElectricBox',SaveArray);	
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElectricBoxSmall',SaveArray);	
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);	
			
			
			bg = new Image(this.assets.getTexture('serverRoom_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			spider_eyes_mc= new MovieClip(this.assets.getTextures("spider_eyes_03"),3);
			spider_eyes_mc.x = 597;
			spider_eyes_mc.y = 377;			
			spider_eyes_mc.touchable = false;
			spider_eyes_mc.loop = true; 
			
			spider_eyes_mc.addFrameAt(1,this.assets.getTexture("spider_eyes_02"), null, 0.1);
			spider_eyes_mc.addFrameAt(2,this.assets.getTexture("spider_eyes_01"), null, 0.1);
			spider_eyes_mc.addFrameAt(3,this.assets.getTexture("spider_eyes_00"), null, 5.0);			
			spider_eyes_mc.addFrameAt(4,this.assets.getTexture("spider_eyes_01"), null, 0.1);
			spider_eyes_mc.addFrameAt(5,this.assets.getTexture("spider_eyes_02"), null, 0.1);
			spider_eyes_mc.addFrameAt(6,this.assets.getTexture("spider_eyes_03"), null, 1.0);	
			spider_eyes_mc.addFrameAt(7,this.assets.getTexture("spider_eyes_02"), null, 0.1);
			spider_eyes_mc.addFrameAt(8,this.assets.getTexture("spider_eyes_01"), null, 0.1);
			spider_eyes_mc.addFrameAt(9,this.assets.getTexture("spider_eyes_00"), null, 2.0);
			spider_eyes_mc.addFrameAt(10,this.assets.getTexture("spider_eyes_01"), null, 0.1);
			spider_eyes_mc.addFrameAt(11,this.assets.getTexture("spider_eyes_02"), null, 0.1);
			spider_eyes_mc.addFrameAt(12,this.assets.getTexture("spider_eyes_03"), null, 1.0);
			
			vent_off_fall = new Image(this.assets.getTexture('vent_off_fall'));
			vent_off_fall.touchable = false;
			vent_off_fall.x = 666;
			vent_off_fall.y = 271;
			
			vent_off = new Image(this.assets.getTexture('vent_off'));
			vent_off.touchable = false;
			vent_off.x = 625;
			vent_off.y = 249;
			
			vent_on = new Image(this.assets.getTexture('vent_on'));
			vent_on.touchable = false;
			vent_on.x = 689;
			vent_on.y = 77;
			
			
			
			door = new Image(this.assets.getTexture('door_red_closed'));
			door.touchable = false;
			door.x = 23;
			door.y = 116;
			
			bigBox_lid = new Image(this.assets.getTexture('bigbox_lid_red_open'));
			bigBox_lid.touchable = false;
			bigBox_lid.x = 170;
			bigBox_lid.y = 128;
			
			lilBox_lid = new Image(this.assets.getTexture('bilbox_lid_open'));
			lilBox_lid.touchable = false;
			lilBox_lid.x = 687;
			lilBox_lid.y = 182;
		
			green_light = new Image(this.assets.getTexture('green_light'));
			green_light.touchable = false;
			green_light.x = 210;
			green_light.y = 119;
			
			pal_eye  = new Image(this.assets.getTexture('computer_eye'));
			pal_eye.touchable = false;
			pal_eye.x = 495;
			pal_eye.y = 218;
			
			pal_screen  = new Image(this.assets.getTexture('computer_screen'));
			pal_screen.touchable = false;
			pal_screen.x = 558;
			pal_screen.y = 132;
			
			pal_core  = new Image(this.assets.getTexture('computer_core_off'));
			pal_core.touchable = false;
			pal_core.x = 414;
			pal_core.y = 144;
			
			pal_cube  = new Image(this.assets.getTexture('computer_cube'));
			pal_cube.touchable = false;
			pal_cube.x = 439;
			pal_cube.y = 163;
			
			pal_lid_on  = new Image(this.assets.getTexture('computer_lid_on'));
			pal_lid_on.touchable = false;
			pal_lid_on.x = 412;
			pal_lid_on.y = 143;
			
			pal_lid_off = new Image(this.assets.getTexture('computer_lid_ff'));
			pal_lid_off.touchable = false;
			pal_lid_off.x = 402;
			pal_lid_off.y = 192;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['EggplantAttached'] == 'Yes'){	
					EggplantAttached = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['0'] != undefined){	
					fruit_arr[0] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['1'] != undefined){	
					fruit_arr[1] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['2'] != undefined){	
					fruit_arr[2] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['3'] != undefined){	
					fruit_arr[3] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['3'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['4'] != undefined){	
					fruit_arr[4] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['4'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['5'] != undefined){	
					fruit_arr[5] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['5'];
				}
			}else{
				
			}
			
			pos_00 = new Image(this.assets.getTexture('table_pos_0_'+fruit_arr[0]));
			pos_00.touchable = false;
			pos_00.x = 320;
			pos_00.y = 271;
		
			pos_01 = new Image(this.assets.getTexture('table_pos_1_'+fruit_arr[1]));
			pos_01.touchable = false;
			pos_01.x = 320;
			pos_01.y = 271;

			pos_02 = new Image(this.assets.getTexture('table_pos_2_'+fruit_arr[2]));
			pos_02.touchable = false;
			pos_02.x = 367;
			pos_02.y = 269;
			
			pos_03 = new Image(this.assets.getTexture('table_pos_3_'+fruit_arr[3]));
			pos_03.touchable = false;
			pos_03.x = 335;
			pos_03.y = 273;
			
			pos_04 = new Image(this.assets.getTexture('table_pos_4_'+fruit_arr[4]));
			pos_04.touchable = false;
			pos_04.x = 379;
			pos_04.y = 273;
			
			pos_05 = new Image(this.assets.getTexture('table_pos_5_'+fruit_arr[5]));
			pos_05.touchable = false;
			pos_05.x = 420;
			pos_05.y = 272;
			
			shine_light = new Image(this.assets.getTexture('shine_light'));
			shine_light.touchable = false;
			shine_light.x = 275;
			shine_light.y = 13;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['Door'] == 'Open'){	
					DoorIsOpen = true;
					door.alpha = 0;
					CreateOfficeHit();
					
				}else{
					door.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['LilBox'] == 'Open'){	
					LilBoxIsOpen = true;
					lilBox_lid.alpha = 1;
					CreateElectricBoxSmallHit();
				}else{
					lilBox_lid.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['BigBox'] == 'Open'){	
					BigBoxIsOpen = true;
					bigBox_lid.alpha = 1;
					CreateElectricBoxHit();
				}else{
					bigBox_lid.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadEzekiel(true,3);
							
						},1.5);
					}
				}
				
				
			
				
				
			}else{
				bigBox_lid.alpha = 0;
				lilBox_lid.alpha = 0;
				door.alpha = 1;
			
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						//	Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadEzekiel(true,3);
						
					},1.5);
				}
			}
		
		//	vent_off_fall.alpha = 0;
		//	vent_on.alpha = 0;
		//	vent_off.alpha = 0;
			/*
			vent_off_fall
			private var vent_on:Image;
			private var vent_off:Image;
			*/
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBoxSmall != undefined){
				trace("A");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBoxSmall['Solved'] == 'Yes'){
					trace("B");
				
					spider_eyes_mc.alpha = 0;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom != undefined){
						trace("C");
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['Lights'] == 'On'){
							trace("D");
							
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['VentCover'] == 'On'){
								VentCoverOn = true;
								VentCoverFirst = true;
								vent_off_fall.alpha = 0;
								vent_on.alpha = 1;
								vent_off.alpha = 0;
							}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['VentCover'] == 'Off'){
								VentCoverOn = false;
								VentCoverFirst = true;
								vent_off_fall.alpha = 0;
								vent_on.alpha = 0;
								vent_off.alpha = 1;
							}else{
								VentCoverOn = false;
								VentCoverFirst = false;
								vent_off_fall.alpha = 1;
								vent_on.alpha = 0;
								vent_off.alpha = 0;
							}
							
							
							LightsOn = true;					
							bg.texture = this.assets.getTexture('serverRoom_bg_lit');
							door.texture = this.assets.getTexture('door_closed');
							bigBox_lid.texture = this.assets.getTexture('bigbox_lid_open');
							
						//	pos_00.alpha = 1;
						//	pos_01.alpha = 1;
						//	pos_02.alpha = 1;						
						//	pos_03.alpha = 1;
						//	pos_04.alpha = 1;
						//	pos_05.alpha = 1;
							
							if(fruit_arr[0] == 'eggplant'){
								if(EggplantAttached === true){
									pos_00.alpha = 1;
								}else{
									pos_00.alpha = 0;
								}
							}else{
								pos_00.alpha = 1;
							}
							if(fruit_arr[1] == 'eggplant'){
								if(EggplantAttached === true){
									pos_01.alpha = 1;
								}else{
									pos_01.alpha = 0;
								}
							}else{
								pos_01.alpha = 1;
							}
							if(fruit_arr[2] == 'eggplant'){
								if(EggplantAttached === true){
									pos_02.alpha = 1;
								}else{
									pos_02.alpha = 0;
								}
							}else{
								pos_02.alpha = 1;
							}
							if(fruit_arr[3] == 'eggplant'){
								if(EggplantAttached === true){
									pos_03.alpha = 1;
								}else{
									pos_03.alpha = 0;
								}
							}else{
								pos_03.alpha = 1;
							}
							if(fruit_arr[4] == 'eggplant'){
								if(EggplantAttached === true){
									pos_04.alpha = 1;
								}else{
									pos_04.alpha = 0;
								}
							}else{
								pos_04.alpha = 1;
							}
							if(fruit_arr[5] == 'eggplant'){
								if(EggplantAttached === true){
									pos_05.alpha = 1;
								}else{
									pos_05.alpha = 0;
								}
							}else{
								pos_05.alpha = 1;
							}
							
							
							
							
						}else{
							spider_eyes_mc.alpha = 0;
							vent_off_fall.alpha = 0;
							vent_on.alpha = 0;
							vent_off.alpha = 0;
							trace("E");
							pos_00.alpha = 0;
							pos_01.alpha = 0;
							pos_02.alpha = 0;
							pos_03.alpha = 0;
							pos_04.alpha = 0;
							pos_05.alpha = 0;
						
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom;	
							SaveArray['Lights'] = "On";
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
							Animating = true;
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_electricLight();
							
							Starling.juggler.delayCall(TurnLightsOn,1);
						}
					}else{
						spider_eyes_mc.alpha = 0;
						vent_off_fall.alpha = 0;
						vent_on.alpha = 0;
						vent_off.alpha = 0;
						pos_00.alpha = 0;
						pos_01.alpha = 0;
						pos_02.alpha = 0;
						pos_03.alpha = 0;
						pos_04.alpha = 0;
						pos_05.alpha = 0;
						trace("F");
						SaveArray['Lights'] = "On";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
						Animating = true;
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LightFlicker();
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_electricLight();
						Starling.juggler.delayCall(TurnLightsOn,1);
					}
					
					
				}else{
					spider_eyes_mc.alpha = 1;
					vent_off_fall.alpha = 0;
					vent_on.alpha = 0;
					vent_off.alpha = 0;
					pos_00.alpha = 0;
					pos_01.alpha = 0;
					pos_02.alpha = 0;
					pos_03.alpha = 0;
					pos_04.alpha = 0;
					pos_05.alpha = 0;
				}
			}else{
				spider_eyes_mc.alpha = 1;
				vent_off_fall.alpha = 0;
				vent_on.alpha = 0;
				vent_off.alpha = 0;
				pos_00.alpha = 0;
				pos_01.alpha = 0;
				pos_02.alpha = 0;
				pos_03.alpha = 0;
				pos_04.alpha = 0;
				pos_05.alpha = 0;
			}
					
			
			
			
			if(LightsOn === true){
				pal_lid_on.alpha = 1;
				
			}else{
				pal_lid_on.alpha = 0;
				pal_core.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['Solved'] == 'Yes'){
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom != undefined){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom['Pal'] == 'On'){
							pal_core.alpha = 0;
							
							ComputerOn = true;
							pal_eye.alpha = 1;
							green_light.alpha = 1;
							shine_light.alpha = 1;
							pal_screen.alpha = 1;
						}else{
							pal_eye.alpha = 0;
							green_light.alpha = 0;
							shine_light.alpha = 0;
							pal_screen.alpha = 0;
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom;	
							SaveArray['Pal'] = "On";
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
							Animating = true;
							ComputerOn = true;
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BootUp();
							//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_electricLight();
							Starling.juggler.delayCall(TurnPalOn,2);
						}
					}else{
						pal_eye.alpha = 0;
						green_light.alpha = 0;
						shine_light.alpha = 0;
						pal_screen.alpha = 0;
						SaveArray['Pal'] = "On";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
						Animating = true;
						ComputerOn = true;
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BootUp();
						//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_electricLight();
						
						Starling.juggler.delayCall(TurnPalOn,2);
					}
					
					
					
				}else{
					pal_screen.alpha = 0;
					pal_eye.alpha = 0;
					green_light.alpha = 0;
					shine_light.alpha = 0;
						
					
				}
			}else{
				pal_screen.alpha = 0;
				pal_eye.alpha = 0;
				green_light.alpha = 0;
				shine_light.alpha = 0;
				
			}
			
			
			
			
		//	pal_screen.alpha = 0;
			
			if(LightsOn === true){
				
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['AdimmRepaired'] == 'Yes'){
						//AdimmRepaired = true;
						//cube.texture = this.assets.getTexture('cube_clean');
					}
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['CubeDamage'] == 'Attached'){
						pal_cube.alpha = 1;
					
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['Cube'] == 'Attached'){
						pal_cube.alpha = 1;
						//CubeAttached = true;
					}else{
						pal_cube.alpha = 0;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['Lid'] == 'Open'){
						pal_lid_on.alpha = 0;
						pal_lid_off.alpha = 1;
						
					}else{
						pal_lid_on.alpha = 1;
						pal_lid_off.alpha = 0;
					}
				}else{
					pal_cube.alpha = 0;
					pal_lid_on.alpha = 1;
					pal_lid_off.alpha = 0;
				}
				
				
				
				
			}else{
				pal_cube.alpha = 0;
				pal_lid_on.alpha = 0;
				pal_lid_off.alpha = 0;
			}
			
			
			this.addChildAt(spider_eyes_mc,1);
			this.addChildAt(door,2);
			this.addChildAt(bigBox_lid,3);
			this.addChildAt(lilBox_lid,4);
			this.addChildAt(green_light,5);
			
			this.addChildAt(pal_eye,6);
			this.addChildAt(pal_screen,7);
			this.addChildAt(pal_cube,8);
			this.addChildAt(pal_core,9);
			this.addChildAt(pal_lid_on,10);
			this.addChildAt(pal_lid_off,11);
			this.addChildAt(pos_00,12);
			this.addChildAt(pos_01,13);
			this.addChildAt(pos_02,14);
			this.addChildAt(pos_03,15);
			this.addChildAt(pos_04,16);
			this.addChildAt(pos_05,17);
			
			this.addChildAt(vent_off_fall,18);
			this.addChildAt(vent_on,19);
			this.addChildAt(vent_off,20);
			
			/*
			vent_off_fall.alpha = 0;
			vent_on.alpha = 0;
			vent_off.alpha = 0;
			*/
			
			this.addChildAt(shine_light,20);
			CreateTurnOnSprite();
			
			CreateSpiderEyesHit();
			CreateFloorHit();
			CreateStoolHit();
			CreateCeilingHit();
			CreateStacksHit();
			CreateLightHit();
			
			CreateTableHit();
			CreateVentHit();
			CreateDoorHit(DoorIsOpen);
			CreateBigBoxLidHit(BigBoxIsOpen);
			CreateLilBoxLidHit(LilBoxIsOpen);
			CreatePalHit();
			CreateVentOffHit(VentCoverFirst);
		
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		
		//(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("WindHowl",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("DuctVibe",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("MotorFan",0,0.5,'stop');
			
			//vent_off.alpha = 1;
			Starling.juggler.add(spider_eyes_mc);
		}
		
		private function CreateTurnOnSprite():void{
			turnonSprite = new Sprite();;
			turnonSprite.touchable = false;
			turnonSprite.x = 0;
			turnonSprite.y = 0; 
			
		//	turnon_door = new Image(this.assets.getTexture('bg_fader_left_closed'));
		//	turnon_door.touchable = false;
		//	turnon_door.x = 0;
		//	turnon_door.y = 0; 
			
			turnon_bg = new Image(this.assets.getTexture('bg_fader_closed'));
			turnon_bg.touchable = false;
			turnon_bg.x = 0;
			turnon_bg.y = 0; 
		
		//	turnon_door.alpha = 1;
			turnon_bg.alpha = 1;
			
			turnonSprite.alpha = 0;
			
	//		turnonSprite.addChild(turnon_door);
			turnonSprite.addChild(turnon_bg);
			
			turnonSprite.width = 800;
			turnonSprite.height = 512;
			
			this.addChild(turnonSprite);
			/*	private var turnonSprite:Sprite;
			private var turnon_door:Image;
			private var turnon_bg:Image;
			*/
		}
		
		//hit_ventoff
		private function CreateVentOffHit(open:Boolean = false):void{
			hit_ventoff = new Shape();		
			hit_ventoff.x = 0;
			hit_ventoff.y = 0;
			hit_ventoff.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_ventoff.graphics.lineTo(671,264);
				hit_ventoff.graphics.lineTo(773,270);
				hit_ventoff.graphics.lineTo(778,333);
				hit_ventoff.graphics.lineTo(675,323);
				
			}else{
				hit_ventoff.graphics.lineTo(610,260);	
				hit_ventoff.graphics.lineTo(655,237);	
				hit_ventoff.graphics.lineTo(703,327);	
				hit_ventoff.graphics.lineTo(662,360);	
				
				
				
			}
			
			hit_ventoff.graphics.endFill(false);			
			hit_ventoff.alpha = 0.0;			
			hit_ventoff.graphics.precisionHitTest = true;	
			hit_ventoff.touchable = false
			this.addChild(hit_ventoff);
			
			
			
		}
		
		
		private function TurnPalOn():void{
			
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
		//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicProcess();
			green_light.alpha = 1;
			EyeTween = new Tween(pal_eye, 1, Transitions.LINEAR);
			EyeTween.fadeTo(1);
			
			EyeTween.onComplete = function():void{
				TurnOnScreen();
				//	game.SoundFXObj.PlaySFX_CosmicWaffle();
				//	BlueAnimator();
				EyeTween = null;
			}
			Starling.juggler.add(EyeTween);
		}
		private function TurnOnScreen():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
			
			pal_screen.alpha = 1;
			Starling.juggler.delayCall(function():void{
				shine_light.alpha = 1;
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
				
				
				Animating = false;
			},2);
			
		}
		
		private function TurnLightsOn():void{
			turnonSprite.alpha = 0;
			
			if(DoorIsOpen === true){
				turnon_bg.texture = this.assets.getTexture('bg_fader_open');
			}
			
			
			TurnOnTween =  new Tween(turnonSprite, 1.5, Transitions.EASE_OUT_IN_BOUNCE);
			TurnOnTween.fadeTo(1);
			TurnOnTween.onComplete = function():void{
				TurnLightOnTotal();
			};
			Starling.juggler.add(TurnOnTween);
		}
		
		private function TurnLightOnTotal():void{
			trace("TURN LIGHTS ON");
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LightFlicker();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BigLight();
			
			//PlaySFX_BigLights
			Animating = false;
			LightsOn = true;
			pal_lid_on.alpha = 1;
			spider_eyes_mc.alpha = 0;
			pos_00.alpha = 1;
			pos_01.alpha = 1;
			pos_02.alpha = 0;			
			pos_03.alpha = 1;
			pos_04.alpha = 1;
			pos_05.alpha = 1;
			vent_off_fall.alpha = 1;
			vent_on.alpha = 0;
			vent_off.alpha = 0;
			bg.texture = this.assets.getTexture('serverRoom_bg_lit');
			door.texture = this.assets.getTexture('door_closed');
			
			turnonSprite.alpha = 0;
			bigBox_lid.texture = this.assets.getTexture('bigbox_lid_open');
			//	(stage.getChildAt(0) as Object).AmbientObj.LoadShipGroansOne(true,2);
			Starling.juggler.delayCall(function():void{
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadElectricHum(true,0);
				//		(stage.getChildAt(0) as Object).AmbientObj.currentAmbient = 'ShipGroansOne';
				//		(stage.getChildAt(0) as Object).MusicObj.LoadBeatDownOne(true,2);
			},1);
		}
		
		private function CreateLightHit():void{
			hit_light = new Shape();
			hit_light.touchable = false;
			hit_light.graphics.beginFill(0x00ff00);
			
			hit_light.graphics.lineTo(442,34);	
			hit_light.graphics.lineTo(496,26);	
			hit_light.graphics.lineTo(503,71);	
			hit_light.graphics.lineTo(445,79);	
			
			hit_light.graphics.endFill(false);
			hit_light.alpha = 0.0;
			
			hit_light.graphics.precisionHitTest = true;	
			this.addChild(hit_light);
		}
		
		private function CreateStacksHit():void{
			hit_stacks = new Shape();
			hit_stacks.touchable = false;
			hit_stacks.graphics.beginFill(0x00ff00);
			
			hit_stacks.graphics.lineTo(283,112);	
			hit_stacks.graphics.lineTo(388,136);	
			hit_stacks.graphics.lineTo(389,260);	
			hit_stacks.graphics.lineTo(271,265);	
		
			hit_stacks.graphics.endFill(false);
			hit_stacks.alpha = 0.0;
			
			hit_stacks.graphics.precisionHitTest = true;	
			this.addChild(hit_stacks);
		}
		
		private function CreateCeilingHit():void{
			hit_ceiling = new Shape();
			hit_ceiling.touchable = false;
			hit_ceiling.graphics.beginFill(0x00ff00);
			
			hit_ceiling.graphics.lineTo(26,0);	
			hit_ceiling.graphics.lineTo(800,0);	
			hit_ceiling.graphics.lineTo(800,55);	
			hit_ceiling.graphics.lineTo(622,46);	
			hit_ceiling.graphics.lineTo(311,90);	
			
			hit_ceiling.graphics.endFill(false);
			hit_ceiling.alpha = 0.0;
			
			hit_ceiling.graphics.precisionHitTest = true;	
			this.addChild(hit_ceiling);
		}
		
		private function CreateStoolHit():void{
			hit_stool = new Shape();
			hit_stool.touchable = false;
			hit_stool.graphics.beginFill(0x00ff00);
			
			hit_stool.graphics.lineTo(238,359);	
			hit_stool.graphics.lineTo(286,352);	
			hit_stool.graphics.lineTo(326,368);	
			hit_stool.graphics.lineTo(330,467);	
			hit_stool.graphics.lineTo(305,498);	
			hit_stool.graphics.lineTo(227,488);	
			
			hit_stool.graphics.endFill(false);
			hit_stool.alpha = 0.0;
			
			hit_stool.graphics.precisionHitTest = true;	
			this.addChild(hit_stool);
		}
		
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0x00ff00);
			
			hit_floor.graphics.lineTo(0,399);	
			hit_floor.graphics.lineTo(220,359);	
			hit_floor.graphics.lineTo(630,399);	
			hit_floor.graphics.lineTo(575,512);	
			hit_floor.graphics.lineTo(88,512);	
			
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		private function CreateSpiderEyesHit():void{
			hit_spider_eyes = new Shape();
			hit_spider_eyes.touchable = false;
			hit_spider_eyes.graphics.beginFill(0x00ff00);
			
			hit_spider_eyes.graphics.lineTo(576,358);	
			hit_spider_eyes.graphics.lineTo(641,358);	
			hit_spider_eyes.graphics.lineTo(641,398);	
			hit_spider_eyes.graphics.lineTo(576,398);	
			
			hit_spider_eyes.graphics.endFill(false);
			hit_spider_eyes.alpha = 0.0;
			
			hit_spider_eyes.graphics.precisionHitTest = true;	
			this.addChild(hit_spider_eyes);
		}
		private function CreateLilBoxLidHit(open:Boolean = false):void{
			hit_lilbox_lid = new Shape();		
			hit_lilbox_lid.x = 0;
			hit_lilbox_lid.y = 0;
			hit_lilbox_lid.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_lilbox_lid.graphics.lineTo(686,183);	
				hit_lilbox_lid.graphics.lineTo(773,183);	
				hit_lilbox_lid.graphics.lineTo(776,267);	
				hit_lilbox_lid.graphics.lineTo(686,263);	
				
				
			}else{
				
				hit_lilbox_lid.graphics.lineTo(760,175);
				hit_lilbox_lid.graphics.lineTo(800,168);
				hit_lilbox_lid.graphics.lineTo(800,270);
				hit_lilbox_lid.graphics.lineTo(760,270);
			
				
			}
			
			hit_lilbox_lid.graphics.endFill(false);			
			hit_lilbox_lid.alpha = 0.0;			
			hit_lilbox_lid.graphics.precisionHitTest = true;	
			hit_lilbox_lid.touchable = false
			this.addChild(hit_lilbox_lid);
			
			
			
		}
		
		private function CreateBigBoxLidHit(open:Boolean = false):void{
			hit_bigbox_lid = new Shape();		
			hit_bigbox_lid.x = 0;
			hit_bigbox_lid.y = 0;
			hit_bigbox_lid.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_bigbox_lid.graphics.lineTo(160,117);	
				hit_bigbox_lid.graphics.lineTo(233,126);	
				hit_bigbox_lid.graphics.lineTo(236,213);	
				hit_bigbox_lid.graphics.lineTo(163,208);	
			
				
			}else{
				
				hit_bigbox_lid.graphics.lineTo(238,132);
				hit_bigbox_lid.graphics.lineTo(292,131);
				hit_bigbox_lid.graphics.lineTo(292,209);
				hit_bigbox_lid.graphics.lineTo(235,211);
				
				
			}
			
			hit_bigbox_lid.graphics.endFill(false);			
			hit_bigbox_lid.alpha = 0.0;			
			hit_bigbox_lid.graphics.precisionHitTest = true;	
			hit_bigbox_lid.touchable = false
			this.addChild(hit_bigbox_lid);
			
			
	
		}
		private function CreateDoorHit(open:Boolean = false):void{
			hit_door = new Shape();		
			hit_door.x = 0;
			hit_door.y = 0;
			hit_door.graphics.beginFill(0x0000FF);
			if(open === false){	
					
					hit_door.graphics.lineTo(27,126);	
					hit_door.graphics.lineTo(116,139);	
					hit_door.graphics.lineTo(120,373);	
					hit_door.graphics.lineTo(30,391);	
					
			}else{
					
					hit_door.graphics.lineTo(77,117);
					hit_door.graphics.lineTo(125,128);
					hit_door.graphics.lineTo(129,382);				
					hit_door.graphics.lineTo(85,388);				
								
			}				
			hit_door.graphics.endFill(false);			
			hit_door.alpha = 0.0;			
			hit_door.graphics.precisionHitTest = true;	
			hit_door.touchable = false
			this.addChild(hit_door);
			
		
		}

		
		private function CreateTableHit():void{
			hit_table = new Shape();
			hit_table.touchable = false;
			hit_table.graphics.beginFill(0x00ff00);
			
			hit_table.graphics.lineTo(238,329);	
			hit_table.graphics.lineTo(238,281);	
			hit_table.graphics.lineTo(330,263);	
			hit_table.graphics.lineTo(369,261);	
			hit_table.graphics.lineTo(493,291);	
			hit_table.graphics.lineTo(491,322);	
			hit_table.graphics.lineTo(411,359);	
			hit_table.graphics.lineTo(258,339);	
		
			
			hit_table.graphics.endFill(false);
			hit_table.alpha = 0.0;
			
			hit_table.graphics.precisionHitTest = true;	
			this.addChild(hit_table);
		}
		
		private function CreatePalHit():void{
			hit_pal = new Shape();
			hit_pal.touchable = false;
			hit_pal.graphics.beginFill(0x00ff00);
			
			hit_pal.graphics.lineTo(405,103);	
			hit_pal.graphics.lineTo(631,85);	
			hit_pal.graphics.lineTo(625,220);	
			hit_pal.graphics.lineTo(560,286);	
			hit_pal.graphics.lineTo(443,271);	
			hit_pal.graphics.lineTo(405,223);	
			
			hit_pal.graphics.endFill(false);
			hit_pal.alpha = 0.0;
			
			hit_pal.graphics.precisionHitTest = true;	
			this.addChild(hit_pal);
		}
		
		private function CreateVentHit():void{
			hit_vent = new Shape();
			hit_vent.touchable = false;
			hit_vent.graphics.beginFill(0x00ff00);
			
			hit_vent.graphics.lineTo(678,81);	
			hit_vent.graphics.lineTo(781,74);	
			hit_vent.graphics.lineTo(780,172);	
			hit_vent.graphics.lineTo(676,169);	
			
			hit_vent.graphics.endFill(false);
			hit_vent.alpha = 0.0;
			
			hit_vent.graphics.precisionHitTest = true;	
			this.addChild(hit_vent);
		}
		private function CreateElectricBoxSmallHit():void{
			hit_electricBoxSmall = new Shape();
			hit_electricBoxSmall.touchable = false;
			hit_electricBoxSmall.graphics.beginFill(0x00ff00);
			
			hit_electricBoxSmall.graphics.lineTo(679,186);	
			hit_electricBoxSmall.graphics.lineTo(772,186);	
			hit_electricBoxSmall.graphics.lineTo(776,282);	
			hit_electricBoxSmall.graphics.lineTo(675,281);	
			
			hit_electricBoxSmall.graphics.endFill(false);
			hit_electricBoxSmall.alpha = 0.0;
			
			hit_electricBoxSmall.graphics.precisionHitTest = true;	
			this.addChild(hit_electricBoxSmall);
		}
		
		private function CreateOfficeHit():void{
			hit_office = new Shape();
			hit_office.touchable = false;
			hit_office.graphics.beginFill(0x00ff00);
			
			hit_office.graphics.lineTo(0,115);	
			hit_office.graphics.lineTo(81,131);	
			hit_office.graphics.lineTo(81,383);	
			hit_office.graphics.lineTo(0,401);	
		
			hit_office.graphics.endFill(false);
			hit_office.alpha = 0.0;
			
			hit_office.graphics.precisionHitTest = true;	
			this.addChild(hit_office);
		}
		
		private function CreateElectricBoxHit():void{
			hit_electricBox = new Shape();
			hit_electricBox.touchable = false;
			hit_electricBox.graphics.beginFill(0xff0000);
			
			hit_electricBox.graphics.lineTo(165,124);	
			hit_electricBox.graphics.lineTo(231,133);	
			hit_electricBox.graphics.lineTo(228,214);	
			hit_electricBox.graphics.lineTo(167,210);	
		
			hit_electricBox.graphics.endFill(false);
			hit_electricBox.alpha = 0.0;
			
			hit_electricBox.graphics.precisionHitTest = true;	
			this.addChild(hit_electricBox);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(hit_bigbox_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BigBoxHandler();
							return;
						}
						else if(hit_vent.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(VentCoverOn === false){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangTwo();
								FadeOut((BathroomDuct as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.BathroomDuctObj,false
								);
								return;
							}else{
								if(LightsOn === true){
									VentCoverHandler();
									return;
								}
							
							}
						
						
						}
						else if(hit_ventoff.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(VentCoverOn === false){
								if(LightsOn === true){
									VentCoverHandler();
									return;
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It's too dark over there; I can't see anything...");
								}
							}
						}
						else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DoorHandler();
							return;
						}
						else if(hit_pal.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PalHandler();
							return;
						}
						else if(hit_spider_eyes.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(LightsOn === false){
								SpiderHandler();
								return;
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmm... I wonder where the spider-bot ran off to...");
								return;
							}
						
						}
						else if(hit_light.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(LightsOn === false){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There's something affixed to the ceiling");
								return;
							}else if(ComputerOn === false){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a projector attached to the ceiling.");
								return;
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The projector shines a light down onto the table.");
								return;
							}
						}						
						else if(hit_stacks.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							StacksHandler();
							return;
						}
						else if(hit_stool.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(LightsOn === false){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A stool sits silhouetted in the darkness.");
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A standard stool.");
							}
							return;
						}
						else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(LightsOn === false){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Light from the next room reflects off the linoleum floor.");
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The floor is made of waxed linoleum tiles.");
							}
							return;
						}
						else if(hit_ceiling.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(LightsOn === false){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmm... the lights are out...");
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The fluorescent lights emit a shallow light and discernible hum.");
							}
							return;
						}
						
						/*
						hit_light
						private var hit_spider_eyes:Shape;
						private var hit_floor:Shape;
						private var hit_stool:Shape;
						private var hit_ceiling:Shape;
						private var hit_stacks:Shape;
						*/
						
						else if(BigBoxIsOpen === true){
							 if(hit_electricBox.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){						
								if(LightsOn === false){
									FadeOut((ElectricBoxSmall as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.ElectricBoxSmallObj,true
									);
									return;
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The electrical panel is now functioning properly.");
									return;
								}
							}else{
															
							}	
						}
						if(DoorIsOpen === true){
							if(hit_office.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									FadeOut((Office as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeObj,false
									);
									return;
							}
						}
						if(LightsOn === true){							
								if(hit_lilbox_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									LilBoxHandler();
									return;
								}
								if(hit_table.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									FadeOut((ServerRoomTable as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.ServerRoomTableObj,true
									);
									return;
								}
								else if(LilBoxIsOpen === true){
									if(ComputerOn === false){
										if(hit_electricBoxSmall.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
											FadeOut((ElectricBox as Class), 
												(stage.getChildAt(0) as Object).screenGamePlayHandler.ElectricBoxObj,true
											);
											return;
										}	
									}else{
										(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The electric panel is now working.");	
										return;
									}
								}
						}else{
							if(hit_lilbox_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It's too dark over there; I can't see anything...");	
							}else if(hit_table.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The are some objects placed on a table in the middle the room.");	
								return;
							}
						}
					
					}
				}
			}
		}
		//StacksHandler
		
		
		private function StacksHandler():void{
			
			if(LightsOn === false){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Racks of computers stare back through the shadows.");
			}else{
				if(RONum == 0){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Tall racks of computers");
					RONum = 1;
				}else if(RONum == 1){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The machines emit quiet intermittent beeps and buzzes.");					
					RONum = 2;
				}else if(RONum == 2){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder if I can play video games on these things.");		
					RONum = 0;
				}
			}
			
			
			
		}
		
		
		private function SpiderHandler():void{
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RobotRattle();
			
			if(RONum == 0){
			(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Looks like the spider-bot is hiding...");
			RONum = 1;
			}else if(RONum == 1){
			(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I guess the little robot took a hard fall...");					
			RONum = 2;
			}else if(RONum == 2){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think it's been traumatized...");
			RONum = 0;
			}
			
		}
		
		private function VentCoverHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom;	
			}
			if(VentCoverOn === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxOpen();
				VentCoverOn = true;
				SaveArray['VentCover'] = "On";
				vent_off_fall.alpha = 0;
				vent_on.alpha = 1;
				vent_off.alpha = 0;
				if(VentCoverFirst === false){
					
					hit_ventoff.graphics.clear()					
					VentCoverFirst = true;
					CreateVentOffHit(true);
				}
					
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxClose();
				SaveArray['VentCover'] = "Off";
				VentCoverOn = false;
				vent_off_fall.alpha = 0;
				vent_on.alpha = 0;
				vent_off.alpha = 1;
			}
			
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
			
		}
		
		private function PalHandler():void{
			if(LightsOn === true){
				FadeOut((ServerRoomComputer as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ServerRoomComputerObj,true
				);
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Large stacks of computers stand shadowed in the center of the room.");				
			}
			
		}
		
		private function DoorHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom;	
			}
			if(DoorIsOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorThreeOpen();
				SaveArray['Door'] = "Open";
				DoorIsOpen = true;
				hit_door.graphics.clear();
				door.alpha = 0;
				CreateOfficeHit();
				CreateDoorHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorThreeClose();
				SaveArray['Door'] = "Closed";
		//		(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
				
				door.alpha = 1;
				DoorIsOpen = false;
				
				hit_door.graphics.clear();
				this.removeChild(hit_office)
				CreateDoorHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
		}
		private function LilBoxHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom;	
			}
			if(LilBoxIsOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpen();
				SaveArray['LilBox'] = "Open";
				LilBoxIsOpen = true;
				hit_lilbox_lid.graphics.clear();
				
				lilBox_lid.alpha = 1;
				CreateElectricBoxSmallHit();
				CreateLilBoxLidHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyClose();
				SaveArray['LilBox'] = "Closed";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
				
				lilBox_lid.alpha = 0;
				LilBoxIsOpen = false;
				
				hit_lilbox_lid.graphics.clear();
				this.removeChild(hit_electricBoxSmall)
				CreateLilBoxLidHit(false);
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
		}
		
		private function BigBoxHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoom;	
			}
			if(BigBoxIsOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpen();
				SaveArray['BigBox'] = "Open";
				BigBoxIsOpen = true;
				hit_bigbox_lid.graphics.clear();
				
				bigBox_lid.alpha = 1;
				CreateElectricBoxHit();
				CreateBigBoxLidHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyClose();
				SaveArray['BigBox'] = "Closed";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
				
				bigBox_lid.alpha = 0;
				BigBoxIsOpen = false;
				
				hit_bigbox_lid.graphics.clear();
				this.removeChild(hit_electricBox)
				CreateBigBoxLidHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoom',SaveArray);
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
			
			
			
			this.assets.removeTexture("ServerRoom_Sprite_01",true);
			this.assets.removeTextureAtlas("ServerRoom_Sprite_01",true);
			this.assets.removeTexture("ServerRoom_Sprite_02",true);
			this.assets.removeTextureAtlas("ServerRoom_Sprite_02",true);
			this.assets.removeTexture("ServerRoom_Sprite_03",true);
			this.assets.removeTextureAtlas("ServerRoom_Sprite_03",true);
			
			
			(stage.getChildAt(0) as Object).falseAsset("serverRoom_01");
			(stage.getChildAt(0) as Object).falseAsset("serverRoom_02");
			(stage.getChildAt(0) as Object).falseAsset("serverRoom_03");
			(stage.getChildAt(0) as Object).falseAsset("serverRoom_04");
			(stage.getChildAt(0) as Object).falseAsset("serverRoom_05");
			(stage.getChildAt(0) as Object).falseAsset("serverRoom_06");
			
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
