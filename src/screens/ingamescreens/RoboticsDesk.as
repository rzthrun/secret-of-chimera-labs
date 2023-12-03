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
	
	
	public class RoboticsDesk extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var claw:Image;
		private var cord:Image;
		private var cab_right:Image;
		private var cab_left:Image;
		private var body_chest:Image;
		private var body_hole:Image;
		private var body_power_supply:Image;
		private var body_lid:Image;
		private var body_cube:Image;
		private var body_cord:Image;
		private var body_controller:Image;
		
		private var hit_faces:Shape;
		private var hit_legs:Shape;
		private var hit_straps:Shape;
		private var hit_torso:Shape;
		private var hit_stool:Shape;
		private var hit_shelf:Shape;
		private var hit_machine:Shape;
		private var hit_head:Shape;
		
		private var hit_body:Shape;
		private var hit_claw:Shape;
		private var hit_cord:Shape;
		private var hit_cab_left:Shape;
		private var hit_cab_right:Shape;
		
		private var RONum:int = 0;
		
		private var ClawPickedUp:Boolean = false;
		private var CordPickedUp:Boolean = false;
		private var CabLeftOpen:Boolean = false;
		private var CabRightOpen:Boolean = false;
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function RoboticsDesk(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('roboticsDesk_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsDesk/roboticsDesk_bg.jpg'));
				game.TrackAssets('roboticsDesk_01');
			}
			if(game.CheckAsset('roboticsDesk_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsDesk/RoboticsDesk_Sprite_01.png'));
				game.TrackAssets('roboticsDesk_02');
			}
			if(game.CheckAsset('roboticsDesk_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsDesk/RoboticsDesk_Sprite_01.xml'));
				game.TrackAssets('roboticsDesk_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RoboticsDesk","RoboticsDeskObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('roboticsDesk_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			/*
			private var claw:Image;
			private var cord:Image;
			private var cab_right:Image;
			private var cab_left:Image;
			private var body_chest:Image;
			private var body_hole:Image;
			private var body_power_supply:Image;
			private var body_lid:Image;
			private var body_cube:Image;
			private var body_cord:Image;
			private var body_controller:Image;
			*/
			
			claw = new Image(this.assets.getTexture('claw'));
			claw.touchable = false;
			claw.x = 566;
			claw.y = 229;
			
			cord = new Image(this.assets.getTexture('leg_cord'));
			cord.touchable = false;
			cord.x = 51;
			cord.y = 155;
			
			cab_right = new Image(this.assets.getTexture('cab_right'));
			cab_right.touchable = false;
			cab_right.x = 709;
			cab_right.y = 28;
						
			cab_left = new Image(this.assets.getTexture('cab_left'));
			cab_left.touchable = false;
			cab_left.x = 587;
			cab_left.y = 38;
			
			body_chest = new Image(this.assets.getTexture('body_chest_open'));
			body_chest.touchable = false;
			body_chest.x = 381;
			body_chest.y = 137;
			
			body_hole = new Image(this.assets.getTexture('body_hole'));
			body_hole.touchable = false;
			body_hole.x = 448;
			body_hole.y = 147;
			
			body_power_supply = new Image(this.assets.getTexture('body_power_supply'));
			body_power_supply.touchable = false;
			body_power_supply.x = 452;
			body_power_supply.y = 172;
			
			body_lid = new Image(this.assets.getTexture('body_lid'));
			body_lid.touchable = false;
			body_lid.x = 371;
			body_lid.y = 151;
			
			body_cube = new Image(this.assets.getTexture('body_cube'));
			body_cube.touchable = false;
			body_cube.x = 394;
			body_cube.y = 172;
			
			body_cord = new Image(this.assets.getTexture('body_cord'));
			body_cord.touchable = false;
			body_cord.x = 445;
			body_cord.y = 217;
			
			body_controller = new Image(this.assets.getTexture('body_controller'));
			body_controller.touchable = false;
			body_controller.x = 508;
			body_controller.y = 211;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk['Claw'] == 'PickedUp'){	
					ClawPickedUp = true;
					claw.alpha = 0;
				}else{
					claw.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk['Cord'] == 'PickedUp'){						
					CordPickedUp = true;
					cord.alpha = 0;
				}else{
					cord.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk['CabRight'] == 'Open'){						
					CabRightOpen = true;
					cab_right.alpha =1;
				}else{
					cab_right.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk['CabLeft'] == 'Open'){						
					CabLeftOpen = true;
					cab_left.alpha = 1;
				}else{
					cab_left.alpha = 0;
				}
			}else{
				claw.alpha = 1;
				cord.alpha = 1;
				cab_right.alpha = 0;
				cab_left.alpha = 0;
			}
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Controller'] == 'PickedUp'){
					body_controller.alpha = 0;
				}else{
					body_controller.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Chest'] == 'Open'){
					body_chest.alpha = 1;
				}else{
					body_chest.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['ChestHole'] == 'Open'){	
					body_hole.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['PowerSupply'] == 'Attached'){	
						body_power_supply.alpha = 1;
					}else{
						body_power_supply.alpha = 0;
					}
				}else{
					body_power_supply.alpha = 0;
					body_hole.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Cord'] == 'Attached'){	
					body_cord.alpha = 1;
				}else{
					body_cord.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Lid'] == 'Open'){	
					body_lid.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['CubeDamage'] == 'Attached'){
						body_cube.alpha = 1;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsBody['Cube'] == 'Attached'){
						body_cube.alpha = 1;
					}else{
						body_cube.alpha = 0;
					}
				}else{
					body_lid.alpha = 0;
					body_cube.alpha = 0;
				}
				
				
			}else{
				body_controller.alpha = 1;
				body_chest.alpha = 0;
				body_hole.alpha = 0;
				body_cord.alpha = 0;
				body_cube.alpha = 0;
				body_lid.alpha = 0;
				body_power_supply.alpha = 0;
			}
			
		
		
			
		
		
		
			
			
			
			this.addChildAt(claw,1);
			this.addChildAt(cord,2);
			this.addChildAt(cab_right,3);
			this.addChildAt(cab_left,4);
			this.addChildAt(body_chest,5);
			
			this.addChildAt(body_hole,6);
			this.addChildAt(body_power_supply,7);
			this.addChildAt(body_cube,8);
			this.addChildAt(body_lid,9);
			
			this.addChildAt(body_cord,10);
			this.addChildAt(body_controller,11);
			
			CreateFacesHit();
			CreateLegsHit();
			CreateStrapsHit();
			CreateTorsoHit();
			CreateStoolHit();
			CreateShelfHit();
			CreateMachinedHit();
			CreateHeadHit();
			
			CreateBodyHit();
			CreateClawHit();
			CreateCordHit();		
			CreateCabRightHit(CabRightOpen);
			CreateCabLeftHit(CabLeftOpen);
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		private function CreateCabRightHit(open:Boolean = false):void{
			hit_cab_right = new Shape();		
			hit_cab_right.x = 0;
			hit_cab_right.y = 0;
			hit_cab_right.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_cab_right.graphics.lineTo(710,108);					
				hit_cab_right.graphics.lineTo(790,109);					
				hit_cab_right.graphics.lineTo(789,142);					
				hit_cab_right.graphics.lineTo(712,142);					
			
				
			}else{
				
				hit_cab_right.graphics.lineTo(747,111);					
				hit_cab_right.graphics.lineTo(796,110);					
				hit_cab_right.graphics.lineTo(793,147);					
				hit_cab_right.graphics.lineTo(728,144);					
			
			}				
			hit_cab_right.graphics.endFill(false);			
			hit_cab_right.alpha = 0.0;			
			hit_cab_right.graphics.precisionHitTest = true;	
			hit_cab_right.touchable = false
			this.addChild(hit_cab_right);
			
			
		}
		
		private function CreateCabLeftHit(open:Boolean = false):void{
			hit_cab_left = new Shape();		
			hit_cab_left.x = 0;
			hit_cab_left.y = 0;
			hit_cab_left.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_cab_left.graphics.lineTo(643,40);					
				hit_cab_left.graphics.lineTo(675,40);					
				hit_cab_left.graphics.lineTo(707,103);					
				hit_cab_left.graphics.lineTo(707,139);					
				hit_cab_left.graphics.lineTo(640,140);					
				
				
			}else{
				
				hit_cab_left.graphics.lineTo(588,37);					
				hit_cab_left.graphics.lineTo(671,42);					
				hit_cab_left.graphics.lineTo(670,143);					
				hit_cab_left.graphics.lineTo(583,141);					
				
			}				
			hit_cab_left.graphics.endFill(false);			
			hit_cab_left.alpha = 0.0;			
			hit_cab_left.graphics.precisionHitTest = true;	
			hit_cab_left.touchable = false
			this.addChild(hit_cab_left);
			
			
		}
		
	
		
		private function CreateHeadHit():void{
			hit_head = new Shape();
			hit_head.touchable = false;
			hit_head.graphics.beginFill(0xff0000);
			
			hit_head.graphics.lineTo(238,201);	
			hit_head.graphics.lineTo(330,176);	
			hit_head.graphics.lineTo(373,245);	
			hit_head.graphics.lineTo(243,260);	
			
			hit_head.graphics.endFill(false);
			hit_head.alpha = 0.0;
			
			hit_head.graphics.precisionHitTest = true;	
			this.addChild(hit_head);
		}
		
		private function CreateMachinedHit():void{
			hit_machine = new Shape();
			hit_machine.touchable = false;
			hit_machine.graphics.beginFill(0xff0000);
			
			hit_machine.graphics.lineTo(681,177);	
			hit_machine.graphics.lineTo(750,173);	
			hit_machine.graphics.lineTo(784,216);	
			hit_machine.graphics.lineTo(777,280);	
			hit_machine.graphics.lineTo(709,264);	
			
			hit_machine.graphics.endFill(false);
			hit_machine.alpha = 0.0;
			
			hit_machine.graphics.precisionHitTest = true;	
			this.addChild(hit_machine);
		}
		
		private function CreateShelfHit():void{
			hit_shelf = new Shape();
			hit_shelf.touchable = false;
			hit_shelf.graphics.beginFill(0xff0000);
			
			hit_shelf.graphics.lineTo(530,117);	
			hit_shelf.graphics.lineTo(561,77);	
			hit_shelf.graphics.lineTo(638,85);	
			hit_shelf.graphics.lineTo(633,135);	
			
			hit_shelf.graphics.endFill(false);
			hit_shelf.alpha = 0.0;
			
			hit_shelf.graphics.precisionHitTest = true;	
			this.addChild(hit_shelf);
		}
		
		private function CreateStoolHit():void{
			hit_stool = new Shape();
			hit_stool.touchable = false;
			hit_stool.graphics.beginFill(0xff0000);
			
			hit_stool.graphics.lineTo(436,400);	
			hit_stool.graphics.lineTo(448,271);	
			hit_stool.graphics.lineTo(523,277);	
			hit_stool.graphics.lineTo(523,418);	
			
			hit_stool.graphics.endFill(false);
			hit_stool.alpha = 0.0;
			
			hit_stool.graphics.precisionHitTest = true;	
			this.addChild(hit_stool);
		}
		
		private function CreateTorsoHit():void{
			hit_torso = new Shape();
			hit_torso.touchable = false;
			hit_torso.graphics.beginFill(0xff0000);
			
			hit_torso.graphics.lineTo(213,430);	
			hit_torso.graphics.lineTo(229,371);	
			hit_torso.graphics.lineTo(380,369);	
			hit_torso.graphics.lineTo(410,435);	
			hit_torso.graphics.lineTo(292,510);	
			hit_torso.graphics.lineTo(252,510);	
			
			hit_torso.graphics.endFill(false);
			hit_torso.alpha = 0.0;
			
			hit_torso.graphics.precisionHitTest = true;	
			this.addChild(hit_torso);
		}
		
		private function CreateStrapsHit():void{
			hit_straps = new Shape();
			hit_straps.touchable = false;
			hit_straps.graphics.beginFill(0xff0000);
			
			hit_straps.graphics.lineTo(35,0);	
			hit_straps.graphics.lineTo(128,0);	
			hit_straps.graphics.lineTo(134,124);	
			hit_straps.graphics.lineTo(91,160);	
			hit_straps.graphics.lineTo(33,128);	
		
			hit_straps.graphics.endFill(false);
			hit_straps.alpha = 0.0;
			
			hit_straps.graphics.precisionHitTest = true;	
			this.addChild(hit_straps);
		}
		
		private function CreateLegsHit():void{
			hit_legs = new Shape();
			hit_legs.touchable = false;
			hit_legs.graphics.beginFill(0xff0000);
			
			hit_legs.graphics.lineTo(31,265);	
			hit_legs.graphics.lineTo(155,265);	
			hit_legs.graphics.lineTo(179,428);	
			hit_legs.graphics.lineTo(158,455);	
			hit_legs.graphics.lineTo(91,471);	
			hit_legs.graphics.lineTo(31,390);	
		
			hit_legs.graphics.endFill(false);
			hit_legs.alpha = 0.0;
			
			hit_legs.graphics.precisionHitTest = true;	
			this.addChild(hit_legs);
		}
		
		private function CreateFacesHit():void{
			hit_faces = new Shape();
			hit_faces.touchable = false;
			hit_faces.graphics.beginFill(0xff0000);
			
			hit_faces.graphics.lineTo(220,55);	
			hit_faces.graphics.lineTo(363,72);	
			hit_faces.graphics.lineTo(357,136);	
			hit_faces.graphics.lineTo(340,142);	
			hit_faces.graphics.lineTo(224,138);	
						
			hit_faces.graphics.endFill(false);
			hit_faces.alpha = 0.0;
			
			hit_faces.graphics.precisionHitTest = true;	
			this.addChild(hit_faces);
		}
		
		
		private function CreateCordHit():void{
			hit_cord = new Shape();
			hit_cord.touchable = false;
			hit_cord.graphics.beginFill(0xff0000);
			
			hit_cord.graphics.lineTo(11,188);	
			hit_cord.graphics.lineTo(31,137);	
			hit_cord.graphics.lineTo(99,174);	
			hit_cord.graphics.lineTo(134,144);	
			hit_cord.graphics.lineTo(153,146);	
			hit_cord.graphics.lineTo(170,199);	
			hit_cord.graphics.lineTo(143,260);	
			hit_cord.graphics.lineTo(125,262);	
			hit_cord.graphics.lineTo(95,221);	
			hit_cord.graphics.lineTo(74,271);	
			hit_cord.graphics.lineTo(57,272);	
			hit_cord.graphics.lineTo(25,235);	
		
			hit_cord.graphics.endFill(false);
			hit_cord.alpha = 0.0;
			
			hit_cord.graphics.precisionHitTest = true;	
			this.addChild(hit_cord);
		}
		
		private function CreateClawHit():void{
			hit_claw = new Shape();
			hit_claw.touchable = false;
			hit_claw.graphics.beginFill(0xff0000);
			
			hit_claw.graphics.lineTo(552,427);	
			hit_claw.graphics.lineTo(580,229);	
			hit_claw.graphics.lineTo(590,218);	
			hit_claw.graphics.lineTo(644,225);	
			hit_claw.graphics.lineTo(645,248);	
			hit_claw.graphics.lineTo(606,444);	
					
			hit_claw.graphics.endFill(false);
			hit_claw.alpha = 0.0;
			
			hit_claw.graphics.precisionHitTest = true;	
			this.addChild(hit_claw);
		}
		
		private function CreateBodyHit():void{
			hit_body = new Shape();
			hit_body.touchable = false;
			hit_body.graphics.beginFill(0xff0000);
			
			hit_body.graphics.lineTo(348,144);	
			hit_body.graphics.lineTo(369,141);	
			hit_body.graphics.lineTo(407,123);	
			hit_body.graphics.lineTo(452,117);	
			hit_body.graphics.lineTo(511,126);	
			hit_body.graphics.lineTo(554,161);	
			hit_body.graphics.lineTo(570,238);	
			hit_body.graphics.lineTo(544,250);	
			hit_body.graphics.lineTo(476,245);	
			hit_body.graphics.lineTo(405,247);	
			hit_body.graphics.lineTo(365,209);	
			hit_body.graphics.lineTo(346,170);	
			
			hit_body.graphics.endFill(false);
			hit_body.alpha = 0.0;
			
			hit_body.graphics.precisionHitTest = true;	
			this.addChild(hit_body);
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
							FadeOut((RoboticsRoom as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RoboticsRoomObj,true
							);
						}else if(hit_body.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((RoboticsBody as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RoboticsBodyObj,true
							);
						}else if(hit_claw.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ClawHandler();
						}else if(hit_cord.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CordHandler();
						}else if(hit_cab_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CabLeftHandler();
						}else if(hit_cab_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CabRightHandler();
						}else if(hit_faces.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FacesHandler();
						}else if(hit_legs.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Two titanium legs dangle inches above the ground.");
						}else if(hit_straps.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Two thick straps suspend the artificial carriage at the hips.");
						}else if(hit_torso.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("What looks like a torso, but heavy and made of metal..");
						}else if(hit_stool.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A standard stool.");
						}else if(hit_shelf.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Different attempts and prototypes I presume...");
						}else if(hit_machine.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						//	(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small electrical machine");
						}else if(hit_head.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PieceHandler();
						}
						
						
					}
				}
			}
		}
		
		private function PieceHandler():void{
			
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Various parts and pieces of a humanoid robot...");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It's hard to tell what some of the pieces are or do...");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The piece of sophisticated machinery somewhat resembles a face...");
			}
			
		}
		
		private function FacesHandler():void{
			
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Three eerie masks hang above the work desk.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The expressions are blank and unnerving.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Are these masks possible personalities for the androids...?");
			}
			
		}
		
		private function CabRightHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk;	
			}
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
			if(CabRightOpen === false){
				CabRightOpen = true;
				cab_right.alpha = 1;
				hit_cab_right.graphics.clear();
				CreateCabRightHit(true);
				SaveArray['CabRight'] = "Open";
			}else{
				CabRightOpen = false;
				cab_right.alpha = 0;
				hit_cab_right.graphics.clear();
				CreateCabRightHit(false);
				SaveArray['CabRight'] = "Closed";
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsDesk',SaveArray);
		}
		
		private function CabLeftHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk;	
			}
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
			if(CabLeftOpen === false){
				
				CabLeftOpen = true;
				cab_left.alpha = 1;
				hit_cab_left.graphics.clear();
				CreateCabLeftHit(true);
				SaveArray['CabLeft'] = "Open";
			}else{
				CabLeftOpen = false;
				cab_left.alpha = 0;
				hit_cab_left.graphics.clear();
				CreateCabLeftHit(false);
				SaveArray['CabLeft'] = "Closed";
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsDesk',SaveArray);
		}
		
		private function CordHandler():void{
			if(CordPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk;	
				}
				CordPickedUp = true;
				cord.alpha = 0;
				SaveArray['Cord'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsDesk',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Cord,
					'item_Cord',
					'inven_cord_sm'
				);
			}else{
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Thick cabling doubles as a muscle system");
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The machine is designed to mimic the human body, and perhaps surpass it in some ways...");
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The legs are made up of a combination of hydraulic pumps and thick electric cables.");
				}
			}
		}
		
		private function ClawHandler():void{
			if(ClawPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsDesk;	
				}
				ClawPickedUp = true;
				claw.alpha = 0;
				SaveArray['Claw'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsDesk',SaveArray);
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsTwo(2);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Claw,
					'item_Claw',
					'inven_claw_sm'
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
			
			
			
			this.assets.removeTexture("roboticsDesk_bg",true);
			this.assets.removeTexture("RoboticsDesk_Sprite_01",true);
			this.assets.removeTextureAtlas("RoboticsDesk_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("roboticsDesk_01");
			(stage.getChildAt(0) as Object).falseAsset("roboticsDesk_02");
			(stage.getChildAt(0) as Object).falseAsset("roboticsDesk_03");
			
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

