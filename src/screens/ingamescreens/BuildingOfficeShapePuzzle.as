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
	import starling.text.TextField;
	import starling.utils.AssetManager;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	
	
	
	public class BuildingOfficeShapePuzzle extends Sprite
	{
		
		
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		private var errorText:TextField;
		private var highlight:Image;
		
		private var pos_00:Image;
		private var pos_01:Image;
		private var pos_02:Image;
		private var pos_03:Image;
		private var pos_04:Image;
		private var dot_00:Image;
		private var dot_01:Image;
		private var dot_02:Image;
		private var dot_03:Image;
		private var dot_04:Image;
		
		private var hood:Image;
		
		private var red_light:Image;
		private var green_light:Image;
		
		private var hit_left:Shape;
		private var hit_right:Shape;		
		private var hit_cube:Shape;
		private var hit_cylinder:Shape;
		private var hit_sphere:Shape;
		
		private var hit_orange:Shape;
		private var hit_red:Shape;
		private var hit_purple:Shape;
		private var hit_blue:Shape;
		private var hit_green:Shape;
		
		private var hit_pos_00:Shape;
		private var hit_pos_01:Shape;
		private var hit_pos_02:Shape;
		private var hit_pos_03:Shape;
		private var hit_pos_04:Shape;
		
		private var hit_screen:Shape;
		
		private var pos_00_shape:String = 'cube';
		private var pos_01_shape:String = 'cube';
		private var pos_02_shape:String = 'cube';
		private var pos_03_shape:String = 'cube';
		private var pos_04_shape:String = 'cube';
		
		
		private var pos_00_color:String = 'blue';
		private var pos_01_color:String = 'blue';
		private var pos_02_color:String = 'blue';
		private var pos_03_color:String = 'blue';
		private var pos_04_color:String = 'blue';
		
		private var TableArr:Array = new Array(
			'cube_red',
			'sphere_orange',
			'cylinder_yellow',
			'cube_green',
			'sphere_blue'

		);
		private var SolveArr:Array = new Array('cube_blue',
			'cube_blue',
			'cube_blue',
			'cube_blue',
			'cube_blue'
		);
		
		//	private var hit_elevator_door:Shape;
		private var CurrentPos:int = 0;
		private var SystemOnline:Boolean = false;
		private var delayedCall:DelayedCall;
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		
		
		public function BuildingOfficeShapePuzzle(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('buildingOfficeShapePuzzle_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeShapePuzzle/BuildingOfficeShapePuzzle_Sprite_01.png'));
				game.TrackAssets('buildingOfficeShapePuzzle_01');
			}
			if(game.CheckAsset('buildingOfficeShapePuzzle_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeShapePuzzle/BuildingOfficeShapePuzzle_Sprite_01.xml'));
				game.TrackAssets('buildingOfficeShapePuzzle_02');
			}
			if(game.CheckAsset('buildingOfficeShapePuzzle_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeShapePuzzle/BuildingOfficeShapePuzzle_Sprite_02.png'));
				game.TrackAssets('buildingOfficeShapePuzzle_03');
			}
			if(game.CheckAsset('buildingOfficeShapePuzzle_04') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeShapePuzzle/BuildingOfficeShapePuzzle_Sprite_02.xml'));
				game.TrackAssets('buildingOfficeShapePuzzle_04');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BuildingOfficeShapePuzzle","BuildingOfficeShapePuzzleObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('buildingOfficeShapePuzzle_bg'));
			bg.touchable = true;
			bg.width = 800;
			bg.height = 512;
			this.addChildAt(bg,0);
			
			highlight = new Image(this.assets.getTexture('pos_highlight'));
			highlight.touchable = false;
			highlight.x = 47;
			highlight.y = 123;
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['Solved'] == 'Yes'){
					SystemOnline = true;
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable != undefined){	
				trace("BARK 00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['EggplantAttached'] == 'Yes'){	
					trace("BARK 01");
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['0'] != undefined){	
						trace('BARK 03');
						TableArr[4] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['0'];
						if(TableArr[4] == 'sphere'){
							TableArr[4] = 'sphere_blue';
						}else if(TableArr[4] == 'apple'){
							TableArr[4] = 'cube_green';
						}else if(TableArr[4] == 'eggplant'){
							TableArr[4] = 'cylinder_purple';
						}else if(TableArr[4] == 'orange'){
							TableArr[4] = 'sphere_orange';
						}else if(TableArr[4] == 'cube'){
							TableArr[4] = 'cube_red';
						}
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['1'] != undefined){	
						TableArr[3] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['1'];
						if(TableArr[3] == 'sphere'){
							TableArr[3] = 'sphere_blue';
						}else if(TableArr[3] == 'apple'){
							TableArr[3] = 'cube_green';
						}else if(TableArr[3] == 'eggplant'){
							TableArr[3] = 'cylinder_purple';
						}else if(TableArr[3] == 'orange'){
							TableArr[3] = 'sphere_orange';
						}else if(TableArr[3] == 'cube'){
							TableArr[3] = 'cube_red';
						}
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['2'] != undefined){	
						TableArr[2] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['2'];
						if(TableArr[2] == 'sphere'){
							TableArr[2] = 'sphere_blue';
						}else if(TableArr[2] == 'apple'){
							TableArr[2] = 'cube_green';
						}else if(TableArr[2] == 'eggplant'){
							TableArr[2] = 'cylinder_purple';
						}else if(TableArr[2] == 'orange'){
							TableArr[2] = 'sphere_orange';
						}else if(TableArr[2] == 'cube'){
							TableArr[2] = 'cube_red';
						}
					}
			//		if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['3'] != undefined){	
			//			PosArray[3] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['3'];
			//		}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['4'] != undefined){	
						TableArr[1] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['4'];
						if(TableArr[1] == 'sphere'){
							TableArr[1] = 'sphere_blue';
						}else if(TableArr[1] == 'apple'){
							TableArr[1] = 'cube_green';
						}else if(TableArr[1] == 'eggplant'){
							TableArr[1] = 'cylinder_purple';
						}else if(TableArr[1] == 'orange'){
							TableArr[1] = 'sphere_orange';
						}else if(TableArr[1] == 'cube'){
							TableArr[1] = 'cube_red';
						}
					}
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['5'] != undefined){	
						TableArr[0] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['5'];
						if(TableArr[0] == 'sphere'){
							TableArr[0] = 'sphere_blue';
						}else if(TableArr[0] == 'apple'){
							TableArr[0] = 'cube_green';
						}else if(TableArr[0] == 'eggplant'){
							TableArr[0] = 'cylinder_purple';
						}else if(TableArr[0] == 'orange'){
							TableArr[0] = 'sphere_orange';
						}else if(TableArr[0] == 'cube'){
							TableArr[0] = 'cube_red';
						}
					}
				}else{
					trace("BARK 02");
					TableArr[0] = 'NotSolvable';
				}
			}else{
				trace("BARK 03");
				TableArr[0] = 'NotSolvable';
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['CurrentPos'] != undefined){
					CurrentPos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['CurrentPos'];
					if(CurrentPos == 0){
						highlight.x = 47;
					}else if(CurrentPos == 1){
						highlight.x = 191;
					}else if(CurrentPos == 2){
						highlight.x = 338;
					}else if(CurrentPos == 3){
						highlight.x = 484;
					}else if(CurrentPos == 4){
						highlight.x = 627;
					}else{
						highlight.x = 47;
					
					}
					
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_00_shape'] != undefined){
					pos_00_shape = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_00_shape'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_00_color'] != undefined){
					pos_00_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_00_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_01_shape'] != undefined){
					pos_01_shape = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_01_shape'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_01_color'] != undefined){
					pos_01_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_01_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_02_shape'] != undefined){
					pos_02_shape = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_02_shape'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_02_color'] != undefined){
					pos_02_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_02_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_03_shape'] != undefined){
					pos_03_shape = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_03_shape'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_03_color'] != undefined){
					pos_03_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_03_color'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_04_shape'] != undefined){
					pos_04_shape = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_04_shape'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_04_color'] != undefined){
					pos_04_color = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle['pos_04_color'];
				}
			}else{
				
			}
			
			
			pos_00 = new Image(this.assets.getTexture(pos_00_shape+'_'+pos_00_color));
			pos_00.touchable = false;
			pos_00.x = 71;
			pos_00.y = 141;
			SolveArr[0] = pos_00_shape+'_'+pos_00_color;
			
			pos_01 = new Image(this.assets.getTexture(pos_01_shape+'_'+pos_01_color));
			pos_01.touchable = false;
			pos_01.x = 216;
			pos_01.y = 141;
			SolveArr[1] = pos_01_shape+'_'+pos_01_color;
			
			pos_02 = new Image(this.assets.getTexture(pos_02_shape+'_'+pos_02_color));
			pos_02.touchable = false;
			pos_02.x = 360;
			pos_02.y = 141;
			SolveArr[2] = pos_02_shape+'_'+pos_02_color;
			
			pos_03 = new Image(this.assets.getTexture(pos_03_shape+'_'+pos_03_color));
			pos_03.touchable = false;
			pos_03.x = 506;
			pos_03.y = 141;
			SolveArr[3] = pos_03_shape+'_'+pos_03_color;
			
			pos_04 = new Image(this.assets.getTexture(pos_04_shape+'_'+pos_04_color));
			pos_04.touchable = false;
			pos_04.x = 653;
			pos_04.y = 141;
			SolveArr[4] = pos_04_shape+'_'+pos_04_color;
			
			
			
			hood = new Image(this.assets.getTexture('back_plate'));
			hood.touchable = false;
			hood.x = 0;
			hood.y = 0;
			hood.alpha = 1;
			
			
			dot_00 = new Image(this.assets.getTexture('dot_orange'));
			dot_00.touchable = false;
			dot_00.x = 226;
			dot_00.y = 436;
			
			dot_01 = new Image(this.assets.getTexture('dot_red'));
			dot_01.touchable = false;
			dot_01.x = 312;
			dot_01.y = 436;
			
			dot_02 = new Image(this.assets.getTexture('dot_purple'));
			dot_02.touchable = false;
			dot_02.x = 398;
			dot_02.y = 435;
			
			dot_03 = new Image(this.assets.getTexture('dot_blue'));
			dot_03.touchable = false;
			dot_03.x = 483;
			dot_03.y = 436;
			
			dot_04 = new Image(this.assets.getTexture('dot_green'));
			dot_04.touchable = false;
			dot_04.x = 566;
			dot_04.y = 436;
			
			red_light = new Image(this.assets.getTexture('red_light'));
			red_light.touchable = false;
			red_light.x = 514;
			red_light.y = 29;
			
			green_light = new Image(this.assets.getTexture('green_light'));
			green_light.touchable = false;
			green_light.x = 616;
			green_light.y = 29;
			
			errorText = new TextField(380,60,"System offline. Portal Locked.","Fake Receipt", 20, 0x0099aa);
			errorText.vAlign = starling.utils.VAlign.TOP;
			errorText.hAlign = starling.utils.HAlign.LEFT;
			errorText.x = 53;
			errorText.y = 24;
			
			if(SystemOnline === false){
				errorText = new TextField(380,60,"System offline. Portal Locked.","Fake Receipt", 20, 0x0099aa);
				errorText.vAlign = starling.utils.VAlign.TOP;
				errorText.hAlign = starling.utils.HAlign.LEFT;
				errorText.x = 53;
				errorText.y = 24;
				
				pos_00.alpha = 0;
				pos_01.alpha = 0;
				pos_02.alpha = 0;
				pos_03.alpha = 0;
				pos_04.alpha = 0;
				
				dot_00.alpha = 0;
				dot_01.alpha = 0;
				dot_02.alpha = 0;
				dot_03.alpha = 0;
				dot_04.alpha = 0;
				highlight.alpha = 0;
			}else{
				
				errorText = new TextField(380,60,"PAL connection established. Awaiting authentication.","Fake Receipt", 20, 0x0099aa);
				errorText.vAlign = starling.utils.VAlign.TOP;
				errorText.hAlign = starling.utils.HAlign.LEFT;
				errorText.x = 53;
				errorText.y = 24;
				
				pos_00.alpha = 1;
				pos_01.alpha = 1;
				pos_02.alpha = 1;
				pos_03.alpha = 1;
				pos_04.alpha = 1;
				
				dot_00.alpha = 1;
				dot_01.alpha = 1;
				dot_02.alpha = 1;
				dot_03.alpha = 1;
				dot_04.alpha = 1;
				highlight.alpha = 1;
			}
				
			
			green_light.alpha = 0;
			red_light.alpha = 1;
			
			//	CreateElevatorDoorHit();
			this.addChildAt(highlight,1);
			this.addChildAt(pos_00,2);
			this.addChildAt(pos_01,3);
			this.addChildAt(pos_02,4);
			this.addChildAt(pos_03,5);
			this.addChildAt(pos_04,6);
			this.addChildAt(errorText,7);
			this.addChildAt(hood,8);
			this.addChildAt(dot_00,9);
			this.addChildAt(dot_01,10);
			this.addChildAt(dot_02,11);
			this.addChildAt(dot_03,12);
			this.addChildAt(dot_04,13);
			this.addChildAt(red_light,14);
			this.addChildAt(green_light,15);
			
			CreateLeftRightHits();
			CreateShapeButtonsHits();
			CreateColorButtonHits();
			CreatePosHits();
			CreateScreenHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		/*
		
		hit_sceen
		*/
		private function CreateScreenHit():void{
			hit_screen = new Shape();
			hit_screen.touchable = false;
			hit_screen.graphics.beginFill(0xff0000);
			
			hit_screen.graphics.lineTo(47,19);	
			hit_screen.graphics.lineTo(458,23);	
			hit_screen.graphics.lineTo(456,93);	
			hit_screen.graphics.lineTo(45,92);	
		
			hit_screen.graphics.endFill(false);
			hit_screen.alpha = 0.0;
			
			hit_screen.graphics.precisionHitTest = true;	
			
			this.addChild(hit_screen);
		}
		private function CreatePosHits():void{
			hit_pos_00 = new Shape();
			hit_pos_00.touchable = false;
			hit_pos_00.graphics.beginFill(0xff0000);
			
			hit_pos_00.graphics.lineTo(44,121);	
			hit_pos_00.graphics.lineTo(176,120);	
			hit_pos_00.graphics.lineTo(175,255);	
			hit_pos_00.graphics.lineTo(46,253);	
		
			hit_pos_00.graphics.endFill(false);
			hit_pos_00.alpha = 0.0;
			
			hit_pos_00.graphics.precisionHitTest = true;	
			
			hit_pos_01 = new Shape();
			hit_pos_01.touchable = false;
			hit_pos_01.graphics.beginFill(0xff0000);
			
			hit_pos_01.graphics.lineTo(188,120);	
			hit_pos_01.graphics.lineTo(320,122);	
			hit_pos_01.graphics.lineTo(319,252);			
			hit_pos_01.graphics.lineTo(190,253);			
			
			hit_pos_01.graphics.endFill(false);
			hit_pos_01.alpha = 0.0;
			
			hit_pos_01.graphics.precisionHitTest = true;	
			
			hit_pos_02 = new Shape();
			hit_pos_02.touchable = false;
			hit_pos_02.graphics.beginFill(0xff0000);
			
			hit_pos_02.graphics.lineTo(335,122);	
			hit_pos_02.graphics.lineTo(465,120);	
			hit_pos_02.graphics.lineTo(465,255);	
			hit_pos_02.graphics.lineTo(336,253);	
						
			hit_pos_02.graphics.endFill(false);
			hit_pos_02.alpha = 0.0;
			
			hit_pos_02.graphics.precisionHitTest = true;	
			
			
			hit_pos_03 = new Shape();
			hit_pos_03.touchable = false;
			hit_pos_03.graphics.beginFill(0xff0000);
			
			hit_pos_03.graphics.lineTo(483,122);	
			hit_pos_03.graphics.lineTo(611,122);	
			hit_pos_03.graphics.lineTo(611,252);	
			hit_pos_03.graphics.lineTo(481,254);	
			
			hit_pos_03.graphics.endFill(false);
			hit_pos_03.alpha = 0.0;
			
			hit_pos_03.graphics.precisionHitTest = true;	
			
			
			hit_pos_04 = new Shape();
			hit_pos_04.touchable = false;
			hit_pos_04.graphics.beginFill(0xff0000);
			
			hit_pos_04.graphics.lineTo(626,123);	
			hit_pos_04.graphics.lineTo(759,122);	
			hit_pos_04.graphics.lineTo(759,256);	
			hit_pos_04.graphics.lineTo(626,256);	
		
			hit_pos_04.graphics.endFill(false);
			hit_pos_04.alpha = 0.0;
			
			hit_pos_04.graphics.precisionHitTest = true;	
			
			this.addChild(hit_pos_00);
			this.addChild(hit_pos_01);
			this.addChild(hit_pos_02);
			this.addChild(hit_pos_03);
			this.addChild(hit_pos_04);
		}
		/*
		
		private var hit_pos_00:Shape;
		private var hit_pos_01:Shape;
		private var hit_pos_02:Shape;
		private var hit_pos_03:Shape;
		private var hit_pos_04:Shape;
		*/
		private function CreateColorButtonHits():void{
			hit_orange = new Shape();
			hit_orange.touchable = false;
			hit_orange.graphics.beginFill(0xff0000);
			
			hit_orange.graphics.lineTo(196,408);	
			hit_orange.graphics.lineTo(265,408);	
			hit_orange.graphics.lineTo(265,474);	
			hit_orange.graphics.lineTo(196,474);	
			
			hit_orange.graphics.endFill(false);
			hit_orange.alpha = 0.0;
			
			hit_orange.graphics.precisionHitTest = true;	
			
			
			hit_red = new Shape();
			hit_red.touchable = false;
			hit_red.graphics.beginFill(0xff0000);
			
			hit_red.graphics.lineTo(282,408);	
			hit_red.graphics.lineTo(346,408);	
			hit_red.graphics.lineTo(346,472);	
			hit_red.graphics.lineTo(282,472);	
			
			hit_red.graphics.endFill(false);
			hit_red.alpha = 0.0;
			
			hit_red.graphics.precisionHitTest = true;	
									
			hit_purple = new Shape();
			hit_purple.touchable = false;
			hit_purple.graphics.beginFill(0xff0000);
			
			hit_purple.graphics.lineTo(369,408);	
			hit_purple.graphics.lineTo(432,408);	
			hit_purple.graphics.lineTo(432,473);	
			hit_purple.graphics.lineTo(369,473);	
		
			hit_purple.graphics.endFill(false);
			hit_purple.alpha = 0.0;
			
			hit_purple.graphics.precisionHitTest = true;	
			
			
			hit_blue = new Shape();
			hit_blue.touchable = false;
			hit_blue.graphics.beginFill(0xff0000);
			
			hit_blue.graphics.lineTo(453,408);	
			hit_blue.graphics.lineTo(520,408);	
			hit_blue.graphics.lineTo(520,473);	
			hit_blue.graphics.lineTo(453,473);	
			
			hit_blue.graphics.endFill(false);
			hit_blue.alpha = 0.0;
			
			hit_blue.graphics.precisionHitTest = true;	
			
			
			hit_green = new Shape();
			hit_green.touchable = false;
			hit_green.graphics.beginFill(0xff0000);
			
			hit_green.graphics.lineTo(535,408);	
			hit_green.graphics.lineTo(605,408);	
			hit_green.graphics.lineTo(605,473);	
			hit_green.graphics.lineTo(535,473);	
			
			hit_green.graphics.endFill(false);
			hit_green.alpha = 0.0;
			
			hit_green.graphics.precisionHitTest = true;	
			
			this.addChild(hit_orange);
			this.addChild(hit_red);
			this.addChild(hit_purple);
			this.addChild(hit_blue);
			this.addChild(hit_green);
		}
		
		private function CreateShapeButtonsHits():void{
			/*
			private var hit_cube:Shape;
			private var hit_cylinder:Shape;
			private var hit_sphere:Shape;
			*/
			
			hit_cube = new Shape();
			hit_cube.touchable = false;
			hit_cube.graphics.beginFill(0xff0000);
			
			hit_cube.graphics.lineTo(198,316);	
			hit_cube.graphics.lineTo(213,284);	
			hit_cube.graphics.lineTo(261,269);	
			hit_cube.graphics.lineTo(300,286);	
			hit_cube.graphics.lineTo(311,323);	
			hit_cube.graphics.lineTo(295,364);	
			hit_cube.graphics.lineTo(255,381);	
			hit_cube.graphics.lineTo(216,364);	
						
			hit_cube.graphics.endFill(false);
			hit_cube.alpha = 0.0;
			
			hit_cube.graphics.precisionHitTest = true;	
			
			hit_cylinder = new Shape();
			hit_cylinder.touchable = false;
			hit_cylinder.graphics.beginFill(0xff0000);
			
			hit_cylinder.graphics.lineTo(343,323);	
			hit_cylinder.graphics.lineTo(360,284);	
			hit_cylinder.graphics.lineTo(404,268);	
			hit_cylinder.graphics.lineTo(444,288);	
			hit_cylinder.graphics.lineTo(458,325);	
			hit_cylinder.graphics.lineTo(441,364);	
			hit_cylinder.graphics.lineTo(401,381);	
			hit_cylinder.graphics.lineTo(365,367);	
			
			hit_cylinder.graphics.endFill(false);
			hit_cylinder.alpha = 0.0;
			
			hit_cylinder.graphics.precisionHitTest = true;	
			
			
			hit_sphere = new Shape();
			hit_sphere.touchable = false;
			hit_sphere.graphics.beginFill(0xff0000);
			
			hit_sphere.graphics.lineTo(488,323);	
			hit_sphere.graphics.lineTo(503,283);	
			hit_sphere.graphics.lineTo(550,266);	
			hit_sphere.graphics.lineTo(590,291);	
			hit_sphere.graphics.lineTo(601,325);	
			hit_sphere.graphics.lineTo(583,363);	
			hit_sphere.graphics.lineTo(547,381);	
			hit_sphere.graphics.lineTo(507,367);	
			
			hit_sphere.graphics.endFill(false);
			hit_sphere.alpha = 0.0;
			
			hit_sphere.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_cube);
			this.addChild(hit_cylinder);
			this.addChild(hit_sphere);
		}
		private function CreateLeftRightHits():void{
			hit_right = new Shape();
			hit_right.touchable = false;
			hit_right.graphics.beginFill(0xff0000);
			
			hit_right.graphics.lineTo(634,326);	
			hit_right.graphics.lineTo(646,289);	
			hit_right.graphics.lineTo(693,271);	
			hit_right.graphics.lineTo(732,286);	
			hit_right.graphics.lineTo(750,328);	
			hit_right.graphics.lineTo(730,369);	
			hit_right.graphics.lineTo(694,385);	
			hit_right.graphics.lineTo(655,371);	
			
			hit_right.graphics.endFill(false);
			hit_right.alpha = 0.0;
			
			hit_right.graphics.precisionHitTest = true;	
			
			
			
			hit_left = new Shape();
			hit_left.touchable = false;
			hit_left.graphics.beginFill(0xff0000);
			
			hit_left.graphics.lineTo(43,329);	
			hit_left.graphics.lineTo(56,287);	
			hit_left.graphics.lineTo(107,268);	
			hit_left.graphics.lineTo(153,293);	
			hit_left.graphics.lineTo(160,336);	
			hit_left.graphics.lineTo(144,372);	
			hit_left.graphics.lineTo(103,388);	
			hit_left.graphics.lineTo(67,376);	
			
			
			hit_left.graphics.endFill(false);
			hit_left.alpha = 0.0;
			
			hit_left.graphics.precisionHitTest = true;	
			
			this.addChild(hit_right);
			this.addChild(hit_left);
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
							FadeOut((BuildingOffice as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeObj,true
							);
						}else if(SystemOnline === true){
							if(hit_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
								MovePosition('left');
							}else if(hit_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
								MovePosition('right');
							}else if(hit_cube.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								ShapeChanger('cube');
							}else if(hit_cylinder.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								ShapeChanger('cylinder');
							}else if(hit_sphere.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								ShapeChanger('sphere');
							}else if(hit_orange.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								ColorChanger('orange');
							}else if(hit_red.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								ColorChanger('red');
							}else if(hit_purple.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								ColorChanger('purple');
							}else if(hit_blue.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								ColorChanger('blue');
							}else if(hit_green.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								ColorChanger('green');
							}else if(hit_pos_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(CurrentPos == 0){
									
								}else{
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle;
									}
									CurrentPos = 0;	
									highlight.x = 47;
									
									SaveArray['CurrentPos'] = CurrentPos;
								}
								
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeShapePuzzle',SaveArray);
							}else if(hit_pos_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(CurrentPos == 1){
									
								}else{
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle;
									}
									CurrentPos = 1;
									highlight.x = 191;
									SaveArray['CurrentPos'] = CurrentPos;
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeShapePuzzle',SaveArray);
								}
							}else if(hit_pos_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(CurrentPos == 2){
									
								}else{
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle;
									}
									CurrentPos = 2;		
									highlight.x = 338;
									SaveArray['CurrentPos'] = CurrentPos;
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeShapePuzzle',SaveArray);
								}
							}else if(hit_pos_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(CurrentPos == 3){
									
								}else{
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle;
									}
									CurrentPos = 3;	
									highlight.x = 484;
									SaveArray['CurrentPos'] = CurrentPos;
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeShapePuzzle',SaveArray);
								}
							}else if(hit_pos_04.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(CurrentPos == 4){
									
								}else{
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle;
									}
									CurrentPos = 4;	
									highlight.x = 627;
									SaveArray['CurrentPos'] = CurrentPos;
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeShapePuzzle',SaveArray);
								}
							}else if(hit_screen.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmmm... it appears that this door lock is connected to PAL...");							
							}
						}else{
							if(hit_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Nothing happens when I press the button.");	
							}else if(hit_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The devices appears to be switched off.");	
							}else if(hit_cube.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There's an image of a hexagon... or maybe a cube.");	
							}else if(hit_cylinder.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("That looks like a cylinder.");
							}else if(hit_sphere.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a symbolic image of a cube on the button.");
							}else if(hit_orange.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Doesn't seem to be working.");
							}else if(hit_red.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Nothing happens when I press the button.");
							}else if(hit_purple.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Doesn't seem to be working.");
							}else if(hit_blue.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Nothing happens when I press the button.");
							}else if(hit_green.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Doesn't seem to be working.");							
							}else if(hit_screen.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The small screen indicates that the 'System' is offline.");							
							}
							
						}
					}
				}
			}
		}
		
		/*
		if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
		SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle;
		}
		
		if(CurrentPos == 0){
		CurrentPos = 1;
		highlight.x = 191;
		
		}else if(CurrentPos == 1){
		CurrentPos = 2;		
		highlight.x = 338;
		}else if(CurrentPos == 2){
		CurrentPos = 3;	
		highlight.x = 484;
		}else if(CurrentPos == 3){
		CurrentPos = 4;	
		highlight.x = 627;
		}else if(CurrentPos == 4){
		CurrentPos = 0;	
		highlight.x = 47;
		}
		
		SaveArray['CurrentPos'] = CurrentPos;
		(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeShapePuzzle',SaveArray);
		*/
		
		private function ColorChanger(newColor:String):void{
			trace('CurrentPos: '+CurrentPos);
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle;
			}
			this['pos_0'+CurrentPos].texture = this.assets.getTexture(this['pos_0'+CurrentPos+'_shape']+'_'+newColor);
			this['pos_0'+CurrentPos+'_color'] = newColor;
			SaveArray['pos_0'+CurrentPos+'_color'] = newColor;
			SolveArr[CurrentPos] = this['pos_0'+CurrentPos+'_shape']+'_'+this['pos_0'+CurrentPos+'_color'];
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeShapePuzzle',SaveArray);
			Solve();
		}
		
		private function ShapeChanger(newShape:String):void{
			trace('CurrentPos: '+CurrentPos);
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle;
			}
			this['pos_0'+CurrentPos].texture = this.assets.getTexture(newShape+'_'+this['pos_0'+CurrentPos+'_color']);
			this['pos_0'+CurrentPos+'_shape'] = newShape;
			SaveArray['pos_0'+CurrentPos+'_shape'] = newShape;
			SolveArr[CurrentPos] = this['pos_0'+CurrentPos+'_shape']+'_'+this['pos_0'+CurrentPos+'_color'];
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeShapePuzzle',SaveArray);
			
			Solve();
		}
		
		private function MovePosition(LeftRight:String):void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle;
			}
			if(LeftRight == 'right'){
				if(CurrentPos == 0){
					CurrentPos = 1;
					highlight.x = 191;
					
				}else if(CurrentPos == 1){
					CurrentPos = 2;		
					highlight.x = 338;
				}else if(CurrentPos == 2){
					CurrentPos = 3;	
					highlight.x = 484;
				}else if(CurrentPos == 3){
					CurrentPos = 4;	
					highlight.x = 627;
				}else if(CurrentPos == 4){
					CurrentPos = 0;	
					highlight.x = 47;
				}
			}else{
				if(CurrentPos == 0){
					CurrentPos = 4;
					highlight.x = 627;
				}else if(CurrentPos == 1){
					CurrentPos = 0;		
					highlight.x = 47;
				}else if(CurrentPos == 2){
					CurrentPos = 1;	
					highlight.x = 191;
				}else if(CurrentPos == 3){
					CurrentPos = 2;	
					highlight.x = 338;
				}else if(CurrentPos == 4){
					CurrentPos = 3;	
					highlight.x = 484;
				}
			}
			SaveArray['CurrentPos'] = CurrentPos;
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeShapePuzzle',SaveArray);
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
		
		public function Solve():void{
			if(TableArr[0] == 'NotSolvable'){
				trace("Not Solvable");
			}else{
				if(TableArr[0] == SolveArr[0]){
					trace("TableArr[0] "+TableArr[0]);
					trace("SolveArr[0] "+SolveArr[0]);
					if(TableArr[1] == SolveArr[1]){
						trace("TableArr[1] "+TableArr[1]);
						trace("SolveArr[1] "+SolveArr[1]);
						if(TableArr[2] == SolveArr[2]){
							trace("TableArr[2] "+TableArr[2]);
							trace("SolveArr[2] "+SolveArr[2]);
							if(TableArr[3] == SolveArr[3]){
								trace("TableArr[3] "+TableArr[3]);
								trace("SolveArr[3] "+SolveArr[3]);
								if(TableArr[4] == SolveArr[4]){
									
									Animating = true;
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicWaffle();
									green_light.alpha = 1;
									red_light.alpha = 0;
									errorText.text = 'PAL has verfied entry: Access granted. Opening...';
									trace("TableArr[4] "+TableArr[4]);
									trace("SolveArr[4] "+SolveArr[4]);
									trace("SOLVED");
									trace("SOLVED");
									trace("SOLVED");
									
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeShapePuzzle;
									}
									SaveArray['Solved'] = 'Yes';
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeShapePuzzle',SaveArray);
									
									
									delayedCall = new DelayedCall(function():void{									
										FadeOut((BuildingOffice as Class), 
											(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeObj,true
										);
										Animating = false;
									}, 2);
									Starling.juggler.add(delayedCall);									
								}else{
									trace("TableArr[4] "+TableArr[4]);
									trace("SolveArr[4] "+SolveArr[4]);
									trace("FAIL on 4");
								}
							}else{
								trace("TableArr[3] "+TableArr[3]);
								trace("SolveArr[3] "+SolveArr[3]);
								trace("FAIL on 3");
							}
						}else{
							trace("TableArr[2] "+TableArr[2]);
							trace("SolveArr[2] "+SolveArr[2]);
							trace("FAIL on 2");
						}
					}else{
						
						trace("FAIL on 1");
						trace("TableArr[1] "+TableArr[1]);
						trace("SolveArr[1] "+SolveArr[1]);
					}
				}else{
					trace("FAIL on 0");
					trace("TableArr[0] "+TableArr[0]);
					trace("SolveArr[0] "+SolveArr[0]);
				}
			}
		}
	
		private function RunSolve():void{
			
		}
		
		public function Exit(blackOut:Boolean = false):void{
			
			
			
			this.assets.removeTexture("BuildingOfficeShapePuzzle_Sprite_01",true);
			this.assets.removeTexture("BuildingOfficeShapePuzzle_Sprite_02",true);
			this.assets.removeTextureAtlas("BuildingOfficeShapePuzzle_Sprite_01",true);
			this.assets.removeTextureAtlas("BuildingOfficeShapePuzzle_Sprite_02",true);
			
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeShapePuzzle_01");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeShapePuzzle_02");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeShapePuzzle_03");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeShapePuzzle_04");
			
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
