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
	
	public class RocketRoomSat extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var ball:Image;
		private var cover:Image;
	//	private var meltCover:Image;
	//	private var smoke:Image;
		private var sideMelt:Image;
		
		private var hit_side_two:Shape;
		private var hit_side_one:Shape
		private var hit_side_melt:Shape;
		
		private var hit_cover:Shape;
		private var hit_ball:Shape;
		
		private var Animating:Boolean = false;
		
		private var CoverRemoved:Boolean = false;
		private var OrbPickedUp:Boolean = false;
		private var MeltRemoved:Boolean = false;
		private var SideMeltRemoved:Boolean = false;
		
		
//		private var MeltTween:Tween;
//		private var SmokeTween:Tween;
//		private var SideMeltTween:Tween;
		
		private var RONum:int = 0
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function RocketRoomSat(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('rocketRoomSat_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomSat/rocketRoomSat_bg.jpg'));
				game.TrackAssets('rocketRoomSat_01');
			}
			if(game.CheckAsset('rocketRoomSat_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomSat/RocketRoomSat_Sprite_01.png'));
				game.TrackAssets('rocketRoomSat_02');
			}
			if(game.CheckAsset('rocketRoomSat_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomSat/RocketRoomSat_Sprite_01.xml'));
				game.TrackAssets('rocketRoomSat_03');
			}
			//RocketRoomSat_Sprite_01
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RocketRoomSat","RocketRoomSatObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('rocketRoomSat_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			ball = new Image(this.assets.getTexture('orb'));
			ball.touchable = false;
			ball.x = 207;
			ball.y = 210;
			
			cover = new Image(this.assets.getTexture('cover'));
			cover.touchable = false;
			cover.x = 69;
			cover.y = 126;
			
	//		meltCover = new Image(this.assets.getTexture('meltorb'));
	//		meltCover.touchable = false;
	//		meltCover.x = 179;
	//		meltCover.y = 191;
			
	//		smoke = new Image(this.assets.getTexture('smoke'));
	//		smoke.touchable = false;
	//		smoke.x = 101;
	//		smoke.y = 0;
			
			sideMelt = new Image(this.assets.getTexture('side_cover'));
			sideMelt.touchable = false;
			sideMelt.x = 527;
			sideMelt.y = 286;
			
			/*
			private var meltCover:Image;
			private var smoke:Image;
			*/
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat != undefined){
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat['CoverRemoved'] == 'Yes'){
					CoverRemoved = true;
					cover.alpha = 0;
				}else{
					cover.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat['OrbPickedUp'] == 'Yes'){
					OrbPickedUp = true;
					ball.alpha = 0;
				}else{
					ball.alpha = 1;
				}
				//MeltRemoved
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat['SideMeltRemoved'] == 'Yes'){
					SideMeltRemoved = true;
					sideMelt.alpha = 1;
				}else{
					sideMelt.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat['MeltRemoved'] == 'Yes'){
					MeltRemoved = true;
		//			meltCover.alpha = 0;
				}else{
		//			meltCover.alpha =	1;
				}
				//SideMeltRemoved
				
			}else{
				sideMelt.alpha = 0;
				ball.alpha = 1;
				cover.alpha = 1;
	//			meltCover.alpha = 1;
			}
			
	//		smoke.alpha = 0;
			
			
			this.addChildAt(ball,1);
	//		this.addChildAt(meltCover,2);
			this.addChildAt(cover,2);
	//		this.addChildAt(smoke,3);
			this.addChildAt(sideMelt,3);
			
			CreateSideTwoHit();
			CreateSideOneHit();
			CreateSideMeltHit();
		
			
			CreateBallHit();
			CreateCoverHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
	
		private function CreateSideMeltHit():void{
			hit_side_melt = new Shape();
			hit_side_melt.touchable = false;
			hit_side_melt.graphics.beginFill(0x00ff00);
			
			hit_side_melt.graphics.lineTo(526,284);	
			hit_side_melt.graphics.lineTo(650,297);	
			hit_side_melt.graphics.lineTo(614,366);	
			hit_side_melt.graphics.lineTo(496,340);	
		
			hit_side_melt.graphics.endFill(false);
			hit_side_melt.alpha = 0.0;
			
			hit_side_melt.graphics.precisionHitTest = true;	
			this.addChild(hit_side_melt);
		}

		
		private function CreateSideOneHit():void{
			hit_side_one = new Shape();
			hit_side_one.touchable = false;
			hit_side_one.graphics.beginFill(0x00ff00);
			
			hit_side_one.graphics.lineTo(435,157);	
			hit_side_one.graphics.lineTo(473,100);	
			hit_side_one.graphics.lineTo(742,116);	
			hit_side_one.graphics.lineTo(732,293);	
			hit_side_one.graphics.lineTo(438,270);	
					
			hit_side_one.graphics.endFill(false);
			hit_side_one.alpha = 0.0;
			
			hit_side_one.graphics.precisionHitTest = true;	
			this.addChild(hit_side_one);
		}
		
		private function CreateSideTwoHit():void{
			hit_side_two  = new Shape();
			hit_side_two.touchable = false;
			hit_side_two.graphics.beginFill(0x00ff00);
			
			hit_side_two.graphics.lineTo(358,327);	
			hit_side_two.graphics.lineTo(662,358);	
			hit_side_two.graphics.lineTo(678,407);	
			hit_side_two.graphics.lineTo(569,504);	
			hit_side_two.graphics.lineTo(347,453);	
			
			
			hit_side_two.graphics.endFill(false);
			hit_side_two.alpha = 0.0;
			
			hit_side_two.graphics.precisionHitTest = true;	
			this.addChild(hit_side_two);
		}
		
		private function CreateCoverHit():void{
			hit_cover  = new Shape();
			hit_cover.touchable = false;
			hit_cover.graphics.beginFill(0x00ff00);
			
			hit_cover.graphics.lineTo(81,125);	
			hit_cover.graphics.lineTo(325,131);	
			hit_cover.graphics.lineTo(349,147);	
			hit_cover.graphics.lineTo(333,375);	
			hit_cover.graphics.lineTo(306,402);	
			hit_cover.graphics.lineTo(91,396);	
			hit_cover.graphics.lineTo(66,339);	
				
			
			hit_cover.graphics.endFill(false);
			hit_cover.alpha = 0.0;
			
			hit_cover.graphics.precisionHitTest = true;	
			this.addChild(hit_cover);
		}
		
		private function CreateBallHit():void{
			hit_ball  = new Shape();
			hit_ball.touchable = false;
			hit_ball.graphics.beginFill(0x00ff00);
			
			hit_ball.graphics.lineTo(178,184);	
			hit_ball.graphics.lineTo(312,193);	
			hit_ball.graphics.lineTo(297,316);	
			hit_ball.graphics.lineTo(161,308);	
			
			hit_ball.graphics.endFill(false);
			hit_ball.alpha = 0.0;
			
			hit_ball.graphics.precisionHitTest = true;	
			this.addChild(hit_ball);
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
							//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ScrewDropX4();
							FadeOut((RocketRoomSatStation as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.RocketRoomSatStationObj,true
							);
							return;
						}
						else if(hit_side_melt.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SideMeltHandler();
						}else if(hit_side_one.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SideOneHandler();
						}else if(hit_side_two.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SideTwoHandler();
						}else if(CoverRemoved === false){
							if(hit_cover.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								CoverHandler();
							}
						}else{
							if(hit_ball.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								BallHandler();
							}else if(hit_cover.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The poor satellite has really had a hard time...");
							}
						}
					}
				}
			}
		}
		private function SideTwoHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
			//SFX_BarrelKickLight
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The area is badly damaged.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This piece seems to be completely melted to the main body frame.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I don't think this part can be easily removed...");
			}
		}
		
		private function SideOneHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
			if(RONum == 0){
				
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The area is badly damaged.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Various pieces of the housing have fused together here. I doubt I'll be able to remove any.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("C.U.P..I...?");
			}
		}
		
		private function SideMeltHandler():void{
			
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Pieces of the satellite must have melted and suddenly froze near the time of impact.");
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A frozen stream of once liquid metal clings to the side of the satellite.");
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("All those amazing pieces of technology... liquefied.");
					}
			
		}
		
		private function SideMeltRemoveOnComplete():void{
			Animating = false;			
			(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I was able to remove some of the melted metal using the electric drill.")
		}
		
		private function CoverHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Screwdriver)
			{
				Animating = true;
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RemoveNail3x();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ScrewDropX4();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangFour();
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I am removing the screws from the component housing.")
				CoverRemoved = true;
			//	cover.alpha = 0;
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat;
				}
				
				SaveArray['CoverRemoved'] = 'Yes';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomSat',SaveArray);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom != undefined){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom['VentUnlocked'] == 'Yes'){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Bathroom['MirrorUnlocked'] == 'Yes'){
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
								.InventoryObj.removeItemFromInventory(
									(stage.getChildAt(0) as Object)
									.screenGamePlayHandler
									.InventoryObj.item_Screwdriver,
									"item_Screwdriver"
								);
						}
					}
					
				}
				
				Starling.juggler.delayCall(OpenCover,3);
				
				
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Drill)
			{
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This component's screws seem relatively intact. I should try unscrewing them first.");
				
			}else{
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A charred hole penetrates the exterior housing of the satellite");
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Although damaged, this component section of housing remains firmly attached.");
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Four screws hold the scarred metal cover in place.");
				}
				
			
				
			}
		}
		
		private function OpenCover():void{
			Animating = false;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxTwo_Open();
			
			CoverRemoved = true;
			cover.alpha = 0;
		}
		
		private function BallHandler():void{
		//	if(MeltRemoved === true){
				if(OrbPickedUp === false){
					if((stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.armedItem
						== 
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.inventoryBarObj
						.item_LabTongs)
					{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PipeRingOne();
						ball.alpha = 0;
						OrbPickedUp = true;
							
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
								(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Orb,
								'item_Orb',
								'inven_orb_sm'
						);	
							
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat;
						}
						
						SaveArray['OrbPickedUp'] = 'Yes';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomSat',SaveArray);
						
								(stage.getChildAt(0) as Object)
								.screenGamePlayHandler
									.InventoryObj.removeItemFromInventory(
										(stage.getChildAt(0) as Object)
										.screenGamePlayHandler
										.InventoryObj.item_LabTongs,
										"item_LabTongs"
									);	
					}else if((stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.armedItem
						== 
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.inventoryBarObj
						.item_Drill)
					{
						if(OrbPickedUp === false){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I don't think using the drill here is a good idea... who knows what I might hit...");
							
						}else{
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Creating more holes in this satellite would be only mindless destruction.");
							
						}
						
					}else{
						if(RONum == 0){
							RONum = 1;
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangOne();
							
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The stone is still jammed inside... I'll need a way to get a better grip.");
						}else if(RONum == 1){
							RONum = 2;
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangFour();
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I need something to grab the stone if I'm going to remove it. It's too tightly crammed into the metal.");
						}else if(RONum == 2){
							RONum = 0;
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DuctBangThree();
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Err... Whew! ... No, pulling with my bare hands won't work.");
						}
						
						
					}
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The hole caused by the spherical stone's impact with the satellite.");
					
				}
	/*		}else{
				if((stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.armedItem
					== 
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
					.InventoryObj.inventoryBarObj
					.item_Drill)
				{
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomSat;
					}
					
					SaveArray['MeltRemoved'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomSat',SaveArray);
					
					MeltRemoved = true;
					Animating = true;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Sizzle();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrillSlow(2);
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClinkOne(2);
					
					MeltTween = new Tween(meltCover, 4, Transitions.LINEAR);
					MeltTween.fadeTo(0);
					MeltTween.onComplete = function():void{
						Animating = false;					
					};
					Starling.juggler.add(MeltTween);		
			
					SmokeTween = new Tween(smoke, 2, Transitions.EASE_OUT);
					SmokeTween.fadeTo(1);
					SmokeTween.onComplete = function():void{
						FadeOutSmokeTween();	
					};
					Starling.juggler.add(SmokeTween);
			
				}else{
//					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Thump();
//					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
					if(RONum == 0){
						RONum = 1;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A strange spherical stone has lodged itself inside the satellite.");
					}else if(RONum == 1){
						RONum = 2;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The immediately surrounding metal has partially melted and fused around the stone.");
					}else if(RONum == 2){
						RONum = 0;
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'll need a way to remove and disconnect the fused metal before I can hope to remove the stone.");
					}
				}
			}
				*/
			
		}
		
/*		private function FadeOutSmokeTween():void{
			SmokeTween = new Tween(smoke, 2, Transitions.EASE_IN);
			SmokeTween.fadeTo(0);
			SmokeTween.onComplete = function():void{
				
			};
			Starling.juggler.add(SmokeTween);		
		}
*/		
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
			
			
			
			this.assets.removeTexture("rocketRoomSat_bg",true);
			this.assets.removeTexture("RocketRoomSat_Sprite_01",true);
			this.assets.removeTextureAtlas("RocketRoomSat_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomSat_01");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomSat_02");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomSat_03");
			
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
