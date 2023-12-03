package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.DelayedCall;
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
	
	public class OfficeBugWire extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		public var SaveArray2:Array = new Array();
		
		private var bg:Image;
		
		private var dial_offset:int = 52;
		
		private var controller:Image;
		private var dial_green_sprite:Sprite;
		private var dial_blue_sprite:Sprite;
		private var dial_red_sprite:Sprite;
		private var dial_yellow_sprite:Sprite;
		
		private var dial_green:Image;
		private var dial_blue:Image;
		private var dial_red:Image;
		private var dial_yellow:Image;
		
		private var knub_green:Image;
		private var knub_blue:Image;
		private var knub_red:Image;
		private var knub_yellow:Image;
		
		private var hit_wires:Shape;
		private var hit_balls:Shape;
		private var hit_well:Shape;
				
		private var hit_dial_green:Shape;
		private var hit_dial_blue:Shape;
		private var hit_dial_red:Shape;
		private var hit_dial_yellow:Shape;
		
		private var ActiveDial:String = null;
		private var ControllerAttached:Boolean = false;
		private var SplatProgrammed:Boolean = false;
		private var SplatLeg00:String = null;
		private var SplatLeg01:String = null;
		private var SplatLeg02:String = null;
		private var SplatLeg03:String = null;
		
		private var greenWinPos:int = 0;
		private var blueWinPos:int = 0;
		private var redWinPos:int = 0;
		private var yellowWinPos:int = 0;
		
		private var Animating:Boolean = false;
		public var delayedCall:DelayedCall;
		private var spark_mc:MovieClip;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function OfficeBugWire(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('officeBugWire_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeBugWire/officeBugWire_bg.jpg'));
				game.TrackAssets('officeBugWire_01');
			}
			if(game.CheckAsset('officeBugWire_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeBugWire/OfficeBugWire_Sprite_01.png'));
				game.TrackAssets('officeBugWire_02');
			}
			if(game.CheckAsset('officeBugWire_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeBugWire/OfficeBugWire_Sprite_01.xml'));
				game.TrackAssets('officeBugWire_03');
			}
			if(game.CheckAsset('officeBugWire_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeBugWire/OfficeBugWire_Sprite_02.png'));
				game.TrackAssets('officeBugWire_04');
			}
			if(game.CheckAsset('officeBugWire_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeBugWire/OfficeBugWire_Sprite_02.xml'));
				game.TrackAssets('officeBugWire_05');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("OfficeBugWire","OfficeBugWireObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('officeBugWire_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			
			controller = new Image(this.assets.getTexture('controller_box'));
			controller.touchable = false;
			controller.x = 0;
			controller.y = 0;
			
			spark_mc = new MovieClip(this.assets.getTextures('sparks_'),9);
			//puller_mc.smoothing = TextureSmoothing.NONE;
			spark_mc.x = 220;
			spark_mc.y = 0;
			spark_mc.touchable = false;
			spark_mc.alpha = 0;
			spark_mc.stop;
			spark_mc.loop = true; // default: true
			
			CreateDials();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit != undefined){
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit['Controller'] == 'Attached'){
					ControllerAttached = true;
					controller.alpha = 1;
					
					dial_green_sprite.alpha = 1;
					dial_blue_sprite.alpha = 1;
					dial_red_sprite.alpha = 1;
					dial_yellow_sprite.alpha = 1;
				}else{
					controller.alpha = 0;
					dial_green_sprite.alpha = 0;
					dial_blue_sprite.alpha = 0;
					dial_red_sprite.alpha = 0;
					dial_yellow_sprite.alpha = 0;
				}
			}else{
				controller.alpha = 0;
				
				dial_green_sprite.alpha = 0;
				dial_blue_sprite.alpha = 0;
				dial_red_sprite.alpha = 0;
				dial_yellow_sprite.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire != undefined){
				trace("SMUUG 00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire['dial_green_y'] != undefined){
					trace("SMUUG 01");
					dial_green_sprite.y = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire['dial_green_y'];
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire['dial_blue_y'] != undefined){
					dial_blue_sprite.y = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire['dial_blue_y'];
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire['dial_red_y'] != undefined){
					dial_red_sprite.y = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire['dial_red_y'];
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire['dial_yellow_y'] != undefined){
					dial_yellow_sprite.y = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire['dial_yellow_y'];
				}
			
			}else{
				
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer != undefined){
				trace("heart Plug");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['SplatProgrammed'] == 'Yes'){
					trace("Butt Plug");
					SplatProgrammed = true;
					SplatLeg00 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['OutColor00'];
					SplatLeg01 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['OutColor01'];
					SplatLeg02 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['OutColor02'];
					SplatLeg03 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeSplatComputer['OutColor03'];
						
					
					
				}
			}
			this.addChildAt(controller,1);
			this.addChild(spark_mc);
			
			CreateWireHit();
			CreateBallsHit();
			CreateWellHit();
			
			Starling.juggler.add(spark_mc);
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
	
		private function CreateDials():void{
			/*
			private var dial_green_sprite:Sprite;
			private var dial_blue_sprite:Sprite;
			private var dial_red_sprite:Sprite;
			private var dial_yellow_sprite:Sprite;
			private var dial_green:Image;
			private var dial_blue:Image;
			private var dial_red:Image;
			private var dial_yellow:Image;
			*/
			
			dial_green_sprite = new Sprite();
			dial_green_sprite.touchable = false;
			dial_green_sprite.x = 10;
			dial_green_sprite.y = 97;

			dial_blue_sprite = new Sprite();
			dial_blue_sprite.touchable = false;
			dial_blue_sprite.x = 10+(52*1);
			dial_blue_sprite.y = 283;

			dial_red_sprite = new Sprite();
			dial_red_sprite.touchable = false;
			dial_red_sprite.x = 10+(52*2);
			dial_red_sprite.y = 204;

			dial_yellow_sprite = new Sprite();
			dial_yellow_sprite.touchable = false;
			dial_yellow_sprite.x = 10+(52*3);
			dial_yellow_sprite.y = 360;

			
			dial_green = new Image(this.assets.getTexture('dial_green'));
			dial_green.touchable = false;
			dial_green.x = 0;
			dial_green.y = 0;
			dial_green..alpha = 1;
			
			
			dial_blue = new Image(this.assets.getTexture('dial_blue'));
			dial_blue.touchable = false;
			dial_blue.x = 0;
			dial_blue.y = 0;
			dial_blue..alpha = 1;
			
			dial_red = new Image(this.assets.getTexture('dial_red'));
			dial_red.touchable = false;
			dial_red.x = 0;
			dial_red.y = 0;
			dial_red.alpha = 1;
			
			dial_yellow = new Image(this.assets.getTexture('dial_yellow'));
			dial_yellow.touchable = false;
			dial_yellow.x = 0;
			dial_yellow.y = 0;
			dial_yellow.alpha = 1;
			
			
			knub_green = new Image(this.assets.getTexture('knub'));
			knub_green.touchable = false;
			knub_green.x = 210;
			knub_green.y = 0;
			knub_green.alpha = 1;
			
			knub_blue = new Image(this.assets.getTexture('knub'));
			knub_blue.touchable = false;
			knub_blue.x = 210-(dial_offset*1);
			knub_blue.y = 0;
			knub_blue.alpha = 1;
			
			knub_red = new Image(this.assets.getTexture('knub'));
			knub_red.touchable = false;
			knub_red.x = 210-(dial_offset*2);
			knub_red.y = 0;
			knub_red.alpha = 1;
			
			knub_yellow = new Image(this.assets.getTexture('knub'));
			knub_yellow.touchable = false;
			knub_yellow.x = 210-(dial_offset*3);
			knub_yellow.y = 0;
			knub_yellow.alpha = 1;
			
			
			hit_dial_green = new Shape();
			hit_dial_green.touchable = false;
			hit_dial_green.graphics.beginFill(0xff0000);
			
			hit_dial_green.graphics.lineTo(0,0);			
			hit_dial_green.graphics.lineTo(50,0);			
			hit_dial_green.graphics.lineTo(50,50);			
			hit_dial_green.graphics.lineTo(0,50);			
			
			hit_dial_green.graphics.endFill(false);
			hit_dial_green.alpha = 0.0;
			
			hit_dial_green.graphics.precisionHitTest = true;	
			
			
			hit_dial_blue = new Shape();
			hit_dial_blue.touchable = false;
			hit_dial_blue.graphics.beginFill(0xff0000);
			
			hit_dial_blue.graphics.lineTo(0,0);			
			hit_dial_blue.graphics.lineTo(50,0);			
			hit_dial_blue.graphics.lineTo(50,50);			
			hit_dial_blue.graphics.lineTo(0,50);			
			
			hit_dial_blue.graphics.endFill(false);
			hit_dial_blue.alpha = 0.0;
			
			hit_dial_blue.graphics.precisionHitTest = true;	
			
			
			
			hit_dial_red = new Shape();
			hit_dial_red.touchable = false;
			hit_dial_red.graphics.beginFill(0xff0000);
			
			hit_dial_red.graphics.lineTo(0,0);			
			hit_dial_red.graphics.lineTo(50,0);			
			hit_dial_red.graphics.lineTo(50,50);			
			hit_dial_red.graphics.lineTo(0,50);			
			
			
			hit_dial_red.graphics.endFill(false);
			hit_dial_red.alpha = 0.0;
			
			hit_dial_red.graphics.precisionHitTest = true;	
			
			
			hit_dial_yellow = new Shape();
			hit_dial_yellow.touchable = false;
			hit_dial_yellow.graphics.beginFill(0xff0000);
			
			hit_dial_yellow.graphics.lineTo(0,0);			
			hit_dial_yellow.graphics.lineTo(50,0);			
			hit_dial_yellow.graphics.lineTo(50,50);			
			hit_dial_yellow.graphics.lineTo(0,50);			
			
			hit_dial_yellow.graphics.endFill(false);
			hit_dial_yellow.alpha = 0.0;
			
			hit_dial_yellow.graphics.precisionHitTest = true;	
						
			
			dial_green_sprite.addChild(dial_green);
			dial_blue_sprite.addChild(dial_blue);
			dial_red_sprite.addChild(dial_red);
			dial_yellow_sprite.addChild(dial_yellow);
			
			dial_green_sprite.addChild(knub_green);
			dial_blue_sprite.addChild(knub_blue);
			dial_red_sprite.addChild(knub_red);
			dial_yellow_sprite.addChild(knub_yellow);

			
			
			dial_green_sprite.addChild(hit_dial_green);
			dial_blue_sprite.addChild(hit_dial_blue);
			dial_red_sprite.addChild(hit_dial_red);
			dial_yellow_sprite.addChild(hit_dial_yellow);
			
		
			dial_green_sprite.alpha = 1;
			dial_blue_sprite.alpha = 1;
			dial_red_sprite.alpha = 1;
			dial_yellow_sprite.alpha = 1;
			
			
			this.addChild(dial_green_sprite);
			this.addChild(dial_blue_sprite);
			this.addChild(dial_red_sprite);
			this.addChild(dial_yellow_sprite);
			
			
		}
		/*
		
		private var hit_wires:Shape;
		private var hit_balls:Shape;
		private var hit_well:Shape;
		*/
		private function CreateWellHit():void{
			hit_well = new Shape();
			hit_well.touchable = false;
			hit_well.graphics.beginFill(0xff0000);
			
			hit_well.graphics.lineTo(0,36);	
			hit_well.graphics.lineTo(201,17);	
			hit_well.graphics.lineTo(191,448);	
			hit_well.graphics.lineTo(0,397);	
		
			hit_well.graphics.endFill(false);
			hit_well.alpha = 0.0;
			
			hit_well.graphics.precisionHitTest = true;	
			this.addChild(hit_well);
		}
		
		private function CreateBallsHit():void{
			hit_balls = new Shape();
			hit_balls.touchable = false;
			hit_balls.graphics.beginFill(0xff0000);
			
			hit_balls.graphics.lineTo(657,86);	
			hit_balls.graphics.lineTo(684,30);	
			hit_balls.graphics.lineTo(795,108);	
			hit_balls.graphics.lineTo(797,312);	
			hit_balls.graphics.lineTo(754,389);	
			hit_balls.graphics.lineTo(673,408);	
			hit_balls.graphics.lineTo(650,352);	
			hit_balls.graphics.lineTo(690,273);	
			hit_balls.graphics.lineTo(697,164);	
		
			hit_balls.graphics.endFill(false);
			hit_balls.alpha = 0.0;
			
			hit_balls.graphics.precisionHitTest = true;	
			this.addChild(hit_balls);
		}
		
		private function CreateWireHit():void{
			hit_wires = new Shape();
			hit_wires.touchable = false;
			hit_wires.graphics.beginFill(0xff0000);
			
			hit_wires.graphics.lineTo(306,3);	
			hit_wires.graphics.lineTo(599,8);	
			hit_wires.graphics.lineTo(595,444);	
			hit_wires.graphics.lineTo(304,412);	
			
			hit_wires.graphics.endFill(false);
			hit_wires.alpha = 0.0;
			
			hit_wires.graphics.precisionHitTest = true;	
			this.addChild(hit_wires);
		}
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.BEGAN) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(ControllerAttached === false){
							
						}else{
							if(hit_dial_green.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ActiveDial = 'green';
							}else if(hit_dial_blue.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ActiveDial = 'blue';
							}else if(hit_dial_red.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ActiveDial = 'red';
							}else if(hit_dial_yellow.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								ActiveDial = 'yellow';
							}else{
								Solve();
							}
						}
						
					}else if (touches[0].phase == TouchPhase.MOVED) {
						if(ControllerAttached === false){
							
						}else{
							if(ActiveDial == null){
								
							}else{
								if(ActiveDial == 'green'){
									WireHandler('green');
								}else if(ActiveDial == 'blue'){
									WireHandler('blue');
								}else if(ActiveDial == 'red'){
									WireHandler('red');
								}else if(ActiveDial == 'yellow'){
									WireHandler('yellow');
								}
							}
						}
					}else if (touches[0].phase == TouchPhase.ENDED) {
					
						if(targ == goback.SourceImage){
						
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((OfficeCircuit as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeCircuitObj,true
							);
					//		ActiveDial = null;
							return;
						}
						if(ActiveDial == null){
							if(hit_wires.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The wires have been twisted into a tangled and confused mess.");
								
								return;
							}else if(hit_balls.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are four round contact nodes with protruding wires. Each has a two letter identifier stamped on them...");
								
								return;
							}else if(hit_well.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								WellHandler();
								
								return;
							}
							
						}else{
						
							WireUpHandler();
							
							return;
						}
							
						
					}
				}
			}
		}
		
		private function WellHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Controller)
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit != undefined){
					SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeCircuit;
				}
				
				SaveArray2['Controller'] = 'Attached';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeCircuit',SaveArray2);
				
				controller.alpha = 1;
				dial_green_sprite.alpha = 1;
				dial_blue_sprite.alpha = 1;
				dial_red_sprite.alpha = 1;
				dial_yellow_sprite.alpha = 1;
				
				ControllerAttached = true;
				Animating = false;
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_Controller,
						"item_Controller"
					);
			}else{
				if(ControllerAttached === false){
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a recessed well in the abdomen of the spider.");
				}else{
					
				}
			}
		}
		
		private function WireUpHandler():void{
			if(ActiveDial == null){
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("RotaryClicks");
				(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("Spark");
				spark_mc.stop();
				spark_mc.alpha = 0;
				
				trace("1");
				trace("WIRE UP HANDLER");
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire;
				}
				
				if(this[("dial_"+ActiveDial+"_sprite")].y < 100-37){
					trace("8");
					if(this[("dial_"+ActiveDial+"_sprite")].y > 80-37){
						
						this[("dial_"+ActiveDial+"_sprite")].y = 90-37;
						trace("9");
						SaveArray['dial_'+ActiveDial+'_y'] = this[("dial_"+ActiveDial+"_sprite")].y;				
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeBugWire',SaveArray);
						Solve();
						
					}else{
						SaveArray['dial_'+ActiveDial+'_y'] = this[("dial_"+ActiveDial+"_sprite")].y;				
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeBugWire',SaveArray);
						
						Solve();
					}
				}
				else if(this[("dial_"+ActiveDial+"_sprite")].y < 198-37){
					trace("6");
					if(this[("dial_"+ActiveDial+"_sprite")].y> 178-37){
						
						this[("dial_"+ActiveDial+"_sprite")].y = 188-37;
						trace("7");
						SaveArray['dial_'+ActiveDial+'_y'] = this[("dial_"+ActiveDial+"_sprite")].y;				
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeBugWire',SaveArray);
						
						Solve();
					}else{
						SaveArray['dial_'+ActiveDial+'_y'] = this[("dial_"+ActiveDial+"_sprite")].y;				
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeBugWire',SaveArray);
						
						Solve();
					}
					
				}
				else if(this[("dial_"+ActiveDial+"_sprite")].y < 298-37){
					trace("4");
					if(this[("dial_"+ActiveDial+"_sprite")].y > 278-37){
						this[("dial_"+ActiveDial+"_sprite")].y = 288-37;
						trace("5");
						SaveArray['dial_'+ActiveDial+'_y'] = this[("dial_"+ActiveDial+"_sprite")].y;				
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeBugWire',SaveArray);
						
						Solve();
					}else{
						SaveArray['dial_'+ActiveDial+'_y'] = this[("dial_"+ActiveDial+"_sprite")].y;				
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeBugWire',SaveArray);
						
						Solve();
					}
					
				}
					
				else if(this[("dial_"+ActiveDial+"_sprite")].y < 390-37){
					trace("2");
					if(this[("dial_"+ActiveDial+"_sprite")].y > 370-37){
						this[("dial_"+ActiveDial+"_sprite")].y = 380-37;
						trace("3");
						
						SaveArray['dial_'+ActiveDial+'_y'] = this[("dial_"+ActiveDial+"_sprite")].y;				
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeBugWire',SaveArray);
						
						Solve();
					}else{
						
						SaveArray['dial_'+ActiveDial+'_y'] = this[("dial_"+ActiveDial+"_sprite")].y;
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeBugWire',SaveArray);
						
						Solve();
					}
					
				}
				ActiveDial = null;
				
			}
			
			
		}
		
		private function WireHandler(dial:String):void{
			if(touches[0].globalY < 390 &&  touches[0].globalY > 50){
				if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('RotaryClicks') === true){
					
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RotaryClicks();
				}
				
				
				this[("dial_"+dial+"_sprite")].y = 	touches[0].globalY-25;
				
				if(this[("dial_"+dial+"_sprite")].y < 100-37){
					if(this[("dial_"+dial+"_sprite")].y > 80-37){
						if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('Spark') === true){
							
						}else{
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Spark();
						}
						spark_mc.y = 48;
						
						spark_mc.alpha = 1;
						spark_mc.play();
						
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("Spark");
						spark_mc.alpha = 0;
						spark_mc.stop();
					}
				}else if(this[("dial_"+dial+"_sprite")].y < 198-37){
					if(this[("dial_"+dial+"_sprite")].y > 178-37){
						if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('Spark') === true){
							
						}else{
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Spark();
						}
						spark_mc.y = 146;
						
						spark_mc.alpha = 1;
						spark_mc.play();
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("Spark");
						spark_mc.alpha = 0;
						spark_mc.stop();
					}
				}else if(this[("dial_"+dial+"_sprite")].y < 298-37){
					if(this[("dial_"+dial+"_sprite")].y > 278-37){
						if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('Spark') === true){
							
						}else{
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Spark();
						}
						spark_mc.y = 245;
						
						spark_mc.alpha = 1;
						spark_mc.play();
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("Spark");
						spark_mc.alpha = 0;
						spark_mc.stop();
					}
				}
				else if(this[("dial_"+dial+"_sprite")].y < 390-37){
					if(this[("dial_"+dial+"_sprite")].y > 370-37){
						if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('Spark') === true){
							
						}else{
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Spark();
						}
						
						spark_mc.y = 337;
						
						spark_mc.alpha = 1;
						spark_mc.play();
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("Spark");
						spark_mc.alpha = 0;
						spark_mc.stop();
					}
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("Spark");
					
					spark_mc.alpha = 0;
					spark_mc.stop();
				}
				
			}
		}
		
		private function Solve():void{
			trace('SplatLeg00 : '+SplatLeg00);
			trace('SplatLeg01 : '+SplatLeg01);
			trace('SplatLeg02 : '+SplatLeg02);
			trace('SplatLeg03 : '+SplatLeg03);
			
			trace('dial_green_sprite.y : '+dial_green_sprite.y);			
			trace('dial_blue_sprite.y : '+dial_blue_sprite.y);
			trace('dial_red_sprite.y : '+dial_red_sprite.y);
			trace('dial_yellow_sprite.y : '+dial_yellow_sprite.y);
			
			trace('-');	
			trace('-');	
			trace('-');	
			
			
			if(SplatProgrammed === true){
				if(SplatLeg00 == 'green'){				
					greenWinPos = 343;
				}else if(SplatLeg00 == 'blue'){
					blueWinPos = 343;
				}else if(SplatLeg00 == 'red'){
					redWinPos = 343;
				}else if(SplatLeg00 == 'yellow'){
					yellowWinPos = 343;
				}
				
				if(SplatLeg01 == 'green'){				
					greenWinPos = 151;
				}else if(SplatLeg01 == 'blue'){
					blueWinPos = 151;
				}else if(SplatLeg01 == 'red'){
					redWinPos = 151;
				}else if(SplatLeg01 == 'yellow'){
					yellowWinPos = 151;
				}
				
				if(SplatLeg02 == 'green'){				
					greenWinPos = 251;
				}else if(SplatLeg02 == 'blue'){
					blueWinPos = 251;
				}else if(SplatLeg02 == 'red'){
					redWinPos = 251;
				}else if(SplatLeg02 == 'yellow'){
					yellowWinPos = 251;
				}
				
				
				if(SplatLeg03 == 'green'){				
					greenWinPos = 53;
				}else if(SplatLeg03 == 'blue'){
					blueWinPos = 53;
				}else if(SplatLeg03 == 'red'){
					redWinPos = 53;
				}else if(SplatLeg03 == 'yellow'){
					yellowWinPos = 53;
				}
				
				trace('greenWinPos : '+greenWinPos);
				trace('blueWinPos : '+blueWinPos);
				trace('redWinPos : '+redWinPos);
				trace('yellowWinPos : '+yellowWinPos);
				
				if(dial_green_sprite.y >= (greenWinPos-10)){
					if(dial_green_sprite.y <= (greenWinPos+10)){
						if(dial_blue_sprite.y >= (blueWinPos-10)){
							if(dial_blue_sprite.y <= (blueWinPos+10)){
								if(dial_red_sprite.y >= (redWinPos-10)){
									if(dial_red_sprite.y <= (redWinPos+10)){
										if(dial_yellow_sprite.y >= (yellowWinPos-10)){
											if(dial_yellow_sprite.y <= (yellowWinPos+10)){
												RunSolve();
											}
										}
									}
								}
							}
						}
					}
				}
	
			}
			
		
		
		}
		
		private function RunSolve():void{
			Animating = true;
			trace("RUNNING SOLVE");
			trace("RUNNING SOLVE");
			trace("RUNNING SOLVE");
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeBugWire;
			}
			SaveArray['Solved'] = 'Yes';				
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeBugWire',SaveArray);
			
			delayedCall = new DelayedCall(function():void{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SparksThree();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
				FadeOut((OfficeCircuit as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeCircuitObj,true
				);
			},2);
			Starling.juggler.add(delayedCall);	
			
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
			
			
			
			this.assets.removeTexture("officeBugWire_bg",true);
			this.assets.removeTexture("OfficeBugWire_Sprite_01",true);
			this.assets.removeTextureAtlas("OfficeBugWire_Sprite_01",true);
			this.assets.removeTexture("OfficeBugWire_Sprite_02",true);
			this.assets.removeTextureAtlas("OfficeBugWire_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("officeBugWire_01");
			(stage.getChildAt(0) as Object).falseAsset("officeBugWire_02");
			(stage.getChildAt(0) as Object).falseAsset("officeBugWire_03");
			(stage.getChildAt(0) as Object).falseAsset("officeBugWire_04");
			(stage.getChildAt(0) as Object).falseAsset("officeBugWire_05");
			
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
