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
	
	
	public class RoboticsRoomKoma extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		private var disk:Image;
		private var desk_claw:Image;
		private var container:Image;
		private var power_supply:Image;
		private var hood:Image;
		
		
		private var hit_puzzle:Shape;
		
		private var hit_hood:Shape;
		private var hit_container:Shape;
		private var hit_power_supply:Shape;
		private var hit_claw:Shape;
		
		private var hit_desk:Shape;
		private var hit_eye00:Shape;
		private var hit_eye01:Shape;
		private var hit_eye03:Shape;
		private var hit_legs00:Shape;
		private var hit_legs01:Shape;
		private var hit_body:Shape;
		
		private var RONum:int = 0;
		
		private var HoodOpen:Boolean = false;
		private var HoodUnlocked:Boolean = false;
		private var ContainerOpen:Boolean = false;
		private var PowerSupplyPickedUp:Boolean = false;
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function RoboticsRoomKoma(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('roboticsRoomKoma_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsRoomKoma/roboticsRoomKoma_bg.jpg'));
				game.TrackAssets('roboticsRoomKoma_01');
			}
			if(game.CheckAsset('roboticsRoomKoma_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsRoomKoma/RoboticsRoomKoma_Sprite_01.png'));
				game.TrackAssets('roboticsRoomKoma_02');
			}
			if(game.CheckAsset('roboticsRoomKoma_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsRoomKoma/RoboticsRoomKoma_Sprite_01.xml'));
				game.TrackAssets('roboticsRoomKoma_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RoboticsRoomKoma","RoboticsRoomKomaObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		//	(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
		//		(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_KomaDial,
		//		'item_KomaDial',
		//		'inven_komaDial_sm'
		//	);
			
			bg = new Image(this.assets.getTexture('roboticsRoomKoma_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			hood = new Image(this.assets.getTexture('koma_hood'));
			hood.touchable = false;
			hood.x = 277;
			hood.y = 0;		
			
			container = new Image(this.assets.getTexture('container'));
			container.touchable = false;
			container.x = 353;
			container.y = 2;	
			
			power_supply = new Image(this.assets.getTexture('power_supply'));
			power_supply.touchable = false;
			power_supply.x = 365;
			power_supply.y = 52;	
			
			desk_claw = new Image(this.assets.getTexture('desk_desk_claw'));
			desk_claw.touchable = false;
			desk_claw.x = 160;
			desk_claw.y = 0;	
			
			disk = new Image(this.assets.getTexture('puzzle_disk'));
			disk.touchable = false;
			disk.x = 341;
			disk.y = 221;	
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma['HoodUnlocked'] == 'Yes'){	
					HoodUnlocked = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma['PowerSupply'] == 'PickedUp'){	
					PowerSupplyPickedUp = true;
					
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma['Container'] == 'Open'){	
					ContainerOpen = true;
					container.alpha = 1;
					if(PowerSupplyPickedUp === false){
						power_supply.alpha = 1;
					}else{
						power_supply.alpha = 0;
					}
					CreatePowerSupplyHit();
				}else{
					container.alpha = 0;
					power_supply.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma['Hood'] == 'Open'){	
					HoodOpen = true;
					hood.alpha = 1;
					CreateContainerHit(ContainerOpen);
				}else{
					hood.alpha = 0;
				}
				
				
			}else{
				hood.alpha = 0;
				container.alpha = 0;
				power_supply.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk != undefined){	
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk['Claw'] == 'PickedUp'){	
					desk_claw.alpha = 0;
				}else{
					desk_claw.alpha = 1;
				}
				//HoodUnlocked
				
			}else{
				desk_claw.alpha = 1;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle != undefined){
				trace("BARK 00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle['Dial'] == 'Attached'){
					disk.alpha = 1;
				}else{
					disk.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle['Solved'] == 'Yes'){
					trace("HoodUnlocked: "+HoodUnlocked);
					if(HoodUnlocked === false){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma;	
						}
						Animating = true;
						HoodOpen = true;
						HoodUnlocked = true;
						SaveArray['HoodUnlocked'] = "Yes";
						SaveArray['Hood'] = "Open";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsRoomKoma',SaveArray);
						CreatePowerSupplyHit();
						CreateContainerHit();
						Starling.juggler.delayCall(OpenHood,2);
					}
				}else{
					
				}
			}else{
				disk.alpha = 0;
			}
			
			
			
		
			
			
			this.addChildAt(desk_claw,1);
			this.addChildAt(hood,2);
			this.addChildAt(container,3);
			this.addChildAt(power_supply,4);
			this.addChildAt(disk,5);
			
			CreateDeskHit();
			CreatBodyHit();
			CreatLeg00Hit();
			CreateEye00Hit();
			
			CreateHoodHit(HoodOpen);
			CreatePuzzleHit();
		//	CreatePowerSupplyHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		private function OpenHood():void{ 
			
			hood.alpha = 1;
			Animating = false;
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicDoor();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirRelease();
			Starling.juggler.delayCall(PlaySuccess,0.5);
		}
		
		private function PlaySuccess():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
		}
		
		/*
		CreateDeskHit();
		CreatBodyHit();
		CreatLeg00Hit();
		CreateEye00Hit();
		
		private var hit_desk:Shape;
		private var hit_eye00:Shape;
//		private var hit_eye01:Shape;
//		private var hit_eye03:Shape;
		private var hit_legs00:Shape;
//		private var hit_legs01:Shape;
		private var hit_body:Shape;
		*/
		
	
		private function CreateEye00Hit():void{
			hit_eye00 = new Shape();
			hit_eye00.touchable = false;
			hit_eye00.graphics.beginFill(0xff0000);
			
			hit_eye00.graphics.lineTo(244,397);	
			hit_eye00.graphics.lineTo(273,342);	
			hit_eye00.graphics.lineTo(336,333);	
			hit_eye00.graphics.lineTo(387,380);	
			hit_eye00.graphics.lineTo(380,448);	
			hit_eye00.graphics.lineTo(332,482);	
			hit_eye00.graphics.lineTo(293,472);	
			
			hit_eye00.graphics.endFill(false);
			hit_eye00.alpha = 0.0;
			
			hit_eye00.graphics.precisionHitTest = true;	
			this.addChild(hit_eye00);
		}
		
		private function CreatLeg00Hit():void{
			hit_legs00 = new Shape();
			hit_legs00.touchable = false;
			hit_legs00.graphics.beginFill(0xff0000);
			
			hit_legs00.graphics.lineTo(0,152);	
			hit_legs00.graphics.lineTo(193,224);	
			hit_legs00.graphics.lineTo(170,503);	
			hit_legs00.graphics.lineTo(80,502);	
			hit_legs00.graphics.lineTo(0,382);	
			
			hit_legs00.graphics.endFill(false);
			hit_legs00.alpha = 0.0;
			
			hit_legs00.graphics.precisionHitTest = true;	
			this.addChild(hit_legs00);
		}
		
		private function CreatBodyHit():void{
			hit_body = new Shape();
			hit_body.touchable = false;
			hit_body.graphics.beginFill(0xff0000);
			
			hit_body.graphics.lineTo(195,295);	
			hit_body.graphics.lineTo(426,21);	
			hit_body.graphics.lineTo(565,51);	
			hit_body.graphics.lineTo(620,173);	
			hit_body.graphics.lineTo(623,366);	
			hit_body.graphics.lineTo(543,505);	
			hit_body.graphics.lineTo(199,505);	
						
			hit_body.graphics.endFill(false);
			hit_body.alpha = 0.0;
			
			hit_body.graphics.precisionHitTest = true;	
			this.addChild(hit_body);
		}
		
		private function CreateDeskHit():void{
			hit_desk = new Shape();
			hit_desk.touchable = false;
			hit_desk.graphics.beginFill(0xff0000);
			
			hit_desk.graphics.lineTo(0,0);	
			hit_desk.graphics.lineTo(276,0);	
			hit_desk.graphics.lineTo(203,163);	
			hit_desk.graphics.lineTo(112,137);	
			hit_desk.graphics.lineTo(0,143);	
			
			
			hit_desk.graphics.endFill(false);
			hit_desk.alpha = 0.0;
			
			hit_desk.graphics.precisionHitTest = true;	
			this.addChild(hit_desk);
		}
		
		private function CreatePowerSupplyHit():void{
			hit_power_supply = new Shape();
			hit_power_supply.touchable = false;
			hit_power_supply.graphics.beginFill(0xff0000);
			
			hit_power_supply.graphics.lineTo(351,86);	
			hit_power_supply.graphics.lineTo(366,44);	
			hit_power_supply.graphics.lineTo(407,31);	
			hit_power_supply.graphics.lineTo(458,50);	
			hit_power_supply.graphics.lineTo(470,97);	
			hit_power_supply.graphics.lineTo(453,139);	
			hit_power_supply.graphics.lineTo(403,160);	
			hit_power_supply.graphics.lineTo(367,142);	
			
			hit_power_supply.graphics.endFill(false);
			hit_power_supply.alpha = 0.0;
			
			hit_power_supply.graphics.precisionHitTest = true;	
			this.addChild(hit_power_supply);
		}
		
		private function CreateContainerHit(open:Boolean = false):void{
			hit_container = new Shape();		
			hit_container.x = 0;
			hit_container.y = 0;
			hit_container.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_container.graphics.lineTo(347,136);					
				hit_container.graphics.lineTo(368,107);					
				hit_container.graphics.lineTo(403,96);					
				hit_container.graphics.lineTo(449,99);					
				hit_container.graphics.lineTo(471,119);					
				hit_container.graphics.lineTo(471,144);					
				hit_container.graphics.lineTo(455,167);					
				hit_container.graphics.lineTo(419,179);					
				hit_container.graphics.lineTo(377,174);					
				hit_container.graphics.lineTo(351,161);					
			
			}else{
				
				hit_container.graphics.lineTo(351,139);					
				hit_container.graphics.lineTo(349,16);					
				hit_container.graphics.lineTo(356,0);					
				hit_container.graphics.lineTo(408,0);					
				hit_container.graphics.lineTo(458,0);					
				hit_container.graphics.lineTo(472,16);					
				hit_container.graphics.lineTo(464,145);					
				hit_container.graphics.lineTo(449,163);					
				hit_container.graphics.lineTo(405,176);					
				hit_container.graphics.lineTo(370,171);					
							
				
			}				
			hit_container.graphics.endFill(false);			
			hit_container.alpha = 0.0;			
			hit_container.graphics.precisionHitTest = true;	
			hit_container.touchable = false;
			
			this.addChild(hit_container);
			
			
		}
		
		private function CreateHoodHit(open:Boolean = false):void{
			hit_hood = new Shape();		
			hit_hood.x = 0;
			hit_hood.y = 0;
			hit_hood.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_hood.graphics.lineTo(269,183);					
				hit_hood.graphics.lineTo(273,160);					
				hit_hood.graphics.lineTo(331,72);					
				hit_hood.graphics.lineTo(375,52);					
				hit_hood.graphics.lineTo(517,70);					
				hit_hood.graphics.lineTo(550,101);					
				hit_hood.graphics.lineTo(553,136);					
				hit_hood.graphics.lineTo(503,232);					
				hit_hood.graphics.lineTo(470,238);					
				hit_hood.graphics.lineTo(438,222);					
				hit_hood.graphics.lineTo(293,203);					
				
				
			}else{
				
				hit_hood.graphics.lineTo(293,0);					
				hit_hood.graphics.lineTo(538,0);					
				hit_hood.graphics.lineTo(548,58);					
				hit_hood.graphics.lineTo(546,110);					
				hit_hood.graphics.lineTo(512,144);					
				hit_hood.graphics.lineTo(504,92);					
				hit_hood.graphics.lineTo(373,74);					
				hit_hood.graphics.lineTo(343,119);					
				hit_hood.graphics.lineTo(313,89);					
				hit_hood.graphics.lineTo(305,54);					
			
			}				
			hit_hood.graphics.endFill(false);			
			hit_hood.alpha = 0.0;			
			hit_hood.graphics.precisionHitTest = true;	
			hit_hood.touchable = false;
			
			this.addChild(hit_hood);
			
			
		}
		
		private function CreatePuzzleHit():void{
			hit_puzzle = new Shape();
			hit_puzzle.touchable = false;
			hit_puzzle.graphics.beginFill(0xff0000);
			
			hit_puzzle.graphics.lineTo(293,207);	
			hit_puzzle.graphics.lineTo(366,216);	
			hit_puzzle.graphics.lineTo(465,236);	
			hit_puzzle.graphics.lineTo(416,320);	
			hit_puzzle.graphics.lineTo(275,291);	
			
			hit_puzzle.graphics.endFill(false);
			hit_puzzle.alpha = 0.0;
			
			hit_puzzle.graphics.precisionHitTest = true;	
			this.addChild(hit_puzzle);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						
						if(HoodOpen === true){
							if(ContainerOpen === true){
								if(hit_power_supply.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									PowerSupplyHandler();
									return;
								}else if(hit_container.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									ContainerHandler();
									return;
								}
							}else{
								if(hit_container.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									ContainerHandler();
									return;
								}
							}
							
							
						}
						
						if(targ == goback.SourceImage){
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((RoboticsRoom as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RoboticsRoomObj,true
							);
						}else if(hit_puzzle.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(HoodUnlocked === false){
								FadeOut((RoboticsRoomKomaPuzzle as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.RoboticsRoomKomaPuzzleObj,true
									);
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think I'm done with dials for now...");

							}	
						}else if(hit_hood.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(HoodUnlocked === false){
								LockedHoodHandler();
							}else{
								HoodHandler();
							}
						}else if(hit_desk.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((RoboticsDesk as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RoboticsDeskObj,true
							);
						}else if(hit_eye00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							Eye00Handler();
						}else if(hit_body.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BodyHandler();
						}else if(hit_legs00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							Leg00Handler();
						}
						
						
					}
				}
			}
		}
		private function Leg00Handler():void{
			
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Three hulking legs emerge from either side of the robot.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A series of hydraulics make up the legs of the hulking bot");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The energy requirements to power this thing must be huge...");
			}
			
		}
		
		private function BodyHandler():void{
			
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The body is covered in a strong polyurethane shell.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A medical cross is painted on the front end of the casing.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The robot looks made to handle a variety of environments...");
			}
			
		}
		
		
		private function Eye00Handler():void{
		
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A portion of a hard sphere protrudes from the front of the machine.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are three dots at the center of the sphere - I think they're cameras.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... this must be one of the machine's eyes...");
			}
			
		}
		
		private function LockedHoodHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
		
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This piece looks like a hatch or hood...");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There appears to be a separate piece of casing on the top of the robot.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... Doesn't seem to want to open.");
			}
			
		}
		
		private function PowerSupplyHandler():void{
			if(PowerSupplyPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma;	
				}
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PowerSupply,
					'item_PowerSupply',
					'inven_powerSupply_sm'
				);
				
				PowerSupplyPickedUp = true;
				power_supply.alpha = 0;
				SaveArray['PowerSupply'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsRoomKoma',SaveArray);
				
				

			}else{
				ContainerHandler();
			}
		}
		
		private function ContainerHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma;	
			}
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Machine();
			if(ContainerOpen == false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirRelease();
				ContainerOpen = true;
				container.alpha = 1;
				SaveArray['Container'] = "Open";
				if(PowerSupplyPickedUp === false){
					power_supply.alpha = 1;
				}
				hit_container.graphics.clear();
				CreateContainerHit(true);
				CreatePowerSupplyHit();
			}else{
				ContainerOpen = false;
				container.alpha = 0;
				power_supply.alpha = 0;
				SaveArray['Container'] = "Closed";
				hit_container.graphics.clear();
				hit_power_supply.graphics.clear();
				CreateContainerHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsRoomKoma',SaveArray);
		}
		
		private function HoodHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKoma;	
			}
			
			if(HoodOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicDoor();
				SaveArray['Hood'] = "Open";
				HoodOpen = true;
				hood.alpha = 1;
				hit_hood.graphics.clear();
				CreateContainerHit(false);
				CreateHoodHit(true);
			}else{
				if(ContainerOpen === true){
					SaveArray['Hood'] = "Open";
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I should lower the power container before trying to close the hood.");
					
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicDoor();
					SaveArray['Hood'] = "Closed";
					HoodOpen = false;
					hood.alpha = 0;
					hit_hood.graphics.clear();
					
					hit_container.graphics.clear();
					CreateHoodHit(false);
				}
				
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsRoomKoma',SaveArray);
		
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
			
			
			
			this.assets.removeTexture("roboticsRoomKoma_bg",true);
			this.assets.removeTexture("RoboticsRoomKoma_Sprite_01",true);
			this.assets.removeTextureAtlas("RoboticsRoomKoma_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("roboticsRoomKoma_01");
			(stage.getChildAt(0) as Object).falseAsset("roboticsRoomKoma_02");
			(stage.getChildAt(0) as Object).falseAsset("roboticsRoomKoma_03");
			
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
