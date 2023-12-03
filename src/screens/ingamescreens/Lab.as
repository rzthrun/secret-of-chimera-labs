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
	
	public class Lab extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var delayedCall:DelayedCall;
		
		private var door_storage:Image;
		private var door_genetics:Image;
		private var door_storage_light:Image;
		private var door_genetics_light:Image;
		
		private var desk_screen:Image;
		private var desk_syringe:Image;
		private var desk_tube:Image;
		
		private var asteroid_sprite:Sprite;
		private var asteroid:Image;
		private var asteroid_pos_00:Image;
		private var asteroid_pos_02:Image;
		private var asteroid_pos_04:Image;
		private var asteroid_pos_ball:Image;
		private var asteroid_lit:Image;
		
		private var broken_asteroid_sprite:Sprite;
		private var broken_00:Image;
		private var broken_01:Image;
		private var broken_02:Image;
		private var broken_pearl:Image;
		private var broken_debris:Image;
	//	private var hit_elevator_door:Shape;
		
		private var hit_genetics:Shape;
		private var hit_asteriord:Shape;
		private var hit_desk:Shape;
		private var hit_door:Shape;
		private var hit_printout:Shape;
		
		private var openLetter:Sprite;
		private var openLetterPages:Image;
		private var hit_openLetter:Shape;
		public var OpenLetterTween:Tween;
		
		private var openBookbg:Shape;
		
		private var LetterIsOpen:Boolean = false;
		
		private var Animating:Boolean = false;
		private var GeneticsOpen:Boolean = false;
		private var StorageOpen:Boolean = false;
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function Lab(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('lab_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Lab/lab_bg.jpg'));
				game.TrackAssets('lab_01');
			}
			if(game.CheckAsset('lab_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Lab/Printout_Sprite_01.png'));
				game.TrackAssets('lab_02');
			}
			if(game.CheckAsset('lab_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Lab/Printout_Sprite_01.xml'));
				game.TrackAssets('lab_03');
			}
			if(game.CheckAsset('lab_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Lab/Lab_Sprite_01.png'));
				game.TrackAssets('lab_04');
			}
			if(game.CheckAsset('lab_05') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Lab/Lab_Sprite_01.xml'));
				game.TrackAssets('lab_05');
			}
			//Printout_Sprite_01
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("Lab","LabObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
	//		if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){	
	//			SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle;	
	//		}
		//	SaveArray["ring_01_pos"] = 0;
		//	SaveArray["ring_02_pos"] = 0;
		//	SaveArray["ring_03_pos"] = 0;
		//	SaveArray["ring_04_pos"] = 0;
	//		SaveArray['Solved'] = "No";
	//		(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabAsteriodPuzzle',SaveArray);
	//		SaveArray = null;
			
	//		if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod != undefined){	
	//			SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod;	
	//		}
			
	//		SaveArray['AsteroidBroken'] = "No";
	//		(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('LabAsteriod',SaveArray);			
	//		SaveArray = null;
			
			
			bg = new Image(this.assets.getTexture('lab_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			door_storage= new Image(this.assets.getTexture('storage_door_locked'));			
			door_storage.touchable = false;
			door_storage.x = 546;
			door_storage.y = 146;
			
			door_genetics= new Image(this.assets.getTexture('genetics_door'));			
			door_genetics.touchable = false;
			door_genetics.x = 729;
			door_genetics.y = 101;
			
			door_storage_light = new Image(this.assets.getTexture('light_storage'));			
			door_storage_light.touchable = false;
			door_storage_light.x = 587;
			door_storage_light.y = 140;
			
			door_genetics_light = new Image(this.assets.getTexture('light_genetics'));			
			door_genetics_light.touchable = false;
			door_genetics_light.x = 746;
			door_genetics_light.y = 97;
			
			
			
			desk_screen = new Image(this.assets.getTexture('desk_screen'));			
			desk_screen.touchable = false;
			desk_screen.x = 394;
			desk_screen.y = 248;
						
			desk_syringe = new Image(this.assets.getTexture('desk_syringe'));			
			desk_syringe.touchable = false;
			desk_syringe.x = 499;
			desk_syringe.y = 287;			
			
			desk_tube = new Image(this.assets.getTexture('desk_tube'));			
			desk_tube.touchable = false;
			desk_tube.x = 477;
			desk_tube.y = 241;
			
		
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab['GeneticsOpen'] == 'Yes'){	
					GeneticsOpen = true;
					door_genetics.alpha = 0;
					door_genetics_light.alpha = 1;
				}else{
					door_genetics.alpha = 1;
					door_genetics_light.alpha = 0;
				}
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lab',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadCharmsSoft(true,2);
							
						},0.5);
					}
				}
				
			}else{
				door_genetics.alpha = 1;
				door_genetics_light.alpha = 0;
				
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
				//	SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab;
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lab',SaveArray);
						
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadCharmsSoft(true,2);
						
					},0.5);
				}
				
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDoor != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDoor['Melted'] == 'Yes'){	
					door_storage.texture = this.assets.getTexture('storage_door_unlocked');
					door_storage.alpha = 1;
					
					door_storage_light.alpha = 0;
				}else{
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDoor['Door'] == 'Open'){	
					StorageOpen = true;
					door_storage.alpha = 0;					
					door_storage_light.alpha =1;
				}else{
					door_storage.alpha = 1;
					
					door_storage_light.alpha = 0;
					
				}
			}else{
				door_storage.alpha = 1;
				
				door_storage_light.alpha = 0;
				
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk['Syringe'] == "PickedUp"){
					desk_syringe.alpha = 0;
				}else{
					desk_syringe.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk['ComputerOn'] == "Yes"){
					desk_screen.alpha = 1;	
				}else{
					desk_screen.alpha = 0;	
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk['TubeAttached'] == "Yes"){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk['TubeFull'] == "Yes"){
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabDesk['TubePickedUp'] == "Yes"){	
							
							desk_tube.alpha = 0;
						}else{
							desk_tube.texture = this.assets.getTexture('desk_blue');
							desk_tube.alpha = 1;
						}
						
					}else{
						desk_tube.alpha = 1;
					}
					
				}else{
					
					desk_tube.alpha = 0;
				}
			}else{
				desk_screen.alpha = 0;	
				desk_syringe.alpha = 1;
				
				desk_tube.alpha = 0;
			}
			
		
			this.addChildAt(door_storage,1);
			this.addChildAt(door_genetics,2);
			this.addChildAt(door_storage_light,3);
			this.addChildAt(door_genetics_light,4);
			this.addChildAt(desk_screen,5);
			this.addChildAt(desk_syringe,6);
			this.addChildAt(desk_tube,7);
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod['AsteroidBroken'] == 'Yes'){	
					CreateBrokenAsteroidSprite(true);
				}else{
					CreateAsteroidSprite();
				}
			}else{
				CreateAsteroidSprite();
			}
		
			
			
			CreateGeneticsHit();
			CreateAsteriodHit();
			CreateDeskHit();
			CreateDoorHit();
			CreatePrintOutHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab['Letter'] == 'open'){
					LetterIsOpen = true;
					OpenLetter(false);
					this.addChild(goback);
				}
			}
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriod['AsteroidBroken'] == 'Yes'){	
					this.addEventListener(Event.ENTER_FRAME, BrokenAnimation);
				}else{
				
					this.addEventListener(Event.ENTER_FRAME, AsteriodAnimation);
				}
			}else{
				this.addEventListener(Event.ENTER_FRAME, AsteriodAnimation);
			}
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);			
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).AmbientObj.LoadSpaceHumPower(true,999);
				
			},0.5);
			delayedCall = new DelayedCall(LoadDrone,1);
			
		}
		private function LoadDrone():void{
			Starling.juggler.delayCall(function():void{
				(stage.getChildAt(0) as Object).AmbientObj.LoadDrone(true,999);
			},0.5);
		}
		
		private function AsteriodAnimation():void{
			var currentDate:Date = new Date();
			asteroid_sprite.y = 137+ (Math.cos(currentDate.getTime()*0.0025)*3);
			//asteriodSprite.x = 250+ (Math.sin(currentDate.getTime()*0.002)*3);
		}
		private function BrokenAnimation():void{
			var currentDate:Date = new Date();
			broken_debris.y = -7- (Math.cos(currentDate.getTime()*0.0025)*1);
			broken_00.y = -10+(Math.cos(currentDate.getTime()*0.0025)*1);
			broken_01.y = -10 - (Math.cos(currentDate.getTime()*0.0025)*2);
			broken_02.y = 42 + (Math.cos(currentDate.getTime()*0.0025)*3);
			//asteriodSprite.x = 250+ (Math.sin(currentDate.getTime()*0.002)*3);
		}
		private function CreateBrokenAsteroidSprite(PearlPickedUp:Boolean = false):void{
			broken_asteroid_sprite = new Sprite();
			broken_asteroid_sprite.touchable = false;
			broken_asteroid_sprite. x = 219;
			broken_asteroid_sprite. y = 137;
			
			broken_debris = new Image(this.assets.getTexture('asteroid_debris'));			
			broken_debris.touchable = false;
			broken_debris.x = 8;
			broken_debris.y = -7;
			
			broken_00 = new Image(this.assets.getTexture('asteroid_broken_00'));			
			broken_00.touchable = false;
			broken_00.x = 23;
			broken_00.y = -10;
			
			broken_01 = new Image(this.assets.getTexture('asteroid_broken_01'));			
			broken_01.touchable = false;
			broken_01.x = 0;
			broken_01.y = -10;
			
			broken_02 = new Image(this.assets.getTexture('asteroid_broken_02'));			
			broken_02.touchable = false;
			broken_02.x = -10;
			broken_02.y = 42;
			
			
			broken_pearl = new Image(this.assets.getTexture('asteroid_pearl'));			
			broken_pearl.touchable = false;
			broken_pearl.x = 38;
			broken_pearl.y = 28;
			
			
			broken_debris.alpha = 1;
			broken_00.alpha = 1;
			broken_01.alpha = 1;
			broken_02.alpha = 1;
			
			if(PearlPickedUp === true){
				broken_pearl.alpha = 0;
				
			}else{
				broken_pearl.alpha = 1;
				
			}
		
			broken_asteroid_sprite.addChildAt(broken_debris,0);
			broken_asteroid_sprite.addChildAt(broken_00,1);
			broken_asteroid_sprite.addChildAt(broken_01,2);
			broken_asteroid_sprite.addChildAt(broken_02,3);
			broken_asteroid_sprite.addChildAt(broken_pearl,4);
			
			broken_asteroid_sprite.alpha = 1;

			/*
			private var broken_asteroid_sprite:Sprite;
			private var :Image;
			private var broken_01:Image;
			private var broken_02:Image;
			private var :Image;
			private var broken_debris:Image;
			*/
			this.addChild(broken_asteroid_sprite);
			
		}	
		private function CreateAsteroidSprite():void{
			asteroid_sprite = new Sprite();
			asteroid_sprite.touchable = false;
			asteroid_sprite. x = 219;
			asteroid_sprite. y = 137;
			
			asteroid = new Image(this.assets.getTexture('asteriod_asteroid'));			
			asteroid.touchable = false;
			asteroid.x = 0;
			asteroid.y = 0;
			
			asteroid_pos_00 = new Image(this.assets.getTexture('asteriod_pos_00'));			
			asteroid_pos_00.touchable = false;
			asteroid_pos_00.x = 56;
			asteroid_pos_00.y = 12;
			
			asteroid_pos_02 = new Image(this.assets.getTexture('asteriod_pos_02'));			
			asteroid_pos_02.touchable = false;
			asteroid_pos_02.x = 32;
			asteroid_pos_02.y = 28;
						
			asteroid_pos_04 = new Image(this.assets.getTexture('asteriod_pos_04'));			
			asteroid_pos_04.touchable = false;
			asteroid_pos_04.x = 65;
			asteroid_pos_04.y = 18;
			
			asteroid_pos_ball = new Image(this.assets.getTexture('asteriod_pos_ball'));			
			asteroid_pos_ball.touchable = false;
			asteroid_pos_ball.x = 54;
			asteroid_pos_ball.y = 34;
			
			asteroid_lit = new Image(this.assets.getTexture('asteroid_lit'));			
			asteroid_lit.touchable = false;
			asteroid_lit.x = 33;
			asteroid_lit.y = 11;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle != undefined){
				trace(":00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['RingsActive'] == 'Yes'){
					asteroid_pos_00.alpha = 0;			
					asteroid_pos_02.alpha = 0;			
					asteroid_pos_04.alpha = 0;			
					asteroid_pos_ball.alpha = 0;			
					asteroid_lit.alpha = 1;
				}else{
				
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece00Attached'] == 'Yes'){
						asteroid_pos_00.alpha = 1;
					}else{
						asteroid_pos_00.alpha = 0;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece02Attached'] == 'Yes'){
						asteroid_pos_02.alpha = 1;
					}else{
						asteroid_pos_02.alpha = 0;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['Piece04Attached'] == 'Yes'){
						asteroid_pos_04.alpha = 1;
					}else{
						asteroid_pos_04.alpha = 0;
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['PieceBallAttached'] == 'Yes'){
						asteroid_pos_ball.alpha = 1;							
					}else{
						asteroid_pos_ball.alpha = 0;	
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.LabAsteriodPuzzle['RingsActive'] == 'Yes'){
						asteroid_lit.alpha = 1;
					}else{
						asteroid_lit.alpha = 0;
					}
					
				}
			}else{				
				
				
				asteroid_pos_00.alpha = 0;			
				asteroid_pos_02.alpha = 0;			
				asteroid_pos_04.alpha = 0;			
				asteroid_pos_ball.alpha = 0;			
				asteroid_lit.alpha = 0
			}
			
			
			asteroid.alpha = 1;
		
			
			asteroid_sprite.addChildAt(asteroid,0);
			asteroid_sprite.addChildAt(asteroid_pos_00,1);
			asteroid_sprite.addChildAt(asteroid_pos_02,2);
			asteroid_sprite.addChildAt(asteroid_pos_04,3);
			asteroid_sprite.addChildAt(asteroid_pos_ball,4);
			asteroid_sprite.addChildAt(asteroid_lit,5);
			
			asteroid_sprite.alpha = 1;
			
			this.addChild(asteroid_sprite);
			/*
			private var asteroid_sprite:Sprite;
			private var asteroid_pos_00:Image;
			private var asteroid_pos_02:Image;
			private var asteroid_pos_04:Image;
			private var asteroid_pos_ball:Image;
			private var asteroid_lit:Image;
			
			*/
		}
		
		private function CreatePrintOutHit():void{
			hit_printout = new Shape();
			hit_printout.touchable = false;
			hit_printout.graphics.beginFill(0xff0000);
			
			hit_printout.graphics.lineTo(80,299);	
			hit_printout.graphics.lineTo(127,283);	
			hit_printout.graphics.lineTo(165,302);	
			hit_printout.graphics.lineTo(170,337);	
			hit_printout.graphics.lineTo(151,376);	
			hit_printout.graphics.lineTo(200,410);	
			hit_printout.graphics.lineTo(312,410);	
			hit_printout.graphics.lineTo(361,435);	
			hit_printout.graphics.lineTo(308,465);	
			hit_printout.graphics.lineTo(106,439);	
			hit_printout.graphics.lineTo(92,394);	
			hit_printout.graphics.lineTo(116,320);	
			
			hit_printout.graphics.endFill(false);
			hit_printout.alpha = 0.0;
			
			hit_printout.graphics.precisionHitTest = true;	
			this.addChild(hit_printout);
		}
		
		
		private function CreateDoorHit():void{
			hit_door = new Shape();
			hit_door.touchable = false;
			hit_door.graphics.beginFill(0xff0000);
			
			hit_door.graphics.lineTo(550,137);	
			hit_door.graphics.lineTo(655,143);	
			hit_door.graphics.lineTo(646,304);	
			hit_door.graphics.lineTo(547,300);	

			hit_door.graphics.endFill(false);
			hit_door.alpha = 0.0;
			
			hit_door.graphics.precisionHitTest = true;	
			this.addChild(hit_door);
		}
		
		private function CreateDeskHit():void{
			hit_desk = new Shape();
			hit_desk.touchable = false;
			hit_desk.graphics.beginFill(0xff0000);
			
			hit_desk.graphics.lineTo(371,309);	
			hit_desk.graphics.lineTo(385,238);	
			hit_desk.graphics.lineTo(460,154);	
			hit_desk.graphics.lineTo(508,159);	
			hit_desk.graphics.lineTo(531,195);	
			hit_desk.graphics.lineTo(548,263);	
			hit_desk.graphics.lineTo(529,320);	
			hit_desk.graphics.lineTo(378,312);	
			
			hit_desk.graphics.endFill(false);
			hit_desk.alpha = 0.0;
			
			hit_desk.graphics.precisionHitTest = true;	
			this.addChild(hit_desk);
		}
		
		private function CreateAsteriodHit():void{
			hit_asteriord = new Shape();
			hit_asteriord.touchable = false;
			hit_asteriord.graphics.beginFill(0xff0000);
			
			hit_asteriord.graphics.lineTo(117,195);	
			hit_asteriord.graphics.lineTo(116,190);	
			hit_asteriord.graphics.lineTo(159,87);	
			hit_asteriord.graphics.lineTo(282,82);	
			hit_asteriord.graphics.lineTo(389,101);	
			hit_asteriord.graphics.lineTo(404,177);	
			hit_asteriord.graphics.lineTo(331,306);	
			hit_asteriord.graphics.lineTo(229,310);	
			hit_asteriord.graphics.lineTo(158,268);	
		
			hit_asteriord.graphics.endFill(false);
			hit_asteriord.alpha = 0.0;
			
			hit_asteriord.graphics.precisionHitTest = true;	
			this.addChild(hit_asteriord);
		}
		
		private function CreateGeneticsHit():void{
			hit_genetics = new Shape();
			hit_genetics.touchable = false;
			hit_genetics.graphics.beginFill(0xff0000);
			
			hit_genetics.graphics.lineTo(720,112);	
			hit_genetics.graphics.lineTo(782,110);	
			hit_genetics.graphics.lineTo(782,385);	
			hit_genetics.graphics.lineTo(720,385);	
		
			hit_genetics.graphics.endFill(false);
			hit_genetics.alpha = 0.0;
			
			hit_genetics.graphics.precisionHitTest = true;	
			this.addChild(hit_genetics);
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(LetterIsOpen === false){
							if(targ == goback.SourceImage){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
								FadeOut((ThirdFloorHall as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ThirdFloorHallObj,true
								);
							}else if(hit_genetics.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								GeneticsRoomHandler();
							
							}else if(hit_asteriord.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((LabAsteriod as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.LabAsteriodObj,true
								);
							}else if(hit_desk.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								FadeOut((LabDesk as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.LabDeskObj,true
								);
							}else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								StorageDoorHandler();
								
							}else if(hit_printout.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								LetterIsOpen = true;
								OpenLetter(true, 0)
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab;
								}		
								SaveArray['Letter'] = "open";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lab',SaveArray);
							}
						}else{
							if(targ == goback.SourceImage){
								trace("GoBackClick");
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.HideReadOut();
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
								RemoveLetter();
								LetterIsOpen = false;	
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab;
								}		
								SaveArray['Letter'] = "closed";
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lab',SaveArray);
							}else if(hit_openLetter.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The print out is a long string of the letters g, a, c, and t.");
							}
						}
						//LabAsteriodObj
					}
				}
			}
		}
		
		private function StorageDoorHandler():void{
			if(StorageOpen === false){
				FadeOut((LabDoor as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.LabDoorObj,true
				);
			}else{
				FadeOut((DeepLab as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.DeepLabObj,false
				);
			}
			
		}
		
		private function GeneticsRoomHandler():void{
			if(GeneticsOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_StoneDrag();
				door_genetics.alpha = 0;
				door_genetics_light.alpha = 1;
				GeneticsOpen = true;
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.Lab;	
				}
				
				SaveArray['GeneticsOpen'] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('Lab',SaveArray);
				
				
			}else{
				FadeOut((GeneticsRoom as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomObj,false
				);
			}
		}
		
		private function OpenLetter(Fade:Boolean = false,page:Number = 0):void{
			Animating = true;
			openLetter = new Sprite();
			openLetter.alpha = 0;
			CreateOpenBookBg();
			openLetterPages = new Image(this.assets.getTexture('printout'));
			this.openLetter.addChildAt(openBookbg,0);
			openLetter.addChild(openLetterPages);
			openLetterPages.touchable = false;
			
			this.addChildAt(openLetter,12);
			this.addChildAt(goback,13);
			
			
			if(Fade === false){
				openLetter.alpha = 1;
				CreateOpenLetterHit();
				Animating = false;
				//	CreateOpenNotePadHit();
			}else{
				game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('dna');
				OpenLetterTween = new Tween(openLetter, 0.5, Transitions.LINEAR);
				OpenLetterTween.fadeTo(1);
				OpenLetterTween.onComplete = function():void{
					//		CreateOpenNotePadHit();
					CreateOpenLetterHit();
					Animating = false; 
				};
				Starling.juggler.add(OpenLetterTween);	
				
			}
			//	CreateOpenBookHit(page);
		}
		private function RemoveLetter():void{
			Animating = true;
			hit_openLetter.graphics.clear();
			//	Starling.juggler.purge();
			OpenLetterTween = new Tween(openLetter, 0.5, Transitions.LINEAR);
			OpenLetterTween.fadeTo(0);
			OpenLetterTween.onComplete = function():void{
				
				CloseLetter();
				Animating = false;
				
			};
			Starling.juggler.add(OpenLetterTween);		
		}
		
		public function CloseLetter():void{
			this.removeChild(openLetter);
			openLetter.dispose();
		}
		private function CreateOpenBookBg():void{
			openBookbg = new Shape();
			openBookbg.graphics.beginFill(0x000000);
			openBookbg.graphics.lineTo(0,0);	
			openBookbg.graphics.lineTo(800,0);	
			openBookbg.graphics.lineTo(800,512);	
			openBookbg.graphics.lineTo(0,512);	
			
			openBookbg.graphics.endFill(false);
			openBookbg.alpha = 0.5;
			//	openBookbg.graphics.precisionHitTest = true;				
			
		}
		private function CreateOpenLetterHit():void{
			hit_openLetter = new Shape();
			this.addChild(hit_openLetter);
			hit_openLetter.graphics.beginFill(0x0000FF);
			hit_openLetter.graphics.lineTo(115,14);	
			hit_openLetter.graphics.lineTo(244,0);	
			hit_openLetter.graphics.lineTo(546,0);	
			hit_openLetter.graphics.lineTo(677,476);	
			hit_openLetter.graphics.lineTo(160,476);	
			
			hit_openLetter.graphics.endFill(false);
			hit_openLetter.alpha = 0.0;
			hit_openLetter.touchable = false;
			hit_openLetter.graphics.precisionHitTest = true;	
		}
		
		
		
		
		private function FadeOut(loadClass:Class,loadObj:Object,Fade:Boolean = false):void{
			trace("FADE OUT");
			this.removeEventListener(TouchEvent.TOUCH,TouchHandler);
			Starling.juggler.remove(delayedCall);
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
			
			
			
			this.assets.removeTexture("lab_bg",true);
			this.assets.removeTexture("Printout_Sprite_01",true);
			this.assets.removeTexture("Lab_Sprite_01",true);
			this.assets.removeTextureAtlas("Printout_Sprite_01",true);
			this.assets.removeTextureAtlas("Lab_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("lab_01");
			(stage.getChildAt(0) as Object).falseAsset("lab_02");
			(stage.getChildAt(0) as Object).falseAsset("lab_03");
			(stage.getChildAt(0) as Object).falseAsset("lab_04");
			(stage.getChildAt(0) as Object).falseAsset("lab_05");
			
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
