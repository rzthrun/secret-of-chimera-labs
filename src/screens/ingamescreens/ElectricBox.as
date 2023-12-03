package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	import screens.ingamescreens.ElectricBoxSquare;
	
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
	import starling.utils.deg2rad;
	import starling.utils.rad2deg;
	
	public class ElectricBox extends Sprite
	{
		public var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var switch_on:Image;
		private var bottom:Image;
		
		//private30 var grid_00:Image;
		//private var grid_01:Image;
	//	private var grid_02:Image;
	//	private var grid_03:Image;
		
		public var grid_00:ElectricBoxSquare;
		public var grid_01:ElectricBoxSquare;
		public var grid_02:ElectricBoxSquare;
		public var grid_03:ElectricBoxSquare;
		public var grid_04:ElectricBoxSquare;
		private var grid_05:ElectricBoxSquare;
		private var grid_06:ElectricBoxSquare;
		
		private var grid_07:ElectricBoxSquare;
		private var grid_08:ElectricBoxSquare;
		private var grid_09:ElectricBoxSquare;
		private var grid_10:ElectricBoxSquare;
		private var grid_11:ElectricBoxSquare;
		private var grid_12:ElectricBoxSquare;
		private var grid_13:ElectricBoxSquare;
		
		private var grid_14:ElectricBoxSquare;
		private var grid_15:ElectricBoxSquare;
		private var grid_16:ElectricBoxSquare;
		private var grid_17:ElectricBoxSquare;
		private var grid_18:ElectricBoxSquare;
		private var grid_19:ElectricBoxSquare;
		private var grid_20:ElectricBoxSquare;
		
		private var grid_21:ElectricBoxSquare;
		private var grid_22:ElectricBoxSquare;
		private var grid_23:ElectricBoxSquare;
		private var grid_24:ElectricBoxSquare;
		private var grid_25:ElectricBoxSquare;
		private var grid_26:ElectricBoxSquare;
		private var grid_27:ElectricBoxSquare;
		
		private var grid_28:ElectricBoxSquare;
		private var grid_29:ElectricBoxSquare;
		private var grid_30:ElectricBoxSquare;
		private var grid_31:ElectricBoxSquare;
		private var grid_32:ElectricBoxSquare;
		private var grid_33:ElectricBoxSquare;
		private var grid_34:ElectricBoxSquare;
		
		private var hit_00:Shape;
		private var hit_01:Shape;
		private var hit_02:Shape;
		private var hit_03:Shape;
		private var hit_04:Shape;
		private var hit_05:Shape;
		private var hit_06:Shape;

		private var hit_07:Shape;
		private var hit_08:Shape;
		private var hit_09:Shape;
		private var hit_10:Shape;
		private var hit_11:Shape;
		private var hit_12:Shape;
		private var hit_13:Shape;
		
		private var hit_14:Shape;
		private var hit_15:Shape;
		private var hit_16:Shape;
		private var hit_17:Shape;
		private var hit_18:Shape;
		private var hit_19:Shape;
		private var hit_20:Shape;
		
		private var hit_21:Shape;
		private var hit_22:Shape;
		private var hit_23:Shape;
		private var hit_24:Shape;
		private var hit_25:Shape;
		private var hit_26:Shape;
		private var hit_27:Shape;
		
		private var hit_28:Shape;
		private var hit_29:Shape;
		private var hit_30:Shape;
		private var hit_31:Shape;
		private var hit_32:Shape;
		private var hit_33:Shape;
		private var hit_34:Shape;
		
		private var hit_switch:Shape;
		
		private var GridArray:Array = new Array();
		
		private var ClearedArr:Array = new Array();
		private var ClosedArr:Array = new Array("00",
			"01",
			"02",
			"03",
			"04",
			"05",
			"06",
			"07",
			"08",
			"09",
			"10",
			"11",
			"12",
			"13",
			"14",
			"15",
			"16",
			"17",
			"18",
			"19",
			"20",
			"21",
			"22",
			"23",
			"24",
			"25",
			"26",
			"27",
			"28",
			"29",
			"30",
			"31",
			"32",
			"33",
			"34"
		);
		
		private var x_default:int = 138;
		private var y_default:int = 63;
		
		private var x_spacing:Number = 85;
		private var y_spacing:Number = 85;
		
		public var grid00_arr:Array = new Array(null, null, "01","07");
		public var grid01_arr:Array = new Array("00", null, "02","08");
		public var grid02_arr:Array = new Array("01", null, "03","09");
		public var grid03_arr:Array = new Array("02", null, "04","10");
		public var grid04_arr:Array = new Array("03", null, "05","11");
		public var grid05_arr:Array = new Array("04", null, "06","12");
		public var grid06_arr:Array = new Array("05", null, null,"13");
		
		public var grid07_arr:Array = new Array(null, "00", "08","14");
		public var grid08_arr:Array = new Array("07", "01", "09","15");
		public var grid09_arr:Array = new Array("08", "02", "10","16");
		public var grid10_arr:Array = new Array("09", "03", "11","17");
		public var grid11_arr:Array = new Array("10", "04", "12","18");
		public var grid12_arr:Array = new Array("11", "05", "13","19");
		public var grid13_arr:Array = new Array("12", "06", null,"20");
		
		public var grid14_arr:Array = new Array(null, "07", "15","21");
		public var grid15_arr:Array = new Array("14", "08", "16","22");
		public var grid16_arr:Array = new Array("15", "09", "17","23");
		public var grid17_arr:Array = new Array("16", "10", "18","24");
		public var grid18_arr:Array = new Array("17", "11", "19","25");
		public var grid19_arr:Array = new Array("18", "12", "20","26");
		public var grid20_arr:Array = new Array("19", "13", null,"27");
		
		public var grid21_arr:Array = new Array(null, "14", "22","28");
		public var grid22_arr:Array = new Array("21", "15", "23","29");
		public var grid23_arr:Array = new Array("22", "16", "24","30");
		public var grid24_arr:Array = new Array("23", "17", "25","31");
		public var grid25_arr:Array = new Array("24", "18", "26","32");
		public var grid26_arr:Array = new Array("25", "19", "27","33");
		public var grid27_arr:Array = new Array("26", "20", null,"34");
		
		public var grid28_arr:Array = new Array(null, "21", "29",null);
		public var grid29_arr:Array = new Array("28", "22", "30",null);
		public var grid30_arr:Array = new Array("29", "23", "31",null);
		public var grid31_arr:Array = new Array("30", "24", "32",null);
		public var grid32_arr:Array = new Array("31", "25", "33",null);
		public var grid33_arr:Array = new Array("32", "26", "34",null);
		public var grid34_arr:Array = new Array("33", "27", null,null);
		//	private var hit_elevator_door:Shape;
		
		public var grid00_pos:String = "0";
		public var grid01_pos:String = "0";
		public var grid02_pos:String = "0";
		public var grid03_pos:String = "0";
		public var grid04_pos:String = "0";
		public var grid05_pos:String = "0";
		public var grid06_pos:String = "0";
		public var grid07_pos:String = "0";
		public var grid08_pos:String = "0";
		public var grid09_pos:String = "0";
		public var grid10_pos:String = "0";
		public var grid11_pos:String = "0";
		public var grid12_pos:String = "0";
		public var grid13_pos:String = "0";
		public var grid14_pos:String = "0";
		public var grid15_pos:String = "0";
		public var grid16_pos:String = "0";
		public var grid17_pos:String = "0";
		public var grid18_pos:String = "0";
		public var grid19_pos:String = "0";
		public var grid20_pos:String = "0";
		public var grid21_pos:String = "0";
		public var grid22_pos:String = "0";
		public var grid23_pos:String = "0";
		public var grid24_pos:String = "0";
		public var grid25_pos:String = "0";
		public var grid26_pos:String = "0";
		public var grid27_pos:String = "0";
		public var grid28_pos:String = "0";
		public var grid29_pos:String = "0";
		public var grid30_pos:String = "0";
		public var grid31_pos:String = "0";
		public var grid32_pos:String = "0";
		public var grid33_pos:String = "0";
		public var grid34_pos:String = "0";
		
		private var RONum:int = 0;
		
		private var Animating:Boolean = false;
		private var SwitchOn:Boolean = false;
		
		public var delayedcall:DelayedCall;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function ElectricBox(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('electricBox_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ElectricBox/electricBox_bg.jpg'));
				game.TrackAssets('electricBox_01');
			}
			if(game.CheckAsset('electricBox_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ElectricBox/ElectricBox_Sprite_01.png'));
				game.TrackAssets('electricBox_02');
			}
			if(game.CheckAsset('electricBox_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ElectricBox/ElectricBox_Sprite_01.xml'));
				game.TrackAssets('electricBox_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ElectricBox","ElectricBoxObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
	//		(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElectricBox',SaveArray);	
			
			bg = new Image(this.assets.getTexture('electricBox_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid00_pos'] != undefined){
					trace("THERE is 00 POS");
					grid00_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid00_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid01_pos'] != undefined){
					grid01_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid01_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid02_pos'] != undefined){
					grid02_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid02_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid03_pos'] != undefined){
					grid03_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid03_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid04_pos'] != undefined){
					grid04_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid04_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid05_pos'] != undefined){
					grid05_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid05_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid06_pos'] != undefined){
					grid06_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid06_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid07_pos'] != undefined){
					grid07_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid07_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid08_pos'] != undefined){
					grid08_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid08_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid09_pos'] != undefined){
					grid09_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid09_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid10_pos'] != undefined){
					grid10_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid10_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid11_pos'] != undefined){
					grid11_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid11_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid12_pos'] != undefined){
					grid12_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid12_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid13_pos'] != undefined){
					grid13_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid13_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid14_pos'] != undefined){
					grid14_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid14_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid15_pos'] != undefined){
					grid15_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid15_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid16_pos'] != undefined){
					grid16_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid16_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid17_pos'] != undefined){
					grid17_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid17_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid18_pos'] != undefined){
					grid18_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid18_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid19_pos'] != undefined){
					grid19_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid19_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid20_pos'] != undefined){
					grid20_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid20_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid21_pos'] != undefined){
					grid21_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid21_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid22_pos'] != undefined){
					grid22_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid22_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid23_pos'] != undefined){
					grid23_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid23_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid24_pos'] != undefined){
					grid24_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid24_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid25_pos'] != undefined){
					grid25_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid25_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid26_pos'] != undefined){
					grid26_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid26_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid27_pos'] != undefined){
					grid27_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid27_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid28_pos'] != undefined){
					grid28_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid28_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid29_pos'] != undefined){
					grid29_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid29_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid30_pos'] != undefined){
					grid30_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid30_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid31_pos'] != undefined){
					grid31_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid31_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid32_pos'] != undefined){
					grid32_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid32_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid33_pos'] != undefined){
					grid33_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid33_pos'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid34_pos'] != undefined){
					grid34_pos = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox['grid34_pos'];
				}
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox;
			}else{
				
			}
			trace("MY 00 POS grid00_pos : "+grid00_pos);
			grid_00 = new ElectricBoxSquare(this.assets,'end',x_default,y_default,grid00_pos);
			grid_01 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*1)),y_default,grid01_pos);
			grid_02 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*2)),y_default,grid02_pos);
			grid_03 = new ElectricBoxSquare(this.assets,'three',(x_default+(x_spacing*3)),y_default,grid03_pos);
			grid_04 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*4)),y_default,grid04_pos);
			grid_05 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*5)),y_default,grid05_pos);
			grid_06 = new ElectricBoxSquare(this.assets,'end',(x_default+(x_spacing*6)),y_default,grid06_pos);
			grid_07 = new ElectricBoxSquare(this.assets,'straight',x_default,(y_default+(y_spacing*1)),grid07_pos);
			grid_08 = new ElectricBoxSquare(this.assets,'straight',(x_default+(x_spacing*1)),(y_default+(y_spacing*1)),grid08_pos);
			grid_09 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*2)),(y_default+(y_spacing*1)),grid09_pos);
			grid_10 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*3)),(y_default+(y_spacing*1)),grid10_pos);
			
			grid_11 = new ElectricBoxSquare(this.assets,'straight',(x_default+(x_spacing*4)),(y_default+(y_spacing*1)),grid11_pos);
			grid_12 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*5)),(y_default+(y_spacing*1)),grid12_pos);
			grid_13 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*6)),(y_default+(y_spacing*1)),grid13_pos);			
			grid_14 = new ElectricBoxSquare(this.assets,'straight',(x_default+(x_spacing*0)),(y_default+(y_spacing*2)),grid14_pos);
			grid_15 = new ElectricBoxSquare(this.assets,'three',(x_default+(x_spacing*1)),(y_default+(y_spacing*2)),grid15_pos);
			grid_16 = new ElectricBoxSquare(this.assets,'straight',(x_default+(x_spacing*2)),(y_default+(y_spacing*2)),grid16_pos);
			grid_17 = new ElectricBoxSquare(this.assets,'end',(x_default+(x_spacing*3)),(y_default+(y_spacing*2)),grid17_pos);
			grid_18 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*4)),(y_default+(y_spacing*2)),grid18_pos);
			grid_19 = new ElectricBoxSquare(this.assets,'three',(x_default+(x_spacing*5)),(y_default+(y_spacing*2)),grid19_pos);

			grid_20 = new ElectricBoxSquare(this.assets,'three',(x_default+(x_spacing*6)),(y_default+(y_spacing*2)),grid20_pos);			
			grid_21 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*0)),(y_default+(y_spacing*3)),grid21_pos);
			grid_22 = new ElectricBoxSquare(this.assets,'three',(x_default+(x_spacing*1)),(y_default+(y_spacing*3)),grid22_pos);
			grid_23 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*2)),(y_default+(y_spacing*3)),grid23_pos);
			grid_24 = new ElectricBoxSquare(this.assets,'straight',(x_default+(x_spacing*3)),(y_default+(y_spacing*3)),grid24_pos);
			grid_25 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*4)),(y_default+(y_spacing*3)),grid25_pos);
			grid_26 = new ElectricBoxSquare(this.assets,'straight',(x_default+(x_spacing*5)),(y_default+(y_spacing*3)),grid26_pos);
			grid_27 = new ElectricBoxSquare(this.assets,'straight',(x_default+(x_spacing*6)),(y_default+(y_spacing*3)),grid27_pos);			
			grid_28 = new ElectricBoxSquare(this.assets,'end',(x_default+(x_spacing*0)),(y_default+(y_spacing*4)),grid28_pos);
			grid_29 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*1)),(y_default+(y_spacing*4)),grid29_pos);

			grid_30 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*2)),(y_default+(y_spacing*4)),grid30_pos);
			grid_31 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*3)),(y_default+(y_spacing*4)),grid31_pos);
			grid_32 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*4)),(y_default+(y_spacing*4)),grid32_pos);
			grid_33 = new ElectricBoxSquare(this.assets,'bend',(x_default+(x_spacing*5)),(y_default+(y_spacing*4)),grid33_pos);
			grid_34 = new ElectricBoxSquare(this.assets,'end',(x_default+(x_spacing*6)),(y_default+(y_spacing*4)),grid34_pos);
			/*
			private var grid_AA:Image;
			private var grid_AB:Image;
			private var grid_AC:Image;
			private var grid_AD:Image;
			private var grid_AE:Image;
			private var grid_AF:Image;
			private var grid_AG:Image;
			private var switch_on:Image;
			private var bottom:Image;
			*/
			switch_on = new Image(this.assets.getTexture('switchOn'));
			switch_on.touchable = false;
			switch_on.x = 30;
			switch_on.y = 177;
			
			bottom = new Image(this.assets.getTexture('bottom'));
			bottom.touchable = false;
			bottom.x = 385;
			bottom.y = 446;
			
			switch_on.alpha = 0;
			bottom.alpha = 0;
			
			grid_00.alpha = 1;
			grid_01.alpha = 1;
			grid_02.alpha = 1;
			grid_03.alpha = 1;
			grid_04.alpha = 1;
			grid_05.alpha = 1;
			grid_06.alpha = 1;
			
			grid_07.alpha = 1;
			grid_08.alpha = 1;
			grid_09.alpha = 1;
			grid_10.alpha = 1;
			grid_11.alpha = 1;
			grid_12.alpha = 1;
			grid_13.alpha = 1;
						
			grid_14.alpha = 1;
			
			
		
			
			this.addChildAt(switch_on,1);
			this.addChildAt(bottom,2);
			
			this.addChildAt(grid_00,3);
			this.addChildAt(grid_01,4);
			this.addChildAt(grid_02,5);
			this.addChildAt(grid_03,6);
			this.addChildAt(grid_04,7);
			this.addChildAt(grid_05,8);
			this.addChildAt(grid_06,9);
			
			this.addChildAt(grid_07,10);
			this.addChildAt(grid_08,11);
			this.addChildAt(grid_09,12);
			this.addChildAt(grid_10,13);
			this.addChildAt(grid_11,14);
			this.addChildAt(grid_12,15);
			this.addChildAt(grid_13,16);
			
			this.addChildAt(grid_14,17);
			this.addChildAt(grid_15,18);
			this.addChildAt(grid_16,19);
			this.addChildAt(grid_17,20);
			this.addChildAt(grid_18,21);
			this.addChildAt(grid_19,22);
			this.addChildAt(grid_20,23);
			
			this.addChildAt(grid_21,24);
			this.addChildAt(grid_22,25);
			this.addChildAt(grid_23,26);
			this.addChildAt(grid_24,27);
			this.addChildAt(grid_25,28);
			this.addChildAt(grid_26,29);
			this.addChildAt(grid_27,30);
			
			this.addChildAt(grid_28,31);
			this.addChildAt(grid_29,32);
			this.addChildAt(grid_30,33);
			this.addChildAt(grid_31,34);
			this.addChildAt(grid_32,35);
			this.addChildAt(grid_33,36);
			this.addChildAt(grid_34,37);
			//	CreateElevatorDoorHit();
			for(var i:int = 0; i<35;i++){
				//	trace(i);
				if(i < 10){
					if(this['grid0'+i+'_pos'] == '0'){
						this[('grid_0'+i)].Rotate("0");
					}else if(this['grid0'+i+'_pos'] == '1'){
						this[('grid_0'+i)].Rotate("1");
					}else if(this['grid0'+i+'_pos'] == '2'){
						this[('grid_0'+i)].Rotate("2");
					}else if(this['grid0'+i+'_pos'] == '3'){
						this[('grid_0'+i)].Rotate("3");
					}
				}
				else{
					if(this['grid'+i+'_pos'] == '0'){
						this[('grid_'+i)].Rotate("0");
					}else if(this['grid'+i+'_pos'] == '1'){
						this[('grid_'+i)].Rotate("1");
					}else if(this['grid'+i+'_pos'] == '2'){
						this[('grid_'+i)].Rotate("2");
					}else if(this['grid'+i+'_pos'] == '3'){
						this[('grid_'+i)].Rotate("3");
					}
					
				}
			}
			GridHandler('03',true);
			
			CreateGridHit();
			CreateSwitchHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		//hit_switch
		private function CreateSwitchHit():void{
			hit_switch = new Shape();
			hit_switch.touchable = false;
			hit_switch.graphics.beginFill(0x00ff00);
			
			hit_switch.graphics.lineTo(15,164);	
			hit_switch.graphics.lineTo(84,164);	
			hit_switch.graphics.lineTo(84,294);	
			hit_switch.graphics.lineTo(15,294);	
		
			
			hit_switch.graphics.endFill(false);
			hit_switch.alpha = 0.0;
			
			hit_switch.graphics.precisionHitTest = true;	
			this.addChild(hit_switch);
		}
		
		private function CreateGridHit():void{
			hit_00 = new Shape();
			hit_00.touchable = false;
			hit_00.graphics.beginFill(0xff0000);			
			hit_00.graphics.lineTo(93,16);	
			hit_00.graphics.lineTo(176,16);	
			hit_00.graphics.lineTo(176,100);	
			hit_00.graphics.lineTo(93,100);				
			hit_00.graphics.endFill(false);
			hit_00.alpha = 0.0;
			hit_00.graphics.precisionHitTest = true;	
		
			
			hit_01 = new Shape();
			hit_01.touchable = false;
			hit_01.graphics.beginFill(0xff0000);			
			hit_01.graphics.lineTo(93+x_spacing,16);	
			hit_01.graphics.lineTo(176+x_spacing,16);	
			hit_01.graphics.lineTo(176+x_spacing,100);	
			hit_01.graphics.lineTo(93+x_spacing,100);				
			hit_01.graphics.endFill(false);
			hit_01.alpha = 0.0;
			hit_01.graphics.precisionHitTest = true;	
						
			hit_02 = new Shape();
			hit_02.touchable = false;
			hit_02.graphics.beginFill(0xff0000);			
			hit_02.graphics.lineTo(93+(x_spacing*2),16);	
			hit_02.graphics.lineTo(176+(x_spacing*2),16);	
			hit_02.graphics.lineTo(176+(x_spacing*2),100);	
			hit_02.graphics.lineTo(93+(x_spacing*2),100);				
			hit_02.graphics.endFill(false);
			hit_02.alpha = 0.0;			
			hit_02.graphics.precisionHitTest = true;	
						
			hit_03 = new Shape();
			hit_03.touchable = false;
			hit_03.graphics.beginFill(0xff0000);			
			hit_03.graphics.lineTo(93+(x_spacing*3),16);	
			hit_03.graphics.lineTo(176+(x_spacing*3),16);	
			hit_03.graphics.lineTo(176+(x_spacing*3),100);	
			hit_03.graphics.lineTo(93+(x_spacing*3),100);				
			hit_03.graphics.endFill(false);
			hit_03.alpha = 0.0;			
			hit_03.graphics.precisionHitTest = true;	
			
			hit_04 = new Shape();
			hit_04.touchable = false;
			hit_04.graphics.beginFill(0xff0000);			
			hit_04.graphics.lineTo(93+(x_spacing*4),16);	
			hit_04.graphics.lineTo(176+(x_spacing*4),16);	
			hit_04.graphics.lineTo(176+(x_spacing*4),100);	
			hit_04.graphics.lineTo(93+(x_spacing*4),100);				
			hit_04.graphics.endFill(false);
			hit_04.alpha = 0.0;			
			hit_04.graphics.precisionHitTest = true;	
			
			hit_05 = new Shape();
			hit_05.touchable = false;
			hit_05.graphics.beginFill(0xff0000);			
			hit_05.graphics.lineTo(93+(x_spacing*5),16);	
			hit_05.graphics.lineTo(176+(x_spacing*5),16);	
			hit_05.graphics.lineTo(176+(x_spacing*5),100);	
			hit_05.graphics.lineTo(93+(x_spacing*5),100);				
			hit_05.graphics.endFill(false);
			hit_05.alpha = 0.0;			
			hit_05.graphics.precisionHitTest = true;	
			
			hit_06 = new Shape();
			hit_06.touchable = false;
			hit_06.graphics.beginFill(0xff0000);			
			hit_06.graphics.lineTo(93+(x_spacing*6),16);	
			hit_06.graphics.lineTo(176+(x_spacing*6),16);	
			hit_06.graphics.lineTo(176+(x_spacing*6),100);	
			hit_06.graphics.lineTo(93+(x_spacing*6),100);				
			hit_06.graphics.endFill(false);
			hit_06.alpha = 0.0;			
			hit_06.graphics.precisionHitTest = true;	
			
			hit_07 = new Shape();
			hit_07.touchable = false;
			hit_07.graphics.beginFill(0xff0000);			
			hit_07.graphics.lineTo(93+(x_spacing*0),16+(y_spacing*1));	
			hit_07.graphics.lineTo(176+(x_spacing*0),16+(y_spacing*1));	
			hit_07.graphics.lineTo(176+(x_spacing*0),100+(y_spacing*1));	
			hit_07.graphics.lineTo(93+(x_spacing*0),100+(y_spacing*1));				
			hit_07.graphics.endFill(false);
			hit_07.alpha = 0.0;			
			hit_07.graphics.precisionHitTest = true;	
			
			hit_08 = new Shape();
			hit_08.touchable = false;
			hit_08.graphics.beginFill(0xff0000);			
			hit_08.graphics.lineTo(93+(x_spacing*1),16+(y_spacing*1));	
			hit_08.graphics.lineTo(176+(x_spacing*1),16+(y_spacing*1));	
			hit_08.graphics.lineTo(176+(x_spacing*1),100+(y_spacing*1));	
			hit_08.graphics.lineTo(93+(x_spacing*1),100+(y_spacing*1));				
			hit_08.graphics.endFill(false);
			hit_08.alpha = 0.0;			
			hit_08.graphics.precisionHitTest = true;	
			
			hit_09 = new Shape();
			hit_09.touchable = false;
			hit_09.graphics.beginFill(0xff0000);			
			hit_09.graphics.lineTo(93+(x_spacing*2),16+(y_spacing*1));	
			hit_09.graphics.lineTo(176+(x_spacing*2),16+(y_spacing*1));	
			hit_09.graphics.lineTo(176+(x_spacing*2),100+(y_spacing*1));	
			hit_09.graphics.lineTo(93+(x_spacing*2),100+(y_spacing*1));				
			hit_09.graphics.endFill(false);
			hit_09.alpha = 0.0;			
			hit_09.graphics.precisionHitTest = true;	
			
			hit_10 = new Shape();
			hit_10.touchable = false;
			hit_10.graphics.beginFill(0xff0000);			
			hit_10.graphics.lineTo(93+(x_spacing*3),16+(y_spacing*1));	
			hit_10.graphics.lineTo(176+(x_spacing*3),16+(y_spacing*1));	
			hit_10.graphics.lineTo(176+(x_spacing*3),100+(y_spacing*1));	
			hit_10.graphics.lineTo(93+(x_spacing*3),100+(y_spacing*1));				
			hit_10.graphics.endFill(false);
			hit_10.alpha = 0.0;			
			hit_10.graphics.precisionHitTest = true;	
			
			hit_11 = new Shape();
			hit_11.touchable = false;
			hit_11.graphics.beginFill(0xff0000);			
			hit_11.graphics.lineTo(93+(x_spacing*4),16+(y_spacing*1));	
			hit_11.graphics.lineTo(176+(x_spacing*4),16+(y_spacing*1));	
			hit_11.graphics.lineTo(176+(x_spacing*4),100+(y_spacing*1));	
			hit_11.graphics.lineTo(93+(x_spacing*4),100+(y_spacing*1));				
			hit_11.graphics.endFill(false);
			hit_11.alpha = 0.0;			
			hit_11.graphics.precisionHitTest = true;	
			
			hit_12 = new Shape();
			hit_12.touchable = false;
			hit_12.graphics.beginFill(0xff0000);			
			hit_12.graphics.lineTo(93+(x_spacing*5),16+(y_spacing*1));	
			hit_12.graphics.lineTo(176+(x_spacing*5),16+(y_spacing*1));	
			hit_12.graphics.lineTo(176+(x_spacing*5),100+(y_spacing*1));	
			hit_12.graphics.lineTo(93+(x_spacing*5),100+(y_spacing*1));				
			hit_12.graphics.endFill(false);
			hit_12.alpha = 0.0;			
			hit_12.graphics.precisionHitTest = true;	
			
			hit_13 = new Shape();
			hit_13.touchable = false;
			hit_13.graphics.beginFill(0xff0000);			
			hit_13.graphics.lineTo(93+(x_spacing*6),16+(y_spacing*1));	
			hit_13.graphics.lineTo(176+(x_spacing*6),16+(y_spacing*1));	
			hit_13.graphics.lineTo(176+(x_spacing*6),100+(y_spacing*1));	
			hit_13.graphics.lineTo(93+(x_spacing*6),100+(y_spacing*1));				
			hit_13.graphics.endFill(false);
			hit_13.alpha = 0.0;			
			hit_13.graphics.precisionHitTest = true;	
	//-----------------------		
			
			hit_14 = new Shape();
			hit_14.touchable = false;
			hit_14.graphics.beginFill(0xff0000);			
			hit_14.graphics.lineTo(93+(x_spacing*0),16+(y_spacing*2));	
			hit_14.graphics.lineTo(176+(x_spacing*0),16+(y_spacing*2));	
			hit_14.graphics.lineTo(176+(x_spacing*0),100+(y_spacing*2));	
			hit_14.graphics.lineTo(93+(x_spacing*0),100+(y_spacing*2));				
			hit_14.graphics.endFill(false);
			hit_14.alpha = 0.0;			
			hit_14.graphics.precisionHitTest = true;	
			
			hit_15 = new Shape();
			hit_15.touchable = false;
			hit_15.graphics.beginFill(0xff0000);			
			hit_15.graphics.lineTo(93+(x_spacing*1),16+(y_spacing*2));	
			hit_15.graphics.lineTo(176+(x_spacing*1),16+(y_spacing*2));	
			hit_15.graphics.lineTo(176+(x_spacing*1),100+(y_spacing*2));	
			hit_15.graphics.lineTo(93+(x_spacing*1),100+(y_spacing*2));				
			hit_15.graphics.endFill(false);
			hit_15.alpha = 0.0;			
			hit_15.graphics.precisionHitTest = true;	
			
			hit_16 = new Shape();
			hit_16.touchable = false;
			hit_16.graphics.beginFill(0xff0000);			
			hit_16.graphics.lineTo(93+(x_spacing*2),16+(y_spacing*2));	
			hit_16.graphics.lineTo(176+(x_spacing*2),16+(y_spacing*2));	
			hit_16.graphics.lineTo(176+(x_spacing*2),100+(y_spacing*2));	
			hit_16.graphics.lineTo(93+(x_spacing*2),100+(y_spacing*2));				
			hit_16.graphics.endFill(false);
			hit_16.alpha = 0.0;			
			hit_16.graphics.precisionHitTest = true;	
			
			hit_17 = new Shape();
			hit_17.touchable = false;
			hit_17.graphics.beginFill(0xff0000);			
			hit_17.graphics.lineTo(93+(x_spacing*3),16+(y_spacing*2));	
			hit_17.graphics.lineTo(176+(x_spacing*3),16+(y_spacing*2));	
			hit_17.graphics.lineTo(176+(x_spacing*3),100+(y_spacing*2));	
			hit_17.graphics.lineTo(93+(x_spacing*3),100+(y_spacing*2));				
			hit_17.graphics.endFill(false);
			hit_17.alpha = 0.0;			
			hit_17.graphics.precisionHitTest = true;	
			
			hit_18 = new Shape();
			hit_18.touchable = false;
			hit_18.graphics.beginFill(0xff0000);			
			hit_18.graphics.lineTo(93+(x_spacing*4),16+(y_spacing*2));	
			hit_18.graphics.lineTo(176+(x_spacing*4),16+(y_spacing*2));	
			hit_18.graphics.lineTo(176+(x_spacing*4),100+(y_spacing*2));	
			hit_18.graphics.lineTo(93+(x_spacing*4),100+(y_spacing*2));				
			hit_18.graphics.endFill(false);
			hit_18.alpha = 0.0;			
			hit_18.graphics.precisionHitTest = true;	
			
			hit_19 = new Shape();
			hit_19.touchable = false;
			hit_19.graphics.beginFill(0xff0000);			
			hit_19.graphics.lineTo(93+(x_spacing*5),16+(y_spacing*2));	
			hit_19.graphics.lineTo(176+(x_spacing*5),16+(y_spacing*2));	
			hit_19.graphics.lineTo(176+(x_spacing*5),100+(y_spacing*2));	
			hit_19.graphics.lineTo(93+(x_spacing*5),100+(y_spacing*2));				
			hit_19.graphics.endFill(false);
			hit_19.alpha = 0.0;			
			hit_19.graphics.precisionHitTest = true;	
			
			hit_20 = new Shape();
			hit_20.touchable = false;
			hit_20.graphics.beginFill(0xff0000);			
			hit_20.graphics.lineTo(93+(x_spacing*6),16+(y_spacing*2));	
			hit_20.graphics.lineTo(176+(x_spacing*6),16+(y_spacing*2));	
			hit_20.graphics.lineTo(176+(x_spacing*6),100+(y_spacing*2));	
			hit_20.graphics.lineTo(93+(x_spacing*6),100+(y_spacing*2));				
			hit_20.graphics.endFill(false);
			hit_20.alpha = 0.0;			
			hit_20.graphics.precisionHitTest = true;	
			
			hit_21 = new Shape();
			hit_21.touchable = false;
			hit_21.graphics.beginFill(0xff0000);			
			hit_21.graphics.lineTo(93+(x_spacing*0),16+(y_spacing*3));	
			hit_21.graphics.lineTo(176+(x_spacing*0),16+(y_spacing*3));	
			hit_21.graphics.lineTo(176+(x_spacing*0),100+(y_spacing*3));	
			hit_21.graphics.lineTo(93+(x_spacing*0),100+(y_spacing*3));				
			hit_21.graphics.endFill(false);
			hit_21.alpha = 0.0;			
			hit_21.graphics.precisionHitTest = true;	
			
			hit_22 = new Shape();
			hit_22.touchable = false;
			hit_22.graphics.beginFill(0xff0000);			
			hit_22.graphics.lineTo(93+(x_spacing*1),16+(y_spacing*3));	
			hit_22.graphics.lineTo(176+(x_spacing*1),16+(y_spacing*3));	
			hit_22.graphics.lineTo(176+(x_spacing*1),100+(y_spacing*3));	
			hit_22.graphics.lineTo(93+(x_spacing*1),100+(y_spacing*3));				
			hit_22.graphics.endFill(false);
			hit_22.alpha = 0.0;			
			hit_22.graphics.precisionHitTest = true;	
			
			hit_23 = new Shape();
			hit_23.touchable = false;
			hit_23.graphics.beginFill(0xff0000);			
			hit_23.graphics.lineTo(93+(x_spacing*2),16+(y_spacing*3));	
			hit_23.graphics.lineTo(176+(x_spacing*2),16+(y_spacing*3));	
			hit_23.graphics.lineTo(176+(x_spacing*2),100+(y_spacing*3));	
			hit_23.graphics.lineTo(93+(x_spacing*2),100+(y_spacing*3));				
			hit_23.graphics.endFill(false);
			hit_23.alpha = 0.0;			
			hit_23.graphics.precisionHitTest = true;	
			
			hit_24 = new Shape();
			hit_24.touchable = false;
			hit_24.graphics.beginFill(0xff0000);			
			hit_24.graphics.lineTo(93+(x_spacing*3),16+(y_spacing*3));	
			hit_24.graphics.lineTo(176+(x_spacing*3),16+(y_spacing*3));	
			hit_24.graphics.lineTo(176+(x_spacing*3),100+(y_spacing*3));	
			hit_24.graphics.lineTo(93+(x_spacing*3),100+(y_spacing*3));				
			hit_24.graphics.endFill(false);
			hit_24.alpha = 0.0;			
			hit_24.graphics.precisionHitTest = true;	
			
			hit_25 = new Shape();
			hit_25.touchable = false;
			hit_25.graphics.beginFill(0xff0000);			
			hit_25.graphics.lineTo(93+(x_spacing*4),16+(y_spacing*3));	
			hit_25.graphics.lineTo(176+(x_spacing*4),16+(y_spacing*3));	
			hit_25.graphics.lineTo(176+(x_spacing*4),100+(y_spacing*3));	
			hit_25.graphics.lineTo(93+(x_spacing*4),100+(y_spacing*3));				
			hit_25.graphics.endFill(false);
			hit_25.alpha = 0.0;			
			hit_25.graphics.precisionHitTest = true;	
			
			hit_26 = new Shape();
			hit_26.touchable = false;
			hit_26.graphics.beginFill(0xff0000);			
			hit_26.graphics.lineTo(93+(x_spacing*5),16+(y_spacing*3));	
			hit_26.graphics.lineTo(176+(x_spacing*5),16+(y_spacing*3));	
			hit_26.graphics.lineTo(176+(x_spacing*5),100+(y_spacing*3));	
			hit_26.graphics.lineTo(93+(x_spacing*5),100+(y_spacing*3));				
			hit_26.graphics.endFill(false);
			hit_26.alpha = 0.0;			
			hit_26.graphics.precisionHitTest = true;
			
			hit_27 = new Shape();
			hit_27.touchable = false;
			hit_27.graphics.beginFill(0xff0000);			
			hit_27.graphics.lineTo(93+(x_spacing*6),16+(y_spacing*3));	
			hit_27.graphics.lineTo(176+(x_spacing*6),16+(y_spacing*3));	
			hit_27.graphics.lineTo(176+(x_spacing*6),100+(y_spacing*3));	
			hit_27.graphics.lineTo(93+(x_spacing*6),100+(y_spacing*3));				
			hit_27.graphics.endFill(false);
			hit_27.alpha = 0.0;			
			hit_27.graphics.precisionHitTest = true;
			
			hit_28 = new Shape();
			hit_28.touchable = false;
			hit_28.graphics.beginFill(0xff0000);			
			hit_28.graphics.lineTo(93+(x_spacing*0),16+(y_spacing*4));	
			hit_28.graphics.lineTo(176+(x_spacing*0),16+(y_spacing*4));	
			hit_28.graphics.lineTo(176+(x_spacing*0),100+(y_spacing*4));	
			hit_28.graphics.lineTo(93+(x_spacing*0),100+(y_spacing*4));				
			hit_28.graphics.endFill(false);
			hit_28.alpha = 0.0;			
			hit_28.graphics.precisionHitTest = true;
			
			hit_29 = new Shape();
			hit_29.touchable = false;
			hit_29.graphics.beginFill(0xff0000);			
			hit_29.graphics.lineTo(93+(x_spacing*1),16+(y_spacing*4));	
			hit_29.graphics.lineTo(176+(x_spacing*1),16+(y_spacing*4));	
			hit_29.graphics.lineTo(176+(x_spacing*1),100+(y_spacing*4));	
			hit_29.graphics.lineTo(93+(x_spacing*1),100+(y_spacing*4));				
			hit_29.graphics.endFill(false);
			hit_29.alpha = 0.0;			
			hit_29.graphics.precisionHitTest = true;
			
			hit_30 = new Shape();
			hit_30.touchable = false;
			hit_30.graphics.beginFill(0xff0000);			
			hit_30.graphics.lineTo(93+(x_spacing*2),16+(y_spacing*4));	
			hit_30.graphics.lineTo(176+(x_spacing*2),16+(y_spacing*4));	
			hit_30.graphics.lineTo(176+(x_spacing*2),100+(y_spacing*4));	
			hit_30.graphics.lineTo(93+(x_spacing*2),100+(y_spacing*4));				
			hit_30.graphics.endFill(false);
			hit_30.alpha = 0.0;			
			hit_30.graphics.precisionHitTest = true;
			
			hit_31 = new Shape();
			hit_31.touchable = false;
			hit_31.graphics.beginFill(0xff0000);			
			hit_31.graphics.lineTo(93+(x_spacing*3),16+(y_spacing*4));	
			hit_31.graphics.lineTo(176+(x_spacing*3),16+(y_spacing*4));	
			hit_31.graphics.lineTo(176+(x_spacing*3),100+(y_spacing*4));	
			hit_31.graphics.lineTo(93+(x_spacing*3),100+(y_spacing*4));				
			hit_31.graphics.endFill(false);
			hit_31.alpha = 0.0;			
			hit_31.graphics.precisionHitTest = true;
			
			hit_32 = new Shape();
			hit_32.touchable = false;
			hit_32.graphics.beginFill(0xff0000);			
			hit_32.graphics.lineTo(93+(x_spacing*4),16+(y_spacing*4));	
			hit_32.graphics.lineTo(176+(x_spacing*4),16+(y_spacing*4));	
			hit_32.graphics.lineTo(176+(x_spacing*4),100+(y_spacing*4));	
			hit_32.graphics.lineTo(93+(x_spacing*4),100+(y_spacing*4));				
			hit_32.graphics.endFill(false);
			hit_32.alpha = 0.0;			
			hit_32.graphics.precisionHitTest = true;
			
			hit_33 = new Shape();
			hit_33.touchable = false;
			hit_33.graphics.beginFill(0xff0000);			
			hit_33.graphics.lineTo(93+(x_spacing*5),16+(y_spacing*4));	
			hit_33.graphics.lineTo(176+(x_spacing*5),16+(y_spacing*4));	
			hit_33.graphics.lineTo(176+(x_spacing*5),100+(y_spacing*4));	
			hit_33.graphics.lineTo(93+(x_spacing*5),100+(y_spacing*4));				
			hit_33.graphics.endFill(false);
			hit_33.alpha = 0.0;			
			hit_33.graphics.precisionHitTest = true;
			
			hit_34 = new Shape();
			hit_34.touchable = false;
			hit_34.graphics.beginFill(0xff0000);			
			hit_34.graphics.lineTo(93+(x_spacing*6),16+(y_spacing*4));	
			hit_34.graphics.lineTo(176+(x_spacing*6),16+(y_spacing*4));	
			hit_34.graphics.lineTo(176+(x_spacing*6),100+(y_spacing*4));	
			hit_34.graphics.lineTo(93+(x_spacing*6),100+(y_spacing*4));				
			hit_34.graphics.endFill(false);
			hit_34.alpha = 0.0;			
			hit_34.graphics.precisionHitTest = true;
			
			this.addChild(hit_00);
			this.addChild(hit_01);
			this.addChild(hit_02);
			this.addChild(hit_03);
			this.addChild(hit_04);
			this.addChild(hit_05);
			this.addChild(hit_06);
			
			this.addChild(hit_07);
			this.addChild(hit_08);
			this.addChild(hit_09);
			this.addChild(hit_10);
			this.addChild(hit_11);
			this.addChild(hit_12);
			this.addChild(hit_13);
			
			this.addChild(hit_14);
			this.addChild(hit_15);
			this.addChild(hit_16);
			this.addChild(hit_17);
			this.addChild(hit_18);
			this.addChild(hit_19);
			this.addChild(hit_20);
			
			this.addChild(hit_21);
			this.addChild(hit_22);
			this.addChild(hit_23);
			this.addChild(hit_24);
			this.addChild(hit_25);
			this.addChild(hit_26);
			this.addChild(hit_27);
			
			this.addChild(hit_28);
			this.addChild(hit_29);
			this.addChild(hit_30);
			this.addChild(hit_31);
			this.addChild(hit_32);
			this.addChild(hit_33);
			this.addChild(hit_34);
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
							FadeOut((ServerRoom as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ServerRoomObj,true
							);
						}else if(hit_switch.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							SwitchHandler();
						}else{ 
							
							for(var i:int = 0; i<35;i++){
								//	trace(i);
								if(i < 10){
									//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
									if(this[('hit_0'+i)].graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
										trace('hit_0'+i);
										GridHandler('0'+i);
									//	HexHandler('0'+i, ArmedColor);
										return;
									}
								}else{
									
									if(this[('hit_'+i)].graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
										trace('hit_'+i);
										GridHandler(''+i);
								//		HexHandler(''+i, ArmedColor);
										return;
									}
								}
							}
						}
					}
				}
			}
		}
		
		private function SwitchHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
			if(SwitchOn === false){
				SwitchOn = true;
				switch_on.alpha = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... nothing happens when I hit the switch...");
			}else{
				SwitchOn = false;
				switch_on.alpha = 0;
			}
		}
		
		private function GridHandler(GridNum:String,FromSave:Boolean = false):void{
			ClearedArr.length = 0;
			ClosedArr = new Array("00",
				"01",
				"02",
				"03",
				"04",
				"05",
				"06",
				"07",
				"08",
				"09",
				"10",
				"11",
				"12",
				"13",
				"14",
				"15",
				"16",
				"17",
				"18",
				"19",
				"20",
				"21",
				"22",
				"23",
				"24",
				"25",
				"26",
				"27",
				"28",
				"29",
				"30",
				"31",
				"32",
				"33",
				"34"
			);
			
			trace(ClosedArr.join());
			if(FromSave === false){
			//	this[('grid_'+GridNum)].Rotate();
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox;
				}	
				if(this[('grid'+GridNum+'_pos')] == "0"){
					this[('grid'+GridNum+'_pos')] = "1";
					this[('grid_'+GridNum)].Rotate("1");
					SaveArray['grid'+GridNum+'_pos'] = "1";
					RandNoiseHandler(1)
				}else if(this[('grid'+GridNum+'_pos')] == "1"){
					this[('grid'+GridNum+'_pos')] = "2";
					this[('grid_'+GridNum)].Rotate("2");
					SaveArray['grid'+GridNum+'_pos'] = "2";
					RandNoiseHandler(2)
				}else if(this[('grid'+GridNum+'_pos')] == "2"){
					this[('grid'+GridNum+'_pos')] = "3";
					this[('grid_'+GridNum)].Rotate("3");
					SaveArray['grid'+GridNum+'_pos'] = "3";
					RandNoiseHandler(3)
				}else if(this[('grid'+GridNum+'_pos')] == "3"){
					this[('grid'+GridNum+'_pos')] = "0";
					this[('grid_'+GridNum)].Rotate("0");
					SaveArray['grid'+GridNum+'_pos'] = "0";
					RandNoiseHandler(0)
				}
						
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElectricBox',SaveArray);	
				
				CheckStartPoint();
				
		
			}else{
				CheckStartPoint();
			}
			
		}
		
		private function RandNoiseHandler(PosNum:int = 0):void{
			if(PosNum == 0){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SwitchesOne();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SwitchesTwo();
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SwitchesThree();
				}
			}else if(PosNum == 1){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SwitchesFour();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SwitchesFive();
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SwitchesSix();
				}
			}else if(PosNum == 2){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SwitchesSeven();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SwitchesOne();
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SwitchesTwo();
				}
			}else if(PosNum == 3){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SwitchesThree();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SwitchesFour();
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SwitchesFive();
				}
			}
		}
		
		private function CheckStartPoint():void{
			if(grid_03.pos == "0"){
				if (ClearedArr.indexOf("03") < 0){
					ClearedArr.push('03');
					ClosedArr.splice(ClosedArr.indexOf("03"), 1);
				}
				HashGrid();
				trace("BARK 0");
				grid_03.TurnOn();
			}else if(grid_03.pos == "1"){
				trace("BARK 1");
				ClearedArr.splice(ClearedArr.indexOf("03"), 1);
				ClosedArr.push('03');				
				for (var a:int = 0; a < 35; a++){
					if (ClosedArr.indexOf(ClosedArr[a]) >= 0){
						trace("close: "+ClosedArr[a])
						this[('grid_'+ClosedArr[a])].TurnOff();
					}	
				}
				
	
			}else if(grid_03.pos == "2"){
				if (ClearedArr.indexOf("03") < 0){
					ClearedArr.push('03');
					ClosedArr.splice(ClosedArr.indexOf("03"), 1);
				}
				trace("BARK 2");
				HashGrid();
				grid_03.TurnOn();
			}else if(grid_03.pos == "3"){
				if (ClearedArr.indexOf("03") < 0){
					ClearedArr.push('03');
					ClosedArr.splice(ClosedArr.indexOf("03"), 1);
				}
				trace("BARK 3");
				HashGrid();
				grid_03.TurnOn();
			}
		}
		
		/*
		var grid00_arr:Array = new Array(null, null, "01", null);
		var grid01_arr:Array = new Array("00", null, "02",null);
		var grid02_arr:Array = new Array("01", null, "03",null);
		var grid03_arr:Array = new Array("02", null, "04",null);
		var grid04_arr:Array = new Array("03", null, "05",null);
		var grid05_arr:Array = new Array("04", null, "06",null);
		var grid06_arr:Array = new Array("05", null, null,null);
		
		grid00_arr:Array = new Array(null, null, "01","07");
		grid01_arr:Array = new Array("00", null, "02","09");
		grid02_arr:Array = new Array("01", null, "03","09");
		grid03_arr:Array = new Array("02", null, "04","10");
		grid04_arr:Array = new Array("03", null, "05","11");
		grid05_arr:Array = new Array("04", null, "06","12");
		grid06_arr:Array = new Array("05", null, null,"13");
		
		");
		*/
		
		private function HashGrid():void{
			trace("HASH GRID");
			
			GridChecker2("03",grid03_arr[0],grid03_arr[1],grid03_arr[2],grid03_arr[3]);

		}
		private function GridChecker2(GridNum:String,
									  n_l:String,
									  n_t:String,
									  n_r:String,
									  n_b:String):void{
			trace(ClosedArr.join());
			
			if(ClearedArr.indexOf( GridNum ) > -1 ){
				if(n_l != null){
					if(this[('grid_'+GridNum)].left === true){
						if(this[('grid_'+n_l)].right === true){
							trace('grid_'+GridNum+' left connects to grid_'+n_l+' right' );
							if (ClearedArr.indexOf(n_l) < 0){
								ClearedArr.push(n_l);
								ClosedArr.splice(ClosedArr.indexOf(n_l), 1);
								GridChecker2(''+n_l,
									this['grid'+n_l+'_arr'][0],
									this['grid'+n_l+'_arr'][1],
									this['grid'+n_l+'_arr'][2],
									this['grid'+n_l+'_arr'][3]);
							}else{
							//	ClearedArr.splice(ClearedArr.indexOf(""+n_l), 1);
							}
						//	this[('grid_'+n_l)].TurnOn();
						//	ClearedArr.push(n_l);
						}
					}
				}
				if(n_t != null){
					if(this[('grid_'+GridNum)].top === true){
						if(this[('grid_'+n_t)].bottom === true){
							trace('grid_'+GridNum+' top connects to grid_'+n_t+' bottom' );
							if (ClearedArr.indexOf(n_t) < 0){
								ClearedArr.push(n_t);
								ClosedArr.splice(ClosedArr.indexOf(n_t), 1);
								GridChecker2(''+n_t,
									this['grid'+n_t+'_arr'][0],
									this['grid'+n_t+'_arr'][1],
									this['grid'+n_t+'_arr'][2],
									this['grid'+n_t+'_arr'][3]);
							}
							
						//	ClearedArr.push(n_t);
						}else{
						//	ClearedArr.splice(ClearedArr.indexOf(""+n_t), 1);
						}
					//	this[('grid_'+n_t)].TurnOn();
					}
				}
				if(n_r != null){
					if(this[('grid_'+GridNum)].right === true){
						if(this[('grid_'+n_r)].left === true){
							trace('grid_'+GridNum+' right connects to grid_'+n_r+' left' );
							if (ClearedArr.indexOf(n_r) < 0){
								ClearedArr.push(n_r);
								ClosedArr.splice(ClosedArr.indexOf(n_r), 1);
								GridChecker2(''+n_r,
									this['grid'+n_r+'_arr'][0],
									this['grid'+n_r+'_arr'][1],
									this['grid'+n_r+'_arr'][2],
									this['grid'+n_r+'_arr'][3]);
							}else{
							//	ClearedArr.splice(ClearedArr.indexOf(""+n_r), 1);
							}
						//	this[('grid_'+n_r)].TurnOn();
						//	ClearedArr.push(n_r);
						}
					}
				}
				if(n_b != null){
					if(this[('grid_'+GridNum)].bottom === true){
						if(this[('grid_'+n_b)].top === true){
							trace('grid_'+GridNum+' bottom connects to grid_'+n_b+' top' );
							if (ClearedArr.indexOf(n_b) < 0){
								ClearedArr.push(n_b);
								ClosedArr.splice(ClosedArr.indexOf(n_b), 1);
								GridChecker2(''+n_b,
									this['grid'+n_b+'_arr'][0],
									this['grid'+n_b+'_arr'][1],
									this['grid'+n_b+'_arr'][2],
									this['grid'+n_b+'_arr'][3]);
							//	ExtendGridCheck(''+n_b,this['grid'+n_b+'_arr'][0],this['grid'+n_b+'_arr'][1]);
							}else{
							//	ClearedArr.splice(ClearedArr.indexOf(""+n_b), 1);
							}
						//	this[('grid_'+n_b)].TurnOn();
						//	ClearedArr.push(n_b);
						}else{
						//	this[('grid_'+n_b)].TurnO();
						}
					}
				}
			}
			
			//if(GridNum == '14'){
				
				for (var i:int = 0; i < ClearedArr.length; i++){
					trace(ClearedArr[i]);
					if (ClearedArr.indexOf(ClearedArr[i]) >= 0){
						this[('grid_'+ClearedArr[i])].TurnOn();
						
					}else{
						//	this[('grid_'+ClearedArr[i])].TurnOff();
						//	}
					}
					
					if((i+1) == ClearedArr.length){
						for (var a:int = 0; a < 35; a++){
							if (ClosedArr.indexOf(ClosedArr[a]) >= 0){
								trace("close: "+ClosedArr[a])
								this[('grid_'+ClosedArr[a])].TurnOff();
							}	
						}
					}
				}
				
			//}
			
			trace(ClearedArr.join());
			trace(ClosedArr.join());
			
			Solve();
			
			
		}
		//private function Save():void{
			
			
			
		//}
		
		private function Solve():void{
			
			
			trace("Solving");
			
			
			if(ClearedArr.length == 35){
				trace('Cleared Length :'+ClearedArr.length);
				trace('grid31_pos : '+grid31_pos)
				if(grid31_pos == '0'){
					if(Animating === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerUp();
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Spark(2);
						Animating = true;
						
						bottom.alpha = 1;
						Animating = true;
						trace("SOLVED SOLVED SOLVED");
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElectricBox;
						}		
						SaveArray['Solved'] = 'Yes';
						//	SaveArray['ClearedArr'] = ClearedArr;
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElectricBox',SaveArray);	
						
						
						delayedcall = new DelayedCall(function():void{
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerPulse();
						//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
							//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_EnergyPulse();
							Animating = false;
							FadeOut(ServerRoom,(stage.getChildAt(0) as Object).screenGamePlayHandler.ServerRoomObj,true)
							
						},2);
						
						
						Starling.juggler.add(delayedcall);
					}
					
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
			
			
			
			this.assets.removeTexture("electricBox_bg",true);
			this.assets.removeTexture("ElectricBox_Sprite_01",true);
			this.assets.removeTextureAtlas("ElectricBox_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("electricBox_01");
			(stage.getChildAt(0) as Object).falseAsset("electricBox_02");
			(stage.getChildAt(0) as Object).falseAsset("electricBox_03");
			
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
