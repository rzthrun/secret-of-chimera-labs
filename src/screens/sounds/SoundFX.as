package screens.sounds
{
	import flash.filesystem.File;
	import flash.media.Sound;
	
	import starling.utils.AssetManager;
	public class SoundFX
	{
		public var assets:AssetManager;
		public var soundManager:SoundManager;
		
		public var SFX_Lightning_01:Sound;
		public var SFX_Thunder_01:Sound;
		public var SFX_DrawSlideOpen:Sound;
		public var SFX_DrawSlideClosed:Sound;
		public var SFX_DoorMetalRustyOpen:Sound;
		public var SFX_DoorMetalRustyClose:Sound;
		public var SFX_DoorMetalRustyOpenTwo:Sound;
		public var SFX_DoorMetalRustyCloseTwo:Sound;
		public var SFX_ThakOne:Sound;
		public var SFX_ThakTwo:Sound;
		public var SFX_ThakThree:Sound;
		public var SFX_Gurgles:Sound;
		public var SFX_ShovelOne:Sound;
		public var SFX_ShovelTwo:Sound;
		public var SFX_GrainOne:Sound;
		public var SFX_WheelOne:Sound;
		public var SFX_Saw:Sound
		public var SFX_FallingTree:Sound
		public var SFX_TVBlip:Sound
		public var SFX_TVBlop:Sound
		public var SFX_CreakyClose:Sound;
		public var SFX_CreakyOpen:Sound;
		public var SFX_PageUnroll:Sound;
		public var SFX_Knot:Sound;
		public var SFX_RopeClimb:Sound;
		public var SFX_BigLight:Sound;
		public var SFX_electricLight:Sound;
		public var SFX_RattleOne:Sound;
		public var SFX_Sizzle:Sound;
		public var SFX_SizzleTwo:Sound;
		public var SFX_BlowTorch:Sound;
		public var SFX_MetalDropHeavy:Sound;
		public var SFX_MetalDropLight:Sound;
		public var SFX_BarrelKickDeep:Sound;
		public var SFX_BarrelKickLight:Sound;
		public var SFX_ClinkOne:Sound;
		public var SFX_GrowlDeep:Sound;
		public var SFX_GrowlOne:Sound;
		public var SFX_GrowlTwo:Sound;
		public var SFX_Chewing:Sound;
		public var SFX_ComsicRays:Sound;
		public var SFX_OhmTwo:Sound;
		public var SFX_RemoveNail:Sound;
		public var SFX_RemoveNail3x:Sound;
		public var SFX_CosmicWaffle:Sound;
		public var SFX_CosmicDoor:Sound;
		public var SFX_CosmicWindUp:Sound;
		public var SFX_CosmicProcess:Sound;
		public var SFX_ClickSciFi:Sound;
		public var SFX_ClickSciFiTwo:Sound;
		public var SFX_ClickSciFiThree:Sound;
		public var SFX_ErrorTwo:Sound;
		public var SFX_SciFiTransPorter:Sound;
		public var SFX_Spark:Sound;
		public var SFX_CrystalPing:Sound;
		public var SFX_CrystalPingTwo:Sound;
		public var SFX_CrystalWave:Sound;
		public var SFX_CrystalWaveTwo:Sound;
		public var SFX_HeartBeat:Sound;
		
		
		public var SFX_InvenOpen:Sound;
		public var SFX_Phone:Sound;
		public var SFX_Gong:Sound;
		public var SFX_Powm:Sound;
		public var SFX_PowmTwo:Sound;
		public var SFX_PowmThree:Sound;
		public var SFX_PageTurn:Sound;	
		public var SFX_BoxOpen:Sound;
		public var SFX_BoxClose:Sound;
		public var SFX_ItemPickUp:Sound;		
		public var SFX_LockedDoor:Sound;
		public var SFX_LockedDoorTwo:Sound;		
		public var SFX_CreakyDoor:Sound
		public var SFX_SuccessLow:Sound;
		public var SFX_CreakyDoorTwo:Sound;
		public var SFX_CreakyDoorThree:Sound;
		public var SFX_Steps:Sound;		
		public var SFX_MetalSteps:Sound;		
		public var SFX_Match:Sound
		public var SFX_FireBall:Sound;
		public var SFX_ItemPlace:Sound;
		public var SFX_Thump:Sound;
		public var SFX_Bung:Sound;
		public var SFX_ClickTiny:Sound;
		public var SFX_Click:Sound;
		public var SFX_WindUp:Sound
		public var SFX_ClockChime:Sound;
		public var SFX_WaterFlow:Sound;		
		public var SFX_FridgeOpen:Sound;
		public var SFX_FridgeClose:Sound;		
		public var SFX_DrawerOpen:Sound;
		public var SFX_DrawerClose:Sound;		
		public var SFX_Splash:Sound;
		public var SFX_SplashTwo:Sound;
		public var SFX_SplashOut:Sound;		
		public var SFX_LadderOpen:Sound;
		public var SFX_Ladder:Sound;		
		public var SFX_MailBox:Sound		
		public var SFX_ComputerBeeps:Sound;
		public var SFX_ComputerBeepsTwo:Sound;	
		public var SFX_StoneDrag:Sound;
		public var SFX_HeavyStoneDrag:Sound;		
		public var SFX_Ohm:Sound;		
		public var SFX_AirRelease:Sound;		
		public var SFX_MetalBoxClose:Sound;
		public var SFX_MetalBoxOpen:Sound;		
		public var SFX_PowerUp:Sound;
		public var SFX_EnergyPulse:Sound;		
		public var SFX_LockPick:Sound;
		public var SFX_Unlock:Sound;		
		public var SFX_ChestOpen:Sound;		
		public var SFX_GearsOne:Sound;
		public var SFX_GearsTwo:Sound;
		public var SFX_GearsThree:Sound;		
		public var SFX_BootUp:Sound;		
		public var SFX_Bubbles:Sound;		
		public var SFX_WaterBoil:Sound;		
		public var SFX_Error:Sound;		
		public var SFX_WaterDroplet:Sound;		
		public var SFX_WaterPour:Sound;		
		public var SFX_Machine:Sound;
		
		public var SFX_SparksThree:Sound;
		public var SFX_DoorBeepsAccessDenied:Sound;
		public var SFX_DoorBeepsAccessGranted:Sound;
		public var SFX_CarLocked:Sound;
		public var SFX_CarDoorOpen:Sound;
		public var SFX_CarDoorClose:Sound;
		public var SFX_WetSteps:Sound;
		public var SFX_SlidingDoor:Sound;
		public var SFX_ElevatorClose:Sound;
		public var SFX_ElevatorOpen:Sound;
		public var SFX_SurpriseOne:Sound;
		public var SFX_LockedTwo:Sound;
		public var SFX_UnlockTwo:Sound;		
		public var SFX_PhonePickUp:Sound;
		public var SFX_PhonePutDown:Sound;
		public var SFX_MorseOne:Sound;
		public var SFX_MorseTwo:Sound;
		public var SFX_MorseThree:Sound;
		public var SFX_Copier:Sound;
		public var SFX_ChainRattle:Sound;
		public var SFX_InputAccept:Sound
		public var SFX_InputTiny:Sound
		public var SFX_Servos:Sound;
		public var SFX_RotaryClicks:Sound;
		public var SFX_Spray:Sound;
		public var SFX_Wipe:Sound;
		public var SFX_BathroomFan:Sound;
		public var SFX_MetalBoxTwo_Open:Sound;
		public var SFX_MetalBoxTwo_Bunk:Sound;
		public var SFX_SlimeMove:Sound;
		public var SFX_DrillQuick:Sound;
		public var SFX_DrillSlow:Sound;
		public var SFX_MetalBoxTwo_Close:Sound;
		public var SFX_CarIgnition:Sound;
		public var SFX_CarStart:Sound;
		public var SFX_CarAlarm:Sound;
		public var SFX_DuctBangOne:Sound;
		public var SFX_DuctBangTwo:Sound;
		public var SFX_DuctBangThree:Sound;
		public var SFX_DuctBangFour:Sound;
		public var SFX_FanJam:Sound;
		public var SFX_DrillSingleOne:Sound;
		public var SFX_ClickyBot:Sound;
		public var SFX_WalkyBot:Sound;
		public var SFX_SnoryBot:Sound;
		public var SFX_MetalDrop:Sound;
		
		public var SFX_DoorThreeClose:Sound
		public var SFX_DoorThreeOpen:Sound
		
		public var SFX_SwitchesOne:Sound
		public var SFX_SwitchesTwo:Sound
		public var SFX_SwitchesThree:Sound
		public var SFX_SwitchesFour:Sound
		public var SFX_SwitchesFive:Sound
		public var SFX_SwitchesSix:Sound
		public var SFX_SwitchesSeven:Sound
		public var SFX_PowerPulse:Sound;
		public var SFX_LightFlicker:Sound;
		public var SFX_RobotWail:Sound;
		public var SFX_RobotRattle:Sound;
		public var SFX_OvenDing:Sound;
		public var SFX_MicrowaveFan:Sound;
		
		public var SFX_HeavyMetalDoorClose:Sound;
		public var SFX_HeavyMetalDoorOpen:Sound;
		public var SFX_RocketEngine:Sound;
		public var SFX_PipeRingOne:Sound;
		public var SFX_Electofy:Sound;
		public var SFX_ScrewDropX4:Sound;
		
		public var SFX_ElevatorMove:Sound;
		
		public var SFX_AirLeak:Sound;
		public var SFX_SlimePlop:Sound;
		
		public var SFX_Adimm_00:Sound;
		public var SFX_Adimm_01:Sound;
		public var SFX_Adimm_02:Sound;
		public var SFX_Adimm_03:Sound;
		public var SFX_Adimm_04:Sound;
		public var SFX_Adimm_05:Sound;
		public var SFX_Adimm_06:Sound;
		
		public var SFX_AirDecompress:Sound;
		public var SFX_SlimerOne:Sound;
		public var SFX_TuneForkHumOne:Sound;
		
		public var SFX_ThumpTwo:Sound;
		public var SFX_ThumpThree:Sound;
		
		public var SFX_Note00:Sound;
		public var SFX_Note01:Sound;
		public var SFX_Note02:Sound;
		public var SFX_Note03:Sound;
		public var SFX_Note04:Sound;
		public var SFX_Note05:Sound;
		
		public var SFX_SlimerTwo:Sound;
		public var SFX_BigElevator:Sound;
		public var SFX_BigElevatorLong:Sound;
		
		public var SFX_SparksFour:Sound;
		public var SFX_WoodPry:Sound;
		public var SFX_HammerTap:Sound;
		
		public var SFX_AstroidBoom:Sound;
		
		public var SFX_Ping:Sound;
		public var SFX_MachineTwo:Sound;
		public var SFX_PopOne:Sound;
		public var SFX_SparkFive:Sound;
		public var SFX_DripsFast:Sound;
		public var SFX_Squirt:Sound;
		public var SFX_MachineThree:Sound;
		public var SFX_MachineFour:Sound;
		
		public var SFX_SpinLoop:Sound;
		public var SFX_TimeRip:Sound;
		
		/*
		
		MicrowaveFan
		ElevatorClose
		ElevatorOpen
		*/
		
		public var globalVol:Number = 0.5;
		public function SoundFX()
		{
			
			this.assets = new AssetManager();
			soundManager = new SoundManager();
		//	soundManager = SoundManager.getInstance();
			
		}
		private function onLoadAssets():void{
		
		}
		
		public function LoadGlobalGamePlaySoundFX():void{
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Inven/InvenOpen_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/antique-wall-phone.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Gong/gong_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Powm/powm_v011a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Powm/powmTwo_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Powm/powmThree_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/PageTurn_One_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Box/Box_Close_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Box/Box_Open_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Item/ItemPickUp_01.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Item/ItemPlace_v002a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Door/LockedDoor_One_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Door/LockedDoor_Two_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Door/ChestOpen_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Door/CreakyCabinet_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/CreakyDoor/CreakyDoorOne_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/CreakyDoor/CreakyDoorTwo_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Success/SuccessLow_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Steps/Step_One_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Steps/MetalSteps_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Fire/Match_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Fire/FireBall_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Thumps/ThumpOne_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Bung/Bung_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Click/ClickTiny_v001a006.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Click/Click_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/WindUp/windUp_One_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/ClockChime/ClockChimeLow_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Water/WaterFlow_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Fridge/FridgeClose_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Fridge/FridgeOpen_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Drawer/Drawer_One_Close_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Drawer/Drawer_One_Open_v001a002.mp3'));						
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Water/Splash_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Water/SplashOut_v001a001.mp3'));			
	//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Water/SplashOut_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Water/waterdrop_001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ladder/LadderOpen_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ladder/Ladder_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/MailBox/MailboxDoor_One_v001a001.mp3'));						
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Computer/ComputerBeeps_V001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Computer/BootUpOne_v002a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Computer/Error_v001a001.mp3'));					
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Drag/StoneDrag_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/Ohm_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/energyPulseOne_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Drag/StoneDragHeavy_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Computer/ComputerBeeps_V003a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Air/AirRelease_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Machine/PowerUpOne_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Machine/Machine_v001a002.mp3'));						
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Lock/LockPick_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Lock/Unlock_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Gears/Gears_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Gears/Gears_v002a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Gears/Coin_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Water/Bubbles_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Water/WaterBoil_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Water/WaterPour_v001a002.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Water/SplashTwo_v001a001.mp3'));						
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Box/Metal_Box_Close_v001a001.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Box/Metal_Box_Open_v001a001.mp3'));			
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Lightning/Lightning_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Lightning/Thunder_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Drawer/Drawer_One_Slide_Close_v001.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Drawer/Drawer_One_Slide_Open_v001.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Door/door_metal_rusty_open.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Door/door_metal_rusty_close.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Door/door_metal_rusty_open_two.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Door/door_metal_rusty_close_two.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/thak/thak_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/thak/thak_02.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/thak/thak_03.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Water/gurgles_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Shovel/shovel_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Shovel/shovel_02.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Grain/grainflow_02.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Wheel/wheel_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Saw/saw_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/FallingTree/falling_tree.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/TV/TVBlip.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/TV/TVBlop.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/CreakyDoor/creakyClose_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/CreakyDoor/creakyOpen_03.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/page_unroll_02.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Knot/knot_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/RopeClimb/RopeClimb_02.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/BigLight.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/electricLight.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Rattle/metal_rattle_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Sizzle/sizzle_02.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Sizzle/sizzle_04.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Metal/MetalDropHeavy.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Metal/MetalDropLight.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/BlowTorch/blowtorch_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Metal/barrelKick_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Metal/barrelKick_02.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Clink/clink_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Growl/GrowlDeep.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Growl/GrowlOne.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Growl/GrowlTwo.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Growl/Chewing.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Cosmic/cosmic_rays_02.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/ohmTwo_02.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Hammer/RemoveNail.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Hammer/RemoveNail3x.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Cosmic/cosmicWaffle.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Cosmic/cosmic_door.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Cosmic/CosmicWindUp.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Cosmic/CosmicProcess.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Computer/ErrorTwo.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Click/ClickSciFi.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Click/ClickSciFiTwo.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Click/ClickSciFiThree.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Cosmic/Transporter_02.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Spark/Spark.mp3'));

			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Crystal/CrystalPing.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Crystal/CrystalPingTwo.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Crystal/CrystalWave.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Crystal/CrystalWaveTwo.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/HeartBeat/HeartBeat.mp3'));

			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Spark/SparksThree.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/ElectricDoor/DoorBeepsAccessDenied.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/ElectricDoor/DoorBeepsAccessGranted.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Car/CarLocked.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Car/CarDoorOpen.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Car/CarDoorClose.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Steps/WetSteps.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Sliding/SlidingDoor.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Elevator/ElevatorClose.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Elevator/ElevatorOpen.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Surprise/SurpriseOne.mp3'));			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Lock/LockedTwo.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Lock/UnlockTwo.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Phone/PhonePickUp.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Phone/PhonePutDown.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Morse/MorseOne.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Morse/MorseTwo.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Morse/MorseThree.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Computer/Copier.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Clink/ChainRattle.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Computer/InputAccept.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Computer/InputTiny.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Robot/Servos.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Robot/RotaryClicks.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Spray/Spray.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Wipe/Wipe.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Fan/BathroomFan.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Box/MetalBoxTwo_Open.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Box/MetalBoxTwo_Bunk.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Box/MetalBoxTwo_Close.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Slime/SlimeMove.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Drill/DrillQuick.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Drill/DrillSlow.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Car/CarIgnition.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Car/CarStart.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Car/CarAlarm.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Metal/DuctBangOne.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Metal/DuctBangTwo.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Metal/DuctBangThree.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Metal/DuctBangFour.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Fan/FanJam.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Drill/DrillSingleOne.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Robot/ClickyBot.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Robot/WalkyBot.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Robot/SnoryBot.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Metal/MetalDrop.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Door/DoorThreeClose.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Door/DoorThreeOpen.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Switches/SwitchesOne.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Switches/SwitchesTwo.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Switches/SwitchesThree.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Switches/SwitchesFour.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Switches/SwitchesFive.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Switches/SwitchesSix.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Switches/SwitchesSeven.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Machine/PowerPulse.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Machine/LightFlicker.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Machine/LightFlicker.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Robot/RobotWail.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Robot/RobotRattle.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ding/OvenDing.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Machine/MicrowaveFan.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Door/HeavyMetalDoorClose.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Door/HeavyMetalDoorOpen.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Fire/RocketEngine.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Clink/PipeRingOne.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Spark/Electofy.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Metal/ScrewDropX4.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Elevator/ElevatorMove.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Air/AirLeak.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Slime/SlimePlop.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Adimm/Adimm_00.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Adimm/Adimm_01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Adimm/Adimm_02.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Adimm/Adimm_03.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Adimm/Adimm_04.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Adimm/Adimm_05.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Adimm/Adimm_06.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Air/AirDecompress.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Slime/SlimerOne.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/TuneForkHumOne.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Thumps/ThumpTwo.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Thumps/ThumpThree.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/Note00.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/Note01.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/Note02.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/Note03.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/Note04.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/Note05.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Slime/SlimerTwo.mp3'));

			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Elevator/BigElevator.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Elevator/BigElevatorLong.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Spark/SparksFour.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Hammer/WoodPry.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Hammer/HammerTap.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Booms/AstroidBoom.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Crystal/Ping.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Machine/MachineTwo.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Booms/PopOne.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Spark/SparkFive.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Water/DripsFast.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Slime/Squirt.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Machine/MachineThree.mp3'));
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Machine/MachineFour.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Spin/SpinLoop.mp3'));
			
			this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/SoundFX/Ohm/TimeRip.mp3'));
			/*
			SFX_TimeRip
			SFX_SpinLoop
			SFX_Squirt
			SFX_DripsFast
			SFX_SparkFive
			SFX_PopOne
			SFX_MachineTwo
			SFX_Ping
			SFX_AstroidBoom
			HammerTap
			SFX_WoodPry
			SFX_SparksFour
			SFX_BigElevatorLong
			SFX_BigeElevator
			SFX_SlimerTwo
			SFX_TuneForkHumOne
			SFX_SlimerOne
			SFX_AirDecompress
			SFX_Adimm_00
			SFX_SlimePlop
			SFX_AirLeak
			SFX_ElevatorMove
			SFX_ScrewDropX4
			SFX_Electofy
			SFX_Electofy
			SFX_PipeRingOne
			public var SFX_HeavyMetalDoorClose:Sound;
			public var SFX_HeavyMetalDoorOpen:Sound;
			SFX_MicrowaveFan
			SFX_OvenDing
			SFX_RobotRattle
			SFX_RobotWail
			LightFlicker
			SFX_PowerPulse
			public var SFX_SwitchesOne:Sound
			public var SFX_SwitchesTwo:Sound
			public var SFX_SwitchesThree:Sound
			public var SFX_SwitchesFour:Sound
			public var SFX_SwitchesFive:Sound
			public var SFX_SwitchesSix:Sound
			public var SFX_SwitchesSeven:Sound
			
			public var SFX_DoorThreeClose:Sound
			public var SFX_DoorThreeOpen:Sound
			
			SFX_MetalDrop
			SFX_SnoryBot
			SFX_WalkyBot
			SFX_DrillSingleOne
			SFX_FanJam
			public var SFX_DuctBangThree:Sound;
			public var SFX_DuctBangFour:Sound;
			
			public var SFX_DuctBangOne:Sound;
			public var SFX_DuctBangTwo:Sound;
			
			public var SFX_CarIgnition:Sound;
			public var SFX_CarStart:Sound;
			public var SFX_DrillQuick:Sound;
			public var SFX_DrillSlow:Sound;
			public var SFX_MorseTwo:Sound;
			public var SFX_MorseThree:Sound;
			*/
			//SFX_SparksThree
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					
					onLoadGlobalGamePlaySoundFX();
				}				
			});	
		}
		private function onLoadGlobalGamePlaySoundFX():void{
			//SFX_Squirt		
			SFX_Squirt = assets.getSound("Squirt");
			soundManager.addSound("Squirt", SFX_Squirt);
			
			SFX_WoodPry = assets.getSound("WoodPry");
			soundManager.addSound("WoodPry", SFX_WoodPry);

			SFX_InvenOpen = assets.getSound("InvenOpen_v001a001");
			soundManager.addSound("InvenOpen", SFX_InvenOpen);
			
			SFX_Gong = assets.getSound("gong_v001a001");
			soundManager.addSound("Gong", SFX_Gong);
			
			SFX_Phone = assets.getSound("antique-wall-phone");
			soundManager.addSound("Phone", SFX_Phone);
			
			SFX_Machine = assets.getSound("Machine_v001a002");
			soundManager.addSound("Machine", SFX_Machine);
					
			SFX_WaterPour = assets.getSound("WaterPour_v001a002");
			soundManager.addSound("WaterPour", SFX_WaterPour);
			
			SFX_WaterBoil = assets.getSound("WaterBoil_v001a002");
			soundManager.addSound("WaterBoil", SFX_WaterBoil);
			
			SFX_PowmThree = assets.getSound("powmThree_v001a001");
			soundManager.addSound("PowmThree", SFX_PowmThree);
			
			SFX_PowmTwo = assets.getSound("powmTwo_v001a001");
			soundManager.addSound("PowmTwo", SFX_PowmTwo);
			
			SFX_WaterDroplet = assets.getSound("waterdrop_001a001");
			soundManager.addSound("WaterDroplet", SFX_WaterDroplet);
	
			SFX_Error = assets.getSound("Error_v001a001");
			soundManager.addSound("Error", SFX_Error);			
			
			SFX_Bubbles = assets.getSound("Bubbles_v001a002");
			soundManager.addSound("Bubbles", SFX_Bubbles);
			
			SFX_BootUp = assets.getSound("BootUpOne_v002a002");
			soundManager.addSound("BootUp", SFX_BootUp);
						
			SFX_CreakyDoorThree = assets.getSound("CreakyCabinet_v001a002");
			soundManager.addSound("CreakyDoorThree", SFX_CreakyDoorThree);
			
			SFX_GearsThree = assets.getSound("Coin_v001a001");
			soundManager.addSound("GearsThree", SFX_GearsThree);
			
			SFX_GearsOne = assets.getSound("Gears_v001a002");
			soundManager.addSound("GearsOne", SFX_GearsOne);
			
			SFX_GearsTwo = assets.getSound("Gears_v002a001");
			soundManager.addSound("GearsTwo", SFX_GearsTwo);
			
			SFX_ChestOpen = assets.getSound("ChestOpen_v001a001");
			soundManager.addSound("ChestOpen", SFX_ChestOpen);
			
			SFX_Unlock = assets.getSound("Unlock_v001a001");
			soundManager.addSound("Unlock", SFX_Unlock);
			
			SFX_LockPick = assets.getSound("LockPick_v001a001");
			soundManager.addSound("LockPick", SFX_LockPick);
			
			SFX_LockedDoorTwo = assets.getSound("LockedDoor_Two_v001a001");
			soundManager.addSound("LockedDoorTwo", SFX_LockedDoorTwo);
			
			SFX_EnergyPulse  = assets.getSound("energyPulseOne_v001a002");
			soundManager.addSound("EnergyPulse", SFX_EnergyPulse);
						
			SFX_PowerUp  = assets.getSound("PowerUpOne_v001a001");
			soundManager.addSound("PowerUp", SFX_PowerUp);
			
			SFX_MetalBoxClose  = assets.getSound("Metal_Box_Close_v001a001");
			soundManager.addSound("MetalBoxClose", SFX_MetalBoxClose);
			
			SFX_MetalBoxOpen  = assets.getSound("Metal_Box_Open_v001a001");
			soundManager.addSound("MetalBoxOpen", SFX_MetalBoxOpen);			
			
			SFX_AirRelease = assets.getSound("AirRelease_v001a001");
			soundManager.addSound("AirRelease", SFX_AirRelease);
			
			SFX_MetalSteps = assets.getSound("MetalSteps_v001a002");
			soundManager.addSound("MetalSteps", SFX_MetalSteps);
			
			SFX_HeavyStoneDrag = assets.getSound("StoneDragHeavy_v001a001");
			soundManager.addSound("HeavyStoneDrag", SFX_HeavyStoneDrag);
			
			SFX_Ohm = assets.getSound("Ohm_v001a002");
			soundManager.addSound("Ohm", SFX_Ohm);
			
			SFX_StoneDrag = assets.getSound("StoneDrag_v001a001");
			soundManager.addSound("StoneDrag", SFX_StoneDrag);

			SFX_ComputerBeepsTwo = assets.getSound("ComputerBeeps_V003a002");
			soundManager.addSound("ComputerBeepsTwo", SFX_ComputerBeepsTwo);
			
			SFX_ComputerBeeps = assets.getSound("ComputerBeeps_V001a002");
			soundManager.addSound("ComputerBeeps", SFX_ComputerBeeps);
			
			SFX_MailBox = assets.getSound("MailboxDoor_One_v001a001");
			soundManager.addSound("MailBox", SFX_MailBox);
			
			SFX_LadderOpen = assets.getSound("LadderOpen_v001a001");
			soundManager.addSound("LadderOpen", SFX_LadderOpen);
			
			SFX_Ladder = assets.getSound("Ladder_v001a001");
			soundManager.addSound("Ladder", SFX_Ladder);
			
			SFX_SplashTwo = assets.getSound("SplashTwo_v001a001");
			soundManager.addSound("SplashTwo", SFX_SplashTwo);
			
			SFX_Splash = assets.getSound("Splash_v001a001");
			soundManager.addSound("Splash", SFX_Splash);
			
			SFX_SplashOut = assets.getSound("SplashOut_v001a001");
			soundManager.addSound("SplashOut", SFX_SplashOut);
			
			SFX_DrawerOpen = assets.getSound("Drawer_One_Open_v001a002");
			soundManager.addSound("DrawerOpen", SFX_DrawerOpen);
			
			SFX_DrawerClose = assets.getSound("Drawer_One_Close_v001a002");
			soundManager.addSound("DrawerClose", SFX_DrawerClose);
			
			
			SFX_FridgeOpen = assets.getSound("FridgeOpen_v001a002");
			soundManager.addSound("FridgeOpen", SFX_FridgeOpen);
			
			SFX_FridgeClose = assets.getSound("FridgeClose_v001a001");
			soundManager.addSound("FridgeClose", SFX_FridgeClose);
						
			SFX_WaterFlow = assets.getSound("WaterFlow_v001a002");
			soundManager.addSound("WaterFlow", SFX_WaterFlow);
			
			SFX_ClockChime = assets.getSound("ClockChimeLow_v001a001");
			soundManager.addSound("ClockChime", SFX_ClockChime);
			
			SFX_WindUp = assets.getSound("windUp_One_v001a001");
			soundManager.addSound("WindUp", SFX_WindUp);

			SFX_Click = assets.getSound("Click_v001a001");
			soundManager.addSound("Click", SFX_Click);
			
			SFX_ClickTiny = assets.getSound("ClickTiny_v001a006");
			soundManager.addSound("ClickTiny", SFX_ClickTiny);
			
			SFX_Bung = assets.getSound("Bung_v001a001");
			soundManager.addSound("Bung", SFX_Bung);
			
			SFX_Thump = assets.getSound("ThumpOne_v001a001");
			soundManager.addSound("Thump", SFX_Thump);
			
			SFX_ItemPlace = assets.getSound("ItemPlace_v002a001");
			soundManager.addSound("ItemPlace", SFX_ItemPlace);
			
			SFX_FireBall = assets.getSound("FireBall_v001a001");
			soundManager.addSound("FireBall", SFX_FireBall);
			
			SFX_Match = assets.getSound("Match_v001a001");
			soundManager.addSound("Match", SFX_Match);
			
			SFX_Powm = assets.getSound("powm_v011a002");
			soundManager.addSound("Powm", SFX_Powm);
			
			SFX_PageTurn = assets.getSound("PageTurn_One_v001a002");
			soundManager.addSound("PageTurn", SFX_PageTurn);
			
			SFX_BoxOpen = assets.getSound("Box_Open_v001a001");
			soundManager.addSound("BoxOpen", SFX_BoxOpen);
			
			SFX_BoxClose = assets.getSound("Box_Close_v001a001");
			soundManager.addSound("BoxClose", SFX_BoxClose);
			
			SFX_ItemPickUp = assets.getSound("ItemPickUp_01");
			soundManager.addSound("ItemPickUp", SFX_ItemPickUp);
			
			SFX_LockedDoor = assets.getSound("LockedDoor_One_v001a002");
			soundManager.addSound("LockedDoor", SFX_LockedDoor);
			
			SFX_CreakyDoor = assets.getSound("CreakyDoorOne_v001a001");
			soundManager.addSound("CreakyDoor", SFX_CreakyDoor);
			
			SFX_SuccessLow = assets.getSound("SuccessLow_v001a001");
			soundManager.addSound("SuccessLow", SFX_SuccessLow);
			
			SFX_CreakyDoorTwo = assets.getSound("CreakyDoorTwo_v001a001");
			soundManager.addSound("CreakyDoorTwo", SFX_CreakyDoorTwo);
			
			SFX_Steps = assets.getSound("Step_One_v001a002");
			soundManager.addSound("Steps", SFX_Steps);
			
			
			
			SFX_Lightning_01 = assets.getSound("Lightning_01");
			soundManager.addSound("Lightning_01", SFX_Lightning_01);
			
			SFX_Thunder_01 = assets.getSound("Thunder_01");
			soundManager.addSound("Thunder_01", SFX_Thunder_01);
			
			SFX_DrawSlideOpen = assets.getSound("Drawer_One_Slide_Open_v001");
			soundManager.addSound("DrawSlideOpen", SFX_DrawSlideOpen);
			
			SFX_DrawSlideClosed = assets.getSound("Drawer_One_Slide_Close_v001");
			soundManager.addSound("DrawSlideClosed", SFX_DrawSlideClosed);
			
			SFX_DoorMetalRustyOpen = assets.getSound("door_metal_rusty_open");
			soundManager.addSound("DoorMetalRustyOpen", SFX_DoorMetalRustyOpen);
			
			SFX_DoorMetalRustyClose = assets.getSound("door_metal_rusty_close");
			soundManager.addSound("DoorMetalRustyClose", SFX_DoorMetalRustyClose);
			
			SFX_DoorMetalRustyOpenTwo = assets.getSound("door_metal_rusty_open_two");
			soundManager.addSound("DoorMetalRustyOpenTwo", SFX_DoorMetalRustyOpenTwo);
			
			SFX_DoorMetalRustyCloseTwo = assets.getSound("door_metal_rusty_close_two");
			soundManager.addSound("DoorMetalRustyCloseTwo", SFX_DoorMetalRustyCloseTwo);
			
			SFX_ThakOne = assets.getSound("thak_01");
			soundManager.addSound("ThakOne", SFX_ThakOne);
			
			SFX_ThakTwo = assets.getSound("thak_02");
			soundManager.addSound("ThakTwo", SFX_ThakTwo);
			
			SFX_ThakThree = assets.getSound("thak_03");
			soundManager.addSound("ThakThree", SFX_ThakThree);
			
			
			SFX_Gurgles = assets.getSound("gurgles_01");
			soundManager.addSound("Gurgles", SFX_Gurgles);
			
			SFX_ShovelOne = assets.getSound("shovel_01");
			soundManager.addSound("ShovelOne", SFX_ShovelOne);
			
			SFX_ShovelTwo = assets.getSound("shovel_02");
			soundManager.addSound("ShovelTwo", SFX_ShovelTwo);
			
			SFX_GrainOne = assets.getSound("grainflow_02");
			soundManager.addSound("GrainOne", SFX_GrainOne);
			
			SFX_WheelOne = assets.getSound("wheel_01");
			soundManager.addSound("WheelOne", SFX_WheelOne);
			
			SFX_Saw = assets.getSound("saw_01");
			soundManager.addSound("Saw", SFX_Saw);
			
			SFX_FallingTree = assets.getSound("falling_tree");
			soundManager.addSound("FallingTree", SFX_FallingTree);
			
			SFX_TVBlip = assets.getSound("TVBlip");
			soundManager.addSound("TVBlip", SFX_TVBlip);
			
			
			SFX_TVBlop = assets.getSound("TVBlop");
			soundManager.addSound("TVBlop", SFX_TVBlop);
		
			
			SFX_CreakyClose = assets.getSound("creakyClose_01");
			soundManager.addSound("CreakyClose", SFX_CreakyClose);
			
			SFX_CreakyOpen = assets.getSound("creakyOpen_03");
			soundManager.addSound("CreakyOpen", SFX_CreakyOpen);
		
			SFX_PageUnroll = assets.getSound("page_unroll_02");
			soundManager.addSound("PageUnroll", SFX_PageUnroll);
			
			
			SFX_Knot = assets.getSound("knot_01");
			soundManager.addSound("Knot", SFX_Knot);
			
			SFX_RopeClimb = assets.getSound("RopeClimb_02");
			soundManager.addSound("RopeClimb", SFX_RopeClimb);
			
			SFX_BigLight = assets.getSound("BigLight");
			soundManager.addSound("BigLight", SFX_BigLight);
				
			
			SFX_electricLight = assets.getSound("electricLight");
			soundManager.addSound("electricLight", SFX_electricLight);
			
			SFX_RattleOne = assets.getSound("metal_rattle_01");
			soundManager.addSound("RattleOne", SFX_RattleOne);
			
			SFX_Sizzle = assets.getSound("sizzle_02");
			soundManager.addSound("Sizzle", SFX_Sizzle);
			
			SFX_SizzleTwo = assets.getSound("sizzle_04");
			soundManager.addSound("SizzleTwo", SFX_SizzleTwo);
			
			
			SFX_BlowTorch = assets.getSound("blowtorch_01");
			soundManager.addSound("BlowTorch", SFX_BlowTorch);
			
			SFX_MetalDropHeavy = assets.getSound("MetalDropHeavy");
			soundManager.addSound("MetalDropHeavy", SFX_MetalDropHeavy);
			
			SFX_MetalDropLight = assets.getSound("MetalDropLight");
			soundManager.addSound("MetalDropLight", SFX_MetalDropLight);
			

			SFX_BarrelKickDeep = assets.getSound("barrelKick_01");
			soundManager.addSound("BarrelKickDeep", SFX_BarrelKickDeep);
			
			SFX_BarrelKickLight = assets.getSound("barrelKick_02");
			soundManager.addSound("BarrelKickLight", SFX_BarrelKickLight);
			
			SFX_ClinkOne = assets.getSound("clink_01");
			soundManager.addSound("ClinkOne", SFX_ClinkOne);
			
			SFX_GrowlDeep = assets.getSound("GrowlDeep");
			soundManager.addSound("GrowlDeep", SFX_GrowlDeep);
			
			SFX_GrowlOne = assets.getSound("GrowlOne");
			soundManager.addSound("GrowlOne", SFX_GrowlOne);
			
			SFX_GrowlTwo = assets.getSound("GrowlTwo");
			soundManager.addSound("GrowlTwo", SFX_GrowlOne);
			
			SFX_Chewing = assets.getSound("Chewing");
			soundManager.addSound("Chewing", SFX_Chewing);
			
			SFX_ComsicRays = assets.getSound("cosmic_rays_02");
			soundManager.addSound("CosmicRays", SFX_ComsicRays);
			
			SFX_OhmTwo = assets.getSound("ohmTwo_02");
			soundManager.addSound("OhmTwo", SFX_OhmTwo);
			
			SFX_RemoveNail = assets.getSound("RemoveNail");
			soundManager.addSound("RemoveNail", SFX_RemoveNail);
			
			SFX_RemoveNail3x = assets.getSound("RemoveNail3x");
			soundManager.addSound("RemoveNail3x", SFX_RemoveNail3x);
			
			SFX_CosmicWaffle = assets.getSound("cosmicWaffle");
			soundManager.addSound("CosmicWaffle", SFX_CosmicWaffle);
			
			SFX_CosmicDoor = assets.getSound("cosmic_door");
			soundManager.addSound("CosmicDoor", SFX_CosmicDoor);
			
			SFX_CosmicWindUp = assets.getSound("CosmicWindUp");
			soundManager.addSound("CosmicWindUp", SFX_CosmicWindUp);
			
			SFX_CosmicProcess = assets.getSound("CosmicProcess");
			soundManager.addSound("CosmicProcess", SFX_CosmicProcess);
			
			SFX_ClickSciFi = assets.getSound("ClickSciFi");
			soundManager.addSound("ClickSciFi", SFX_ClickSciFi);
			
			SFX_ClickSciFiTwo = assets.getSound("ClickSciFiTwo");
			soundManager.addSound("ClickSciFiTwo", SFX_ClickSciFiTwo);
			
			SFX_ClickSciFiThree = assets.getSound("ClickSciFiThree");
			soundManager.addSound("ClickSciFiThree", SFX_ClickSciFiThree);
			
			//ClickSciFiThree
			SFX_ErrorTwo = assets.getSound("ErrorTwo");
			soundManager.addSound("ErrorTwo", SFX_ErrorTwo);
			
			SFX_SciFiTransPorter  = assets.getSound("Transporter_02");
			soundManager.addSound("Transporter", SFX_SciFiTransPorter);
			//Spark
			SFX_Spark  = assets.getSound("Spark");
			soundManager.addSound("Spark", SFX_Spark);
			
			SFX_CrystalPing  = assets.getSound("CrystalPing");
			soundManager.addSound("CrystalPing", SFX_CrystalPing);
			
			SFX_CrystalPingTwo  = assets.getSound("CrystalPingTwo");
			soundManager.addSound("CrystalPingTwo", SFX_CrystalPingTwo);
			
			
			SFX_CrystalWave  = assets.getSound("CrystalWave");
			soundManager.addSound("CrystalWave", SFX_CrystalWave);
			
			SFX_CrystalWaveTwo  = assets.getSound("CrystalWaveTwo");
			soundManager.addSound("CrystalWaveTwo", SFX_CrystalWaveTwo);
			
			SFX_HeartBeat  = assets.getSound("HeartBeat");
			soundManager.addSound("HeartBeat", SFX_HeartBeat);
			
			
			
			SFX_SparksThree  = assets.getSound("SparksThree");
			soundManager.addSound("SparksThree", SFX_SparksThree);
			
			SFX_DoorBeepsAccessDenied  = assets.getSound("DoorBeepsAccessDenied");
			soundManager.addSound("DoorBeepsAccessDenied", SFX_DoorBeepsAccessDenied);
		
			SFX_DoorBeepsAccessGranted  = assets.getSound("DoorBeepsAccessGranted");
			soundManager.addSound("DoorBeepsAccessGranted", SFX_DoorBeepsAccessGranted);
			
			SFX_CarLocked  = assets.getSound("CarLocked");
			soundManager.addSound("CarLocked", SFX_CarLocked);
			
			SFX_CarDoorOpen  = assets.getSound("CarDoorOpen");
			soundManager.addSound("CarDoorOpen", SFX_CarDoorOpen);
			
			SFX_CarDoorClose  = assets.getSound("CarDoorClose");
			soundManager.addSound("CarDoorClose", SFX_CarDoorClose);
			
			SFX_WetSteps  = assets.getSound("WetSteps");
			soundManager.addSound("WetSteps", SFX_WetSteps);
			
			SFX_SlidingDoor  = assets.getSound("SlidingDoor");
			soundManager.addSound("SlidingDoor", SFX_SlidingDoor);
			
			SFX_ElevatorClose  = assets.getSound("ElevatorClose");
			soundManager.addSound("ElevatorClose", SFX_ElevatorClose);
			
			SFX_ElevatorOpen  = assets.getSound("ElevatorOpen");
			soundManager.addSound("ElevatorOpen", SFX_ElevatorOpen);
			
			SFX_SurpriseOne  = assets.getSound("SurpriseOne");
			soundManager.addSound("SurpriseOne", SFX_SurpriseOne);
			
			SFX_LockedTwo  = assets.getSound("LockedTwo");
			soundManager.addSound("LockedTwo", SFX_LockedTwo);
			
			SFX_UnlockTwo  = assets.getSound("UnlockTwo");
			soundManager.addSound("UnlockTwo", SFX_UnlockTwo);
			
			SFX_PhonePickUp  = assets.getSound("PhonePickUp");
			soundManager.addSound("PhonePickUp", SFX_PhonePickUp);
			
			SFX_PhonePutDown  = assets.getSound("PhonePutDown");
			soundManager.addSound("PhonePutDown", SFX_PhonePutDown);
			
			SFX_MorseOne  = assets.getSound("MorseOne");
			soundManager.addSound("MorseOne", SFX_MorseOne);
			
			SFX_MorseTwo  = assets.getSound("MorseTwo");
			soundManager.addSound("MorseTwo", SFX_MorseTwo);
			
			SFX_MorseThree  = assets.getSound("MorseThree");
			soundManager.addSound("MorseThree", SFX_MorseThree);
			
			SFX_Copier  = assets.getSound("Copier");
			soundManager.addSound("Copier", SFX_Copier);
			
			SFX_ChainRattle  = assets.getSound("ChainRattle");
			soundManager.addSound("ChainRattle", SFX_ChainRattle);
			
			SFX_InputAccept  = assets.getSound("InputAccept");
			soundManager.addSound("InputAccept", SFX_InputAccept);
			
			SFX_InputTiny  = assets.getSound("InputTiny");
			soundManager.addSound("InputTiny", SFX_InputTiny);
			
			SFX_Servos  = assets.getSound("Servos");
			soundManager.addSound("Servos", SFX_Servos);
			
			SFX_RotaryClicks  = assets.getSound("RotaryClicks");
			soundManager.addSound("RotaryClicks", SFX_RotaryClicks);
			
			SFX_Spray  = assets.getSound("Spray");
			soundManager.addSound("Spray", SFX_Spray);
			
			SFX_Wipe  = assets.getSound("Wipe");
			soundManager.addSound("Wipe", SFX_Wipe);
			
			SFX_BathroomFan  = assets.getSound("BathroomFan");
			soundManager.addSound("BathroomFan", SFX_BathroomFan);
			
			SFX_MetalBoxTwo_Open  = assets.getSound("MetalBoxTwo_Open");
			soundManager.addSound("MetalBoxTwo_Open", SFX_MetalBoxTwo_Open);
			
			SFX_MetalBoxTwo_Bunk  = assets.getSound("MetalBoxTwo_Bunk");
			soundManager.addSound("MetalBoxTwo_Bunk", SFX_MetalBoxTwo_Bunk);
			//MetalBoxTwo_Close
			SFX_MetalBoxTwo_Close  = assets.getSound("MetalBoxTwo_Close");
			soundManager.addSound("MetalBoxTwo_Close", SFX_MetalBoxTwo_Close);
			
			SFX_SlimeMove  = assets.getSound("SlimeMove");
			soundManager.addSound("SlimeMove", SFX_SlimeMove);
			
			SFX_DrillQuick  = assets.getSound("DrillQuick");
			soundManager.addSound("DrillQuick", SFX_DrillQuick);
			
			SFX_DrillSlow  = assets.getSound("DrillSlow");
			soundManager.addSound("DrillSlow", SFX_DrillSlow);
			
			SFX_CarIgnition  = assets.getSound("CarIgnition");
			soundManager.addSound("CarIgnition", SFX_CarIgnition);
			
			SFX_CarStart  = assets.getSound("CarStart");
			soundManager.addSound("CarStart", SFX_CarStart);
			
			SFX_CarAlarm  = assets.getSound("CarAlarm");
			soundManager.addSound("CarAlarm", SFX_CarAlarm);
					
			SFX_DuctBangOne  = assets.getSound("DuctBangOne");
			soundManager.addSound("DuctBangOne", SFX_DuctBangOne);
			
			SFX_DuctBangTwo  = assets.getSound("DuctBangTwo");
			soundManager.addSound("DuctBangTwo", SFX_DuctBangTwo);
			
			SFX_DuctBangThree  = assets.getSound("DuctBangThree");
			soundManager.addSound("DuctBangThree", SFX_DuctBangThree);
			
			SFX_DuctBangFour  = assets.getSound("DuctBangFour");
			soundManager.addSound("DuctBangFour", SFX_DuctBangFour);
			
			SFX_FanJam  = assets.getSound("FanJam");
			soundManager.addSound("FanJam", SFX_FanJam);
			
			SFX_DrillSingleOne  = assets.getSound("DrillSingleOne");
			soundManager.addSound("DrillSingleOne", SFX_DrillSingleOne);
			
			SFX_ClickyBot  = assets.getSound("ClickyBot");
			soundManager.addSound("ClickyBot", SFX_ClickyBot);
			
			SFX_WalkyBot  = assets.getSound("WalkyBot");
			soundManager.addSound("WalkyBot", SFX_WalkyBot);
			
			SFX_SnoryBot  = assets.getSound("SnoryBot");
			soundManager.addSound("SnoryBot", SFX_SnoryBot);
			
			SFX_MetalDrop  = assets.getSound("MetalDrop");
			soundManager.addSound("MetalDrop", SFX_MetalDrop);
			
			SFX_DoorThreeClose  = assets.getSound("DoorThreeClose");
			soundManager.addSound("DoorThreeClose", SFX_DoorThreeClose);
			
			SFX_DoorThreeOpen  = assets.getSound("DoorThreeOpen");
			soundManager.addSound("DoorThreeOpen", SFX_DoorThreeOpen);
			
			SFX_SwitchesOne  = assets.getSound("SwitchesOne");
			soundManager.addSound("SwitchesOne", SFX_SwitchesOne);
			
			SFX_SwitchesTwo  = assets.getSound("SwitchesTwo");
			soundManager.addSound("SwitchesTwo", SFX_SwitchesTwo);
			
			SFX_SwitchesThree  = assets.getSound("SwitchesThree");
			soundManager.addSound("SwitchesThree", SFX_SwitchesThree);
			
			SFX_SwitchesFour  = assets.getSound("SwitchesFour");
			soundManager.addSound("SwitchesFour", SFX_SwitchesFour);
			
			SFX_SwitchesFive  = assets.getSound("SwitchesFive");
			soundManager.addSound("SwitchesFive", SFX_SwitchesFive);
			
			SFX_SwitchesSix  = assets.getSound("SwitchesSix");
			soundManager.addSound("SwitchesSix", SFX_SwitchesSix);
			
			SFX_SwitchesSeven  = assets.getSound("SwitchesSeven");
			soundManager.addSound("SwitchesSeven", SFX_SwitchesSeven);
			
			SFX_PowerPulse  = assets.getSound("PowerPulse");
			soundManager.addSound("PowerPulse", SFX_PowerPulse);
			
			SFX_LightFlicker  = assets.getSound("LightFlicker");
			soundManager.addSound("LightFlicker", SFX_LightFlicker);
			
			SFX_RobotWail  = assets.getSound("RobotWail");
			soundManager.addSound("RobotWail", SFX_RobotWail);
			
			SFX_RobotRattle  = assets.getSound("RobotRattle");
			soundManager.addSound("RobotRattle", SFX_RobotRattle);
			
			SFX_OvenDing  = assets.getSound("OvenDing");
			soundManager.addSound("OvenDing", SFX_OvenDing);
			
			SFX_MicrowaveFan  = assets.getSound("MicrowaveFan");
			soundManager.addSound("MicrowaveFan", SFX_MicrowaveFan);
			
			SFX_HeavyMetalDoorClose  = assets.getSound("HeavyMetalDoorClose");
			soundManager.addSound("HeavyMetalDoorClose", SFX_HeavyMetalDoorClose);
			
			SFX_HeavyMetalDoorOpen  = assets.getSound("HeavyMetalDoorOpen");
			soundManager.addSound("HeavyMetalDoorOpen", SFX_HeavyMetalDoorOpen);
			
			SFX_RocketEngine  = assets.getSound("RocketEngine");
			soundManager.addSound("RocketEngine", SFX_RocketEngine);
			
			SFX_PipeRingOne  = assets.getSound("PipeRingOne");
			soundManager.addSound("PipeRingOne", SFX_PipeRingOne);
			
			SFX_Electofy  = assets.getSound("Electofy");
			soundManager.addSound("Electofy", SFX_Electofy);
			
			SFX_ScrewDropX4  = assets.getSound("ScrewDropX4");
			soundManager.addSound("ScrewDropX4", SFX_ScrewDropX4);
			
			SFX_ElevatorMove  = assets.getSound("ElevatorMove");
			soundManager.addSound("ElevatorMove", SFX_ElevatorMove);
			
			SFX_AirLeak  = assets.getSound("AirLeak");
			soundManager.addSound("AirLeak", SFX_AirLeak);
			
			SFX_SlimePlop  = assets.getSound("SlimePlop");
			soundManager.addSound("SlimePlop", SFX_SlimePlop);
			
			SFX_Adimm_00  = assets.getSound("Adimm_00");
			soundManager.addSound("Adimm_00", SFX_Adimm_00);
			
			SFX_Adimm_01  = assets.getSound("Adimm_01");
			soundManager.addSound("Adimm_01", SFX_Adimm_01);
			
			SFX_Adimm_02  = assets.getSound("Adimm_02");
			soundManager.addSound("Adimm_02", SFX_Adimm_02);
			 
			SFX_Adimm_03  = assets.getSound("Adimm_03");
			soundManager.addSound("Adimm_03", SFX_Adimm_03);
			
			SFX_Adimm_04  = assets.getSound("Adimm_04");
			soundManager.addSound("Adimm_04", SFX_Adimm_04);
			
			SFX_Adimm_05  = assets.getSound("Adimm_05");
			soundManager.addSound("Adimm_05", SFX_Adimm_05);
			
			SFX_Adimm_06  = assets.getSound("Adimm_06");
			soundManager.addSound("Adimm_06", SFX_Adimm_06);
			
			SFX_AirDecompress  = assets.getSound("AirDecompress");
			soundManager.addSound("AirDecompress", SFX_AirDecompress);
			
			SFX_SlimerOne  = assets.getSound("SlimerOne");
			soundManager.addSound("SlimerOne", SFX_SlimerOne);
			
			SFX_TuneForkHumOne  = assets.getSound("TuneForkHumOne");
			soundManager.addSound("TuneForkHumOne", SFX_TuneForkHumOne);
			
			SFX_ThumpTwo  = assets.getSound("ThumpTwo");
			soundManager.addSound("ThumpTwo", SFX_ThumpTwo);
			
			SFX_ThumpThree  = assets.getSound("ThumpThree");
			soundManager.addSound("ThumpThree", SFX_ThumpThree);
			
			SFX_Note00  = assets.getSound("Note00");
			soundManager.addSound("Note00", SFX_Note00);
			
			SFX_Note01  = assets.getSound("Note01");
			soundManager.addSound("Note01", SFX_Note01);
			
			SFX_Note02  = assets.getSound("Note02");
			soundManager.addSound("Note02", SFX_Note02);
			
			SFX_Note03  = assets.getSound("Note03");
			soundManager.addSound("Note03", SFX_Note03);
			
			SFX_Note04  = assets.getSound("Note04");
			soundManager.addSound("Note04", SFX_Note04);
			
			SFX_Note05  = assets.getSound("Note05");
			soundManager.addSound("Note05", SFX_Note05);
			
			SFX_SlimerTwo  = assets.getSound("SlimerTwo");
			soundManager.addSound("SlimerTwo", SFX_SlimerTwo);
			
			SFX_BigElevator  = assets.getSound("BigElevator");
			soundManager.addSound("BigElevator", SFX_BigElevator);
			
			SFX_BigElevatorLong  = assets.getSound("BigElevatorLong");
			soundManager.addSound("BigElevatorLong", SFX_BigElevatorLong);
			
			SFX_SparksFour  = assets.getSound("SparksFour");
			soundManager.addSound("SparksFour", SFX_SparksFour);
			
			SFX_HammerTap  = assets.getSound("HammerTap");
			soundManager.addSound("HammerTap", SFX_HammerTap);
			
			SFX_AstroidBoom  = assets.getSound("AstroidBoom");
			soundManager.addSound("AstroidBoom", SFX_AstroidBoom);
			
			SFX_Ping  = assets.getSound("Ping");
			soundManager.addSound("Ping", SFX_Ping);
			
			SFX_MachineTwo  = assets.getSound("MachineTwo");
			soundManager.addSound("MachineTwo", SFX_MachineTwo);
			
			SFX_PopOne  = assets.getSound("PopOne");
			soundManager.addSound("PopOne", SFX_PopOne);
			
			SFX_SparkFive  = assets.getSound("SparkFive");
			soundManager.addSound("SparkFive", SFX_SparkFive);
			
			SFX_DripsFast  = assets.getSound("DripsFast");
			soundManager.addSound("DripsFast", SFX_DripsFast);
			
			SFX_MachineThree  = assets.getSound("MachineThree");
			soundManager.addSound("MachineThree", SFX_MachineThree);
			
			SFX_MachineFour  = assets.getSound("MachineFour");
			soundManager.addSound("MachineFour", SFX_MachineFour);
			
			SFX_SpinLoop  = assets.getSound("SpinLoop");
			soundManager.addSound("SpinLoop", SFX_SpinLoop);
			
			SFX_TimeRip  = assets.getSound("TimeRip");
			soundManager.addSound("TimeRip", SFX_TimeRip);
			/*
			SFX_TimeRip
			PlaySFX_SpinLoop
			SFX_MachineFour
			MachineThree
			DripsFast
			SFX_SparkFive
			MachineTwo
			SFX_Ping
			AstroidBoom
			HammerTap
			SparksFour
			BigElevatorLong
			BigElevator
			SlimerTwo
			
			public var SFX_ThumpTwo:Sound;
			public var SFX_ThumpThree:Sound;
			TuneForkHumOne
			SFX_SlimerOne
			AirDecompress
			SFX_Adimm_00
			SFX_SlimePlop
			AirLeak
			SFX_ElevatorMove
			SFX_ScrewDropX4
			SFX_Electofy
			PipeRingOne
			RocketEngine
			public var SFX_HeavyMetalDoorClose:Sound;
			public var SFX_HeavyMetalDoorOpen:Sound;
			
			MicrowaveFan
			SFX_OvenDing
			RobotRattle
			LightFlicker
			SFX_PowerPulse
			public var SFX_SwitchesOne:Sound
			public var SFX_SwitchesTwo:Sound
			public var SFX_SwitchesThree:Sound
			public var SFX_SwitchesFour:Sound
			public var SFX_SwitchesFive:Sound
			public var SFX_SwitchesSix:Sound
			public var SFX_DoorThreeClose:Sound
			public var SFX_DoorThreeOpen:Sound
			MetalDrop
			SFX_SnoryBot
			WalkyBot
			SFX_ClickyBot
			SFX_DrillSingleOne
			public var SFX_DuctBangThree:Sound;
			public var SFX_DuctBangFour:Sound;
			
			public var SFX_DuctBangOne:Sound;
			public var SFX_DuctBangTwo:Sound;
			SFX_CarAlarm
			public var SFX_CarIgnition:Sound;
			public var SFX_CarStart:Sound;
			
			public var SFX_DrillQuick:Sound;
			public var SFX_DrillSlow:Sound;
			SFX_SlimeMove
			public var SFX_MetalBoxTwo_Open:Sound;
			public var SFX_MetalBoxTwo_Bunk:Sound;
			public var SFX_MorseThree:Sound;
			*/
			
		}
		


		public function PlaySFX_InvenOpen():void{
			
			soundManager.playSound("InvenOpen",globalVol);	
		}
		
		public function PlaySFX_Gong():void{
			
			soundManager.playSound("Gong",globalVol);	
		}
		
		public function PlaySFX_Phone():void{
			
			soundManager.playSound("Phone",globalVol);	
		}
		
		public function PlaySFX_Machine():void{
			
			soundManager.playSound("Machine",globalVol);	
		}
		
		public function PlaySFX_WaterPour():void{
			
			soundManager.playSound("WaterPour",globalVol);	
		}
		
		public function PlaySFX_WaterBoil():void{
			
			soundManager.playSound("WaterBoil",globalVol);	
		}
		
		public function PlaySFX_PowmThree():void{
			
			soundManager.playSound("PowmThree",globalVol);
			
		}
		
		public function PlaySFX_PowmTwo():void{
			
			soundManager.playSound("PowmTwo",globalVol);
			
		}
		
		public function PlaySFX_WaterDroplet():void{
			
			soundManager.playSound("WaterDroplet",globalVol);
			
		}

		
		public function PlaySFX_Error():void{
			
			soundManager.playSound("Error",globalVol);
			
		}

		
		public function PlaySFX_Bubbles():void{
			
			soundManager.playSound("Bubbles",globalVol);
			
		}
		
		public function PlaySFX_BootUp():void{
			
			soundManager.playSound("BootUp",globalVol);
			
		}
		
		public function PlaySFX_CreakyDoorThree():void{
			
			soundManager.playSound("CreakyDoorThree",globalVol);
			
		}
		
		public function PlaySFX_GearsThree():void{
			
			soundManager.playSound("GearsThree",globalVol);
			
		}
		
		public function PlaySFX_GearsOne(repeatCount:int = 0):void{
			
			soundManager.playSound("GearsOne",globalVol,repeatCount);
			
		}
		
		public function PlaySFX_GearsTwo(repeat:int = 0):void{
			
			soundManager.playSound("GearsTwo",globalVol,repeat);
			
		}
		
		public function PlaySFX_ChestOpen():void{
			
			soundManager.playSound("ChestOpen",globalVol);
			
		}
		
		public function PlaySFX_Unlock():void{
			
			soundManager.playSound("Unlock",globalVol);
			
		}
		
		public function PlaySFX_LockPick():void{
			
			soundManager.playSound("LockPick",globalVol,999);
			
		}
		public function PlaySFX_LockedDoorTwo():void{
			
			soundManager.playSound("LockedDoorTwo",globalVol);
			
		}
		public function PlaySFX_EnergyPulse():void{
			
			soundManager.playSound("EnergyPulse",globalVol);
			
		}
		
		public function PlaySFX_PowerUp():void{
			
			soundManager.playSound("PowerUp",globalVol);
			
		}
		
		public function PlaySFX_MetalBoxClose():void{
			
			soundManager.playSound("MetalBoxClose",globalVol);
			
		}
		
		public function PlaySFX_MetalBoxOpen():void{
			
			soundManager.playSound("MetalBoxOpen",globalVol);
			
		}
		
		public function PlaySFX_AirRelease():void{
			
			soundManager.playSound("AirRelease",globalVol);
			
		}
		
		
		public function PlaySFX_MetalSteps():void{
			
			soundManager.playSound("MetalSteps",globalVol);
			
		}	
		public function PlaySFX_ComputerBeepsTwo():void{
			
			soundManager.playSound("ComputerBeepsTwo",globalVol);
			
		}	
		public function PlaySFX_Click():void{
			
			soundManager.playSound("Click",globalVol);
			
		}	
		public function PlaySFX_HeavyStoneDrag():void{
			
			soundManager.playSound("HeavyStoneDrag",globalVol);
			
		}	
		
		public function PlaySFX_Ohm():void{
			
			soundManager.playSound("Ohm",globalVol);
			
		}	
		public function PlaySFX_StoneDrag():void{
			
			soundManager.playSound("StoneDrag",globalVol);
			
		}	
		public function PlaySFX_ComputerBeeps():void{
			
			soundManager.playSound("ComputerBeeps",globalVol);
			
		}	
		
		public function PlaySFX_MailBox():void{
			
			soundManager.playSound("MailBox",globalVol);
			
		}	
		public function PlaySFX_Ladder():void{
			
			soundManager.playSound("Ladder",globalVol);
	
		}		
		
		
		public function PlaySFX_LadderOpen():void{
			
			soundManager.playSound("LadderOpen",globalVol);	
			
		}
		
		
		public function PlaySFX_SplashTwo():void{
			
			soundManager.playSound("SplashTwo",globalVol);
			
		}
		public function PlaySFX_Splash():void{
			
			soundManager.playSound("Splash",globalVol);
			
		}
		
		public function PlaySFX_SplashOut():void{
			
			soundManager.playSound("SplashOut",globalVol);
			
		}
		
		public function PlaySFX_DrawerOpen():void{
			
			soundManager.playSound("DrawerOpen",globalVol);
			
		}
		public function PlaySFX_DrawerClose():void{
			
			soundManager.playSound("DrawerClose",globalVol);
			
		}
		
		public function PlaySFX_FridgeOpen():void{
			
			soundManager.playSound("FridgeOpen",globalVol);
			
		}
		public function PlaySFX_FridgeClose():void{
			
			soundManager.playSound("FridgeClose",globalVol);
			
		}
		
		
		public function PlaySFX_WaterFlow():void{
			
			soundManager.playSound("WaterFlow",globalVol);	
		}
		
		public function PlaySFX_ClockChime():void{
			
			soundManager.playSound("ClockChime",globalVol);
			
		}
		public function PlaySFX_WindUp(repeatCount:Number = 999):void{
			
			soundManager.playSound("WindUp",globalVol,repeatCount);
			
		}
		
		public function PlaySFX_ClickTiny():void{
			
			soundManager.playSound("ClickTiny",globalVol);
			
		}
		public function PlaySFX_Bung():void{
			
			soundManager.playSound("Bung",globalVol);
			
		}		
		
		public function PlaySFX_Thump():void{
			
			soundManager.playSound("Thump",globalVol);
			
		}		
		public function PlaySFX_ItemPlace():void{
			
			soundManager.playSound("ItemPlace",globalVol);
			
		}		
		
		public function PlaySFX_FireBall():void{
			
			soundManager.playSound("FireBall",globalVol);
			
		}		
		
		public function PlaySFX_Match():void{
			
			soundManager.playSound("Match",globalVol);
			
		}		
		public function PlaySFX_Steps():void{
			
			soundManager.playSound("Steps",globalVol);
			
		}		
		
		public function PlaySFX_SuccessLow():void{
			
			soundManager.playSound("SuccessLow",globalVol);
			
		}
		public function PlaySFX_CreakyDoorTwo():void{
			
			soundManager.playSound("CreakyDoorTwo",globalVol);
			
		}
		
		public function PlaySFX_CreakyDoor():void{
			
			soundManager.playSound("CreakyDoor",globalVol);
			
		}
		
		public function PlaySFX_LockedDoor():void{
			
			soundManager.playSound("LockedDoor",globalVol);
			
		}
		public function PlaySFX_Powm():void{
			
			soundManager.playSound("Powm",globalVol);
			
		}
		
		public function PlaySFX_PageTurn():void{
			
			soundManager.playSound("PageTurn",globalVol);
			
		}
		
		public function PlaySFX_BoxOpen():void{
			
			soundManager.playSound("BoxOpen",globalVol);
			
		}
		
		public function PlaySFX_BoxClose():void{
			
			soundManager.playSound("BoxClose",globalVol);
			
		}
		
		public function PlaySFX_ItemPickUp():void{
			
			soundManager.playSound("ItemPickUp",globalVol);
			
		}
		
		
		
		
		public function PlaySFX_Lightning_01():void{			
			soundManager.playSound("Lightning_01",globalVol);			
		}
		
		public function PlaySFX_Thunder_01():void{			
			soundManager.playSound("Thunder_01",globalVol);			
		}
	
		public function PlaySFX_DrawSlideClosed():void{			
			soundManager.playSound("DrawSlideClosed",globalVol);			
		}
		public function PlaySFX_DrawSlideOpen():void{			
			soundManager.playSound("DrawSlideOpen",globalVol);			
		}
		
		public function PlaySFX_DoorMetalRustyOpen():void{			
			soundManager.playSound("DoorMetalRustyOpen",globalVol);			
		}
		public function PlaySFX_DoorMetalRustyClose():void{			
			soundManager.playSound("DoorMetalRustyClose",globalVol);			
		}
		
		public function PlaySFX_DoorMetalRustyOpenTwo():void{			
			soundManager.playSound("DoorMetalRustyOpenTwo",globalVol);			
		}
		public function PlaySFX_DoorMetalRustyCloseTwo():void{			
			soundManager.playSound("DoorMetalRustyCloseTwo",globalVol);			
		}
		public function PlaySFX_ThakOne():void{			
			soundManager.playSound("ThakOne",globalVol);			
		}
		public function PlaySFX_ThakTwo():void{			
			soundManager.playSound("ThakTwo",globalVol);			
		}
		public function PlaySFX_ThakThree():void{			
			soundManager.playSound("ThakThree",globalVol);			
		}
		public function PlaySFX_Gurgles():void{			
			soundManager.playSound("Gurgles",globalVol);			
		}
		public function PlaySFX_ShovelOne():void{			
			soundManager.playSound("ShovelOne",globalVol);			
		}
		public function PlaySFX_ShovelTwo():void{			
			soundManager.playSound("ShovelTwo",globalVol);			
		}
		public function PlaySFX_GrainOne():void{			
			soundManager.playSound("GrainOne",globalVol);			
		}
		
		public function PlaySFX_WheelOne():void{			
			soundManager.playSound("WheelOne",globalVol);			
		}
		
		public function PlaySFX_Saw():void{			
			soundManager.playSound("Saw",globalVol);			
		}
		
		public function PlaySFX_TVBlip():void{			
			soundManager.playSound("TVBlip",globalVol);			
		}
		public function PlaySFX_TVBlop():void{			
			soundManager.playSound("TVBlop",globalVol);			
		}
		public function PlaySFX_CreakyClose():void{			
			soundManager.playSound("CreakyClose",globalVol);			
		}
		public function PlaySFX_CreakyOpen():void{			
			soundManager.playSound("CreakyOpen",globalVol);			
		}
		public function PlaySFX_PageUnroll():void{			
			soundManager.playSound("PageUnroll",globalVol);			
		}
		
		public function PlaySFX_Knot():void{			
			soundManager.playSound("Knot",globalVol);			
		}
		
		public function PlaySFX_RopeClimb():void{			
			soundManager.playSound("RopeClimb",globalVol);			
		}
		
		public function PlaySFX_BigLight():void{			
			soundManager.playSound("BigLight",globalVol);			
		}
		
		public function PlaySFX_electricLight():void{			
			soundManager.playSound("electricLight",globalVol);			
		}
		
		public function PlaySFX_RattleOne():void{			
			soundManager.playSound("RattleOne",globalVol);			
		}

		public function PlaySFX_Sizzle():void{			
			soundManager.playSound("Sizzle",globalVol);			
		}
		public function PlaySFX_SizzleTwo():void{			
			soundManager.playSound("SizzleTwo",globalVol);			
		}
		public function PlaySFX_BlowTorch():void{			
			soundManager.playSound("BlowTorch",globalVol);			
		}
		public function PlaySFX_MetalDropHeavy():void{			
			soundManager.playSound("MetalDropHeavy",globalVol);			
		}
		
		public function PlaySFX_MetalDropLight():void{			
			soundManager.playSound("MetalDropLight",globalVol);			
		}
		
		public function PlaySFX_BarrelKickLight():void{			
			soundManager.playSound("BarrelKickLight",globalVol);			
		}
		
		public function PlaySFX_BarrelKickDeep():void{			
			soundManager.playSound("BarrelKickDeep",globalVol);			
		}
		
		public function PlaySFX_FallingTree():void{			
			soundManager.playSound("FallingTree",globalVol);			
		}
		public function PlaySFX_ClinkOne(repeatCount:int = 1):void{			
			soundManager.playSound("ClinkOne",globalVol,repeatCount);			
		}
		
		public function PlaySFX_GrowlDeep():void{			
			soundManager.playSound("GrowlDeep",globalVol);			
		}
		
		public function PlaySFX_GrowlOne():void{			
			soundManager.playSound("GrowlOne",globalVol);			
		}
		
		public function PlaySFX_GrowlTwo():void{			
			soundManager.playSound("GrowlTwo",globalVol);			
		}
		
		public function PlaySFX_Chewing():void{			
			soundManager.playSound("Chewing",globalVol);			
		}
		
		public function PlaySFX_CosmicRays():void{			
			soundManager.playSound("CosmicRays",globalVol);			
		}
		
		public function PlaySFX_OhmTwo():void{			
			soundManager.playSound("OhmTwo",globalVol);			
		}
		public function PlaySFX_RemoveNail():void{			
			soundManager.playSound("RemoveNail",globalVol);			
		}
		public function PlaySFX_RemoveNail3x():void{			
			soundManager.playSound("RemoveNail3x",globalVol);			
		}
		public function PlaySFX_CosmicWaffle():void{			
			soundManager.playSound("CosmicWaffle",globalVol);			
		}
		public function PlaySFX_CosmicDoor():void{			
			soundManager.playSound("CosmicDoor",globalVol);			
		}
		public function PlaySFX_CosmicWindUp(repeatCount:Number = 999):void{			
			soundManager.playSound("CosmicWindUp",globalVol,repeatCount);			
		}
		public function PlaySFX_CosmicProcess():void{			
			soundManager.playSound("CosmicProcess",globalVol);			
		}
		public function PlaySFX_ClickSciFi():void{			
			soundManager.playSound("ClickSciFi",globalVol);			
		}
		public function PlaySFX_ClickSciFiTwo():void{			
			soundManager.playSound("ClickSciFiTwo",globalVol);			
		}
		public function PlaySFX_ErrorTwo():void{			
			soundManager.playSound("ErrorTwo",globalVol);			
		}
		public function PlaySFX_ClickSciFiThree():void{			
			soundManager.playSound("ClickSciFiThree",globalVol);			
		}
		public function PlaySFX_SciFiTransPorter():void{			
			soundManager.playSound("Transporter",globalVol);			
		}
		public function PlaySFX_Spark(repeatCount:Number = 999):void{			
			soundManager.playSound("Spark",globalVol,repeatCount);			
		}
		public function PlaySFX_CrystalWave():void{			
			soundManager.playSound("CrystalWave",globalVol);			
		}
		public function PlaySFX_CrystalPing():void{			
			soundManager.playSound("CrystalPing",globalVol);			
		}
		public function PlaySFX_CrystalPingTwo():void{			
			soundManager.playSound("CrystalPingTwo",globalVol);			
		}
		public function PlaySFX_CrystalWaveTwo(repeatCount:int =0):void{			
			soundManager.playSound("CrystalWaveTwo",globalVol,repeatCount);			
		}
		public function PlaySFX_HeartBeat(repeatCount:Number = 999):void{			
			soundManager.playSound("HeartBeat",globalVol,repeatCount);			
		} 
		
		
		public function PlaySFX_SparksThree():void{			
			soundManager.playSound("SparksThree",globalVol);			
		}
		public function PlaySFX_DoorBeepsAccessDenied():void{			
			soundManager.playSound("DoorBeepsAccessDenied",globalVol);			
		}
		public function PlaySFX_DoorBeepsAccessGranted():void{			
			soundManager.playSound("DoorBeepsAccessGranted",globalVol);			
		}
		public function PlaySFX_CarLocked():void{			
			soundManager.playSound("CarLocked",globalVol);			
		}
		public function PlaySFX_CarDoorOpen():void{			
			soundManager.playSound("CarDoorOpen",globalVol);			
		}
		public function PlaySFX_CarDoorClose():void{			
			soundManager.playSound("CarDoorClose",globalVol);			
		}
		public function PlaySFX_WetSteps():void{			
			soundManager.playSound("WetSteps",globalVol);			
		}
		public function PlaySFX_SlidingDoor():void{			
			soundManager.playSound("SlidingDoor",globalVol);			
		}
		public function PlaySFX_ElevatorClose():void{			
			soundManager.playSound("ElevatorClose",globalVol);			
		}
		public function PlaySFX_ElevatorOpen():void{			
			soundManager.playSound("ElevatorOpen",globalVol);			
		}
		
		public function PlaySFX_SurpriseOne():void{			
			soundManager.playSound("SurpriseOne",globalVol);			
		}
		
		public function PlaySFX_LockedTwo():void{			
			soundManager.playSound("LockedTwo",globalVol);			
		}
		public function PlaySFX_UnlockTwo():void{			
			soundManager.playSound("UnlockTwo",globalVol);			
		}
		public function PlaySFX_PhonePickUp():void{			
			soundManager.playSound("PhonePickUp",globalVol);			
		}
		public function PlaySFX_PhonePutDown():void{			
			soundManager.playSound("PhonePutDown",globalVol);			
		}
		
		public function PlaySFX_MorseOne(repeatCount:Number = 999):void{			
			soundManager.playSound("MorseOne",globalVol,repeatCount);			
		}
		public function PlaySFX_MorseTwo(repeatCount:Number = 999):void{			
			soundManager.playSound("MorseTwo",globalVol,repeatCount);			
		}
		public function PlaySFX_MorseThree(repeatCount:Number = 999):void{			
			soundManager.playSound("MorseThree",globalVol,repeatCount);			
		}
		public function PlaySFX_Copier():void{			
			soundManager.playSound("Copier",globalVol);			
		}
		public function PlaySFX_ChainRattle():void{			
			soundManager.playSound("ChainRattle",globalVol);			
		}
		public function PlaySFX_InputAccept():void{			
			soundManager.playSound("InputAccept",globalVol);			
		}
		public function PlaySFX_InputTiny():void{			
			soundManager.playSound("InputTiny",globalVol);			
		}
		public function PlaySFX_Servos(repeatCount:Number = 999):void{		
			soundManager.playSound("Servos",globalVol,repeatCount);			
		}
		public function PlaySFX_RotaryClicks(repeatCount:Number = 999):void{		
			soundManager.playSound("RotaryClicks",globalVol,repeatCount);			
		}
		public function PlaySFX_Spray():void{			
			soundManager.playSound("Spray",globalVol);			
		}
		public function PlaySFX_Wipe():void{			
			soundManager.playSound("Wipe",globalVol);			
		}
		public function PlaySFX_BathroomFan():void{			
			soundManager.playSound("BathroomFan",globalVol);			
		}
		
		public function PlaySFX_MetalBoxTwo_Open():void{			
			soundManager.playSound("MetalBoxTwo_Open",globalVol);			
		}
		public function PlaySFX_MetalBoxTwo_Bunk():void{			
			soundManager.playSound("MetalBoxTwo_Bunk",globalVol);			
		}
		public function PlaySFX_MetalBoxTwo_Close():void{			
			soundManager.playSound("MetalBoxTwo_Close",globalVol);			
		}
		//MetalBoxTwo_Close
		public function PlaySFX_SlimeMove():void{			
			soundManager.playSound("SlimeMove",globalVol);			
		}
		public function PlaySFX_DrillQuick(repeatCount:int = 0):void{			
			soundManager.playSound("DrillQuick",globalVol,repeatCount);			
		}
		public function PlaySFX_DrillSlow(repeatCount:int = 1):void{			
			soundManager.playSound("DrillSlow",globalVol,repeatCount);			
		}
		public function PlaySFX_CarIgnition():void{			
			soundManager.playSound("CarIgnition",globalVol);			
		}
		public function PlaySFX_CarStart():void{			
			soundManager.playSound("CarStart",globalVol);			
		}
		public function PlaySFX_CarAlarm():void{			
			soundManager.playSound("CarAlarm",globalVol);			
		}
		public function PlaySFX_DuctBangOne():void{			
			soundManager.playSound("DuctBangOne",globalVol);			
		}
		public function PlaySFX_DuctBangTwo():void{			
			soundManager.playSound("DuctBangTwo",globalVol);			
		}
		public function PlaySFX_DuctBangThree():void{			
			soundManager.playSound("DuctBangThree",globalVol);			
		}
		public function PlaySFX_DuctBangFour():void{			
			soundManager.playSound("DuctBangFour",globalVol);			
		}
		public function PlaySFX_FanJam():void{			
			soundManager.playSound("FanJam",globalVol);			
		}
		public function PlaySFX_DrillSingleOne():void{			
			soundManager.playSound("DrillSingleOne",globalVol);			
		}
		public function PlaySFX_ClickyBot(repeatCount:Number = 999):void{		
			soundManager.playSound("ClickyBot",globalVol,repeatCount);				
		}
		public function PlaySFX_WalkyBot(repeatCount:Number = 999):void{		
			soundManager.playSound("WalkyBot",globalVol,repeatCount);					
		}
		public function PlaySFX_SnoryBot(repeatCount:Number = 999):void{		
			soundManager.playSound("SnoryBot",globalVol,repeatCount);					
		}
		public function PlaySFX_MetalDrop():void{		
			soundManager.playSound("MetalDrop",globalVol);				
		}
		public function PlaySFX_DoorThreeClose():void{		
			soundManager.playSound("DoorThreeClose",globalVol);				
		}
		public function PlaySFX_DoorThreeOpen():void{		
			soundManager.playSound("DoorThreeOpen",globalVol);				
		}
		
		public function PlaySFX_SwitchesOne():void{		
			soundManager.playSound("SwitchesOne",globalVol);				
		}
		
		public function PlaySFX_SwitchesTwo():void{		
			soundManager.playSound("SwitchesTwo",globalVol);				
		}
		
		public function PlaySFX_SwitchesThree():void{		
			soundManager.playSound("SwitchesThree",globalVol);				
		}
		
		public function PlaySFX_SwitchesFour():void{		
			soundManager.playSound("SwitchesFour",globalVol);				
		}
		
		public function PlaySFX_SwitchesFive():void{		
			soundManager.playSound("SwitchesFive",globalVol);				
		}
		
		public function PlaySFX_SwitchesSix():void{		
			soundManager.playSound("SwitchesSix",globalVol);				
		}
		
		public function PlaySFX_SwitchesSeven():void{		
			soundManager.playSound("SwitchesSeven",globalVol);				
		}
		public function PlaySFX_PowerPulse():void{		
			soundManager.playSound("PowerPulse",globalVol);				
		}
		public function PlaySFX_LightFlicker():void{		
			soundManager.playSound("LightFlicker",globalVol);				
		}
		public function PlaySFX_RobotWail():void{		
			soundManager.playSound("RobotWail",globalVol);				
		}
		public function PlaySFX_RobotRattle():void{		
			soundManager.playSound("RobotRattle",globalVol);				
		}
		public function PlaySFX_OvenDing():void{		
			soundManager.playSound("OvenDing",globalVol);				
		}
		public function PlaySFX_MicrowaveFan():void{		
			soundManager.playSound("MicrowaveFan",globalVol);				
		}
		public function PlaySFX_HeavyMetalDoorClose():void{		
			soundManager.playSound("HeavyMetalDoorClose",globalVol);				
		}
		public function PlaySFX_HeavyMetalDoorOpen():void{		
			soundManager.playSound("HeavyMetalDoorOpen",globalVol);				
		}
		public function PlaySFX_RocketEngine():void{		
			soundManager.playSound("RocketEngine",globalVol);				
		}
		public function PlaySFX_PipeRingOne():void{		
			soundManager.playSound("PipeRingOne",globalVol);				
		}
		public function PlaySFX_Electofy():void{		
			soundManager.playSound("Electofy",globalVol);				
		}
		public function PlaySFX_ScrewDropX4():void{		
			soundManager.playSound("ScrewDropX4",globalVol);				
		}
		public function PlaySFX_ElevatorMove():void{		
			soundManager.playSound("ElevatorMove",globalVol);				
		}
		public function PlaySFX_AirLeak():void{		
			soundManager.playSound("AirLeak",globalVol);				
		}
		public function PlaySFX_SlimePlop():void{		
			soundManager.playSound("SlimePlop",globalVol);				
		}
		public function PlaySFX_Adimm_00():void{		
			soundManager.playSound("Adimm_00",globalVol);				
		}
		public function PlaySFX_Adimm_01():void{		
			soundManager.playSound("Adimm_01",globalVol);				
		}
		public function PlaySFX_Adimm_02():void{		
			soundManager.playSound("Adimm_02",globalVol);				
		}
		public function PlaySFX_Adimm_03():void{		
			soundManager.playSound("Adimm_03",globalVol);				
		}
		public function PlaySFX_Adimm_04():void{		
			soundManager.playSound("Adimm_04",globalVol);				
		}
		public function PlaySFX_Adimm_05():void{		
			soundManager.playSound("Adimm_05",globalVol);				
		}
		public function PlaySFX_Adimm_06():void{		
			soundManager.playSound("Adimm_06",globalVol);				
		}
		public function PlaySFX_AirDecompress():void{		
			soundManager.playSound("AirDecompress",globalVol);				
		}
		public function PlaySFX_SlimerOne():void{		
			soundManager.playSound("SlimerOne",globalVol);				
		}
		public function PlaySFX_TuneForkHumOne(repeatCount:int = 0):void{		
			soundManager.playSound("TuneForkHumOne",globalVol,repeatCount);				
		}
		public function PlaySFX_ThumpTwo(repeatCount:int = 0):void{		
			soundManager.playSound("ThumpTwo",globalVol,repeatCount);				
		}
		public function PlaySFX_ThumpThree(repeatCount:int = 0):void{		
			soundManager.playSound("ThumpThree",globalVol,repeatCount);				
		}
		
		public function PlaySFX_Note00(repeatCount:int = 0):void{		
			soundManager.playSound("Note00",globalVol,repeatCount);				
		}
		public function PlaySFX_Note01(repeatCount:int = 0):void{		
			soundManager.playSound("Note01",globalVol,repeatCount);				
		}
		public function PlaySFX_Note02(repeatCount:int = 0):void{		
			soundManager.playSound("Note02",globalVol,repeatCount);				
		}
		public function PlaySFX_Note03(repeatCount:int = 0):void{		
			soundManager.playSound("Note03",globalVol,repeatCount);				
		}
		public function PlaySFX_Note04(repeatCount:int = 0):void{		
			soundManager.playSound("Note04",globalVol,repeatCount);				
		}
		public function PlaySFX_Note05(repeatCount:int = 0):void{		
			soundManager.playSound("Note05",globalVol,repeatCount);				
		}
		public function PlaySFX_SlimerTwo(repeatCount:int = 0):void{		
			soundManager.playSound("SlimerTwo",globalVol,repeatCount);				
		}
		public function PlaySFX_BigElevator(repeatCount:int = 0):void{		
			soundManager.playSound("BigElevator",globalVol,repeatCount);				
		}
		public function PlaySFX_BigElevatorLong(repeatCount:int = 0):void{		
			soundManager.playSound("BigElevatorLong",globalVol,repeatCount);				
		}
		public function PlaySFX_SparksFour(repeatCount:int = 0):void{		
			soundManager.playSound("SparksFour",globalVol,repeatCount);				
		}
		public function PlaySFX_WoodPry(repeatCount:int = 0):void{		
			soundManager.playSound("WoodPry",globalVol,repeatCount);				
		}
		public function PlaySFX_HammerTap(repeatCount:int = 0):void{		
			soundManager.playSound("HammerTap",globalVol,repeatCount);				
		}
		public function PlaySFX_AstroidBoom(repeatCount:int = 0):void{		
			soundManager.playSound("AstroidBoom",globalVol,repeatCount);				
		}
		public function PlaySFX_Ping(repeatCount:int = 0):void{		
			soundManager.playSound("Ping",globalVol,repeatCount);				
		}
		public function PlaySFX_MachineTwo(repeatCount:int = 0):void{		
			soundManager.playSound("MachineTwo",globalVol,repeatCount);				
		}
		public function PlaySFX_PopOne(repeatCount:int = 0):void{		
			soundManager.playSound("PopOne",globalVol,repeatCount);				
		}
		public function PlaySFX_SparkFive(repeatCount:int = 0):void{		
			soundManager.playSound("SparkFive",globalVol,repeatCount);				
		}
		public function PlaySFX_DripsFast(repeatCount:int = 0):void{		
			soundManager.playSound("DripsFast",globalVol,repeatCount);				
		}
		public function PlaySFX_Squirt(repeatCount:int = 0):void{		
			soundManager.playSound("Squirt",globalVol,repeatCount);				
		}
		public function PlaySFX_MachineThree(repeatCount:int = 0):void{		
			soundManager.playSound("MachineThree",globalVol,repeatCount);				
		}
		public function PlaySFX_MachineFour(repeatCount:int = 0):void{		
			soundManager.playSound("MachineFour",globalVol,repeatCount);				
		}
		public function PlaySFX_SpinLoop(repeatCount:int = 0):void{		
			soundManager.playSound("SpinLoop",globalVol,repeatCount);				
		}
		public function PlaySFX_TimeRip(repeatCount:int = 0):void{		
			soundManager.playSound("TimeRip",globalVol,repeatCount);				
		}
		/*
		SFX_TimeRip
		SFX_SpinLoop
		SFX_MachineFour
		MachineThree
		SFX_Squirt
		SFX_DripsFast
		SFX_SparkFive
		SFX_PopOne
		MachineTwo
		SFX_Ping
		SFX_AstroidBoom
		HammerTap
		SFX_WoodPry
		SFX_SparksFour
		SFX_BigElevatorLong
		SFX_BigElevator
		SlimerTwo
		public var SFX_Note00:Sound;
		public var SFX_Note01:Sound;
		public var SFX_Note02:Sound;
		public var SFX_Note03:Sound;
		public var SFX_Note04:Sound;
		public var SFX_Note05:Sound;
		
		
		TuneForkHumOne
		SFX_SlimerOne
		AirDecompress
		SFX_Adimm_00
		SFX_SlimePlop
		AirLeak
		ElevatorMove
		SFX_ScrewDropX4
		SFX_Electofy
		SFX_PipeRingOne
		RocketEngine
		public var SFX_HeavyMetalDoorClose:Sound;
		public var SFX_HeavyMetalDoorOpen:Sound;
		MicrowaveFan
		SFX_OvenDing
		SFX_RobotRattle
		SFX_RobotWail
		SFX_BigLight
		SFX_LightFlicker
		SFX_PowerPulse
		public var SFX_SwitchesOne:Sound
		public var SFX_SwitchesTwo:Sound
		public var SFX_SwitchesThree:Sound
		public var SFX_SwitchesFour:Sound
		public var SFX_SwitchesFive:Sound
		public var SFX_SwitchesSix:Sound
		
		public var SFX_DoorThreeClose:Sound
		public var SFX_DoorThreeOpen:Sound
		MetalDrop
		SFX_SnoryBot
		SFX_WalkyBot
		SFX_ClickyBot
		SFX_DrillSingleOne
		SFX_FanJam
		public var SFX_DuctBangThree:Sound;
		public var SFX_DuctBangFour:Sound;
		
		public var SFX_DuctBangOne:Sound;
		public var SFX_DuctBangTwo:Sound;
		CarAlarm
		public var SFX_CarIgnition:Sound;
		public var SFX_CarStart:Sound;
		
		public var SFX_DrillQuick:Sound;
		public var SFX_DrillSlow:Sound;
		SFX_SlimeMove
		public var SFX_MetalBoxTwo_Open:Sound;
		public var SFX_MetalBoxTwo_Bunk:Sound;
		SFX_Spray
		SFX_ChainRattle
		SFX_Copier
		public function PlaySFX_WindUp(repeatCount:Number = 999):void{
		
		soundManager.playSound("WindUp",globalVol,repeatCount);
		
		}
		public var SFX_MorseOne:Sound;
		public var SFX_MorseTwo:Sound;
		public var SFX_MorseThree:Sound;
		
		public var SFX_PhonePickUp:Sound;
		public var SFX_PhonePutDown:Sound;
		public var SFX_ElevatorClose:Sound;
		public var SFX_ElevatorOpen:Sound;
		SFX_SlidingDoor  = assets.getSound("SlidingDoor");
		soundManager.addSound("SlidingDoor", SFX_SlidingDoor);

		SFX_WetSteps
		public var SFX_CarLocked:Sound;
		public var SFX_CarDoorOpen:Sound;
		public var SFX_CarDoorClose:Sound;
		*/
		
		
	}
}