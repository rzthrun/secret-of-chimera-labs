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
	
	
	public class RocketRoomCreature extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var cover_full:Image;
		private var cover:Image;
		private var pearl:Image;
		
		private var hit_cover:Shape;
		
		private var FullTween:Tween;
		private var CoverTween:Tween;
		
		private var Animating:Boolean = false;
		private var CoverOpen:Boolean = false;
		private var PearlPickedUp:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function RocketRoomCreature(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('rocketRoomCreature_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomCreature/rocketRoomCreature_bg.jpg'));
				game.TrackAssets('rocketRoomCreature_01');
			}
			if(game.CheckAsset('rocketRoomCreature_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomCreature/RocketRoomCreature_Sprite_01.png'));
				game.TrackAssets('rocketRoomCreature_02');
			}
			if(game.CheckAsset('rocketRoomCreature_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/RocketRoomCreature/RocketRoomCreature_Sprite_01.xml'));
				game.TrackAssets('rocketRoomCreature_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("RocketRoomCreature","RocketRoomCreatureObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		//hit_cover
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('rocketRoomCreature_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			cover = new Image(this.assets.getTexture('cover'));
			cover.touchable = false;
			cover.x = 109;
			cover.y = 120;
			
			pearl = new Image(this.assets.getTexture('pearl'));
			pearl.touchable = false;
			pearl.x = 213;
			pearl.y = 148;
			
			cover_full= new Image(this.assets.getTexture('cover_empty'));
			cover_full.touchable = false;
			cover_full.x = 230;
			cover_full.y = 163;

			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomCreature != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomCreature['Cover'] == "Open"){
					cover.alpha = 0;
					cover_full.alpha = 0;
					CoverOpen = true;
				}else{
					cover.alpha = 1;
					cover_full.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomCreature['Pearl'] == "PickedUp"){
					pearl.alpha = 0;
					PearlPickedUp = true;
				}else{
					pearl.alpha = 1;
				}
			}else{
				
				cover.alpha = 1;
				pearl.alpha = 1;
				cover_full.alpha = 1;
				
			}
		
			this.addChildAt(pearl,1);
			this.addChildAt(cover,2);
			this.addChildAt(cover_full,3);
			
			CreateCoverHit();
			
			//private var cover:Image;
			//private var pearl:Image;
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lobby',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadPhantom(true,2);
							
						},0.5);
					}
				}
			}else{
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lobby',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadPhantom(true,2);
						
					},0.5);
				}
			}
		}
		
		private function CreateCoverHit():void{
			hit_cover = new Shape();
			hit_cover.touchable = false;
			hit_cover.graphics.beginFill(0x00ff00);
			
			hit_cover.graphics.lineTo(251,334);	
			hit_cover.graphics.lineTo(220,246);	
			hit_cover.graphics.lineTo(268,154);	
			hit_cover.graphics.lineTo(348,145);	
			hit_cover.graphics.lineTo(452,236);	
			hit_cover.graphics.lineTo(364,391);	
			
			hit_cover.graphics.endFill(false);
			hit_cover.alpha = 0.0;
			
			hit_cover.graphics.precisionHitTest = true;	
			this.addChild(hit_cover);
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
						}else if(hit_cover.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CoverHandler();
						}
					}
				}
			}
		}
		
		//CoverTween
		
		private function CoverHandler():void{
			if(CoverOpen === false){
				Animating = true;
				CoverOpen = true;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomCreature != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomCreature;	
				}
				SaveArray['Cover'] = "Open";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomCreature',SaveArray);
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OhmTwo();
				
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpThree();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
				FullTween = new Tween(cover_full, 1.5, Transitions.LINEAR);
				FullTween.fadeTo(0);
				FullTween.onComplete = function():void{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					CompleteFullCover();
					FullTween = null;
				};
				Starling.juggler.add(FullTween);
				
				
			}else{
				if(PearlPickedUp === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWaveTwo();
						(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_PearlRed,
							'item_PearlRed',
							'inven_pearlRed_sm'
						);
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomCreature != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.RocketRoomCreature;	
						}
						PearlPickedUp = true;
						pearl.alpha = 0;
						SaveArray['Pearl'] = "PickedUp";
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('RocketRoomCreature',SaveArray);
						
						
				
				}
			}
		}
		private function CompleteFullCover():void{
			CoverTween = new Tween(cover, 2, Transitions.LINEAR);
			CoverTween.fadeTo(0);
			CoverTween.onComplete = function():void{
				Animating = false;	
				CoverTween = null;
			};
			Starling.juggler.add(CoverTween);	
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
			
			
			
			this.assets.removeTexture("rocketRoomCreature_bg",true);
			this.assets.removeTexture("RocketRoomCreature_Sprite_01",true);
			this.assets.removeTextureAtlas("RocketRoomCreature_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomCreature_01");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomCreature_02");
			(stage.getChildAt(0) as Object).falseAsset("rocketRoomCreature_03");
			
			
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