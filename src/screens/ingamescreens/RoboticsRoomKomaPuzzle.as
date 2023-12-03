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
	import starling.utils.deg2rad;
	import starling.utils.rad2deg;
	
	
	public class RoboticsRoomKomaPuzzle extends Sprite
	{
		
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var disk_00:Image;
		private var disk_01:Image;
		private var disk_02:Image;
		private var disk_03:Image;
		private var disk_04:Image;
		
		private var needle_00:Image;
		private var needle_01:Image;
		private var needle_02:Image;
		private var needle_03:Image;
		private var needle_04:Image;
		
		private var hit_00:Shape;
		private var hit_01:Shape;
		private var hit_02:Shape;
		private var hit_03:Shape;
		private var hit_04:Shape;
		
		//	private var hit_elevator_door:Shape;
		private var DiskAttached:Boolean = false;
		
		private var DiskFlag:String = null;
		private var MousePrevAngle:Number;
		private var MouseCurrentAngle:Number;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function RoboticsRoomKomaPuzzle(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('roboticsRoomKomaPuzzle_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsRoomKomaPuzzle/roboticsRoomKomaPuzzle_bg.jpg'));
				game.TrackAssets('roboticsRoomKomaPuzzle_01');
			}
			if(game.CheckAsset('roboticsRoomKomaPuzzle_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsRoomKomaPuzzle/RoboticsRoomKomaPuzzle_Sprite_01.png'));
				game.TrackAssets('roboticsRoomKomaPuzzle_02');
			}
			if(game.CheckAsset('roboticsRoomKomaPuzzle_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RoboticsRoomKomaPuzzle/RoboticsRoomKomaPuzzle_Sprite_01.xml'));
				game.TrackAssets('roboticsRoomKomaPuzzle_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RoboticsRoomKomaPuzzle","RoboticsRoomKomaPuzzleObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('roboticsRoomKomaPuzzle_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			disk_00 = new Image(this.assets.getTexture('disk'));
			disk_00.touchable = false;
			disk_00.pivotX = 125;
			disk_00.pivotY = 125;
			disk_00.x = 146;
			disk_00.y = 146;			
			
			disk_01 = new Image(this.assets.getTexture('disk'));
			disk_01.touchable = false;
			disk_01.pivotX = 125;
			disk_01.pivotY = 125;
			disk_01.x = 396;
			disk_01.y = 146;			
			
			disk_02 = new Image(this.assets.getTexture('disk'));
			disk_02.touchable = false;
			disk_02.pivotX = 125;
			disk_02.pivotY = 125;
			disk_02.x = 647;
			disk_02.y = 146;
			
			disk_03 = new Image(this.assets.getTexture('disk'));
			disk_03.touchable = false;
			disk_03.pivotX = 125;
			disk_03.pivotY = 125;
			disk_03.x = 272;
			disk_03.y = 362;
			
			disk_04 = new Image(this.assets.getTexture('disk'));
			disk_04.touchable = false;
			disk_04.pivotX = 125;
			disk_04.pivotY = 125;
			disk_04.x = 522;
			disk_04.y = 362;
			
			needle_00 = new Image(this.assets.getTexture('two'));
			needle_00.touchable = false;
			needle_00.pivotX = 125;
			needle_00.pivotY = 125;
			needle_00.x = 146;
			needle_00.y = 146;			
			
			needle_01 = new Image(this.assets.getTexture('four'));
			needle_01.touchable = false;
			needle_01.pivotX = 125;
			needle_01.pivotY = 125;
			needle_01.x = 396;
			needle_01.y = 146;			
			
			needle_02 = new Image(this.assets.getTexture('two'));
			needle_02.touchable = false;
			needle_02.pivotX = 125;
			needle_02.pivotY = 125;
			needle_02.x = 647;
			needle_02.y = 146;
			
			needle_03 = new Image(this.assets.getTexture('three'));
			needle_03.touchable = false;
			needle_03.pivotX = 125;
			needle_03.pivotY = 125;
			needle_03.x = 272;
			needle_03.y = 362;
			
			needle_04 = new Image(this.assets.getTexture('three'));
			needle_04.touchable = false;
			needle_04.pivotX = 125;
			needle_04.pivotY = 125;
			needle_04.x = 522;
			needle_04.y = 362;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle != undefined){
				trace("BARK 00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle['Dial'] == 'Attached'){
					DiskAttached = true;
					disk_01.alpha = 1;
					needle_01.alpha = 1;
				}else{
					disk_01.alpha = 0;
					needle_01.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle['00'] != undefined){
					trace("BARK 01");

					needle_00.rotation = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle['00'];
					needle_01.rotation = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle['01'];
					needle_02.rotation = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle['02'];
					needle_03.rotation = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle['03'];
					needle_04.rotation = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle['04'];
					
				}else{
					needle_00.rotation = deg2rad(45);
					needle_01.rotation = deg2rad(90);
					needle_02.rotation = deg2rad(135);
					needle_03.rotation = deg2rad(180);
					needle_04.rotation = deg2rad(225);
				}
			}else{
				disk_01.alpha = 0;
				needle_01.alpha = 0;
				needle_00.rotation = deg2rad(45);
				needle_01.rotation = deg2rad(90);
				needle_02.rotation = deg2rad(135);
				needle_03.rotation = deg2rad(180);
				needle_04.rotation = deg2rad(225);
			}
			
		//	needle_00.rotation = 0;
		//	needle_01.rotation = 0;
		//	needle_02.rotation = 0;
		//	needle_03.rotation = 0;
		//	needle_04.rotation = 0;
			
			disk_00.alpha = 1;
			
			disk_02.alpha = 1;
			disk_03.alpha = 1;
			disk_04.alpha = 1;
			
			needle_00.alpha = 1;
			
			needle_02.alpha = 1;
			needle_03.alpha = 1;
			needle_04.alpha = 1;
			
			this.addChildAt(disk_00,1);
			this.addChildAt(disk_01,2);
			this.addChildAt(disk_02,3);
			this.addChildAt(disk_03,4);
			this.addChildAt(disk_04,5);
			this.addChildAt(needle_00,6);
			this.addChildAt(needle_01,7);
			this.addChildAt(needle_02,8);
			this.addChildAt(needle_03,9);
			this.addChildAt(needle_04,10);
			
			CreateDiskHits();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		private function CreateDiskHits():void{
			hit_00 = new Shape();
			hit_00.touchable = false;
			hit_00.graphics.beginFill(0x00ff00);
			
			hit_00.graphics.lineTo(17,144);	
			hit_00.graphics.lineTo(28,83);	
			hit_00.graphics.lineTo(66,37);	
			hit_00.graphics.lineTo(115,15);	
			hit_00.graphics.lineTo(185,19);	
			hit_00.graphics.lineTo(231,48);	
			hit_00.graphics.lineTo(261,92);	
			hit_00.graphics.lineTo(267,145);	
			hit_00.graphics.lineTo(254,201);	
			hit_00.graphics.lineTo(220,241);	
			hit_00.graphics.lineTo(173,264);	
			hit_00.graphics.lineTo(105,264);	
			hit_00.graphics.lineTo(51,228);	
			hit_00.graphics.lineTo(22,170);	
			
			hit_00.graphics.endFill(false);
			hit_00.alpha = 0.0;
			
			hit_00.graphics.precisionHitTest = true;
					
			
			hit_01 = new Shape();
			hit_01.touchable = false;
			hit_01.graphics.beginFill(0x00ff00);
			
			hit_01.graphics.lineTo(17+250,144);	
			hit_01.graphics.lineTo(28+250,83);	
			hit_01.graphics.lineTo(66+250,37);	
			hit_01.graphics.lineTo(115+250,15);	
			hit_01.graphics.lineTo(185+250,19);	
			hit_01.graphics.lineTo(231+250,48);	
			hit_01.graphics.lineTo(261+250,92);	
			hit_01.graphics.lineTo(267+250,145);	
			hit_01.graphics.lineTo(254+250,201);	
			hit_01.graphics.lineTo(220+250,241);	
			hit_01.graphics.lineTo(173+250,264);	
			hit_01.graphics.lineTo(105+250,264);	
			hit_01.graphics.lineTo(51+250,228);	
			hit_01.graphics.lineTo(22+250,170);	
			
			hit_01.graphics.endFill(false);
			hit_01.alpha = 0.0;
			
			hit_01.graphics.precisionHitTest = true;
			
			hit_02 = new Shape();
			hit_02.touchable = false;
			hit_02.graphics.beginFill(0x00ff00);
			
			hit_02.graphics.lineTo(17+501,144);	
			hit_02.graphics.lineTo(28+501,83);	
			hit_02.graphics.lineTo(66+501,37);	
			hit_02.graphics.lineTo(115+501,15);	
			hit_02.graphics.lineTo(185+501,19);	
			hit_02.graphics.lineTo(231+501,48);	
			hit_02.graphics.lineTo(261+501,92);	
			hit_02.graphics.lineTo(267+501,145);	
			hit_02.graphics.lineTo(254+501,201);	
			hit_02.graphics.lineTo(220+501,241);	
			hit_02.graphics.lineTo(173+501,264);	
			hit_02.graphics.lineTo(105+501,264);	
			hit_02.graphics.lineTo(51+501,228);	
			hit_02.graphics.lineTo(22+501,170);	
			
			hit_02.graphics.endFill(false);
			hit_02.alpha = 0.0;
			
			hit_02.graphics.precisionHitTest = true;
			
			
			
			hit_03 = new Shape();
			hit_03.touchable = false;
			hit_03.graphics.beginFill(0x00ff00);
			hit_03.graphics.beginFill(0x00ff00);
			
			hit_03.graphics.lineTo(17+126,144+216);	
			hit_03.graphics.lineTo(28+126,83+216);	
			hit_03.graphics.lineTo(66+126,37+216);	
			hit_03.graphics.lineTo(115+126,15+216);	
			hit_03.graphics.lineTo(185+126,19+216);	
			hit_03.graphics.lineTo(231+126,48+216);	
			hit_03.graphics.lineTo(261+126,92+216);	
			hit_03.graphics.lineTo(267+126,145+216);	
			hit_03.graphics.lineTo(254+126,201+216);	
			hit_03.graphics.lineTo(220+126,241+216);	
			hit_03.graphics.lineTo(173+126,264+216);	
			hit_03.graphics.lineTo(105+126,264+216);	
			hit_03.graphics.lineTo(51+126,228+216);	
			hit_03.graphics.lineTo(22+126,170+216);	
			
			hit_03.graphics.endFill(false);
			hit_03.alpha = 0.0;
			
			hit_03.graphics.precisionHitTest = true;
			
			
			hit_04 = new Shape();
			hit_04.touchable = false;
			hit_04.graphics.beginFill(0x00ff00);
			hit_04.graphics.beginFill(0x00ff00);
			
			hit_04.graphics.lineTo(17+376,144+216);	
			hit_04.graphics.lineTo(28+376,83+216);	
			hit_04.graphics.lineTo(66+376,37+216);	
			hit_04.graphics.lineTo(115+376,15+216);	
			hit_04.graphics.lineTo(185+376,19+216);	
			hit_04.graphics.lineTo(231+376,48+216);	
			hit_04.graphics.lineTo(261+376,92+216);	
			hit_04.graphics.lineTo(267+376,145+216);	
			hit_04.graphics.lineTo(254+376,201+216);	
			hit_04.graphics.lineTo(220+376,241+216);	
			hit_04.graphics.lineTo(173+376,264+216);	
			hit_04.graphics.lineTo(105+376,264+216);	
			hit_04.graphics.lineTo(51+376,228+216);	
			hit_04.graphics.lineTo(22+376,170+216);	
			
			hit_04.graphics.endFill(false);
			hit_04.alpha = 0.0;
			
			hit_04.graphics.precisionHitTest = true;
			
			this.addChild(hit_00);
			this.addChild(hit_01);
			this.addChild(hit_02);
			this.addChild(hit_03);
			this.addChild(hit_04);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.BEGAN) {
						if(hit_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RotaryClicks();
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WindUp();
							//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicWindUp();
							MousePrevAngle = (
								((Math.atan2(touches[0].globalY-146, touches[0].globalX-146))
									*180
								)/ Math.PI
							)+180;
							trace("00 READY");
							trace("MousePrevAngle: "+MousePrevAngle);
							DiskFlag = '00';
						}else if(hit_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(DiskAttached === false){
								
								AttachKomaDialHandler();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RotaryClicks();
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WindUp();
								MousePrevAngle = (
									((Math.atan2(touches[0].globalY-146, touches[0].globalX-396))
										*180
									)/ Math.PI
								)+180;
								trace("01 READY");
								trace("MousePrevAngle: "+MousePrevAngle);
								DiskFlag = '01';
							}
							
						}else if(hit_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RotaryClicks();
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WindUp();
							MousePrevAngle = (
								((Math.atan2(touches[0].globalY-146, touches[0].globalX-647))
									*180
								)/ Math.PI
							)+180;
							trace("02 READY");
							trace("MousePrevAngle: "+MousePrevAngle);
							DiskFlag = '02';
						}else if(hit_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RotaryClicks();
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WindUp();
							MousePrevAngle = (
								((Math.atan2(touches[0].globalY-362, touches[0].globalX-272))
									*180
								)/ Math.PI
							)+180;
							trace("03 READY");
							trace("MousePrevAngle: "+MousePrevAngle);
							DiskFlag = '03';
						}else if(hit_04.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RotaryClicks();
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WindUp();
							MousePrevAngle = (
								((Math.atan2(touches[0].globalY-362, touches[0].globalX-522))
									*180
								)/ Math.PI
							)+180;
							trace("04 READY");
							trace("MousePrevAngle: "+MousePrevAngle);
							DiskFlag = '04';
						}
					}else if (touches[0].phase == TouchPhase.MOVED) {
						if(DiskFlag != null){
							DiskHandler();
						}
					}else if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((RoboticsRoomKoma as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RoboticsRoomKomaObj,true
							);
							
						}
						(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("RotaryClicks");
						(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("WindUp");
						
						MousePrevAngle = 0;
						MouseCurrentAngle = 0;
						
						DiskFlag = null;
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle;
						}
						SaveArray['00'] = needle_00.rotation;
						SaveArray['01'] = needle_01.rotation;
						SaveArray['02'] = needle_02.rotation;
						SaveArray['03'] = needle_03.rotation;
						SaveArray['04'] = needle_04.rotation;
			
						
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsRoomKomaPuzzle',SaveArray);
						
						
						trace(rad2deg(needle_00.rotation));
						trace(rad2deg(needle_01.rotation));
						trace(rad2deg(needle_02.rotation));
						trace(rad2deg(needle_03.rotation));
						trace(rad2deg(needle_04.rotation));
						
						Solve();
						
					}
				}
			}
		}
		
		private function AttachKomaDialHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_KomaDial)
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsThree();
			
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle;	
				}
				DiskAttached = true;
				disk_01.alpha = 1;
				needle_01.alpha = 1;
				SaveArray['Dial'] = "Attached";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsRoomKomaPuzzle',SaveArray);
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_KomaDial,
						"item_KomaDial"
					);
				
			//	Starling.juggler.delayCall(PlaySuccess,0.5);
				
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Looks like one of the dials here is missing...");
			}
		}
		private function PlaySuccess():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
		}
		private function DiskHandler():void{
			if(DiskFlag == '00'){
				
				MouseCurrentAngle = (
					((Math.atan2(touches[0].globalY-146, touches[0].globalX-146))
						*180
					)/ Math.PI
				)+180;
				if(MousePrevAngle > MouseCurrentAngle){
					needle_00.rotation = needle_00.rotation-(deg2rad(1));	
					needle_01.rotation = needle_01.rotation+(deg2rad(1));	
					needle_02.rotation = needle_02.rotation-(deg2rad(1));	
					needle_03.rotation = needle_03.rotation+(deg2rad(1));	
				//	disk_00.rotation = disk_00.rotation-(deg2rad(1));	
					
					
				}else if(MousePrevAngle < MouseCurrentAngle){
					needle_00.rotation = needle_00.rotation+(deg2rad(1));	
					needle_01.rotation = needle_01.rotation-(deg2rad(1));	
					needle_02.rotation = needle_02.rotation+(deg2rad(1));	
					needle_03.rotation = needle_03.rotation-(deg2rad(1));	
				//	disk_00.rotation = disk_00.rotation+(deg2rad(1));		
					
					
				}
			}
			else if(DiskFlag == '01'){
				
				MouseCurrentAngle = (
					((Math.atan2(touches[0].globalY-146, touches[0].globalX-396))
						*180
					)/ Math.PI
				)+180;
				if(MousePrevAngle > MouseCurrentAngle){
					needle_01.rotation = needle_01.rotation-(deg2rad(1));	
					
					
					
				}else if(MousePrevAngle < MouseCurrentAngle){
					needle_01.rotation = needle_01.rotation+(deg2rad(1));		
					
					
					
				}
			}
			else if(DiskFlag == '02'){
				
				MouseCurrentAngle = (
					((Math.atan2(touches[0].globalY-146, touches[0].globalX-647))
						*180
					)/ Math.PI
				)+180;
				if(MousePrevAngle > MouseCurrentAngle){
					needle_01.rotation = needle_01.rotation+(deg2rad(1));	
					needle_02.rotation = needle_02.rotation-(deg2rad(1));	
					needle_03.rotation = needle_03.rotation+(deg2rad(1));	
				//	needle_04.rotation = needle_04.rotation-(deg2rad(1));	
					
				}else if(MousePrevAngle < MouseCurrentAngle){
					needle_01.rotation = needle_01.rotation-(deg2rad(1));	
					needle_02.rotation = needle_02.rotation+(deg2rad(1));	
					needle_03.rotation = needle_03.rotation-(deg2rad(1));		
				//	needle_04.rotation = needle_04.rotation+(deg2rad(1));
					
					
				}
			}
			else if(DiskFlag == '03'){
				
				MouseCurrentAngle = (
					((Math.atan2(touches[0].globalY-363, touches[0].globalX-272))
						*180
					)/ Math.PI
				)+180;
				if(MousePrevAngle > MouseCurrentAngle){
					needle_01.rotation = needle_01.rotation+(deg2rad(1));	
					needle_03.rotation = needle_03.rotation-(deg2rad(1));	
					
					
					
				}else if(MousePrevAngle < MouseCurrentAngle){
					needle_01.rotation = needle_01.rotation-(deg2rad(1));	
					needle_03.rotation = needle_03.rotation+(deg2rad(1));		
					
					
					
				}
			}
			else if(DiskFlag == '04'){
				
				MouseCurrentAngle = (
					((Math.atan2(touches[0].globalY-363, touches[0].globalX-522))
						*180
					)/ Math.PI
				)+180;
				if(MousePrevAngle > MouseCurrentAngle){
					needle_00.rotation = needle_00.rotation-(deg2rad(1));
					needle_01.rotation = needle_01.rotation+(deg2rad(1));
					needle_02.rotation = needle_02.rotation-(deg2rad(1));	
					needle_03.rotation = needle_03.rotation+(deg2rad(1));	
					needle_04.rotation = needle_04.rotation-(deg2rad(1));	
					
					
					
				}else if(MousePrevAngle < MouseCurrentAngle){
					needle_00.rotation = needle_00.rotation+(deg2rad(1));
					needle_01.rotation = needle_01.rotation-(deg2rad(1));
					needle_02.rotation = needle_02.rotation+(deg2rad(1));	
					needle_03.rotation = needle_03.rotation-(deg2rad(1));	
					needle_04.rotation = needle_04.rotation+(deg2rad(1));		
					
					
					
				}
			}
			MousePrevAngle = MouseCurrentAngle;
			return;
		}
		
		private function Solve():void{
			trace("rad2deg(needle_04.rotation): "+rad2deg(needle_04.rotation));
			trace("rad2deg(needle_04.rotation): "+needle_04.rotation);
			if(DiskAttached === true){
			
				if(rad2deg(needle_00.rotation) >= -68 && rad2deg(needle_00.rotation) <= -56) {
					if(rad2deg(needle_01.rotation) >= -7 && rad2deg(needle_01.rotation) <= 5){
						if(rad2deg(needle_02.rotation) >= 55 && rad2deg(needle_02.rotation) <= 67){
							if(rad2deg(needle_03.rotation) >= -124 && rad2deg(needle_03.rotation) <= -111){
								if(Math.abs(rad2deg(needle_04.rotation)) >= 176){
//								if(rad2deg(needle_04.rotation) <= 181 && rad2deg(needle_04.rotation) >= -174){
									trace("SOLVED");
									trace("SOLVED");
									trace("SOLVED");
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsThree();
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
								//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirLeak();
									game.SoundFXObj.PlaySFX_PowerPulse();
								//	game.SoundFXObj.PlaySFX_PowerPulse();
									Animating = true;
									
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle != undefined){	
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RoboticsRoomKomaPuzzle;	
									}
									
									SaveArray['Solved'] = "Yes";
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RoboticsRoomKomaPuzzle',SaveArray);
									
									Starling.juggler.delayCall(RunSolve,1.5);
									
								}else{
									trace("fail on 4");
								}
							}else{
								trace("fail on 3");
							}
						}else{
							trace("fail on 2");
						}
					}else{
						trace("fail on 1");
					}
				}else{
					trace("fail on 0");
				}	
			}else{
				trace("NO disc");
			}
		}
		
		private function RunSolve():void{
			FadeOut((RoboticsRoomKoma as Class), 
				(stage.getChildAt(0) as Object).screenGamePlayHandler.RoboticsRoomKomaObj,true
			);
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
			
			
			
			this.assets.removeTexture("roboticsRoomKomaPuzzle_bg",true);
			this.assets.removeTexture("RoboticsRoomKomaPuzzle_Sprite_01",true);
			this.assets.removeTextureAtlas("RoboticsRoomKomaPuzzle_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("roboticsRoomKomaPuzzle_01");
			(stage.getChildAt(0) as Object).falseAsset("roboticsRoomKomaPuzzle_02");
			(stage.getChildAt(0) as Object).falseAsset("roboticsRoomKomaPuzzle_03");
			
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
