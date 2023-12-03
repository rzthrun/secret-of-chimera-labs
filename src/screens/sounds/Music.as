package screens.sounds
{
	import flash.filesystem.File;
	import flash.media.Sound;
	
	import starling.utils.AssetManager;

	public class Music
	{
		public var assets:AssetManager;
		public var soundManager:SoundManager;
		
		public var MUS_MainTheme:Sound;		
	//	public var MUS_DeepDrums:Sound;		
		public var MUS_SciFiWhistle:Sound;		
	//	public var MUS_MountainViolin:Sound;
	//	public var MUS_BeachStrings:Sound;
		public var MUS_MouseTrap:Sound;
		public var MUS_SoulSearch:Sound;
		public var MUS_Potash:Sound;
		public var MUS_CharmsSoft:Sound;
		public var MUS_DarkDance:Sound;
		public var MUS_Doom:Sound;
		public var MUS_MorGu:Sound;
		public var MUS_Harper:Sound;
		public var MUS_Ezekiel:Sound;
		public var MUS_SubBop:Sound;
		public var MUS_TenseOut:Sound;
		public var MUS_MonsterBeat:Sound;
		public var MUS_XFiles:Sound;
		public var MUS_SpeedDial:Sound;
		public var MUS_JamLoop:Sound;
		public var MUS_DeepSpace:Sound;
		public var MUS_LightBeam:Sound;
		
		public var MUS_StarryNight:Sound;
		public var MUS_RansomRetreat:Sound;
		public var MUS_MarsLanding:Sound;
	//	public var MUS_NoctreWave:Sound;
		public var MUS_SoYoung:Sound;
		public var MUS_Phantom:Sound;
		public var MUS_Solo:Sound;
		public var MUS_WierdScifi:Sound;
		public var MUS_MacLeodOne:Sound;
		public var MUS_MacLeodTwo:Sound;
		public var MUS_ErrieAlley:Sound;
		
		
		public var MUS_empty:Sound;
	//	public var channel:SoundChannel;
	//	public var volumeAdjust:SoundTransform = new SoundTransform();
		
		public var globalVol:Number = 0.5;
		
		public var currentSong:String = null;
		public var currentAmbient:String = null;
		
		public var pauseArr:Array = new Array();
		
		private var paused:Boolean = false;
		
		public function Music()
		{
			this.assets = new AssetManager();
			soundManager = new SoundManager();
		}
		
		public function Null_CurrentSong():void{
			currentSong = null;
		}
		public function Null_CurrentAmbient():void{
			currentAmbient = null;
		}
		
		/*
		public var MUS_SciFiWhistle:Sound;
		public var MUS_MidnightChorus:Sound;
		
		*/
		
		//MUS_Solo
		//MUS_ErrieAlley
		//
		public function LoadErrieAlley(p:Boolean = false,r:Number = 0,t:Number = 0):void{	
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/ErrieAlley.mp3'));			
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					ReadyErrieAlley(p,r,t);
				}
			});		
		}
		private function ReadyErrieAlley(p:Boolean = false,r:Number = 0,t:Number = 0):void{			
			MUS_ErrieAlley = assets.getSound("ErrieAlley");
			soundManager.addSound("ErrieAlley", MUS_ErrieAlley);
			if(p === true){
				Play_ErrieAlley(r,t);
			}
		}
		
		public function Play_ErrieAlley(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "ErrieAlley";
			soundManager.playMusic("ErrieAlley",0,repeatCount,0,0,Null_CurrentSong);			
			soundManager.tweenVolume("ErrieAlley",globalVol,t);
		}
		
		////////////
		
		public function LoadMacLeodTwo(p:Boolean = false,r:Number = 0,t:Number = 0):void{	
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/MacLeodTwo.mp3'));			
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					ReadyMacLeodTwo(p,r,t);
				}
			});		
		}
		private function ReadyMacLeodTwo(p:Boolean = false,r:Number = 0,t:Number = 0):void{			
			MUS_MacLeodTwo = assets.getSound("MacLeodTwo");
			soundManager.addSound("MacLeodTwo", MUS_MacLeodTwo);
			if(p === true){
				Play_MacLeodTwo(r,t);
			}
		}
		
		public function Play_MacLeodTwo(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "MacLeodTwo";
			soundManager.playMusic("MacLeodTwo",0,repeatCount,0,0,Null_CurrentSong);			
			soundManager.tweenVolume("MacLeodTwo",globalVol,t);
		}
		
		////////////
		
		
		//
		public function LoadMacLeodOne(p:Boolean = false,r:Number = 0,t:Number = 0):void{	
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/MacLeodOne.mp3'));			
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					ReadyMacLeodOne(p,r,t);
				}
			});		
		}
		private function ReadyMacLeodOne(p:Boolean = false,r:Number = 0,t:Number = 0):void{			
			MUS_MacLeodOne = assets.getSound("MacLeodOne");
			soundManager.addSound("MacLeodOne", MUS_MacLeodOne);
			if(p === true){
				Play_MacLeodOne(r,t);
			}
		}
		
		public function Play_MacLeodOne(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "MacLeodOne";
			soundManager.playMusic("MacLeodOne",0,repeatCount,0,0,Null_CurrentSong);			
			soundManager.tweenVolume("MacLeodOne",globalVol,t);
		}
		
		////////////
		
		public function LoadWierdScifi(p:Boolean = false,r:Number = 0,t:Number = 0):void{	
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/WierdScifi.mp3'));			
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					ReadyWierdScifi(p,r,t);
				}
			});		
		}
		private function ReadyWierdScifi(p:Boolean = false,r:Number = 0,t:Number = 0):void{			
			MUS_WierdScifi = assets.getSound("WierdScifi");
			soundManager.addSound("WierdScifi", MUS_WierdScifi);
			if(p === true){
				Play_WierdScifi(r,t);
			}
		}
		
		public function Play_WierdScifi(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "WierdScifi";
			soundManager.playMusic("WierdScifi",0,repeatCount,0,0,Null_CurrentSong);			
			soundManager.tweenVolume("WierdScifi",globalVol,t);
		}
		
		////////////
		public function LoadSolo(p:Boolean = false,r:Number = 0,t:Number = 0):void{	
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/Solo.mp3'));			
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					ReadySolo(p,r,t);
				}
			});		
		}
		private function ReadySolo(p:Boolean = false,r:Number = 0,t:Number = 0):void{			
			MUS_Solo = assets.getSound("Solo");
			soundManager.addSound("Solo", MUS_Solo);
			if(p === true){
				Play_Solo(r,t);
			}
		}
		
		public function Play_Solo(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "Solo";
			soundManager.playMusic("Solo",0,repeatCount,0,0,Null_CurrentSong);			
			soundManager.tweenVolume("Solo",globalVol,t);
		}
		
		////////////
		////////////
		public function LoadPhantom(p:Boolean = false,r:Number = 0,t:Number = 0):void{	
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/Phantom.mp3'));			
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					ReadyPhantom(p,r,t);
				}
			});		
		}
		private function ReadyPhantom(p:Boolean = false,r:Number = 0,t:Number = 0):void{			
			MUS_Phantom = assets.getSound("Phantom");
			soundManager.addSound("Phantom", MUS_Phantom);
			if(p === true){
				Play_Phantom(r,t);
			}
		}
		
		public function Play_Phantom(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "Phantom";
			soundManager.playMusic("Phantom",0,repeatCount,0,0,Null_CurrentSong);			
			soundManager.tweenVolume("Phantom",globalVol,t);
		}
		
		////////////
		
		public function LoadSoYoung(p:Boolean = false,r:Number = 0,t:Number = 0):void{	
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/SoYoung.mp3'));			
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					ReadySoYoung(p,r,t);
				}
			});		
		}
		private function ReadySoYoung(p:Boolean = false,r:Number = 0,t:Number = 0):void{			
			MUS_SoYoung = assets.getSound("SoYoung");
			soundManager.addSound("SoYoung", MUS_SoYoung);
			if(p === true){
				Play_SoYoung(r,t);
			}
		}
		
		public function Play_SoYoung(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "SoYoung";
			soundManager.playMusic("SoYoung",0,repeatCount,0,0,Null_CurrentSong);			
			soundManager.tweenVolume("SoYoung",globalVol,t);
		}
		
		////////////

		
		public function LoadMarsLanding(p:Boolean = false,r:Number = 0,t:Number = 0):void{	
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/MarsLanding.mp3'));			
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					ReadyMarsLanding(p,r,t);
				}
			});		
		}
		private function ReadyMarsLanding(p:Boolean = false,r:Number = 0,t:Number = 0):void{			
			MUS_MarsLanding = assets.getSound("MarsLanding");
			soundManager.addSound("MarsLanding", MUS_MarsLanding);
			if(p === true){
				Play_MarsLanding(r,t);
			}
		}
		
		public function Play_MarsLanding(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "MarsLanding";
			soundManager.playMusic("MarsLanding",0,repeatCount,0,0,Null_CurrentSong);			
			soundManager.tweenVolume("MarsLanding",globalVol,t);
		}
		
		////////////
		public function LoadRansomRetreat(p:Boolean = false,r:Number = 0,t:Number = 0):void{	
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/RansomRetreat.mp3'));			
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					ReadyRansomRetreat(p,r,t);
				}
			});		
		}
		private function ReadyRansomRetreat(p:Boolean = false,r:Number = 0,t:Number = 0):void{			
			MUS_RansomRetreat = assets.getSound("RansomRetreat");
			soundManager.addSound("RansomRetreat", MUS_RansomRetreat);
			if(p === true){
				Play_RansomRetreat(r,t);
			}
		}
		
		public function Play_RansomRetreat(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "RansomRetreat";
			soundManager.playMusic("RansomRetreat",0,repeatCount,0,0,Null_CurrentSong);			
			soundManager.tweenVolume("RansomRetreat",globalVol,t);
		}
		
		////////////
		
		public function LoadStarryNight(p:Boolean = false,r:Number = 0,t:Number = 0):void{	
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/StarryNight.mp3'));			
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					ReadyStarryNight(p,r,t);
				}
			});		
		}
		private function ReadyStarryNight(p:Boolean = false,r:Number = 0,t:Number = 0):void{			
			MUS_StarryNight = assets.getSound("StarryNight");
			soundManager.addSound("StarryNight", MUS_StarryNight);
			if(p === true){
				Play_StarryNight(r,t);
			}
		}
		
		public function Play_StarryNight(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "StarryNight";
			soundManager.playMusic("StarryNight",0,repeatCount,0,0,Null_CurrentSong);			
			soundManager.tweenVolume("StarryNight",globalVol,t);
		}
		
		////////////
		public function LoadLightBeam(p:Boolean = false,r:Number = 0,t:Number = 0):void{	
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/LightBeam.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyLightBeam(p,r,t);
					}
				});		
		}
		private function ReadyLightBeam(p:Boolean = false,r:Number = 0,t:Number = 0):void{			
			MUS_LightBeam = assets.getSound("LightBeam");
			soundManager.addSound("LightBeam", MUS_LightBeam);
			if(p === true){
				Play_LightBeam(r,t);
			}
		}
		
		public function Play_LightBeam(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "LightBeam";
			soundManager.playMusic("LightBeam",0,repeatCount,0,0,Null_CurrentSong);			
			soundManager.tweenVolume("LightBeam",globalVol,t);
		}
		
		
		//
		
		//
		public function LoadDeepSpace(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("DeepSpace")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/DeepSpace.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyDeepSpace(p,r,t);
					}
				});
			}
		}
		private function ReadyDeepSpace(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_DeepSpace = assets.getSound("DeepSpace");
			soundManager.addSound("DeepSpace", MUS_DeepSpace);
			if(p === true){
				Play_DeepSpace(r,t);
			}
		}
		
		public function Play_DeepSpace(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "DeepSpace";
			soundManager.playMusic("DeepSpace",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("DeepSpace",globalVol,t);
		}
		
		
		//
		//
		public function LoadJamLoop(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("JamLoop")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/JamLoop.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyJamLoop(p,r,t);
					}
				});
			}
		}
		private function ReadyJamLoop(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_JamLoop = assets.getSound("JamLoop");
			soundManager.addSound("JamLoop", MUS_JamLoop);
			if(p === true){
				Play_JamLoop(r,t);
			}
		}
		
		public function Play_JamLoop(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "JamLoop";
			soundManager.playMusic("JamLoop",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("JamLoop",globalVol,t);
		}
		
		
		//
		
		//
		public function LoadSpeedDial(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("SpeedDial")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/SpeedDial.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadySpeedDial(p,r,t);
					}
				});
			}
		}
		private function ReadySpeedDial(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_SpeedDial = assets.getSound("SpeedDial");
			soundManager.addSound("SpeedDial", MUS_SpeedDial);
			if(p === true){
				Play_SpeedDial(r,t);
			}
		}
		
		public function Play_SpeedDial(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "SpeedDial";
			soundManager.playMusic("SpeedDial",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("SpeedDial",globalVol,t);
		}
		
		
		//
		//
		public function LoadXFiles(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("XFiles")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/XFiles.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyXFiles(p,r,t);
					}
				});
			}
		}
		private function ReadyXFiles(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_XFiles = assets.getSound("XFiles");
			soundManager.addSound("XFiles", MUS_XFiles);
			if(p === true){
				Play_XFiles(r,t);
			}
		}
		
		public function Play_XFiles(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "XFiles";
			soundManager.playMusic("XFiles",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("XFiles",globalVol,t);
		}
		
		
		//
		//
		public function LoadMonsterBeat(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("MonsterBeat")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/MonsterBeat.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyMonsterBeat(p,r,t);
					}
				});
			}
		}
		private function ReadyMonsterBeat(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_MonsterBeat = assets.getSound("MonsterBeat");
			soundManager.addSound("MonsterBeat", MUS_MonsterBeat);
			if(p === true){
				Play_MonsterBeat(r,t);
			}
		}
		
		public function Play_MonsterBeat(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "MonsterBeat";
			soundManager.playMusic("MonsterBeat",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("MonsterBeat",globalVol,t);
		}
		
		
		//

		
		//
		public function LoadSubBop(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("SubBop")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/SubBop.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadySubBop(p,r,t);
					}
				});
			}
		}
		private function ReadySubBop(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_SubBop = assets.getSound("SubBop");
			soundManager.addSound("SubBop", MUS_SubBop);
			if(p === true){
				Play_SubBop(r,t);
			}
		}
		
		public function Play_SubBop(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "SubBop";
			soundManager.playMusic("SubBop",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("SubBop",globalVol,t);
		}
		
		
		//
		
		//
		public function LoadMorGu(p:Boolean = false,r:Number = 0,t:Number = 0,onComplete:String = null):void{
			if(soundManager.soundIsPlaying("MorGu")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/MorGu.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyMorGu(p,r,t,onComplete);
					}
				});
			}
		}
		private function ReadyMorGu(p:Boolean = false,r:Number = 0,t:Number = 0,onComplete:String = null):void{
			//soundManager = SoundManager.getInstance();
			MUS_MorGu = assets.getSound("MorGu");
			soundManager.addSound("MorGu", MUS_MorGu);
			if(p === true){
				Play_MorGu(r,t,onComplete);
			}
		}
		
		public function Play_MorGu(repeatCount:Number = 0,t:Number = 0,onComplete:String = null):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "MorGu";
			soundManager.playMusic("MorGu",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolumeComplex("MorGu",globalVol,t,onComplete);
		}
		
		
		//
		/*
		//----------------------------------------------------------------		
		public function LoadMountainViolin(p:Boolean = false,r:Number = 0,t:Number = 0,onComplete:Function = null):void{
		if(soundManager.soundIsPlaying("MountainViolin")){
		
		}
		else{
		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/MountainViolin_001a005.mp3'));			
		this.assets.loadQueue(function(n:Number):void{
		if(n==1){
		ReadyMountainViolin(p,r,t,onComplete);
		}
		});
		}
		}
		private function ReadyMountainViolin(p:Boolean = false,r:Number = 0,t:Number = 0,onComplete:Function = null):void{
		//soundManager = SoundManager.getInstance();
		MUS_MountainViolin = assets.getSound("MountainViolin_001a005");
		soundManager.addSound("MountainViolin", MUS_MountainViolin);
		if(p === true){
		Play_MountainViolin(r,t,onComplete);
		}
		}
		
		public function Play_MountainViolin(repeatCount:Number = 0,t:Number = 0,onComplete:Function = null):void{
		trace("Music globalVol :"+globalVol);
		currentSong = "MountainViolin";
		soundManager.playMusic("MountainViolin",0,repeatCount,0,0,Null_CurrentSong);
		//soundManager.setVolume("MainThemeReduced", 0);
		soundManager.tweenVolumeComplexFunc("MountainViolin",globalVol,t,onComplete);
		}
		
		//-----------------
		*/
		public function LoadDarkDance(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("CharmsSoft")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/DarkDance.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyDarkDance(p,r,t);
					}
				});
			}
		}
		private function ReadyDarkDance(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_DarkDance = assets.getSound("DarkDance");
			soundManager.addSound("DarkDance", MUS_DarkDance);
			if(p === true){
				Play_DarkDance(r,t);
			}
		}
		
		public function Play_DarkDance(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "DarkDance";
			soundManager.playMusic("DarkDance",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("DarkDance",globalVol,t);
		}
		
		//
		public function LoadCharmsSoft(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("CharmsSoft")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/CharmsSoft.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyCharmsSoft(p,r,t);
					}
				});
			}
		}
		private function ReadyCharmsSoft(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_CharmsSoft = assets.getSound("CharmsSoft");
			soundManager.addSound("CharmsSoft", MUS_CharmsSoft);
			if(p === true){
				Play_CharmsSoft(r,t);
			}
		}
		
		public function Play_CharmsSoft(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "CharmsSoft";
			soundManager.playMusic("CharmsSoft",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("CharmsSoft",globalVol,t);
		}
		
		//
		
		public function LoadPotash(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("Potash")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/Potash.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyPotash(p,r,t);
					}
				});
			}
		}
		private function ReadyPotash(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_Potash = assets.getSound("Potash");
			soundManager.addSound("Potash", MUS_Potash);
			if(p === true){
				Play_Potash(r,t);
			}
		}
		
		public function Play_Potash(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "Potash";
			soundManager.playMusic("Potash",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("Potash",globalVol,t);
		}
		
		
		//-----------------
		//MUS_Doom
		
		//
		public function LoadDoom(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("Doom")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/Doom.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyDoom(p,r,t);
					}
				});
			}
		}
		private function ReadyDoom(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_Doom = assets.getSound("Doom");
			soundManager.addSound("Doom", MUS_Doom);
			if(p === true){
				Play_Doom(r,t);
			}
		}
		
		public function Play_Doom(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "Doom";
			soundManager.playMusic("Doom",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("Doom",globalVol,t);
		}
		
		
		//-----------------
		//MUS_Ezekiel
		
		//
		public function LoadEzekiel(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("Ezekiel")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/Ezekiel.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyEzekiel(p,r,t);
					}
				});
			}
		}
		private function ReadyEzekiel(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_Ezekiel = assets.getSound("Ezekiel");
			soundManager.addSound("Ezekiel", MUS_Ezekiel);
			if(p === true){
				Play_Ezekiel(r,t);
			}
		}
		
		public function Play_Ezekiel(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "Ezekiel";
			soundManager.playMusic("Ezekiel",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("Ezekiel",globalVol,t);
		}
		
		//-----------------
		//MUS_TenseOut
		//
		public function LoadTenseOut(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("TenseOut")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/TenseOut.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyTenseOut(p,r,t);
					}
				});
			}
		}
		private function ReadyTenseOut(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_TenseOut = assets.getSound("TenseOut");
			soundManager.addSound("TenseOut", MUS_TenseOut);
			if(p === true){
				Play_TenseOut(r,t);
			}
		}
		
		public function Play_TenseOut(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "TenseOut";
			soundManager.playMusic("TenseOut",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("TenseOut",globalVol,t);
		}
		
		//-----------------
		
		//
		public function LoadSoulSearch(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("SoulSearch")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/SoulSearch.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadySoulSearch(p,r,t);
					}
				});
			}
		}
		private function ReadySoulSearch(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_SoulSearch = assets.getSound("SoulSearch");
			soundManager.addSound("SoulSearch", MUS_SoulSearch);
			if(p === true){
				Play_SoulSearch(r,t);
			}
		}
		
		public function Play_SoulSearch(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "SoulSearch";
			soundManager.playMusic("SoulSearch",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("SoulSearch",globalVol,t);
		}
		
		//-----------------
		
		public function LoadMouseTrap(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("MouseTrap")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/MouseTrap.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyMouseTrap(p,r,t);
					}
				});
			}
		}
		private function ReadyMouseTrap(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_MouseTrap = assets.getSound("MouseTrap");
			soundManager.addSound("MouseTrap", MUS_MouseTrap);
			if(p === true){
				Play_MouseTrap(r,t);
			}
		}
		
		public function Play_MouseTrap(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "MouseTrap";
			soundManager.playMusic("MouseTrap",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("MouseTrap",globalVol,t);
		}
		
		//-----------------
		//MUS_Harper
		//----------------------------------------------------------------		
		public function LoadHarper(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("Harper")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/Harper.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadyHarper(p,r,t);
					}
				});
			}
		}
		private function ReadyHarper(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_Harper = assets.getSound("Harper");
			soundManager.addSound("Harper", MUS_Harper);
			if(p === true){
				Play_Harper(r,t);
			}
		}
		
		public function Play_Harper(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "Harper";
			soundManager.playMusic("Harper",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("Harper",globalVol,t);
		}
		
	
		//----------------------------------------------------------------		
		public function LoadSciFiWhistle(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("SciFiWhistle")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/ScifWhistle_v001a002.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						ReadySciFiWhistle(p,r,t);
					}
				});
			}
		}
		private function ReadySciFiWhistle(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_SciFiWhistle = assets.getSound("ScifWhistle_v001a002");
			soundManager.addSound("SciFiWhistle", MUS_SciFiWhistle);
			if(p === true){
				Play_SciFiWhistle(r,t);
			}
		}
		
		public function Play_SciFiWhistle(repeatCount:Number = 0,t:Number = 0):void{
			trace("Music globalVol :"+globalVol);
			currentSong = "SciFiWhistle";
			soundManager.playMusic("SciFiWhistle",0,repeatCount,0,0,Null_CurrentSong);
			//soundManager.setVolume("MainThemeReduced", 0);
			soundManager.tweenVolume("SciFiWhistle",globalVol,t);
		}
		
		//----------------------------------------------------------------
		
		

		
		
		
		public function LoadEmpty(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//	if(soundManager.soundIsPlaying("LightBeam")){
			
			//	}
			//	else{
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/empty.mp3'));			
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					ReadyEmpty(p,r,t);
				}
			});
			//	}
		}
		private function ReadyEmpty(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			MUS_empty = assets.getSound("empty");
			soundManager.addSound("empty", MUS_empty);
			if(p === true){
				Play_Empty(r,t);
			}
		}
		
		public function Play_Empty(repeatCount:Number = 0,t:Number = 0):void{
			//	trace("Music globalVol :"+globalVol);
			//	currentSong = "LightBeam";
			if(soundManager.soundIsPlaying("empty") === false){
				soundManager.playMusic("empty",0,repeatCount,0,0,Null_CurrentSong);
			}
			//soundManager.setVolume("MainThemeReduced", 0);
			//	soundManager.tweenVolume("empty",globalVol,t);
		}
		
		//----------------------------------------------------------------
		

		
		
		
//---------------------------------------------------------------		
		public function LoadMainTheme(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			if(soundManager.soundIsPlaying("MainTheme")){
				
			}
			else{
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/MainTheme_01.mp3'));			
			//	this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/music/PaulRobeson-SixteenTons_64kb.mp3'));			
				this.assets.loadQueue(function(n:Number):void{
					if(n==1){
						
						//	soundManager = new SoundManager();
						//					soundManager = SoundManager.getInstance();
						ReadyMainTheme(p,r,t);
					}
				});
			}
		}
		
		private function ReadyMainTheme(p:Boolean = false,r:Number = 0,t:Number = 0):void{
			//soundManager = SoundManager.getInstance();
			//MUS_MainTheme = assets.getSound("PaulRobeson-SixteenTons_64kb");
			MUS_MainTheme = assets.getSound("MainTheme_01");
			soundManager.addSound("MainTheme", MUS_MainTheme);
			if(p === true){
				Play_MainTheme(r,t);
			}
		}
		
	
		public function Play_MainTheme(repeatCount:Number = 0,t:Number = 0):void{
			if(paused === false){
				currentSong = "MainTheme";
				
				trace("Music globalVol :"+globalVol);
				currentSong = "MainTheme";
				soundManager.playMusic("MainTheme",0,repeatCount,0,0,function():void{Null_CurrentSong()});
				//soundManager.setVolume("MainThemeReduced", 0);
				soundManager.tweenVolume("MainTheme",globalVol,t);
			}else{
				currentSong = "MainTheme";
			}
		}
		
		
		
		//----------------------------------------------------------------		

//------------------------------------------------------------------		
		public function PauseAll():void{
			paused = true;
			if(MUS_MainTheme != null){
				pauseArr['MainTheme'] = soundManager.getPausePos("MainTheme");
				soundManager.stopSound('MainTheme');
			}
			


			if(MUS_MouseTrap != null){
				
				pauseArr['MouseTrap'] =  soundManager.getPausePos("MouseTrap");
				soundManager.stopSound('MouseTrap');
			}
			
			if(MUS_SoulSearch != null){
				
				pauseArr['SoulSearch'] =  soundManager.getPausePos("SoulSearch");
				soundManager.stopSound('SoulSearch');
			}
			if(MUS_Potash != null){
				
				pauseArr['Potash'] =  soundManager.getPausePos("Potash");
				soundManager.stopSound('Potash');
			}
			if(MUS_CharmsSoft != null){
				
				pauseArr['CharmsSoft'] =  soundManager.getPausePos("CharmsSoft");
				soundManager.stopSound('CharmsSoft');
			}
			if(MUS_Doom != null){
				
				pauseArr['Doom'] =  soundManager.getPausePos("Doom");
				soundManager.stopSound('Doom');
			}
			if(MUS_DarkDance != null){
				
				pauseArr['DarkDance'] =  soundManager.getPausePos("DarkDance");
				soundManager.stopSound('DarkDance');
			}
			
			if(MUS_MorGu != null){
				
				pauseArr['MorGu'] =  soundManager.getPausePos("MorGu");
				soundManager.stopSound('MorGu');
			}
			
			if(MUS_Harper != null){
				
				pauseArr['Harper'] =  soundManager.getPausePos("Harper");
				soundManager.stopSound('Harper');
			}
			if(MUS_Ezekiel != null){
				
				pauseArr['Ezekiel'] =  soundManager.getPausePos("Ezekiel");
				soundManager.stopSound('Ezekiel');
			}
			
			if(MUS_SubBop != null){
				
				pauseArr['SubBop'] =  soundManager.getPausePos("SubBop");
				soundManager.stopSound('SubBop');
			}
			
			if(MUS_TenseOut != null){
				
				pauseArr['TenseOut'] =  soundManager.getPausePos("TenseOut");
				soundManager.stopSound('TenseOut');
			}
			if(MUS_XFiles != null){
				
				pauseArr['XFiles'] =  soundManager.getPausePos("XFiles");
				soundManager.stopSound('XFiles');
			}
			if(MUS_SpeedDial != null){
				
				pauseArr['SpeedDial'] =  soundManager.getPausePos("SpeedDial");
				soundManager.stopSound('SpeedDial');
			}
			if(MUS_JamLoop != null){
				
				pauseArr['JamLoop'] =  soundManager.getPausePos("JamLoop");
				soundManager.stopSound('JamLoop');
			}
			if(MUS_DeepSpace != null){
				
				pauseArr['DeepSpace'] =  soundManager.getPausePos("DeepSpace");
				soundManager.stopSound('DeepSpace');
			}
			if(MUS_LightBeam != null){
				
				pauseArr['LightBeam'] =  soundManager.getPausePos("LightBeam");
				soundManager.stopSound('LightBeam');
			}
			if(MUS_StarryNight != null){
				
				pauseArr['StarryNight'] =  soundManager.getPausePos("StarryNight");
				soundManager.stopSound('StarryNight');
			}
			if(MUS_RansomRetreat != null){
				
				pauseArr['RansomRetreat'] =  soundManager.getPausePos("RansomRetreat");
				soundManager.stopSound('RansomRetreat');
			}
			if(MUS_MarsLanding != null){
				
				pauseArr['MarsLanding'] =  soundManager.getPausePos("MarsLanding");
				soundManager.stopSound('MarsLanding');
			}
			
			if(MUS_Phantom != null){
				
				pauseArr['Phantom'] =  soundManager.getPausePos("Phantom");
				soundManager.stopSound('Phantom');
			}
			
			if(MUS_Solo != null){
				
				pauseArr['Solo'] =  soundManager.getPausePos("Solo");
				soundManager.stopSound('Solo');
			}
			if(MUS_MacLeodOne != null){
				
				pauseArr['MacLeodOne'] =  soundManager.getPausePos("MacLeodOne");
				soundManager.stopSound('MacLeodOne');
			}
			/*
			MacLeodOne
			LoadSolo
			public var MUS_StarryNight:Sound;
			public var MUS_RansomRetreat:Sound;
			public var MUS_MarsLanding:Sound;
			public var MUS_NoctreWave:Sound;
			*/
			
		}
		public function resumeCurrentSong():void{
			paused = false;
			trace("currentSong "+currentSong);
			trace("pauseArr[currentSong] "+pauseArr[currentSong]);
			trace("pauseArr[currentSong]/1000 "+(pauseArr[currentSong]/1000));
			if(currentSong != null){
				var startPos:Number = (pauseArr[currentSong]);
				if(currentSong == 'MainTheme'){
					soundManager.ResumeMusic(currentSong,globalVol,999,0,startPos,Null_CurrentSong);
				}
				else{
					soundManager.ResumeMusic(currentSong,globalVol,0,0,startPos,Null_CurrentSong);
				}
			}
			
			
		}
		
		
		
	}
}