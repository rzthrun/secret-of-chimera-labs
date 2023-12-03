package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
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
		
	public class ElevatorPanel extends Sprite
	{
		
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		public var SaveArray2:Array = new Array();
		
		private var bg:Image;
		
		private var lit_button:Image;
		private var label_3:Image;
		private var label_2:Image;
		private var label_1:Image;
		
		private var hit_button_01:Shape;
		private var hit_button_02:Shape;
		private var hit_button_03:Shape;
		
		private var hit_screen_01:Shape;
		private var hit_screen_02:Shape;
		private var hit_screen_03:Shape;
		
		private var CurrentFloor:int = 1;
		private var Animating:Boolean = false;
		private var ElevatorWorking:Boolean = false;
		
		private var RONum:int = 0;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
			
		
		public function ElevatorPanel(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('elevatorPanel_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ElevatorPanel/elevatorPanel_bg.jpg'));
				game.TrackAssets('elevatorPanel_01');
			}
			if(game.CheckAsset('elevatorPanel_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ElevatorPanel/ElevatorPanel_Sprite_01.png'));
				game.TrackAssets('elevatorPanel_02');
			}
			if(game.CheckAsset('elevatorPanel_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ElevatorPanel/ElevatorPanel_Sprite_01.xml'));
				game.TrackAssets('elevatorPanel_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ElevatorPanel","ElevatorPanelObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('elevatorPanel_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			lit_button = new Image(this.assets.getTexture('buttons_on'));
			lit_button.touchable = false;
			lit_button.x = 158;
			lit_button.y = 51;
			
			label_3 = new Image(this.assets.getTexture('lable_1'));
			label_3.touchable = false;
			label_3.x = 311;
			label_3.y = 372;
			
			label_2 = new Image(this.assets.getTexture('lable_2'));
			label_2.touchable = false;
			label_2.x = 311;
			label_2.y = 228;
			
			label_1 = new Image(this.assets.getTexture('lable_3'));
			label_1.touchable = false;
			label_1.x = 311;
			label_1.y = 84;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorFuse['Solved'] == 'Yes'){
					ElevatorWorking = true;
					lit_button.alpha = 1;
					label_3.alpha = 1;
					label_2.alpha = 1;
					label_1.alpha = 1;
				}else{
					
					lit_button.alpha = 0;
					label_3.alpha = 0;
					label_2.alpha = 0;
					label_1.alpha = 0;
				}
			}else{
				
				lit_button.alpha = 0;
				label_3.alpha = 0;
				label_2.alpha = 0;
				label_1.alpha = 0;
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel['Floor'] != undefined){
					CurrentFloor = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel['Floor'];
				}
			}
			
			this.addChildAt(lit_button,1);
			this.addChildAt(label_3,2);
			this.addChildAt(label_2,3);
			this.addChildAt(label_1,4);
			
			CreateScreenHits();
			CreateButtonHits();
			
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
		//	CurrentFloor = 1;
		//	ElevatorWorking = true;
		}
		/*
		CreateScreenHits();
		
		private var hit_screen_01:Shape;
		private var hit_screen_02:Shape;
		private var hit_screen_03:Shape;
		
		*/
		private function CreateScreenHits():void{
			hit_screen_01 = new Shape();
			hit_screen_01.touchable = false;
			hit_screen_01.graphics.beginFill(0x00ff00);
			
			hit_screen_01.graphics.lineTo(283,50);	
			hit_screen_01.graphics.lineTo(644,52);	
			hit_screen_01.graphics.lineTo(636,140);	
			hit_screen_01.graphics.lineTo(283,138);	
			
			hit_screen_01.graphics.endFill(false);
			hit_screen_01.alpha = 0.0;
			
			hit_screen_01.graphics.precisionHitTest = true;	
			
			
			hit_screen_02 = new Shape();
			hit_screen_02.touchable = false;
			hit_screen_02.graphics.beginFill(0x00ff00);
			
			hit_screen_02.graphics.lineTo(278,197);	
			hit_screen_02.graphics.lineTo(640,199);	
			hit_screen_02.graphics.lineTo(636,281);	
			hit_screen_02.graphics.lineTo(280,280);	
			
			hit_screen_02.graphics.endFill(false);
			hit_screen_02.alpha = 0.0;
			
			hit_screen_02.graphics.precisionHitTest = true;	
						
			
			hit_screen_03 = new Shape();
			hit_screen_03.touchable = false;
			hit_screen_03.graphics.beginFill(0x00ff00);
			
			hit_screen_03.graphics.lineTo(282,339);	
			hit_screen_03.graphics.lineTo(635,345);	
			hit_screen_03.graphics.lineTo(635,426);	
			hit_screen_03.graphics.lineTo(276,425);	
			
			hit_screen_03.graphics.endFill(false);
			hit_screen_03.alpha = 0.0;
			
			hit_screen_03.graphics.precisionHitTest = true;	
			
			this.addChild(hit_screen_01);
			this.addChild(hit_screen_02);
			this.addChild(hit_screen_03);
		}
		private function CreateButtonHits():void{
			hit_button_01 = new Shape();
			hit_button_01.touchable = false;
			hit_button_01.graphics.beginFill(0x00ff00);
			
			hit_button_01.graphics.lineTo(132,326);	
			hit_button_01.graphics.lineTo(268,326);	
			hit_button_01.graphics.lineTo(268,455);	
			hit_button_01.graphics.lineTo(132,455);	
			
			hit_button_01.graphics.endFill(false);
			hit_button_01.alpha = 0.0;
			
			hit_button_01.graphics.precisionHitTest = true;	
			this.addChild(hit_button_01);
			
			
			hit_button_02 = new Shape();
			hit_button_02.touchable = false;
			hit_button_02.graphics.beginFill(0xff0000);
			
			hit_button_02.graphics.lineTo(146,183);	
			hit_button_02.graphics.lineTo(266,183);	
			hit_button_02.graphics.lineTo(266,304);	
			hit_button_02.graphics.lineTo(146,304);	
			
			hit_button_02.graphics.endFill(false);
			hit_button_02.alpha = 0.0;
			
			hit_button_02.graphics.precisionHitTest = true;	
			this.addChild(hit_button_02);
			
			hit_button_03 = new Shape();
			hit_button_03.touchable = false;
			hit_button_03.graphics.beginFill(0x0000ff);
			
			hit_button_03.graphics.lineTo(147,33);	
			hit_button_03.graphics.lineTo(266,33);	
			hit_button_03.graphics.lineTo(266,163);	
			hit_button_03.graphics.lineTo(147,163);	
			
			hit_button_03.graphics.endFill(false);
			hit_button_03.alpha = 0.0;
			
			hit_button_03.graphics.precisionHitTest = true;	
			this.addChild(hit_button_03);
			
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
							FadeOut((Elevator as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ElevatorObj,true
							);
						}else if(hit_button_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(ElevatorWorking === false){
								BrokenButtonHandler();
							}else{
								if(CurrentFloor != 1){
									ButtonHandler(1);
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'm currently on the lobby level.");	
								}
							}
							
						}else if(hit_button_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(ElevatorWorking === false){
								BrokenButtonHandler();
							}else{
								if(CurrentFloor != 2){
									ButtonHandler(2);
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'm currently on the second floor.");	
								}
							}
							
							
						}else if(hit_button_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(ElevatorWorking === false){
								BrokenButtonHandler();
							}else{
								if(CurrentFloor != 3){
									ButtonHandler(3);
								}else{
									(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I'm currently on the third floor.");	
								}
							}
						}else if(hit_screen_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(ElevatorWorking === false){
								BrokenScreenHandler();
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'Botany / Genetics'");
							}
						}else if(hit_screen_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(ElevatorWorking === false){
								BrokenScreenHandler();
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'Robotics / AI'");
							}
						}else if(hit_screen_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(ElevatorWorking === false){
								BrokenScreenHandler();
							}else{
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'Lobby'");
							}
						}
					}
				}
			}
		}
		
		private function BrokenScreenHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The screen is off.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There is a blank display behind a thick piece of plexiglass.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Nothing on the elevator panel seems to be switched on.");
			}
		}
		
		private function BrokenButtonHandler():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
			if(RONum == 0){
				RONum = 1;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("hmmm... seems like the elevator is switched off.");
			}else if(RONum == 1){
				RONum = 2;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The button seems to be dead.");
			}else if(RONum == 2){
				RONum = 0;
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Nothing happens when I press any of the buttons.");
			}
		
		}
		
		private function ButtonHandler(buttonNum:int):void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
			Animating = true;
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel;
			}
			SaveArray['PrevFloor'] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ElevatorPanel['Floor'];
			SaveArray['Floor'] = buttonNum;
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ElevatorPanel',SaveArray);
			
			
			Starling.juggler.delayCall(RunFloorChange,1)
			
		}
		
		private function RunFloorChange():void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ElevatorMove();
			FadeOut((Elevator as Class), 
				(stage.getChildAt(0) as Object).screenGamePlayHandler.ElevatorObj,true
			);
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
			
			
			
			this.assets.removeTexture("elevatorPanel_bg",true);
			
			//	this.assets.removeTextureAtlas("Raft_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("elevatorPanel_01");
			
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