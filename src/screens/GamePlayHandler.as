package screens
{

	import flash.filesystem.File;
	import flash.utils.getDefinitionByName;
	
	import screens.hud.Hint;
	import screens.hud.Menu;
	import screens.hud.ReadOut;
	import screens.ingamescreens.*;
	import screens.inventory.Inventory;
	
	import starling.animation.DelayedCall;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.RenderTexture;
	import starling.textures.Texture;
	import starling.utils.AssetManager;
	import screens.notebook.NoteBook;

	//import screens.ingamescreens.WheelLockEmbedded;
//	import screens.ingamescreens.FourDiscEmbedded;
	
	public class GamePlayHandler extends Sprite
	{
	
		public var _assets:AssetManager;
		
		public var BlackOutRect:Quad;
		public var BORFadeOutTween:Tween;
		
		//public var hud:HUD;
		public var HintObj:Hint;
		public var InventoryObj:Inventory; 
		public var ReadOutObj:ReadOut; 
		public var MenuButtonObj:Menu;
		public var NoteBookObj:NoteBook;
		
		
		public var IntroSequenceObj:IntroSequence;
		public var IntroSequencePartTwoObj:IntroSequencePartTwo;
		

	//	public var RaftObj:Raft;
		public var BathroomObj:Bathroom;
		public var BathroomDuctObj:BathroomDuct;
		public var BathroomDuctExitObj:BathroomDuctExit;
		public var BathroomDuctFanObj:BathroomDuctFan;
		public var BathroomWallObj:BathroomWall;
		public var BathroomCabinetObj:BathroomCabinet;
		
		
		
		public var BuildingOfficeObj:BuildingOffice;
		public var BuildingOfficeCopierObj:BuildingOfficeCopier;
		public var BuildingOfficeBackObj:BuildingOfficeBack;
		public var BuildingOfficeComputerObj:BuildingOfficeComputer;
		public var BuildingOfficeDeskObj:BuildingOfficeDesk;
		public var BuildingOfficePushBoxObj:BuildingOfficePushBox;
		public var BuildingOfficeShapePuzzleObj:BuildingOfficeShapePuzzle;
		public var BuildingOfficeBookCaseObj:BuildingOfficeBookCase;
		public var BuildingOfficeTableObj:BuildingOfficeTable;
		public var BuildingOfficeChalkboardObj:BuildingOfficeChalkboard;
		public var BuildingOfficePaintingObj:BuildingOfficePainting;
		public var BuildingOfficeLockObj:BuildingOfficeLock;
		public var BuildingOfficeTablePaperObj:BuildingOfficeTablePaper;
		
		
		public var ContainmentObj:Containment;
		public var ContainmentHatchObj:ContainmentHatch;
		public var ContainmentControlObj:ContainmentControl;
		public var ContainmentInteriorObj:ContainmentInterior;
		public var ContainmentCalibratorObj:ContainmentCalibrator;
		public var ContainmentConsoleObj:ContainmentConsole;
		public var ContainmentQuantumObj:ContainmentQuantum;
		public var ContainmentUlamObj:ContainmentUlam;
		
		public var DeepLabObj:DeepLab;
		public var DeepLabDeskObj:DeepLabDesk;
		public var DeepLabFridgeObj:DeepLabFridge;
		
		public var DirLockObj:DirLock;
		
		public var ElectricBoxObj:ElectricBox;
		public var ElectricBoxSmallObj:ElectricBoxSmall;
		
		public var ElevatorObj:Elevator;
		public var ElevatorPanelObj:ElevatorPanel;
		public var ElevatorFuseObj:ElevatorFuse;
		
		public var ExteriorObj:Exterior;
		public var ExteriorRearObj:ExteriorRear;
		public var ExteriorRearDumpsterObj:ExteriorRearDumpster;		
		public var ExteriorGrateObj:ExteriorGrate;
		public var ExteriorCarFrontObj:ExteriorCarFront;
		public var ExteriorCarRearObj:ExteriorCarRear;
		public var ExteriorCubeObj:ExteriorCube;
		public var ExteriorCubeInfoObj:ExteriorCubeInfo;
		public var ExteriorFireEscapeObj:ExteriorFireEscape;
		public var ExteriorFireEscapeUpperObj:ExteriorFireEscapeUpper;
		
		public var GreenHouseObj:GreenHouse;
		public var GreenHouseTableObj:GreenHouseTable;
		public var GreenHouseMicroscopeObj:GreenHouseMicroscope;
		public var GreenHouseSporeObj:GreenHouseSpore;
		public var GreenHouseVenusObj:GreenHouseVenus;
		public var GreenHouseDeepObj:GreenHouseDeep;
		public var GreenHouseDeepBulbObj:GreenHouseDeepBulb;
		public var GreenHouseDeepShelfObj:GreenHouseDeepShelf;
		
		
		public var GeneticsRoomObj:GeneticsRoom;
		public var GeneticsRoomElectronObj:GeneticsRoomElectron;
		public var GeneticsRoomMicroscopeObj:GeneticsRoomMicroscope;
		public var GeneticsRoomDeskObj:GeneticsRoomDesk;
		public var GeneticsRoomBoxObj:GeneticsRoomBox;
		public var GeneticsRoomLensPuzzleObj:GeneticsRoomLensPuzzle;
		
		public var LabObj:Lab;
		public var LabAsteriodObj:LabAsteriod;
		public var LabAsteriodPuzzleObj:LabAsteriodPuzzle;
		public var LabDeskObj:LabDesk;
		public var LabHexPuzzleObj:LabHexPuzzle;
		public var LabDoorObj:LabDoor;
		
		public var LiftObj:Lift;
		public var LiftElevatorObj:LiftElevator;
		public var LiftWallObj:LiftWall;
		
		public var LobbyObj:Lobby;
	//	public var LobbyLeftObj:LobbyLeft;
		public var LobbyCounterObj:LobbyCounter;
	//	public var LobbyElevatorObj:LobbyElevator;
		public var LobbyDeskObj:LobbyDesk;
		public var LobbyComputerObj:LobbyComputer;
		
		public var OfficeObj:Office;
		public var OfficeDeskObj:OfficeDesk;
		public var OfficeKitchenObj:OfficeKitchen;
		public var OfficeKitchenSinkObj:OfficeKitchenSink;
		public var OfficeCircuitObj:OfficeCircuit;
	//	public var OfficeCornerObj:OfficeCorner;
		public var OfficeProgrammerObj:OfficeProgrammer;
		public var OfficeDraftsmanObj:OfficeDraftsman;
		public var OfficeAdimmObj:OfficeAdimm;
		public var OfficeSplatComputerObj:OfficeSplatComputer;
		public var OfficeBugWireObj:OfficeBugWire;
		public var OfficeComputerObj:OfficeComputer;
		
		public var OuttroWormholeObj:OuttroWormhole;
		public var OuttroJupiterObj:OuttroJupiter;
		public var OuttroCreditsObj:OuttroCredits;
		
		public var SecondFloorHallObj:SecondFloorHall;
//		public var SecondFloorCorridorObj:SecondFloorCorridor;
		public var SecondFloorCartObj:SecondFloorCart;
		public var SecondFloorPaintingObj:SecondFloorPainting;
		
		public var ServerRoomObj:ServerRoom;
		public var ServerRoomPalObj:ServerRoomPal;
		public var ServerRoomComputerObj:ServerRoomComputer;
		public var ServerRoomTableObj:ServerRoomTable;
		
		public var SpinWheelObj:SpinWheel;
		
		public var RoboticsRoomObj:RoboticsRoom;
		public var RoboticsDeskObj:RoboticsDesk;
		public var RoboticsBodyObj:RoboticsBody;
		public var RoboticsRoomKomaObj:RoboticsRoomKoma;
		public var RoboticsRoomKomaPuzzleObj:RoboticsRoomKomaPuzzle;
		
		public var RocketRoomObj:RocketRoom;
		public var RocketRoomComputerDeskObj:RocketRoomComputerDesk;
		public var RocketRoomDeskObj:RocketRoomDesk;
		public var RocketRoomComputerObj:RocketRoomComputer;
		public var RocketRoomSatStationObj:RocketRoomSatStation;
		public var RocketRoomSatObj:RocketRoomSat;
		public var RocketRoomBoardObj:RocketRoomBoard;
		public var RocketRoomCreatureObj:RocketRoomCreature;
		
		public var ThirdFloorHallObj:ThirdFloorHall;
		
		protected var Loaded:Sprite;
		protected var PrevLoaded:Sprite;

		
		public var AlphaFadeTween:Tween;
		
		private var tmpLoadedTex:RenderTexture;
		private var tmpLoaded:Image;

		private var _game:Game;
		

		
		
		public function GamePlayHandler(New:Boolean,assets:AssetManager,game:Game,_BlackOutRect)
		{

			super();
			_game = game;
			_assets = assets;
			BlackOutRect =_BlackOutRect;
			
			game.MusicObj.currentSong = null;
			
			

			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);

		}
		public function createMenuButton():void{
			
		}
		
		private function onAddedToStage(event:Event):void{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
			if(_game.CheckAsset('inventory_01') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/Inventory/Inventory_SpriteSheet_01.png'));
				_game.TrackAssets('inventory_01');
				trace("INVEN 01 NOT LOADED");
			}else{
				trace("INVEN 01 LOADED");
			}
			if(_game.CheckAsset('inventory_02') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/Inventory/Inventory_SpriteSheet_01.xml'));
				_game.TrackAssets('inventory_02');
				trace("INVEN 02 NOT LOADED");
			}else{
				trace("INVEN 02 LOADED");
			}
			if(_game.CheckAsset('inventory_03') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/Inventory/Inventory_SpriteSheet_02.png'));
				_game.TrackAssets('inventory_03');
				trace("INVEN 03 NOT LOADED");
			}else{
				trace("INVEN 03 LOADED");
			}
			if(_game.CheckAsset('inventory_04') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/Inventory/Inventory_SpriteSheet_02.xml'));
				_game.TrackAssets('inventory_04');
				trace("INVEN 04 NOT LOADED");
			}else{
				trace("INVEN 04 LOADED");
			}
			if(_game.CheckAsset('inventory_05') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/Inventory/armedItem_bg_v002a001.png'));
				_game.TrackAssets('inventory_05');
				trace("INVEN 05 NOT LOADED");
			}else{
				trace("INVEN 05 LOADED");
			}

			
			
			
			
			if(_game.CheckAsset('hud_readOut') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/ReadOut/readOutBar_v003a001.png'));
				_game.TrackAssets('hud_readOut');
				trace("HUD READOUT NOT LOADED");
			}else{
				trace("HUD READOUT LOADED");
			}
			if(_game.CheckAsset('hud_menu') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/Menu/element_hud_menu_v003a001.png'));
				_game.TrackAssets('hud_menu');
				trace("HUD MENU NOT LOADED");
			}else{
				trace("HUD MENU LOADED");
			}
			if(_game.CheckAsset('hud_hint_01') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/Hint/questionMake_v001a001.png'));
				_game.TrackAssets('hud_hint_01');
				trace("HUD HINT NOT LOADED");
			}else{
				trace("HUD HINT LOADED");
			}
		
			if(_game.CheckAsset('hud_hint_02') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/Hint/hint_bg_03a002.png'));
				_game.TrackAssets('hud_hint_02');
				trace("HUD HINT NOT LOADED");
			}else{
				trace("HUD HINT LOADED");
			}
		
			if(_game.CheckAsset('goback') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/GoBack/element_hud_goBack_v003a001.png'));
				_game.TrackAssets('goback');
				trace("goback NOT LOADED");
			}else{
				trace("goback LOADED");
			}
			
		/*	if((stage.getChildAt(0) as Object).CheckAsset('goback') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/GoBack/element_hud_goBack_v003a001.png'));
				(stage.getChildAt(0) as Object).TrackAssets('goback');
			}
		*/	
			
			if(_game.CheckAsset('notebook_00') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/NoteBook/NoteBook_Sprite_00.png'));
				_game.TrackAssets('notebook_00');
				trace("notebook_00 NOT LOADED");
			}else{
				trace("notebook_00 NOT LOADED");
			}
			if(_game.CheckAsset('notebook_01') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/NoteBook/NoteBook_Sprite_00.xml'));
				_game.TrackAssets('notebook_01');
				trace("notebook_01 NOT LOADED");
			}else{
				trace("notebook_01 NOT LOADED");
			}
			
			if(_game.CheckAsset('inven_detail_01') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v001.png'));
				_game.TrackAssets('inven_detail_01');
				trace("inven_detail_01 NOT LOADED");
			}else{
				trace("inven_detail_01 LOADED");
			}
			if(_game.CheckAsset('inven_detail_02') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v001.xml'));
				_game.TrackAssets('inven_detail_02');
				trace("inven_detail_02 NOT LOADED");
			}else{
				trace("inven_detail_02 LOADED");
			}
			
			
			
			if(_game.CheckAsset('inven_detail_03') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v002.png'));
				_game.TrackAssets('inven_detail_03');
				trace("inven_detail_03 NOT LOADED");
			}else{
				trace("inven_detail_03 LOADED");
			}
			if(_game.CheckAsset('inven_detail_04') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v002.xml'));
				_game.TrackAssets('inven_detail_04');
				trace("inven_detail_04 NOT LOADED");
			}else{
				trace("inven_detail_04 LOADED");
			}
			
			if(_game.CheckAsset('inven_detail_05') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v003.png'));
				_game.TrackAssets('inven_detail_05');
				trace("inven_detail_05 NOT LOADED");
			}else{
				trace("inven_detail_05 LOADED");
			}
			if(_game.CheckAsset('inven_detail_06') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v003.xml'));
				_game.TrackAssets('inven_detail_06');
				trace("inven_detail_06 NOT LOADED");
			}else{
				trace("inven_detail_06 LOADED");
			}
			if(_game.CheckAsset('inven_detail_07') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v004.png'));
				_game.TrackAssets('inven_detail_07');
				trace("inven_detail_07 NOT LOADED");
			}else{
				trace("inven_detail_07 LOADED");
			}
			if(_game.CheckAsset('inven_detail_08') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v004.xml'));
				_game.TrackAssets('inven_detail_08');
				trace("inven_detail_08 NOT LOADED");
			}else{
				trace("inven_detail_08 LOADED");
			}

			if(_game.CheckAsset('inven_detail_09') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v005.png'));
				_game.TrackAssets('inven_detail_09');
				trace("inven_detail_09 NOT LOADED");
			}else{
				trace("inven_detail_09 LOADED");
			}
			if(_game.CheckAsset('inven_detail_10') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v005.xml'));
				_game.TrackAssets('inven_detail_10');
				trace("inven_detail_10 NOT LOADED");
			}else{
				trace("inven_detail_10 LOADED");
			}
			
			if(_game.CheckAsset('inven_detail_11') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v006.png'));
				_game.TrackAssets('inven_detail_11');
				trace("inven_detail_11 NOT LOADED");
			}else{
				trace("inven_detail_11 LOADED");
			}
			if(_game.CheckAsset('inven_detail_12') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v006.xml'));
				_game.TrackAssets('inven_detail_12');
				trace("inven_detail_12 NOT LOADED");
			}else{
				trace("inven_detail_12LOADED");
			}
			
			
			if(_game.CheckAsset('inven_detail_13') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v007.png'));
				_game.TrackAssets('inven_detail_13');
				trace("inven_detail_13 NOT LOADED");
			}else{
				trace("inven_detail_13 LOADED");
			}
			if(_game.CheckAsset('inven_detail_14') === false){
				this._assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/InventoryDetails/InvenDetails_SpriteSheet_v007.xml'));
				_game.TrackAssets('inven_detail_14');
				trace("inven_detail_14 NOT LOADED");
			}else{
				trace("inven_detail_14LOADED");
			}
			
			
			
		
			//this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/IntroSequence'));
			this._assets.loadQueue(function(n:Number):void{
				if(n==1){
					
					
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.CurrentRoomClass != undefined){
						
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ElevatorPanel","ElevatorPanelObj");
	
						var c_name:String = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.CurrentRoomClass;
						var sceneClass:Class = getDefinitionByName("screens.ingamescreens."+c_name) as Class;
						var o_name:Sprite = ((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.CurrentRoomName) as Sprite;
						
						addInventory();
						LoadScene(sceneClass,o_name,true);
						PrevLoaded = o_name;
						BlackOutRectangleFade(0,1);
						
						
					}else{
						//LoadScene(AstroidSurface,AstroidSurfaceObj,true);
						
						LoadIntro();
					}			
					
					//onLoadAssets();
					//	(stage.getChildAt(0) as Object).createMenuButton();
				}				
			});	
			
			
		
		}
		private function LoadIntro():void{
			
			
			
			
			IntroSequenceObj = new IntroSequence(this._assets,this._game);
			Loaded = IntroSequenceObj;
			PrevLoaded = IntroSequenceObj;
			this.addChild(IntroSequenceObj);
		//	BlackOutRectangleFade(0,2);
		}
		public function addInventory():void{
	//		texture2 = Texture.fromBitmap(new FakeTexture());
	//		xml2 = XML(new FakeXml());
	//		TextField.registerBitmapFont(new BitmapFont(texture2, xml2));
			
			
			ReadOutObj = new ReadOut(_assets); 
			MenuButtonObj = new Menu(_assets);
			InventoryObj = new Inventory(_game,_assets); 
			if((stage.getChildAt(0) as Object).SavedGame.SavedHintObj.data.Enabled != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedHintObj.data.Enabled === true){
						HintObj = new Hint(_assets,_game);
				}
			}
			ReadOutObj.x = 0;
			ReadOutObj.y = 0;			
			this.addChildAt(ReadOutObj,0);	
			
			
			
			
			InventoryObj.x = 0;
			InventoryObj.y = 0;			
			this.addChildAt(InventoryObj,0);
		
			
			NoteBookObj = new NoteBook(_game, _assets);
			NoteBookObj.x = 0;
			NoteBookObj.y = 0;			
			this.addChildAt(NoteBookObj,1);	
			
			//if(_game.SavedGame.SavedGameObj.data.CoastSurf != undefined){
			//	if(_game.SavedGame.SavedGameObj.data.CoastSurf['book'] == 'PickedUp'){
			//			NoteBookObj.ActivateNoteBook();
			//	}
			//}
			NoteBookObj.ActivateNoteBook()
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedHintObj.data.Enabled != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedHintObj.data.Enabled === true){
					HintObj.x = 0;
					HintObj.y = 0;	
					this.addChildAt(HintObj,2);		
				}
			}
			MenuButtonObj.x = 695;
			MenuButtonObj.y = 407;
			this.addChildAt(MenuButtonObj,3);
			
			
			
		}
		public function removeInventory():void{
			this.removeChild(InventoryObj);
			this.removeChild(ReadOutObj);
			this.removeChild(NoteBookObj);	
			if((stage.getChildAt(0) as Object).SavedGame.SavedHintObj.data.Enabled != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedHintObj.data.Enabled === true){
					this.removeChild(HintObj);
				}
			}
		}
		public function removeMenuButton():void{
			this.removeChild(MenuButtonObj);
		}
		
		
		
		
		public function AlphaFade(FadeTo:Number = 1,duration:Number = 1,OnComplateCallback:Function = null,RmvLoaded:Boolean = false):void{
	//			ReadOutObj.HideReadOut();					
			/*	var tmpLoadedTex:RenderTexture = new RenderTexture(800,480);*/
				tmpLoadedTex.draw(PrevLoaded);
			/*	var tmpLoaded:Image = new Image(tmpLoadedTex);
				this.addChildAt(tmpLoaded,1);*/

				PrevLoaded.alpha = 0.0;	
				tmpLoaded.alpha = 1;
				AlphaFadeTween = new Tween(tmpLoaded, duration, Transitions.LINEAR);
				AlphaFadeTween.fadeTo(FadeTo);
				AlphaFadeTween.onComplete = function():void{
					if(OnComplateCallback != null){
						OnComplateCallback();
						removeChild(tmpLoaded);
						tmpLoaded.dispose();
						tmpLoadedTex.dispose();
					//	OnComplateCallback;
						trace('FADE CALLBACK2');
					
					}else{
						removeChild(tmpLoaded);
					}
				};	

			Starling.juggler.add(AlphaFadeTween);	
		}
		
		
		public function LoadSceneAlphaFade(ToLoad:Class = null, ToLoadName:Sprite = null, callback:Function = null, SetPrev:Boolean = false):void{
			if(ToLoad != null){
				PrevLoaded = Loaded;
				ToLoadName = new ToLoad(_assets,_game);
				Loaded = ToLoadName;
				this.addChildAt(Loaded,0);
				if(SetPrev === true){
					PrevLoaded = Loaded;
				}
				if(callback != null){
					var scaleFactor:Number;
					if(Starling.contentScaleFactor > 1){
						scaleFactor = 1;
					}else{
						scaleFactor = Starling.contentScaleFactor;
					}
					
					tmpLoadedTex = new RenderTexture(800,512,true,scaleFactor);
					//tmpLoadedTex = new RenderTexture(800,512);
					tmpLoaded = new Image(tmpLoadedTex);
					this.addChildAt(tmpLoaded,1);
					var delayedCall:DelayedCall = new DelayedCall(function(){AlphaFade(0,1.0,callback);},0.5);
					Starling.juggler.add(delayedCall);	
				}
				trace("LOADING... "+Loaded);
			}
		}
		
		
		public function BlackOutRectangleFade(FadeTo:Number = 1,duration:Number = 1,OnComplateCallback:Function = null,level:int = 2,hideReadOut:Boolean = true):void{
			if(hideReadOut === true){
			//	ReadOutObj.HideReadOut();	
			}
			if(FadeTo == 1){
				BlackOutRect.alpha = 0;
				trace("Rect 0");
			}else{
				BlackOutRect.alpha = 1;
				trace("Rect 1");
			}
				
				BlackOutRect.touchable = true;
				this.addChild(BlackOutRect);
				BORFadeOutTween = new Tween(BlackOutRect, duration, Transitions.LINEAR);
				BORFadeOutTween.fadeTo(FadeTo);
				BORFadeOutTween.onComplete = function():void{OnCompleteBlackRectFade(OnComplateCallback)};
				Starling.juggler.add(BORFadeOutTween);		
				
			
		}
		public function OnCompleteBlackRectFade(callback:Function = null):void{
			BlackOutRect.touchable = false;
			this.removeChild(BlackOutRect);
			if(callback == null){
				
			}else{
				callback(true);
			}
			
		}
		public function RemoveIntroSequence():void{
			this.removeChild(IntroSequenceObj);
			this.IntroSequenceObj.dispose();
			this.IntroSequenceObj = null;
		}
		
		public function LoadScene(ToLoad:Class = null,
								  ToLoadName:Sprite = null,
								  SetPrev:Boolean = false
		):void{
			
			if(ToLoad != null){
				
				PrevLoaded = Loaded;
				ToLoadName = new ToLoad(_assets,_game);
				Loaded = ToLoadName;
				this.addChildAt(Loaded,0);
				if(SetPrev === true){
					PrevLoaded = Loaded;
				}
				
				trace("LOADING... "+Loaded);
			}
		}
	//	public function UnloadScene(ToUnload:Class = null, ToUnloadName:DisplayObject = null)
		public function UnloadScene(RmvLoaded:Boolean = false)
			:void{
				if(RmvLoaded === true){
					trace(Loaded+" Loaded*");
					this.removeChild(Loaded);
					trace(Loaded+" Loaded*");
					Loaded.dispose();
					Loaded = null;
					PrevLoaded = null;
					trace(Loaded+" Loaded*");
					trace(PrevLoaded+" PrevLoaded");		
				}else{

					trace(PrevLoaded+" PrevLoaded*");
					this.removeChild(PrevLoaded);
					trace(PrevLoaded+" PrevLoaded*");
			//		PrevLoaded.dispose();
					PrevLoaded = null;
					trace(PrevLoaded+" PrevLoaded");
				}
		//	}			
		}
		public function FadeOut():void{
			
			if((stage.getChildAt(0) as Object).MusicObj.currentSong != null){
				
				
				(stage.getChildAt(0) as Object).MusicObj.soundManager.tweenVolumeComplex(
					((stage.getChildAt(0) as Object).MusicObj.currentSong as String),
					0,1,'stop');
				
			}
			
			if((stage.getChildAt(0) as Object).AmbientObj.currentAmbient != null){
				(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex(
					((stage.getChildAt(0) as Object).AmbientObj.currentAmbient as String),
					0,1,'stop');
			}
			var delayedCall:DelayedCall = new DelayedCall(function():void{
				(stage.getChildAt(0) as Object).MusicObj.soundManager.stopAllSounds();
				(stage.getChildAt(0) as Object).AmbientObj.soundManager.stopAllSounds();
			},0.75);
			Starling.juggler.add(delayedCall);
			
			(stage.getChildAt(0) as Object).BlackOutRectangleFade(1,1,Exit);
		}
		
		
		public function Exit():void{
		//	Starling.juggler.purge();
		//	(stage.getChildAt(0) as Object).MusicObj.soundManager.muteAll();
			MenuButtonObj.removeChild(MenuButtonObj);
			//MenuButtonObj.dispose();
			this.removeChild(MenuButtonObj);
			MenuButtonObj = null;
			this.removeChild(BlackOutRect);
			//BlackOutRect.graphics.clear();
		//	BlackOutRect.dispose();
		//	BlackOutRect = null;
			BORFadeOutTween = null;
			
			//public var hud:HUD;
			this.removeChild(InventoryObj);
		 //	InventoryObj.dispose();
			InventoryObj = null
			this.removeChild(MenuButtonObj);
			//MenuButtonObj.dispose();
			MenuButtonObj = null;
//			IntroSequenceObj
//			FrontDoorObj
//			BirdHouseObj
//			FoyerObj:Foyer	
			
			//var c_name:String = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.CurrentRoomClass;
			//var sceneClass:Class = getDefinitionByName("screens.ingamescreens."+c_name) as Class;
			//var o_name:Sprite = ((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.CurrentRoomName) as Sprite;
			
			UnloadScene(true);
//			UnloadScene(sceneClass,o_name);
	//		c_name = null;
	//		sceneClass = null;
//			o_name.dispose();
	//		o_name =null;
			
			(stage.getChildAt(0) as Object).unLoadGamePlay();
		}
		
		

	}
}