package screens.notebook
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

	public class NoteBook extends Sprite
	{
		public var NotesArray:Array = new Array();
		private var SaveArray:Array = new Array();
		public var assets:AssetManager;
		
		public var NoteBookDetailsObj:NoteBookDetails;
		public var NoteBookDetailTween:Tween;
		public var noteBookButton:Image;
		private var noteBookTween:Tween;
		
		private var hit_left_arrow:Shape;
		private var hit_right_arrow:Shape;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;	
		
		public var game:Game;
		
		private var notebook_sprite:Sprite;
		
		public var goback:GoBackButton;
		private var arrow_left:Image;
		private var arrow_right:Image;
		
		public var inven_toggle:Image;
		
		public var currentPage:int = 0;
		
		public var SingleFlag:int = 0;
		
		public var Toggle:Boolean = false;
		public var animating:Boolean = false;
		
		
		public function NoteBook(_game:Game, _assets:AssetManager)
		{
			super();
			this.assets = _assets;
			this.game = _game;
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(e:Event):void{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			
			
			this.assets.loadQueue(function(n:Number):void{
		//		if(n==1){
					onLoadAssets();
		//		}				
			});						
		}
		private function onLoadAssets():void{
		//	CreateBg();
			notebook_sprite = new Sprite();
			notebook_sprite.alpha = 0;
			notebook_sprite.alpha = 0 ;
			notebook_sprite.x = 0;
			notebook_sprite.touchable = false;
			
			NoteBookDetailsObj = new NoteBookDetails(assets,this.game);
			NoteBookDetailsObj.alpha =1;
			
			goback = new GoBackButton(this.assets);	
			//	goback.alpha = 1;
		//	private var arrow_left:Image;
		//	private var arrow_right:Image;
			
			arrow_left = new Image(this.assets.getTexture('arrow_left_v001a002'));
			arrow_left.alpha =1 ;
			arrow_left.x = 0;
			arrow_left.y = 200;
			arrow_left.touchable = false;
			arrow_left.alpha = 1;
			
			
			arrow_right = new Image(this.assets.getTexture('arrow_right_v001a002'));
			arrow_right.alpha =1 ;
			arrow_right.x = 800-36;
			arrow_right.y = 200;
			arrow_right.touchable = false;
			arrow_right.alpha = 1;
			
			notebook_sprite.addChildAt(NoteBookDetailsObj,0);
			
			notebook_sprite.addChild(goback);
			notebook_sprite.addChild(arrow_left);
			notebook_sprite.addChild(arrow_right);
			
			noteBookButton = new Image(this.assets.getTexture('noteBook_icon'));
			noteBookButton.alpha =1 ;
			noteBookButton.x = 5;
			noteBookButton.y = 400;
			noteBookButton.touchable = false;
			noteBookButton.alpha = 1;
			
			inven_toggle = new Image(this.assets.getTexture('invenToggleClosed_v003a001'));
			inven_toggle.touchable = true;
			inven_toggle.x = 0;
			inven_toggle.y = 410;
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.NoteBook != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.NoteBook;
				NotesArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.NoteBook['NotesArray'];
				SingleFlag = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.NoteBook['SingleFlag'];
			}
			
			
			
			this.addChildAt(notebook_sprite,0);
			this.addChildAt(noteBookButton,1);
			this.addChildAt(inven_toggle,2);

			CreateLeftRightHits();
			
			this.addEventListener(TouchEvent.TOUCH,onClickHandler);	
			
			
		}		
		
		/*
		private var hit_left_arrow:Shape;
		private var hit_right_arrow:Shape;
		*/
		
		public function CreateLeftRightHits():void{
			hit_left_arrow = new Shape();
			hit_left_arrow.touchable = false;
			hit_left_arrow.graphics.beginFill(0xff0000);
			
			hit_left_arrow.graphics.lineTo(0,190);	
			hit_left_arrow.graphics.lineTo(46,190);	
			hit_left_arrow.graphics.lineTo(46,280);	
			hit_left_arrow.graphics.lineTo(0,280);	
					
			hit_left_arrow.graphics.endFill(false);
			hit_left_arrow.alpha = 0.0;			
			hit_left_arrow.graphics.precisionHitTest = true;	
			
			
			hit_right_arrow = new Shape();
			hit_right_arrow.touchable = false;
			hit_right_arrow.graphics.beginFill(0xff0000);
			
			hit_right_arrow.graphics.lineTo(754,190);	
			hit_right_arrow.graphics.lineTo(800,190);	
			hit_right_arrow.graphics.lineTo(800,280);	
			hit_right_arrow.graphics.lineTo(754,280);	
		
		
			hit_right_arrow.graphics.endFill(false);
			hit_right_arrow.alpha = 0.0;			
			hit_right_arrow.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_left_arrow);
			this.addChild(hit_right_arrow);
		}
		
		public function PopulatePage():void{
			NoteBookDetailsObj.ChangePage(NotesArray[currentPage],NotesArray[currentPage+1]);
		//	NoteBookDetailsObj.sideLeft.texture = NotesArray['currentPage']
		}
		
		
		public function AddToNoteBook(Str2Check:String):void{
			if(CheckIfInArray(Str2Check) === true){
				NotesArray.push(Str2Check);
				trace("NotesArray: "+NotesArray);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.NoteBook != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.NoteBook;
				}
				SaveArray['NotesArray'] = NotesArray;
				(stage.getChildAt(0) as Object).SavedGame.SaveNoteBookData(SaveArray);
			}
			
		}
		
		public function AddToNoteBookSingle(Str2Check:String):void{
			if(CheckIfInArray(Str2Check) === true){		
				if(SingleFlag > 0){
					
					NotesArray[SingleFlag] = Str2Check;
						
					SingleFlag = 0;
				}else{
					
					NotesArray.push(Str2Check);
				}
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.NoteBook != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.NoteBook;
			}
			SaveArray['NotesArray'] = NotesArray;
			SaveArray['SingleFlag'] = SingleFlag;
			(stage.getChildAt(0) as Object).SavedGame.SaveNoteBookData(SaveArray);			
			
			trace("NotesArray: "+NotesArray);
			trace("SingleFlag: "+SingleFlag);
		}
		
		public function AddToNoteBookDouble(Str2Check1:String,Str2Check2:String):void{
			if(CheckIfInArray(Str2Check1) === true){			
				
				trace("NotesArray: "+NotesArray);
		
				if((NotesArray.length) > 0){
					
					if(int(NotesArray.length/2) == (NotesArray.length/2)){
						NotesArray.push(Str2Check1);
						NotesArray.push(Str2Check2);
					}else{
						SingleFlag = int(NotesArray.length);
						NotesArray.push('empty');
						NotesArray.push(Str2Check1);
						NotesArray.push(Str2Check2);
						
					}
				}else{
					NotesArray.push(Str2Check1);
					NotesArray.push(Str2Check2);
				}
			}		
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.NoteBook != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.NoteBook;
			}
			SaveArray['NotesArray'] = NotesArray;
			SaveArray['SingleFlag'] = SingleFlag;
			(stage.getChildAt(0) as Object).SavedGame.SaveNoteBookData(SaveArray);			
			
			trace("NotesArray: "+NotesArray);
			trace("SingleFlag: "+SingleFlag);
		}
		
		public function CheckIfInArray(Str2Check:String):Boolean{
			for (var i:int = 0; i <= NotesArray.length; i++){
				if (NotesArray[i] == Str2Check){
					return false;
				}
			}
			return true;
			
			//return NotesArray.length
		}
		
		public function ActivateNoteBook():void{
			noteBookButton.touchable = true;
			noteBookButton.alpha = 1;
		}
		
		private function onClickHandler(e:TouchEvent):void{
			targ = e.target;
			//	c_targ = e.currentTarget;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(animating === false){
					if (touches[0].phase == TouchPhase.ENDED) {
						if(targ == noteBookButton){
							trace("JIT TOP NOT STOP");
								ToggleNoteBook(Toggle);

						}else if(targ == goback.SourceImage){
							
							trace("OBJ ACCESS");
							ToggleNoteBook(Toggle);
						}else if(targ == inven_toggle){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.toggleInvetory();
						}else if(hit_left_arrow.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							trace("LEFT HIT");
							ShowPrev();
						}else if(hit_right_arrow.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							trace("RIGHT HIT");
							ShowNext();
						}
						
						//trace();
					}
				}
			}
		}
		
		public function ShowPrev():void{
			if((currentPage-2) >= 0){
				currentPage = currentPage-+2;				
				PopulatePage();
				trace("mik 02");
			}else{
				if((NotesArray.length-1) >0){
				//	currentPage = NotesArray.length-1;
					trace("mik 01");
					if(int(NotesArray.length/2) == (NotesArray.length/2)){
						currentPage = NotesArray.length-2;
						trace("mik 00");
					}else{
						currentPage = NotesArray.length-1;
						trace("mik 01");
					}
				
				}
			}
			
			if(NotesArray[currentPage+2] != null){
				trace("mik 03");
			}
			
			
			trace('currentPage: '+currentPage);
			PopulatePage();
		}
		
		public function ShowNext():void{
			if(NotesArray[currentPage+2] != null){
				currentPage = currentPage+2;
				
				PopulatePage();
			

			}else{
				currentPage = 0;
				PopulatePage();
				trace("No Next Page");
			}
			
		
		}
		
		
		public function ToggleNoteBook(ToogleOnOff:Boolean):void{
			if(ToogleOnOff === false){
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
				animating = true;
				Toggle = true;
				PopulatePage();
		//		goback.touchable = true;
			//	NoteBookDetailsObj.alpha = 0;
			//	this.addChildAt(NoteBookDetailsObj,0);
				
				NoteBookDetailTween = new Tween(notebook_sprite,0.25,Transitions.LINEAR);
				NoteBookDetailTween.fadeTo(1);
				NoteBookDetailTween.onComplete = function():void{
					
					animating = false;
					notebook_sprite.touchable = true;
					
	//				goback.alpha = 1;
				}
				
				Starling.juggler.add(NoteBookDetailTween);
				
			}else{
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PageTurn();
	//		goback.alpha = 1;
				animating = true;
				Toggle = false;
	//			goback.touchable = false;
				
				NoteBookDetailTween = new Tween(notebook_sprite,0.25,Transitions.LINEAR);
				NoteBookDetailTween.fadeTo(0);
				NoteBookDetailTween.onComplete = function():void{
					animating = false;
					notebook_sprite.touchable = false;
		//			removeDetail();
				}
				
				Starling.juggler.add(NoteBookDetailTween);
				
				
			}
		}
		
		private function removeDetail():void{
			this.removeChild(NoteBookDetailsObj);
		}
		
		
		
		public function ShowButton(ToggleBar:Boolean):void{
			if(ToggleBar === false){
				animating = true;
				inven_toggle.texture = this.assets.getTexture('invenToggleOpen_v003a001');
				
				noteBookTween = new Tween(noteBookButton,0.25,Transitions.LINEAR);
				noteBookTween.animate("y",335);
				noteBookTween.onComplete = function():void{
					animating = false;
				}
			}else{
				inven_toggle.texture = this.assets.getTexture('invenToggleClosed_v003a001');
				animating = true;
				noteBookTween = new Tween(noteBookButton,0.25,Transitions.LINEAR);
//				noteBookTween.animate("y",400);
				noteBookTween.animate("y",400);
				noteBookTween.onComplete = function():void{
					animating = false;
				}			
			}
			
			Starling.juggler.add(noteBookTween);
		}
		
		
		
		
		
		
		
	
	}
}


