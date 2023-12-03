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
	
	public class RoboticsRoom extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var cutters:Image;
		private var door:Image;
		private var hood_on:Image;
		private var hood_up:Image;
		private var hood_holder:Image;
		private var chest:Image;
		private var lid:Image;
		private var cab_left:Image;
		private var cab_right:Image;
		private var claw:Image;
		
		private var hit_desk:Shape;
		private var hit_hercules:Shape;
		private var hit_door:Shape;
		private var hit_cutter:Shape;
		
		private var hit_koma:Shape;
		private var hit_floor:Shape;
		private var hit_arm00:Shape;
		private var hit_arm01:Shape;
		private var hit_sideTable:Shape;
		private var hit_lathe:Shape;
		private var hit_pullie:Shape;
		
		private var RONum:int = 0;
		
		private var Animating:Boolean = false;
		private var CuttersPickedUp:Boolean = false;
		private var DoorOpen:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function RoboticsRoom(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('roboticsRoom_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsRoom/roboticsRoom_bg.jpg'));
				game.TrackAssets('roboticsRoom_01');
			}
			if(game.CheckAsset('roboticsRoom_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsRoom/RoboticsRoom_Sprite_01.png'));
				game.TrackAssets('roboticsRoom_02');
			}
			if(game.CheckAsset('roboticsRoom_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsRoom/RoboticsRoom_Sprite_01.xml'));
				game.TrackAssets('roboticsRoom_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RoboticsRoom","RoboticsRoomObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			
	//		if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
	//			SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
	//		}
	//		SaveArray['Ethernet'] = "Attached";
	//		SaveArray['AdimmFried'] = "No";
	//		(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
			
			
			bg = new Image(this.assets.getTexture('roboticsRoom_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
					
			cutters = new Image(this.assets.getTexture('cutters'));
			cutters.touchable = false;
			cutters.x = 103;
			cutters.y = 273;
			
			door = new Image(this.assets.getTexture('door'));
			door.touchable = false;
			door.x = 575;
			door.y = 117;
						
			hood_on = new Image(this.assets.getTexture('koma_hood_down'));
			hood_on.touchable = false;
			hood_on.x = 421;
			hood_on.y = 201;
			
			hood_up = new Image(this.assets.getTexture('koma_hood_up'));
			hood_up.touchable = false;
			hood_up.x = 423;
			hood_up.y = 161;
			
			hood_holder = new Image(this.assets.getTexture('koma_holder_power'));
			hood_holder.touchable = false;
			hood_holder.x = 438;
			hood_holder.y = 190;
			
			chest = new Image(this.assets.getTexture('body_ribs_open'));
			chest.touchable = false;
			chest.x = 192;
			chest.y = 166;
			
			lid = new Image(this.assets.getTexture('body_head_open'));
			lid.touchable = false;
			lid.x = 188;
			lid.y = 175;
			
			cab_left = new Image(this.assets.getTexture('desk_cab_left_open'));
			cab_left.touchable = false;
			cab_left.x = 293;
			cab_left.y = 124;
			
			cab_right = new Image(this.assets.getTexture('desk_cab_right_open'));
			cab_right.touchable = false;
			cab_right.x = 346;
			cab_right.y = 125;
			
			claw = new Image(this.assets.getTexture('desk_claw'));
			claw.touchable = false;
			claw.x = 295;
			claw.y = 210;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoom != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoom['Door'] == 'Open'){	
					DoorOpen = true;
					door.alpha = 0;
				}else{
					door.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoom['Cutters'] == 'PickedUp'){	
					CuttersPickedUp = true;
					cutters.alpha = 0;
				}else{
					cutters.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoom['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoom;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsRoom',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadSoYoung(true,3);
							
						},0.5);
					}
				}
			}else{
				door.alpha = 1;
				cutters.alpha = 1;
				
				
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					//	SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsRoom',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadSoYoung(true,3);
					},0.5);
				}
				
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma['Hood'] == 'Open'){	
					hood_on.alpha = 0;
					hood_up.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma['Container'] == 'Open'){	
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma['PowerSupply'] == 'PickedUp'){	
							hood_holder.texture = this.assets.getTexture('koma_holder_empty');
							hood_holder.alpha = 1;
						}else{
							hood_holder.alpha = 1;
						}
						
					}else{
						hood_holder.alpha = 0;
					}
				}else{
					hood_on.alpha = 1;
					hood_up.alpha = 0;
					hood_holder.alpha = 0;
				}
			}else{
				hood_on.alpha = 1;
				hood_up.alpha = 0;
				hood_holder.alpha = 0;
			}
		
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk['Claw'] == 'PickedUp'){	
					claw.alpha = 0;
				}else{
					claw.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk['CabRight'] == 'Open'){
					cab_right.alpha = 1;
				}else{
					cab_right.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk['CabLeft'] == 'Open'){	
					cab_left.alpha = 1;
				}else{
					cab_left.alpha = 0;
				}
			}else{
				claw.alpha = 1;
				cab_left.alpha = 0;
				cab_right.alpha = 0;
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Chest'] == 'Open'){	
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['ChestHole'] == 'Open'){	
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['PowerSupply'] == 'Attached'){	
							chest.texture = this.assets.getTexture('body_ribs_open_hole_power');
							chest.alpha = 1;
						}else{
							chest.texture = this.assets.getTexture('body_ribs_open_hole_open');
							chest.alpha = 1;
						}
					}else{
						chest.alpha = 1;
					}
				}else{
					chest.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Lid'] == 'Open'){
					lid.alpha = 1;
				}else{
					lid.alpha = 0;
				}
			}else{
				chest.alpha = 0;
				lid.alpha = 0;
			}
		
			
		
			
			
			
			this.addChildAt(cutters,1);
			this.addChildAt(door,2);
			this.addChildAt(hood_on,3);
			this.addChildAt(hood_up,4);
			this.addChildAt(hood_holder,5);
			this.addChildAt(chest,6);
			this.addChildAt(lid,7);
			this.addChildAt(cab_left,8);
			this.addChildAt(cab_right,9);
			this.addChildAt(claw,10);
			
			CreateFloorHit();
			CreateKomaHit();
			CreateArm00Hit();
			CreateArm01Hit();
			CreateSideTableHit();
			CreateLatheHit();
			CreatePullieHit();
			
			
			CreateDeskHit();
			CreateHerculesHit();
			CreateDoorHit();
			CreateCutterHit();
		//	CreateSpinWheelHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			
			//(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ShipGroansOne",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("CityHum",0,0.5,'stop');
			//(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("WindHowl",0,0.5,'stop');
		}
		
		private function CreatePullieHit():void{
			hit_pullie = new Shape();
			hit_pullie.touchable = false;
			hit_pullie.graphics.beginFill(0x00ff00);
			
			hit_pullie.graphics.lineTo(0,0);		
			hit_pullie.graphics.lineTo(116,0);		
			hit_pullie.graphics.lineTo(258,40);		
			hit_pullie.graphics.lineTo(236,97);		
			hit_pullie.graphics.lineTo(58,115);		
			hit_pullie.graphics.lineTo(0,72);		
			
			hit_pullie.graphics.endFill(false);
			hit_pullie.alpha = 0.0;
			
			hit_pullie.graphics.precisionHitTest = true;	
			this.addChild(hit_pullie);
		}
		
		private function CreateLatheHit():void{
			hit_lathe = new Shape();
			hit_lathe.touchable = false;
			hit_lathe.graphics.beginFill(0x00ff00);
			
			hit_lathe.graphics.lineTo(0,261);		
			hit_lathe.graphics.lineTo(32,184);		
			hit_lathe.graphics.lineTo(56,186);		
			hit_lathe.graphics.lineTo(106,334);		
			hit_lathe.graphics.lineTo(71,401);		
			hit_lathe.graphics.lineTo(0,389);		
			
			hit_lathe.graphics.endFill(false);
			hit_lathe.alpha = 0.0;
			
			hit_lathe.graphics.precisionHitTest = true;	
			this.addChild(hit_lathe);
		}
		
		private function CreateSideTableHit():void{
			hit_sideTable = new Shape();
			hit_sideTable.touchable = false;
			hit_sideTable.graphics.beginFill(0x00ff00);
			
			hit_sideTable.graphics.lineTo(688,227);		
			hit_sideTable.graphics.lineTo(697,129);		
			hit_sideTable.graphics.lineTo(731,112);		
			hit_sideTable.graphics.lineTo(795,136);		
			hit_sideTable.graphics.lineTo(793,261);		
			hit_sideTable.graphics.lineTo(716,250);		
			
			hit_sideTable.graphics.endFill(false);
			hit_sideTable.alpha = 0.0;
			
			hit_sideTable.graphics.precisionHitTest = true;	
			this.addChild(hit_sideTable);
		}
		
		private function CreateArm01Hit():void{
			hit_arm01 = new Shape();
			hit_arm01.touchable = false;
			hit_arm01.graphics.beginFill(0x00ff00);
			
			hit_arm01.graphics.lineTo(558,33);		
			hit_arm01.graphics.lineTo(592,24);		
			hit_arm01.graphics.lineTo(614,30);		
			hit_arm01.graphics.lineTo(590,112);		
			hit_arm01.graphics.lineTo(521,181);		
			hit_arm01.graphics.lineTo(510,149);		
			hit_arm01.graphics.lineTo(558,102);		
			
			hit_arm01.graphics.endFill(false);
			hit_arm01.alpha = 0.0;
			
			hit_arm01.graphics.precisionHitTest = true;	
			this.addChild(hit_arm01);
		}
		
		private function CreateArm00Hit():void{
			hit_arm00 = new Shape();
			hit_arm00.touchable = false;
			hit_arm00.graphics.beginFill(0x00ff00);
			
			hit_arm00.graphics.lineTo(321,33);		
			hit_arm00.graphics.lineTo(375,40);		
			hit_arm00.graphics.lineTo(380,108);		
			hit_arm00.graphics.lineTo(415,180);		
			hit_arm00.graphics.lineTo(387,188);		
			hit_arm00.graphics.lineTo(332,112);		
			
			hit_arm00.graphics.endFill(false);
			hit_arm00.alpha = 0.0;
			
			hit_arm00.graphics.precisionHitTest = true;	
			this.addChild(hit_arm00);
		}
		
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0x00ff00);
			
			hit_floor.graphics.lineTo(105,424);		
			hit_floor.graphics.lineTo(247,328);		
			hit_floor.graphics.lineTo(681,349);		
			hit_floor.graphics.lineTo(695,416);		
			hit_floor.graphics.lineTo(598,506);		
			hit_floor.graphics.lineTo(80,501);		
			
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		private function CreateKomaHit():void{
			hit_koma = new Shape();
			hit_koma.touchable = false;
			hit_koma.graphics.beginFill(0x00ff00);
			
			hit_koma.graphics.lineTo(279,297);	
			hit_koma.graphics.lineTo(294,251);	
			hit_koma.graphics.lineTo(355,237);	
			hit_koma.graphics.lineTo(566,247);	
			hit_koma.graphics.lineTo(622,267);	
			hit_koma.graphics.lineTo(642,323);	
			hit_koma.graphics.lineTo(608,388);	
			hit_koma.graphics.lineTo(540,415);	
			hit_koma.graphics.lineTo(396,336);	
			hit_koma.graphics.lineTo(323,398);	
			
			hit_koma.graphics.endFill(false);
			hit_koma.alpha = 0.0;
			
			hit_koma.graphics.precisionHitTest = true;	
			this.addChild(hit_koma);
		}
		
		private function CreateCutterHit():void{
			hit_cutter = new Shape();
			hit_cutter.touchable = false;
			hit_cutter.graphics.beginFill(0x00ff00);
			
			hit_cutter.graphics.lineTo(91,270);	
			hit_cutter.graphics.lineTo(119,265);	
			hit_cutter.graphics.lineTo(189,373);	
			hit_cutter.graphics.lineTo(192,400);	
			hit_cutter.graphics.lineTo(144,422);	
		
			hit_cutter.graphics.endFill(false);
			hit_cutter.alpha = 0.0;
			
			hit_cutter.graphics.precisionHitTest = true;	
			this.addChild(hit_cutter);
		}
		
		private function CreateDoorHit():void{
			hit_door = new Shape();
			hit_door.touchable = false;
			hit_door.graphics.beginFill(0x00ff00);
			
			hit_door.graphics.lineTo(583,117);	
			hit_door.graphics.lineTo(681,116);	
			hit_door.graphics.lineTo(673,297);	
			hit_door.graphics.lineTo(645,295);	
			hit_door.graphics.lineTo(626,264);	
			hit_door.graphics.lineTo(578,250);	
		
			hit_door.graphics.endFill(false);
			hit_door.alpha = 0.0;
			
			hit_door.graphics.precisionHitTest = true;	
			this.addChild(hit_door);
		}
		
		private function CreateHerculesHit():void{
			hit_hercules = new Shape();
			hit_hercules.touchable = false;
			hit_hercules.graphics.beginFill(0x00ff00);
			
			hit_hercules.graphics.lineTo(368,273);	
			hit_hercules.graphics.lineTo(370,240);	
			hit_hercules.graphics.lineTo(407,193);	
			hit_hercules.graphics.lineTo(448,186);	
			hit_hercules.graphics.lineTo(494,202);	
			hit_hercules.graphics.lineTo(538,250);	
			hit_hercules.graphics.lineTo(517,314);	
			hit_hercules.graphics.lineTo(454,334);	
			hit_hercules.graphics.lineTo(400,327);	
			
			hit_hercules.graphics.endFill(false);
			hit_hercules.alpha = 0.0;
			
			hit_hercules.graphics.precisionHitTest = true;	
			this.addChild(hit_hercules);
		}
		
		
		private function CreateDeskHit():void{
			hit_desk = new Shape();
			hit_desk.touchable = false;
			hit_desk.graphics.beginFill(0xff0000);
			
			hit_desk.graphics.lineTo(58,123);	
			hit_desk.graphics.lineTo(115,115);	
			hit_desk.graphics.lineTo(167,119);	
			hit_desk.graphics.lineTo(181,102);	
			hit_desk.graphics.lineTo(324,107);	
			hit_desk.graphics.lineTo(328,121);	
			hit_desk.graphics.lineTo(373,182);	
			hit_desk.graphics.lineTo(373,217);	
			hit_desk.graphics.lineTo(340,238);	
			hit_desk.graphics.lineTo(301,247);	
			hit_desk.graphics.lineTo(285,252);	
			hit_desk.graphics.lineTo(271,304);	
			hit_desk.graphics.lineTo(235,321);	
			hit_desk.graphics.lineTo(143,323);	
			hit_desk.graphics.lineTo(134,279);	
			hit_desk.graphics.lineTo(113,247);	
			hit_desk.graphics.lineTo(73,247);	
		
			hit_desk.graphics.endFill(false);
			hit_desk.alpha = 0.0;
			
			hit_desk.graphics.precisionHitTest = true;	
			this.addChild(hit_desk);
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
							
							FadeOut((BuildingOffice as Class),
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeObj,false
							);
						}else if(hit_desk.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((RoboticsDesk as Class),
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RoboticsDeskObj,true
							);
						}else if(hit_hercules.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((RoboticsRoomKoma as Class),
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RoboticsRoomKomaObj,true
							);
						}else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DoorHandler();
						}else if(hit_cutter.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CutterHandler();
						}else if(hit_koma.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							KomaHandler();
						
						}else if(hit_arm00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ArmHandler();
						}else if(hit_arm01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ArmHandler();
						}else if(hit_sideTable.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A mechanical arm sits on the workbench, ready for testing.");	
						}else if(hit_lathe.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A type of machine used for working and shaping metal, I presume.");	
						}else if(hit_pullie.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The floor is covered by tiles made of a spongy foam material.");	
						}else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FloorHandler();
						}
					}
				}
			}
		}
		
		private function ArmHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A robotic arm with a strange instrument hangs from the ceiling.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Three robotic arms revolve around a think support attached to the ceiling.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The instrument at the tip of the arm looks designed for fine use.");	
			}
		}
		
		private function FloorHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The floor is covered by tiles made of a spongy foam material.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Colored tape has been used to create colored lines and words on the floor.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The spongy flooring gives me the slightest sensation of floating.");	
			}
		}
		
		private function KomaHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Six giant legs lift the body of the robot off the ground.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Multiple series of hydraulics and servos make up the legs of the hulking bot.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The legs of the machine are covered in a strong polyurethane housing.");	
			}
		}
		
		
		private function CutterHandler():void{
			if(CuttersPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoom != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoom;	
				}
				CuttersPickedUp = true;
				cutters.alpha = 0;
				SaveArray['Cutters'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsRoom',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_BoltCutters,
					'item_BoltCutters',
					'inven_boltCutters_sm'
				);
			}else{
				
			}
		}
		
		private function DoorHandler():void{
			if(DoorOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HeavyMetalDoorOpen();
				DoorOpen = true;
				door.alpha = 0;
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoom != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoom;	
				}
				
				SaveArray['Door'] = "Open";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsRoom',SaveArray);
				
			}else{
				FadeOut((ExteriorRear as Class),
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorRearObj,true
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
			
			
			
			this.assets.removeTexture("roboticsRoom_bg",true);
			this.assets.removeTexture("RoboticsRoom_Sprite_01",true);
			this.assets.removeTextureAtlas("RoboticsRoom_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("roboticsRoom_01");
			(stage.getChildAt(0) as Object).falseAsset("roboticsRoom_02");
			(stage.getChildAt(0) as Object).falseAsset("roboticsRoom_03");
			
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
