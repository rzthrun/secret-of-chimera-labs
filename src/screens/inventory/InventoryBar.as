package screens.inventory
{
	import starling.display.Image;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class InventoryBar extends Sprite
	{
		public var bg:Image;
		
		public var item_FuseRed:Image;
		public var item_FuseGreen:Image;
		public var item_FuseBlue:Image;
		public var item_Chains:Image;
		public var item_SprayCan:Image;
		public var item_PaperTowels:Image;
		public var item_Eyeglasses:Image;
		public var item_Stick:Image;
		public var item_CarKeys:Image;
		public var item_KeyCard:Image;
		public var item_Knob:Image;
		public var item_AllenWrench:Image;		
		public var item_Splat:Image;
		public var item_Controller:Image;
		public var item_Screwdriver:Image;
		public var item_SmallKey:Image;
		public var item_CubeDamage:Image;
		public var item_Cube:Image;
		public var item_Iodine:Image;
		public var item_SampleTweezers:Image;
		public var item_Claw:Image;
		public var item_Cord:Image;
		public var item_HDD:Image;
		public var item_KomaDial:Image;
		public var item_PowerSupply:Image;
		public var item_Eggplant:Image;
		public var item_PushBox:Image;
		
		public var item_Tongs:Image;
		
		public var item_Drill:Image;
		public var item_Metal:Image;
		public var item_BoltCutters:Image;
		public var item_GasMask:Image;
		
		public var item_Ethernet:Image;
		
		public var item_LabTongs:Image;
		public var item_Jar:Image;
		public var item_JarFull:Image;
		public var item_JarFullRock:Image;
		public var item_JarFullIodine:Image;
		public var item_JarFullRockIodine:Image;
		public var item_JarRock:Image;
		public var item_JarRockIodine:Image;
		public var item_JarIodine:Image;
	
//		public var item_LabTongsJar:Image;
//		public var item_LabTongsAcid:Image;
		public var item_SamplePipette:Image;
		
		public var item_Chisel:Image;
		
		public var item_Injector:Image;
		public var item_InjectorFull:Image;
		public var item_DNAJar:Image;
				
		public var item_BookAsimov:Image;
		public var item_BookClarke:Image;
		public var item_BookSagan:Image;
		public var item_BookHeinlein:Image;
		
		public var item_TubeEmpty:Image;
		public var item_TubeBlue:Image;
		public var item_TubeRed:Image;
		
		public var item_Cell:Image;
		public var item_CellFull:Image;
		public var item_RedRock:Image;
		
		public var item_CoffeePot:Image;
		public var item_CoffeePotFull:Image;
		
		public var item_BottleG:Image;
		public var item_BottleC:Image;
		
		public var item_TestTube:Image;
		public var item_TestTubeHalf:Image;
		
		public var item_Crowbar:Image;
		public var item_Handler:Image;
		
		public var item_HandlerCup:Image;
		
		public var item_Orb:Image;
		
		public var item_StoneOne:Image;
		public var item_StoneTwo:Image;
		public var item_StoneThree:Image;
		
		public var item_PearlRed:Image;
		public var item_PearlBlue:Image;
		public var item_PearlGreen:Image;
		
		public var item_SampleNails:Image;
		public var item_TinyDriver:Image;
		
		public var item_Lens:Image;
		
		public var item_Syringe:Image;
		public var item_SyringeFull:Image;
			
		public var item_Slide:Image;
		
		public var item_Hand:Image;
		
		public var Set_01:Sprite;
		public var Set_02:Sprite;
		public var Set_03:Sprite;
		public var Set_04:Sprite;
		public var Set_05:Sprite;
		
		
		
		public var leftArrow:Image;
		public var hit_LeftArrow:Shape;
		public var rightArrow:Image;
		public var hit_RightArrow:Shape;
		
		
		public function InventoryBar()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			Set_01 = new Sprite();
			Set_02 = new Sprite();
			Set_03 = new Sprite();
			Set_04 = new Sprite();
			Set_05 = new Sprite();
			
			this.addChild(Set_01);
			Set_01.x = 70;
			Set_01.y = 18;
			Set_01.touchable = true;
			Set_01.alpha = 1;
			this.addChild(Set_02);
			Set_02.x = 70;
			Set_02.y = 18;
			Set_02.touchable = false;
			Set_02.alpha = 0;
			this.addChild(Set_03);
			Set_03.x = 70;
			Set_03.y = 18;
			Set_03.touchable = false;
			Set_03.alpha = 0;
			this.addChild(Set_04);
			Set_04.x = 70;
			Set_04.y = 18;
			Set_04.touchable = false;
			Set_04.alpha = 0;
			this.addChild(Set_05);
			Set_05.x = 70;
			Set_05.y = 18;
			Set_05.touchable = false;
			Set_05.alpha = 0;
			

		}
		private function onAddedToStage(e:Event):void{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);

		}
		public function addBg(_bg:Image):void{
			bg = _bg;
			this.addChildAt(bg,0);
		}
		public function addLeftArrow(_arrow:Image):void{
			leftArrow = _arrow;
			
			leftArrow.x = 20;
			leftArrow.y = 18;
			leftArrow.touchable = false;
			this.addChildAt(leftArrow,1);
			
			hit_LeftArrow = new Shape();
			addChildAt(hit_LeftArrow,2);
			hit_LeftArrow.graphics.beginFill(0x00FF00);
			hit_LeftArrow.graphics.lineTo(20,18);	
			hit_LeftArrow.graphics.lineTo(55,18);	
			hit_LeftArrow.graphics.lineTo(55,88);	
			hit_LeftArrow.graphics.lineTo(20,88);	
			hit_LeftArrow.touchable = false;
			hit_LeftArrow.graphics.endFill(false);
			hit_LeftArrow.alpha = 0.0;
			hit_LeftArrow.graphics.precisionHitTest = true;	
		}
		
		public function addRightArrow(_arrow:Image):void{
			rightArrow = _arrow;
			rightArrow.x = 500;
			rightArrow.y = 18;
			rightArrow.touchable = false;
			this.addChildAt(rightArrow,1);
			
			hit_RightArrow = new Shape();
			addChildAt(hit_RightArrow,2);
			hit_RightArrow.graphics.beginFill(0x00FF00);
			hit_RightArrow.graphics.lineTo(500,18);	
			hit_RightArrow.graphics.lineTo(535,18);	
			hit_RightArrow.graphics.lineTo(535,88);	
			hit_RightArrow.graphics.lineTo(500,88);	
			
			hit_RightArrow.graphics.endFill(false);
			hit_RightArrow.alpha = 0.0;
			hit_RightArrow.touchable = false;
			hit_RightArrow.graphics.precisionHitTest = true;	
		}
		
		public function addItem(item,itemName,currentSet):void{
			this[itemName] = item;
			if(currentSet == 1){
				this.Set_01.addChild(item);
				Set_01.touchable = true;
				Set_01.alpha = 1;
				Set_02.touchable = false;
				Set_02.alpha = 0;
				Set_03.touchable = false;
				Set_03.alpha = 0;
				Set_04.touchable = false;
				Set_04.alpha = 0;
				Set_05.touchable = false;
				Set_05.alpha = 0;
			}
			if(currentSet == 2){
				this.Set_02.addChild(item);
				Set_01.touchable = false;
				Set_01.alpha = 0;
				Set_02.touchable = true;
				Set_02.alpha = 1;
				Set_03.touchable = false;
				Set_03.alpha = 0;
				Set_04.touchable = false;
				Set_04.alpha = 0;
				Set_05.touchable = false;
				Set_05.alpha = 0;
			}
			if(currentSet == 3){
				this.Set_03.addChild(item);
				Set_01.touchable = false;
				Set_01.alpha = 0;
				Set_02.touchable = false;
				Set_02.alpha = 0;
				Set_03.touchable = true;
				Set_03.alpha = 1;
				Set_04.touchable = false;
				Set_04.alpha = 0;
				Set_05.touchable = false;
				Set_05.alpha = 0;
			}
			if(currentSet == 4){
				this.Set_04.addChild(item);
				Set_01.touchable = false;
				Set_01.alpha = 0;
				Set_02.touchable = false;
				Set_02.alpha = 0;
				Set_03.touchable = false;
				Set_03.alpha = 0;
				Set_04.touchable = true;
				Set_04.alpha = 1;
				Set_05.touchable = false;
				Set_05.alpha = 0;
			}
			if(currentSet == 5){
				this.Set_05.addChild(item);
				Set_01.touchable = false;
				Set_01.alpha = 0;
				Set_02.touchable = false;
				Set_02.alpha = 0;
				Set_03.touchable = false;
				Set_03.alpha = 0;
				Set_04.touchable = false;
				Set_04.alpha = 0;
				Set_05.touchable = true;
				Set_05.alpha = 1;
			}
		}
		public function removeItem(item,itemName,currentSet):void{
			this["Set_0"+currentSet].removeChild(item);
			
			
		}
		
	}
}