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
	import starling.utils.deg2rad;
	import starling.textures.TextureSmoothing;
	
	public class DirLock extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var dial:MovieClip;
		private var dial_off:Image;
		private var light_pos_00:Image;
		private var light_pos_01:Image;
		private var light_pos_02:Image;
		private var light_pos_03:Image;
		private var light_pos_04:Image;
		private var light_pos_05:Image;
		
		private var lock_open:Image;
		
		private var hit_dial:Shape;
		private var hit_center:Shape;
		
		private var hit_chains_00:Shape;
		private var hit_chains_01:Shape;
		private var hit_centerChains:Shape;
		
		private var hit_screen:Shape;
		
		private var RONum:int = 0;
		
		private var DialActive:Boolean = false;
		private var LightPos:int = 0;
		private var LightActive:Boolean = true;
		private var delayedCall:DelayedCall;
		//	private var hit_elevator_door:Shape;
		private var MousePrevAngle:Number;
		private var MouseCurrentAngle:Number;
		
		private var KnobAttached:Boolean = false;
		private var Animating:Boolean = false;
		
		private var DialCurrentFrame:String = null;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function DirLock(_assets:AssetManager,_game:Game)
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
		//	if(game.CheckAsset('dirLock_01') === false){
		//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DirLock/dirLock_bg.png'));
		//		game.TrackAssets('dirLock_01');
		//	}
			if(game.CheckAsset('dirLock_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DirLock/DirLock_Sprite_01.jpg'));
				game.TrackAssets('dirLock_01');
			}
			if(game.CheckAsset('dirLock_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DirLock/DirLock_Sprite_01.xml'));
				game.TrackAssets('dirLock_02');
			}
			if(game.CheckAsset('dirLock_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DirLock/DirLock_Sprite_02.png'));
				game.TrackAssets('dirLock_03');
			}
			if(game.CheckAsset('dirLock_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DirLock/DirLock_Sprite_02.xml'));
				game.TrackAssets('dirLock_04');
			}
			if(game.CheckAsset('dirLock_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DirLock/DirLock_Sprite_03.png'));
				game.TrackAssets('dirLock_05');
			}
			if(game.CheckAsset('dirLock_06') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DirLock/DirLock_Sprite_03.xml'));
				game.TrackAssets('dirLock_06');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("DirLock","DirLockObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('dirLock_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			//	CreateElevatorDoorHit();
			dial_off = new Image(this.assets.getTexture('dial_off'));
			dial_off.touchable = false;
			dial_off.x = 296;
			dial_off.y = 215;
			
			
			dial = new MovieClip(this.assets.getTextures('dial_pos_'),6);
			dial.touchable = false;
			//puller_mc.smoothing = TextureSmoothing.NONE;
			dial.x = 296;
			dial.y = 215;
			dial.touchable = false;
			dial.loop = true; // default: trueh
			dial.alpha = 0;
			dial.stop();
			//Starling.juggler.add(dial);
			
			
			light_pos_00 = new Image(this.assets.getTexture('light_blue'));
			light_pos_00.touchable = false;
			light_pos_00.x = 304;
			light_pos_00.y = 153; 
			
			light_pos_01 = new Image(this.assets.getTexture('light_blue'));
			light_pos_01.touchable = false;
			light_pos_01.x = 339;
			light_pos_01.y = 138; 
			
			light_pos_02 = new Image(this.assets.getTexture('light_blue'));
			light_pos_02.touchable = false;
			light_pos_02.x = 378;
			light_pos_02.y = 130; 
			
			light_pos_03 = new Image(this.assets.getTexture('light_blue'));
			light_pos_03.touchable = false;
			light_pos_03.x = 420;
			light_pos_03.y = 131; 
			
			light_pos_04 = new Image(this.assets.getTexture('light_blue'));
			light_pos_04.touchable = false;
			light_pos_04.x = 458;
			light_pos_04.y = 140; 
			
			light_pos_05 = new Image(this.assets.getTexture('light_blue'));
			light_pos_05.touchable = false;
			light_pos_05.x = 492;
			light_pos_05.y = 156; 
			
			lock_open = new Image(this.assets.getTexture('lock_open'));
			lock_open.smoothing = TextureSmoothing.NONE;
			lock_open.touchable = false;
			lock_open.x = 119;
			lock_open.y = 0; 
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['KnobAttached'] == 'Yes'){
					KnobAttached = true;
					dial_off.alpha = 1;
				}else{
					dial_off.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['Solved'] == 'Yes'){
					
				}else{
					lock_open.alpha = 0; 
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['LightPos'] == undefined){
						
					}else{
						LightPos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['LightPos'];
						trace("LIGHTPOS: "+LightPos);
					}
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_00'] == undefined){
						light_pos_00.alpha = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_00'] == 'empty'){
						light_pos_00.alpha = 0;
					}else{
						light_pos_00.texture = this.assets.getTexture('light_'+(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_00']);
						light_pos_00.alpha = 1;
					}
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_01'] == undefined){
						light_pos_01.alpha = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_01'] == 'empty'){
						light_pos_01.alpha = 0;
					}else{
						light_pos_01.texture = this.assets.getTexture('light_'+(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_01']);
						light_pos_01.alpha = 1;
					}
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_02'] == undefined){
						light_pos_02.alpha = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_02'] == 'empty'){
						light_pos_02.alpha = 0;
					}else{
						light_pos_02.texture =this.assets.getTexture('light_'+(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_02']);
						light_pos_02.alpha = 1;
					}
						
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_03'] == undefined){
						light_pos_03.alpha = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_03'] == 'empty'){
						light_pos_03.alpha = 0;
					}else{
						light_pos_03.texture = this.assets.getTexture('light_'+(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_03']);
						light_pos_03.alpha = 1;
					}
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_04'] == undefined){
						light_pos_04.alpha = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_04'] == 'empty'){
						light_pos_04.alpha = 0;
					}else{
						light_pos_04.texture =this.assets.getTexture('light_'+(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_04']);
						light_pos_04.alpha = 1;
					}
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_05'] == undefined){
						light_pos_05.alpha = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_05'] == 'empty'){
						light_pos_05.alpha = 0;
					}else{
						light_pos_05.texture = this.assets.getTexture('light_'+(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_05']);
						light_pos_05.alpha = 1;
					}
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['SeenIn'] == 'Yes'){
							
					}else{
						SaveArray = SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock;
						SaveArray['SeenIt'] = "Yes";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DirLock',SaveArray);
					}
				}
			}else{
				light_pos_00.alpha = 0;
				light_pos_01.alpha = 0;
				light_pos_02.alpha = 0;
				light_pos_03.alpha = 0;
				light_pos_04.alpha = 0;
				light_pos_05.alpha = 0;
				lock_open.alpha = 0; 
				dial_off.alpha = 0;
				
				SaveArray['SeenIt'] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DirLock',SaveArray);
			}
			
	
			
			this.addChildAt(dial_off,1);
			this.addChildAt(dial,2);
			this.addChildAt(light_pos_05,3);
			this.addChildAt(light_pos_04,4);
			this.addChildAt(light_pos_03,5);
			this.addChildAt(light_pos_02,6);
			this.addChildAt(light_pos_01,7);
			this.addChildAt(light_pos_00,8);
			this.addChildAt(lock_open,9);
			
			CreateChain00Hit();
			CreateChain01Hit();
			CreateCenterChainsHit();
			CreateScreenHit();
			
			CreateDialHit();
			CreateCenterHit();
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		/*
		
		private var hit_chains_00:Shape;
		private var hit_centerChains:Shape;
		hit_screen
		*/
		private function CreateScreenHit():void{
			hit_screen = new Shape();
			hit_screen.touchable = false;
			hit_screen.graphics.beginFill(0x0000ff);
			
			hit_screen.graphics.lineTo(275,153);	
			hit_screen.graphics.lineTo(365,110);	
			hit_screen.graphics.lineTo(436,113);	
			hit_screen.graphics.lineTo(531,156);	
			hit_screen.graphics.lineTo(516,193);	
			hit_screen.graphics.lineTo(445,154);	
			hit_screen.graphics.lineTo(363,151);	
			hit_screen.graphics.lineTo(293,184);	
			
			hit_screen.graphics.endFill(false);
			hit_screen.alpha = 0.0;
			
			hit_screen.graphics.precisionHitTest = true;	
			this.addChild(hit_screen);
		}
		
		
		private function CreateCenterChainsHit():void{
			hit_centerChains = new Shape();
			hit_centerChains.touchable = false;
			hit_centerChains.graphics.beginFill(0x0000ff);
			
			hit_centerChains.graphics.lineTo(261,0);	
			hit_centerChains.graphics.lineTo(541,0);	
			hit_centerChains.graphics.lineTo(541,87);	
			hit_centerChains.graphics.lineTo(274,87);	
		
			hit_centerChains.graphics.endFill(false);
			hit_centerChains.alpha = 0.0;
			
			hit_centerChains.graphics.precisionHitTest = true;	
			this.addChild(hit_centerChains);
		}
		
		
		private function CreateChain01Hit():void{
			hit_chains_01 = new Shape();
			hit_chains_01.touchable = false;
			hit_chains_01.graphics.beginFill(0x0000ff);
			
			hit_chains_01.graphics.lineTo(560,0);	
			hit_chains_01.graphics.lineTo(687,0);	
			hit_chains_01.graphics.lineTo(800,114);	
			hit_chains_01.graphics.lineTo(800,178);	
			hit_chains_01.graphics.lineTo(665,407);	
			hit_chains_01.graphics.lineTo(589,394);	
		
			hit_chains_01.graphics.endFill(false);
			hit_chains_01.alpha = 0.0;
			
			hit_chains_01.graphics.precisionHitTest = true;	
			this.addChild(hit_chains_01);
		}
		
		private function CreateChain00Hit():void{
			hit_chains_00 = new Shape();
			hit_chains_00.touchable = false;
			hit_chains_00.graphics.beginFill(0x0000ff);
			
			hit_chains_00.graphics.lineTo(0,86);	
			hit_chains_00.graphics.lineTo(70,0);	
			hit_chains_00.graphics.lineTo(208,0);	
			hit_chains_00.graphics.lineTo(248,130);	
			hit_chains_00.graphics.lineTo(213,284);	
			hit_chains_00.graphics.lineTo(215,362);	
			hit_chains_00.graphics.lineTo(239,426);	
			hit_chains_00.graphics.lineTo(239,503);	
			hit_chains_00.graphics.lineTo(136,505);	
			hit_chains_00.graphics.lineTo(83,213);	
			hit_chains_00.graphics.lineTo(0,201);	
			
			hit_chains_00.graphics.endFill(false);
			hit_chains_00.alpha = 0.0;
			
			hit_chains_00.graphics.precisionHitTest = true;	
			this.addChild(hit_chains_00);
		}
		
		private function CreateCenterHit():void{
			hit_center = new Shape();
			hit_center.touchable = false;
			hit_center.graphics.beginFill(0x0000ff);
			
			hit_center.graphics.lineTo(340,319);	
			hit_center.graphics.lineTo(353,284);	
			hit_center.graphics.lineTo(375,268);	
			hit_center.graphics.lineTo(398,264);	
			hit_center.graphics.lineTo(427,269);	
			hit_center.graphics.lineTo(428,269);	
			hit_center.graphics.lineTo(450,287);	
			hit_center.graphics.lineTo(456,314);	
			hit_center.graphics.lineTo(449,348);	
			hit_center.graphics.lineTo(422,372);	
			hit_center.graphics.lineTo(400,373);	
			hit_center.graphics.lineTo(372,361);	
			hit_center.graphics.lineTo(355,338);	
			
			hit_center.graphics.endFill(false);
			hit_center.alpha = 0.0;
			
			hit_center.graphics.precisionHitTest = true;	
			this.addChild(hit_center);
		}
		
		
		private function CreateDialHit():void{
			hit_dial = new Shape();
			hit_dial.touchable = false;
			hit_dial.graphics.beginFill(0xff0000);
			
			hit_dial.graphics.lineTo(231,324);	
			hit_dial.graphics.lineTo(255,235);	
			hit_dial.graphics.lineTo(311,178);	
			hit_dial.graphics.lineTo(402,152);	
			hit_dial.graphics.lineTo(486,177);	
			hit_dial.graphics.lineTo(533,217);	
			hit_dial.graphics.lineTo(568,312);	
			hit_dial.graphics.lineTo(545,407);	
			hit_dial.graphics.lineTo(499,458);	
			hit_dial.graphics.lineTo(403,492);	
			hit_dial.graphics.lineTo(312,467);	
			hit_dial.graphics.lineTo(253,408);	
			
			hit_dial.graphics.endFill(false);
			hit_dial.alpha = 0.0;
			
			hit_dial.graphics.precisionHitTest = true;	
			this.addChild(hit_dial);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.BEGAN) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(KnobAttached === true){
							if(hit_dial.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								DialActive = true;
				
							}else{
								DialActive = false;
							}
						}
					}
					else if (touches[0].phase == TouchPhase.MOVED) {
						if(KnobAttached === true){
							if(hit_center.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
								LightActive = true;
								dial_off.alpha = 1;
								dial.alpha = 0;
							}else if(DialActive === true){
								
								trace('Moved');
								DialHandler();
							}
						}
					}
					
					else if (touches[0].phase == TouchPhase.ENDED) {
						trace('BARK');
						//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ChainRattle();
						DialCurrentFrame = null;
						if(KnobAttached === true){
							trace(touches[0].globalX+" ,"+touches[0].globalY);
							
							LightActive = true;
							dial_off.alpha = 1;
							dial.alpha = 0;
							
							if(targ == goback.SourceImage){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((SecondFloorHall as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.SecondFloorHallObj,true
								);
								
							}else if(hit_chains_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								trace('BARK 00');
								if(DialActive === false){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ChainRattle();
									ChainsHandler();
									return;
								}
							}else if(hit_chains_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(DialActive === false){
									trace('BARK 11');
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ChainRattle();
									ChainsHandler();
									//return;
								}
								
							}else if(hit_centerChains.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(DialActive === false){
									
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ChainRattle();
									ChainsHandler();
									//return;
								}
							}else if(hit_screen.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(DialActive === false){
									if(LightPos > 0 ){
										(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The small screen displays colored dots.");
										return;
									}else{
										(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There's a small screen on top of the lock.");
										return;
									}
								}
							}
							DialActive = false;
						}else{
							if(targ == goback.SourceImage){
								
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((SecondFloorHall as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.SecondFloorHallObj,true
								);
							}else if(hit_center.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								KnobHandler();
								
							
							}else if(hit_dial.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The face of the lock has four arrows pointing in different directions.");
								
							}else if(hit_chains_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								trace('BARK 00');
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ChainRattle();
								ChainsHandler();
								return;
							}else if(hit_chains_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								trace('BARK 11');
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ChainRattle();
								ChainsHandler();
								return;
							}else if(hit_centerChains.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								trace('BARK 22');
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ChainRattle();
								CenterChainsHandler();
								return;
							}else if(hit_screen.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(LightPos > 0 ){
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The small screen displays colored dots.");
									return;
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There's a small screen on top of the lock.");
									return;
								}
							}
						}
						
						
					}
				}
			}
		}
		private function CenterChainsHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The ends of the chain are looped through the lock...");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The lock is made of some sort of reinforced metal.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The lock is made of some sort of reinforced metal.");	
			}
		}
		private function ChainsHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The mess of chains binds the door shut.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The lock keeps the chains in place.");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'll have to open the lock if I want to remove the chains.");
			}
		}
		
		private function KnobHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Knob)
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsThree();
				KnobAttached = true;
				dial_off.alpha = 1;
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock;
				}
				
				SaveArray['KnobAttached'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DirLock',SaveArray);
			
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_Knob,
						"item_Knob"
					);
				
			}else{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There's a hole in the center.");
				
			}
			
			
		}
		
		private function DialHandler():void{
			
			
			MouseCurrentAngle = (
				((Math.atan2(touches[0].globalY-321, touches[0].globalX-400))
					*180
				)/ Math.PI
			)+180;
			
			if(MouseCurrentAngle >= 345 || MouseCurrentAngle < 15){
				if(DialCurrentFrame != '9'){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InputTiny();
					
					dial.currentFrame = 9;
					trace("BARK BARK");
					if(LightActive === true){
						LightPosHandler(3);
					}
				}
				
			}else if(MouseCurrentAngle >= 15 && MouseCurrentAngle < 45){
				if(DialCurrentFrame != '10'){
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
					trace('F: 10');
					dial.currentFrame = 10;
					LightActive = true;
					
					if(LightPos == 6){
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
						LightPos = 0;
						
						light_pos_00.alpha = 0;
						light_pos_01.alpha = 0;
						light_pos_02.alpha = 0;
						light_pos_03.alpha = 0;
						light_pos_04.alpha = 0;
						light_pos_05.alpha = 0;
						
						SaveArray['pos_00'] = 'empty';
						SaveArray['pos_01'] = 'empty';
						SaveArray['pos_02'] = 'empty';
						SaveArray['pos_03'] = 'empty';
						SaveArray['pos_04'] = 'empty';
						SaveArray['pos_05'] = 'empty';
						
						LightActive = false;
					}
					
				}
			}else if(MouseCurrentAngle >= 45 && MouseCurrentAngle < 75){
				if(DialCurrentFrame != '11'){
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
					trace('F: 11');
					dial.currentFrame = 11;
					LightActive = true;
					
					if(LightPos == 6){
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
						LightPos = 0;
						
						light_pos_00.alpha = 0;
						light_pos_01.alpha = 0;
						light_pos_02.alpha = 0;
						light_pos_03.alpha = 0;
						light_pos_04.alpha = 0;
						light_pos_05.alpha = 0;
						
						SaveArray['pos_00'] = 'empty';
						SaveArray['pos_01'] = 'empty';
						SaveArray['pos_02'] = 'empty';
						SaveArray['pos_03'] = 'empty';
						SaveArray['pos_04'] = 'empty';
						SaveArray['pos_05'] = 'empty';
						
						LightActive = false;
					}
					
				}
			}else if(MouseCurrentAngle >= 75 && MouseCurrentAngle < 105){
				if(DialCurrentFrame != '0'){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InputTiny();
					trace('F: 00');
					dial.currentFrame = 0;
					if(LightActive === true){
						LightPosHandler(0);
					}
					
					
				}
			}else if(MouseCurrentAngle >= 105 && MouseCurrentAngle < 135){
				if(DialCurrentFrame != '1'){
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
					trace('F: 01');
					dial.currentFrame = 1;
					LightActive = true;
					
					if(LightPos == 6){
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
						LightPos = 0;
						
						light_pos_00.alpha = 0;
						light_pos_01.alpha = 0;
						light_pos_02.alpha = 0;
						light_pos_03.alpha = 0;
						light_pos_04.alpha = 0;
						light_pos_05.alpha = 0;
						
						SaveArray['pos_00'] = 'empty';
						SaveArray['pos_01'] = 'empty';
						SaveArray['pos_02'] = 'empty';
						SaveArray['pos_03'] = 'empty';
						SaveArray['pos_04'] = 'empty';
						SaveArray['pos_05'] = 'empty';
						
						LightActive = false;
					}
					
				}
			}else if(MouseCurrentAngle >= 135 && MouseCurrentAngle < 165){
				if(DialCurrentFrame != '2'){
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
					trace('F: 02');
					dial.currentFrame = 2;
					LightActive = true;
					
					if(LightPos == 6){
						//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
						LightPos = 0;
						
						light_pos_00.alpha = 0;
						light_pos_01.alpha = 0;
						light_pos_02.alpha = 0;
						light_pos_03.alpha = 0;
						light_pos_04.alpha = 0;
						light_pos_05.alpha = 0;
						
						SaveArray['pos_00'] = 'empty';
						SaveArray['pos_01'] = 'empty';
						SaveArray['pos_02'] = 'empty';
						SaveArray['pos_03'] = 'empty';
						SaveArray['pos_04'] = 'empty';
						SaveArray['pos_05'] = 'empty';
						
						LightActive = false;
					}
					
				}
			}else if(MouseCurrentAngle >= 165 && MouseCurrentAngle < 195){
				if(DialCurrentFrame != '3'){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InputTiny();
					trace('F: 03');
					dial.currentFrame = 3;
					if(LightActive === true){
						LightPosHandler(1);
					}
				}
			}else if(MouseCurrentAngle >= 195 && MouseCurrentAngle < 225){
				if(DialCurrentFrame != '4'){
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
					trace('F: 04');
					dial.currentFrame = 4;
					LightActive = true;
					
					if(LightPos == 6){
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
						LightPos = 0;
						
						light_pos_00.alpha = 0;
						light_pos_01.alpha = 0;
						light_pos_02.alpha = 0;
						light_pos_03.alpha = 0;
						light_pos_04.alpha = 0;
						light_pos_05.alpha = 0;
						
						SaveArray['pos_00'] = 'empty';
						SaveArray['pos_01'] = 'empty';
						SaveArray['pos_02'] = 'empty';
						SaveArray['pos_03'] = 'empty';
						SaveArray['pos_04'] = 'empty';
						SaveArray['pos_05'] = 'empty';
						
						LightActive = false;
					}
				}
			}else if(MouseCurrentAngle >= 225 && MouseCurrentAngle < 255){
				if(DialCurrentFrame != '5'){
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
					trace('F: 05');
					dial.currentFrame = 5;
					LightActive = true;
					
					if(LightPos == 6){
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
						LightPos = 0;
						
						light_pos_00.alpha = 0;
						light_pos_01.alpha = 0;
						light_pos_02.alpha = 0;
						light_pos_03.alpha = 0;
						light_pos_04.alpha = 0;
						light_pos_05.alpha = 0;
						
						SaveArray['pos_00'] = 'empty';
						SaveArray['pos_01'] = 'empty';
						SaveArray['pos_02'] = 'empty';
						SaveArray['pos_03'] = 'empty';
						SaveArray['pos_04'] = 'empty';
						SaveArray['pos_05'] = 'empty';
						
						LightActive = false;
					}
				}
			}else if(MouseCurrentAngle >= 255 && MouseCurrentAngle < 285){
				if(DialCurrentFrame != '6'){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InputTiny();
					trace('F: 06');
					dial.currentFrame = 6;
					if(LightActive === true){
						LightPosHandler(2);
					}
				}
			}else if(MouseCurrentAngle >= 285 && MouseCurrentAngle < 315){
				if(DialCurrentFrame != '7'){
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
					trace('F: 07');
					dial.currentFrame = 7;
					LightActive = true;
					
					if(LightPos == 6){
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
						LightPos = 0;
						
						light_pos_00.alpha = 0;
						light_pos_01.alpha = 0;
						light_pos_02.alpha = 0;
						light_pos_03.alpha = 0;
						light_pos_04.alpha = 0;
						light_pos_05.alpha = 0;
						
						SaveArray['pos_00'] = 'empty';
						SaveArray['pos_01'] = 'empty';
						SaveArray['pos_02'] = 'empty';
						SaveArray['pos_03'] = 'empty';
						SaveArray['pos_04'] = 'empty';
						SaveArray['pos_05'] = 'empty';
						
						LightActive = false;
					}
				}
			}else if(MouseCurrentAngle >= 315 && MouseCurrentAngle < 345){
				if(DialCurrentFrame != '8'){
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
					trace('F: 08');
					dial.currentFrame = 8;
					LightActive = true;
					
					if(LightPos == 6){
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
						LightPos = 0;
						
						light_pos_00.alpha = 0;
						light_pos_01.alpha = 0;
						light_pos_02.alpha = 0;
						light_pos_03.alpha = 0;
						light_pos_04.alpha = 0;
						light_pos_05.alpha = 0;
						
						SaveArray['pos_00'] = 'empty';
						SaveArray['pos_01'] = 'empty';
						SaveArray['pos_02'] = 'empty';
						SaveArray['pos_03'] = 'empty';
						SaveArray['pos_04'] = 'empty';
						SaveArray['pos_05'] = 'empty';
						
						LightActive = false;
					}
					
				}
			}
			if(dial.alpha == 0){
				if(DialCurrentFrame != '6'){
					if(DialCurrentFrame != '3'){
						if(DialCurrentFrame != '0'){
							if(DialCurrentFrame != '9'){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
							}
						}
					}
				}
				
			}
			DialCurrentFrame = ''+String(dial.currentFrame);
			trace("DialCurrentFrame:"+DialCurrentFrame);
			dial_off.alpha = 0;
			dial.alpha = 1;
		//	trace("MouseCurrentAngle: "+MouseCurrentAngle);
		//	trace("MousePrevAngle: "+MousePrevAngle);
			
		//	MousePrevAngle = MouseCurrentAngle;
			return;
		}
		private function LightPosHandler(dialPos:int):void{
		
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock;
			}
			
			if(LightPos == 0){
				if(dialPos == 0){
					light_pos_00.texture = this.assets.getTexture('light_blue');
					SaveArray['pos_00'] = 'blue';
				}else if(dialPos == 1){
					light_pos_00.texture = this.assets.getTexture('light_red');
					SaveArray['pos_00'] = 'red';
				}else if(dialPos == 2){
					light_pos_00.texture = this.assets.getTexture('light_green');
					SaveArray['pos_00'] = 'green';
				}else if(dialPos == 3){
					light_pos_00.texture = this.assets.getTexture('light_yellow');
					SaveArray['pos_00'] = 'yellow';
				}
				
				light_pos_00.alpha = 1;
				LightPos = 1;
				LightActive = false;

				SaveArray['LightPos'] = LightPos;
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DirLock',SaveArray);
				
			}else if(LightPos == 1){
				
				if(dialPos == 0){
					light_pos_01.texture = this.assets.getTexture('light_blue');	
					SaveArray['pos_01'] = 'blue';
				}else if(dialPos == 1){
					light_pos_01.texture = this.assets.getTexture('light_red');
					SaveArray['pos_01'] = 'red';
				}else if(dialPos == 2){
					light_pos_01.texture = this.assets.getTexture('light_green');
					SaveArray['pos_01'] = 'green';
				}else if(dialPos == 3){
					light_pos_01.texture = this.assets.getTexture('light_yellow');
					SaveArray['pos_01'] = 'yellow';
				}
				
				light_pos_01.alpha = 1;
				LightPos = 2;
				LightActive = false;
				
				SaveArray['LightPos'] = LightPos;
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DirLock',SaveArray);
				
			}else if(LightPos == 2){
				if(dialPos == 0){
					light_pos_02.texture = this.assets.getTexture('light_blue');	
					SaveArray['pos_02'] = 'blue';
				}else if(dialPos == 1){
					light_pos_02.texture = this.assets.getTexture('light_red');
					SaveArray['pos_02'] = 'red';
				}else if(dialPos == 2){
					light_pos_02.texture = this.assets.getTexture('light_green');
					SaveArray['pos_02'] = 'green';
				}else if(dialPos == 3){
					light_pos_02.texture = this.assets.getTexture('light_yellow');
					SaveArray['pos_02'] = 'yellow';
				}
				
				light_pos_02.alpha = 1;
				LightPos = 3;
				LightActive = false;
				
				SaveArray['LightPos'] = LightPos;
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DirLock',SaveArray);
				
			}else if(LightPos == 3){
				if(dialPos == 0){
					light_pos_03.texture = this.assets.getTexture('light_blue');	
					SaveArray['pos_03'] = 'blue';
				}else if(dialPos == 1){
					light_pos_03.texture = this.assets.getTexture('light_red');
					SaveArray['pos_03'] = 'red';
				}else if(dialPos == 2){
					light_pos_03.texture = this.assets.getTexture('light_green');
					SaveArray['pos_03'] = 'green';
				}else if(dialPos == 3){
					light_pos_03.texture = this.assets.getTexture('light_yellow');
					SaveArray['pos_03'] = 'yellow';
				}
				
				light_pos_03.alpha = 1;
				LightPos = 4;
				LightActive = false;
				
				SaveArray['LightPos'] = LightPos;
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DirLock',SaveArray);
				
			}else if(LightPos == 4){
				if(dialPos == 0){
					light_pos_04.texture = this.assets.getTexture('light_blue');	
					SaveArray['pos_04'] = 'blue';
				}else if(dialPos == 1){
					light_pos_04.texture = this.assets.getTexture('light_red');
					SaveArray['pos_04'] = 'red';
				}else if(dialPos == 2){
					light_pos_04.texture = this.assets.getTexture('light_green');
					SaveArray['pos_04'] = 'green';
				}else if(dialPos == 3){
					light_pos_04.texture = this.assets.getTexture('light_yellow');
					SaveArray['pos_04'] = 'yellow';
				}
				
				light_pos_04.alpha = 1;
				LightPos = 5;
				LightActive = false;
				
				SaveArray['LightPos'] = LightPos;
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DirLock',SaveArray);
				
			}else if(LightPos == 5){
				if(dialPos == 0){
					light_pos_05.texture = this.assets.getTexture('light_blue');	
					SaveArray['pos_05'] = 'blue';
				}else if(dialPos == 1){
					light_pos_05.texture = this.assets.getTexture('light_red');
					SaveArray['pos_05'] = 'red';
				}else if(dialPos == 2){
					light_pos_05.texture = this.assets.getTexture('light_green');
					SaveArray['pos_05'] = 'green';
				}else if(dialPos == 3){
					light_pos_05.texture = this.assets.getTexture('light_yellow');
					SaveArray['pos_05'] = 'yellow';
				}
				
				light_pos_05.alpha = 1;
				LightPos = 6;
				
				LightActive = false;
				
				SaveArray['LightPos'] = LightPos;
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DirLock',SaveArray);
				
				
				Solve();
				
			}else if(LightPos == 6){
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
				LightPos = 0;
				
				light_pos_00.alpha = 0;
				light_pos_01.alpha = 0;
				light_pos_02.alpha = 0;
				light_pos_03.alpha = 0;
				light_pos_04.alpha = 0;
				light_pos_05.alpha = 0;
				
				SaveArray['pos_00'] = 'empty';
				SaveArray['pos_01'] = 'empty';
				SaveArray['pos_02'] = 'empty';
				SaveArray['pos_03'] = 'empty';
				SaveArray['pos_04'] = 'empty';
				SaveArray['pos_05'] = 'empty';
				
				LightActive = false;
			}
		
			
			
			
		}
		
		private function Solve():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_00'] == 'blue'){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_01'] == 'red'){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_02'] == 'green'){
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_03'] == 'red'){
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_04'] == 'blue'){
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock['pos_05'] == 'yellow'){
										trace('Solved');
										Animating = true;
										dial_off.alpha = 1;
										dial.alpha = 0;
									
										light_pos_00 = new Image(this.assets.getTexture('light_white'));
										light_pos_01 = new Image(this.assets.getTexture('light_white'));
										light_pos_02 = new Image(this.assets.getTexture('light_white'));
										light_pos_03 = new Image(this.assets.getTexture('light_white'));
										light_pos_04 = new Image(this.assets.getTexture('light_white'));
										
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InputAccept();
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
										if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock != undefined){
											SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DirLock;
										}
										
										SaveArray['Solved'] = 'Yes';
										(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DirLock',SaveArray);
										
										
										Starling.juggler.delayCall(function():void{
											lock_open.alpha = 1;
											(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_UnlockTwo();
											(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsThree();
											
										},1.5);
										
										delayedCall = new DelayedCall(function():void{
											RunSolve();
											//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicProcess();
											
										}, 3);
										Starling.juggler.add(delayedCall)
										
										
									}else{
										FailureSound();
									}
								}else{
									FailureSound();
								}
							}else{
								FailureSound();
							}
						}else{
							FailureSound();
						}
					}else{
						FailureSound();
					}
				}else{
					FailureSound();
				}
			}else{
				FailureSound();
			}
		}
		
		private function FailureSound():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
			
		}
		
		private function RunSolve():void{
			
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ChainRattle();
			FadeOut((SecondFloorHall as Class), 
				(stage.getChildAt(0) as Object).screenGamePlayHandler.SecondFloorHallObj,true
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
			
			
			
			
			this.assets.removeTexture("DirLock_Sprite_01",true);
			this.assets.removeTextureAtlas("DirLock_Sprite_01",true);
			this.assets.removeTexture("DirLock_Sprite_02",true);
			this.assets.removeTextureAtlas("DirLock_Sprite_02",true);
			this.assets.removeTexture("DirLock_Sprite_03",true);
			this.assets.removeTextureAtlas("DirLock_Sprite_03",true);
			
			(stage.getChildAt(0) as Object).falseAsset("dirLock_01");
			(stage.getChildAt(0) as Object).falseAsset("dirLock_02");
			(stage.getChildAt(0) as Object).falseAsset("dirLock_03");
			(stage.getChildAt(0) as Object).falseAsset("dirLock_04");
			(stage.getChildAt(0) as Object).falseAsset("dirLock_05");
			(stage.getChildAt(0) as Object).falseAsset("dirLock_06");
			
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


