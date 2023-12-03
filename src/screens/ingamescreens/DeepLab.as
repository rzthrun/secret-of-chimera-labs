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
	
	
	public class DeepLab extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var fridge_injector:Image;
		private var fridge_book:Image;
		private var fridge_dna:Image;
		private var fridge_stone:Image;
		
		private var fridge_door_00_open:Image;
		private var fridge_door_00_closed:Image;
		private var fridge_door_01_open:Image;
		private var fridge_door_01_closed:Image;
		private var fridge_door_02_open:Image;
		private var fridge_door_02_closed:Image;
		private var fridge_door_03_open:Image;
		private var fridge_door_03_closed:Image;
		private var fridge_door_04_open:Image;
		private var fridge_door_04_closed:Image;
		private var fridge_door_05_open:Image;
		private var fridge_door_05_closed:Image;
		
		private var desk_purple_slime:Image;
		private var desk_left_over:Image;
		private var desk_jar:Image;
		private var desk_lid_on:Image;
		private var desk_lid_off:Image;
		private var desk_pot:Image;
		private var desk_cell:Image;
		
		private var hit_desk:Shape;
		private var hit_fridge:Shape;
		
		private var hit_book:Shape;
		
		private var hit_vent:Shape;
		private var hit_stool:Shape;
		
		private var openBookbg:Shape;
		private var openBook:Sprite;
		private var openBookPages:Image;
		private var openBookcurrentPage:Number = 0;
		
		private var hit_OpenBook:Shape;
	
		public var OpenBookTween:Tween;
		
		private var BookIsOpen:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function DeepLab(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('deepLab_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DeepLab/deepLab_bg.jpg'));
				game.TrackAssets('deepLab_01');
			}
			if(game.CheckAsset('deepLab_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DeepLab/DeepLab_Sprite_01.png'));
				game.TrackAssets('deepLab_02');
			}
			if(game.CheckAsset('deepLab_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DeepLab/DeepLab_Sprite_01.xml'));
				game.TrackAssets('deepLab_03');
			}
			if(game.CheckAsset('deepLab_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DeepLab/ChemistryBook_Sprite.png'));
				game.TrackAssets('deepLab_04');
			}
			if(game.CheckAsset('deepLab_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/DeepLab/ChemistryBook_Sprite.xml'));
				game.TrackAssets('deepLab_05');
			}
			//ChemistryBook_Sprite
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("DeepLab","DeepLabObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('deepLab_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			fridge_injector = new Image(this.assets.getTexture('fridge_injector'));			
			fridge_injector.touchable = false;
			fridge_injector.x = 59;
			fridge_injector.y = 142;
			
			fridge_book = new Image(this.assets.getTexture('fridge_book'));			
			fridge_book.touchable = false;
			fridge_book.x = 166;
			fridge_book.y = 233;
			
			fridge_dna = new Image(this.assets.getTexture('fridge_dna'));			
			fridge_dna.touchable = false;
			fridge_dna.x = 322;
			fridge_dna.y = 152;
			
			fridge_stone = new Image(this.assets.getTexture('fridge_stone'));			
			fridge_stone.touchable = false;
			fridge_stone.x = 389;
			fridge_stone.y = 242;
			
			fridge_door_00_closed = new Image(this.assets.getTexture('fridge_door_0_closed'));			
			fridge_door_00_closed.touchable = false;
			fridge_door_00_closed.x = 239;
			fridge_door_00_closed.y = 115;
			
			fridge_door_00_open = new Image(this.assets.getTexture('fridge_door_0_open'));			
			fridge_door_00_open.touchable = false;
			fridge_door_00_open.x = 181;
			fridge_door_00_open.y = 117;
				
			fridge_door_01_closed = new Image(this.assets.getTexture('fridge_door_1_closed'));			
			fridge_door_01_closed.touchable = false;
			fridge_door_01_closed.x = 300;
			fridge_door_01_closed.y = 112;
			
			fridge_door_01_open = new Image(this.assets.getTexture('fridge_door_1_open'));			
			fridge_door_01_open.touchable = false;
			fridge_door_01_open.x = 239;
			fridge_door_01_open.y = 113;
			
			fridge_door_02_closed = new Image(this.assets.getTexture('fridge_door_2_closed'));			
			fridge_door_02_closed.touchable = false;
			fridge_door_02_closed.x = 359;
			fridge_door_02_closed.y = 106;
			
			fridge_door_02_open = new Image(this.assets.getTexture('fridge_door_2_open'));			
			fridge_door_02_open.touchable = false;
			fridge_door_02_open.x = 306;
			fridge_door_02_open.y = 105;	
			
			
			fridge_door_03_closed = new Image(this.assets.getTexture('fridge_door_3_closed'));			
			fridge_door_03_closed.touchable = false;
			fridge_door_03_closed.x = 240;
			fridge_door_03_closed.y = 211;
			
			fridge_door_03_open = new Image(this.assets.getTexture('fridge_door_3_open'));			
			fridge_door_03_open.touchable = false;
			fridge_door_03_open.x = 187;
			fridge_door_03_open.y = 211;
						
			fridge_door_04_closed = new Image(this.assets.getTexture('fridge_door_4_closed'));			
			fridge_door_04_closed.touchable = false;
			fridge_door_04_closed.x = 298;
			fridge_door_04_closed.y = 213;
			
			fridge_door_04_open = new Image(this.assets.getTexture('fridge_door_4_open'));			
			fridge_door_04_open.touchable = false;
			fridge_door_04_open.x = 247;
			fridge_door_04_open.y = 212;
			
			fridge_door_05_closed = new Image(this.assets.getTexture('fridge_door_5_closed'));			
			fridge_door_05_closed.touchable = false;
			fridge_door_05_closed.x = 361;
			fridge_door_05_closed.y = 213;
			
			fridge_door_05_open = new Image(this.assets.getTexture('fridge_door_5_open'));			
			fridge_door_05_open.touchable = false;
			fridge_door_05_open.x = 297;
			fridge_door_05_open.y = 213;
			
			
			desk_purple_slime = new Image(this.assets.getTexture('desk_purple_slime'));			
			desk_purple_slime.touchable = false;
			desk_purple_slime.x = 716;
			desk_purple_slime.y = 228;
			
			desk_left_over = new Image(this.assets.getTexture('desk_leftover'));			
			desk_left_over.touchable = false;
			desk_left_over.x = 679;
			desk_left_over.y = 265;
			
			desk_jar = new Image(this.assets.getTexture('desk_jar'));			
			desk_jar.touchable = false;
			desk_jar.x = 565;
			desk_jar.y = 193;
			
			desk_lid_on = new Image(this.assets.getTexture('desk_lid_on'));			
			desk_lid_on.touchable = false;
			desk_lid_on.x = 567;
			desk_lid_on.y = 169;
			
			desk_lid_off = new Image(this.assets.getTexture('desk_lid_off'));			
			desk_lid_off.touchable = false;
			desk_lid_off.x = 590;
			desk_lid_off.y = 265;
		
			desk_pot = new Image(this.assets.getTexture('desk_pot_orange'));			
			desk_pot.touchable = false;
			desk_pot.x = 720;
			desk_pot.y = 265;
			
			desk_cell = new Image(this.assets.getTexture('desk_cell'));			
			desk_cell.touchable = false;
			desk_cell.x = 540;
			desk_cell.y = 272;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab['FirstTime'] == 'Yes'){	
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLab',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadSoulSearch(true,3);
							
						},0.5);
					}
				}
			}else{
				
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					//	SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lobby;
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLab',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadSoulSearch(true,3);
						
					},0.5);
				}
			}
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Stone'] == 'PickedUp'){	
					fridge_stone.alpha = 0;
				}else{
					fridge_stone.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Injector'] == 'PickedUp'){	
					fridge_injector.alpha = 0;
				}else{
					fridge_injector.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['DNA'] == 'PickedUp'){	
					fridge_dna.alpha = 0;
				}else{
					fridge_dna.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Book'] == 'PickedUp'){						
					fridge_book.alpha = 0;
				}else{
					fridge_book.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Door_0'] == 'Open'){					
					fridge_door_00_closed.alpha = 0;
					fridge_door_00_open.alpha = 1;
				}else{
					fridge_door_00_closed.alpha = 1;
					fridge_door_00_open.alpha = 0;	
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Door_1'] == 'Open'){					
					fridge_door_01_closed.alpha = 0;
					fridge_door_01_open.alpha = 1;	
				}else{
					fridge_door_01_closed.alpha = 1;
					fridge_door_01_open.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Door_2'] == 'Open'){
					fridge_door_02_closed.alpha = 0;
					fridge_door_02_open.alpha = 1;
				}else{
					fridge_door_02_closed.alpha = 1;
					fridge_door_02_open.alpha = 0;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Door_3'] == 'Open'){
					fridge_door_03_closed.alpha = 0;
					fridge_door_03_open.alpha = 1;
				}else{					
					fridge_door_03_closed.alpha = 1;
					fridge_door_03_open.alpha = 0;
				}				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Door_4'] == 'Open'){					
					fridge_door_04_closed.alpha = 0;
					fridge_door_04_open.alpha = 1;
				}else{
					fridge_door_04_closed.alpha = 1;
					fridge_door_04_open.alpha = 0;
				}				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabFridge['Door_5'] == 'Open'){
					
					fridge_door_05_closed.alpha = 0;
					fridge_door_05_open.alpha = 1;
				}else{
					fridge_door_05_closed.alpha = 1;
					fridge_door_05_open.alpha = 0;
				}
			}else{
				
				fridge_injector.alpha = 1;
				fridge_book.alpha = 1;
				fridge_dna.alpha = 1;
				fridge_stone.alpha = 1;
				
				fridge_door_00_closed.alpha = 1;
				fridge_door_00_open.alpha = 0;
				
				fridge_door_01_closed.alpha = 1;
				fridge_door_01_open.alpha = 0;
				
				fridge_door_02_closed.alpha = 1;
				fridge_door_02_open.alpha = 0;
				
				fridge_door_03_closed.alpha = 1;
				fridge_door_03_open.alpha = 0;
				
				fridge_door_04_closed.alpha = 1;
				fridge_door_04_open.alpha = 0;
				
				fridge_door_05_closed.alpha = 1;
				fridge_door_05_open.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['RockMelted'] == 'Yes'){	
					desk_left_over.alpha = 1;
					desk_pot.alpha = 1;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['DNAAttached'] == 'Yes'){	
						desk_pot.texture = this.assets.getTexture('desk_pot_red');
					}
				}else{
					desk_left_over.alpha = 0;
					desk_pot.alpha = 0;
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['JarAttached'] == 'Yes'){	
						desk_jar.alpha = 1;
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['WaterAttached'] == 'Yes'){	
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['RockAttached'] == 'Yes'){	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['IodineAttached'] == 'Yes'){	
									desk_jar.texture = this.assets.getTexture('desk_jar_rock_water_iodine');
								}else{
									desk_jar.texture = this.assets.getTexture('desk_jar_rock_water');
								}
							}else{
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['IodineAttached'] == 'Yes'){									
									desk_jar.texture = this.assets.getTexture('desk_jar_water_iodine');
								}else{
									desk_jar.texture = this.assets.getTexture('desk_jar_water');
								}
							}
						}else{
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['RockAttached'] == 'Yes'){	
								desk_jar.texture = this.assets.getTexture('desk_jar_rock');
							}else{
								
							}
						}
	
					}else{
						desk_jar.alpha = 0;
					}
					
				}
			
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['DNARockFried'] == 'Yes'){	
					desk_purple_slime.alpha = 1;
				}else{
					desk_purple_slime.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['Lid'] == 'On'){	
					desk_lid_on.alpha = 1;
					desk_lid_off.alpha = 0;
				}else{
					desk_lid_on.alpha = 0;
					desk_lid_off.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLabDesk['Cell'] == 'PickedUp'){	
					desk_cell.alpha = 0;
				}else{
					desk_cell.alpha = 1;
				}
			}else{
				desk_purple_slime.alpha = 0;
				desk_left_over.alpha = 0;
				desk_jar.alpha = 0;
				desk_lid_on.alpha = 0;
				desk_lid_off.alpha = 1;
				desk_pot.alpha = 0;
				desk_cell.alpha = 1;
			}
			
			
			
			this.addChildAt(fridge_injector,1);
			this.addChildAt(fridge_book,2);
			this.addChildAt(fridge_dna,3);
			this.addChildAt(fridge_stone,4);			
			this.addChildAt(fridge_door_00_closed,5);
			this.addChildAt(fridge_door_00_open,6);			
			this.addChildAt(fridge_door_01_closed,7);
			this.addChildAt(fridge_door_01_open,8);			
			this.addChildAt(fridge_door_02_closed,9);
			this.addChildAt(fridge_door_02_open,10);			
			this.addChildAt(fridge_door_03_closed,11);
			this.addChildAt(fridge_door_03_open,12);			
			this.addChildAt(fridge_door_04_closed,13);
			this.addChildAt(fridge_door_04_open,14);			
			this.addChildAt(fridge_door_05_closed,15);
			this.addChildAt(fridge_door_05_open,16);
			this.addChildAt(desk_lid_off,17);
			this.addChildAt(desk_cell,18);
			this.addChildAt(desk_jar,19);
			this.addChildAt(desk_lid_on,20);
			this.addChildAt(desk_left_over,21);
			this.addChildAt(desk_purple_slime,22);
			
			/*
			
		
			
			private var fridge_injector:Image;
			private var fridge_book:Image;
			private var fridge_dna:Image;
			private var fridge_stone:Image;
			
			private var fridge_door_00_open:Image;
			private var fridge_door_00_closed:Image;
			private var fridge_door_01_open:Image;
			private var fridge_door_01_closed:Image;
			private var fridge_door_02_open:Image;
			private var fridge_door_02_closed:Image;
			private var fridge_door_03_open:Image;
			private var fridge_door_03_closed:Image;
			private var fridge_door_04_open:Image;
			private var fridge_door_04_closed:Image;
			private var fridge_door_05_open:Image;
			private var fridge_door_05_closed:Image;
			
			*/
			
			
			CreateDeskHit();
			CreateFridgeHit();
			CreateBookHit();
			
			CreateStoolHit();
			CreateVentHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab["Book"] == "open"){
					trace("Book is Open");
					BookIsOpen = true;
					//	OpenBook();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab["BookCurrentPage"] == 0){
						openBookcurrentPage = 0;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab["BookCurrentPage"] == 1){
						openBookcurrentPage = 1;
					}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab["BookCurrentPage"] == 2){
						openBookcurrentPage = 2;
					}else{
						openBookcurrentPage = 0;
					}
					OpenBook();
					this.addChild(goback);
				}
				
			}else{
				
			}
			
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);		
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("SpaceHumPower",0,0.5,'stop');
	
		}
		/*
		CreateStoolHit();
		CreateVentHit();
		
		*/
		private function CreateStoolHit():void{
			hit_stool = new Shape();
			hit_stool.touchable = false;
			hit_stool.graphics.beginFill(0xff0000);
			
			hit_stool.graphics.lineTo(422,324);			
			hit_stool.graphics.lineTo(489,329);			
			hit_stool.graphics.lineTo(495,459);			
			hit_stool.graphics.lineTo(412,450);			
			
			hit_stool.graphics.endFill(false);
			hit_stool.alpha = 0.0;
			
			hit_stool.graphics.precisionHitTest = true;	
			this.addChild(hit_stool);
		}
		
		private function CreateVentHit():void{
			hit_vent = new Shape();
			hit_vent.touchable = false;
			hit_vent.graphics.beginFill(0xff0000);
			
			hit_vent.graphics.lineTo(505,0);			
			hit_vent.graphics.lineTo(635,0);			
			hit_vent.graphics.lineTo(679,80);			
			hit_vent.graphics.lineTo(506,93);			
			hit_vent.graphics.lineTo(494,68);			
			
			hit_vent.graphics.endFill(false);
			hit_vent.alpha = 0.0;
			
			hit_vent.graphics.precisionHitTest = true;	
			this.addChild(hit_vent);
		}
		
		private function CreateOpenBookHit():void{
			hit_OpenBook = new Shape();
			hit_OpenBook.touchable = false;
			hit_OpenBook.graphics.beginFill(0xff0000);
			
			hit_OpenBook.graphics.lineTo(211,0);	
			hit_OpenBook.graphics.lineTo(585,0);	
			hit_OpenBook.graphics.lineTo(585,512);	
			hit_OpenBook.graphics.lineTo(211,512);	
			
			
			hit_OpenBook.graphics.endFill(false);
			hit_OpenBook.alpha = 0.0;
			
			hit_OpenBook.graphics.precisionHitTest = true;	
			this.addChild(hit_OpenBook);
		}
		private function CreateBookHit():void{
			hit_book = new Shape();
			hit_book.touchable = false;
			hit_book.graphics.beginFill(0xff0000);
			
			hit_book.graphics.lineTo(152,403);	
			hit_book.graphics.lineTo(318,395);	
			hit_book.graphics.lineTo(404,430);	
			hit_book.graphics.lineTo(413,463);	
			hit_book.graphics.lineTo(288,468);	
			hit_book.graphics.lineTo(155,433);	
		
			hit_book.graphics.endFill(false);
			hit_book.alpha = 0.0;
			
			hit_book.graphics.precisionHitTest = true;	
			this.addChild(hit_book);
		}
		
		private function CreateDeskHit():void{
			hit_desk = new Shape();
			hit_desk.touchable = false;
			hit_desk.graphics.beginFill(0xff0000);
			
			hit_desk.graphics.lineTo(438,257);	
			hit_desk.graphics.lineTo(453,177);	
			hit_desk.graphics.lineTo(649,112);	
			hit_desk.graphics.lineTo(796,128);	
			hit_desk.graphics.lineTo(795,335);	
			hit_desk.graphics.lineTo(438,304);	
						
			hit_desk.graphics.endFill(false);
			hit_desk.alpha = 0.0;
			
			hit_desk.graphics.precisionHitTest = true;	
			this.addChild(hit_desk);
		}
		
		private function CreateFridgeHit():void{
			hit_fridge = new Shape();
			hit_fridge.touchable = false;
			hit_fridge.graphics.beginFill(0xff0000);
			
			hit_fridge.graphics.lineTo(3,34);	
			hit_fridge.graphics.lineTo(150,62);	
			hit_fridge.graphics.lineTo(230,65);	
			hit_fridge.graphics.lineTo(443,46);	
			hit_fridge.graphics.lineTo(413,390);	
			hit_fridge.graphics.lineTo(163,353);	
			hit_fridge.graphics.lineTo(3,387);	
			
			hit_fridge.graphics.endFill(false);
			hit_fridge.alpha = 0.0;
			
			hit_fridge.graphics.precisionHitTest = true;	
			this.addChild(hit_fridge);
		}
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						if(BookIsOpen === false){
							trace(touches[0].globalX+" ,"+touches[0].globalY);
							if(targ == goback.SourceImage){
								
							//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((Lab as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.LabObj,false
								);
							}else if(hit_fridge.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((DeepLabFridge as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.DeepLabFridgeObj,true
								);
							}else if(hit_desk.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((DeepLabDesk as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.DeepLabDeskObj,true
								);
							}else if(hit_book.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								BookIsOpen = true;
								OpenBook(true, 0);
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab;
								}		
								SaveArray['Book'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLab',SaveArray);
								return;
							}else if(hit_vent.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A fume ventilation hood.");	
							}else if(hit_stool.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A stool");	
							}
						
						}else{
							if(targ == goback.SourceImage){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								trace("GoBackClick");
								RemoveBook();
								BookIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab;
								}		
								SaveArray['Book'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLab',SaveArray);
							}else if(hit_OpenBook.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.DeepLab;
								}
								if(openBookcurrentPage == 0){
									SaveArray['BookCurrentPage'] = 1;
									openBookcurrentPage = 1;
									openBookPages.texture = this.assets.getTexture('ChemistryBook_page_01');
								}else if(openBookcurrentPage == 1){
									SaveArray['BookCurrentPage'] = 2;
									openBookcurrentPage = 2;
									openBookPages.texture = this.assets.getTexture('ChemistryBook_page_02');
								}else if(openBookcurrentPage == 2){
									SaveArray['BookCurrentPage'] = 0;
									openBookcurrentPage = 0;
									openBookPages.texture = this.assets.getTexture('ChemistryBook_page_00');
								}
								
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('DeepLab',SaveArray);
							}
						}
					}
				}
			}
		}
		
		
		private function OpenBook(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openBook = new Sprite();
			openBook.alpha = 0;
			CreateOpenBookBg();
			openBookPages = new Image(this.assets.getTexture('ChemistryBook_page_00'));
			this.openBook.addChildAt(openBookbg,0);
			openBook.addChild(openBookPages);
			openBookPages.touchable = false;
			
			
			this.addChild(openBook);
			this.addChild(goback);
			
			if(openBookcurrentPage == 0){
				openBookPages.texture = this.assets.getTexture('ChemistryBook_page_00');
			}else if(openBookcurrentPage == 1){
				openBookPages.texture = this.assets.getTexture('ChemistryBook_page_01');
			}else if(openBookcurrentPage == 2){
				openBookPages.texture = this.assets.getTexture('ChemistryBook_page_02');
			}
			
			CreateOpenBookHit();
			//CreateOpenBookHit(openBookcurrentPage);
			
			if(Fade === false){
				Animating = false;
				openBook.alpha = 1;
				//	CreateOpenBookHit();
			}else{
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookDouble('elements_page_00','elements_page_01');
				
				OpenBookTween = new Tween(openBook, 0.5, Transitions.LINEAR);
				OpenBookTween.fadeTo(1);
				OpenBookTween.onComplete = function():void{
					Animating = false;
					//	CreateOpenNotePadHit();
				};
				Starling.juggler.add(OpenBookTween);	
				
			}
			//	CreateOpenBookHit(page);
		}
		private function RemoveBook():void{
			Animating = true;
			Starling.juggler.purge();
			OpenBookTween = new Tween(openBook, 0.5, Transitions.LINEAR);
			OpenBookTween.fadeTo(0);
			OpenBookTween.onComplete = function():void{
				hit_OpenBook.graphics.clear();
				Animating = false;
				CloseBook();
				
			};
			Starling.juggler.add(OpenBookTween);		
		}
		
		public function CloseBook():void{
			this.removeChild(openBook);
			openBook.dispose();
		}
		
		private function CreateOpenBookBg():void{
			openBookbg = new Shape();
			openBookbg.graphics.beginFill(0x000000);
			openBookbg.graphics.lineTo(0,0);	
			openBookbg.graphics.lineTo(800,0);	
			openBookbg.graphics.lineTo(800,512);	
			openBookbg.graphics.lineTo(0,512);	
			openBookbg.touchable = false;
			openBookbg.graphics.endFill(false);
			openBookbg.alpha = 0.5;
			//	openBookbg.graphics.precisionHitTest = true;				
			
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
			
			
			
			this.assets.removeTexture("deepLab_bg",true);
			this.assets.removeTexture("DeepLab_Sprite_01",true);
			this.assets.removeTextureAtlas("DeepLab_Sprite_01",true);
			this.assets.removeTexture("ChemistryBook_Sprite",true);
			this.assets.removeTextureAtlas("ChemistryBook_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("deepLab_01");
			(stage.getChildAt(0) as Object).falseAsset("deepLab_02");
			(stage.getChildAt(0) as Object).falseAsset("deepLab_03");
			(stage.getChildAt(0) as Object).falseAsset("deepLab_04");
			(stage.getChildAt(0) as Object).falseAsset("deepLab_05");
			
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