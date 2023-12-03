package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Shape;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;
	
	
	public class OfficeComputer extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var hightlight_pal:Image;
		private var hightlight_korpus:Image; 
		private var hightlight_herc:Image;
		private var hightlight_adimm:Image;
		
		private var knub_00:Image;
		private var knub_01:Image;
		private var knub_02:Image;
		private var knub_03:Image;
		
		private var picture:Image;
		
		private var hit_adimm:Shape;
		private var hit_herc:Shape;
		private var hit_korpus:Shape;
		private var hit_pal:Shape;
		
		private var hit_control:Shape;
		private var hit_picture:Shape;
		
		private var RONum:int;
		
		private var currentPage:String = 'adimm';
		
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function OfficeComputer(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('officeComputer_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeComputer/officeComputer_bg.jpg'));
				game.TrackAssets('officeComputer_01');
			}
			if(game.CheckAsset('officeComputer_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeComputer/OfficeComputer_Sprite_01.png'));
				game.TrackAssets('officeComputer_02');
			}
			if(game.CheckAsset('officeComputer_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/OfficeComputer/OfficeComputer_Sprite_01.xml'));
				game.TrackAssets('officeComputer_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("OfficeComputer","OfficeComputerObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
	
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('officeComputer_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			knub_00 = new Image(this.assets.getTexture('knub_00'));
			knub_00.touchable = false;
			knub_00.x = 265;
			knub_00.y = 100;
			
			knub_01 = new Image(this.assets.getTexture('knub_01'));
			knub_01.touchable = false;
			knub_01.x = 264;
			knub_01.y = 176;
			
			knub_02 = new Image(this.assets.getTexture('knub_02'));
			knub_02.touchable = false;
			knub_02.x = 265;
			knub_02.y = 254;
			
			knub_03 = new Image(this.assets.getTexture('knub_03'));
			knub_03.touchable = false;
			knub_03.x = 264;
			knub_03.y = 332;
			
			hightlight_adimm = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_adimm.touchable = false;	
			hightlight_adimm.x = 28;
			hightlight_adimm.y = 97;
			
			hightlight_herc = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_herc.touchable = false;
			hightlight_herc.x = 28;
			hightlight_herc.y = 175;
			
			hightlight_korpus = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_korpus.touchable = false;
			hightlight_korpus.x = 28;
			hightlight_korpus.y = 254;
			
			hightlight_pal = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_pal.touchable = false;
			hightlight_pal.x = 28;
			hightlight_pal.y = 331;
			
			picture = new Image(this.assets.getTexture('adimm'));
			picture.touchable = false;
			picture.x = 304;
			picture.y = 66;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer['currentPage'] == 'adimm'){
					currentPage = "adimm";
					knub_00.alpha = 1;
					knub_01.alpha = 0;
					knub_02.alpha = 0;
					knub_03.alpha = 0;
					
					hightlight_adimm.alpha = 1;
					hightlight_herc.alpha = 0;
					hightlight_korpus.alpha = 0;
					hightlight_pal.alpha = 0;							
					picture.texture = this.assets.getTexture('adimm');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer['currentPage'] == 'herc_00'){
					currentPage = "herc_00";
					knub_00.alpha = 0;
					knub_01.alpha = 1;
					knub_02.alpha = 0;
					knub_03.alpha = 0;
					
					hightlight_adimm.alpha = 0;
					hightlight_herc.alpha = 1;
					hightlight_korpus.alpha = 0;
					hightlight_pal.alpha = 0;							
					picture.texture = this.assets.getTexture('herc_00');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer['currentPage'] == 'herc_01'){
					currentPage = "herc_01";
					knub_00.alpha = 0;
					knub_01.alpha = 1;
					knub_02.alpha = 0;
					knub_03.alpha = 0;
					
					hightlight_adimm.alpha = 0;
					hightlight_herc.alpha = 1;
					hightlight_korpus.alpha = 0;
					hightlight_pal.alpha = 0;							
					picture.texture = this.assets.getTexture('herc_01');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer['currentPage'] == 'korpus'){
					currentPage = "korpus";
					knub_00.alpha = 0;
					knub_01.alpha = 0;
					knub_02.alpha = 1;
					knub_03.alpha = 0;
					
					hightlight_adimm.alpha = 0;
					hightlight_herc.alpha = 0;
					hightlight_korpus.alpha = 1;
					hightlight_pal.alpha = 0;							
					picture.texture = this.assets.getTexture('korpus');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer['currentPage'] == 'pal_00'){
					currentPage = "pal_00";
					knub_00.alpha = 0;
					knub_01.alpha = 0;
					knub_02.alpha = 0;
					knub_03.alpha = 1;
					
					hightlight_adimm.alpha = 0;
					hightlight_herc.alpha = 0;
					hightlight_korpus.alpha = 0;
					hightlight_pal.alpha = 1;							
					picture.texture = this.assets.getTexture('pal_00');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer['currentPage'] == 'pal_01'){
					currentPage = "pal_01";
					knub_00.alpha = 0;
					knub_01.alpha = 0;
					knub_02.alpha = 0;
					knub_03.alpha = 1;
					
					hightlight_adimm.alpha = 0;
					hightlight_herc.alpha = 0;
					hightlight_korpus.alpha = 0;
					hightlight_pal.alpha = 1;							
					picture.texture = this.assets.getTexture('pal_01');
				}else{
					knub_00.alpha = 1;
					knub_01.alpha = 0;
					knub_02.alpha = 0;
					knub_03.alpha = 0;
					
					hightlight_adimm.alpha = 1;
					hightlight_herc.alpha = 0;
					hightlight_korpus.alpha = 0;
					hightlight_pal.alpha = 0;
				}
			}else{
				knub_00.alpha = 1;
				knub_01.alpha = 0;
				knub_02.alpha = 0;
				knub_03.alpha = 0;
				
				hightlight_adimm.alpha = 1;
				hightlight_herc.alpha = 0;
				hightlight_korpus.alpha = 0;
				hightlight_pal.alpha = 0;
			}
			
			
		
			
			picture.alpha = 1;
			
			this.addChildAt(knub_00,1);
			this.addChildAt(knub_01,2);
			this.addChildAt(knub_02,3);
			this.addChildAt(knub_03,4);			
			
			this.addChildAt(hightlight_adimm,5)
			this.addChildAt(hightlight_herc,6)
			this.addChildAt(hightlight_korpus,7)	
			this.addChildAt(hightlight_pal,8)
			
			this.addChildAt(picture,9)
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			CreatePalHit();
			CreateKorpusHit();
			CreateHercHit();
			CreateAdimmHit();
			CreateControlHit();
			CreatePictureHit();
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
		}
		private function CreateControlHit():void{
			hit_control = new Shape();
			hit_control.touchable = false;
			hit_control.graphics.beginFill(0xff0000);
			
			hit_control.graphics.lineTo(578,63);	
			hit_control.graphics.lineTo(669,63);	
			hit_control.graphics.lineTo(670,116);	
			hit_control.graphics.lineTo(581,112);	
			
			hit_control.graphics.endFill(false);
			hit_control.alpha = 0.0;
			
			hit_control.graphics.precisionHitTest = true;	
			this.addChild(hit_control);
		}
		
		private function CreatePictureHit():void{
			hit_picture = new Shape();
			hit_picture.touchable = false;
			hit_picture.graphics.beginFill(0xff0000);
			
			hit_picture.graphics.lineTo(323,67);	
			hit_picture.graphics.lineTo(654,64);	
			hit_picture.graphics.lineTo(755,127);	
			hit_picture.graphics.lineTo(751,384);	
			hit_picture.graphics.lineTo(591,458);	
			hit_picture.graphics.lineTo(326,456);	
			
			hit_picture.graphics.endFill(false);
			hit_picture.alpha = 0.0;
			
			hit_picture.graphics.precisionHitTest = true;	
			this.addChild(hit_picture);
		}
		
		private function CreatePalHit():void{
			hit_pal = new Shape();
			hit_pal.touchable = false;
			hit_pal.graphics.beginFill(0xff0000);
			
			hit_pal.graphics.lineTo(21,325);	
			hit_pal.graphics.lineTo(270,325);	
			hit_pal.graphics.lineTo(270,385);	
			hit_pal.graphics.lineTo(21,385);	
			
			hit_pal.graphics.endFill(false);
			hit_pal.alpha = 0.0;
			
			hit_pal.graphics.precisionHitTest = true;	
			this.addChild(hit_pal);
		}
		
		private function CreateKorpusHit():void{
			hit_korpus = new Shape();
			hit_korpus.touchable = false;
			hit_korpus.graphics.beginFill(0xff0000);
			
			hit_korpus.graphics.lineTo(21,247);	
			hit_korpus.graphics.lineTo(270,247);	
			hit_korpus.graphics.lineTo(269,308);	
			hit_korpus.graphics.lineTo(21,309);	
			
			hit_korpus.graphics.endFill(false);
			hit_korpus.alpha = 0.0;
			
			hit_korpus.graphics.precisionHitTest = true;	
			this.addChild(hit_korpus);
		}
		
		private function CreateHercHit():void{
			hit_herc = new Shape();
			hit_herc.touchable = false;
			hit_herc.graphics.beginFill(0xff0000);
			
			hit_herc.graphics.lineTo(23,170);	
			hit_herc.graphics.lineTo(269,169);	
			hit_herc.graphics.lineTo(266,228);	
			hit_herc.graphics.lineTo(22,228);	
			
			hit_herc.graphics.endFill(false);
			hit_herc.alpha = 0.0;
			
			hit_herc.graphics.precisionHitTest = true;	
			this.addChild(hit_herc);
		}
		private function CreateAdimmHit():void{
			hit_adimm = new Shape();
			hit_adimm.touchable = false;
			hit_adimm.graphics.beginFill(0xff0000);
			
			hit_adimm.graphics.lineTo(22,93);	
			hit_adimm.graphics.lineTo(266,92);	
			hit_adimm.graphics.lineTo(268,151);	
			hit_adimm.graphics.lineTo(23,151);	
			
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
							if(currentPage == 'adimm'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								AdimmHandler();
								currentPage = 'adimm';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer;
								}
								SaveArray['currentPage'] = 'adimm';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeComputer',SaveArray);
							}
						}else if(hit_herc.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'herc_00'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else if(currentPage == 'herc_01'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();	
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								HercHandler();
								currentPage = 'herc_00';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer;
								}
								SaveArray['currentPage'] = 'herc_00';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeComputer',SaveArray);
							}
						}else if(hit_korpus.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'korpus'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('korpy');
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								KorpusHandler();
								currentPage = 'korpus';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer;
								}
								SaveArray['currentPage'] = 'korpus';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeComputer',SaveArray);
							}
						}else if(hit_pal.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'pal_00'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else if(currentPage == 'pal_01'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();	
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								PalHandler();
								currentPage = 'pal_00';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer;
								}
								SaveArray['currentPage'] = 'pal_00';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeComputer',SaveArray);
							}
						}else if(currentPage == 'herc_00'){
							if(hit_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('hercy');
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								picture.texture = this.assets.getTexture('herc_01');
								currentPage = 'herc_01';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer;
								}
								SaveArray['currentPage'] = 'herc_01';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeComputer',SaveArray);
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}else if(currentPage == 'herc_01'){
							if(hit_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								picture.texture = this.assets.getTexture('herc_00');
								currentPage = 'herc_00';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer;
								}
								SaveArray['currentPage'] = 'herc_00';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeComputer',SaveArray);
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}else if(currentPage == 'pal_00'){
							if(hit_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								game.screenGamePlayHandler.NoteBookObj.AddToNoteBookSingle('pal');
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								picture.texture = this.assets.getTexture('pal_01');
								currentPage = 'pal_01';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer;
								}
								SaveArray['currentPage'] = 'pal_01';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeComputer',SaveArray);
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}else if(currentPage == 'pal_01'){
							if(hit_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								picture.texture = this.assets.getTexture('pal_00');
								currentPage = 'pal_00';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.OfficeComputer;
								}
								SaveArray['currentPage'] = 'pal_00';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('OfficeComputer',SaveArray);
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}
					}
				}
			}
		}
		
		private function PictureHandler():void{
		
			if(currentPage == 'adimm'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The diagram appears to describe a sort of artificial brain.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Hmm... so this structure has as many, or nearly as many, connections as there are within the human brain?");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder what the cube's personality is like.");
				}
			}else if(currentPage == 'herc_00'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Design specifications for a six-legged robot.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Kinda cute, in a spider crab hybrid monster sort of way.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'Hercules.'");
				}
			}else if(currentPage == 'herc_01'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The diagram discusses the power supply for the Hercules robot.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I think this robot was designed for search and rescue, maybe construction.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The 'Manti-Core' is located under the primary access shield...");
				}
			}else if(currentPage == 'korpus'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("KORPUS: Kinetic Operation Process Utility System...");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Design specifications for a humanoid bipedal robot.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The 'Manti-Core' power supply is placed in the chest cavity of the robot.");
				}
			}else if(currentPage == 'pal_00'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A engineering document about PAL, or Patterning Algorithm.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("PAL appears to be both a set of hardware and software.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("PAL is a hardware based pattern recognition system ?");
				}
			}else if(currentPage == 'pal_01'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("This must be some of the sample data PAL has been working with.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("PAL seems to be able to identify at least three distinct solid forms.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Spheres, and Cylinders, and Cubes... Oh my!");
				}
			}
		}
		
		private function PalHandler():void{
			knub_00.alpha = 0;
			knub_01.alpha = 0;
			knub_02.alpha = 0;
			knub_03.alpha = 1;
			
			hightlight_adimm.alpha = 0;
			hightlight_herc.alpha = 0;
			hightlight_korpus.alpha = 0;
			hightlight_pal.alpha = 1;		
			
			picture.texture = this.assets.getTexture('pal_00');
			
		}
		
		private function KorpusHandler():void{
			knub_00.alpha = 0;
			knub_01.alpha = 0;
			knub_02.alpha = 1;
			knub_03.alpha = 0;
			
			hightlight_adimm.alpha = 0;
			hightlight_herc.alpha = 0;
			hightlight_korpus.alpha = 1;
			hightlight_pal.alpha = 0;		
			
			picture.texture = this.assets.getTexture('korpus');
			
		}
		
		
		private function HercHandler():void{
			knub_00.alpha = 0;
			knub_01.alpha = 1;
			knub_02.alpha = 0;
			knub_03.alpha = 0;
			
			hightlight_adimm.alpha = 0;
			hightlight_herc.alpha = 1;
			hightlight_korpus.alpha = 0;
			hightlight_pal.alpha = 0;		
			
			picture.texture = this.assets.getTexture('herc_00');
			
		}
		
		private function AdimmHandler():void{
			knub_00.alpha = 1;
			knub_01.alpha = 0;
			knub_02.alpha = 0;
			knub_03.alpha = 0;
			
			hightlight_adimm.alpha = 1;
			hightlight_herc.alpha = 0;
			hightlight_korpus.alpha = 0;
			hightlight_pal.alpha = 0;		
			
			picture.texture = this.assets.getTexture('adimm');
			
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
			
			
			
			this.assets.removeTexture("officeComputer_bg",true);
			this.assets.removeTexture("OfficeComputer_Sprite_01",true);
			this.assets.removeTextureAtlas("OfficeComputer_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("officeComputer_01");
			(stage.getChildAt(0) as Object).falseAsset("officeComputer_02");
			(stage.getChildAt(0) as Object).falseAsset("officeComputer_03");
			
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
