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
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;
	
	public class GreenHouseDeepBulb extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
	
		private var bulb_mc:MovieClip;
		private var bulb_close_mc:MovieClip;
		private var orb:Image;
		
		private var hit_bulb:Shape;
		private var hit_orb:Shape;
		
		private var hit_orb_open:Shape;
		private var hit_roots:Shape;
		
		private var OrbTween:Tween;
		private var OrbMoveTween:Tween;
		
		private var RONum:int = 0;
		
		private var BulbState:Boolean = false;
		private var OrbPickedUp:Boolean = false;
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		
		
		public function GreenHouseDeepBulb(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('greenHouseDeepBulb_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseDeepBulb/greenHouseDeepBulb_bg.jpg'));
				game.TrackAssets('greenHouseDeepBulb_01');
			}
			if(game.CheckAsset('greenHouseDeepBulb_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseDeepBulb/GreenHouseDeepBulb_Sprite.png'));
				game.TrackAssets('greenHouseDeepBulb_02');
			}
			if(game.CheckAsset('greenHouseDeepBulb_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseDeepBulb/GreenHouseDeepBulb_Sprite.xml'));
				game.TrackAssets('greenHouseDeepBulb_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GreenHouseDeepBulb","GreenHouseDeepBulbObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('greenHouseDeepBulb_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
		
			bulb_mc = new MovieClip(this.assets.getTextures("bulb_frame_0"),6);
			bulb_mc.x = 182;
			bulb_mc.y = 17;
			bulb_mc.touchable = false;
			bulb_mc.loop = false; 
			bulb_mc.stop();
			
			bulb_close_mc = new MovieClip(this.assets.getTextures("bulb_frame_0").reverse(),6);
			bulb_close_mc.x = 182;
			bulb_close_mc.y = 17;
			bulb_close_mc.touchable = false;
			bulb_close_mc.loop = false; 
			bulb_close_mc.stop();
			
			orb = new Image(this.assets.getTexture('green_orb'));
			orb.touchable = false;
			orb.x = 290;
			orb.y = 155;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepBulb != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepBulb['Pearl'] == 'PickedUp'){
					OrbPickedUp = true;	
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepBulb['BulbState'] == 'Open'){
					BulbState = true;				
					bulb_close_mc.alpha = 1;
					bulb_mc.alpha = 0;
					if(OrbPickedUp === false){
						this.addEventListener(Event.ENTER_FRAME, OrbAnimator);
						orb.x = 290;
						orb.y = 115;
					//	orb.y = 290;
						orb.alpha = 1;
					}else{
						orb.alpha = 0;
					}
				//	CreateOrbHit();					
				}else{
					orb.alpha = 0;
					bulb_close_mc.alpha = 0;
					bulb_mc.alpha = 1;
				}
				
			}else{
				
				orb.alpha = 0;
				bulb_close_mc.alpha = 0;
				bulb_mc.alpha = 1;
			}
			
			
			
			this.addChildAt(bulb_mc,1);
			this.addChildAt(bulb_close_mc,2);
			this.addChildAt(orb,3);
			CreateOrbOpenHit();
			CreateRootHit();
			CreateBulbHit();
			CreateOrbHit();
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			Starling.juggler.add(bulb_mc);
			Starling.juggler.add(bulb_close_mc);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			//(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
			Starling.juggler.delayCall(function():void{
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadSlipperyPlants(true,999);
				
			},0.5);
		}
		
		
		//hit_orb
		
		private function CreateRootHit():void{
			hit_roots = new Shape();
			hit_roots.touchable = false;
			hit_roots.graphics.beginFill(0xff0000);
			
			hit_roots.graphics.lineTo(0,0);	
			hit_roots.graphics.lineTo(800,0);	
			hit_roots.graphics.lineTo(800,512);	
			hit_roots.graphics.lineTo(0,512);	
						
			hit_roots.graphics.endFill(false);
			hit_roots.alpha = 0;
			
			hit_roots.graphics.precisionHitTest = true;	
			this.addChild(hit_roots);
		}
		
		private function CreateOrbOpenHit():void{
			hit_orb_open = new Shape();
			hit_orb_open.touchable = false;
			hit_orb_open.graphics.beginFill(0xff0000);
			
			hit_orb_open.graphics.lineTo(176,325);	
			hit_orb_open.graphics.lineTo(228,232);	
			hit_orb_open.graphics.lineTo(202,168);	
			hit_orb_open.graphics.lineTo(216,79);	
			hit_orb_open.graphics.lineTo(281,95);	
			hit_orb_open.graphics.lineTo(312,28);	
			hit_orb_open.graphics.lineTo(353,25);	
			hit_orb_open.graphics.lineTo(348,71);	
			hit_orb_open.graphics.lineTo(438,75);	
			hit_orb_open.graphics.lineTo(493,13);	
			hit_orb_open.graphics.lineTo(556,99);	
			hit_orb_open.graphics.lineTo(561,263);	
			hit_orb_open.graphics.lineTo(598,293);	
			hit_orb_open.graphics.lineTo(501,398);	
			hit_orb_open.graphics.lineTo(380,394);	
			hit_orb_open.graphics.lineTo(265,405);	
		
			hit_orb_open.graphics.endFill(false);
			hit_orb_open.alpha = 0.0;
			
			hit_orb_open.graphics.precisionHitTest = true;	
			this.addChild(hit_orb_open);
		}
		
		private function CreateOrbHit():void{
			hit_orb = new Shape();
			hit_orb.touchable = false;
			hit_orb.graphics.beginFill(0xff0000);
			
			hit_orb.graphics.lineTo(311,195);	
			hit_orb.graphics.lineTo(336,147);	
			hit_orb.graphics.lineTo(392,136);	
			hit_orb.graphics.lineTo(425,174);	
			hit_orb.graphics.lineTo(419,232);	
			hit_orb.graphics.lineTo(382,252);	
			hit_orb.graphics.lineTo(334,237);	
		
			hit_orb.graphics.endFill(false);
			hit_orb.alpha = 0.0;
			
			hit_orb.graphics.precisionHitTest = true;	
			this.addChild(hit_orb);
		}
		private function CreateBulbHit():void{
			hit_bulb = new Shape();
			hit_bulb.touchable = false;
			hit_bulb.graphics.beginFill(0xff0000);
			
			hit_bulb.graphics.lineTo(244,230);	
			hit_bulb.graphics.lineTo(271,131);	
			hit_bulb.graphics.lineTo(350,81);	
			hit_bulb.graphics.lineTo(425,96);	
			hit_bulb.graphics.lineTo(491,154);	
			hit_bulb.graphics.lineTo(530,251);	
			hit_bulb.graphics.lineTo(498,339);	
			hit_bulb.graphics.lineTo(424,388);	
			hit_bulb.graphics.lineTo(316,350);	
			hit_bulb.graphics.lineTo(271,284);	
		
			hit_bulb.graphics.endFill(false);
			hit_bulb.alpha = 0.0;
			
			hit_bulb.graphics.precisionHitTest = true;	
			this.addChild(hit_bulb);
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
							FadeOut((GreenHouseDeep as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseDeepObj,true
							);
							return;
						}else if(hit_bulb.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(BulbState === false){
								BulbAction();								
							}else if(hit_orb.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(OrbPickedUp === false){
									OrbHandler();
								}else{
									BulbAction();
								}
							}else{
								BulbAction();
							}
							return;
						}else if(hit_orb_open.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(BulbState === true){
								if(RONum == 0){
									RONum = 1;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The bulb has spread its thick petals.");				
								}else if(RONum == 1){
									RONum = 2;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The inside of the petals is moist and slimy.");				
									
								}else if(RONum == 2){
									RONum = 0;	
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I shouldn't assume this plant isn't carnivorous...");
								}
							}else{
								if(RONum == 0){
									RONum = 1;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Large tentacle-like stalks support the enormous bulge...");				
								}else if(RONum == 1){
									RONum = 2;
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The stalks or roots seem to emerge from a giant mass of vegetation.");				
									
								}else if(RONum == 2){
									RONum = 0;	
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The plant is monstrous in size...");
								}
							}
						}else if(hit_roots.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){						
							if(RONum == 0){
								RONum = 1;
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Large tentacle-like stalks support the enormous bulge...");				
							}else if(RONum == 1){
								RONum = 2;
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The stalks or roots seem to emerge from a giant mass of vegetation.");				
								
							}else if(RONum == 2){
								RONum = 0;	
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The plant is monstrous in size...");
							}
							return;
									
						}
						
						/*
						CreateOrbOpenHit();
						CreateRootHit();
						private var hit_orb_open:Shape;
						private var hit_roots:Shape;
						*/
					}
				}
			}
		}
		
		
		private function OrbHandler():void{
			this.removeEventListener(Event.ENTER_FRAME, OrbAnimator);
			(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PearlGreen,
				'item_PearlGreen',
				'inven_pearlGreen_sm'
			);
			OrbPickedUp = true;
			orb.alpha = 0;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepBulb != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepBulb;
			}
			SaveArray['Pearl'] = 'PickedUp';
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepBulb',SaveArray);
			
		}
		
		private function BulbAction():void{
			if(BulbState === false){
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OhmTwo();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepBulb != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepBulb;
				}			
				
				BulbState = true;
				Animating = true;
				bulb_mc.addEventListener(Event.COMPLETE, OnBulbOpenComplete);
				bulb_mc.play();
				
				SaveArray['BulbState'] = 'Open';
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepBulb',SaveArray);
			}else{
				if(OrbPickedUp === true){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepBulb != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepBulb;
					}
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OhmTwo();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					BulbState = false;
					Animating = true;
					bulb_close_mc.addEventListener(Event.COMPLETE, OnBulbCloseComplete);
					bulb_close_mc.play();
					
					SaveArray['BulbState'] = 'Closed';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeepBulb',SaveArray);
				}
			}		
		}
		
		private function OnBulbCloseComplete():void{
			Animating = false;
			bulb_close_mc.alpha = 0;
			bulb_mc.alpha = 1;
			bulb_close_mc.removeEventListener(Event.COMPLETE, OnBulbCloseComplete);
			bulb_close_mc.stop();
		}
		
		private function OnBulbOpenComplete():void{					
			bulb_mc.removeEventListener(Event.COMPLETE, OnBulbOpenComplete);			
			if(OrbPickedUp === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWaveTwo();
				OrbTween = new Tween(orb, 1, Transitions.EASE_OUT);			
				OrbTween.fadeTo(1);
				OrbTween.onComplete = function():void{								
					//FadeOutCabbage();	
					//Animating = false;
					
					MoveOrb();
					OrbTween = null;
				};
				Starling.juggler.add(OrbTween);	
				
			}else{
				Animating = false;
				bulb_close_mc.alpha = 1;
				bulb_mc.alpha = 0;
				bulb_mc.stop();
			}
			
		}
		private function MoveOrb():void{		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
			bulb_mc.removeEventListener(Event.COMPLETE, OnBulbOpenComplete);			
			bulb_close_mc.alpha = 1;
			bulb_mc.alpha = 0;
			bulb_mc.stop();
			OrbMoveTween = new Tween(orb, 1, Transitions.EASE_IN_OUT);			
			OrbMoveTween.animate("y",115);
			OrbMoveTween.animate("x",290);
			OrbMoveTween.onComplete = function():void{								
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				//FadeOutCabbage();	
				OrbMoveComplete();
				OrbMoveTween = null;
			};
			Starling.juggler.add(OrbMoveTween);				
		}
		private function OrbMoveComplete():void{
		//	CreateOrbHit();
			Animating = false;
			
			if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
				
				(stage.getChildAt(0) as Object).MusicObj.LoadPhantom(true,3);
				
			}
			this.addEventListener(Event.ENTER_FRAME, OrbAnimator);
			
			
		}
		private function OrbAnimator():void{
			var currentDate:Date = new Date();
			orb.y = 118+ (Math.cos(currentDate.getTime()*0.002)*5);
		}
		private function FadeOut(loadClass:Class,loadObj:Object,Fade:Boolean = false):void{
			trace("FADE OUT");
			this.removeEventListener(TouchEvent.TOUCH,TouchHandler);
			this.removeEventListener(Event.ENTER_FRAME, OrbAnimator);
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
			
			
			
			this.assets.removeTexture("greenHouseDeepBulb_bg",true);
			this.assets.removeTexture("GreenHouseDeepBulb_Sprite",true);
			this.assets.removeTextureAtlas("GreenHouseDeepBulb_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("greenHouseDeepBulb_01");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseDeepBulb_02");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseDeepBulb_03");
			
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
