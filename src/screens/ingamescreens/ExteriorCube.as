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
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;
	
	
	public class ExteriorCube extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var marquee_mc:MovieClip;
		
		
		private var hit_cube:Shape;
		private var hit_info:Shape;
		
		private var hit_ground:Shape;
		private var hit_stand:Shape;
		private var hit_building:Shape;
		
		private var RONum:int = 0;
		
		
		private var Animating:Boolean = false;
		
		private var RedRockPickedUp:Boolean = false;
		private var StoneUnlocked:Boolean = false;
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function ExteriorCube(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('exteriorCube_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCube/exteriorCube_bg.jpg'));
				game.TrackAssets('exteriorCube_01');
			}
			if(game.CheckAsset('exteriorCube_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCube/ExteriorCube_Sprite_01.png'));
				game.TrackAssets('exteriorCube_02');
			}
			if(game.CheckAsset('exteriorCube_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorCube/ExteriorCube_Sprite_01.xml'));
				game.TrackAssets('exteriorCube_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ExteriorCube","ExteriorCubeObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('exteriorCube_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCarRear['ChiselUsed'] == 'Yes'){	
					StoneUnlocked = true;
				}
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCube != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCube['RedRock'] == 'PickedUp'){	
					RedRockPickedUp = true;
				}
			}
			
			marquee_mc = new MovieClip(this.assets.getTextures('marq_00').reverse(),12);
			//elevator_mc.smoothing = TextureSmoothing.NONE;
			marquee_mc.x = 0;
			marquee_mc.y = 0;
			marquee_mc.touchable = false;
			marquee_mc.loop = true; 
			
			marquee_mc.addFrameAt(01,this.assets.getTexture("marq_00"), null, 2);
			marquee_mc.addFrameAt(02,this.assets.getTexture("marq_00"), null, 0.05);
			marquee_mc.addFrameAt(03,this.assets.getTexture("marq_00"), null, 0.05);
			marquee_mc.addFrameAt(04,this.assets.getTexture("marq_00"), null, 0.05);
			marquee_mc.addFrameAt(05,this.assets.getTexture("marq_00"), null, 1.5);
			marquee_mc.addFrameAt(06,this.assets.getTexture("marq_00"), null, 0.05);
			marquee_mc.addFrameAt(07,this.assets.getTexture("marq_00"), null, 0.05);
			marquee_mc.addFrameAt(08,this.assets.getTexture("marq_00"), null, 0.05);
			marquee_mc.addFrameAt(09,this.assets.getTexture("marq_00"), null, 1);
			marquee_mc.addFrameAt(10,this.assets.getTexture("marq_00"), null, 0.05);
			marquee_mc.addFrameAt(11,this.assets.getTexture("marq_00"), null, 0.05);
			marquee_mc.addFrameAt(12,this.assets.getTexture("marq_00"), null, 0.05);
			marquee_mc.addFrameAt(13,this.assets.getTexture("marq_00"), null, 3.5);
			marquee_mc.addFrameAt(14,this.assets.getTexture("marq_00"), null, 0.05);
			marquee_mc.addFrameAt(15,this.assets.getTexture("marq_00"), null, 0.05);
			marquee_mc.addFrameAt(16,this.assets.getTexture("marq_00"), null, 0.05);
			marquee_mc.addFrameAt(17,this.assets.getTexture("marq_00"), null, 5);
			
			marquee_mc.alpha = 0;
			
			this.addChildAt(marquee_mc,1);
			
			CreateGroundHit();
			CreateStandHit();
			CreateInfoHit();
			CreateBuildingHit();
			
			CreateCubeHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			marquee_mc.addEventListener(EnterFrameEvent.ENTER_FRAME, MarqueeEnterFrameHandler);
			Starling.juggler.add(marquee_mc);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadCityHum(true,999);

		}
		
		
		private function MarqueeEnterFrameHandler():void{
			if(marquee_mc.currentFrame == 2){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
			}else if(marquee_mc.currentFrame == 6){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
			}else if(marquee_mc.currentFrame == 10){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
			}else if(marquee_mc.currentFrame == 14){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
			}
			
			
		}
		
		//hit_info
		
		//	
		//hit_ground:Shape;
		//hit_ground:Shape;
		private function CreateGroundHit():void{
			hit_ground = new Shape();
			hit_ground.touchable = false;
			hit_ground.graphics.beginFill(0xff0000);
			
			hit_ground.graphics.lineTo(0,340);	
			hit_ground.graphics.lineTo(196,340);	
			hit_ground.graphics.lineTo(336,329);	
			hit_ground.graphics.lineTo(343,400);	
			hit_ground.graphics.lineTo(200,429);	
			hit_ground.graphics.lineTo(206,465);	
			
			hit_ground.graphics.endFill(false);
			hit_ground.alpha = 0.0;
			
			hit_ground.graphics.precisionHitTest = true;	
			this.addChild(hit_ground);
		}
		
		
		private function CreateStandHit():void{
			hit_stand = new Shape();
			hit_stand.touchable = false;
			hit_stand.graphics.beginFill(0xff0000);
			
			hit_stand.graphics.lineTo(329,452);	
			hit_stand.graphics.lineTo(493,424);	
			hit_stand.graphics.lineTo(633,465);	
			hit_stand.graphics.lineTo(442,499);	
		
			hit_stand.graphics.endFill(false);
			hit_stand.alpha = 0.0;
			
			hit_stand.graphics.precisionHitTest = true;	
			this.addChild(hit_stand);
		}
		
		private function CreateBuildingHit():void{
			hit_building = new Shape();
			hit_building.touchable = false;
			hit_building.graphics.beginFill(0xff0000);
			
			hit_building.graphics.lineTo(0,0);	
			hit_building.graphics.lineTo(169,0);	
			hit_building.graphics.lineTo(402,58);	
			hit_building.graphics.lineTo(332,327);	
			hit_building.graphics.lineTo(0,327);	
			
			hit_building.graphics.endFill(false);
			hit_building.alpha = 0.0;
			
			hit_building.graphics.precisionHitTest = true;	
			this.addChild(hit_building);
		}
		
		private function CreateInfoHit():void{
			hit_info = new Shape();
			hit_info.touchable = false;
			hit_info.graphics.beginFill(0xff0000);
			
			hit_info.graphics.lineTo(51,249);	
			hit_info.graphics.lineTo(211,255);	
			hit_info.graphics.lineTo(238,332);	
			hit_info.graphics.lineTo(56,330);	
				
			
			hit_info.graphics.endFill(false);
			hit_info.alpha = 0.0;
			
			hit_info.graphics.precisionHitTest = true;	
			this.addChild(hit_info);
		}
		
		private function CreateCubeHit():void{
			hit_cube = new Shape();
			hit_cube.touchable = false;
			hit_cube.graphics.beginFill(0xff0000);
			
			hit_cube.graphics.lineTo(296,216);	
			hit_cube.graphics.lineTo(330,155);	
			hit_cube.graphics.lineTo(435,42);	
			hit_cube.graphics.lineTo(475,21);	
			hit_cube.graphics.lineTo(509,33);	
			hit_cube.graphics.lineTo(623,118);	
			hit_cube.graphics.lineTo(635,152);	
			hit_cube.graphics.lineTo(628,199);	
			hit_cube.graphics.lineTo(732,259);	
			hit_cube.graphics.lineTo(741,297);	
			hit_cube.graphics.lineTo(723,328);	
			hit_cube.graphics.lineTo(558,440);	
			hit_cube.graphics.lineTo(517,442);	
			hit_cube.graphics.lineTo(473,369);	
			hit_cube.graphics.lineTo(433,410);	
			hit_cube.graphics.lineTo(386,423);	
			hit_cube.graphics.lineTo(345,387);	
			hit_cube.graphics.lineTo(340,307);			
			
			hit_cube.graphics.endFill(false);
			hit_cube.alpha = 0.0;
			
			hit_cube.graphics.precisionHitTest = true;	
			this.addChild(hit_cube);
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
							
							FadeOut((Exterior as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorObj,true
							);
						}else if(hit_cube.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CubeHandler();
						}else if(hit_info.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((ExteriorCubeInfo as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorCubeInfoObj,true
							);
						}else if(hit_ground.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							GroundHandler();
						}else if(hit_stand.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The sculpture rests on a square metal stand.");
						}else if(hit_building.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BuildHandler();
						}
						
						/*
						
						private var hit_ground:Shape;
						private var hit_stand:Shape;
						private var hit_building:Shape;
						
						*/
					}
				}
			}
		}
		private function GroundHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Some of the grass is green, some yellow.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This lawn is a small patch of nature in an industrial wasteland.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The leaves of grass are withered and aged.");
			}
		}

		
		private function BuildHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The dark nearby buildings loom over this small enclave of light.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder what they make around here...?");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The buildings have tall windows set in concrete and lined with rust.");
			}
		}
		
		private function CubeHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Chisel)
			{
				if(RedRockPickedUp === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HammerTap();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClinkOne();
					
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCube != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorCube;	
					}
					RedRockPickedUp = true;
					SaveArray['RedRock'] = "PickedUp";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorCube',SaveArray);
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_RedRock,
						'item_RedRock',
						'inven_redRock_sm'
					);
					
					if(StoneUnlocked === true){
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
							.InventoryObj.removeItemFromInventory(
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
								.InventoryObj.item_Chisel,
								"item_Chisel"
							);
					}
				}
			}else{
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The sculpture is made out of a polished red metal.");
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The shape resembles the sign on top of the building.");
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The material the sculpture is made of is unlike anything I've ever seen before.");
				}
				
				
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
			
			
			
			this.assets.removeTexture("exteriorCube_bg",true);
			this.assets.removeTexture("ExteriorCube_Sprite_01",true);
			this.assets.removeTextureAtlas("ExteriorCube_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("exteriorCube_01");
			(stage.getChildAt(0) as Object).falseAsset("exteriorCube_02");
			(stage.getChildAt(0) as Object).falseAsset("exteriorCube_03");
			
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
