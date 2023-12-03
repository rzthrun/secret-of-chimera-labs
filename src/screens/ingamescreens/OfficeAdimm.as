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

	public class OfficeAdimm extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var hit_adimm:Shape;
		private var hit_head:Shape;
		private var hit_cube:Shape;
		private var hit_mpp:Shape;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;	
		
		public function OfficeAdimm(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('officeAdimm_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeAdimm/officeAdimm_bg.jpg'));
				game.TrackAssets('officeAdimm_01');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("OfficeAdimm","OfficeAdimmObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('officeAdimm_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			//	CreateElevatorDoorHit();
		//	CreateSpinWheelHit();
			CreateAdimmHit();
			CreateHeadit();
			CreateCubeit();
			CreateMPPHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
		//	(stage.getChildAt(0) as Object).AmbientObj.soundManager.tweenVolumeComplex("Dread",0,0.5,'stop');
			(stage.getChildAt(0) as Object).AmbientObj.LoadDread(true,999);
			
			game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('adimmzzz');
			
		}
	
		private function CreateMPPHit():void{
			hit_mpp = new Shape();
			hit_mpp.touchable = false;
			hit_mpp.graphics.beginFill(0xff0000);
			
			hit_mpp.graphics.lineTo(131,211);			
			hit_mpp.graphics.lineTo(206,181);			
			hit_mpp.graphics.lineTo(311,250);			
			hit_mpp.graphics.lineTo(360,437);			
			hit_mpp.graphics.lineTo(360,437);			
			hit_mpp.graphics.lineTo(136,470);			
			
			hit_mpp.graphics.endFill(false);
			hit_mpp.alpha = 0.0;
			
			hit_mpp.graphics.precisionHitTest = true;	
			this.addChild(hit_mpp);
		}
		
		private function CreateCubeit():void{
			hit_cube = new Shape();
			hit_cube.touchable = false;
			hit_cube.graphics.beginFill(0xff0000);
			
			hit_cube.graphics.lineTo(298,159);			
			hit_cube.graphics.lineTo(375,118);			
			hit_cube.graphics.lineTo(460,155);			
			hit_cube.graphics.lineTo(456,238);			
			hit_cube.graphics.lineTo(395,298);			
			hit_cube.graphics.lineTo(310,248);			
			
			hit_cube.graphics.endFill(false);
			hit_cube.alpha = 0.0;
			
			hit_cube.graphics.precisionHitTest = true;	
			this.addChild(hit_cube);
		}
		
		private function CreateHeadit():void{
			hit_head = new Shape();
			hit_head.touchable = false;
			hit_head.graphics.beginFill(0xff0000);
			
			hit_head.graphics.lineTo(443,280);	
			hit_head.graphics.lineTo(496,37);	
			hit_head.graphics.lineTo(621,35);	
			hit_head.graphics.lineTo(696,220);	
			hit_head.graphics.lineTo(583,388);	
		
			hit_head.graphics.endFill(false);
			hit_head.alpha = 0.0;
			
			hit_head.graphics.precisionHitTest = true;	
			this.addChild(hit_head);
		}
		
		private function CreateAdimmHit():void{
			hit_adimm = new Shape();
			hit_adimm.touchable = false;
			hit_adimm.graphics.beginFill(0xff0000);
			
			hit_adimm.graphics.lineTo(129,31);	
			hit_adimm.graphics.lineTo(363,31);	
			hit_adimm.graphics.lineTo(355,84);	
			hit_adimm.graphics.lineTo(281,108);	
			hit_adimm.graphics.lineTo(123,110);	
		
			hit_adimm.graphics.endFill(false);
			hit_adimm.alpha = 0.0;
			
			hit_adimm.graphics.precisionHitTest = true;	
			this.addChild(hit_adimm);
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
							FadeOut((OfficeDraftsman as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.OfficeDraftsmanObj,true
							);
						}else if(hit_adimm.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'Advanced Digital Intellect & Memory Module.'");	
						}else if(hit_head.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The rendering refers to the head as a 'Brain Case'");	
						}else if(hit_cube.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I believe the cube is the ADIMM unit, a sort of artificial brain.");	
						}else if(hit_mpp.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Magnetic Pulse Programmer... I think this device is used to install programs onto the artificial brain...");
						}
						
						/*
						private var hit_adimm:Shape;
						private var hit_head:Shape;
						private var hit_cube:Shape;
						private var hit_mpp:Shape;
						*/
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
			
			
			
			this.assets.removeTexture("officeAdimm_bg",true);
			
			//	this.assets.removeTextureAtlas("Raft_Sprite",true);
			
			(stage.getChildAt(0) as Object).falseAsset("officeAdimm_01");
			
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

