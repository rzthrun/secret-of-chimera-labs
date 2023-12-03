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
	
	
	public class BuildingOfficeComputer extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var hightlight_proposal:Image;
		private var hightlight_contaiment:Image;
		private var hightlight_accelerator:Image;		
		private var hightlight_memo:Image;		
		
		private var knub_00:Image;
		private var knub_01:Image;
		private var knub_02:Image;
		private var knub_03:Image;
		private var picture:Image;
		
		private var hit_proposal:Shape;
		private var hit_contaiment:Shape;
		private var hit_accelerator:Shape;
		private var hit_memo:Shape;
		private var hit_prop_control:Shape;		
		private var hit_picture:Shape;
		
		private var RONum:int;

		private var currentPage:String = 'proposal00';
		
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function BuildingOfficeComputer(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('buildingOfficeComputer_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeComputer/buildingOfficeComputer_bg.jpg'));
				game.TrackAssets('buildingOfficeComputer_01');
			}
			if(game.CheckAsset('buildingOfficeComputer_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeComputer/BuildingOfficeComputer_Sprite_01.png'));
				game.TrackAssets('buildingOfficeComputer_02');
			}
			if(game.CheckAsset('buildingOfficeComputer_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeComputer/BuildingOfficeComputer_Sprite_01.xml'));
				game.TrackAssets('buildingOfficeComputer_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BuildingOfficeComputer","BuildingOfficeComputerObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('buildingOfficeComputer_bg'));
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
			
			hightlight_proposal = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_proposal.touchable = false;	
			hightlight_proposal.x = 28;
			hightlight_proposal.y = 97;
			
			hightlight_contaiment = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_contaiment.touchable = false;
			hightlight_contaiment.x = 28;
			hightlight_contaiment.y = 175;
			
			hightlight_accelerator = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_accelerator.touchable = false;
			hightlight_accelerator.x = 28;
			hightlight_accelerator.y = 254;
			
			hightlight_memo = new Image(this.assets.getTexture('highlight_rect'));
			hightlight_memo.touchable = false;
			hightlight_memo.x = 28;
			hightlight_memo.y = 331;
			
			picture = new Image(this.assets.getTexture('horizon_page_00'));
			picture.touchable = false;
			picture.x = 304;
			picture.y = 61;
			/*
			private var knub_00:Image;
			private var knub_01:Image;
			private var knub_02:Image;
			private var knub_03:Image;
			private var picture:Image;
			
			private var hightlight_proposal:Image;
			private var hightlight_contaiment:Image;
			private var hightlight_accelerator:Image;		
			private var hightlight_memo:Image;		
			*/
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer['currentPage'] == 'proposal00'){
					currentPage = 'proposal00';
					knub_00.alpha = 1;
					knub_01.alpha = 0;
					knub_02.alpha = 0;
					knub_03.alpha = 0;
					
					hightlight_proposal.alpha = 1;
					hightlight_contaiment.alpha = 0;
					hightlight_accelerator.alpha = 0;
					hightlight_memo.alpha = 0;
					picture.texture = this.assets.getTexture('horizon_page_00');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer['currentPage'] == 'proposal01'){	
					currentPage = 'proposal00';
					knub_00.alpha = 1;
					knub_01.alpha = 0;
					knub_02.alpha = 0;
					knub_03.alpha = 0;
					
					hightlight_proposal.alpha = 1;
					hightlight_contaiment.alpha = 0;
					hightlight_accelerator.alpha = 0;
					hightlight_memo.alpha = 0;
					picture.texture = this.assets.getTexture('horizon_page_01');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer['currentPage'] == 'contaiment'){
					currentPage = 'contaiment';
					knub_00.alpha = 0;
					knub_01.alpha = 1;
					knub_02.alpha = 0;
					knub_03.alpha = 0;
					
					hightlight_proposal.alpha = 0;
					hightlight_contaiment.alpha = 1;
					hightlight_accelerator.alpha = 0;
					hightlight_memo.alpha = 0;
					picture.texture = this.assets.getTexture('page_containment');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer['currentPage'] == 'accelerator'){
					currentPage = 'accelerator';
					knub_00.alpha = 0;
					knub_01.alpha = 0;
					knub_02.alpha = 1;
					knub_03.alpha = 0;
					
					hightlight_proposal.alpha = 0;
					hightlight_contaiment.alpha = 0;
					hightlight_accelerator.alpha = 1;
					hightlight_memo.alpha = 0;
					picture.texture = this.assets.getTexture('page_accelerator');
				}else if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer['currentPage'] == 'memo'){
					currentPage = 'memo';
					knub_00.alpha = 0;
					knub_01.alpha = 0;
					knub_02.alpha = 1;
					knub_03.alpha = 0;
					
					hightlight_proposal.alpha = 0;
					hightlight_contaiment.alpha = 0;
					hightlight_accelerator.alpha = 1;
					hightlight_memo.alpha = 0;
					picture.texture = this.assets.getTexture('page_budget');
				
				}else{
					
					currentPage = 'proposal00';
					knub_00.alpha = 1;
					knub_01.alpha = 0;
					knub_02.alpha = 0;
					knub_03.alpha = 0;
					
					hightlight_proposal.alpha = 1;
					hightlight_contaiment.alpha = 0;
					hightlight_accelerator.alpha = 0;
					hightlight_memo.alpha = 0;
				}
			}else{
				knub_00.alpha = 1;
				knub_01.alpha = 0;
				knub_02.alpha = 0;
				knub_03.alpha = 0;
				
				hightlight_proposal.alpha = 1;
				hightlight_contaiment.alpha = 0;
				hightlight_accelerator.alpha = 0;
				hightlight_memo.alpha = 0;
			}
			
		

			picture.alpha = 1;
			
			this.addChildAt(knub_00,1);
			this.addChildAt(knub_01,2);
			this.addChildAt(knub_02,3);
			this.addChildAt(knub_03,4);			
			
			this.addChildAt(hightlight_proposal,5)
			this.addChildAt(hightlight_contaiment,6)
			this.addChildAt(hightlight_accelerator,7)	
			this.addChildAt(hightlight_memo,8)
		
			this.addChildAt(picture,9)
				
			CreateProposalHit();
			CreateContainmentHit();
			CreateAcceleratorHit();
			CreateMemoHit();
			CreatePictureHit();
			CreateMemoControlHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			game.screenGamePlayHandler.NoteBookObj.AddToNoteBookDouble('hori_page_00','hori_page_01');
		}
		
	
		private function CreateMemoControlHit():void{
			hit_prop_control = new Shape();
			hit_prop_control.touchable = false;
			hit_prop_control.graphics.beginFill(0xff0000);
			
			hit_prop_control.graphics.lineTo(578,63);	
			hit_prop_control.graphics.lineTo(669,63);	
			hit_prop_control.graphics.lineTo(670,116);	
			hit_prop_control.graphics.lineTo(581,112);	
			
			hit_prop_control.graphics.endFill(false);
			hit_prop_control.alpha = 0.0;
			
			hit_prop_control.graphics.precisionHitTest = true;	
			this.addChild(hit_prop_control);
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
		
		private function CreateMemoHit():void{
			hit_memo = new Shape();
			hit_memo.touchable = false;
			hit_memo.graphics.beginFill(0xff0000);
			
			hit_memo.graphics.lineTo(21,325);	
			hit_memo.graphics.lineTo(270,325);	
			hit_memo.graphics.lineTo(270,385);	
			hit_memo.graphics.lineTo(21,385);	
			
			hit_memo.graphics.endFill(false);
			hit_memo.alpha = 0.0;
			
			hit_memo.graphics.precisionHitTest = true;	
			this.addChild(hit_memo);
		}
		
		private function CreateAcceleratorHit():void{
			hit_accelerator = new Shape();
			hit_accelerator.touchable = false;
			hit_accelerator.graphics.beginFill(0xff0000);
			
			hit_accelerator.graphics.lineTo(21,247);	
			hit_accelerator.graphics.lineTo(270,247);	
			hit_accelerator.graphics.lineTo(269,308);	
			hit_accelerator.graphics.lineTo(21,309);	
			
			hit_accelerator.graphics.endFill(false);
			hit_accelerator.alpha = 0.0;
			
			hit_accelerator.graphics.precisionHitTest = true;	
			this.addChild(hit_accelerator);
		}
		
		private function CreateContainmentHit():void{
			hit_contaiment = new Shape();
			hit_contaiment.touchable = false;
			hit_contaiment.graphics.beginFill(0xff0000);
			
			hit_contaiment.graphics.lineTo(23,170);	
			hit_contaiment.graphics.lineTo(269,169);	
			hit_contaiment.graphics.lineTo(266,228);	
			hit_contaiment.graphics.lineTo(22,228);	
			
			hit_contaiment.graphics.endFill(false);
			hit_contaiment.alpha = 0.0;
			
			hit_contaiment.graphics.precisionHitTest = true;	
			this.addChild(hit_contaiment);
		}
		private function CreateProposalHit():void{
			hit_proposal = new Shape();
			hit_proposal.touchable = false;
			hit_proposal.graphics.beginFill(0xff0000);
			
			hit_proposal.graphics.lineTo(22,93);	
			hit_proposal.graphics.lineTo(266,92);	
			hit_proposal.graphics.lineTo(268,151);	
			hit_proposal.graphics.lineTo(23,151);	
		
			hit_proposal.graphics.endFill(false);
			hit_proposal.alpha = 0.0;
			
			hit_proposal.graphics.precisionHitTest = true;	
			this.addChild(hit_proposal);
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
							FadeOut((BuildingOfficeDesk as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficeDeskObj,true
							);
						}else if(hit_proposal.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'proposal00'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else if(currentPage == 'proposal01'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();	
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								ProposalHandler();
								currentPage = 'proposal00';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer;
								}
								SaveArray['currentPage'] = 'proposal';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeComputer',SaveArray);
							}
						}else if(hit_contaiment.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'contaiment'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								ContainmentHandler();
								currentPage = 'contaiment';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer;
								}
								SaveArray['currentPage'] = 'contaiment';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeComputer',SaveArray);
							}
						}else if(hit_accelerator.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'accelerator'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								AcceleratorHandler();
								currentPage = 'accelerator';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer;
								}
								SaveArray['currentPage'] = 'accelerator';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeComputer',SaveArray);
							}
						}else if(hit_memo.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentPage == 'memo'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
											
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								MemoHandler();
								currentPage = 'memo';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer;
								}
								SaveArray['currentPage'] = 'memo';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeComputer',SaveArray);
							}
						}else if(currentPage == 'proposal00'){
							if(hit_prop_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								picture.texture = this.assets.getTexture('horizon_page_01');
								currentPage = 'proposal01';
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer;
								}
								SaveArray['currentPage'] = 'proposal01';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeComputer',SaveArray);
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}else if(currentPage == 'proposal01'){
							if(hit_prop_control.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
									picture.texture = this.assets.getTexture('horizon_page_00');
									currentPage = 'proposal00';
									if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer != undefined){
										SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeComputer;
									}
									SaveArray['currentPage'] = 'proposal00';
									(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeComputer',SaveArray);
							}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PictureHandler();
							}
						}else if(hit_picture.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PictureHandler();
						}
						
					
					}
				}
			}
		}
		private function PictureHandler():void{
			if(currentPage == 'proposal00'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Dr. Von Awesome certainly thinks highly of the idea she describes.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The Horizon Machine has something to do with collapsing space-time");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder if this research is dangerous at all?");
				}
			}else if(currentPage == 'proposal01'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Dr. Von Awesome certainly thinks highly of the idea she describes.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The Horizon Machine has something to do with collapsing space-time");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I wonder if this research is dangerous at all?");
				}
			}else if(currentPage == 'contaiment'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It appears to be a diagram of some type of high-tech chamber.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Whatever it is, it looks like it's meant to contain something powerful.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Is this the Horizon Project?");
				}
			}else if(currentPage == 'accelerator'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It looks like some type of machine.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("It's hard to get a sense of scale from looking at the diagram.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Is this the Horizon Project?");
				}
			}else if(currentPage == 'memo'){
				if(RONum == 0){
					RONum = 1;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A schematic of a complex circuit.");	
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("There appears to be three possible positions for each switch.");	
				}else if(RONum == 2){
					RONum = 0;
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("'Containment Relaxation Circuit Configuration', hmmm... what does that mean?");
				}
			}	
		}
		
		private function MemoHandler():void{
			knub_00.alpha = 0;
			knub_01.alpha = 0;
			knub_02.alpha = 0;
			knub_03.alpha = 1;
			
			hightlight_proposal.alpha = 0;
			hightlight_contaiment.alpha = 0;
			hightlight_accelerator.alpha = 0;
			hightlight_memo.alpha = 1;		
			
			picture.texture = this.assets.getTexture('page_budget');
		}
		
		private function AcceleratorHandler():void{
			knub_00.alpha = 0;
			knub_01.alpha = 0;
			knub_02.alpha = 1;
			knub_03.alpha = 0;
			
			hightlight_proposal.alpha = 0;
			hightlight_contaiment.alpha = 0;
			hightlight_accelerator.alpha = 1;
			hightlight_memo.alpha = 0;		
			
			picture.texture = this.assets.getTexture('page_accelerator');
		}
		
		private function ContainmentHandler():void{
			knub_00.alpha = 0;
			knub_01.alpha = 1;
			knub_02.alpha = 0;
			knub_03.alpha = 0;
			
			hightlight_proposal.alpha = 0;
			hightlight_contaiment.alpha = 1;
			hightlight_accelerator.alpha = 0;
			hightlight_memo.alpha = 0;		
			
			picture.texture = this.assets.getTexture('page_containment');
		}
		
		private function ProposalHandler():void{
			knub_00.alpha = 1;
			knub_01.alpha = 0;
			knub_02.alpha = 0;
			knub_03.alpha = 0;
			
			hightlight_proposal.alpha = 1;
			hightlight_contaiment.alpha = 0;
			hightlight_accelerator.alpha = 0;
			hightlight_memo.alpha = 0;		
		
			picture.texture = this.assets.getTexture('horizon_page_00');
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
			
			
			
			this.assets.removeTexture("buildingOfficeComputer_bg",true);
			this.assets.removeTexture("BuildingOfficeComputer_Sprite_01",true);
			this.assets.removeTextureAtlas("BuildingOfficeComputer_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeComputer_01");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeComputer_02");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeComputer_03");
			
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
