package screens.sounds
{
	import flash.filesystem.File;
	import flash.media.Sound;
	
	import starling.utils.AssetManager;
	
	
	
	public class Ambient
	{
		public var assets:AssetManager;
		public var soundManager:SoundManager;
		
		public var MUS_DuctVibe:Sound
		public var MUS_WindHowl:Sound
		public var MUS_SlipperyPlants:Sound
		public var MUS_BathroomDrip:Sound
		public var MUS_BurningFireOne:Sound;
		
		public var MUS_Dread:Sound;
		public var MUS_CaveDrips:Sound;
		public var MUS_HorrorBreath:Sound;
		public var MUS_MotorFan:Sound;
		public var MUS_BasementBongs:Sound;
		public var MUS_TVStatic:Sound;
		public var MUS_WindOne:Sound;
		public var MUS_ElectricHum:Sound;
	//	public var MUS_BuildingHum:Sound;
		public var MUS_Darkness:Sound;
		public var MUS_SpaceHum:Sound;
		public var MUS_SpaceHumPower:Sound;
	//	public var MUS_Sonar:Sound;
		
		public var MUS_CityHum:Sound;
		public var MUS_BuildingHum:Sound;
		public var MUS_ShipGroansOne:Sound
		public var MUS_Drone:Sound;
		public var MUS_RumblePulse:Sound;
		public var MUS_QuantumDrone:Sound;
		public var MUS_QuantumBalls:Sound;
		
		public var MUS_ControlBeeps:Sound;
		public var MUS_BlackHole:Sound;
		
		
		public var globalVol:Number = 0.5;
		
		
		public var currentAmbient:String = null;
		
		public var pauseArr:Array = new Array();
		
		private var paused:Boolean = false;
		
		public function Ambient()
		{
			this.assets = new AssetManager();
			soundManager = new SoundManager();
			
		}
		public function Null_CurrentAmbient():void{
			currentAmbient = null;
		}
		//BlackHole
		//----------------------------------------------------------------		
		public function LoadBlackHole(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("BlackHole")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/BlackHole.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyBlackHole(p,r,t);
					}
				});
			}
		}
		private function ReadyBlackHole(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_BlackHole = assets.getSound("BlackHole");
			soundManager.addSound("BlackHole", MUS_BlackHole);
			if(p === true){
				Play_BlackHole(r,t);
			}
		}
		
		public function Play_BlackHole(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "BlackHole";
			soundManager.playMusic("BlackHole",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("BlackHole",globalVol,t);
		}
		
		
		
		
		//----------------------------------------------------------------		
		public function LoadQuantumBalls(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("QuantumBalls")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/QuantumBalls.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyQuantumBalls(p,r,t);
					}
				});
			}
		}
		private function ReadyQuantumBalls(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_QuantumBalls = assets.getSound("QuantumBalls");
			soundManager.addSound("QuantumBalls", MUS_QuantumBalls);
			if(p === true){
				Play_QuantumBalls(r,t);
			}
		}
		
		public function Play_QuantumBalls(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "QuantumBalls";
			soundManager.playMusic("QuantumBalls",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("QuantumBalls",globalVol,t);
		}
		
		
		
		//----------------------------------------------------------------		
		public function LoadQuantumDrone(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("QuantumDrone")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/QuantumDrone.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyQuantumDrone(p,r,t);
					}
				});
			}
		}
		private function ReadyQuantumDrone(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_QuantumDrone = assets.getSound("QuantumDrone");
			soundManager.addSound("QuantumDrone", MUS_QuantumDrone);
			if(p === true){
				Play_QuantumDrone(r,t);
			}
		}
		
		public function Play_QuantumDrone(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "QuantumDrone";
			soundManager.playMusic("QuantumDrone",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("QuantumDrone",globalVol,t);
		}
		
		
		//----------------------------------------------------------------		
		public function LoadControlBeeps(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("ControlBeeps")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/ControlBeeps.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyControlBeeps(p,r,t);
					}
				});
			}
		}
		private function ReadyControlBeeps(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_ControlBeeps = assets.getSound("ControlBeeps");
			soundManager.addSound("ControlBeeps", MUS_ControlBeeps);
			if(p === true){
				Play_ControlBeeps(r,t);
			}
		}
		
		public function Play_ControlBeeps(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "ControlBeeps";
			soundManager.playMusic("ControlBeeps",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("ControlBeeps",globalVol,t);
		}
		
		//----------------------------------------------------------------		
		public function LoadRumblePulse(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("RumblePulse")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/RumblePulse.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyRumblePulse(p,r,t);
					}
				});
			}
		}
		private function ReadyRumblePulse(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_RumblePulse = assets.getSound("RumblePulse");
			soundManager.addSound("RumblePulse", MUS_RumblePulse);
			if(p === true){
				Play_RumblePulse(r,t);
			}
		}
		
		public function Play_RumblePulse(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "RumblePulse";
			soundManager.playMusic("RumblePulse",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("RumblePulse",globalVol,t);
		}
		
		//----------------------------------------------------------------		
		public function LoadDrone(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("Drone")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/Drone.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyDrone(p,r,t);
					}
				});
			}
		}
		private function ReadyDrone(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_Drone = assets.getSound("Drone");
			soundManager.addSound("Drone", MUS_Drone);
			if(p === true){
				Play_Drone(r,t);
			}
		}
		
		public function Play_Drone(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "Drone";
			soundManager.playMusic("Drone",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("Drone",globalVol,t);
		}
		
		//----------------------------------------------------------------		
		public function LoadShipGroansOne(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("ShipGroansOne")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/ShipGroansOne.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyShipGroansOne(p,r,t);
					}
				});
			}
		}
		private function ReadyShipGroansOne(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_ShipGroansOne = assets.getSound("ShipGroansOne");
			soundManager.addSound("ShipGroansOne", MUS_ShipGroansOne);
			if(p === true){
				Play_ShipGroansOne(r,t);
			}
		}
		
		public function Play_ShipGroansOne(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "ShipGroansOne";
			soundManager.playMusic("ShipGroansOne",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("ShipGroansOne",globalVol,t);
		}
		
		//----------------------------------------------------------------		
		public function LoadSpaceHumPower(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("SpaceHumPower")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/SpaceHumPower.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadySpaceHumPower(p,r,t);
					}
				});
			}
		}
		private function ReadySpaceHumPower(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_SpaceHumPower = assets.getSound("SpaceHumPower");
			soundManager.addSound("SpaceHumPower", MUS_SpaceHumPower);
			if(p === true){
				Play_SpaceHumPower(r,t);
			}
		}
		
		public function Play_SpaceHumPower(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "SpaceHumPower";
			soundManager.playMusic("SpaceHumPower",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("SpaceHumPower",globalVol,t);
		}
		
		
		//----------------------------------------------------------------		
		
		
		//----------------------------------------------------------------		
		public function LoadSpaceHum(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("SpaceHum")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/SpaceHum.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadySpaceHum(p,r,t);
					}
				});
			}
		}
		private function ReadySpaceHum(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_SpaceHum = assets.getSound("SpaceHum");
			soundManager.addSound("SpaceHum", MUS_SpaceHum);
			if(p === true){
				Play_SpaceHum(r,t);
			}
		}
		
		public function Play_SpaceHum(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "SpaceHum";
			soundManager.playMusic("SpaceHum",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("SpaceHum",globalVol,t);
		}
		
		
		//----------------------------------------------------------------		
		
		
		//----------------------------------------------------------------		
		public function LoadDarkness(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("Darkness")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/Darkness.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyDarkness(p,r,t);
					}
				});
			}
		}
		private function ReadyDarkness(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_Darkness = assets.getSound("Darkness");
			soundManager.addSound("Darkness", MUS_Darkness);
			if(p === true){
				Play_Darkness(r,t);
			}
		}
		
		public function Play_Darkness(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "Darkness";
			soundManager.playMusic("Darkness",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("Darkness",globalVol,t);
		}
		
		
		//----------------------------------------------------------------		
		
		
		//----------------------------------------------------------------		
		public function LoadBuildingHum(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("BuildingHum")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/BuildingHum.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyBuildingHum(p,r,t);
					}
				});
			}
		}
		private function ReadyBuildingHum(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_BuildingHum = assets.getSound("BuildingHum");
			soundManager.addSound("BuildingHum", MUS_BuildingHum);
			if(p === true){
				Play_BuildingHum(r,t);
			}
		}
		
		public function Play_BuildingHum(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "BuildingHum";
			soundManager.playMusic("BuildingHum",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("BuildingHum",globalVol,t);
		}
		
		
		//----------------------------------------------------------------		
		
		
		//----------------------------------------------------------------		
		public function LoadElectricHum(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("ElectricHum")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/ElectricHum.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyElectricHum(p,r,t);
					}
				});
			}
		}
		private function ReadyElectricHum(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_ElectricHum = assets.getSound("ElectricHum");
			soundManager.addSound("ElectricHum", MUS_ElectricHum);
			if(p === true){
				Play_ElectricHum(r,t);
			}
		}
		
		public function Play_ElectricHum(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "ElectricHum";
			soundManager.playMusic("ElectricHum",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("ElectricHum",globalVol,t);
		}
		
		
		//----------------------------------------------------------------		
		
		
		//----------------------------------------------------------------		
		public function LoadTVStatic(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("TVStatic")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/TVStatic.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyTVStatic(p,r,t);
					}
				});
			}
		}
		private function ReadyTVStatic(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_TVStatic = assets.getSound("TVStatic");
			soundManager.addSound("TVStatic", MUS_TVStatic);
			if(p === true){
				Play_TVStatic(r,t);
			}
		}
		
		public function Play_TVStatic(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "TVStatic";
			soundManager.playMusic("TVStatic",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("TVStatic",globalVol,t);
		}
		
		
		//----------------------------------------------------------------		
		
		//----------------------------------------------------------------		
		public function LoadBasementBongs(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("BasementBongs")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/BasementBongs.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyBasementBongs(p,r,t);
					}
				});
			}
		}
		private function ReadyBasementBongs(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_BasementBongs = assets.getSound("BasementBongs");
			soundManager.addSound("BasementBongs", MUS_BasementBongs);
			if(p === true){
				Play_BasementBongs(r,t);
			}
		}
		
		public function Play_BasementBongs(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "BasementBongs";
			soundManager.playMusic("BasementBongs",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("BasementBongs",globalVol,t);
		}
		
		
		//----------------------------------------------------------------		
		
		
		
		//----------------------------------------------------------------		
		public function LoadHorrorBreath(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("HorrorBreath")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/HorrorBreath.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyHorrorBreath(p,r,t);
					}
				});
			}
		}
		private function ReadyHorrorBreath(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_HorrorBreath = assets.getSound("HorrorBreath");
			soundManager.addSound("HorrorBreath", MUS_HorrorBreath);
			if(p === true){
				Play_HorrorBreath(r,t);
			}
		}
		
		public function Play_HorrorBreath(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "HorrorBreath";
			soundManager.playMusic("HorrorBreath",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("HorrorBreath",globalVol,t);
		}
		
		
		//----------------------------------------------------------------		
		
		
		//----------------------------------------------------------------		
		public function LoadCaveDrips(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("CaveDrips")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/CaveDrips.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyCaveDrips(p,r,t);
					}
				});
			}
		}
		private function ReadyCaveDrips(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_CaveDrips = assets.getSound("CaveDrips");
			soundManager.addSound("CaveDrips", MUS_CaveDrips);
			if(p === true){
				Play_CaveDrips(r,t);
			}
		}
		
		public function Play_CaveDrips(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "CaveDrips";
			soundManager.playMusic("CaveDrips",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("CaveDrips",globalVol,t);
		}
		
		
		//----------------------------------------------------------------		
		
		
		//----------------------------------------------------------------		
		public function LoadDread(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("Dread")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/Dread.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyDread(p,r,t);
					}
				});
			}
		}
		private function ReadyDread(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_Dread = assets.getSound("Dread");
			soundManager.addSound("Dread", MUS_Dread);
			if(p === true){
				Play_Dread(r,t);
			}
		}
		
		public function Play_Dread(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "Dread";
			soundManager.playMusic("Dread",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("Dread",globalVol,t);
		}
		
		//MUS_MotorFan
		//----------------------------------------------------------------		
		public function LoadMotorFan(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("MotorFan")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/MotorFan.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyMotorFan(p,r,t);
					}
				});
			}
		}
		private function ReadyMotorFan(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_MotorFan = assets.getSound("MotorFan");
			soundManager.addSound("MotorFan", MUS_MotorFan);
			if(p === true){
				Play_MotorFan(r,t);
			}
		}
		
		public function Play_MotorFan(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "MotorFan";
			soundManager.playMusic("MotorFan",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("MotorFan",globalVol,t);
		}
		
		//-----------------
		
		//----------------------------------------------------------------		
		public function LoadCityHum(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("CityHum")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/CityHum.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyCityHum(p,r,t);
					}
				});
			}
		}
		private function ReadyCityHum(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_CityHum = assets.getSound("CityHum");
			soundManager.addSound("CityHum", MUS_CityHum);
			if(p === true){
				Play_CityHum(r,t);
			}
		}
		
		public function Play_CityHum(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "CityHum";
			soundManager.playMusic("CityHum",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("CityHum",globalVol,t);
		}
		
		//-----------------
		
		//MUS_WindOne
		//----------------------------------------------------------------		
		public function LoadWindOne(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("WindOne")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/WindOne.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyWindOne(p,r,t);
					}
				});
			}
		}
		private function ReadyWindOne(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_WindOne = assets.getSound("WindOne");
			soundManager.addSound("WindOne", MUS_WindOne);
			if(p === true){
				Play_WindOne(r,t);
			}
		}
		
		public function Play_WindOne(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "WindOne";
			soundManager.playMusic("WindOne",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("WindOne",globalVol,t);
		}
		
		//-----------------
		
		//----------------------------------------------------------------		
		public function LoadBurningFireOne(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("BurningFireOne")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/BurningFireOne.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyBurningFireOne(p,r,t);
					}
				});
			}
		}
		private function ReadyBurningFireOne(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_BurningFireOne = assets.getSound("BurningFireOne");
			soundManager.addSound("BurningFireOne", MUS_BurningFireOne);
			if(p === true){
				Play_BurningFireOne(r,t);
			}
		}
		
		public function Play_BurningFireOne(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "BurningFireOne";
			soundManager.playMusic("BurningFireOne",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("BurningFireOne",globalVol,t);
		}
		
		//-----------------
		
		//----------------------------------------------------------------		
		public function LoadDuctVibe(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("DuctVibe")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/DuctVibe.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyDuctVibe(p,r,t);
					}
				});
			}
		}
		private function ReadyDuctVibe(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_DuctVibe = assets.getSound("DuctVibe");
			soundManager.addSound("DuctVibe", MUS_DuctVibe);
			if(p === true){
				Play_DuctVibe(r,t);
			}
		}
		
		public function Play_DuctVibe(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "DuctVibe";
			soundManager.playMusic("DuctVibe",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("DuctVibe",globalVol,t);
		}
		
		//-----------------
		//----------------------------------------------------------------		
		public function LoadSlipperyPlants(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("SlipperyPlants")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/SlipperyPlants.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadySlipperyPlants(p,r,t);
					}
				});
			}
		}
		private function ReadySlipperyPlants(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_SlipperyPlants = assets.getSound("SlipperyPlants");
			soundManager.addSound("SlipperyPlants", MUS_SlipperyPlants);
			if(p === true){
				Play_SlipperyPlants(r,t);
			}
		}
		
		public function Play_SlipperyPlants(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "SlipperyPlants";
			soundManager.playMusic("SlipperyPlants",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("SlipperyPlants",globalVol,t);
		}
		
		//-----------------
		
		//----------------------------------------------------------------		
		public function LoadWindHowl(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("WindHowl")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/WindHowl.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyWindHowl(p,r,t);
					}
				});
			}
		}
		private function ReadyWindHowl(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_WindHowl = assets.getSound("WindHowl");
			soundManager.addSound("WindHowl", MUS_WindHowl);
			if(p === true){
				Play_WindHowl(r,t);
			}
		}
		
		public function Play_WindHowl(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "WindHowl";
			soundManager.playMusic("WindHowl",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("WindHowl",globalVol,t);
		}
		
		//-----------------
		
		//----------------------------------------------------------------		
		public function LoadBathroomDrip(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("BathroomDrip")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/ambient/BathroomDrip.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyBathroomDrip(p,r,t);
					}
				});
			}
		}
		private function ReadyBathroomDrip(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_BathroomDrip = assets.getSound("BathroomDrip");
			soundManager.addSound("BathroomDrip", MUS_BathroomDrip);
			if(p === true){
				Play_BathroomDrip(r,t);
			}
		}
		
		public function Play_BathroomDrip(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentAmbient = "BathroomDrip";
			soundManager.playMusic("BathroomDrip",0,repeatCount,0,0,Null_CurrentAmbient);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("BathroomDrip",globalVol,t);
		}
		
		//-----------------
		public function PauseAll():void{
			paused = true;
//ShipGroansOne
			if(MUS_ShipGroansOne != null){
				
				pauseArr['ShipGroansOne'] =  soundManager.getPausePos("ShipGroansOne");
				soundManager.stopSound('ShipGroansOne');
			}
			if(MUS_DuctVibe != null){
				
				pauseArr['DuctVibe'] =  soundManager.getPausePos("DuctVibe");
				soundManager.stopSound('DuctVibe');
			}
			if(MUS_WindHowl != null){
				
				pauseArr['WindHowl'] =  soundManager.getPausePos("WindHowl");
				soundManager.stopSound('WindHowl');
			}
			if(MUS_BathroomDrip != null){
				
				pauseArr['BathroomDrip'] =  soundManager.getPausePos("BathroomDrip");
				soundManager.stopSound('BathroomDrip');
			}
			
			if(MUS_BurningFireOne != null){
				
				pauseArr['BurningFireOne'] =  soundManager.getPausePos("BurningFireOne");
				soundManager.stopSound('BurningFireOne');
			}
			if(MUS_CityHum != null){
				
				pauseArr['CityHum'] =  soundManager.getPausePos("CityHum");
				soundManager.stopSound('CityHum');
			}
			if(MUS_Dread != null){
				
				pauseArr['Dread'] =  soundManager.getPausePos("Dread");
				soundManager.stopSound('Dread');
			}
			
			if(MUS_CaveDrips != null){
				
				pauseArr['CaveDrips'] =  soundManager.getPausePos("CaveDrips");
				soundManager.stopSound('CaveDrips');
			}
			if(MUS_HorrorBreath != null){
				
				pauseArr['HorrorBreath'] =  soundManager.getPausePos("HorrorBreath");
				soundManager.stopSound('HorrorBreath');
			}
			if(MUS_SlipperyPlants != null){
				
				pauseArr['SlipperyPlants'] =  soundManager.getPausePos("SlipperyPlants");
				soundManager.stopSound('SlipperyPlants');
			}
			
			if(MUS_MotorFan != null){
				
				pauseArr['MotorFan'] =  soundManager.getPausePos("MotorFan");
				soundManager.stopSound('MotorFan');
			}
			if(MUS_BasementBongs != null){
				
				pauseArr['BasementBongs'] =  soundManager.getPausePos("BasementBongs");
				soundManager.stopSound('BasementBongs');
			}
			
			if(MUS_TVStatic != null){
				
				pauseArr['TVStatic'] =  soundManager.getPausePos("TVStatic");
				soundManager.stopSound('TVStatic');
			}
			
			if(MUS_ElectricHum != null){
				
				pauseArr['ElectricHum'] =  soundManager.getPausePos("ElectricHum");
				soundManager.stopSound('ElectricHum');
			}
			if(MUS_BuildingHum != null){
				
				pauseArr['BuildingHum'] =  soundManager.getPausePos("BuildingHum");
				soundManager.stopSound('BuildingHum');
			}
			if(MUS_WindOne != null){
				
				pauseArr['WindOne'] =  soundManager.getPausePos("WindOne");
				soundManager.stopSound('WindOne');
			}
			if(MUS_Darkness != null){
				
				pauseArr['Darkness'] =  soundManager.getPausePos("Darkness");
				soundManager.stopSound('Darkness');
			}
			if(MUS_SpaceHum != null){
				
				pauseArr['SpaceHum'] =  soundManager.getPausePos("SpaceHum");
				soundManager.stopSound('SpaceHum');
			}
			if(MUS_SpaceHumPower != null){
				
				pauseArr['SpaceHumPower'] =  soundManager.getPausePos("SpaceHumPower");
				soundManager.stopSound('SpaceHumPower');
			}
			
			if(MUS_RumblePulse != null){
				
				pauseArr['RumblePulse'] =  soundManager.getPausePos("RumblePulse");
				soundManager.stopSound('RumblePulse');
			}
			//RumblePulse
			//public var MUS_SpaceHum:Sound;
			//public var MUS_SpaceHumPower:Sound;
			
		}
		public function resumeCurrentSong():void{
			paused = false;
			
			if(currentAmbient != null){
			//	var startPosAmb:Number = (pauseArr[currentAmbient]);
				
				soundManager.ResumeMusic(currentAmbient,globalVol,999,0,0,Null_CurrentAmbient);
				
			}
		}
		
	}
}