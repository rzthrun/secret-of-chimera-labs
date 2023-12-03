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
	
	
	public class BuildingOfficeBack extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var bookCase:Image;
		private var painting_on:Image;
		private var painting_off:Image;
		private var desk_case_on:Image;
		private var desk_case_off:Image;
		private var desk_chisel:Image;
		private var desk_book:Image;
		private var desk_stone:Image;
		
		private var case_orwell:Image;
		private var case_pos_0:Image;
		private var case_pos_1:Image;
		private var case_pos_2:Image;
		private var case_pos_3:Image;
		private var case_pos_4:Image;
		
		private var hit_book_case:Shape;
		private var hit_desk:Shape;
		private var hit_chalkBoard:Shape;
		private var hit_painting:Shape;
		private var hit_hidden:Shape;
		
		private var hit_ceiling:Shape;
		private var hit_books_one:Shape;
		private var hit_books_two:Shape;
		private var hit_books_three:Shape;
		private var hit_books_fours:Shape;
		private var hit_lion:Shape;
		private var hit_floor:Shape;
	//	private var hit_shelf:Shape;
		private var hit_rug:Shape;
		
		private var BookCaseOpen:Boolean = false;
		private var BookCaseUnlocked:Boolean = false;
		
		private var RONum:int = 0;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function BuildingOfficeBack(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('buildingOfficeBack_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeBack/buildingOfficeBack_bg.jpg'));
				game.TrackAssets('buildingOfficeBack_01');
			}
			if(game.CheckAsset('buildingOfficeBack_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeBack/BuildingOfficeBack_Sprite_001.png'));
				game.TrackAssets('buildingOfficeBack_02');
			}
			if(game.CheckAsset('buildingOfficeBack_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeBack/BuildingOfficeBack_Sprite_001.xml'));
				game.TrackAssets('buildingOfficeBack_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BuildingOfficeBack","BuildingOfficeBackObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
	
			
			bg = new Image(this.assets.getTexture('buildingOfficeBack_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			/*
			private var bookCase:Image;
			private var painting_on:Image;
			private var painting_off:Image;
			private var desk_case_on:Image;
			private var desk_case_off:Image;
			private var desk_chisel:Image;
			
			*/
			
			bookCase = new Image(this.assets.getTexture('bookcase_open'));
			bookCase.touchable = false;
			bookCase.x = 559;
			bookCase.y = 62;			
			
			painting_on = new Image(this.assets.getTexture('painting_on'));
			painting_on.touchable = false;
			painting_on.x = 12;
			painting_on.y = 68;
			
			painting_off = new Image(this.assets.getTexture('painting_off'));
			painting_off.touchable = false;
			painting_off.x = 9;
			painting_off.y = 58;
					
			desk_case_on = new Image(this.assets.getTexture('desk_case_off'));
			desk_case_on.touchable = false;
			desk_case_on.x = 309;
			desk_case_on.y = 254;
			
			desk_case_off = new Image(this.assets.getTexture('desk_case_open'));
			desk_case_off.touchable = false;
			desk_case_off.x = 301;
			desk_case_off.y = 191;
			
			desk_chisel = new Image(this.assets.getTexture('desk_chisel'));
			desk_chisel.touchable = false;
			desk_chisel.x = 450;
			desk_chisel.y = 272;
			
			desk_book = new Image(this.assets.getTexture('desk_book'));
			desk_book.touchable = false;
			desk_book.x = 396;
			desk_book.y = 246;
			
			desk_stone = new Image(this.assets.getTexture('desk_stone'));
			desk_stone.touchable = false;
			desk_stone.x = 327;
			desk_stone.y = 259;
						
			case_orwell = new Image(this.assets.getTexture('case_orwell'));
			case_orwell.touchable = false;
			case_orwell.x = 613;
			case_orwell.y = 140;
			
			case_pos_0 = new Image(this.assets.getTexture('case_pos_0'));
			case_pos_0.touchable = false;
			case_pos_0.x = 611;
			case_pos_0.y = 140;
			
			case_pos_1 = new Image(this.assets.getTexture('case_pos_1'));
			case_pos_1.touchable = false;
			case_pos_1.x = 619;
			case_pos_1.y = 140;
			
			case_pos_2 = new Image(this.assets.getTexture('case_pos_2'));
			case_pos_2.touchable = false;
			case_pos_2.x = 627;
			case_pos_2.y = 140;
			
			case_pos_3 = new Image(this.assets.getTexture('case_pos_3'));
			case_pos_3.touchable = false;
			case_pos_3.x = 635;
			case_pos_3.y = 140;
			
			case_pos_4 = new Image(this.assets.getTexture('case_pos_4'));
			case_pos_4.touchable = false;
			case_pos_4.x = 644;
			case_pos_4.y = 140;
			/*	
			
			private var desk_case_orwell:Image;
			private var case_pos_0:Image;
			private var case_pos_1:Image;
			private var desk_case_pos_2:Image;
			private var desk_case_pos_3:Image;
			private var desk_case_pos_4:Image;
			*/
			
		
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['OrwellStraight'] == 'Yes'){
					case_orwell.alpha = 0;
				}else{
					case_orwell.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_0'] != undefined){
					case_pos_0.alpha = 1;
				}else{
					case_pos_0.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_1'] != undefined){
					case_pos_1.alpha = 1;
				}else{
					case_pos_1.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_2'] != undefined){
					case_pos_2.alpha = 1;
				}else{
					case_pos_2.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_3'] != undefined){
					case_pos_3.alpha = 1;
				}else{
					case_pos_3.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['pos_4'] != undefined){
					case_pos_4.alpha = 1;
				}else{
					case_pos_4.alpha = 0;
				}
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBookCase['Solved'] == 'Yes'){
					BookCaseUnlocked = true;
				}
			}else{
				case_orwell.alpha = 1;
				case_pos_0.alpha = 0;
				case_pos_1.alpha = 0;
				case_pos_2.alpha = 0;
				case_pos_3.alpha = 0;
				case_pos_4.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBack != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBack['bookcase'] == 'open'){
					BookCaseOpen = true;
					CreateHiddenHit();
					bookCase.alpha = 1;
					case_orwell.alpha = 0;
					case_pos_0.alpha = 0;
					case_pos_1.alpha = 0;
					case_pos_2.alpha = 0;
					case_pos_3.alpha = 0;
					case_pos_4.alpha = 0;
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBack['bookcase'] == 'closed'){	
					bookCase.alpha = 0;
					case_orwell.alpha = 0;
					case_pos_0.alpha = 1;
					case_pos_1.alpha = 1;
					case_pos_2.alpha = 1;
					case_pos_3.alpha = 1;
					case_pos_4.alpha = 1;
				}else{
					bookCase.alpha = 0;
					
					if(BookCaseUnlocked === true){
						BookCaseOpen = true;
						CreateHiddenHit();
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBack != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBack;	
						}
						
						SaveArray['bookcase'] = 'open';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBack',SaveArray);
						
						Animating = true;
						Starling.juggler.delayCall(function():void{
							UnlockCase();
							
						},2.5);		
					}
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBack['FirstTime'] == 'Yes'){
					
					}else{	
						if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBack != undefined){	
								SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBack;	
							}
							SaveArray['FirstTime'] = 'Yes';
							
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBack',SaveArray);
							
							Starling.juggler.delayCall(function():void{
								(stage.getChildAt(0) as Object).MusicObj.LoadCharmsSoft(true,4);
								//(stage.getChildAt(0) as Object).MusicObj.LoadMouseTrap(true,3);
								
							},0.5);
						}
					}
				}
				
			}else{
				
				bookCase.alpha = 0;
				if(BookCaseUnlocked === true){
					BookCaseOpen = true;
					CreateHiddenHit();
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBack != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBack;	
					}
					
					SaveArray['bookcase'] = 'open';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBack',SaveArray);
					
					Animating = true;
					Starling.juggler.delayCall(function():void{
						
						UnlockCase();
						
					},2);		
				}
				
				
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBack != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeBack;	
						}
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeBack',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadCharmsSoft(true,4);
							//(stage.getChildAt(0) as Object).MusicObj.LoadMouseTrap(true,3);
							
						},0.5);
				}
				//}
			}
			
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficePainting['Painting'] == 'Open'){
					painting_on.alpha = 0;
					painting_off.alpha = 1;
				}else{
					painting_on.alpha = 1;
					painting_off.alpha = 0;
				}
			}else{
				painting_on.alpha = 1;
				painting_off.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable['Stone'] == 'PickedUp'){	
					desk_stone.alpha = 0;
				}else{
					desk_stone.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable['Case'] == 'Open'){	
					desk_case_on.alpha = 0;
					desk_case_off.alpha = 1;
				}else{
					desk_case_on.alpha = 1;
					desk_case_off.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable['Book'] == 'PickedUp'){	
					desk_book.alpha = 0;
				}else{
					desk_book.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeTable['Chisel'] == 'PickedUp'){	
					desk_chisel.alpha = 0;
				}else{
					desk_chisel.alpha = 1;
				}
			}else{
				desk_case_on.alpha = 1;
				desk_case_off.alpha = 0;
				desk_chisel.alpha = 1;
				desk_book.alpha = 1;
				desk_stone.alpha = 1;
			}
			
			
			
			
			this.addChildAt(bookCase,1);
			this.addChildAt(painting_on,2);
			this.addChildAt(painting_off,3);
			this.addChildAt(desk_stone,4);
			this.addChildAt(desk_case_on,5);
			this.addChildAt(desk_case_off,6);
			this.addChildAt(desk_chisel,7);
			this.addChildAt(desk_book,8);
			this.addChildAt(case_orwell,9);
			this.addChildAt(case_pos_0,10);
			this.addChildAt(case_pos_1,11);
			this.addChildAt(case_pos_2,12);
			this.addChildAt(case_pos_3,13);
			this.addChildAt(case_pos_4,14);
		
			CreateCeilingHit();
			CreateBookOneHit();
			CreateBookTwoHit();
			CreateBookThreeHit();
			CreateBookFourHit();
			CreateLionHit();
			CreateFloorHit();
			CreateRugHit();
			
			CreateDeskHit();
			CreateChalkBoardHit();
			CreatePaintingHit();
			CreateBookCaseHit(BookCaseOpen);
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadBasementBongs(true,999);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
		}
		
		private function UnlockCase():void{
			
		//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HeavyStoneDrag();
	//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CreakyDoorTwo();
			
			bookCase.alpha = 1;
			case_orwell.alpha = 0;
			case_pos_0.alpha = 0;
			case_pos_1.alpha = 0;
			case_pos_2.alpha = 0;
			case_pos_3.alpha = 0;
			case_pos_4.alpha = 0;
			Animating = false;
		}
		//hit_ceiling
		
		private function CreateRugHit():void{
			hit_rug = new Shape();
			
			hit_rug.graphics.beginFill(0x0000FF);			
		//	hit_rug.graphics.lineTo(0,0);	
			
			hit_rug.graphics.lineTo(122,383);	
			hit_rug.graphics.lineTo(569,310);	
			hit_rug.graphics.lineTo(671,325);	
			hit_rug.graphics.lineTo(452,484);	
							
			hit_rug.graphics.endFill(false);
			hit_rug.alpha = 0.0;
			hit_rug.touchable = false;
			hit_rug.graphics.precisionHitTest = true;	
			
			this.addChild(hit_rug);
		}
		
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			
			hit_floor.graphics.beginFill(0x0000FF);			
		//	hit_floor.graphics.lineTo(0,0);	
			
			hit_floor.graphics.lineTo(70,398);	
			hit_floor.graphics.lineTo(120,382);	
			hit_floor.graphics.lineTo(596,451);	
			hit_floor.graphics.lineTo(598,510);	
			hit_floor.graphics.lineTo(85,506);	
			
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			hit_floor.touchable = false;
			hit_floor.graphics.precisionHitTest = true;	
			
			this.addChild(hit_floor);
		}
		
		private function CreateLionHit():void{
			hit_lion = new Shape();
			
			hit_lion.graphics.beginFill(0x0000FF);			
		//hit_lion.graphics.lineTo(0,0);	
			
			hit_lion.graphics.lineTo(676,204);	
			hit_lion.graphics.lineTo(695,173);	
			hit_lion.graphics.lineTo(726,172);	
			hit_lion.graphics.lineTo(797,235);	
			hit_lion.graphics.lineTo(796,345);	
			hit_lion.graphics.lineTo(685,321);	
			hit_lion.graphics.lineTo(684,303);	
			hit_lion.graphics.lineTo(721,275);	
			hit_lion.graphics.lineTo(713,239);	
			hit_lion.graphics.lineTo(685,234);	
						
			hit_lion.graphics.endFill(false);
			hit_lion.alpha = 0.0;
			hit_lion.touchable = false;
			hit_lion.graphics.precisionHitTest = true;	
			
			this.addChild(hit_lion);
		}
		
		private function CreateBookFourHit():void{
			hit_books_fours = new Shape();
			
			hit_books_fours.graphics.beginFill(0x0000FF);			
		//	hit_books_fours.graphics.lineTo(0,0);	
			
			hit_books_fours.graphics.lineTo(433,394);	
			hit_books_fours.graphics.lineTo(459,364);	
			hit_books_fours.graphics.lineTo(530,369);	
			hit_books_fours.graphics.lineTo(560,330);	
			hit_books_fours.graphics.lineTo(596,341);	
			hit_books_fours.graphics.lineTo(609,388);	
			hit_books_fours.graphics.lineTo(590,439);	
			hit_books_fours.graphics.lineTo(464,424);	
			
		
			hit_books_fours.graphics.endFill(false);
			hit_books_fours.alpha = 0.0;
			hit_books_fours.touchable = false;
			hit_books_fours.graphics.precisionHitTest = true;	
			
			this.addChild(hit_books_three);
		}
		
		private function CreateBookThreeHit():void{
			hit_books_three = new Shape();
			
			hit_books_three.graphics.beginFill(0x0000FF);			
		//	hit_books_three.graphics.lineTo(0,0);	
			
			hit_books_three.graphics.lineTo(325,340);	
			hit_books_three.graphics.lineTo(380,336);	
			hit_books_three.graphics.lineTo(391,353);	
			hit_books_three.graphics.lineTo(395,426);	
			hit_books_three.graphics.lineTo(313,422);	
		
			hit_books_three.graphics.endFill(false);
			hit_books_three.alpha = 0.0;
			hit_books_three.touchable = false;
			hit_books_three.graphics.precisionHitTest = true;	
			
			this.addChild(hit_books_three);
		}
		private function CreateBookTwoHit():void{
			hit_books_two = new Shape();
			
			hit_books_two.graphics.beginFill(0x0000FF);			
		//	hit_books_two.graphics.lineTo(0,0);	
			
			hit_books_two.graphics.lineTo(156,273);	
			hit_books_two.graphics.lineTo(193,274);	
			hit_books_two.graphics.lineTo(199,186);	
			hit_books_two.graphics.lineTo(235,193);	
			hit_books_two.graphics.lineTo(286,248);	
			hit_books_two.graphics.lineTo(291,385);	
			hit_books_two.graphics.lineTo(215,382);	
			hit_books_two.graphics.lineTo(151,354);	
					
			hit_books_two.graphics.endFill(false);
			hit_books_two.alpha = 0.0;
			hit_books_two.touchable = false;
			hit_books_two.graphics.precisionHitTest = true;	
			
			this.addChild(hit_books_two);
		}
		
		private function CreateBookOneHit():void{
			hit_books_one = new Shape();
			
			hit_books_one.graphics.beginFill(0x0000FF);			
		//	hit_books_one.graphics.lineTo(0,0);	
			
			hit_books_one.graphics.lineTo(0,212);	
			hit_books_one.graphics.lineTo(92,238);	
			hit_books_one.graphics.lineTo(106,354);	
			hit_books_one.graphics.lineTo(61,398);	
			hit_books_one.graphics.lineTo(0,398);	
		
			hit_books_one.graphics.endFill(false);
			hit_books_one.alpha = 0.0;
			hit_books_one.touchable = false;
			hit_books_one.graphics.precisionHitTest = true;	
			
			this.addChild(hit_books_one);
		}
		private function CreateCeilingHit():void{
			hit_ceiling = new Shape();
			
			hit_ceiling.graphics.beginFill(0x0000FF);			
		//	hit_ceiling.graphics.lineTo(0,0);	
			hit_ceiling.graphics.lineTo(685,0);	
			hit_ceiling.graphics.lineTo(685,39);	
			hit_ceiling.graphics.lineTo(236,67);	
			hit_ceiling.graphics.lineTo(0,39);	
			
			hit_ceiling.graphics.endFill(false);
			hit_ceiling.alpha = 0.0;
			hit_ceiling.touchable = false;
			hit_ceiling.graphics.precisionHitTest = true;	
			
			this.addChild(hit_ceiling);
		}
		
		private function CreateHiddenHit():void{
			hit_hidden = new Shape();
			this.addChild(hit_hidden);
			hit_hidden.graphics.beginFill(0x0000FF);
			hit_hidden.graphics.lineTo(571,88);	
			hit_hidden.graphics.lineTo(643,85);	
			hit_hidden.graphics.lineTo(626,312);	
			hit_hidden.graphics.lineTo(565,291);	
			
			hit_hidden.graphics.endFill(false);
			hit_hidden.alpha = 0.0;
			hit_hidden.touchable = false;
			hit_hidden.graphics.precisionHitTest = true;	
		}
		
		private function CreateDeskHit():void{
			hit_desk = new Shape();
			this.addChild(hit_desk);
			hit_desk.graphics.beginFill(0x0000FF);
			hit_desk.graphics.lineTo(293,276);	
			hit_desk.graphics.lineTo(306,240);	
			hit_desk.graphics.lineTo(421,181);	
			hit_desk.graphics.lineTo(514,189);	
			hit_desk.graphics.lineTo(545,250);	
			hit_desk.graphics.lineTo(528,316);	
			hit_desk.graphics.lineTo(314,307);	
			
			hit_desk.graphics.endFill(false);
			hit_desk.alpha = 0.0;
			hit_desk.touchable = false;
			hit_desk.graphics.precisionHitTest = true;	
		}
		private function CreateChalkBoardHit():void{
			hit_chalkBoard = new Shape();
			this.addChild(hit_chalkBoard);
			hit_chalkBoard.graphics.beginFill(0x0000FF);
			hit_chalkBoard.graphics.lineTo(200,105);	
			hit_chalkBoard.graphics.lineTo(388,113);	
			hit_chalkBoard.graphics.lineTo(391,193);	
			hit_chalkBoard.graphics.lineTo(331,234);	
			hit_chalkBoard.graphics.lineTo(255,236);	
			hit_chalkBoard.graphics.lineTo(240,192);	
			hit_chalkBoard.graphics.lineTo(203,192);			
			hit_chalkBoard.graphics.endFill(false);
			hit_chalkBoard.alpha = 0.0;
			hit_chalkBoard.touchable = false;
			hit_chalkBoard.graphics.precisionHitTest = true;	
		}
		
		private function CreatePaintingHit():void{
			hit_painting = new Shape();
			this.addChild(hit_painting);
			hit_painting.graphics.beginFill(0x0000FF);
			
			hit_painting.graphics.lineTo(0,50);	
			hit_painting.graphics.lineTo(168,76);	
			hit_painting.graphics.lineTo(161,201);	
			hit_painting.graphics.lineTo(0,208);	
				
			hit_painting.graphics.endFill(false);
			hit_painting.alpha = 0.0;
			hit_painting.touchable = false;
			hit_painting.graphics.precisionHitTest = true;	
		}
		
		private function CreateBookCaseHit(open:Boolean = false):void{
			hit_book_case = new Shape();		
			hit_book_case.x = 0;
			hit_book_case.y = 0;
			hit_book_case.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				hit_book_case.graphics.lineTo(573,85);					
				hit_book_case.graphics.lineTo(672,84);					
				hit_book_case.graphics.lineTo(690,103);					
				hit_book_case.graphics.lineTo(683,186);					
				hit_book_case.graphics.lineTo(673,211);					
				hit_book_case.graphics.lineTo(681,236);					
				hit_book_case.graphics.lineTo(678,307);					
				hit_book_case.graphics.lineTo(567,295);					
										
			}else{
				
				hit_book_case.graphics.lineTo(650,80);
				hit_book_case.graphics.lineTo(683,76);
				hit_book_case.graphics.lineTo(710,126);
				hit_book_case.graphics.lineTo(676,207);
				hit_book_case.graphics.lineTo(671,322);
				hit_book_case.graphics.lineTo(636,318);
				
			}				
			hit_book_case.graphics.endFill(false);			
			hit_book_case.alpha = 0.0;			
			hit_book_case.graphics.precisionHitTest = true;	
			hit_book_case.touchable = false
			this.addChild(hit_book_case);
			
			
		}
		/*
		
		private var hit_book_case:Shape;
		private var hit_desk:Shape;
		private var hit_chalkBoard:Shape;
		private var hit_painting:Shape;
		
		*/
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((BuildingOffice as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeObj,false
							);
							return;
						}else if(hit_book_case.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							BookCaseHandler();
							return;
						}else if(hit_desk.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((BuildingOfficeTable as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeTableObj,true
							);
							return;
						}else if(hit_chalkBoard.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((BuildingOfficeChalkboard as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeChalkboardObj,true
							);
							return;
						}else if(hit_painting.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((BuildingOfficePainting as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficePaintingObj,true
							);
							return;
						}else if(hit_ceiling.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Dim florescent lights hang above.");	
							return;	
						}else if(hit_books_one.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(RONum == 0){
								BooksHandler();									
							}else{
								BooksHandlerOne();				
							}
							return;	
						}else if(hit_books_two.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(RONum == 2){
								BooksHandlerOne();									
							}else{
								BooksHandler();				
							}
							return;		
						}else if(hit_books_three.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(RONum == 1){
								BooksHandler();
							}else{
								BooksHandlerOne();							
							}
							return;		
						}else if(hit_books_fours.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(RONum == 0){
								BooksHandlerOne();
							}else{
								BooksHandler();
							}
							return;
				
						}else if(hit_lion.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							LionHandler();
							return;	
						}else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FloorHandler();
							return;	
						
						}else if(hit_rug.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							RugHandler();
							return;				
						}else if(BookCaseOpen === true){
							if(hit_hidden.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((Lift as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.LiftObj,false
								);
							}
						}
					}
				}
			}
		}
		private function RugHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The rug is made of intricately woven fine threads.");			
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The rug smells of coffee and tea - no doubt from many spilt cups...'");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A fine and well worn rug lays on the floor.");			
			}
		}
		
		private function FloorHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The floor is made of large slabs of rough, poured concrete.");			
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The ground is cold to the touch.");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Large slabs of rough poured concrete form the room's flooring.");			
			}
		}
		
		private function LionHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A skeleton of a large feline... or cat.");			
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A small plaque reads 'Smilodon, c. 55 mya.'");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The bones have fossilized and turned to stone.");
				
			}
		}
		
		private function BooksHandlerOne():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("All of the books seem to be well used and well read.");			
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are old writings by forgotten scribes mixed among pulp comics and college text-books.");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Some of the books are written in strange languages I cannot recognize...");
				
			}
		}
		
		private function BooksHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There are books everywhere.");			
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Many of the books are very old, even ancient. Some look quite new however.");				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Many of the books are on making things, from ancient alchemical antibiotics to zinc zeppelin zippers.");
			}
		}
		
		private function BookCaseHandler():void{
			if(BookCaseUnlocked === false){
				FadeOut((BuildingOfficeBookCase as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeBookCaseObj,true
				);
			}else{
				if(BookCaseOpen === false){
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerOpen();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HeavyStoneDrag();
				
					BookCaseOpen = true;
					bookCase.alpha = 1;
					case_orwell.alpha = 0;
					case_pos_0.alpha = 0;
					case_pos_1.alpha = 0;
					case_pos_2.alpha = 0;
					case_pos_3.alpha = 0;
					case_pos_4.alpha = 0;
					
					hit_book_case._graphics.clear();
					CreateHiddenHit();
					CreateBookCaseHit(true);

				}else{
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_DrawerClose();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HeavyStoneDrag();
					BookCaseOpen = false;
					bookCase.alpha = 0;
					case_orwell.alpha = 0;
					case_pos_0.alpha = 1;
					case_pos_1.alpha = 1;
					case_pos_2.alpha = 1;
					case_pos_3.alpha = 1;
					case_pos_4.alpha = 1;
					hit_hidden._graphics.clear();
					hit_book_case._graphics.clear();
					CreateBookCaseHit(false);
				}
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
			
			
			
			this.assets.removeTexture("buildingOfficeBack_bg",true);
			this.assets.removeTexture("BuildingOfficeBack_Sprite_001",true);
			this.assets.removeTextureAtlas("BuildingOfficeBack_Sprite_001",true);
			
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeBack_01");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeBack_02");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeBack_03");
			
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
