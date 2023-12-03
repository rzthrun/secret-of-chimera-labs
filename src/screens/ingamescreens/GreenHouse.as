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
	
	
	public class GreenHouse extends Sprite
	{
		
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		public var SaveArray2:Array = new Array();
		
		private var bg:Image;
		
		private var venus_big:MovieClip;
		private var venus_left:MovieClip;	
		private var venus_right:MovieClip;		
		private var metal:Image;
		private var disc:Image;
		
		
		
		private var desk_jar:Image;
		private var desk_tongs:Image;
		private var desk_syringe:Image;
		private var desk_blue_tube:Image;
		private var desk_red_tube:Image;
		
		private var desk_empty_tube:Image;
		
		private var door_mc:MovieClip;
		
		private var MouthOpen:Boolean = true;
		
		private var hit_table:Shape;
		private var hit_door:Shape;
		private var hit_venus:Shape;
		
		private var hit_light:Shape;
		private var hit_ceiling:Shape;
		private var hit_floor:Shape;
		private var hit_stool:Shape;
		private var hit_pot:Shape;
		
		//	private var hit_elevator_door:Shape;
		private var DoorOpen:Boolean = false;
		private var DoorUnlocked:Boolean = false;
		private var Animating:Boolean = false;
		
		private var VenusBigDirection:Boolean = false;
		private var VenusRightDirection:Boolean = false;
		private var VenusLeftDirection:Boolean = false;
		
		private var MetalAttached:Boolean = false;
		
		private var delayCallRight:DelayedCall;
		private var delayCallLeft:DelayedCall;
		private var delayCallBig:DelayedCall;
		
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function GreenHouse(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('greenHouse_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouse/greenHouse_bg.jpg'));
				game.TrackAssets('greenHouse_01');
			}
			if(game.CheckAsset('greenHouse_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouse/GreenHouse_Sprite_01.png'));
				game.TrackAssets('greenHouse_02');
			}
			if(game.CheckAsset('greenHouse_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GreenHouse/GreenHouse_Sprite_01.xml'));
				game.TrackAssets('greenHouse_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GreenHouse","GreenHouseObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
				SaveArray2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus;
			}
			
			delayCallRight = new DelayedCall(PlayVenusRight,4);
			delayCallLeft = new DelayedCall(PlayVenusLeft,2);
			delayCallBig = new DelayedCall(PlayVenusBig,6);
			
			bg = new Image(this.assets.getTexture('greenHouse_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['Mouth'] == 'Closed'){
					venus_big = new MovieClip(this.assets.getTextures('venus_big_0').reverse(),9);
					venus_big.touchable = false;
					venus_big.x = 78;
					venus_big.y = 60;
					venus_big.loop = false;
					
				}else{
					venus_big = new MovieClip(this.assets.getTextures('venus_big_0'),9);
					venus_big.touchable = false;
					venus_big.x = 78;
					venus_big.y = 60;
					venus_big.loop = false;
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['Left'] == 'Closed'){
					
					venus_left = new MovieClip(this.assets.getTextures('venus_left_0').reverse(),12);
					venus_left.touchable = false;
					venus_left.x = 31;
					venus_left.y = 193;
					venus_left.loop = false;
				}else{
					
					venus_left = new MovieClip(this.assets.getTextures('venus_left_0'),12);
					venus_left.touchable = false;
					venus_left.x = 31;
					venus_left.y = 193;
					venus_left.loop = false;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['Right'] == 'Closed'){
					
					venus_right = new MovieClip(this.assets.getTextures('venus_right_0').reverse(),12);
					venus_right.touchable = false;
					venus_right.x = 232;
					venus_right.y = 175;
					venus_right.loop = false;
				}else{
					
					venus_right = new MovieClip(this.assets.getTextures('venus_right_0'),12);
					venus_right.touchable = false;
					venus_right.x = 232;
					venus_right.y = 175;
					venus_right.loop = false;
				}
			}else{
				venus_big = new MovieClip(this.assets.getTextures('venus_big_0'),9);
				venus_big.touchable = false;
				venus_big.x = 78;
				venus_big.y = 60;
				venus_big.loop = false;
				
				venus_left = new MovieClip(this.assets.getTextures('venus_left_0'),12);
				venus_left.touchable = false;
				venus_left.x = 31;
				venus_left.y = 193;
				venus_left.loop = false;
				
				venus_right = new MovieClip(this.assets.getTextures('venus_right_0'),12);
				venus_right.touchable = false;
				venus_right.x = 232;
				venus_right.y = 175;
				venus_right.loop = false;
			}
	
		
	
			
			metal = new Image(this.assets.getTexture('venus_metal'));
			metal.touchable = false;
			metal.x = 106;
			metal.y = 124;
			
			disc = new Image(this.assets.getTexture('venus_disc'));
			disc.touchable = false;
			disc.x = 157;
			disc.y = 154;
			
			desk_tongs = new Image(this.assets.getTexture('desk_tongs'));
			desk_tongs.touchable = false;
			desk_tongs.x = 408;
			desk_tongs.y = 216;
			
			desk_jar = new Image(this.assets.getTexture('desk_jar'));
			desk_jar.touchable = false;
			desk_jar.x = 382;
			desk_jar.y = 256;
			
			desk_syringe = new Image(this.assets.getTexture('desk_syringe'));
			desk_syringe.touchable = false;
			desk_syringe.x = 552;
			desk_syringe.y = 212;
			
			desk_red_tube = new Image(this.assets.getTexture('desk_blue_red'));
			desk_red_tube.touchable = false;
			desk_red_tube.x = 480;
			desk_red_tube.y = 199;
			
			desk_blue_tube = new Image(this.assets.getTexture('desk_blue_tube'));
			desk_blue_tube.touchable = false;
			desk_blue_tube.x = 466;
			desk_blue_tube.y = 199;
			
			desk_empty_tube = new Image(this.assets.getTexture('desk_empty_tubes'));
			desk_empty_tube.touchable = false;
			desk_empty_tube.x = 465;
			desk_empty_tube.y = 200;

			
			door_mc = new MovieClip(this.assets.getTextures("door_0"),4);
			door_mc.x = 649;
			door_mc.y = 121;
			door_mc.touchable = false;
			door_mc.loop = false; 
			door_mc.stop();
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['MetalAttached'] == 'Yes'){
					MetalAttached = true;
					metal.alpha = 1;
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['Disc'] == 'PickedUp'){					
						disc.alpha = 0;
					}else{		
						disc.alpha = 0;
					}
				}else{
					disc.alpha = 0;
					metal.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['Mouth'] == 'Closed'){
					MouthOpen = false;
					venus_big.texture = this.assets.getTexture('venus_big_05');
					disc.alpha = 0;
					
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['Left'] == 'Closed'){
					venus_left.texture = this.assets.getTexture('venus_left_06');
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['Right'] == 'Closed'){
					venus_right.texture = this.assets.getTexture('venus_right_05');
	
				}
			}else{
				metal.alpha = 0;
				disc.alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['Tongs'] == 'PickedUp'){
					desk_tongs.alpha = 0;
				}else{
					desk_tongs.alpha = 1;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['Syringe'] == 'Attached'){
					
					desk_syringe.alpha = 1;
				}else{
					desk_syringe.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['Jar'] == 'PickedUp'){
					
					desk_jar.alpha = 0;
				}else{
					desk_jar.alpha = 1
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['BlueTube'] == 'Attached'){
					desk_blue_tube.alpha = 1;
				}else{
					desk_blue_tube.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseTable['RedTube'] == 'Attached'){
					desk_red_tube.alpha = 1;
				}else{
					desk_red_tube.alpha = 0;
				}
			}else{
				desk_red_tube.alpha = 0;
				desk_blue_tube.alpha = 0;
				desk_tongs.alpha = 1;
				desk_jar.alpha = 1;
				desk_syringe.alpha = 0;
				
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseMicroscope['Solved'] == 'Yes'){
					desk_empty_tube.alpha = 1;
				}else{
					desk_empty_tube.alpha = 0;
				}
			}else{
				desk_empty_tube.alpha = 0;
			}
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouse!= undefined){	
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouse['DoorUnlocked'] == 'Yes'){	
					DoorUnlocked = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouse['Door'] == 'Open'){	
					DoorOpen = true;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouse['FirstTime'] == 'Yes'){
					
				}else{
					if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouse;
						SaveArray['FirstTime'] = 'Yes';
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouse',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							(stage.getChildAt(0) as Object).MusicObj.LoadPhantom(true,3);
							
						},0.5);
					}
				}
				
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus != undefined){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseVenus['Disc'] == 'PickedUp'){				
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouse['SecondTime'] == 'Yes'){
							
						}else{
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouse['FirstTime'] == 'Yes'){
								
							}else{
								if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouse;
									SaveArray['SecondTime'] = 'Yes';
									
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouse',SaveArray);
									
									Starling.juggler.delayCall(function():void{
										(stage.getChildAt(0) as Object).MusicObj.LoadDarkDance(true,3);
										
									},0.5);
								}
							}
								
						}
					}
				}
				
			}else{
				if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
					
					SaveArray['FirstTime'] = 'Yes';
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouse',SaveArray);
					
					Starling.juggler.delayCall(function():void{
						(stage.getChildAt(0) as Object).MusicObj.LoadPhantom(true,3);
						
					},0.5);
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouseSpore['Solved'] == 'Yes'){	
					if(DoorUnlocked === false){
						Animating = true;
						DoorUnlocked = true;
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouse != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouse;	
						}
						SaveArray['DoorUnlocked'] = 'Yes';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouse',SaveArray);
						
						Starling.juggler.delayCall(function():void{
							OpenDoor();
						},2);
					}else{
						if(DoorOpen === true){
							door_mc.alpha = 0;
						}else{
							door_mc.alpha = 1;
							door_mc.currentFrame = 6;
						}
						
					}
				}else{
					door_mc.alpha = 1;
				}
			}else{
				door_mc.alpha = 1;
			}
			venus_big.alpha = 1;			
			venus_left.alpha = 1;		
			venus_right.alpha = 1;
		
			venus_big.stop();
			venus_right.stop()		
			venus_left.stop()
		
			
			this.addChildAt(door_mc,1);	
			this.addChildAt(venus_right,2);	
		//	this.addChildAt(venus_right_reverse,3);	
			this.addChildAt(venus_left,3);	
	//		this.addChildAt(venus_left_reverse,4);	
			this.addChildAt(venus_big,4);
			this.addChildAt(disc,5);
			this.addChildAt(metal,6);					
			this.addChildAt(desk_tongs,7);	
			this.addChildAt(desk_jar,8);	
			this.addChildAt(desk_syringe,9);	
			this.addChildAt(desk_red_tube,10);	
			this.addChildAt(desk_blue_tube,11);	
			this.addChildAt(desk_empty_tube,12);	
				
			CreateLightHit();
			CreateFloorHit();
			CreatePotHit();
			CreateStoolHit();
			CreateCeilingHit();
			
			CreateTableHit();
			CreateDoorHit();
			CreateVenusHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
		
			
			Starling.juggler.add(door_mc);
			
			venus_left.addEventListener(Event.COMPLETE, onLeftComplete);		
			venus_right.addEventListener(Event.COMPLETE, onRightComplete);		
			venus_big.addEventListener(Event.COMPLETE, onBigComplete);		
			
			Starling.juggler.add(venus_right);	
			Starling.juggler.add(venus_big);	
			Starling.juggler.add(venus_left);	
			
			
			
			if(MetalAttached === false){
				Starling.juggler.add(delayCallBig);	
			}
			Starling.juggler.add(delayCallRight);	
			Starling.juggler.add(delayCallLeft);	
			
			(stage.getChildAt(0) as Object).AmbientObj.LoadHorrorBreath(true,4);
			(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
			Starling.juggler.delayCall(function():void{
				
				(stage.getChildAt(0) as Object).AmbientObj.LoadSlipperyPlants(true,999);
				
				
			},0.5);
			//LoadHorrorBreath
			
			
			
		}
		private function onBigComplete():void{
			if(VenusBigDirection == false){
				VenusBigDirection = true;
				
				venus_big.pause();			
				venus_big.reverse = true;							
				
				venus_big.stop();	
				
			}else{
				VenusBigDirection = false;
				disc.alpha = 0;
				venus_big.pause();			
				venus_big.reverse = false;		
				venus_big.stop();	
				
			}
			
		
			
			if(RONum == 0){
				RONum = 1;
				delayCallBig.reset(PlayVenusBig,8);			
			}else if(RONum == 1){
				RONum = 2;
				delayCallBig.reset(PlayVenusBig,12);
			}else if(RONum == 2){
				RONum = 0;
				delayCallBig.reset(PlayVenusBig,4);
			}
			
			Starling.juggler.add(delayCallBig);
			
		}
		private function PlayVenusBig():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
			if(VenusBigDirection === false){
				SaveArray2['Mouth'] = 'Open';
			}else{
				SaveArray2['Mouth'] = 'Closed';
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray2);
			
			disc.alpha = 0;
			venus_big.play();	
		}
		
		private function onLeftComplete():void{
			if(VenusLeftDirection == false){
				VenusLeftDirection = true;
				
				venus_left.pause();			
				venus_left.reverse = true;							
				
				venus_left.stop();	
				
			}else{
				VenusLeftDirection = false;
				
				venus_left.pause();			
				venus_left.reverse = false;		
				venus_left.stop();	
				
			}
			
			if(RONum == 0){
				RONum = 1;
				delayCallLeft.reset(PlayVenusLeft,4);			
			}else if(RONum == 1){
				RONum = 2;
				delayCallLeft.reset(PlayVenusLeft,8);
			}else if(RONum == 2){
				RONum = 0;
				delayCallLeft.reset(PlayVenusLeft,2);
			}
			
			Starling.juggler.add(delayCallLeft);
			
		}
		private function PlayVenusLeft():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
			if(VenusLeftDirection === false){
				SaveArray2['Left'] = 'Open';
			}else{
				SaveArray2['Left'] = 'Closed';
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray2);
			
			venus_left.play();	
		}
		private function onRightComplete():void{
			if(VenusRightDirection == false){
				VenusRightDirection = true;
			
				venus_right.pause();			
				venus_right.reverse = true;							

				venus_right.stop();	
				
			}else{
				
				VenusRightDirection = false;
			
				venus_right.pause();			
				venus_right.reverse = false;		
				venus_right.stop();	

			}
			
			if(RONum == 0){
				RONum = 1;
				delayCallRight.reset(PlayVenusRight,4);			
			}else if(RONum == 1){
				RONum = 2;
				delayCallRight.reset(PlayVenusRight,8);
			}else if(RONum == 2){
				RONum = 0;
				delayCallRight.reset(PlayVenusRight,2);
			}
			
			Starling.juggler.add(delayCallRight);
			
		}
		private function PlayVenusRight():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
	
			if(VenusRightDirection === false){
				SaveArray2['Right'] = 'Open';
			}else{
				SaveArray2['Right'] = 'Closed';
			}
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouseVenus',SaveArray2);
			
			venus_right.play();	
		}
		
		public function OpenDoor():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerTwo();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_OhmTwo();
			door_mc.addEventListener(Event.COMPLETE, OnCompleteDoorOpen);
			door_mc.play();
		}
		private function OnCompleteDoorOpen():void{
			door_mc.removeEventListener(Event.COMPLETE, OnCompleteDoorOpen);
			Animating = false;
			//door_mc.alpha = 0;
		}
	
		private function CreateCeilingHit():void{
			hit_ceiling = new Shape();
			hit_ceiling.touchable = false;
			hit_ceiling.graphics.beginFill(0xff0000);
			
			hit_ceiling.graphics.lineTo(224,47);	
			hit_ceiling.graphics.lineTo(317,0);	
			hit_ceiling.graphics.lineTo(688,0);	
			hit_ceiling.graphics.lineTo(650,81);	
			hit_ceiling.graphics.lineTo(456,102);	
		
			hit_ceiling.graphics.endFill(false);
			hit_ceiling.alpha = 0.0;
			
			hit_ceiling.graphics.precisionHitTest = true;	
			this.addChild(hit_ceiling);
		}
		private function CreateStoolHit():void{
			hit_stool = new Shape();
			hit_stool.touchable = false;
			hit_stool.graphics.beginFill(0xff0000);
			
			hit_stool.graphics.lineTo(483,380);	
			hit_stool.graphics.lineTo(545,377);	
			hit_stool.graphics.lineTo(598,436);	
			hit_stool.graphics.lineTo(570,488);	
			hit_stool.graphics.lineTo(515,476);	
			
			hit_stool.graphics.endFill(false);
			hit_stool.alpha = 0.0;
			
			hit_stool.graphics.precisionHitTest = true;	
			this.addChild(hit_stool);
		}
		
		private function CreatePotHit():void{
			hit_pot = new Shape();
			hit_pot.touchable = false;
			hit_pot.graphics.beginFill(0xff0000);
			
			hit_pot.graphics.lineTo(104,350);	
			hit_pot.graphics.lineTo(131,316);	
			hit_pot.graphics.lineTo(186,318);	
			hit_pot.graphics.lineTo(195,392);	
			hit_pot.graphics.lineTo(140,403);	
			
			
			hit_pot.graphics.endFill(false);
			hit_pot.alpha = 0.0;
			
			hit_pot.graphics.precisionHitTest = true;	
			this.addChild(hit_pot);
		}
		
		private function CreateFloorHit():void{
			hit_floor = new Shape();
			hit_floor.touchable = false;
			hit_floor.graphics.beginFill(0xff0000);
			
			hit_floor.graphics.lineTo(103,415);	
			hit_floor.graphics.lineTo(286,389);	
			hit_floor.graphics.lineTo(381,439);	
			hit_floor.graphics.lineTo(645,303);	
			hit_floor.graphics.lineTo(787,332);	
			hit_floor.graphics.lineTo(793,379);	
			hit_floor.graphics.lineTo(596,506);	
			hit_floor.graphics.lineTo(88,503);	
			
			hit_floor.graphics.endFill(false);
			hit_floor.alpha = 0.0;
			
			hit_floor.graphics.precisionHitTest = true;	
			this.addChild(hit_floor);
		}
		
		private function CreateLightHit():void{
			hit_light = new Shape();
			hit_light.touchable = false;
			hit_light.graphics.beginFill(0xff0000);
			
			hit_light.graphics.lineTo(307,115);	
			hit_light.graphics.lineTo(355,87);	
			hit_light.graphics.lineTo(386,131);	
			hit_light.graphics.lineTo(357,154);	
			
			hit_light.graphics.endFill(false);
			hit_light.alpha = 0.0;
			
			hit_light.graphics.precisionHitTest = true;	
			this.addChild(hit_light);
		}
		
		private function CreateVenusHit():void{
			hit_venus = new Shape();
			hit_venus.touchable = false;
			hit_venus.graphics.beginFill(0xff0000);
			
			hit_venus.graphics.lineTo(47,176);	
			hit_venus.graphics.lineTo(104,57);	
			hit_venus.graphics.lineTo(240,66);	
			hit_venus.graphics.lineTo(314,136);	
			hit_venus.graphics.lineTo(293,280);	
			hit_venus.graphics.lineTo(89,312);	

			hit_venus.graphics.endFill(false);
			hit_venus.alpha = 0.0;
			
			hit_venus.graphics.precisionHitTest = true;	
			this.addChild(hit_venus);
		}
		
		private function CreateDoorHit():void{
			hit_door = new Shape();
			hit_door.touchable = false;
			hit_door.graphics.beginFill(0xff0000);
			
			hit_door.graphics.lineTo(645,113);	
			hit_door.graphics.lineTo(745,119);	
			hit_door.graphics.lineTo(740,305);	
			hit_door.graphics.lineTo(684,302);	
			hit_door.graphics.lineTo(685,273);	
			hit_door.graphics.lineTo(646,267);	
			
			hit_door.graphics.endFill(false);
			hit_door.alpha = 0.0;
			
			hit_door.graphics.precisionHitTest = true;	
			this.addChild(hit_door);
		}
		
		private function CreateTableHit():void{
			hit_table = new Shape();
			hit_table.touchable = false;
			hit_table.graphics.beginFill(0xff0000);
			
			hit_table.graphics.lineTo(340,269);	
			hit_table.graphics.lineTo(391,166);	
			hit_table.graphics.lineTo(550,161);	
			hit_table.graphics.lineTo(615,243);	
			hit_table.graphics.lineTo(616,298);	
			hit_table.graphics.lineTo(389,328);	
		
			hit_table.graphics.endFill(false);
			hit_table.alpha = 0.0;
			
			hit_table.graphics.precisionHitTest = true;	
			this.addChild(hit_table);
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
							FadeOut((ThirdFloorHall as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ThirdFloorHallObj,false
							);
						}else if(hit_table.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((GreenHouseTable as Class), 	
									(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseTableObj,true
							);
						}else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(DoorUnlocked === false){
								FadeOut((GreenHouseSpore as Class), 
									(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseSporeObj,true
								);
							}else{
								if(DoorOpen === false){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_HeavyMetalDoorOpen();
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouse != undefined){	
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GreenHouse;	
									}
									DoorOpen = true;
									SaveArray['Door'] = 'Open';
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GreenHouse',SaveArray);
									door_mc.alpha = 0;
								}else{
									FadeOut((GreenHouseDeep as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseDeepObj,false
									);
								}
							}	
						}else if(hit_venus.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FadeOut((GreenHouseVenus as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GreenHouseVenusObj,true
							);
						}else if(hit_pot.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A ceramic pot lays broken on the floor below the monstrous plant.");	
						}else if(hit_stool.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The stool beside the desk has been overturned.");	
						}else if(hit_floor.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							FloorHandler();
						}else if(hit_light.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A suspended light hangs from the ceiling...");	
						}else if(hit_ceiling.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							CeilingHandler();
						}
						/*
						CreatePotHit();
						CreateStoolHit();
						CreateCeilingHit();
						
						private var hit_light:Shape;
						private var hit_ceiling:Shape;
						private var hit_floor:Shape;
						private var hit_stool:Shape;
						private var hit_pot:Shape;
						*/
					}
				}
			}
		}
		
		
		private function CeilingHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The strange gas hangs in the air...");		
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The air is thick, humid, and hot.");
				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The air is thick with a strange mist...");	
			}
		}
		
		private function FloorHandler():void{
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A green mist wafts above the floor...");				
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think something just slithered past my leg...");
				
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The floor is covered with roots, stems, and growths...");
				
			}
		}
		
		private function FadeOut(loadClass:Class,loadObj:Object,Fade:Boolean = false):void{
			trace("FADE OUT");
			
			this.removeEventListener(TouchEvent.TOUCH,TouchHandler);
			venus_left.removeEventListener(Event.COMPLETE, onLeftComplete);		
			venus_right.removeEventListener(Event.COMPLETE, onRightComplete);		
			venus_big.removeEventListener(Event.COMPLETE, onBigComplete);		
			
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
			
			Starling.juggler.remove(delayCallRight);
			Starling.juggler.remove(delayCallLeft);
			Starling.juggler.remove(delayCallBig);
			
			this.assets.removeTexture("greenHouse_bg",true);
			this.assets.removeTexture("GreenHouse_Sprite_01",true);
			this.assets.removeTextureAtlas("GreenHouse_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("greenHouse_01");
			(stage.getChildAt(0) as Object).falseAsset("greenHouse_02");
			(stage.getChildAt(0) as Object).falseAsset("greenHouse_03");
		
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
