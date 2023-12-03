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
	
	
	public class ExteriorGrate extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		//	private var hit_elevator_door:Shape;
		private var grate_on:Image;
		private var grate_off:Image;
		private var keys:Image;
		
		private var hit_grate:Shape;
		private var hit_keys:Shape;
		private var hit_grime:Shape;
		private var hit_leaves:Shape;
		private var hit_leaf:Shape;
		private var hit_concrete_00:Shape;
		private var hit_concrete_01:Shape;
		
		private var GrateOpen:Boolean = false;
		private var KeysPickedUp:Boolean = false;
		private var Animating:Boolean = false;
		
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		private var RONum:int = 0;
		
		
		public function ExteriorGrate(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('exteriorGrate_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorGrate/exteriorGrate_bg.jpg'));
				game.TrackAssets('exteriorGrate_01');
			}
			if(game.CheckAsset('exteriorGrate_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorGrate/ExteriorGrate_Sprite_01.png'));
				game.TrackAssets('exteriorGrate_02');
			}
			if(game.CheckAsset('exteriorGrate_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ExteriorGrate/ExteriorGrate_Sprite_01.xml'));
				game.TrackAssets('exteriorGrate_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ExteriorGrate","ExteriorGrateObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('exteriorGrate_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			grate_on = new Image(this.assets.getTexture('on'));	
			grate_on.touchable = false;
			grate_on.x = 148;
			grate_on.y = 35;
			
			grate_off = new Image(this.assets.getTexture('off'));
			grate_off.touchable = false;
			grate_off.x = 9;
			grate_off.y = 0;
			
			keys = new Image(this.assets.getTexture('keys_on'));
			keys.touchable = false;
			keys.x = 325;
			keys.y = 240;
			
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate['Keys'] == 'PickedUp'){	
					keys.alpha = 0;
					KeysPickedUp = true;
					
				}else{
					keys.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate['Grate'] == 'Open'){	
					keys.texture = this.assets.getTexture('keys_off');
					grate_off.alpha = 1;
					grate_on.alpha = 0;
					GrateOpen = true;
				}else{
					
					grate_off.alpha = 0;
					grate_on.alpha = 1;
				}
			}else{
				grate_on.alpha = 1;
				grate_off.alpha = 0;
				keys.alpha = 1;
			}
			
	
			this.addChildAt(grate_on,1);
			this.addChildAt(grate_off,2);
			this.addChildAt(keys,3);
			//	CreateElevatorDoorHit();
			CreateGrateHit(GrateOpen);
			CreateGrimeHit();
			CreateKeysHit();
			CreateLeafHit();
			CreateLeavesHit();
			CreateConcreate00Hit();
			CreateConcreate01Hit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		/*
		private var hit_concrete_00:Shape;
		private var hit_concrete_01:Shape;
		hit_leaf
		*/
		private function CreateLeafHit():void{
			hit_leaf = new Shape();
			hit_leaf.touchable = false;
			hit_leaf.graphics.beginFill(0xff0000);
			
			hit_leaf.graphics.lineTo(27,256);	
			hit_leaf.graphics.lineTo(55,186);	
			hit_leaf.graphics.lineTo(125,183);	
			hit_leaf.graphics.lineTo(150,226);	
			hit_leaf.graphics.lineTo(134,281);	
			hit_leaf.graphics.lineTo(71,293);	
			
			hit_leaf.alpha = 0.0;
			
			hit_leaf.graphics.precisionHitTest = true;	
			this.addChild(hit_leaf);
		}
		
		private function CreateConcreate01Hit():void{
			hit_concrete_01 = new Shape();
			hit_concrete_01.touchable = false;
			hit_concrete_01.graphics.beginFill(0xff0000);
			
			hit_concrete_01.graphics.lineTo(0,303);	
			hit_concrete_01.graphics.lineTo(150,282);	
			hit_concrete_01.graphics.lineTo(187,485);	
			hit_concrete_01.graphics.lineTo(702,314);	
			hit_concrete_01.graphics.lineTo(747,376);	
			hit_concrete_01.graphics.lineTo(582,508);	
			hit_concrete_01.graphics.lineTo(90,508);	
			hit_concrete_01.graphics.lineTo(0,392);	
		
			hit_concrete_01.alpha = 0.0;
			
			hit_concrete_01.graphics.precisionHitTest = true;	
			this.addChild(hit_concrete_01);
		}
		private function CreateConcreate00Hit():void{
			hit_concrete_00 = new Shape();
			hit_concrete_00.touchable = false;
			hit_concrete_00.graphics.beginFill(0xff0000);
			
			hit_concrete_00.graphics.lineTo(0,0);	
			hit_concrete_00.graphics.lineTo(664,0);	
			hit_concrete_00.graphics.lineTo(800,139);	
			hit_concrete_00.graphics.lineTo(800,307);	
			hit_concrete_00.graphics.lineTo(700,304);	
			hit_concrete_00.graphics.lineTo(536,35);	
			hit_concrete_00.graphics.lineTo(498,26);	
			hit_concrete_00.graphics.lineTo(0,137);	
		
			hit_concrete_00.graphics.endFill(false);
			hit_concrete_00.alpha = 0.0;
			
			hit_concrete_00.graphics.precisionHitTest = true;	
			this.addChild(hit_concrete_00);
		}
		
		private function CreateLeavesHit():void{
			hit_leaves = new Shape();
			hit_leaves.touchable = false;
			hit_leaves.graphics.beginFill(0xff0000);
			
			hit_leaves.graphics.lineTo(478,417);	
			hit_leaves.graphics.lineTo(494,366);	
			hit_leaves.graphics.lineTo(608,331);	
			hit_leaves.graphics.lineTo(661,358);	
			hit_leaves.graphics.lineTo(650,408);	
			hit_leaves.graphics.lineTo(553,484);	
			
			hit_leaves.graphics.endFill(false);
			hit_leaves.alpha = 0.0;
			
			hit_leaves.graphics.precisionHitTest = true;	
			this.addChild(hit_leaves);
		}
		
		private function CreateGrimeHit():void{
			hit_grime = new Shape();
			hit_grime.touchable = false;
			hit_grime.graphics.beginFill(0xff0000);
			
			hit_grime.graphics.lineTo(193,256);	
			hit_grime.graphics.lineTo(350,179);	
			hit_grime.graphics.lineTo(495,140);	
			hit_grime.graphics.lineTo(584,316);	
			hit_grime.graphics.lineTo(231,427);	
			
			hit_grime.graphics.endFill(false);
			hit_grime.alpha = 0.0;
			
			hit_grime.graphics.precisionHitTest = true;	
			this.addChild(hit_grime);
		}
		private function CreateKeysHit():void{
			hit_keys = new Shape();
			hit_keys.touchable = false;
			hit_keys.graphics.beginFill(0xff0000);
			
			hit_keys.graphics.lineTo(305,309);	
			hit_keys.graphics.lineTo(343,224);	
			hit_keys.graphics.lineTo(388,220);	
			hit_keys.graphics.lineTo(455,296);	
			hit_keys.graphics.lineTo(445,312);	
			hit_keys.graphics.lineTo(331,342);	
			
			hit_keys.graphics.endFill(false);
			hit_keys.alpha = 0.0;
			
			hit_keys.graphics.precisionHitTest = true;	
			this.addChild(hit_keys);
		}
		
		private function CreateGrateHit(open:Boolean = false):void{
			hit_grate = new Shape();		
			hit_grate.x = 0;
			hit_grate.y = 0;
			hit_grate.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_grate.graphics.lineTo(135,127);
				hit_grate.graphics.lineTo(528,32);
				hit_grate.graphics.lineTo(698,305);
				hit_grate.graphics.lineTo(197,461);
	
			}else{
	
				hit_grate.graphics.lineTo(11,42);
				hit_grate.graphics.lineTo(125,0);
				hit_grate.graphics.lineTo(420,0);
				hit_grate.graphics.lineTo(510,96);
				hit_grate.graphics.lineTo(127,283);
	
			}
			
			hit_grate.graphics.endFill(false);			
			hit_grate.alpha = 0.0;			
			hit_grate.graphics.precisionHitTest = true;	
			hit_grate.touchable = false
			this.addChild(hit_grate);
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
						
							FadeOut((ExteriorRear as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ExteriorRearObj,true
							);
							//		}else if(hit_elevator_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							//			FadeOut((Elevator as Class), 
							//				(stage.getChildAt(0) as Object).screenGamePlayHandler.ElevatorObj,true
							//			);
						}else if(hit_grate.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							GrateHandler();
						}else if(hit_leaves.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LeavesHandler();
						}else if(hit_leaf.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LeavesHandler();
						}else if(hit_concrete_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ConcreteHandler();
						}else if(hit_concrete_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ConcreteHandler();	
						}else if(GrateOpen === true){
							if(hit_keys.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(KeysPickedUp === true){
									GrimeHandler();
								}else{
									KeysHandler();
								}
								
							}else if(hit_grime.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								GrimeHandler();
							}
						}
					}
				}
			}
		}
		private function ConcreteHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The ground is slightly damp.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The asphalt is cracked and broken.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Pebbles, dust, and bits of debris are scattered randomly about the ground.");
			}
		}
		
		private function LeavesHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Leaves wait to be swept into the gutter.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Though fallen, the leaves still have a rich color.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("leaves wait to be swept into the gutter.");
			}
		}
		
		private function GrimeHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Decomposing leaves, bits of gravel, and murky water sit in the drain.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The floor of the drain is covered in murky dirt...");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It must have rained recently...");
			}
		}
		
		private function KeysHandler():void{
			if(KeysPickedUp === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterPour();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate;	
				}
				KeysPickedUp = true;
				keys.alpha = 0;
				SaveArray['Keys'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorGrate',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_KeyCard,
					'item_KeyCard',
					'inven_keyCard_sm'
				);
			}
		}
		
		private function GrateHandler():void{
			if(GrateOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxOpen();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate;	
				}
				SaveArray['Grate'] = "Open";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorGrate',SaveArray);
				
				GrateOpen = true;
				hit_grate.graphics.clear();
				grate_on.alpha = 0;
				grate_off.alpha = 1;
				keys.texture = this.assets.getTexture('keys_off');
				
				CreateGrateHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxClose();
			
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ExteriorGrate;	
				}
				SaveArray['Grate'] = "Closed";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ExteriorGrate',SaveArray);
				
				GrateOpen = false;
				hit_grate.graphics.clear();
				grate_on.alpha = 1;
				grate_off.alpha = 0;
				keys.texture = this.assets.getTexture('keys_on');
				CreateGrateHit(false);
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
			
			
			
			this.assets.removeTexture("exteriorGrate_bg",true);
			this.assets.removeTexture("ExteriorGrate_Sprite_01",true);			
			this.assets.removeTextureAtlas("ExteriorGrate_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("exteriorGrate_01");
			(stage.getChildAt(0) as Object).falseAsset("exteriorGrate_02");
			(stage.getChildAt(0) as Object).falseAsset("exteriorGrate_03");
			
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
