package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.DelayedCall;
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
	
	public class RocketRoomComputerDesk extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		//	private var hit_elevator_door:Shape;
		private var large_drawer:Image;
		private var small_drawer:Image;
		private var push_box:Image;
		private var hdd:Image;
		private var cube:Image;
		private var glow_cube:Image;
		private var electric_top:Image;
		private var electric_bottom:Image;
		private var screen:Image;
		
		private var hit_drawer_small:Shape;
		private var hit_drawer_large:Shape;
		private var hit_pushbox:Shape;
		private var hit_machine:Shape;
		private var hit_computer:Shape;
		private var hit_tower:Shape;
		
		private var hit_machine_body:Shape;
		
		
		private var LargeDrawerOpen:Boolean = false;
		private var SmallDrawerOpen:Boolean = false;
		private var PushBoxPickedUp:Boolean = false;
		private var CubeAttached:Boolean = false;
		private var CubeDamageAttached:Boolean = false;
		
		private var HDDAttached:Boolean = false;
		private var HDDOut:Boolean = false;
		
		public var delayedCall:DelayedCall;
		private var CubeWritten:Boolean = false;
		private var ComputerOn:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var GlowCubeTween:Tween;
		private var ElectricTopTween:Tween;
		private var ElectricBottomTween:Tween;
		private var ScreenTween:Tween;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function RocketRoomComputerDesk(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('rocketRoomComputerDesk_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomComputerDesk/rocketRoomComputerDesk_bg.jpg'));
				game.TrackAssets('rocketRoomComputerDesk_01');
			}
			if(game.CheckAsset('rocketRoomComputerDesk_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomComputerDesk/RocketRoomComputerDesk_Sprite_01.png'));
				game.TrackAssets('rocketRoomComputerDesk_02');
			}
			if(game.CheckAsset('rocketRoomComputerDesk_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomComputerDesk/RocketRoomComputerDesk_Sprite_01.xml'));
				game.TrackAssets('rocketRoomComputerDesk_03');
			}
			if(game.CheckAsset('rocketRoomComputerDesk_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomComputerDesk/RocketRoomComputerDesk_Sprite_02.png'));
				game.TrackAssets('rocketRoomComputerDesk_04');
			}
			if(game.CheckAsset('rocketRoomComputerDesk_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomComputerDesk/RocketRoomComputerDesk_Sprite_02.xml'));
				game.TrackAssets('rocketRoomComputerDesk_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RocketRoomComputerDesk","RocketRoomComputerDeskObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			
	
			
			bg = new Image(this.assets.getTexture('rocketRoomComputerDesk_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			/*
			private var large_drawer:Image;
			private var small_drawer:Image;
			private var push_box:Image;
			private var hdd:Image;
			private var cube:Image;
			private var glow_cube:Image;
			*/
			small_drawer = new Image(this.assets.getTexture('small_drawer'));
			small_drawer.touchable = false;
			small_drawer.x = 444;
			small_drawer.y = 378;
			
			large_drawer = new Image(this.assets.getTexture('large_drawer'));
			large_drawer.touchable = false;
			large_drawer.x = 108;
			large_drawer.y = 408;
			
			push_box = new Image(this.assets.getTexture('push_box'));
			push_box.touchable = false;
			push_box.x = 536;
			push_box.y = 400;
			
			//669
			//253
			
			hdd = new Image(this.assets.getTexture('hdd'));
			hdd.touchable = false;
			hdd.x = 669;
			hdd.y = 253;
		
			cube = new Image(this.assets.getTexture('cube'));
			cube.touchable = false;
			cube.x = 119;
			cube.y = 195;
			
			glow_cube = new Image(this.assets.getTexture('glow_cube'));
			glow_cube.touchable = false;
			glow_cube.x = 98;
			glow_cube.y = 171;
			
			electric_top = new Image(this.assets.getTexture('electric_top'));
			electric_top.touchable = false;
			electric_top.x = 77;
			electric_top.y = 172;
			
			electric_bottom = new Image(this.assets.getTexture('electric_bottom'));
			electric_bottom.touchable = false;
			electric_bottom.x = 94;
			electric_bottom.y = 199;
			
			screen = new Image(this.assets.getTexture('computer_screen_startup'));
			screen.touchable = false;
			screen.x = 284;
			screen.y = 123;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['CubeWritten'] == 'Yes'){
					CubeWritten = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['PushBox'] == 'PickedUp'){	
					PushBoxPickedUp = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['SmallDrawer'] == 'Open'){	
					SmallDrawerOpen = true;
					small_drawer.alpha = 1;
					if(PushBoxPickedUp === true){
						push_box.alpha = 0;
					}else{
						push_box.alpha = 1;
					}
					CreatePushBoxHit();
				}else{
					push_box.alpha = 0;
					small_drawer.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['LargeDrawer'] == 'Open'){	
					LargeDrawerOpen = true;
					large_drawer.alpha = 1;
				}else{
					large_drawer.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['CubeDamage'] == 'Attached'){	
					CubeDamageAttached = true;
					cube.texture = this.assets.getTexture('cube_damage');
					cube.alpha = 1;
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['Cube'] == 'Attached'){	
					CubeAttached = true;
					cube.texture = this.assets.getTexture('cube');
					cube.alpha = 1;
				}else{
					cube.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['HDD'] == 'Attached'){	
					HDDAttached = true;
					hdd.alpha = 0;
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['HDD'] == 'Out'){	
					HDDOut = true;
					hdd.alpha = 1;
				}else{
					hdd.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk['ComputerOn'] == 'Yes'){	
					ComputerOn = true;
					screen.texture = this.assets.getTexture('computer_screen_on');
					screen.alpha = 1;
				}else{
					screen.alpha = 0;
				}
			}else{
				push_box.alpha = 0;
				small_drawer.alpha = 0;
				large_drawer.alpha = 0;
				cube.alpha = 0;
				screen.alpha = 0;
				hdd.alpha = 0;
			}
			
			
		//	large_drawer.alpha = 0;
			//push_box.alpha = 0;
			
			glow_cube.alpha = 0;
			electric_top.alpha = 0;
			electric_bottom.alpha = 0;
			
			this.addChildAt(small_drawer,1);
			this.addChildAt(large_drawer,2);
			this.addChildAt(push_box,3);
			this.addChildAt(cube,4);
			this.addChildAt(glow_cube,5);
			this.addChildAt(electric_top,6);
			this.addChildAt(electric_bottom,7);
			this.addChildAt(hdd,8);
			this.addChildAt(screen,9);
			
			CreateSmallDrawerHit(SmallDrawerOpen);
			CreateLargeDrawerHit(LargeDrawerOpen);
			CreateMachineHit();
			CreateComputerHit();
			CreateTowerHit();
			CreateMachineBodyHit();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer != undefined){
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputer['WriteSuccess'] == 'Yes'){
					if(CubeWritten === false){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
						}
						SaveArray['CubeWritten'] = "Yes";
						SaveArray['CubeDamage'] = "Gone";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
						CubeWritten = true;
						Animating = true;
						
						delayedCall = new DelayedCall(function():void{
							AnimateGlowCube();
						},2);
						Starling.juggler.add(delayedCall);	
					}
					
				}
			}
			/*
		
			
			*/
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		/*
		
		private var GlowCubeTween:Tween;
		private var ElectricTopTween:Tween;
		private var ElectricBottomTween:Tween;
		glow_cube
		electric_top
		electric_bottom
		*/
		
		private function AnimateGlowCube():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Electofy();
			GlowCubeTween = new Tween(glow_cube, 2, Transitions.EASE_OUT);
			GlowCubeTween.fadeTo(1);
			GlowCubeTween.onComplete = function():void{
				SparkAnimate01();
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
			};
			
			Starling.juggler.add(GlowCubeTween);
		}
		
		private function SparkAnimate01():void{
			ElectricTopTween = new Tween(electric_top, 1, Transitions.EASE_IN_OUT_BOUNCE);
			ElectricTopTween.fadeTo(1);
			ElectricTopTween.onComplete = function():void{
				SparkAnimate02();
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
			};
			
			Starling.juggler.add(ElectricTopTween);
		}
		private function SparkAnimate02():void{
			ElectricTopTween = new Tween(electric_top, 1, Transitions.EASE_IN_OUT_BOUNCE);
			ElectricTopTween.fadeTo(0);
			ElectricTopTween.onComplete = function():void{
				
			};
						
			ElectricBottomTween = new Tween(electric_bottom, 1, Transitions.EASE_IN_OUT_BOUNCE);
			ElectricBottomTween.fadeTo(1);
			ElectricBottomTween.onComplete = function():void{
				SparkAnimate03();
			};
			
			Starling.juggler.add(ElectricBottomTween);
			Starling.juggler.add(ElectricTopTween);
		}
		
		private function SparkAnimate03():void{
			ElectricBottomTween = new Tween(electric_bottom, 1, Transitions.EASE_IN_OUT_BOUNCE);
			ElectricBottomTween.fadeTo(0);
			ElectricBottomTween.onComplete = function():void{
				
			};
					
			ElectricTopTween = new Tween(electric_top, 1, Transitions.EASE_IN_OUT_BOUNCE);
			ElectricTopTween.fadeTo(1);
			ElectricTopTween.onComplete = function():void{
				SparkAnimate04();
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
			};
			
			Starling.juggler.add(ElectricTopTween);
			Starling.juggler.add(ElectricBottomTween);
		}
		
		private function SparkAnimate04():void{
			GlowCubeTween = new Tween(glow_cube, 2, Transitions.EASE_IN);
			GlowCubeTween.fadeTo(0);
			GlowCubeTween.onComplete = function():void{
				SparkOnComplete();
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
			};
			ElectricTopTween = new Tween(electric_top, 1, Transitions.EASE_IN_OUT_BOUNCE);
			ElectricTopTween.fadeTo(0);
			ElectricTopTween.onComplete = function():void{
				
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
			};
			
			Starling.juggler.add(ElectricTopTween);
			Starling.juggler.add(GlowCubeTween);
		}
		private function SparkOnComplete():void{
			Animating = false;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OvenDing();
		}
		
	
		
		private function CreateLargeDrawerHit(open:Boolean = false):void{
			hit_drawer_large = new Shape();		
			hit_drawer_large.x = 0;
			hit_drawer_large.y = 0;
			hit_drawer_large.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_drawer_large.graphics.lineTo(108,467);
				hit_drawer_large.graphics.lineTo(443,404);
				hit_drawer_large.graphics.lineTo(441,449);
				hit_drawer_large.graphics.lineTo(156,509);
				hit_drawer_large.graphics.lineTo(109,508);
			
			}else{
			
				hit_drawer_large.graphics.lineTo(115,473);	
				hit_drawer_large.graphics.lineTo(438,409);	
				hit_drawer_large.graphics.lineTo(515,477);	
				hit_drawer_large.graphics.lineTo(510,508);	
				hit_drawer_large.graphics.lineTo(131,508);	
			}
			
			hit_drawer_large.graphics.endFill(false);			
			hit_drawer_large.alpha = 0.0;			
			hit_drawer_large.graphics.precisionHitTest = true;	
			hit_drawer_large.touchable = false
			this.addChild(hit_drawer_large);
			
			
			
		}
		
		
		private function CreateSmallDrawerHit(open:Boolean = false):void{
			hit_drawer_small = new Shape();		
			hit_drawer_small.x = 0;
			hit_drawer_small.y = 0;
			hit_drawer_small.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_drawer_small.graphics.lineTo(443,402);
				hit_drawer_small.graphics.lineTo(588,373);
				hit_drawer_small.graphics.lineTo(584,444);
				hit_drawer_small.graphics.lineTo(440,474);
				
			}else{				
				hit_drawer_small.graphics.lineTo(448,405);	
				hit_drawer_small.graphics.lineTo(581,376);	
				hit_drawer_small.graphics.lineTo(673,433);	
				hit_drawer_small.graphics.lineTo(670,492);	
				hit_drawer_small.graphics.lineTo(596,507);	
				hit_drawer_small.graphics.lineTo(523,507);	
				
			}
			
			hit_drawer_small.graphics.endFill(false);			
			hit_drawer_small.alpha = 0.0;			
			hit_drawer_small.graphics.precisionHitTest = true;	
			hit_drawer_small.touchable = false
			this.addChild(hit_drawer_small);
			
			
			
		}
		//hit_machine_body
		private function CreateMachineBodyHit():void{
			hit_machine_body = new Shape();
			hit_machine_body.touchable = false;
			hit_machine_body.graphics.beginFill(0xff0000);
			
			hit_machine_body.graphics.lineTo(13,334);	
			hit_machine_body.graphics.lineTo(21,88);	
			hit_machine_body.graphics.lineTo(130,51);	
			hit_machine_body.graphics.lineTo(229,88);	
			hit_machine_body.graphics.lineTo(307,392);	
			hit_machine_body.graphics.lineTo(82,429);	
				
			
			hit_machine_body.graphics.endFill(false);
			hit_machine_body.alpha = 0.0;
			
			hit_machine_body.graphics.precisionHitTest = true;	
			this.addChild(hit_machine_body);
		}
		
		private function CreateTowerHit():void{
			hit_tower = new Shape();
			hit_tower.touchable = false;
			hit_tower.graphics.beginFill(0xff0000);
			
			hit_tower.graphics.lineTo(633,85);	
			hit_tower.graphics.lineTo(769,129);	
			hit_tower.graphics.lineTo(746,366);	
			hit_tower.graphics.lineTo(613,389);	
			
			hit_tower.graphics.endFill(false);
			hit_tower.alpha = 0.0;
			
			hit_tower.graphics.precisionHitTest = true;	
			this.addChild(hit_tower);
		}
		
		private function CreateComputerHit():void{
			hit_computer = new Shape();
			hit_computer.touchable = false;
			hit_computer.graphics.beginFill(0xff0000);
			
			hit_computer.graphics.lineTo(266,124);	
			hit_computer.graphics.lineTo(513,105);	
			hit_computer.graphics.lineTo(543,348);	
			hit_computer.graphics.lineTo(384,388);	
			hit_computer.graphics.lineTo(285,318);	
			
			
			hit_computer.graphics.endFill(false);
			hit_computer.alpha = 0.0;
			
			hit_computer.graphics.precisionHitTest = true;	
			this.addChild(hit_computer);
		}
		
		private function CreateMachineHit():void{
			hit_machine = new Shape();
			hit_machine.touchable = false;
			hit_machine.graphics.beginFill(0xff0000);
			
			hit_machine.graphics.lineTo(81,206);	
			hit_machine.graphics.lineTo(108,164);	
			hit_machine.graphics.lineTo(171,158);	
			hit_machine.graphics.lineTo(205,187);	
			hit_machine.graphics.lineTo(211,240);	
			hit_machine.graphics.lineTo(183,279);	
			hit_machine.graphics.lineTo(130,288);	
			hit_machine.graphics.lineTo(90,268);	
			
			hit_machine.graphics.endFill(false);
			hit_machine.alpha = 0.0;
			
			hit_machine.graphics.precisionHitTest = true;	
			this.addChild(hit_machine);
		}
		
		
		
		private function CreatePushBoxHit():void{
			hit_pushbox = new Shape();
			hit_pushbox.touchable = false;
			hit_pushbox.graphics.beginFill(0xff0000);
			
			hit_pushbox.graphics.lineTo(511,427);	
			hit_pushbox.graphics.lineTo(573,364);	
			hit_pushbox.graphics.lineTo(635,405);	
			hit_pushbox.graphics.lineTo(569,482);	
		
			hit_pushbox.graphics.endFill(false);
			hit_pushbox.alpha = 0.0;
			
			hit_pushbox.graphics.precisionHitTest = true;	
			this.addChild(hit_pushbox);
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
							FadeOut((RocketRoom as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomObj,true
							);
						}else if(hit_computer.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							ComputerHandler();
						}else if(hit_tower.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							TowerHandler();		
						}else if(hit_machine.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							MachineHandler();	
						}else if(hit_drawer_large.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LargeDrawerHandler();
						}else if(hit_drawer_small.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(SmallDrawerOpen === true){
								if(hit_pushbox.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									PushBoxHandler();
								}else{
									SmallDrawerHandler();
								}
							}else{
								SmallDrawerHandler();
							}
						}else if(hit_machine_body.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							MachineBodyHandler();		//hit_machine_body
							
						}else if(SmallDrawerOpen === true){
							if(hit_pushbox.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PushBoxHandler();
							}
						}
							
					}
				}
			}
		}
		private function ComputerHandler():void{
			if(ComputerOn === false){
				TurnComputer();
			}else{
				FadeOut((RocketRoomComputer as Class), 
						(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomComputerObj,true
				);
			}
		}
		private function TurnComputer():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_BootUp();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
			}
			SaveArray['ComputerOn'] = "Yes";
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
			
			Animating = true;
			ComputerOn = true;
			ScreenTween = new Tween(screen, 2, Transitions.EASE_OUT);
			ScreenTween.fadeTo(1);
			ScreenTween.onComplete = function():void{
				CompleteTurnComputer();
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Gurgles();
				
			};
			
			Starling.juggler.add(ScreenTween);
		}
		
		public function CompleteTurnComputer():void{			
			screen.texture = this.assets.getTexture('computer_screen_on');
			Animating = false;
			ScreenTween = null;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
			
			
		}
		
		private function TowerHandler():void{
			if(HDDAttached === false){
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_HDD)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've inserted the hard drive into the computer tower.");
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
					}
					SaveArray['HDD'] = "Attached";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
					HDDAttached = true;
				//	cube.texture = this.assets.getTexture('cube');
				//	cube.alpha = 1;
					hdd.alpha = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've inserted the hard drive into the computer tower.");
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_HDD,
							"item_HDD"
						);
				}else{
					if(HDDOut === true){
						HDDOut = false;
						HDDAttached = false;
						hdd.alpha = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_HDD,
							'item_HDD',
							'inven_hdd_sm'
						);
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
						}
						SaveArray['HDD'] = "No";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
						
					/*	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
						HDDAttached = false;
						HDDOut = true;
						hdd.alpha = 1;
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
						}
						SaveArray['HDD'] = "Out";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
					*/
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A large computer tower....");
						/*(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
						
						*/
					}
		
					
				}
			}else{
				if(CubeWritten === false){
					if(HDDOut === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TVBlip();
						HDDAttached = false;
						HDDOut = true;
						hdd.alpha = 1;
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
						}
						SaveArray['HDD'] = "Out";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
			
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
						HDDOut = false;
						HDDAttached = false;
						hdd.alpha = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_HDD,
							'item_HDD',
							'inven_hdd_sm'
						);
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
						}
						SaveArray['HDD'] = "No";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
					}
					//	(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A large computer tower....");
						
					
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think I'll leave the hard drive in the tower for now.");
				}
				
			}
		}
		
		private function MachineHandler():void{
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
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
					}
					SaveArray['Cube'] = "Attached";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
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
					
				}else if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_CubeDamage)
				{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
					}
					SaveArray['CubeDamage'] = "Attached";
					CubeDamageAttached = true;
					cube.texture = this.assets.getTexture('cube_damage');
					cube.alpha = 1;
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_CubeDamage,
							"item_CubeDamage"
						);
				}else{
					MachineCenterReadOutter();
				}
			}else{
				if(CubeAttached === true){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
					}
					CubeAttached = false;
					cube.alpha = 0;
					SaveArray['Cube'] = "PickedUp";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Cube,
						'item_Cube',
						'inven_cube_sm'
					);
				}else if(CubeDamageAttached === true){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
					}
					CubeDamageAttached = false;
					cube.alpha = 0;
					SaveArray['CubeDamage'] = "PickedUp";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
					
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_CubeDamage,
						'item_CubeDamage',
						'inven_cubeDamage_sm'
					);
				}else{
					
					MachineCenterReadOutter();
				}
			}
		}
		private function MachineCenterReadOutter():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Strong magnetic fields focus at the center of the device.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are five flat circular metal discs converging at the center. Each emits a negative magnetic field");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Yow! ... A strong electrical current runs through the machine.");
			}
		}
		
		private function MachineBodyHandler():void{
		
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The device on the desk has a strong magnetic pull.");
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The machine has cabling running through and over multiple metal cylinders.");
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The device on the desk has a strong magnetic pull.");
				}
			
		}
		
		private function PushBoxHandler():void{
			trace("PushBox Hit");
			if(PushBoxPickedUp === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
				}
				PushBoxPickedUp = true;
				push_box.alpha = 0;
				SaveArray['PushBox'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PushBox,
					'item_PushBox',
					'inven_pushBox_sm'
				);
			}else{
				SmallDrawerHandler();
			}
		}
		
		private function SmallDrawerHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
			}
			
			if(SmallDrawerOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
				SmallDrawerOpen = true;
				small_drawer.alpha = 1;
				if(PushBoxPickedUp === false){
					push_box.alpha = 1;	
				}
				SaveArray['SmallDrawer'] = "Open";
				hit_drawer_small.graphics.clear();
				CreateSmallDrawerHit(true);
				CreatePushBoxHit();
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
				SmallDrawerOpen = false;
				small_drawer.alpha = 0;
				push_box.alpha = 0;	
				SaveArray['SmallDrawer'] = "Closed";
				hit_drawer_small.graphics.clear();
				hit_pushbox.graphics.clear();
				CreateSmallDrawerHit(false);
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
			
		}
		
		private function LargeDrawerHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomComputerDesk;	
			}
			if(LargeDrawerOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
				LargeDrawerOpen = true;
				large_drawer.alpha = 1;
				SaveArray['LargeDrawer'] = "Open";
				hit_drawer_large.graphics.clear();
				CreateLargeDrawerHit(true);
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
				LargeDrawerOpen = false;
				large_drawer.alpha = 0;
				SaveArray['LargeDrawer'] = "Closed";
				hit_drawer_large.graphics.clear();
				CreateLargeDrawerHit(false);
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomComputerDesk',SaveArray);
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
			
			
			
			this.assets.removeTexture("rocketRoomComputerDesk_bg",true);
			this.assets.removeTexture("RocketRoomComputerDesk_Sprite_01",true);
			this.assets.removeTexture("RocketRoomComputerDesk_Sprite_02",true);			
			this.assets.removeTextureAtlas("RocketRoomComputerDesk_Sprite_01",true);
			this.assets.removeTextureAtlas("RocketRoomComputerDesk_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomComputerDesk_01");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomComputerDesk_02");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomComputerDesk_03");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomComputerDesk_04");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomComputerDesk_05");
			
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
