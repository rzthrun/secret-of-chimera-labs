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
		
	public class ServerRoomTable extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var pos_0:Image;
		private var pos_1:Image;
		private var pos_2:Image;
		private var pos_3:Image;
		private var pos_4:Image;
		private var pos_5:Image;
		
		private var hit_0:Shape;
		private var hit_1:Shape;
		private var hit_2:Shape;
		private var hit_3:Shape;
		private var hit_4:Shape;
		private var hit_5:Shape;
		
		//	private var hit_elevator_door:Shape;
		
		private var PosArray:Array = new Array(
			'sphere',
			'apple',
			'eggplant',
			'cylinder',
			'orange',
			'cube'
		);
		/*
		'sphere',
		'apple',
		'eggplant',
		'cylinder',
		'orange',
		'cube'
		*/
		
		private var ArmedPos:int = 6;
		private var TempPos:String = null;
		
		private var EggplantAttached:Boolean = false;
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
	
		public function ServerRoomTable(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('serverRoomTable_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoomTable/serverRoomTable_bg.jpg'));
				game.TrackAssets('serverRoomTable_01');
			}
			if(game.CheckAsset('serverRoomTable_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoomTable/ServerRoomTable_Sprite_01.png'));
				game.TrackAssets('serverRoomTable_02');
			}
			if(game.CheckAsset('serverRoomTable_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoomTable/ServerRoomTable_Sprite_01.xml'));
				game.TrackAssets('serverRoomTable_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ServerRoomTable","ServerRoomTableObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('serverRoomTable_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			//	CreateElevatorDoorHit();
			/*
			private var pos_0:Image;
			private var pos_1:Image;
			private var pos_2:Image;
			private var pos_3:Image;
			private var pos_4:Image;
			private var pos_5:Image;
			*/
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['EggplantAttached'] == 'Yes'){	
					EggplantAttached = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['0'] != undefined){	
					PosArray[0] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['1'] != undefined){	
					PosArray[1] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['2'] != undefined){	
					PosArray[2] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['3'] != undefined){	
					PosArray[3] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['3'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['4'] != undefined){	
					PosArray[4] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['4'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['5'] != undefined){	
					PosArray[5] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['5'];
				}
			}else{
				
			}
			
			
			pos_0  = new Image(this.assets.getTexture('0_'+PosArray[0]));
			pos_0.touchable = false;
			pos_0.x = 289;
			pos_0.y = 0;
						
			pos_1  = new Image(this.assets.getTexture('1_'+PosArray[1]));
			pos_1.touchable = false;
			pos_1.x = 154;
			pos_1.y = 94;
						
			pos_2  = new Image(this.assets.getTexture('2_'+PosArray[2]));
			pos_2.touchable = false;
			pos_2.x = 387;
			pos_2.y = 104;
			
			pos_3  = new Image(this.assets.getTexture('3_'+PosArray[3]));
			pos_3.touchable = false;
			pos_3.x = 37;
			pos_3.y = 225;
			
			pos_4  = new Image(this.assets.getTexture('4_'+PosArray[4]));
			pos_4.touchable = false;
			pos_4.x = 268;
			pos_4.y = 245;
			
			pos_5  = new Image(this.assets.getTexture('5_'+PosArray[5]));
			pos_5.touchable = false;
			pos_5.x = 509;
			pos_5.y = 244;
			
			if(EggplantAttached === false){
				if(PosArray[0] == 'eggplant'){
					pos_0.alpha = 0;
					pos_1.alpha = 1;
					pos_2.alpha = 1;
					pos_3.alpha = 1;			
					pos_4.alpha = 1;
					pos_5.alpha = 1;
				}else if(PosArray[1] == 'eggplant'){
					pos_0.alpha = 1;
					pos_1.alpha = 0;
					pos_2.alpha = 1;
					pos_3.alpha = 1;			
					pos_4.alpha = 1;
					pos_5.alpha = 1;
				}else if(PosArray[2] == 'eggplant'){
					pos_0.alpha = 1;
					pos_1.alpha = 1;
					pos_2.alpha = 0;
					pos_3.alpha = 1;			
					pos_4.alpha = 1;
					pos_5.alpha = 1;
				}else if(PosArray[3] == 'eggplant'){
					pos_0.alpha = 1;
					pos_1.alpha = 1;
					pos_2.alpha = 1;
					pos_3.alpha = 0;			
					pos_4.alpha = 1;
					pos_5.alpha = 1;
				}else if(PosArray[4] == 'eggplant'){
					pos_0.alpha = 1;
					pos_1.alpha = 1;
					pos_2.alpha = 1;
					pos_3.alpha = 1;			
					pos_4.alpha = 0;
					pos_5.alpha = 1;
				}else if(PosArray[5] == 'eggplant'){
					pos_0.alpha = 1;
					pos_1.alpha = 1;
					pos_2.alpha = 1;
					pos_3.alpha = 1;			
					pos_4.alpha = 1;
					pos_5.alpha = 0;
				}
			}else{
				pos_0.alpha = 1;
				pos_1.alpha = 1;
				pos_2.alpha = 1;
				pos_3.alpha = 1;			
				pos_4.alpha = 1;
				pos_5.alpha = 1;
			}
		
			
			this.addChildAt(pos_0,1);
			this.addChildAt(pos_1,2);
			this.addChildAt(pos_2,3);
			this.addChildAt(pos_3,4);
			this.addChildAt(pos_4,5);
			this.addChildAt(pos_5,6);
			
			CreatePosHits();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		/*
		private var hit_0:Shape;
		private var hit_1:Shape;
		private var hit_2:Shape;
		private var hit_3:Shape;
		private var hit_4:Shape;
		private var hit_5:Shape;
		*/
		
		private function CreatePosHits():void{
			hit_0 = new Shape();
			hit_0.touchable = false;
			hit_0.graphics.beginFill(0xff0000);
			
			hit_0.graphics.lineTo(268,46);	
			hit_0.graphics.lineTo(290,0);	
			hit_0.graphics.lineTo(421,0);	
			hit_0.graphics.lineTo(449,77);	
			hit_0.graphics.lineTo(396,136);	
			hit_0.graphics.lineTo(315,136);	
					
			hit_0.graphics.endFill(false);
			hit_0.alpha = 0.0;
			
			hit_0.graphics.precisionHitTest = true;	
			
			hit_1 = new Shape();
			hit_1.touchable = false;
			hit_1.graphics.beginFill(0xff0000);
			
			hit_1.graphics.lineTo(163,146);	
			hit_1.graphics.lineTo(191,90);	
			hit_1.graphics.lineTo(274,92);	
			hit_1.graphics.lineTo(330,174);	
			hit_1.graphics.lineTo(315,249);	
			hit_1.graphics.lineTo(236,273);	
			hit_1.graphics.lineTo(164,245);	
			
			hit_1.graphics.endFill(false);
			hit_1.alpha = 0.0;
			
			hit_1.graphics.precisionHitTest = true;	
			
			
			hit_2 = new Shape();
			hit_2.touchable = false;
			hit_2.graphics.beginFill(0xff0000);
			
			hit_2.graphics.lineTo(383,159);	
			hit_2.graphics.lineTo(425,105);	
			hit_2.graphics.lineTo(513,108);	
			hit_2.graphics.lineTo(555,178);	
			hit_2.graphics.lineTo(551,253);	
			hit_2.graphics.lineTo(489,285);	
			hit_2.graphics.lineTo(426,280);			
			
			hit_2.graphics.endFill(false);
			hit_2.alpha = 0.0;
			
			hit_2.graphics.precisionHitTest = true;	
			
			
			hit_3 = new Shape();
			hit_3.touchable = false;
			hit_3.graphics.beginFill(0xff0000);
			
			hit_3.graphics.lineTo(42,284);		
			hit_3.graphics.lineTo(74,227);		
			hit_3.graphics.lineTo(165,231);		
			hit_3.graphics.lineTo(243,295);		
			hit_3.graphics.lineTo(231,396);		
			hit_3.graphics.lineTo(162,452);		
			hit_3.graphics.lineTo(70,440);		
			
			hit_3.graphics.endFill(false);
			hit_3.alpha = 0.0;
			
			hit_3.graphics.precisionHitTest = true;	
			
			
			
			hit_4 = new Shape();
			hit_4.touchable = false;
			hit_4.graphics.beginFill(0xff0000);
			
			hit_4.graphics.lineTo(263,318);		
			hit_4.graphics.lineTo(290,264);		
			hit_4.graphics.lineTo(389,235);		
			hit_4.graphics.lineTo(459,298);		
			hit_4.graphics.lineTo(476,403);		
			hit_4.graphics.lineTo(420,456);		
			hit_4.graphics.lineTo(317,460);		
		
			hit_4.graphics.endFill(false);
			hit_4.alpha = 0.0;
			
			hit_4.graphics.precisionHitTest = true;	
			
			
			hit_5 = new Shape();
			hit_5.touchable = false;
			hit_5.graphics.beginFill(0xff0000);
			
			hit_5.graphics.lineTo(516,296);		
			hit_5.graphics.lineTo(558,239);		
			hit_5.graphics.lineTo(670,243);		
			hit_5.graphics.lineTo(717,304);		
			hit_5.graphics.lineTo(716,389);		
			hit_5.graphics.lineTo(649,462);		
			hit_5.graphics.lineTo(558,467);		
			
			hit_5.graphics.endFill(false);
			hit_5.alpha = 0.0;
			
			hit_5.graphics.precisionHitTest = true;	
			
			this.addChild(hit_0);
			this.addChild(hit_1);
			this.addChild(hit_2);
			this.addChild(hit_3);
			this.addChild(hit_4);
			this.addChild(hit_5);
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
							FadeOut((ServerRoom as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ServerRoomObj,true
							);
						}else if(hit_5.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(EggplantAttached === false){	
								if((stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.armedItem
									== 
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.inventoryBarObj
									.item_Eggplant)
								{
									EggplantHandler();
								}else{
									if(ArmedPos == 6){
										ArmedPos = 5;
									}else{
										SwapPos(5);
									}
								}
							}else{
								if(ArmedPos == 6){
									ArmedPos = 5;
								}else{
									SwapPos(5);
								}
							}
							
						}else if(hit_4.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(EggplantAttached === false){	
								if((stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.armedItem
									== 
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.inventoryBarObj
									.item_Eggplant)
								{
									EggplantHandler();
								}else{
									if(ArmedPos == 6){
										ArmedPos = 4;
									}else{
										SwapPos(4);
									}
								}
							}else{
								if(ArmedPos == 6){
									ArmedPos = 4;
								}else{
									SwapPos(4);
								}
							}
						}else if(hit_3.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(EggplantAttached === false){	
								if((stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.armedItem
									== 
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.inventoryBarObj
									.item_Eggplant)
								{
									EggplantHandler();
								}else{
									if(ArmedPos == 6){
										ArmedPos = 3;
									}else{
										SwapPos(3);
									}
								}
							}else{
								if(ArmedPos == 6){
									ArmedPos = 3;
								}else{
									SwapPos(3);
								}

							}
						}else if(hit_2.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(EggplantAttached === false){	
								if((stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.armedItem
									== 
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.inventoryBarObj
									.item_Eggplant)
								{
									EggplantHandler();
								}else{
									if(ArmedPos == 6){
										ArmedPos = 2;
									}else{
										SwapPos(2);
									}
								}
							}else{
								if(ArmedPos == 6){
									ArmedPos = 2;
								}else{
									SwapPos(2);
								}
							}
							
						}else if(hit_1.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(EggplantAttached === false){	
								if((stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.armedItem
									== 
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.inventoryBarObj
									.item_Eggplant)
								{
									EggplantHandler();
								}else{
									if(ArmedPos == 6){
										ArmedPos = 1;
									}else{
										SwapPos(1);
									}
								}
							}else{
								if(ArmedPos == 6){
									ArmedPos = 1;
								}else{
									SwapPos(1);
								}
							}
						}else if(hit_0.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(EggplantAttached === false){	
								if((stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.armedItem
									== 
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.inventoryBarObj
									.item_Eggplant)
								{
									EggplantHandler();
								}else{
									if(ArmedPos == 6){
										ArmedPos = 0;
									}else{
										SwapPos(0);
									}
								}
							}else{
								if(ArmedPos == 6){
									ArmedPos = 0;
								}else{
									SwapPos(0);
								}
							}
						}

					}
				}
			}
		}
		
		private function EggplantHandler():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable;	
			}
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakThree();
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
			
			EggplantAttached = true;
			if(PosArray[0] == 'eggplant'){
				pos_0.alpha = 1;
				SaveArray['1'] = 'eggplant';
			}else if(PosArray[1] == 'eggplant'){
				pos_1.alpha = 1;
				SaveArray['1'] = 'eggplant';
			}else if(PosArray[2] == 'eggplant'){
				pos_2.alpha = 1;
				SaveArray['2'] = 'eggplant';
			}else if(PosArray[3] == 'eggplant'){
				pos_3.alpha = 1;
				SaveArray['3'] = 'eggplant';
			}else if(PosArray[4] == 'eggplant'){
				pos_4.alpha = 1;
				SaveArray['4'] = 'eggplant';
			}else if(PosArray[5] == 'eggplant'){
				pos_5.alpha = 1;
				SaveArray['5'] = 'eggplant';
			}
			
			SaveArray['EggplantAttached'] = 'Yes';
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomTable',SaveArray);
			
			
			(stage.getChildAt(0) as Object)
			.screenGamePlayHandler
				.InventoryObj.removeItemFromInventory(
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.item_Eggplant,
					"item_Eggplant"
				);
			
		}
		
		private function SwapPos(TargPos:int):void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakThree();
			
			this['pos_'+TargPos].texture = this.assets.getTexture(TargPos+'_'+PosArray[ArmedPos]);
			this['pos_'+ArmedPos].texture = this.assets.getTexture(ArmedPos+'_'+PosArray[TargPos]);
			TempPos = PosArray[TargPos];
			
			trace("TargPos: "+TargPos+" "+PosArray[TargPos]);
			trace("ArmedPos: "+ArmedPos+" "+PosArray[ArmedPos]);
			trace("TempPos: "+TempPos);
			PosArray[TargPos] = PosArray[ArmedPos];
			PosArray[ArmedPos] = TempPos;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable;	
			}
			SaveArray[''+TargPos] = PosArray[TargPos];
			SaveArray[''+ArmedPos] = PosArray[ArmedPos];
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomTable',SaveArray);
			
			
			if(EggplantAttached === false){
				if(PosArray[0] == 'eggplant'){
					pos_0.alpha = 0;
					pos_1.alpha = 1;
					pos_2.alpha = 1;
					pos_3.alpha = 1;			
					pos_4.alpha = 1;
					pos_5.alpha = 1;
				}else if(PosArray[1] == 'eggplant'){
					pos_0.alpha = 1;
					pos_1.alpha = 0;
					pos_2.alpha = 1;
					pos_3.alpha = 1;			
					pos_4.alpha = 1;
					pos_5.alpha = 1;
				}else if(PosArray[2] == 'eggplant'){
					pos_0.alpha = 1;
					pos_1.alpha = 1;
					pos_2.alpha = 0;
					pos_3.alpha = 1;			
					pos_4.alpha = 1;
					pos_5.alpha = 1;
				}else if(PosArray[3] == 'eggplant'){
					pos_0.alpha = 1;
					pos_1.alpha = 1;
					pos_2.alpha = 1;
					pos_3.alpha = 0;			
					pos_4.alpha = 1;
					pos_5.alpha = 1;
				}else if(PosArray[4] == 'eggplant'){
					pos_0.alpha = 1;
					pos_1.alpha = 1;
					pos_2.alpha = 1;
					pos_3.alpha = 1;			
					pos_4.alpha = 0;
					pos_5.alpha = 1;
				}else if(PosArray[5] == 'eggplant'){
					pos_0.alpha = 1;
					pos_1.alpha = 1;
					pos_2.alpha = 1;
					pos_3.alpha = 1;			
					pos_4.alpha = 1;
					pos_5.alpha = 0;
				}
			}else{
				pos_0.alpha = 1;
				pos_1.alpha = 1;
				pos_2.alpha = 1;
				pos_3.alpha = 1;			
				pos_4.alpha = 1;
				pos_5.alpha = 1;
			}

			
			trace('-----------');
			trace("TargPos: "+TargPos+" "+PosArray[TargPos]);
			trace("ArmedPos: "+ArmedPos+" "+PosArray[ArmedPos]);
			trace("TempPos: "+TempPos);
			ArmedPos = 6;
			TargPos = 6;
			TempPos = null;
			
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
			
			
			
			this.assets.removeTexture("serverRoomTable_bg",true);
			this.assets.removeTexture("ServerRoomTable_Sprite_01",true);
			this.assets.removeTextureAtlas("ServerRoomTable_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("serverRoomTable_01");
			(stage.getChildAt(0) as Object).falseAsset("serverRoomTable_02");
			(stage.getChildAt(0) as Object).falseAsset("serverRoomTable_03");
			
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
