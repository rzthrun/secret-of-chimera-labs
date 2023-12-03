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
	
	
	public class GeneticsRoomDesk extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var lid_on:Image;
		private var lid_off:Image;
		private var cup_full:Image;
		private var slot:Image;
		private var stone:Image;
		private var tube:Image;
		private var mist:Image;
		private var red_machine_hood:Image;
		
		private var hit_spin:Shape;
		private var hit_cup:Shape;
		private var hit_lid:Shape;
		private var hit_tube:Shape;
		private var hit_stone:Shape;
		
		private var hit_machine:Shape;	
		private var hit_rear:Shape;	
		private var hit_pipe:Shape;
		
		
		public var MistTweenOne:Tween;
		public var MistTweenTwo:Tween;
		
		private var Animating:Boolean = false;
		private var LidOpen:Boolean = false;
		private var LidUnlocked:Boolean = false;
		private var TubePickedUp:Boolean = false;
		private var StonePickedUp:Boolean = false;
		private var CupPickedUp:Boolean = false;
		private var SpinWheelSolved:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function GeneticsRoomDesk(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('geneticsRoomDesk_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomDesk/geneticsRoomDesk_bg.jpg'));
				game.TrackAssets('geneticsRoomDesk_01');
			}
			if(game.CheckAsset('geneticsRoomDesk_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomDesk/GeneticsRoomDesk_Sprite_01.png'));
				game.TrackAssets('geneticsRoomDesk_02');
			}
			if(game.CheckAsset('geneticsRoomDesk_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomDesk/GeneticsRoomDesk_Sprite_01.xml'));
				game.TrackAssets('geneticsRoomDesk_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GeneticsRoomDesk","GeneticsRoomDeskObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			
			
			
			bg = new Image(this.assets.getTexture('geneticsRoomDesk_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			cup_full = new Image(this.assets.getTexture('cup_full'));
			cup_full.touchable = false;
			cup_full.x = 319;
			cup_full.y = 247;
			
			lid_on = new Image(this.assets.getTexture('lid_on'));
			lid_on.touchable = false;
			lid_on.x = 272;
			lid_on.y = 217;
			
			lid_off = new Image(this.assets.getTexture('lid_off'));
			lid_off.touchable = false;
			lid_off.x = 166;
			lid_off.y = 216;
			
			slot = new Image(this.assets.getTexture('slot'));
			slot.touchable = false;
			slot.x = 688;
			slot.y = 213;
			
			stone = new Image(this.assets.getTexture('stone'));
			stone.touchable = false;
			stone.x = 155;
			stone.y = 360;
			
			tube = new Image(this.assets.getTexture('tube'));
			tube.touchable = false;
			tube.x = 71;
			tube.y = 262;
			
			red_machine_hood = new Image(this.assets.getTexture('red_hood'));
			red_machine_hood.touchable = false;
			red_machine_hood.x = 592;
			red_machine_hood.y = 204;
			
			
			mist = new Image(this.assets.getTexture('smoke'));
			mist.touchable = false;
			mist.x = 0;
			mist.y = 207;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel["Solved"] == 'Yes'){
					SpinWheelSolved = true;	
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.SpinWheel['TemplateAttached'] == 'Yes'){
					slot.alpha = 1;	
				}else{
					slot.alpha = 0;
				}
				
			}else{
				slot.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk['Tube'] == 'PickedUp'){
					TubePickedUp = true;
					tube.alpha = 0;
				}else{
					tube.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk['Stone'] == 'PickedUp'){
					StonePickedUp = true;
					stone.alpha = 0;
				}else{
					stone.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk['Lid'] == 'Open'){
					LidOpen = true;	
					CreateCupHit();
					lid_on.alpha = 0;
					lid_off.alpha = 1;
				}else{
					lid_on.alpha = 1;
					lid_off.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk['LidUnlocked'] == 'yes'){
					LidUnlocked = true;
					red_machine_hood.alpha = 0;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk['Cup'] == 'PickedUp'){
						CupPickedUp = true;
						cup_full.alpha = 0;
					}else{
						cup_full.alpha = 1;
						
					}
				}else{
					if(SpinWheelSolved === true){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicWaffle();
						
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk;	
						}
						SaveArray['LidUnlocked'] = "yes";
						SaveArray['Lid'] = "Open";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomDesk',SaveArray);
						
						LidUnlocked = true;
						LidOpen = true;
						Animating = true;
						red_machine_hood.alpha = 1;
						CreateCupHit();
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Machine();
							DrainRedAnima();							
						},2.5);
						
					}else{
						lid_on.alpha = 1;
						lid_off.alpha = 0;
						red_machine_hood.alpha = 0;
					}
				}
			}else{
				stone.alpha = 1;
				tube.alpha = 1;
				lid_on.alpha = 1;
				lid_off.alpha = 0;
				red_machine_hood.alpha = 0;
				cup_full.alpha = 1;
				
				
			}
			
		
			
			mist.alpha = 0;
			
			
			this.addChildAt(cup_full,1);
			this.addChildAt(lid_on,2);
			this.addChildAt(lid_off,3);
			this.addChildAt(slot,4);
			this.addChildAt(tube,5);
			this.addChildAt(stone,6);
			
			this.addChildAt(red_machine_hood,7);
			this.addChildAt(mist,8);
			
			CreateSpinHit();
			CreateTubeHit();
			CreateStoneHit();
			CreateLidHit(LidOpen);
			CreatePipeHit();
			CreateMachineHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		
		/*
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_BottleC,
				'item_BottleC',
				'inven_bottleC_sm'
			);
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_DNAJar,
				'item_DNAJar',
				'inven_dnaJar_sm'
			);
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_DNAJar,
				'item_DNAJar',
				'inven_dnaJar_sm'
			);
		*/
		
		}
		private function DrainRedAnima():void{
			MistTweenTwo = new Tween(red_machine_hood, 2, Transitions.EASE_IN);
			MistTweenTwo.fadeTo(0);
			MistTweenTwo.onComplete = function():void{				
				UnlockLidAnima();
				MistTweenTwo = null;				
			};
			
			Starling.juggler.add(MistTweenTwo);	
		}
		
		private function UnlockLidAnima():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirRelease();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxTwo_Open();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_AirLeak();
			mist.alpha = 1;
		
			lid_on.alpha = 0;
			lid_off.alpha = 1;
			
			MistTweenOne = new Tween(mist, 3, Transitions.EASE_IN);
			MistTweenOne.fadeTo(0);
			MistTweenOne.onComplete = function():void{				
				Animating = false;
				MistTweenOne = null;				
			};
			
			Starling.juggler.add(MistTweenOne);	
			
			if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
				
				Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).MusicObj.LoadXFiles(true,3);
					
				},0.25);
			}
		}
		
		private function CreateLidHit(open:Boolean = false):void{
			hit_lid = new Shape();		
			hit_lid.x = 0;
			hit_lid.y = 0;
			hit_lid.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_lid.graphics.lineTo(268,213);					
				hit_lid.graphics.lineTo(372,229);					
				hit_lid.graphics.lineTo(373,337);					
				hit_lid.graphics.lineTo(275,315);					
								
			}else{
				
				hit_lid.graphics.lineTo(165,232);
				hit_lid.graphics.lineTo(270,215);
				hit_lid.graphics.lineTo(276,314);
				hit_lid.graphics.lineTo(175,340);
				
			}				
			hit_lid.graphics.endFill(false);			
			hit_lid.alpha = 0.0;			
			hit_lid.graphics.precisionHitTest = true;	
			hit_lid.touchable = false
			this.addChild(hit_lid);
			
			
		}
		/*
		private var hit_machine:Shape;	
		hit_pipe
		hit_machine
		private var hit_pipe:Shape;
		private var hit_machine:Shape;	
		private var hit_rear:Shape;	
		
		CreatePipeHit();
		CreateMachineHit();
		*/
		//hit_machine
		
		
		private function CreatePipeHit():void{
			hit_pipe = new Shape();
			hit_pipe.touchable = false;
			hit_pipe.graphics.beginFill(0xff0000);
			
			hit_pipe.graphics.lineTo(259,56);	
			hit_pipe.graphics.lineTo(316,0);	
			hit_pipe.graphics.lineTo(651,0);	
			hit_pipe.graphics.lineTo(670,99);	
			hit_pipe.graphics.lineTo(526,43);	
			hit_pipe.graphics.lineTo(514,112);	
			hit_pipe.graphics.lineTo(270,113);	
			
			hit_pipe.graphics.endFill(false);
			hit_pipe.alpha = 0.0;
			
			hit_pipe.graphics.precisionHitTest = true;	
			this.addChild(hit_pipe);
		}
		
		private function CreateMachineHit():void{
			hit_machine = new Shape();
			hit_machine.touchable = false;
			hit_machine.graphics.beginFill(0xff0000);
			
			hit_machine.graphics.lineTo(229,120);	
			hit_machine.graphics.lineTo(290,89);	
			hit_machine.graphics.lineTo(464,125);	
			hit_machine.graphics.lineTo(451,297);	
			hit_machine.graphics.lineTo(370,360);	
			hit_machine.graphics.lineTo(232,312);	
					
			hit_machine.graphics.endFill(false);
			hit_machine.alpha = 0.0;
			
			hit_machine.graphics.precisionHitTest = true;	
			this.addChild(hit_machine);
		}
		private function CreateStoneHit():void{
			hit_stone = new Shape();
			hit_stone.touchable = false;
			hit_stone.graphics.beginFill(0xff0000);
			
			hit_stone.graphics.lineTo(150,391);	
			hit_stone.graphics.lineTo(199,351);	
			hit_stone.graphics.lineTo(334,382);	
			hit_stone.graphics.lineTo(333,398);	
			hit_stone.graphics.lineTo(220,451);	
			hit_stone.graphics.lineTo(158,438);	
						
			hit_stone.graphics.endFill(false);
			hit_stone.alpha = 0.0;
			
			hit_stone.graphics.precisionHitTest = true;	
			this.addChild(hit_stone);
		}
		
		private function CreateTubeHit():void{
			hit_tube = new Shape();
			hit_tube.touchable = false;
			hit_tube.graphics.beginFill(0xff0000);
			
			hit_tube.graphics.lineTo(67,264);	
			hit_tube.graphics.lineTo(171,247);	
			hit_tube.graphics.lineTo(208,270);	
			hit_tube.graphics.lineTo(222,344);	
			hit_tube.graphics.lineTo(135,388);	
			hit_tube.graphics.lineTo(72,364);	
		
			hit_tube.graphics.endFill(false);
			hit_tube.alpha = 0.0;
			
			hit_tube.graphics.precisionHitTest = true;	
			this.addChild(hit_tube);
		}		
		
		private function CreateCupHit():void{
			hit_cup = new Shape();
			hit_cup.touchable = false;
			hit_cup.graphics.beginFill(0xff0000);
			
			hit_cup.graphics.lineTo(298,253);	
			hit_cup.graphics.lineTo(314,234);	
			hit_cup.graphics.lineTo(369,246);	
			hit_cup.graphics.lineTo(368,326);	
			hit_cup.graphics.lineTo(315,315);	
			
			hit_cup.graphics.endFill(false);
			hit_cup.alpha = 0.0;
			
			hit_cup.graphics.precisionHitTest = true;	
			this.addChild(hit_cup);
		}
		
		private function CreateSpinHit():void{
			hit_spin = new Shape();
			hit_spin.touchable = false;
			hit_spin.graphics.beginFill(0xff0000);
			
			hit_spin.graphics.lineTo(485,371);	
			hit_spin.graphics.lineTo(483,298);	
			hit_spin.graphics.lineTo(540,130);	
			hit_spin.graphics.lineTo(599,94);	
			hit_spin.graphics.lineTo(778,137);	
			hit_spin.graphics.lineTo(759,334);	
			hit_spin.graphics.lineTo(741,385);	
			hit_spin.graphics.lineTo(636,411);				
			
			hit_spin.graphics.endFill(false);
			hit_spin.alpha = 0.0;
			
			hit_spin.graphics.precisionHitTest = true;	
			this.addChild(hit_spin);
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
							FadeOut((GeneticsRoom as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomObj,true
							);
							return;
						}else if(hit_spin.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(LidUnlocked === false){
								FadeOut((SpinWheel as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.SpinWheelObj,true
								);
								return;
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think I'm done with this device....");
							}
							
						}else if(hit_tube.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							TubeHandler();		
							return;
						}else if(hit_stone.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							StoneHandler();						
							return;
						}else if(hit_lid.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LidHandler();	
							return;
						}else if(hit_pipe.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A large tube connects the two contraptions...");
						}
								//hit_pipe
						hit_machine	
						if(LidOpen === true){
							if(hit_cup.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								CupHandler();
								return;
							}else if(hit_machine.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The machine is freezing cold to the touch...");
								return;
							}
							
							
						
						}else{
							if(hit_machine.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The machine is freezing cold to the touch...");
								return;
							}
						}
 					}
				}
			}
		}
		
		
		
		private function CupHandler():void{
			if(CupPickedUp === false){
				
					if((stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.armedItem
						== 
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.inventoryBarObj
						.item_Handler)
					{
						CupPickedUp = true;
						//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClinkOne();
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_HandlerCup,
							'item_HandlerCup',
							'inven_handlerCup_sm',
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Handler,
							'item_Handler'
						);
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk;	
						}
						
						cup_full.alpha = 0;
						SaveArray['Cup'] = "PickedUp";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomDesk',SaveArray);
						
						if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						
							Starling.juggler.delayCall(function():void{
								(stage.getChildAt(0) as Object).MusicObj.LoadMacLeodTwo(true,1);
								
							},0.25);
						}
					
					
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The cup is freezing cold; I can't touch it.");
					
				}
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There's nothing but frost in the machine.");
				
			}
		}
		
		
		private function LidHandler():void{
			if(LidUnlocked === true){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk;	
				}
				if(LidOpen === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxTwo_Open();
					LidOpen = true;
					lid_on.alpha = 0;
					lid_off.alpha = 1;
					SaveArray['Lid'] = "Open";
					hit_lid._graphics.clear();
					CreateLidHit(true);
					CreateCupHit();
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxTwo_Close();
					LidOpen = false;
					lid_on.alpha = 1;
					lid_off.alpha = 0;
					SaveArray['Lid'] = "Closed";
					hit_cup._graphics.clear();
					hit_lid._graphics.clear();
					CreateLidHit(false);
				}
				
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomDesk',SaveArray);
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The surface of the machine is freezing cold and covered in frost.");
			}
		}
		
		private function TubeHandler():void{
			if(TubePickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk;	
				}
				TubePickedUp = true;
				tube.alpha = 0;
				SaveArray['Tube'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomDesk',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CoffeePot,
					'item_CoffeePot',
					'inven_coffeePot_sm'
				);
				
			//	(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
			//		(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_TubeEmpty,
			//		'item_TubeEmpty',
			//		'inven_tubeEmpty_sm'
			//	);
			}
		}
		private function StoneHandler():void{
			if(StonePickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomDesk;	
				}
				StonePickedUp = true;
				stone.alpha = 0;
				SaveArray['Stone'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomDesk',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_StoneTwo,
					'item_StoneTwo',
					'inven_stoneTwo_sm'
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
			
			
			
			this.assets.removeTexture("geneticsRoomDesk_bg",true);
			this.assets.removeTexture("GeneticsRoomDesk_Sprite_01",true);
			this.assets.removeTextureAtlas("GeneticsRoomDesk_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomDesk_01");
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomDesk_02");
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomDesk_03");
			
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
