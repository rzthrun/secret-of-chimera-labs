package screens
{

	import screens.ingamescreens.CryptoBookEmbedded;
	import screens.ingamescreens.MadMagEmbedded;
	import screens.ingamescreens.SpinWheelEmbedded;
	import screens.notebook.NoteBookOneEmbedded;
	import screens.notebook.NoteBookTwoEmbedded;
	
	import starling.animation.DelayedCall;
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	import screens.ingamescreens.ContaimentCalibratorEmbedded;
	import screens.ingamescreens.ContainmentInteriorEmbedded;
	import screens.ingamescreens.ContainmentQuantumEmbedded;
	import screens.ingamescreens.DeepLabDeskEmbedded;
	import screens.ingamescreens.GreenHouseVenusEmbedded;
	import screens.ingamescreens.LiftEmbedded;
	import screens.ingamescreens.RocketRoomEmbedded;
	
//	import screens.ingamescreens.FarCoastDingyEmbedded;
//	import screens.ingamescreens.TriremeDeviceEmbedded;
//	import screens.ingamescreens.SubmarineCaptainsEmbedded;
//	import screens.ingamescreens.TemplePascalEmbedded;
//	import screens.ingamescreens.ChamberBlueNautilusEmbedded;


	public class PreLoader extends Sprite
	{
		public var SpinWheelImages:SpinWheelEmbedded;
		public var CryptoBookImages:CryptoBookEmbedded;
		public var NoteBookOneImages:NoteBookOneEmbedded;
		public var NoteBookTwoImages:NoteBookTwoEmbedded;
		public var MadMagImages:MadMagEmbedded;
		public var ContaimentCalibratorImages:ContaimentCalibratorEmbedded;
		public var ContainmentInteriorImages:ContainmentInteriorEmbedded;
		public var ContainmentQuantumImages:ContainmentQuantumEmbedded;
		public var DeepLabDeskImages:DeepLabDeskEmbedded;
		public var GreenHouseVenusImages:GreenHouseVenusEmbedded;
		public var LiftImages:LiftEmbedded;
		public var RocketRoomImages:RocketRoomEmbedded;
		
	//	public var NoteBookImages = NoteBookEmbedded;
	//	public var FreighterWheelImages:FreightWheelEmbedded;
	//	public var PirateTopDeckImages:PirateTopDeckEmbedded;
	//	public var FarCoastDingyImages:FarCoastDingyEmbedded;
	//	public var TriremeDeviceImages:TriremeDeviceEmbedded;
	//	public var SubmarineCaptainsImages:SubmarineCaptainsEmbedded;
	//	public var TemplePascalImages:TemplePascalEmbedded;
	//	public var ChamberBlueNautilusImages:ChamberBlueNautilusEmbedded;
		//public var PirateCaptainsCouchImages:PirateCaptainsCouchEmbedded
		
		public var LoadBar:Shape;
		
		private var FadeTween:Tween;
		public var delayedCall:DelayedCall;
		public var assets:AssetManager;
		
		
		
		public function PreLoader(_assets:AssetManager)
		{
			assets = _assets;
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
			
		}
		private function onAddedToStage(event:starling.events.Event):void{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			CreateLoadBar();

			SpinWheelImages = new SpinWheelEmbedded(this.assets,IncreaseBarSize,SecondLoad);
			
		}
		
		public function SecondLoad():void{
			CryptoBookImages = new CryptoBookEmbedded(this.assets,IncreaseBarSize,ThirdLoad);
			
			//QueensBookImages = new QueensBookEmbedded(this.assets,IncreaseBarSize,SecondLoad);
		}
		public function ThirdLoad():void{
			NoteBookOneImages = new NoteBookOneEmbedded(this.assets,IncreaseBarSize,ForthLoad);
		}
		
		//NoteBookTwoImages
		
		public function ForthLoad():void{
			NoteBookTwoImages = new NoteBookTwoEmbedded(this.assets,IncreaseBarSize,FiveLoad);
			
		}
		
		//MadMagImages
		
		public function FiveLoad():void{
			MadMagImages = new MadMagEmbedded(this.assets,IncreaseBarSize,SixthLoad);
		}
		
		public function SixthLoad():void{
			ContaimentCalibratorImages = new ContaimentCalibratorEmbedded(this.assets,IncreaseBarSize,SeventhLoad);
		}
		//ContainmentInteriorImages
		public function SeventhLoad():void{
			ContainmentInteriorImages = new ContainmentInteriorEmbedded(this.assets,IncreaseBarSize,EigthLoad);
		}
		
		public function EigthLoad():void{
			ContainmentQuantumImages = new ContainmentQuantumEmbedded(this.assets,IncreaseBarSize,NinthLoad);
		}
		public function NinthLoad():void{
			DeepLabDeskImages = new DeepLabDeskEmbedded(this.assets,IncreaseBarSize,TenthLoad);
		}
		//LiftImages
		
		public function TenthLoad():void{
			GreenHouseVenusImages = new GreenHouseVenusEmbedded(this.assets,IncreaseBarSize,EleventhLoad);
		}
		
		public function EleventhLoad():void{
			LiftImages = new LiftEmbedded(this.assets,IncreaseBarSize,TwelvethLoad);
		}
		public function TwelvethLoad():void{
			RocketRoomImages = new RocketRoomEmbedded(this.assets,IncreaseBarSize,ThirteenthLoad);
		}
		//RocketRoomImages
		public function ThirteenthLoad():void{
			IncreaseBarSize(true);
		}
		/*
		ContainmentQuantumImages
		ContaimentCalibratorImages
		public function ThirdLoad():void{
			IncreaseBarSize(true);
		}
		
		public function ThirdLoad():void{
			PirateTopDeckImages = new PirateTopDeckEmbedded(this.assets,IncreaseBarSize,ForthLoad);
		//	IncreaseBarSize(true);
		}
		public function ForthLoad():void{
			FarCoastDingyImages = new FarCoastDingyEmbedded(this.assets,IncreaseBarSize,FifthLoad);
			//	IncreaseBarSize(true);
		}
		public function FifthLoad():void{
			TriremeDeviceImages = new TriremeDeviceEmbedded(this.assets,IncreaseBarSize,SixthLoad);
			//	IncreaseBarSize(true);
		}
		//	public var SubmarineCaptainsImages:SubmarineCaptainsEmbedded;
		public function SixthLoad():void{
			//	FourDiscImages = new FourDiscEmbedded(this.assets,IncreaseBarSize,ThirdLoad);
			SubmarineCaptainsImages = new SubmarineCaptainsEmbedded(this.assets,IncreaseBarSize,SeventhLoad);
		}
		
		public function SeventhLoad():void{
			//	FourDiscImages = new FourDiscEmbedded(this.assets,IncreaseBarSize,ThirdLoad);
			TemplePascalImages = new TemplePascalEmbedded(this.assets,IncreaseBarSize,EigthLoad);
		}
		public function EigthLoad():void{
			//	FourDiscImages = new FourDiscEmbedded(this.assets,IncreaseBarSize,ThirdLoad);
			ChamberBlueNautilusImages = new ChamberBlueNautilusEmbedded(this.assets,IncreaseBarSize,NinthLoad);
		}
		public function NinthLoad():void{
			//	FourDiscImages = new FourDiscEmbedded(this.assets,IncreaseBarSize,ThirdLoad);
			IncreaseBarSize(true);
		}
		*/
		private function CreateLoadBar():void{
			LoadBar = new Shape();
			
			LoadBar.graphics.beginFill(0xffffff);
			LoadBar.graphics.lineTo(0,0);	
			LoadBar.graphics.lineTo(10,0);	
			LoadBar.graphics.lineTo(10,10);	
			LoadBar.graphics.lineTo(0,10);	
			
			
			LoadBar.graphics.endFill(false);
			LoadBar.alpha = 1;
			LoadBar.touchable = false;
			LoadBar.x = 195;
			LoadBar.y = 283+25;
			
			this.addChild(LoadBar);
			//	openBookbg.graphics.precisionHitTest = true;	
			trace("LOADBAR WIDTH: "+LoadBar.width);
			//LoadBar.width = 200;
			trace("LOADBAR WIDTH: "+LoadBar.width);
			
		//	OnLoadComplete();
		}
		
		public function IncreaseBarSize(complete:Boolean = false):void{
			trace("Incrementing");
			LoadBar.width = LoadBar.width+28;
			if(complete === true){
				OnLoadComplete();
			}
		}
		public function OnLoadComplete():void{
			LoadBar.width = 410;
			trace("Load Complete");
			(stage.getChildAt(0) as Object).SpinWheelImages = SpinWheelImages;
			(stage.getChildAt(0) as Object).CryptoBookImages = CryptoBookImages;
			(stage.getChildAt(0) as Object).NoteBookOneImages = NoteBookOneImages;
			(stage.getChildAt(0) as Object).NoteBookTwoImages = NoteBookTwoImages;
			(stage.getChildAt(0) as Object).MadMagImages = MadMagImages;
			(stage.getChildAt(0) as Object).ContaimentCalibratorImages = ContaimentCalibratorImages;
			(stage.getChildAt(0) as Object).ContainmentInteriorImages = ContainmentInteriorImages;
			(stage.getChildAt(0) as Object).ContainmentQuantumImages = ContainmentQuantumImages;
			(stage.getChildAt(0) as Object).DeepLabDeskImages = DeepLabDeskImages;
			(stage.getChildAt(0) as Object).GreenHouseVenusImages = GreenHouseVenusImages;
			(stage.getChildAt(0) as Object).LiftImages = LiftImages;
			(stage.getChildAt(0) as Object).RocketRoomImages = RocketRoomImages;
	
			delayedCall = new DelayedCall(function():void{
				(stage.getChildAt(0) as Object).screenStartUp.fadeOutCompany();
				fadeOut();
		//		(stage.getChildAt(0) as Object).addMainMenu(false);
			},1);
			Starling.juggler.add(delayedCall);
		}
		public function fadeOut():void{
			//	this.removeEventListener(TouchEvent.TOUCH,forceFadeOutCompany);
			FadeTween = new Tween(this, 2, Transitions.LINEAR);
			FadeTween.fadeTo(0);
			FadeTween.onComplete = function():void{
				DisposeOf();
			};
			Starling.juggler.add(FadeTween);			
		}
		public function DisposeOf():void{
			this.dispose();
		}
	}
}