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
	
	
	public class RoboticsBody extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var chest_open:Image;
		private var controller:Image;
		private var cord:Image;
		private var cube:Image;
		private var ethernet:Image;
		private var eyes:Image;
		private var hole_open:Image;
		private var lid_open:Image;
		private var power_supply:Image;
		private var cap:Image;
		
		private var eyes_mc:MovieClip;
		private var mouth_mc:MovieClip;
		
		private var blood:Image;
		
		private var spark_00:Image;
		private var spark_01:Image;
		private var spark_02:Image;
		private var spark_03:Image;
		private var spark_04:Image;
		private var spark_05:Image;
		
		private var smoke:Image;
		//	private var text_block_01:Image;
		
		private var LidOpen:Boolean = false;
		private var ChestOpen:Boolean = false;
		private var ChestHoleOpen:Boolean = false;
		private var ControllerPickedUp:Boolean = false;
		
		private var CubeAttached:Boolean = false;
		private var CubeDamageAttached:Boolean = false;
		private var PowerSupplyAttached:Boolean = false;
		private var CordAttached:Boolean = false;
		private var EthernetAttached:Boolean = false;
		
		private var AdimmActive:Boolean = false;
		private var AdimmFried:Boolean = false;
		private var AdimmProgrammed:Boolean = false;
		
		
		private var hit_controller:Shape;
		private var hit_lid:Shape;
		private var hit_chest:Shape;
		private var hit_chest_two:Shape;
		private var hit_cube:Shape;
		private var hit_hole_lid:Shape;
		private var hit_hole:Shape;
		private var hit_pelvis:Shape;
		
		private var hit_book:Shape;
		
		private var hit_face:Shape;
		
		private var hit_ethernet:Shape;
		
		//	private var hit_elevator_door:Shape;
		private var openBookbg:Image;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookQuestion:Image;
		private var openBookcurrentPage:Number = 0;		
		private var hit_OpenBook:Shape;
		private var hit_OpenBookQuestion:Shape;
		public var OpenBookTween:Tween;
		public var PageFadeOutTween:Tween;
		public var PageFadeInTween:Tween;
		public var QuestionFadeInTween:Tween;
		private var BookIsOpen:Boolean = false;
		private var QuestionActive:Boolean = false;
		
		private var RONum:int = 0;
		
		public var EyesTween:Tween;
		
		public var Spark00Tween:Tween;
		public var Spark01Tween:Tween;
		public var Spark02Tween:Tween;
		public var Spark03Tween:Tween;
		public var Spark04Tween:Tween;
		public var Spark05Tween:Tween;
		public var SmokeTween:Tween;
		public var BloodTween:Tween;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function RoboticsBody(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('roboticsBody_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsBody/roboticsBody_bg.jpg'));
				game.TrackAssets('roboticsBody_01');
			}
			if(game.CheckAsset('roboticsBody_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsBody/RoboticsBody_Sprite_01.png'));
				game.TrackAssets('roboticsBody_02');
			}
			if(game.CheckAsset('roboticsBody_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsBody/RoboticsBody_Sprite_01.xml'));
				game.TrackAssets('roboticsBody_03');
			}
			if(game.CheckAsset('roboticsBody_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsBody/RoboticsBody_Sprite_02.png'));
				game.TrackAssets('roboticsBody_04');
			}
			if(game.CheckAsset('roboticsBody_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsBody/RoboticsBody_Sprite_02.xml'));
				game.TrackAssets('roboticsBody_05');
			}
			if(game.CheckAsset('roboticsBody_06') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsBody/AdimmDialogue_Sprite.png'));
				game.TrackAssets('roboticsBody_06');
			}
			if(game.CheckAsset('roboticsBody_07') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsBody/AdimmDialogue_Sprite.xml'));
				game.TrackAssets('roboticsBody_07');
			}
			
			//AdimmDialogue_Sprite
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RoboticsBody","RoboticsBodyObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		//	SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;
		//	SaveArray['FirstTime'] = 'No';
			
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
			
			bg = new Image(this.assets.getTexture('roboticsBody_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
		
			controller = new Image(this.assets.getTexture('controller'));
			controller.touchable = false;
			controller.x = 582;
			controller.y = 286;
			
			chest_open = new Image(this.assets.getTexture('chest_open'));
			chest_open.touchable = false;
			chest_open.x = 209;
			chest_open.y = 6;
			
			hole_open = new Image(this.assets.getTexture('hole_open'));
			hole_open.touchable = false;
			hole_open.x = 404;
			hole_open.y = 45;
			
			power_supply = new Image(this.assets.getTexture('power_supply'));
			power_supply.touchable = false;
			power_supply.x = 413;
			power_supply.y = 116;
			
			lid_open = new Image(this.assets.getTexture('lid_open'));
			lid_open.touchable = false;
			lid_open.x = 57;
			lid_open.y = 100;
			
			cube = new Image(this.assets.getTexture('cube'));
			cube.touchable = false;
			cube.x = 124;
			cube.y = 186;
			
			eyes = new Image(this.assets.getTexture('eyes_closed'));
			eyes.touchable = false;
			eyes.x = 167;
			eyes.y = 257;
			
			ethernet = new Image(this.assets.getTexture('ethernet'));
			ethernet.touchable = false;
			ethernet.x = 18;
			ethernet.y = 76;
			
			cord = new Image(this.assets.getTexture('cord'));
			cord.touchable = false;
			cord.x = 340;
			cord.y = 307;
			
			cap = new Image(this.assets.getTexture('cap_on'));
			cap.touchable = false;
			cap.x = 121;
			cap.y = 200;
			
			eyes_mc = new MovieClip(this.assets.getTextures("eyes_blue"),2);
			eyes_mc.touchable = false;
			eyes_mc.x = 167;
			eyes_mc.y = 257;
			eyes_mc.alpha = 0;
			eyes_mc.loop = true; 
			eyes_mc.stop();
			
			eyes_mc.addFrameAt(1,this.assets.getTexture("eyes_closed"), null, 0.5);
			eyes_mc.addFrameAt(2,this.assets.getTexture("eyes_blue"), null, 0.5);
			eyes_mc.addFrameAt(3,this.assets.getTexture("eyes_blue"), null, 0.5);
			eyes_mc.addFrameAt(4,this.assets.getTexture("eyes_blue"), null, 0.5);
			eyes_mc.addFrameAt(5,this.assets.getTexture("eyes_blue"), null, 0.5);
			eyes_mc.addFrameAt(6,this.assets.getTexture("eyes_blue"), null, 0.5);
			eyes_mc.addFrameAt(7,this.assets.getTexture("eyes_blue"), null, 0.5);
			eyes_mc.addFrameAt(8,this.assets.getTexture("eyes_blue"), null, 0.5);
			
			mouth_mc = new MovieClip(this.assets.getTextures("mouth_01"),2);
			mouth_mc.touchable = false;
			mouth_mc.x = 228;
			mouth_mc.y = 329;	
			mouth_mc.alpha = 0;
			mouth_mc.loop = true; 
			mouth_mc.stop();
			
			mouth_mc.addFrameAt(1,this.assets.getTexture("mouth_02"), null, 0.5);
			mouth_mc.addFrameAt(2,this.assets.getTexture("mouth_01"), null, 0.5);
			mouth_mc.addFrameAt(3,this.assets.getTexture("mouth_02"), null, 0.5);
			mouth_mc.addFrameAt(4,this.assets.getTexture("mouth_01"), null, 0.5);
			mouth_mc.addFrameAt(5,this.assets.getTexture("mouth_00"), null, 0.5);
			mouth_mc.addFrameAt(6,this.assets.getTexture("mouth_00"), null, 0.5);
			mouth_mc.addFrameAt(7,this.assets.getTexture("mouth_00"), null, 0.5);
			mouth_mc.addFrameAt(8,this.assets.getTexture("mouth_00"), null, 0.5);
			mouth_mc.addFrameAt(8,this.assets.getTexture("mouth_00"), null, 0.5);
			mouth_mc.addFrameAt(9,this.assets.getTexture("mouth_01"), null, 0.5);
			
			blood = new Image(this.assets.getTexture('blood'));
			blood.touchable = false;
			blood.x = 170;
			blood.y = 265;
			
			spark_00 = new Image(this.assets.getTexture('sparks_00'));
			spark_00.touchable = false;
			spark_00.x = 181;
			spark_00.y = 167;
			
			spark_01 = new Image(this.assets.getTexture('sparks_01'));
			spark_01.touchable = false;
			spark_01.x = 72;
			spark_01.y = 172;
			
			spark_02 = new Image(this.assets.getTexture('sparks_02'));
			spark_02.touchable = false;
			spark_02.x = 96;
			spark_02.y = 256;
			
			spark_03 = new Image(this.assets.getTexture('sparks_03'));
			spark_03.touchable = false;
			spark_03.x = 91;
			spark_03.y = 175;
			
			spark_04 = new Image(this.assets.getTexture('sparks_04'));
			spark_04.touchable = false;
			spark_04.x = 87;
			spark_04.y = 160;
			
			spark_05 = new Image(this.assets.getTexture('sparks_05'));
			spark_05.touchable = false;
			spark_05.x = 203;
			spark_05.y = 205;
			
			smoke = new Image(this.assets.getTexture('smoke'));
			smoke.touchable = false;
			smoke.x = 77;
			smoke.y = 0;
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer['WriteSuccess'] == 'Yes'){
					AdimmProgrammed = true;
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['AdimmActive'] == 'Yes'){
					AdimmActive = true;
					eyes.alpha = 0;
					eyes_mc.alpha = 1;
					eyes_mc.play()
					Starling.juggler.add(eyes_mc);
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['AdimmFried'] == 'Yes'){
					AdimmFried = true;
					blood.alpha = 1;
					eyes.alpha = 0;
					eyes_mc.alpha = 0;
				}else{
					blood.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Controller'] == 'PickedUp'){	
					ControllerPickedUp = true;
					controller.alpha = 0;
				}else{
					controller.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['PowerSupply'] == 'Attached'){	
					PowerSupplyAttached = true;
					
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['ChestHole'] == 'Open'){	
					ChestHoleOpen = true;
					CreateHoleHit();
					hole_open.alpha = 1;
					if(PowerSupplyAttached === true){
						power_supply.alpha = 1;
					}else{
						power_supply.alpha = 0;
					}
				}else{
					hole_open.alpha = 0;
					power_supply.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Chest'] == 'Open'){	
					ChestOpen = true;
					chest_open.alpha = 1;
					CreateHoleLidHit(ChestHoleOpen);
					
				}else{
					chest_open.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['CubeDamage'] == 'Attached'){	
					CubeDamageAttached = true;
					cube.texture = this.assets.getTexture('cube_damage');
					cube.alpha = 1;
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Cube'] == 'Attached'){	
					CubeAttached = true;
					cube.texture = this.assets.getTexture('cube');
					cube.alpha = 1;
				}else{
					cube.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Lid'] == 'Open'){	
					LidOpen = true;
					lid_open.alpha = 1;
					cap.texture = this.assets.getTexture('cap_nake');
					cap.alpha = 1;
					
					CreateCubeHit();
					ethernet.texture = this.assets.getTexture('ethernet_lid_off');
					ethernet.alpha = 0;
				}else{
					lid_open.alpha = 0;
					cap.alpha = 0;
					cube.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Cord'] == 'Attached'){	
					CordAttached = true;
					cord.alpha = 1;
				}else{
					cord.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Ethernet'] == 'Attached'){	
					EthernetAttached = true;
					//	cord.alpha = 1;
					ethernet.alpha = 1;
				}else{
					//	cord.alpha = 0;
					ethernet.alpha = 0;
				}
				
			}else{
				controller.alpha = 1;
				chest_open.alpha = 0;
				hole_open.alpha = 0;
				lid_open.alpha = 0;
				cord.alpha = 0;
				cube.alpha = 0;
				power_supply.alpha = 0;
				cap.alpha = 0;
				ethernet.alpha = 0;
				blood.alpha = 0;
				eyes.alpha = 1;	
			}
			
			spark_00.alpha = 0;
			spark_01.alpha = 0;
			spark_02.alpha = 0;
			spark_03.alpha = 0;
			spark_04.alpha = 0;
			spark_05.alpha = 0;
			smoke.alpha = 0;
			
			
			
			
			/*			
			private var blood:Image;			
			private var spark_00:Image;
			private var spark_01:Image;
			private var spark_02:Image;
			private var spark_03:Image;
			private var spark_04:Image;
			private var spark_05:Image;
			*/
			
			this.addChildAt(controller,1);
			this.addChildAt(chest_open,2);
			this.addChildAt(hole_open,3);
			this.addChildAt(power_supply,4);
			this.addChildAt(lid_open,5);
			this.addChildAt(cube,6);
			this.addChildAt(eyes,7);
			this.addChildAt(eyes_mc,8);
			this.addChildAt(mouth_mc,9);
			this.addChildAt(cap,10);
			this.addChildAt(ethernet,11);
			this.addChildAt(cord,12);
			this.addChildAt(blood,13);
			this.addChildAt(spark_00,14);
			this.addChildAt(spark_01,15);
			this.addChildAt(spark_02,16);
			this.addChildAt(spark_03,17);
			this.addChildAt(spark_04,18);
			this.addChildAt(spark_05,19);
			this.addChildAt(smoke,20);
			
			//	this.addChildAt(text_block_01,11);
			
			//	CreateElevatorDoorHit();
			CreateContollerHit();
			CreateLidHit(LidOpen);
			CreateChestHit(ChestOpen);
			CreatePelvisHit();
			CreateFaceHit();
			CreateEthernetHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['CurrentPage'] != undefined){	
					openBookcurrentPage = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['CurrentPage'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Book'] == 'Open'){	
					BookIsOpen = true;
					eyes.alpha = 0;
					eyes_mc.alpha = 1;
					mouth_mc.alpha = 1;
					eyes_mc.play();
					mouth_mc.play();
					Starling.juggler.add(eyes_mc);	
					Starling.juggler.add(mouth_mc);	
					OpenBook(false);
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['FirstTime'] == 'Yes'){	
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadSolo(true,3);
							
						},0.5);
					}
				}
			}else{
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					//	SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadSolo(true,3);
						
					},0.5);
				}
			}
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			if(AdimmFried === false){
				if(AdimmActive === true){
					(stage.getChildAt(0) as Object).AmbientObj.LoadElectricHum(true,0);
				}
			}
			
			//	OpenBook();
		}
		/*
		private var hit_controller:Shape;
		private var hit_lid:Shape;
		private var hit_chest:Shape;
		private var hit_cube:Shape;
		private var hit_hole_lid:Shape;
		private var hit_hole:Shape;
		*/
		
		private function CreateHoleLidHit(open:Boolean = false):void{
			hit_hole_lid = new Shape();
			
			if(open === false){
				
				hit_hole_lid.x = 0;
				hit_hole_lid.y = 0;
				hit_hole_lid.graphics.beginFill(0x0000FF);
				
				hit_hole_lid.graphics.lineTo(400,110);
				hit_hole_lid.graphics.lineTo(421,89);
				hit_hole_lid.graphics.lineTo(471,89);
				hit_hole_lid.graphics.lineTo(490,112);
				hit_hole_lid.graphics.lineTo(486,143);
				hit_hole_lid.graphics.lineTo(472,177);
				hit_hole_lid.graphics.lineTo(433,170);
				hit_hole_lid.graphics.lineTo(400,176);
				
				hit_hole_lid.graphics.endFill(false);
				
				hit_hole_lid.alpha = 0.0;
				
				hit_hole_lid.graphics.precisionHitTest = true;	
			}else{
				
				hit_hole_lid.x = 0;
				hit_hole_lid.y = 0;
				hit_hole_lid.graphics.beginFill(0x0000FF);	
				
				hit_hole_lid.graphics.lineTo(392,48);
				hit_hole_lid.graphics.lineTo(425,33);
				hit_hole_lid.graphics.lineTo(453,35);
				hit_hole_lid.graphics.lineTo(478,51);
				hit_hole_lid.graphics.lineTo(485,80);
				hit_hole_lid.graphics.lineTo(480,116);
				hit_hole_lid.graphics.lineTo(474,120);
				hit_hole_lid.graphics.lineTo(445,107);
				hit_hole_lid.graphics.lineTo(407,114);			
				
				hit_hole_lid.graphics.endFill(false);
				hit_hole_lid.alpha = 0.0;
				
				hit_hole_lid.graphics.precisionHitTest = true;				
			}
			hit_hole_lid.touchable = false;
			
			this.addChild(hit_hole_lid);
			
		}	
		
		
		private function CreateChestHit(open:Boolean = false):void{
			hit_chest = new Shape();
			
			if(open === false){
				
				hit_chest.x = 0;
				hit_chest.y = 0;
				hit_chest.graphics.beginFill(0x0000FF);
				
				hit_chest.graphics.lineTo(323,191);
				hit_chest.graphics.lineTo(338,65);
				hit_chest.graphics.lineTo(391,35);
				hit_chest.graphics.lineTo(493,32);
				hit_chest.graphics.lineTo(561,66);
				hit_chest.graphics.lineTo(555,165);
				hit_chest.graphics.lineTo(527,247);
				hit_chest.graphics.lineTo(496,252);
				hit_chest.graphics.lineTo(435,230);
				hit_chest.graphics.lineTo(403,230);
				hit_chest.graphics.lineTo(348,248);
				
				hit_chest.graphics.endFill(false);
				
				hit_chest.alpha = 0.0;
				
				hit_chest.graphics.precisionHitTest = true;	
			}else{
				
				hit_chest.x = 0;
				hit_chest.y = 0;
				hit_chest.graphics.beginFill(0x0000FF);	
				
				hit_chest.graphics.lineTo(223,139);
				hit_chest.graphics.lineTo(220,103);
				hit_chest.graphics.lineTo(275,10);
				hit_chest.graphics.lineTo(344,3);
				hit_chest.graphics.lineTo(356,16);
				hit_chest.graphics.lineTo(333,55);
				hit_chest.graphics.lineTo(360,136);
				hit_chest.graphics.lineTo(325,218);
				hit_chest.graphics.lineTo(256,189);
				
				hit_chest.graphics.endFill(false);
				hit_chest.alpha = 0.0;
				
				hit_chest.graphics.precisionHitTest = true;			
				
				hit_chest_two = new Shape();
				
				hit_chest_two.x = 0;
				hit_chest_two.y = 0;
				hit_chest_two.graphics.beginFill(0x0000FF);	
				
				hit_chest_two.graphics.lineTo(528,99);
				hit_chest_two.graphics.lineTo(568,53);
				hit_chest_two.graphics.lineTo(556,5);
				hit_chest_two.graphics.lineTo(563,0);
				hit_chest_two.graphics.lineTo(601,0);
				hit_chest_two.graphics.lineTo(648,33);
				hit_chest_two.graphics.lineTo(656,120);
				hit_chest_two.graphics.lineTo(570,224);
				hit_chest_two.graphics.lineTo(526,224);
				
				
				hit_chest_two.graphics.endFill(false);
				hit_chest_two.alpha = 0.0;
				
				hit_chest_two.graphics.precisionHitTest = true;		
				hit_chest_two.touchable = false;
				this.addChild(hit_chest_two);
			}
			hit_chest.touchable = false;
			
			this.addChild(hit_chest);
			
		}	
		
		private function CreateLidHit(open:Boolean = false):void{
			hit_lid = new Shape();
			
			if(open === false){
				
				hit_lid.x = 0;
				hit_lid.y = 0;
				hit_lid.graphics.beginFill(0x0000FF);
				
				hit_lid.graphics.lineTo(68,229);
				hit_lid.graphics.lineTo(81,190);
				hit_lid.graphics.lineTo(151,158);
				hit_lid.graphics.lineTo(198,163);
				hit_lid.graphics.lineTo(233,190);
				hit_lid.graphics.lineTo(218,229);
				hit_lid.graphics.lineTo(166,263);
				hit_lid.graphics.lineTo(90,276);
				
				hit_lid.graphics.endFill(false);
				
				hit_lid.alpha = 0.0;
				
				hit_lid.graphics.precisionHitTest = true;	
			}else{
				
				hit_lid.x = 0;
				hit_lid.y = 0;
				hit_lid.graphics.beginFill(0x0000FF);	
				
				hit_lid.graphics.lineTo(45,146);
				hit_lid.graphics.lineTo(52,118);
				hit_lid.graphics.lineTo(122,88);
				hit_lid.graphics.lineTo(147,95);
				hit_lid.graphics.lineTo(145,110);
				hit_lid.graphics.lineTo(136,123);
				hit_lid.graphics.lineTo(151,181);
				hit_lid.graphics.lineTo(95,206);
				hit_lid.graphics.lineTo(85,224);
				hit_lid.graphics.lineTo(63,189);
				
				hit_lid.graphics.endFill(false);
				hit_lid.alpha = 0.0;
				
				hit_lid.graphics.precisionHitTest = true;				
			}
			hit_lid.touchable = false;
			
			this.addChild(hit_lid);
			
		}	
		//		/hit_ethernet
		
		private function CreateEthernetHit():void{
			hit_ethernet = new Shape();
			hit_ethernet.touchable = false;
			hit_ethernet.graphics.beginFill(0xff0000);
			
			hit_ethernet.graphics.lineTo(63,39);	
			hit_ethernet.graphics.lineTo(118,37);	
			hit_ethernet.graphics.lineTo(129,118);	
			hit_ethernet.graphics.lineTo(75,128);	
			
			hit_ethernet.graphics.endFill(false);
			hit_ethernet.alpha = 0;
			
			hit_ethernet.graphics.precisionHitTest = true;	
			this.addChild(hit_ethernet);
		}
		
		private function CreatePelvisHit():void{
			hit_pelvis = new Shape();
			hit_pelvis.touchable = false;
			hit_pelvis.graphics.beginFill(0xff0000);
			
			hit_pelvis.graphics.lineTo(356,302);	
			hit_pelvis.graphics.lineTo(356,265);	
			hit_pelvis.graphics.lineTo(408,257);	
			hit_pelvis.graphics.lineTo(450,288);	
			hit_pelvis.graphics.lineTo(453,338);	
			hit_pelvis.graphics.lineTo(430,358);	
			hit_pelvis.graphics.lineTo(379,355);	
			
			hit_pelvis.graphics.endFill(false);
			hit_pelvis.alpha = 0.0;
			
			hit_pelvis.graphics.precisionHitTest = true;	
			this.addChild(hit_pelvis);
		}
		
		private function CreateFaceHit():void{
			hit_face = new Shape();
			hit_face.touchable = false;
			hit_face.graphics.beginFill(0xff0000);
			
			hit_face.graphics.lineTo(122,265);	
			hit_face.graphics.lineTo(233,210);	
			hit_face.graphics.lineTo(270,266);	
			hit_face.graphics.lineTo(288,365);	
			hit_face.graphics.lineTo(250,392);	
			hit_face.graphics.lineTo(154,360);	
			
			hit_face.graphics.endFill(false);
			hit_face.alpha = 0.0;
			
			hit_face.graphics.precisionHitTest = true;	
			this.addChild(hit_face);
		}
		
		private function CreateCubeHit():void{
			hit_cube = new Shape();
			hit_cube.touchable = false;
			hit_cube.graphics.beginFill(0xff0000);
			
			hit_cube.graphics.lineTo(93,213);	
			hit_cube.graphics.lineTo(163,171);	
			hit_cube.graphics.lineTo(193,179);	
			hit_cube.graphics.lineTo(209,202);	
			hit_cube.graphics.lineTo(180,224);	
			hit_cube.graphics.lineTo(136,241);	
			
			hit_cube.graphics.endFill(false);
			hit_cube.alpha = 0.0;
			
			hit_cube.graphics.precisionHitTest = true;	
			this.addChild(hit_cube);
		}
		
		private function CreateHoleHit():void{
			hit_hole = new Shape();
			hit_hole.touchable = false;
			hit_hole.graphics.beginFill(0xff0000);
			
			hit_hole.graphics.lineTo(400,122);	
			hit_hole.graphics.lineTo(422,108);	
			hit_hole.graphics.lineTo(461,107);	
			hit_hole.graphics.lineTo(486,120);	
			hit_hole.graphics.lineTo(476,172);	
			hit_hole.graphics.lineTo(436,171);	
			hit_hole.graphics.lineTo(398,173);	
			
			hit_hole.graphics.endFill(false);
			hit_hole.alpha = 0.0;
			
			hit_hole.graphics.precisionHitTest = true;	
			this.addChild(hit_hole);
		}
		
		private function CreateContollerHit():void{
			hit_controller = new Shape();
			hit_controller.touchable = false;
			hit_controller.graphics.beginFill(0xff0000);
			
			hit_controller.graphics.lineTo(553,360);	
			hit_controller.graphics.lineTo(590,263);	
			hit_controller.graphics.lineTo(655,274);	
			hit_controller.graphics.lineTo(620,386);	
			
			hit_controller.graphics.endFill(false);
			hit_controller.alpha = 0.0;
			
			hit_controller.graphics.precisionHitTest = true;	
			this.addChild(hit_controller);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(touches[0].phase == TouchPhase.ENDED) {
					if(Animating === false){
						if(BookIsOpen === false){
							trace(touches[0].globalX+" ,"+touches[0].globalY);
							if(ChestOpen === true){
								if(hit_chest_two.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									ChestHandler();
									return;
								}else if(hit_hole_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									HoleLidHandler();
									return;
								}else if(ChestHoleOpen === true){
									if(hit_hole.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
										HoleHandler();
										return;
									}
								}
							}
							if(LidOpen === true){
								if(hit_cube.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									if((stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.armedItem
										== 
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.inventoryBarObj
										.item_Ethernet)
									{
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();	
										EthernetAttached = true;
										ethernet.texture = this.assets.getTexture('ethernet_lid_off');
										ethernet.alpha = 1;
										
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
										}
										SaveArray['Ethernet'] = "Attached";
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
										
										
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
											.InventoryObj.removeItemFromInventory(
												(stage.getChildAt(0) as Object)
												.screenGamePlayHandler
												.InventoryObj.item_Ethernet,
												"item_Ethernet"
											);
										
									}else{
										trace("BARK BARK");
										CubeHandler();
										return;
									}
									
								}else if(hit_ethernet.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									if((stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.armedItem
										== 
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.inventoryBarObj
										.item_Ethernet)
									{
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();	
										EthernetAttached = true;
										ethernet.texture = this.assets.getTexture('ethernet_lid_off');
										ethernet.alpha = 1;
										
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
										}
										SaveArray['Ethernet'] = "Attached";
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
										
										
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
											.InventoryObj.removeItemFromInventory(
												(stage.getChildAt(0) as Object)
												.screenGamePlayHandler
												.InventoryObj.item_Ethernet,
												"item_Ethernet"
											);
									}else{
										if(EthernetAttached === false){
											(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An Ethernet port.");
										}else{
											(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've placed the Ethernet cable into the port.");
										}
									}
								}
							}else{
								if(hit_ethernet.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									if((stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.armedItem
										== 
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.inventoryBarObj
										.item_Ethernet)
									{
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();	
										EthernetAttached = true;
										//	ethernet.texture = this.assets.getTexture('ethernet_lid_off');
										ethernet.alpha = 1;
										
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
										}
										SaveArray['Ethernet'] = "Attached";
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
										
										
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
											.InventoryObj.removeItemFromInventory(
												(stage.getChildAt(0) as Object)
												.screenGamePlayHandler
												.InventoryObj.item_Ethernet,
												"item_Ethernet"
											);
									}else{
										if(EthernetAttached === false){
											(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An Ethernet port.");
										}else{
											(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've placed the Ethernet cable into the port.");
										}
										
									}
								}
							}
							
							
							if(targ == goback.SourceImage){							
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((RoboticsDesk as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.RoboticsDeskObj,true
								);
							}else if(hit_chest.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ChestHandler();
							}else if(hit_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(AdimmFried === false){
									LidHandler();
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The head casing has fused shut...");
								}
							}else if(hit_controller.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ControllerHandler();
							}else if(hit_pelvis.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PelvisHandler();
							}else if(hit_face.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(AdimmActive === true){
									if(AdimmFried === false){
										BookIsOpen = true;
										mouth_mc.alpha = 1;
										mouth_mc.play();
										OpenBook(true);
									}else{
										(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think ADIMM's circuits fried...");
									}								
								}else{
									
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The face mask has a blank, peaceful expression...");
								}
							}
						}else{
							
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								trace("GoBackClick");
								RemoveBook();
								BookIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;
								}		
								SaveArray['Book'] = "Closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
							}else if(hit_OpenBook.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(QuestionActive === false){
									if(openBookcurrentPage == 0){
										openBookcurrentPage = 1;
										FadeOutBookPage();
									}else if(openBookcurrentPage == 1){
										QuestionActive = true;
										FadeInQuestion();
									}	
								}
							}else if(hit_OpenBookQuestion.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(QuestionActive === true){
									QuestionActive = false;
									QuestionHandler();
								}
							}else if(hit_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(openBookcurrentPage === 2){
									
									if((stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.armedItem
										== 
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.inventoryBarObj
										.item_Ethernet)
									{
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();	
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;
										}		
										SaveArray['Ethernet'] = "Attached";
										
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
										openBookcurrentPage = 3;
										EthernetAttached = true;
										ethernet.alpha = 1;
										FadeOutBookPage();										
										
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
											.InventoryObj.removeItemFromInventory(
												(stage.getChildAt(0) as Object)
												.screenGamePlayHandler
												.InventoryObj.item_Ethernet,
												"item_Ethernet"
											);
										
									}
									
								}
							}
						}
					}
				}
			}
		}
		/*
		FRY ANIMATES
		blood.alpha = 0;
		spark_00.alpha = 0;
		spark_01.alpha = 0;
		spark_02.alpha = 0;
		spark_03.alpha = 0;
		spark_04.alpha = 0;
		spark_05.alpha = 0;
		public var Spark00Tween:Tween;
		public var Spark01Tween:Tween;
		public var Spark02Tween:Tween;
		public var Spark03Tween:Tween;
		public var Spark04Tween:Tween;
		public var Spark05Tween:Tween;
		public var BloodTween:Tween;
		
		*/
		private function FryAdimm():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;
			}		
			SaveArray['AdimmFried'] = "Yes";
			SaveArray['Book'] = "Closed";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);		
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Electofy();
			AdimmFried = true;
			Animating = true;
			Spark00Tween = new Tween(spark_00, 1, Transitions.EASE_IN_OUT_BOUNCE);
			Spark00Tween.fadeTo(1);
			eyes_mc.play();
			mouth_mc.play();
			Spark00Tween.onComplete = function():void{
				eyes_mc.alpha = 0;
				Spark00Tween = null;
				FryAdimmOne();
			};
			Starling.juggler.add(Spark00Tween);	
		}
		public function FryAdimmOne():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
			Spark01Tween = new Tween(spark_01, 1, Transitions.EASE_IN_OUT_BOUNCE);
			Spark01Tween.fadeTo(1);
			Spark01Tween.onComplete = function():void{
				eyes_mc.alpha = 1;
				FryAdimmTwo()
			};
			
			Spark00Tween = new Tween(spark_00, 1, Transitions.EASE_IN_OUT_BOUNCE);
			Spark00Tween.fadeTo(0);
			Spark00Tween.onComplete = function():void{
				Spark00Tween = null;
				
			};
			Starling.juggler.add(Spark00Tween);	
			Starling.juggler.add(Spark01Tween);			
		}
		public function FryAdimmTwo():void{
			Spark02Tween = new Tween(spark_02, 1, Transitions.EASE_IN_OUT_BOUNCE);
			Spark02Tween.fadeTo(1);
			Spark02Tween.onComplete = function():void{
				FryAdimmThree();
				eyes_mc.alpha = 0;
				mouth_mc.alpha = 0;
			};
			
			Spark01Tween = new Tween(spark_01, 1, Transitions.EASE_IN_OUT_BOUNCE);
			Spark01Tween.fadeTo(0);
			Spark01Tween.onComplete = function():void{
				Spark01Tween = null;
				
				
			};
			Starling.juggler.add(Spark01Tween);	
			Starling.juggler.add(Spark02Tween);			
		}
		public function FryAdimmThree():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
			Spark03Tween = new Tween(spark_03, 1, Transitions.EASE_IN_OUT_BOUNCE);
			Spark03Tween.fadeTo(1);
			Spark03Tween.onComplete = function():void{
				eyes_mc.alpha = 1;
				mouth_mc.alpha = 1;
				FryAdimmFour();
			};
			
			Spark02Tween = new Tween(spark_02, 1, Transitions.EASE_IN_OUT_BOUNCE);
			Spark02Tween.fadeTo(0);
			Spark02Tween.onComplete = function():void{
				Spark02Tween = null;
			};
			Starling.juggler.add(Spark02Tween);	
			Starling.juggler.add(Spark03Tween);			
		}
		public function FryAdimmFour():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Electofy();
			Spark04Tween = new Tween(spark_04, 1, Transitions.EASE_IN_OUT_BOUNCE);
			Spark04Tween.fadeTo(1);
			Spark04Tween.onComplete = function():void{
				eyes_mc.alpha = 0;
				mouth_mc.alpha = 1;
				FryAdimmFive();
			};
			
			Spark03Tween = new Tween(spark_03, 1, Transitions.EASE_IN_OUT_BOUNCE);
			Spark03Tween.fadeTo(0);
			Spark03Tween.onComplete = function():void{
				Spark03Tween = null;
			};
			Starling.juggler.add(Spark03Tween);	
			Starling.juggler.add(Spark04Tween);			
		}
		public function FryAdimmFive():void{
			Spark05Tween = new Tween(spark_05, 1, Transitions.EASE_IN_OUT_BOUNCE);
			Spark05Tween.fadeTo(1);
			Spark05Tween.onComplete = function():void{
				eyes_mc.alpha = 0;
				mouth_mc.alpha = 0;
				FryAdimmSix();
			};
			
			Spark04Tween = new Tween(spark_04, 1, Transitions.EASE_IN_OUT_BOUNCE);
			Spark04Tween.fadeTo(0);
			Spark04Tween.onComplete = function():void{
				Spark04Tween = null;
			};
			Starling.juggler.add(Spark04Tween);	
			Starling.juggler.add(Spark05Tween);			
		}
		public function FryAdimmSix():void{
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("ElectricHum",0,0.5,'stop');
			Spark05Tween = new Tween(spark_05, 1, Transitions.EASE_IN_OUT_BOUNCE);
			Spark05Tween.fadeTo(0);
			Spark05Tween.onComplete = function():void{
				
				Spark05Tween = null;
			};
			SmokeTween = new Tween(smoke, 1, Transitions.EASE_IN);
			SmokeTween.fadeTo(1);
			SmokeTween.onComplete = function():void{
				FadeOutSmoke();
				
			};
			
			BloodTween = new Tween(blood, 3, Transitions.LINEAR);
			BloodTween.fadeTo(1);
			BloodTween.onComplete = function():void{
				Animating = false;
			};
			
			
			Starling.juggler.add(Spark05Tween);	
			Starling.juggler.add(SmokeTween);	
			Starling.juggler.add(BloodTween);		
		}
		public function FadeOutSmoke():void{
			SmokeTween = new Tween(smoke, 1, Transitions.EASE_IN);
			SmokeTween.fadeTo(0);
			SmokeTween.onComplete = function():void{
				
				SmokeTween = null;
			};
			Starling.juggler.add(SmokeTween);	
		}
		
		/*
		TEXT ANIMATES
		*/
		
		private function StaticHandler():void{
			trace("KEOW 00");
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_06();
			Animating = true;	
			openBookQuestion.texture = this.assets.getTexture('static');
			openBookQuestion.x = 306; 
			openBookQuestion.y = 165;
			openBookQuestion.readjustSize();
			QuestionFadeInTween = new Tween(openBookQuestion, 0.5, Transitions.LINEAR);
			QuestionFadeInTween.fadeTo(1);
			QuestionFadeInTween.onComplete = function():void{
				Starling.juggler.delayCall(function():void{
					PlayFryMusic();
					BookIsOpen = false;	
					FryAdimm();
					RemoveBook(true);
				},2.5);
				
				
			};
			Starling.juggler.add(QuestionFadeInTween);	
		}
		
		private function PlayFryMusic():void{
			if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
		
				(stage.getChildAt(0) as Object).MusicObj.LoadEzekiel(true,1);
				
			}
		}
		
		
		private function QuestionHandler():void{
			Animating = true;	
			QuestionFadeInTween = new Tween(openBookQuestion, 0.5, Transitions.LINEAR);
			QuestionFadeInTween.fadeTo(0);
			QuestionFadeInTween.onComplete = function():void{
				openBookcurrentPage = 2;
				FadeOutBookPage();				
				QuestionFadeInTween = null;
			};
			Starling.juggler.add(QuestionFadeInTween);	
		}
		
		public function FadeOutBookPage():void{
			Animating = true;
			PageFadeOutTween = new Tween(openBookPages, 0.5, Transitions.LINEAR);
			PageFadeOutTween.fadeTo(0);
			PageFadeOutTween.onComplete = function():void{
				
				FadeInBookPage();
				//	CreateOpenNotePadHit();
			};
			Starling.juggler.add(PageFadeOutTween);	
			
		}
		public function FadeInBookPage():void{
			if(openBookcurrentPage == 0){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_00();
			}else if(openBookcurrentPage == 1){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_01();
				openBookPages.texture = this.assets.getTexture('how_may_i');
			}else if(openBookcurrentPage == 2){
				
				if(EthernetAttached === false){		
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_02();
					openBookPages.texture = this.assets.getTexture('please_connect_me');
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_03();		
					openBookPages.texture = this.assets.getTexture('i_will_try');
				}
			}else if(openBookcurrentPage == 3){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_04();	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;
				}		
				SaveArray['AdimmFried'] = "Yes";
				SaveArray['Book'] = "Closed";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);				
				openBookPages.texture = this.assets.getTexture('now_attempting_to');
			}else if(openBookcurrentPage == 4){				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_05();
				
				
				
				openBookPages.texture = this.assets.getTexture('the_door_is');
			}
			
			PageFadeInTween = new Tween(openBookPages, 0.5, Transitions.LINEAR);
			PageFadeInTween.fadeTo(1);
			PageFadeInTween.onComplete = function():void{				
				if(openBookcurrentPage == 0){
				}else if(openBookcurrentPage == 1){
				}else if(openBookcurrentPage == 2){
					if(EthernetAttached === true){
						openBookcurrentPage = 3;
						Starling.juggler.delayCall(FadeOutBookPage,2);					
					}else{
						Animating = false;
					}				
				}else if(openBookcurrentPage == 3){
					openBookcurrentPage = 4;
					trace("KEOW 06");
					Starling.juggler.delayCall(FadeOutBookPage,2)
				}else if(openBookcurrentPage == 4){
					openBookcurrentPage = 6;
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
					},1);					
					Starling.juggler.delayCall(StaticHandler,3);
				//	Starling.juggler.delayCall(FadeOutBookPage,2)
				}else if(openBookcurrentPage == 5){
					trace("KEOW 03");
				}else if(openBookcurrentPage == 6){
					trace("KEOW 07");
				//	Starling.juggler.delayCall(function():void{
				//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
				//	},1);					
				//	Starling.juggler.delayCall(StaticHandler,3);
				}
				if(openBookcurrentPage == 2){
					//		Starling.juggler.delayCall(FadeOutBookPage,2)
					/*			if(EthernetAttached === true){
					trace("KEOW 04");
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_03();
					openBookcurrentPage = 3;
					Starling.juggler.delayCall(FadeOutBookPage,2)
					
					}else{
					trace("KEOW 05");
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_03();
					Animating = false;
					}*/
				}else if(openBookcurrentPage == 3){
					/*		openBookcurrentPage = 4;
					trace("KEOW 06");
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_04();
					Starling.juggler.delayCall(FadeOutBookPage,2)
					//FadeOutBookPage();*/
				}else if(openBookcurrentPage == 4){
					
					/*		trace("KEOW 07");
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_05();
					Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
					},1);
					
					Starling.juggler.delayCall(StaticHandler,3);
					*/	
				}else{
					Animating = false;
				}
				
				//	CreateOpenNotePadHit();
			};
			Starling.juggler.add(PageFadeInTween);	
		}
		private function FadeInQuestion():void{
			Animating = true;	
			QuestionFadeInTween = new Tween(openBookQuestion, 0.5, Transitions.LINEAR);
			QuestionFadeInTween.fadeTo(1);
			QuestionFadeInTween.onComplete = function():void{
				Animating = false;	
				QuestionFadeInTween = null;
			};
			Starling.juggler.add(QuestionFadeInTween);	
		}
		
		/*
		BOOK ANIMATES
		*/
		
		private function OpenBook(Fade:Boolean = false,page:Number = 0):void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;
			}		
			SaveArray['Book'] = 'Open';
			
			Animating = true;
			openBook = new Sprite();
			openBook.alpha = 0;
			//CreateOpenBookBg();
			openBookbg = new Image(this.assets.getTexture('book_bg'));
			openBookbg.touchable = false;
			openBookbg.x = 0;
			openBookbg.y = 0;
			openBookbg.width = 800;
			openBookbg.height = 512;
			openBookbg.alpha = 0.5;
			
			openBookPages = new Image(this.assets.getTexture('hello_my_name'));
			openBookPages.touchable = false;
			openBookPages.x = 139;
			openBookPages.y = 0			
			
			openBookQuestion = new Image(this.assets.getTexture('theres_a_door'));
			openBookQuestion.touchable = false;
			openBookQuestion.x = 330;
			openBookQuestion.y = 246;
			openBookQuestion.alpha = 0;	
			
			this.openBook.addChildAt(openBookbg,0);
			openBookPages.touchable = false;
			openBook.addChild(openBookPages);
			openBook.addChild(openBookQuestion);
			
			
			this.addChild(openBook);
			this.addChild(goback);
			
			if(openBookcurrentPage == 0){
				trace("KEOW 07");
				openBookcurrentPage = 0;
				openBookPages.texture = this.assets.getTexture('hello_my_name');
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_00();
			}else if(openBookcurrentPage == 1){
				trace("KEOW 09");
				openBookcurrentPage = 1;
				openBookPages.texture = this.assets.getTexture('how_may_i');
				openBookQuestion.alpha = 1;
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_01();
			}else if(openBookcurrentPage == 2){
				openBookcurrentPage = 2;
				if(EthernetAttached === false){
					trace("KEOW 10");
					openBookPages.texture = this.assets.getTexture('please_connect_me');
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_02();
				}else{
					trace("KEOW 11");
					openBookcurrentPage = 3;
					openBookPages.texture = this.assets.getTexture('i_will_try');
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_03();
					Starling.juggler.delayCall(FadeOutBookPage,2);		
				}			
			}else if(openBookcurrentPage == 3){
				trace("KEOW 12")
				openBookcurrentPage = 3;
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Adimm_04();
				openBookPages.texture = this.assets.getTexture('now_attempting_to');
				
				SaveArray['AdimmFried'] = "Yes";
				SaveArray['Book'] = "Closed";
				Starling.juggler.delayCall(FadeOutBookPage,2);		
				
			}
			
			CreateOpenBookHit();
			//CreateOpenBookHit(openBookcurrentPage);
			
			if(Fade === false){
				Animating = false;
				openBook.alpha = 1;
				//	CreateOpenBookHit();
			}else{
				
				OpenBookTween = new Tween(openBook, 0.5, Transitions.LINEAR);
				OpenBookTween.fadeTo(1);
				OpenBookTween.onComplete = function():void{
					if(openBookcurrentPage === 3){
						openBookcurrentPage = 4;
						Starling.juggler.delayCall(function():void{
							FadeOutBookPage();
						},2.5);
						
					}else{
						Animating = false;
					}
					
				};
				Starling.juggler.add(OpenBookTween);	
				
			}
			SaveArray['CurrentPage'] = openBookcurrentPage;
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
			//	CreateOpenBookHit(page);
		}
		private function RemoveBook(fryAdimm:Boolean = false):void{
			Animating = true;
			//	Starling.juggler.purge();
			//	if(fryAdimm === true){
			
			//		FryAdimm();
			//	}
			OpenBookTween = new Tween(openBook, 0.5, Transitions.LINEAR);
			OpenBookTween.fadeTo(0);
			OpenBookTween.onComplete = function():void{
				hit_OpenBook.graphics.clear();
				hit_OpenBook = null;
				hit_OpenBookQuestion.graphics.clear();
				hit_OpenBookQuestion = null;
				
				CloseBook();
				if(fryAdimm === true){
					
					//	FryAdimm();
				}else{
					Animating = false;
				}
				
				OpenBookTween = null;
			};
			Starling.juggler.add(OpenBookTween);		
		}
		
		public function CloseBook():void{
			mouth_mc.alpha = 0;
			this.removeChild(openBook);
			openBook.dispose();
		}
		
		private function CreateOpenBookBg():void{
			//		openBookbg = new Shape();
			//		openBookbg.graphics.beginFill(0x000000);
			//		openBookbg.graphics.lineTo(0,0);	
			//		openBookbg.graphics.lineTo(800,0);	
			//		openBookbg.graphics.lineTo(800,512);	
			//		openBookbg.graphics.lineTo(0,512);	
			//		openBookbg.touchable = false;
			//		openBookbg.graphics.endFill(false);
			//		openBookbg.alpha = 0.5;
			//	openBookbg.graphics.precisionHitTest = true;				
			
		}	
		
		private function CreateOpenBookHit():void{
			hit_OpenBookQuestion = new Shape();
			hit_OpenBookQuestion.touchable = false;
			hit_OpenBookQuestion.graphics.beginFill(0xff0000);
			
			hit_OpenBookQuestion.graphics.lineTo(328,250);	
			hit_OpenBookQuestion.graphics.lineTo(696,247);	
			hit_OpenBookQuestion.graphics.lineTo(771,345);	
			hit_OpenBookQuestion.graphics.lineTo(683,412);	
			hit_OpenBookQuestion.graphics.lineTo(365,405);	
			
			hit_OpenBookQuestion.graphics.endFill(false);
			hit_OpenBookQuestion.alpha = 0.0;
			
			hit_OpenBookQuestion.graphics.precisionHitTest = true;							
			
			hit_OpenBook = new Shape();
			hit_OpenBook.touchable = false;
			hit_OpenBook.graphics.beginFill(0xff0000);
			
			hit_OpenBook.graphics.lineTo(128,14);	
			hit_OpenBook.graphics.lineTo(635,12);	
			hit_OpenBook.graphics.lineTo(783,140);	
			hit_OpenBook.graphics.lineTo(783,263);	
			hit_OpenBook.graphics.lineTo(319,249);	
			hit_OpenBook.graphics.lineTo(133,97);	
			hit_OpenBook.graphics.lineTo(131,99);	
			
			hit_OpenBook.graphics.endFill(false);
			hit_OpenBook.alpha = 0.0;
			
			hit_OpenBook.graphics.precisionHitTest = true;	
			
			this.addChild(hit_OpenBookQuestion);
			this.addChild(hit_OpenBook);
		}
		
		private function HoleHandler():void{
			if(PowerSupplyAttached === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_PowerSupply)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
					}
					PowerSupplyAttached = true;
					power_supply.alpha = 1;
					SaveArray['PowerSupply'] = "Attached";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
					
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_PowerSupply,
							"item_PowerSupply"
						);
				}else{
					
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a circular cavity in the center of the chest.");
				}
			}else{
				if(AdimmActive === false){
					if(AdimmFried === false){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
						}
						
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PowerSupply,
							'item_PowerSupply',
							'inven_powerSupply_sm'
						);
						
						PowerSupplyAttached = false;
						power_supply.alpha = 0;
						SaveArray['PowerSupply'] = "Nope";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
						
						
					}else{
						
					}
					
				}else{
					if(AdimmFried === false){
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I probably should leave the power-supply in place right now...");
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The power-device has fused into place.... I can't remove it.");
					}
				}
				
				
			}
		}
		
		private function CubeHandler():void{
			if(CubeAttached === false && CubeDamageAttached === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Cube)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
					}
					SaveArray['Cube'] = "Attached";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
					CubeAttached = true;
					cube.texture = this.assets.getTexture('cube');
					cube.alpha = 1;
					
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_Cube,
							"item_Cube"
						);
					
					if(AdimmActive === false){
						if(AdimmFried === false){
							SolveHead();
						}
					}
					
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_CubeDamage)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
					}
					SaveArray['CubeDamage'] = "Attached";
					CubeDamageAttached = true;
					cube.texture = this.assets.getTexture('cube_damage');
					cube.alpha = 1;
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_CubeDamage,
							"item_CubeDamage"
						);
					
				}else{
					
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A square hollow gapes in the center of the cybernetic skull.");
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is what looks like a protruding Ethernet port...");
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Intricate and complex machines weave through the exposed interior...");
					}
				}
			}else{
				if(CubeAttached === true){
					if(AdimmActive === false){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
						}
						CubeAttached = false;
						cube.alpha = 0;
						SaveArray['Cube'] = "PickedUp";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
						
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CubeDamage,
							'item_Cube',
							'inven_cube_sm'
						);
					}
				}else if(CubeDamageAttached === true){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
					}
					CubeDamageAttached = false;
					cube.alpha = 0;
					SaveArray['CubeDamage'] = "PickedUp";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CubeDamage,
						'item_CubeDamage',
						'inven_cubeDamage_sm'
					);
				}
			}
		}
		
		private function PelvisHandler():void{
			if(CordAttached === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Cord)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					if(PowerSupplyAttached === true){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
					}
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
					}
					CordAttached = true;
					cord.alpha = 1;
					SaveArray['Cord'] = "Attached";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_Cord,
							"item_Cord"
						);
					if(AdimmActive === false){
						if(AdimmFried === false){
							SolveHead();
						}
					}
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There appears to be a socket at the base of the android's spinal column.");
				}
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've used the cable from the leg to connect the head to the spinal column");
			}
		}
		
		private function ControllerHandler():void{
			trace("CUBE HIT");
			if(ControllerPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
				}
				ControllerPickedUp = true;
				controller.alpha = 0;
				SaveArray['Controller'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_FuseRed,
					'item_FuseRed',
					'inven_fuseRed_sm'
				);
				
			}else{
				
			}
		}
		
		private function HoleLidHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
			}
			if(ChestHoleOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxOpen();
				ChestHoleOpen = true;
				SaveArray['ChestHole'] = "Open";
				hole_open.alpha = 1;
				if(PowerSupplyAttached === true){
					power_supply.alpha = 1;
				}
				
				hit_hole_lid.graphics.clear();
				CreateHoleLidHit(true);
				CreateHoleHit();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BoxClose();
				ChestHoleOpen = false;
				SaveArray['ChestHole'] = "Closed";
				power_supply.alpha = 0;
				hole_open.alpha = 0;
				hit_hole_lid.graphics.clear();
				hit_hole.graphics.clear();
				CreateHoleLidHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
			
			if(AdimmActive === false){
				if(AdimmFried === false){
					SolveHead();
				}
			}
		}
		private function LidHandler():void{
			
			if(LidOpen === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Ethernet)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();	
					//ethernet.texture = this.assets.getTexture('ethernet_lid_off');
					EthernetAttached = true;
					ethernet.alpha = 1;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;
					}		
					SaveArray['Ethernet'] = "Attached";
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
					
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_Ethernet,
							"item_Ethernet"
						);
					
				}else{
					if(AdimmActive === false){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
						}
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();	
						LidOpen = true;
						SaveArray['Lid'] = "Open";
						if(CubeAttached === true || CubeDamageAttached === true){
							cube.alpha = 1;
						}
						lid_open.alpha = 1;
						
						cap.texture = this.assets.getTexture('cap_nake');
						cap.alpha = 1;
						ethernet.texture = this.assets.getTexture('ethernet_lid_off');
						
						hit_lid.graphics.clear();
						CreateLidHit(true);
						CreateCubeHit();
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
					}
				}							
			}else{
				if(AdimmActive === false){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
					}
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();	
					LidOpen = false;
					SaveArray['Lid'] = "Closed";
					lid_open.alpha = 0;
					cube.alpha = 0;
					cap.alpha = 0;
					cap.texture = this.assets.getTexture('cap_off');
					ethernet.texture = this.assets.getTexture('ethernet');
					hit_lid.graphics.clear();
					hit_cube.graphics.clear();
					CreateLidHit(false);
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
				}
			}
			
			
			if(AdimmActive === false){
				if(AdimmFried === false){
					SolveHead();
				}
			}
		}
		
		
		private function ChestHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;	
			}
			if(ChestOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();	
				
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyOpenTwo();
				SaveArray['Chest'] = "Open";
				ChestOpen = true;
				chest_open.alpha = 1;
				hit_chest.graphics.clear();
				CreateHoleLidHit(false);
				CreateChestHit(true);
			}else{
				if(ChestHoleOpen === true){
					SaveArray['Chest'] = "Open";
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I must close the lid to the 'heart' cavity before the rib cage can be shut.");
					
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();					
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DoorMetalRustyCloseTwo();
					SaveArray['Chest'] = "Closed";
					ChestOpen = false;
					chest_open.alpha = 0;
					hit_chest.graphics.clear();
					hit_chest_two.graphics.clear();
					hit_hole_lid.graphics.clear();
					CreateChestHit(false);
				}
				
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
			
			
		}
		/*
		
		private var LidOpen:Boolean = false;
		private var ChestOpen:Boolean = false;
		private var ChestHoleOpen:Boolean = false;
		private var ControllerPickedUp:Boolean = false;
		
		private var CubeAttached:Boolean = false;
		private var CubeDamageAttached:Boolean = false;
		private var PowerSupplyAttached:Boolean = false;
		private var CordAttached:Boolean = false;
		private var EthernetAttached:Boolean = false;
		*/
		private function SolveHead():void{
			
			if(LidOpen === false){
				if(PowerSupplyAttached === true){
					if(ChestHoleOpen === false){
						if(CordAttached === true){
							if(CubeAttached === true){
								if(AdimmProgrammed === true){
									if(AdimmActive === false){
										//(stage.getChildAt(0) as Object).AmbientObj.LoadElectricHum(true,999);
										Animating = true;
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody;
										}		
										SaveArray['AdimmActive'] = "Yes";
										SaveArray['Book'] = "Open";
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsBody',SaveArray);
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_LightFlicker();
										
										(stage.getChildAt(0) as Object).AmbientObj.LoadElectricHum(true,0);
										AdimmActive = true;
										BookIsOpen = true;
										
										eyes_mc.alpha = 0;
										//eyes.texture = this.assets.getTexture('eyes_blue');
										Starling.juggler.delayCall(function():void{
											eyes.alpha = 0;
											TurnOffEyes();
										},1.5);
									}else{
										BookIsOpen = true;
										if(EthernetAttached === true){
											if(openBookcurrentPage === 2){
												openBookcurrentPage = 3;
											}
										}
										
										OpenBook(true);
										
									}
									
									
								}
								
							}
						}
					}
				}
			}			
		}
		public function TurnOffEyes():void{
			Starling.juggler.delayCall(function():void{
				FadeInEyes();
			},1.5);
		}
		
		public function FadeInEyes():void{
			EyesTween = new Tween(eyes_mc, 2, Transitions.LINEAR);
			EyesTween.fadeTo(1);
			EyesTween.onComplete = function():void{
				PlayEyeMouthMovie();
				
				OpenBook(true);
				//		CreateOpenNotePadHit();
				//	CreateOpenEmergencyHit();
				//	CreateOpenHeadSetHit();
				//	Animating = false; 
			};
			
			Starling.juggler.add(EyesTween);	
		}
		
		public function PlayEyeMouthMovie():void{
			mouth_mc.alpha = 1;
			mouth_mc.play();
			eyes_mc.play();
			
			Starling.juggler.add(mouth_mc);
			Starling.juggler.add(eyes_mc);
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
			
			
			
			this.assets.removeTexture("roboticsBody_bg",true);
			this.assets.removeTexture("RoboticsBody_Sprite_01",true);
			this.assets.removeTexture("RoboticsBody_Sprite_02",true);
			this.assets.removeTexture("AdimmDialogue_Sprite",true);
			this.assets.removeTextureAtlas("RoboticsBody_Sprite_01",true);
			this.assets.removeTextureAtlas("RoboticsBody_Sprite_02",true);
			this.assets.removeTextureAtlas("AdimmDialogue_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("roboticsBody_01");
			(stage.getChildAt(0) as Object).falseAsset("roboticsBody_02");
			(stage.getChildAt(0) as Object).falseAsset("roboticsBody_03");
			(stage.getChildAt(0) as Object).falseAsset("roboticsBody_04");
			(stage.getChildAt(0) as Object).falseAsset("roboticsBody_05");
			(stage.getChildAt(0) as Object).falseAsset("roboticsBody_06");
			(stage.getChildAt(0) as Object).falseAsset("roboticsBody_07");
			
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

