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
	
	public class LabDesk extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var screen:Image;
		private var tube:Image;
		private var tube_full:Image;
		private var syringe:Image;
		
		private var hit_syringe:Shape;
		private var hit_screen:Shape;
		private var hit_tube:Shape;
		
		private var hit_machine:Shape;
		private var hit_cable:Shape;
		private var hit_table:Shape;
		private var hit_bg:Shape;
		
		private var ComputerOn:Boolean = false;
		private var SyringePickedUp:Boolean = false;
		
		private var ComputerSolved:Boolean = false;
		private var TubeAttached:Boolean = false;
		private var TubeFull:Boolean = false;
		private var TubePickedUp:Boolean = false;
		
		private var Animating:Boolean = false;
		private var ScreenTween:Tween;
		private var TubeTween:Tween;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function LabDesk(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('labDesk_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabDesk/labDesk_bg.jpg'));
				game.TrackAssets('labDesk_01');
			}
			if(game.CheckAsset('labDesk_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabDesk/LabDesk_Sprite_01.png'));
				game.TrackAssets('labDesk_02');
			}
			if(game.CheckAsset('labDesk_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/LabDesk/LabDesk_Sprite_01.xml'));
				game.TrackAssets('labDesk_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("LabDesk","LabDeskObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
		/*	
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Orb,
			'item_Orb',
			'inven_orb_sm'
			);
			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_StoneOne,
				'item_StoneOne',
				'inven_stoneOne_sm'
			);
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_StoneTwo,
				'item_StoneTwo',
				'inven_stoneTwo_sm'
			);
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_StoneThree,
				'item_StoneThree',
				'inven_stoneThree_sm'
			);
		*/	
			bg = new Image(this.assets.getTexture('labDesk_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			syringe = new Image(this.assets.getTexture('syringe'));
			syringe.touchable = false;
			syringe.x = 294;
			syringe.y = 332;
			
			tube = new Image(this.assets.getTexture('tube_empty'));
			tube.touchable = false;
			tube.x = 501;
			tube.y = 164; 
			
			tube_full = new Image(this.assets.getTexture('tube_blue'));
			tube_full.touchable = false;
			tube_full.x = 501;
			tube_full.y = 164; 
			
			screen = new Image(this.assets.getTexture('screen_blue'));
			screen.touchable = false;
			screen.x = 64;
			screen.y = 146; 
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabHexPuzzle['Solved'] == 'Yes'){
					ComputerSolved = true;
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk['Syringe'] == "PickedUp"){
					SyringePickedUp = true;
					syringe.alpha = 0;
				}else{
					syringe.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk['ComputerOn'] == "Yes"){
					ComputerOn = true;
					screen.texture = this.assets.getTexture('screen_puzzle');
					screen.alpha = 1;
				}else{
					screen.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk['TubeAttached'] == "Yes"){	
					TubeAttached = true;
				}				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk['TubeFull'] == "Yes"){
					TubeFull = true;	
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk['TubePickedUp'] == "Yes"){	
					TubePickedUp = true;					
				}
				if(TubeAttached === true){
					if(ComputerSolved === true){
						if(TubePickedUp === true){
							tube_full.alpha = 0;
							tube.alpha = 0;
						}else{
							if(TubeFull === false){
								tube_full.alpha = 0;
								tube.alpha = 1;
								Animating = true;
								TubeFull = true;
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk != undefined){	
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk;	
								}
								SaveArray['TubeFull'] = "Yes";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabDesk',SaveArray);
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Machine();	
								Starling.juggler.delayCall(function():void{
									FillTube();
								},2);
							}else{
								tube_full.alpha = 1;
								tube.alpha = 0;
							}
						}
					}else{
						tube.alpha = 1;
						tube_full.alpha = 0;
					}
				}else{
					tube.alpha = 0;
					tube_full.alpha = 0;
				}
				
				
			}else{
				syringe.alpha = 1;
				screen.alpha = 0;
				tube.alpha = 0;
				tube_full.alpha = 0;
			}
		
			this.addChildAt(syringe,1);
			this.addChildAt(tube,2);
			this.addChildAt(tube_full,3);
			this.addChildAt(screen,4);
			
			CreateMachineHit();

			CableHit();
			TableHit();
			BgHit();
			
			CreateSyringeHit();
			CreateScreenHit();
			CreateTubeHit();
		
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);			
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).AmbientObj.LoadSpaceHumPower(true,999);
			},0.5);
		}
		
		private function FillTube():void{
			if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
				Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).MusicObj.LoadHarper(true,2);							
				},0.25);
			}
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Machine();	
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_WaterBoil();	
			TubeTween = new Tween(tube_full, 2, Transitions.LINEAR);
			TubeTween.fadeTo(1);
			TubeTween.onComplete = function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OvenDing();
				Animating = false;
				tube.alpha = 0;
				TubeTween = null;
				//		CreateOpenNotePadHit();
				//	CreateOpenEmergencyHit();
				//	CreateOpenHeadSetHit();
				//	Animating = false; 
			};
			
			Starling.juggler.add(TubeTween);	
		}
		
		/*
		TableHit();
		BgHit();
		
		private var hit_table:Shape;
		private var hit_bg:Shape;
		*/
		
		private function BgHit():void{
			hit_bg = new Shape();
			hit_bg.touchable = false;
			hit_bg.graphics.beginFill(0xff0000);
			
			hit_bg.graphics.lineTo(0,0);	
			hit_bg.graphics.lineTo(365,7);	
			hit_bg.graphics.lineTo(341,161);	
			hit_bg.graphics.lineTo(0,209);	
		
			hit_bg.graphics.endFill(false);
			hit_bg.alpha = 0.0;
			
			hit_bg.graphics.precisionHitTest = true;	
			this.addChild(hit_bg);
		}
		
		private function TableHit():void{
			hit_table = new Shape();
			hit_table.touchable = false;
			hit_table.graphics.beginFill(0xff0000);
			
			hit_table.graphics.lineTo(51,384);	
			hit_table.graphics.lineTo(343,334);	
			hit_table.graphics.lineTo(523,409);	
			hit_table.graphics.lineTo(493,472);	
			hit_table.graphics.lineTo(307,506);	
			hit_table.graphics.lineTo(91,506);	
					
			hit_table.graphics.endFill(false);
			hit_table.alpha = 0.0;
			
			hit_table.graphics.precisionHitTest = true;	
			this.addChild(hit_table);
		}
		
		private function CableHit():void{
			hit_cable = new Shape();
			hit_cable.touchable = false;
			hit_cable.graphics.beginFill(0xff0000);
			
			hit_cable.graphics.lineTo(331,296);	
			hit_cable.graphics.lineTo(460,314);	
			hit_cable.graphics.lineTo(546,369);	
			hit_cable.graphics.lineTo(637,380);	
			hit_cable.graphics.lineTo(690,295);	
			hit_cable.graphics.lineTo(728,314);	
			hit_cable.graphics.lineTo(688,408);	
			hit_cable.graphics.lineTo(596,430);	
			hit_cable.graphics.lineTo(493,396);	
			hit_cable.graphics.lineTo(350,333);	
			
			hit_cable.graphics.endFill(false);
			hit_cable.alpha = 0.0;
			
			hit_cable.graphics.precisionHitTest = true;	
			this.addChild(hit_cable);
		}
		
		private function CreateMachineHit():void{
			hit_machine = new Shape();
			hit_machine.touchable = false;
			hit_machine.graphics.beginFill(0xff0000);
			
			hit_machine.graphics.lineTo(348,275);	
			hit_machine.graphics.lineTo(342,124);	
			hit_machine.graphics.lineTo(401,19);	
			hit_machine.graphics.lineTo(665,37);	
			hit_machine.graphics.lineTo(766,173);	
			hit_machine.graphics.lineTo(744,352);	
			
			hit_machine.graphics.endFill(false);
			hit_machine.alpha = 0.0;
			
			hit_machine.graphics.precisionHitTest = true;	
			this.addChild(hit_machine);
		}
		
		private function CreateTubeHit():void{
			hit_tube = new Shape();
			hit_tube.touchable = false;
			hit_tube.graphics.beginFill(0xff0000);
			
			hit_tube.graphics.lineTo(403,121);	
			hit_tube.graphics.lineTo(580,139);	
			hit_tube.graphics.lineTo(560,296);	
			hit_tube.graphics.lineTo(389,268);	
			
			hit_tube.graphics.endFill(false);
			hit_tube.alpha = 0.0;
			
			hit_tube.graphics.precisionHitTest = true;	
			this.addChild(hit_tube);
		}
		private function CreateScreenHit():void{
			hit_screen = new Shape();
			hit_screen.touchable = false;
			hit_screen.graphics.beginFill(0xff0000);
			
			hit_screen.graphics.lineTo(51,149);	
			hit_screen.graphics.lineTo(261,128);	
			hit_screen.graphics.lineTo(287,277);	
			hit_screen.graphics.lineTo(331,351);	
			hit_screen.graphics.lineTo(78,403);	
						
			hit_screen.graphics.endFill(false);
			hit_screen.alpha = 0.0;
			
			hit_screen.graphics.precisionHitTest = true;	
			this.addChild(hit_screen);
		}
		private function CreateSyringeHit():void{
			hit_syringe = new Shape();
			hit_syringe.touchable = false;
			hit_syringe.graphics.beginFill(0xff0000);
			
			hit_syringe.graphics.lineTo(281,417);	
			hit_syringe.graphics.lineTo(326,352);	
			hit_syringe.graphics.lineTo(360,339);	
			hit_syringe.graphics.lineTo(505,321);	
			hit_syringe.graphics.lineTo(540,336);	
			hit_syringe.graphics.lineTo(435,463);	
			hit_syringe.graphics.lineTo(315,474);	
		
			hit_syringe.graphics.endFill(false);
			hit_syringe.alpha = 0.0;
			
			hit_syringe.graphics.precisionHitTest = true;	
			this.addChild(hit_syringe);
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
							FadeOut((Lab as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LabObj,true
							);
						}else if(hit_screen.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(ComputerOn === false){
								ScreenHandler();
								return;
							}else{
								if(ComputerSolved === false){
									FadeOut((LabHexPuzzle as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.LabHexPuzzleObj,true
									);
									return;
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think I'm done with this computer program...");
								}
								
							}
							
						}else if(hit_syringe.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SyringeHandler(e);
							return;
						}else if(hit_tube.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							TubeHandler();
							return;
						}else if(hit_cable.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A cable connects the machine to the laptop computer.");				
						}else if(hit_machine.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Intricate pipes, valves, and switches cover almost the entire surface of the device.");		
							//MachineHandler();
						}else if(hit_table.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The marble surface of the lab table is cold and smooth.");				
						}else if(hit_bg.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((Lab as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.LabObj,true
							);
						}
					}
				}
			}
		}
/*		private function MachineHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Intricate pipes, valves and switches cover almost the entire surface of the device.");				
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The machine v");
				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can't the room and breathe in the gases at the same time.");
				
			}
		}
*/		
		
		private function TubeHandler():void{
			if(TubeAttached === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_TubeEmpty)
				{
					
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk;	
					}
					SaveArray['TubeAttached'] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabDesk',SaveArray);
					TubeAttached = true;
				//	tube.texture = this.assets.getTexture('cube');
					tube.alpha = 1;
					
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_TubeEmpty,
							"item_TubeEmpty"
						);
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The machine has a circular groove on the base, below what looks like a small pressurized spout...");
					
				}
			}else{
				if(TubeFull === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The glass tube fits snugly into the machine.");
					
				}else{
					if(TubePickedUp === false){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk;	
						}
						TubePickedUp = true;
						tube_full.alpha = 0;
						tube.alpha = 0;
						SaveArray['TubePickedUp'] = "Yes";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabDesk',SaveArray);
						
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_TubeBlue,
							'item_TubeBlue',
							'inven_tubeBlue_sm'
						);
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think I'm done with this machine.");
						
					}
				}
			}
		}
		
		private function ScreenHandler():void{
			Animating = true;
			ComputerOn = true;
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk;	
			}
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BootUp();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
			SaveArray['ComputerOn'] = "Yes";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabDesk',SaveArray);
			
			
			ScreenTween = new Tween(screen, 2, Transitions.LINEAR);
			ScreenTween.fadeTo(1);
			ScreenTween.onComplete = function():void{
				OnCompleteScreenFadeIn();
				Animating = false;
				ScreenTween = null;
				
			};
			Starling.juggler.add(ScreenTween);	
		}
		
		public function OnCompleteScreenFadeIn():void{
			screen.texture = this.assets.getTexture('screen_puzzle');
		}
		
		private function SyringeHandler(e:TouchEvent):void{
			if(SyringePickedUp === false){
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Syringe,
					'item_Syringe',
					'inven_syringe_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk;	
				}
				SyringePickedUp = true;
				syringe.alpha = 0;
				SaveArray['Syringe'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabDesk',SaveArray);
				
			}else if(hit_cable.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A cable connects the machine to the laptop computer.");				
			}else if(hit_table.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The marble surface of the lab table is cold and smooth.");	
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
			
			
			
			this.assets.removeTexture("labDesk_bg",true);
			this.assets.removeTexture("LabDesk_Sprite_01",true);
			this.assets.removeTextureAtlas("LabDesk_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("labDesk_01");
			(stage.getChildAt(0) as Object).falseAsset("labDesk_02");
			(stage.getChildAt(0) as Object).falseAsset("labDesk_03");
			
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
