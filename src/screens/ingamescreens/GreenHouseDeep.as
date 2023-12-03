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
	
	
	public class GreenHouseDeep extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var bulb_closed:Image;
		private var bulb_open:Image;
		private var bulb_orb:Image;
		
		private var shelf_vial:Image;
		private var shelf_stone:Image;
		private var shelf_book:Image;
		
		private var shelf_left_on:Image;
		private var shelf_left_off:Image;
		
		private var shelf_right_on:Image;
		private var shelf_right_off:Image;
		
		private var shelf_fridge_on:Image;
		private var shelf_fridge_off:Image;
		
		
		private var hit_bulb:Shape;
		private var hit_shelf:Shape;
		
		private var hit_egg:Shape;
		private var hit_egg_two:Shape;
		private var hit_root:Shape;
		private var hit_vine:Shape;
		
		private var RONum:int;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function GreenHouseDeep(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('greenHouseDeep_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseDeep/greenHouseDeep_bg.jpg'));
				game.TrackAssets('greenHouseDeep_01');
			}
			if(game.CheckAsset('greenHouseDeep_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseDeep/GreenHouseDeep_Sprite_01.png'));
				game.TrackAssets('greenHouseDeep_02');
			}
			if(game.CheckAsset('greenHouseDeep_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouseDeep/GreenHouseDeep_Sprite_01.xml'));
				game.TrackAssets('greenHouseDeep_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GreenHouseDeep","GreenHouseDeepObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('greenHouseDeep_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			bulb_closed = new Image(this.assets.getTexture('bulb_closed'));
			bulb_closed.touchable = false;
			bulb_closed.x = 468;
			bulb_closed.y = 150;
			
			bulb_open = new Image(this.assets.getTexture('bulb_open'));
			bulb_open.touchable = false;
			bulb_open.x = 418;
			bulb_open.y = 101;
			
			
			bulb_orb = new Image(this.assets.getTexture('bulb_orb'));
			bulb_orb.touchable = false;
			bulb_orb.x = 418;
			bulb_orb.y = 101;
			
			//479
			
			shelf_vial = new Image(this.assets.getTexture('shelf_vial'));
			shelf_vial.touchable = false;
			shelf_vial.x = 191;
			shelf_vial.y = 189;
			
			shelf_stone = new Image(this.assets.getTexture('shelf_stone'));
			shelf_stone.touchable = false;
			shelf_stone.x = 74;
			shelf_stone.y = 187;
			
			shelf_book = new Image(this.assets.getTexture('shelf_book'));
			shelf_book.touchable = false;
			shelf_book.x = 83;
			shelf_book.y = 87;
			
			shelf_left_on = new Image(this.assets.getTexture('shelf_left_on'));
			shelf_left_on.touchable = false;
			shelf_left_on.x = 57;
			shelf_left_on.y = 44;
			
			shelf_left_off = new Image(this.assets.getTexture('shelf_left_off'));
			shelf_left_off.touchable = false;
			shelf_left_off.x = 29;
			shelf_left_off.y = 35;
			
			
			shelf_right_on = new Image(this.assets.getTexture('shelf_right_on'));
			shelf_right_on.touchable = false;
			shelf_right_on.x = 103;
			shelf_right_on.y = 57;
			
			shelf_right_off = new Image(this.assets.getTexture('shelf_right_off'));
			shelf_right_off.touchable = false;
			shelf_right_off.x = 137;
			shelf_right_off.y = 66;
			
			
			shelf_fridge_on = new Image(this.assets.getTexture('shelf_fridge_closed'));
			shelf_fridge_on.touchable = false;
			shelf_fridge_on.x = 189;
			shelf_fridge_on.y = 157;
			
			shelf_fridge_off = new Image(this.assets.getTexture('shelf_fridge_open'));
			shelf_fridge_off.touchable = false;
			shelf_fridge_off.x = 230;
			shelf_fridge_off.y = 157;
			/*
			private var shelf_left_on:Image;
			private var shelf_left_off:Image;
			
			private var shelf_right_on:Image;
			private var shelf_right_off:Image;
			
			private var shelf_fridge_on:Image;
			private var shelf_fridge_off:Image;
			
			
			*/
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepBulb != undefined){
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepBulb['BulbState'] == 'Open'){
					bulb_closed.alpha = 0;
					bulb_open.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepBulb['Pearl'] == 'PickedUp'){
						bulb_orb.alpha = 0;
					}else{
						bulb_orb.alpha = 1;
					}
				}else{
					bulb_closed.alpha = 1;
					bulb_open.alpha = 0;
					bulb_orb.alpha = 0;
				}
			}else{
				bulb_closed.alpha = 1;
				bulb_open.alpha = 0;
				bulb_orb.alpha = 0;
			}
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Vial'] == 'PickedUp'){
					
					shelf_vial.alpha = 0;
				}else{
					shelf_vial.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Book'] == 'PickedUp'){
					
					shelf_book.alpha = 0;
				}else{
					shelf_book.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Stone'] == 'PickedUp'){
					
					shelf_stone.alpha = 0;
				}else{
					shelf_stone.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Left'] == 'Open'){
					
					shelf_left_on.alpha = 0;
					shelf_left_off.alpha = 1;
				}else{
					shelf_left_on.alpha = 1;
					shelf_left_off.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Right'] == 'Open'){
					
					shelf_right_on.alpha = 0;
					shelf_right_off.alpha = 1;
				}else{
					shelf_right_on.alpha = 1;
					shelf_right_off.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeepShelf['Fridge'] == 'Open'){
					
					shelf_fridge_off.alpha = 1;
					shelf_fridge_on.alpha = 0;
				}else{
					shelf_fridge_off.alpha = 0;
					shelf_fridge_on.alpha = 1;
				}
			}else{
				
				shelf_vial.alpha = 1;
				shelf_stone.alpha = 1;
				shelf_book.alpha = 1;
				
				shelf_left_on.alpha = 1;
				shelf_left_off.alpha = 0;
				
				shelf_right_on.alpha = 1;
				shelf_right_off.alpha = 0;
				
				shelf_fridge_on.alpha = 1;
				shelf_fridge_off.alpha = 0;
				
			}
			
			
			this.addChildAt(bulb_closed,1);
			this.addChildAt(bulb_open,2);
			this.addChildAt(bulb_orb,3);
			this.addChildAt(shelf_vial,4);
			this.addChildAt(shelf_stone,5);
			this.addChildAt(shelf_book,6);
			this.addChildAt(shelf_right_on,7);
			this.addChildAt(shelf_left_on,8);			
			this.addChildAt(shelf_right_off,9);
			this.addChildAt(shelf_left_off,10);
			this.addChildAt(shelf_fridge_off,11);
			this.addChildAt(shelf_fridge_on,12);
			
			CreateBulbHit();
			CreateShelfHit();
			
			CreateEggHit();
			CreateEggTwoHit();
			CreateRootHit();
			CreateVineHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeep!= undefined){	
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeep['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseDeep;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeep',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadMorGu(true,3);
							
						},0.5);
					}
				}
				
			}else{
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseDeep',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadMorGu(true,3);
						
					},0.5);
				}
			}
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			//(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
			Starling.juggler.delayCall(function():void{
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadSlipperyPlants(true,999);
				
				
			},0.5);
		}
		
		
		/*
		CreateEggHit();
		CreateEggTwoHit();
		CreateRootHit();
		CreateVineHit();
		
		
		*/
		
		//hit_shelf
		
		
		private function CreateVineHit():void{
			hit_vine = new Shape();
			hit_vine.touchable = false;
			hit_vine.graphics.beginFill(0xff0000);
			
			hit_vine.graphics.lineTo(262,321);	
			hit_vine.graphics.lineTo(277,116);	
			hit_vine.graphics.lineTo(460,12);	
			hit_vine.graphics.lineTo(618,14);	
			hit_vine.graphics.lineTo(780,168);	
			hit_vine.graphics.lineTo(681,389);	
							
			
			hit_vine.graphics.endFill(false);
			hit_vine.alpha = 0.0;
			
			hit_vine.graphics.precisionHitTest = true;	
			this.addChild(hit_vine);
		}
		
		private function CreateRootHit():void{
			hit_root = new Shape();
			hit_root.touchable = false;
			hit_root.graphics.beginFill(0xff0000);
			
			hit_root.graphics.lineTo(295,342);	
			hit_root.graphics.lineTo(380,314);	
			hit_root.graphics.lineTo(462,341);	
			hit_root.graphics.lineTo(439,456);	
			hit_root.graphics.lineTo(336,503);	
			hit_root.graphics.lineTo(235,501);			
			
			hit_root.graphics.endFill(false);
			hit_root.alpha = 0.0;
			
			hit_root.graphics.precisionHitTest = true;	
			this.addChild(hit_root);
		}
		
		private function CreateEggTwoHit():void{
			hit_egg_two = new Shape();
			hit_egg_two.touchable = false;
			hit_egg_two.graphics.beginFill(0xff0000);
			
			hit_egg_two.graphics.lineTo(479,438);	
			hit_egg_two.graphics.lineTo(500,377);	
			hit_egg_two.graphics.lineTo(561,377);	
			hit_egg_two.graphics.lineTo(579,458);	
			hit_egg_two.graphics.lineTo(506,476);	
			
			hit_egg_two.graphics.endFill(false);
			hit_egg_two.alpha = 0.0;
			
			hit_egg_two.graphics.precisionHitTest = true;	
			this.addChild(hit_egg_two);
		}
		
		private function CreateEggHit():void{
			hit_egg = new Shape();
			hit_egg.touchable = false;
			hit_egg.graphics.beginFill(0xff0000);
			
			hit_egg.graphics.lineTo(171,390);	
			hit_egg.graphics.lineTo(215,348);	
			hit_egg.graphics.lineTo(270,371);	
			hit_egg.graphics.lineTo(278,425);	
			hit_egg.graphics.lineTo(242,465);	
			hit_egg.graphics.lineTo(194,450);	
						
			hit_egg.graphics.endFill(false);
			hit_egg.alpha = 0.0;
			
			hit_egg.graphics.precisionHitTest = true;	
			this.addChild(hit_egg);
		}
		
		private function CreateShelfHit():void{
			hit_shelf = new Shape();
			hit_shelf.touchable = false;
			hit_shelf.graphics.beginFill(0xff0000);
			
			hit_shelf.graphics.lineTo(0,23);	
			hit_shelf.graphics.lineTo(236,77);	
			hit_shelf.graphics.lineTo(271,158);	
			hit_shelf.graphics.lineTo(267,279);	
			hit_shelf.graphics.lineTo(113,360);	
			hit_shelf.graphics.lineTo(0,341);	
		
			hit_shelf.graphics.endFill(false);
			hit_shelf.alpha = 0.0;
			
			hit_shelf.graphics.precisionHitTest = true;	
			this.addChild(hit_shelf);
		}

		private function CreateBulbHit():void{
			hit_bulb = new Shape();
			hit_bulb.touchable = false;
			hit_bulb.graphics.beginFill(0xff0000);
			
			hit_bulb.graphics.lineTo(435,244);	
			hit_bulb.graphics.lineTo(452,161);	
			hit_bulb.graphics.lineTo(516,103);	
			hit_bulb.graphics.lineTo(628,119);	
			hit_bulb.graphics.lineTo(663,181);	
			hit_bulb.graphics.lineTo(619,316);	
			hit_bulb.graphics.lineTo(530,335);	
		
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
							FadeOut((GreenHouse as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseObj,false
							);
						}else if(hit_bulb.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((GreenHouseDeepBulb as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseDeepBulbObj,true
							);
						}else if(hit_shelf.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((GreenHouseDeepShelf as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseDeepShelfObj,true
							);
						}else if(hit_egg.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							EggHandler();
						}else if(hit_egg_two.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							EggHandler();
						}else if(hit_root.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("An enormous root.");				
						}else if(hit_vine.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							VineHandler();
						}
							/*
						
						hit_egg
						hit_egg_two
						hit_root
						hit_vine
						*/
						
					}
				}
			}
		}
		private function VineHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The growth fills the back of room.");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The vines are like a web of tentacles...");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The growth fills the back of room.");	
			}
		}
		
		private function EggHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Several bulbs grow on the floor...");	
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("What on earth are these things...?");	
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Certainly an atypical species...");	
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
			
			
			
			this.assets.removeTexture("greenHouseDeep_bg",true);
			this.assets.removeTexture("GreenHouseDeep_Sprite_01",true);
			this.assets.removeTextureAtlas("GreenHouseDeep_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("greenHouseDeep_01");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseDeep_02");
			(stage.getChildAt(0) as Object).falseAsset("greenHouseDeep_03");
			
			// stage.getChildAt(0) as Object).falseAsset("coastSurf_02");
			
			if(blackOut === true){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.BlackOutRectangleFade(0,0.5);
			}
			(stage.getChildAt(0) as Object).screenGamePlayHandler.
				UnloadScene(
					
				);			
			
			this.dispose();
			
		}
	}
}
