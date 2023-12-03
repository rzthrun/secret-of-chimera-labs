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
	import starling.text.TextField;
	import starling.utils.AssetManager;
	import starling.utils.deg2rad;
	import starling.utils.rad2deg;
	
	public class GeneticsRoomLensPuzzle extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var red_spine:MovieClip;
		
		private var lens_00_sprite:Sprite;
		private var lens_00_frame:Image;
		private var lens_00_lens:Image;
		private var lens_00_latch:Image;
		private var lens_00_screen:Image;
		private var lens_00_text:TextField;
		private var hit_00_lens:Shape;
		private var hit_00_latch:Shape;
		
		private var lens_01_sprite:Sprite;
		private var lens_01_frame:Image;
		private var lens_01_lens:Image;
		private var lens_01_latch:Image;
		private var lens_01_screen:Image;
		private var lens_01_text:TextField;
		private var hit_01_lens:Shape;
		private var hit_01_latch:Shape;
		
		private var lens_02_sprite:Sprite;
		private var lens_02_frame:Image;
		private var lens_02_lens:Image;
		private var lens_02_latch:Image;
		private var lens_02_screen:Image;
		private var lens_02_text:TextField;
		private var hit_02_lens:Shape;
		private var hit_02_latch:Shape;
		
		private var left_line:Shape;
		
		private var line_00_00_holder:Sprite;
		private var line_00_00:MovieClip;
	
		private var line_00_01_holder:Sprite;
		private var line_00_01:MovieClip;
	
	//	private var line_00_01_holder:Sprite;
	//	private var line_00_01:Image;
		
		private var line_01_00_holder:Sprite;
		private var line_01_00:MovieClip;
		private var line_01_01_holder:Sprite;
		private var line_01_01:MovieClip;
		
		private var flare_01_00:Image;
		private var flare_01_01:Image;
		
		private var line_02_00_holder:Sprite;
		private var line_02_00:MovieClip;
		private var line_02_01_holder:Sprite;
		private var line_02_01:MovieClip;
		
		private var flare_02_00:Image;
		private var flare_02_01:Image;
				
		private var line_03_00_holder:Sprite;
		private var line_03_00:MovieClip;
		private var line_03_01_holder:Sprite;
		private var line_03_01:MovieClip;
		
		private var flare_03_00:Image;
		private var flare_03_01:Image;
		
		private var Latch00Open:Boolean = false;
		private var Latch01Open:Boolean = false;
		private var Latch02Open:Boolean = false;
		
		private var LensFlag:String = null;
		private var prevY:int;
		private var curY:int;
		
		private var RONum:int = 0;
		private var RONum2:int = 0;
		
		private var ReductScaler:Number = 3.6;
		private var ReductOffset:Number = 37.5;
		
		private var RedTween:Tween;
		private var Solved:Boolean = false;
		
		private var GlassLensAttached:Boolean = false;
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;
		
		
		public function GeneticsRoomLensPuzzle(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('geneticsRoomLensPuzzle_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomLensPuzzle/geneticsRoomLensPuzzle_bg.jpg'));
				game.TrackAssets('geneticsRoomLensPuzzle_01');
			}
			if(game.CheckAsset('geneticsRoomLensPuzzle_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomLensPuzzle/GeneticsRoomLensPuzzle_Sprite_01.png'));
				game.TrackAssets('geneticsRoomLensPuzzle_02');
			}
			if(game.CheckAsset('geneticsRoomLensPuzzle_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomLensPuzzle/GeneticsRoomLensPuzzle_Sprite_01.xml'));
				game.TrackAssets('geneticsRoomLensPuzzle_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GeneticsRoomLensPuzzle","GeneticsRoomLensPuzzleObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		
		private function onLoadAssets():void{
		//	if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle != undefined){
		//		SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle;
		//	}				
		//	SaveArray["GlassLensAttached"] = "Yes";
		//	(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomLensPuzzle',SaveArray);
			
			
			bg = new Image(this.assets.getTexture('geneticsRoomLensPuzzle_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			red_spine = new MovieClip(this.assets.getTextures("red_spine_0"),8);	
			red_spine.touchable = false;
			red_spine.loop = true; 
			//red_spine.pivotY = line_03_01.width/2;
			red_spine.x = 381;
			red_spine.y = 26;
			red_spine.play();
						
		//	= new Image(this.assets.getTexture('red_spine'));
		//	red_spine.touchable = false;
		//	red_spine.x = 381;
		//	red_spine.y = 26;	
			
			red_spine.alpha = 0;
			
			CreateLens00();
			CreateLens01();
			CreateLens02();
			
			
			
		
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['GlassLensAttached'] == 'Yes'){
					GlassLensAttached = true;
					lens_01_lens.alpha = 1;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['lens_00_y'] != undefined){
					lens_00_sprite.y = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['lens_00_y'];
					var temp00Text0:int = Math.round((lens_00_sprite.y-ReductOffset)/(ReductScaler));
					if(temp00Text0 < 0){
						lens_00_text.text = '000';
					}else if(temp00Text0 > 100){
						lens_00_text.text = '099';
					}else{
						if(temp00Text0 < 10){
							lens_00_text.text = '00'+temp00Text0;
						}else if(temp00Text0 < 100){
							lens_00_text.text = '0'+temp00Text0;
						}
					}
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['lens_01_y'] != undefined){
					lens_01_sprite.y = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['lens_01_y'];
					var temp01Text0:int = Math.round((lens_01_sprite.y-ReductOffset)/(ReductScaler));
					if(temp01Text0 < 0){
						lens_01_text.text = '000';
					}else if(temp01Text0 > 100){
						lens_01_text.text = '099';
					}else{
						if(temp01Text0 < 10){
							lens_01_text.text = '00'+temp01Text0;
						}else if(temp01Text0 < 100){
							lens_01_text.text = '0'+temp01Text0;
						}
					}
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['lens_02_y'] != undefined){
					lens_02_sprite.y = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['lens_02_y'];
					var temp02Text0:int = Math.round((lens_02_sprite.y-ReductOffset)/(ReductScaler));
					if(temp02Text0 < 0){
						lens_02_text.text = '000';
					}else if(temp02Text0 > 100){
						lens_02_text.text = '099';
					}else{
						if(temp02Text0 < 10){
							lens_02_text.text = '00'+temp02Text0;
						}else if(temp02Text0 < 100){
							lens_02_text.text = '0'+temp02Text0;
						}
					}
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['Latch00'] == 'Open'){
					Latch00Open = true;
					lens_00_latch.texture = this.assets.getTexture('latch_open');	
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['Latch01'] == 'Open'){
					Latch01Open = true;
					lens_01_latch.texture = this.assets.getTexture('latch_open');	
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['Latch02'] == 'Open'){
					Latch02Open = true;
					lens_02_latch.texture = this.assets.getTexture('latch_open');	
				}
				
			}else{
				
			}
			
			
			
			if(GlassLensAttached === true){
				CreateAttachedLightLensSet();
			}else{
				CreateNotLightLensSet();
			}
			
			this.addChildAt(red_spine,1);
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		
		}
		private function CreateNotLightLensSet():void{
			line_00_00_holder =  new Sprite();
			line_00_00_holder.touchable = false;
			line_00_00_holder.x = 385;
			line_00_00_holder.y = 28;
			line_00_00_holder.rotation = deg2rad(75);
			
			
			line_00_00 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_00_00.touchable = false;
			line_00_00.loop = true; 
			line_00_00.pivotY = line_00_00.width/2;
			line_00_00.play();
			
			line_00_00.alpha = 1;
			line_00_00_holder.addChild(line_00_00);
			
			
			line_00_01_holder =  new Sprite();
			line_00_01_holder.touchable = false;
			line_00_01_holder.x = 420;
			line_00_01_holder.y = 28;
			line_00_01_holder.rotation = deg2rad(105);
			
			
			line_00_01 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_00_01.touchable = false;
			line_00_01.loop = true; 
			line_00_01.pivotY = line_00_01.width/2;
			line_00_01.play();
			
			line_00_01.alpha = 1;
			line_00_01_holder.addChild(line_00_01);
			
			
			line_01_00_holder =  new Sprite();
			line_01_00_holder.touchable = false;
			line_01_00_holder.x = 430;
			line_01_00_holder.y = lens_00_sprite.y+20;
			line_01_00_holder.rotation = deg2rad(100);
			
			
			line_01_00 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_01_00.touchable = false;
			line_01_00.loop = true; 
			line_01_00.pivotY =line_01_00.width/2;
			line_01_00.play();
			
			line_01_00.alpha = 1;
			line_01_00_holder.addChild(line_01_00);
			
			line_01_01_holder =  new Sprite();
			line_01_01_holder.touchable = false;
			line_01_01_holder.x = 385;
			line_01_01_holder.y = lens_00_sprite.y+20;
			line_01_01_holder.rotation = deg2rad(80);
			
			
			line_01_01 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_01_01.touchable = false;
			line_01_01.loop = true; 
			line_01_01.pivotY =line_01_01.width/2;
			line_01_01.play();
			
			line_01_01.alpha = 1;
			line_01_01_holder.addChild(line_01_01);
			
			
			
			
			line_03_00_holder =  new Sprite();
			line_03_00_holder.touchable = false;
			line_03_00_holder.x = 430;
			line_03_00_holder.y = lens_02_sprite.y+20;
			line_03_00_holder.rotation = deg2rad(75);
			
			line_03_00 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_03_00.touchable = false;
			line_03_00.loop = true; 
			line_03_00.pivotY = line_03_00.width/2;
			line_03_00.play();
			
			line_03_00.alpha = 1;
			line_03_00_holder.addChild(line_03_00);
			
			line_03_01_holder =  new Sprite();
			line_03_01_holder.touchable = false;
			line_03_01_holder.x = 385;
			line_03_01_holder.y = lens_02_sprite.y+20;
			line_03_01_holder.rotation = deg2rad(105);
			
			line_03_01 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_03_01.touchable = false;
			line_03_01.loop = true; 
			line_03_01.pivotY = line_03_01.width/2;
			line_03_01.play();
			
			line_03_01.alpha = 1;
			line_03_01_holder.addChild(line_03_01);
			
			
			
			flare_01_00 = new Image(this.assets.getTexture('flare_01'));	
			flare_01_00.touchable = false;
			flare_01_00.pivotX = flare_01_00.width/2;
			flare_01_00.pivotY = flare_01_00.height/2;
			flare_01_00.x = line_01_00_holder.x;
			flare_01_00.y = line_01_00_holder.y;
			
			flare_01_00.alpha = 1;
			
			flare_01_01 = new Image(this.assets.getTexture('flare_01'));	
			flare_01_01.touchable = false;
			flare_01_01.pivotX = flare_01_01.width/2;
			flare_01_01.pivotY = flare_01_01.height/2;
			flare_01_01.x = line_01_01_holder.x;
			flare_01_01.y = line_01_01_holder.y;
			flare_01_01.alpha = 1;
			
			
		
			
			flare_03_00 = new Image(this.assets.getTexture('flare_01'));	
			flare_03_00.touchable = false;
			flare_03_00.pivotX = flare_03_00.width/2;
			flare_03_00.pivotY = flare_03_00.height/2;
			flare_03_00.x = line_03_00_holder.x;
			flare_03_00.y = line_03_00_holder.y;
			
			flare_03_00.alpha = 1;
			
			flare_03_01 = new Image(this.assets.getTexture('flare_01'));	
			flare_03_01.touchable = false;
			flare_03_01.pivotX = flare_03_01.width/2;
			flare_03_01.pivotY = flare_03_01.height/2;
			flare_03_01.x = line_03_01_holder.x;
			flare_03_01.y = line_03_01_holder.y;
			flare_03_01.alpha = 1;
			
			
			
			
			
			
			
			if(lens_00_sprite.y <= 33){
				lens_00_sprite.y = 33;				
				line_00_00.width = 23;
				line_00_01.width = 23;					
			}else{
				//lens_00_sprite.y = curY;					
				line_00_00.width = (lens_00_sprite.y-10);
				line_00_01.width = (lens_00_sprite.y-10);		
			}	
			
			line_01_00_holder.y = lens_00_sprite.y+20;
			line_01_00_holder.rotation = deg2rad(100)*(1+(1/(line_01_00_holder.y/3)));		
			line_01_00.width = ((lens_02_sprite.y-lens_00_sprite.y));			
			line_01_00_holder.x = line_00_00_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_00_00.width,2)-Math.pow((line_00_00_holder.height),2))));
			
			line_01_01_holder.y = lens_00_sprite.y+20;
			line_01_01_holder.rotation = deg2rad(80)*(1-(1/(line_01_00_holder.y/3)));		
			line_01_01.width = ((lens_02_sprite.y-lens_00_sprite.y));			
			line_01_01_holder.x = line_00_01_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_00_01.width,2)-Math.pow((line_00_01_holder.height),2))));
			
	//		line_02_00_holder.y = lens_01_sprite.y+20;
	//		line_02_00.width = (lens_02_sprite.y-lens_01_sprite.y);		
	//		line_02_00_holder.x = line_01_00_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_01_00.width,2)-Math.pow((line_01_00_holder.height),2))));
			
	//		line_02_01_holder.y = lens_01_sprite.y+20;
	//		line_02_01.width = (lens_02_sprite.y-lens_01_sprite.y);		
	//		line_02_01_holder.x = line_01_01_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_01_01.width,2)-Math.pow((line_01_01_holder.height),2))));
			
			line_03_00_holder.y = lens_02_sprite.y+20;
			line_03_00_holder.x = line_01_00_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_01_00.width,2)-Math.pow((line_01_00_holder.height),2))));
			line_03_00.width = (lens_02_sprite.y-512+60)*-1;
			
			line_03_01_holder.y = lens_02_sprite.y+20;
			line_03_01_holder.x = line_01_01_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_01_01.width,2)-Math.pow((line_01_01_holder.height),2))));				
			line_03_01.width = (lens_02_sprite.y-512+60)*-1;
			
			
			flare_01_00.x = line_01_00_holder.x;
			flare_01_00.y = line_01_00_holder.y;
			flare_01_01.x = line_01_01_holder.x;
			flare_01_01.y = line_01_01_holder.y;
			
			
	//		flare_02_00.x = line_02_00_holder.x;
	//		flare_02_00.y = line_02_00_holder.y;
	//		flare_02_01.x = line_02_01_holder.x;
	//		flare_02_01.y = line_02_01_holder.y;
			
			flare_03_00.x = line_03_00_holder.x;
			flare_03_00.y = line_03_00_holder.y;
			flare_03_01.x = line_03_01_holder.x;
			flare_03_01.y = line_03_01_holder.y;
			
	
			
			this.addChild(line_00_00_holder);
			this.addChild(line_00_01_holder);
			this.addChild(line_01_00_holder);
			this.addChild(line_01_01_holder);
			this.addChild(line_03_00_holder);
			this.addChild(line_03_01_holder);
			this.addChild(flare_01_00);
			this.addChild(flare_01_01);
			
			this.addChild(flare_03_00);
			this.addChild(flare_03_01);
			
			
			Starling.juggler.add(line_00_00);
			Starling.juggler.add(line_00_01);
			Starling.juggler.add(line_01_00);
			Starling.juggler.add(line_01_01);
			Starling.juggler.add(line_02_00);
			Starling.juggler.add(line_02_01);
			Starling.juggler.add(line_03_00);
			Starling.juggler.add(line_03_01);
			
		}
		private function CreateAttachedLightLensSet():void{
			line_00_00_holder =  new Sprite();
			line_00_00_holder.touchable = false;
			line_00_00_holder.x = 385;
			line_00_00_holder.y = 28;
			line_00_00_holder.rotation = deg2rad(75);
			
			
			line_00_00 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_00_00.touchable = false;
			line_00_00.loop = true; 
			line_00_00.pivotY = line_00_00.width/2;
			line_00_00.play();
			
			line_00_00.alpha = 1;
			line_00_00_holder.addChild(line_00_00);
			
			
			line_00_01_holder =  new Sprite();
			line_00_01_holder.touchable = false;
			line_00_01_holder.x = 420;
			line_00_01_holder.y = 28;
			line_00_01_holder.rotation = deg2rad(105);
			
			
			line_00_01 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_00_01.touchable = false;
			line_00_01.loop = true; 
			line_00_01.pivotY = line_00_01.width/2;
			line_00_01.play();
			
			line_00_01.alpha = 1;
			line_00_01_holder.addChild(line_00_01);
			
			
			line_01_00_holder =  new Sprite();
			line_01_00_holder.touchable = false;
			line_01_00_holder.x = 430;
			line_01_00_holder.y = lens_00_sprite.y+20;
			line_01_00_holder.rotation = deg2rad(100);
			
			
			line_01_00 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_01_00.touchable = false;
			line_01_00.loop = true; 
			line_01_00.pivotY =line_01_00.width/2;
			line_01_00.play();
			
			line_01_00.alpha = 1;
			line_01_00_holder.addChild(line_01_00);
			
			line_01_01_holder =  new Sprite();
			line_01_01_holder.touchable = false;
			line_01_01_holder.x = 385;
			line_01_01_holder.y = lens_00_sprite.y+20;
			line_01_01_holder.rotation = deg2rad(80);
			
			
			line_01_01 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_01_01.touchable = false;
			line_01_01.loop = true; 
			line_01_01.pivotY =line_01_01.width/2;
			line_01_01.play();
			
			line_01_01.alpha = 1;
			line_01_01_holder.addChild(line_01_01);
			
			
			line_02_00_holder =  new Sprite();
			line_02_00_holder.touchable = false;
			line_02_00_holder.x = 375;
			line_02_00_holder.y = lens_01_sprite.y+20;
			line_02_00_holder.rotation = deg2rad(75);
			
			line_02_00 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_02_00.touchable = false;
			line_02_00.loop = true; 
			line_02_00.pivotY = line_02_00.width/2;
			line_02_00.play();
			
			line_02_00.alpha = 1;
			line_02_00_holder.addChild(line_02_00);
			
			
			
			
			line_02_01_holder =  new Sprite();
			line_02_01_holder.touchable = false;
			line_02_01_holder.x = 430;
			line_02_01_holder.y = lens_01_sprite.y+20;
			line_02_01_holder.rotation = deg2rad(105);
			
			line_02_01 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_02_01.touchable = false;
			line_02_01.loop = true; 
			line_02_01.pivotY = line_02_01.width/2;
			line_02_01.play();
			
			line_02_01.alpha = 1;
			line_02_01_holder.addChild(line_02_01);
			
			
			
			line_03_00_holder =  new Sprite();
			line_03_00_holder.touchable = false;
			line_03_00_holder.x = 430;
			line_03_00_holder.y = lens_02_sprite.y+20;
			line_03_00_holder.rotation = deg2rad(105);
			
			line_03_00 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_03_00.touchable = false;
			line_03_00.loop = true; 
			line_03_00.pivotY = line_03_00.width/2;
			line_03_00.play();
			
			line_03_00.alpha = 1;
			line_03_00_holder.addChild(line_03_00);
			
			line_03_01_holder =  new Sprite();
			line_03_01_holder.touchable = false;
			line_03_01_holder.x = 385;
			line_03_01_holder.y = lens_02_sprite.y+20;
			line_03_01_holder.rotation = deg2rad(75);
			
			line_03_01 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
			line_03_01.touchable = false;
			line_03_01.loop = true; 
			line_03_01.pivotY = line_03_01.width/2;
			line_03_01.play();
			
			line_03_01.alpha = 1;
			line_03_01_holder.addChild(line_03_01);
			
			
			
			flare_01_00 = new Image(this.assets.getTexture('flare_01'));	
			flare_01_00.touchable = false;
			flare_01_00.pivotX = flare_01_00.width/2;
			flare_01_00.pivotY = flare_01_00.height/2;
			flare_01_00.x = line_01_00_holder.x;
			flare_01_00.y = line_01_00_holder.y;
			
			flare_01_00.alpha = 1;
			
			flare_01_01 = new Image(this.assets.getTexture('flare_01'));	
			flare_01_01.touchable = false;
			flare_01_01.pivotX = flare_01_01.width/2;
			flare_01_01.pivotY = flare_01_01.height/2;
			flare_01_01.x = line_01_01_holder.x;
			flare_01_01.y = line_01_01_holder.y;
			flare_01_01.alpha = 1;
			
			
			
			flare_02_00 = new Image(this.assets.getTexture('flare_01'));	
			flare_02_00.touchable = false;
			flare_02_00.pivotX = flare_02_00.width/2;
			flare_02_00.pivotY = flare_02_00.height/2;
			flare_02_00.x = line_02_00_holder.x;
			flare_02_00.y = line_02_00_holder.y;
			
			flare_02_00.alpha = 1;
			
			flare_02_01 = new Image(this.assets.getTexture('flare_01'));	
			flare_02_01.touchable = false;
			flare_02_01.pivotX = flare_02_01.width/2;
			flare_02_01.pivotY = flare_02_01.height/2;
			flare_02_01.x = line_02_01_holder.x;
			flare_02_01.y = line_02_01_holder.y;
			flare_02_01.alpha = 1;
			
			flare_03_00 = new Image(this.assets.getTexture('flare_01'));	
			flare_03_00.touchable = false;
			flare_03_00.pivotX = flare_03_00.width/2;
			flare_03_00.pivotY = flare_03_00.height/2;
			flare_03_00.x = line_03_00_holder.x;
			flare_03_00.y = line_03_00_holder.y;
			
			flare_03_00.alpha = 1;
			
			flare_03_01 = new Image(this.assets.getTexture('flare_01'));	
			flare_03_01.touchable = false;
			flare_03_01.pivotX = flare_03_01.width/2;
			flare_03_01.pivotY = flare_03_01.height/2;
			flare_03_01.x = line_03_01_holder.x;
			flare_03_01.y = line_03_01_holder.y;
			flare_03_01.alpha = 1;
			
			
			
			//if(lens_00_sprite.y >= (lens_01_sprite.y-40)){
			//	lens_00_sprite.y = (lens_01_sprite.y-40);					
			
				
			if(lens_00_sprite.y <= 33){
				lens_00_sprite.y = 33;				
				line_00_00.width = 23;
				line_00_01.width = 23;					
			}else{
				//lens_00_sprite.y = curY;					
				line_00_00.width = (lens_00_sprite.y-10);
				line_00_01.width = (lens_00_sprite.y-10);		
			}	

			line_01_00_holder.y = lens_00_sprite.y+20;
			line_01_00_holder.rotation = deg2rad(100)*(1+(1/(line_01_00_holder.y/3)));		
			line_01_00.width = ((lens_01_sprite.y-lens_00_sprite.y));			
			line_01_00_holder.x = line_00_00_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_00_00.width,2)-Math.pow((line_00_00_holder.height),2))));
			
			line_01_01_holder.y = lens_00_sprite.y+20;
			line_01_01_holder.rotation = deg2rad(80)*(1-(1/(line_01_00_holder.y/3)));		
			line_01_01.width = ((lens_01_sprite.y-lens_00_sprite.y));			
			line_01_01_holder.x = line_00_01_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_00_01.width,2)-Math.pow((line_00_01_holder.height),2))));
			
			line_02_00_holder.y = lens_01_sprite.y+20;
			line_02_00.width = (lens_02_sprite.y-lens_01_sprite.y);		
			line_02_00_holder.x = line_01_00_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_01_00.width,2)-Math.pow((line_01_00_holder.height),2))));
			
			line_02_01_holder.y = lens_01_sprite.y+20;
			line_02_01.width = (lens_02_sprite.y-lens_01_sprite.y);		
			line_02_01_holder.x = line_01_01_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_01_01.width,2)-Math.pow((line_01_01_holder.height),2))));
					
			line_03_00_holder.y = lens_02_sprite.y+20;
			line_03_00_holder.x = line_02_00_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_02_00.width,2)-Math.pow((line_02_00_holder.height),2))));
			line_03_00.width = (lens_02_sprite.y-512+60)*-1;
			
			line_03_01_holder.y = lens_02_sprite.y+20;
			line_03_01_holder.x = line_02_01_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_02_01.width,2)-Math.pow((line_02_01_holder.height),2))));				
			line_03_01.width = (lens_02_sprite.y-512+60)*-1;
			
			
			flare_01_00.x = line_01_00_holder.x;
			flare_01_00.y = line_01_00_holder.y;
			flare_01_01.x = line_01_01_holder.x;
			flare_01_01.y = line_01_01_holder.y;
			
			
			flare_02_00.x = line_02_00_holder.x;
			flare_02_00.y = line_02_00_holder.y;
			flare_02_01.x = line_02_01_holder.x;
			flare_02_01.y = line_02_01_holder.y;
			
			flare_03_00.x = line_03_00_holder.x;
			flare_03_00.y = line_03_00_holder.y;
			flare_03_01.x = line_03_01_holder.x;
			flare_03_01.y = line_03_01_holder.y;
			
			
			this.addChild(line_00_00_holder);
			this.addChild(line_00_01_holder);
			this.addChild(line_01_00_holder);
			this.addChild(line_01_01_holder);
			this.addChild(line_02_00_holder);
			this.addChild(line_02_01_holder);
			this.addChild(line_03_00_holder);
			this.addChild(line_03_01_holder);
			this.addChild(flare_01_00);
			this.addChild(flare_01_01);
			this.addChild(flare_02_00);
			this.addChild(flare_02_01);
			this.addChild(flare_03_00);
			this.addChild(flare_03_01);
			
			
			Starling.juggler.add(line_00_00);
			Starling.juggler.add(line_00_01);
			Starling.juggler.add(line_01_00);
			Starling.juggler.add(line_01_01);
			Starling.juggler.add(line_02_00);
			Starling.juggler.add(line_02_01);
			Starling.juggler.add(line_03_00);
			Starling.juggler.add(line_03_01);
			
		}
			
		private function CreateLens02():void{
			lens_02_sprite =  new Sprite();
			lens_02_sprite.touchable = false;
			lens_02_sprite.x = 229;
			lens_02_sprite.y = 300;
			
			lens_02_frame = new Image(this.assets.getTexture('holder'));			
			lens_02_frame.touchable = false;
			lens_02_frame.x = 0;
			lens_02_frame.y = 0;
			
			lens_02_screen = new Image(this.assets.getTexture('holder_screen'));			
			lens_02_screen.touchable = false;
			lens_02_screen.x = -20;
			lens_02_screen.y = -3;
			
			lens_02_text  = new TextField(40,40,"073","digital", 30, 0xff0000);
			lens_02_text.vAlign = starling.utils.VAlign.TOP;
			lens_02_text.hAlign = starling.utils.HAlign.RIGHT;
			lens_02_text.x = -5;
			lens_02_text.y = 2;
			
			lens_02_lens = new Image(this.assets.getTexture('plain_lens'));			
			lens_02_lens.touchable = false;
			lens_02_lens.x = 60;
			lens_02_lens.y = 5;
			
			lens_02_latch = new Image(this.assets.getTexture('latch_closed'));			
			lens_02_latch.touchable = false;
			lens_02_latch.x = 309;
			lens_02_latch.y = 0;
			
			lens_02_frame.alpha = 1;
			lens_02_lens.alpha = 1;
			lens_02_latch.alpha = 1;
			
			lens_02_sprite.addChildAt(lens_02_lens,0);
			lens_02_sprite.addChildAt(lens_02_frame,1);
			lens_02_sprite.addChildAt(lens_02_screen,2);
			lens_02_sprite.addChildAt(lens_02_text,3);
			lens_02_sprite.addChildAt(lens_02_latch,4);
			
			
			hit_02_lens = new Shape();
			hit_02_lens.touchable = false;
			hit_02_lens.graphics.beginFill(0xff0000);
			
			hit_02_lens.graphics.lineTo(4,-8);	
			hit_02_lens.graphics.lineTo(337,-8);	
			hit_02_lens.graphics.lineTo(337,41);	
			hit_02_lens.graphics.lineTo(4,41);	
			
			hit_02_lens.graphics.endFill(false);
			hit_02_lens.alpha = 0.0;
			
			hit_02_lens.graphics.precisionHitTest = true;	
			
			hit_02_latch = new Shape();
			hit_02_latch.touchable = false;
			hit_02_latch.graphics.beginFill(0x0000ff);
			
			hit_02_latch.graphics.lineTo(192+110,-8);	
			hit_02_latch.graphics.lineTo(264+110,-8);	
			hit_02_latch.graphics.lineTo(264+110,42);	
			hit_02_latch.graphics.lineTo(192+110,42);				
			
			hit_02_latch.graphics.endFill(false);
			hit_02_latch.alpha = 0.0;
			
			hit_02_latch.graphics.precisionHitTest = true;	
			
			
			lens_02_sprite.addChild(hit_02_lens);
			lens_02_sprite.addChild(hit_02_latch);
			
			lens_02_sprite.alpha = 1;
			
			this.addChild(lens_02_sprite);
			
		
		}
		
		private function CreateLens01():void{
			lens_01_sprite =  new Sprite();
			lens_01_sprite.touchable = false;
			lens_01_sprite.x = 229;
			lens_01_sprite.y = 200;
			
			lens_01_frame = new Image(this.assets.getTexture('holder'));			
			lens_01_frame.touchable = false;
			lens_01_frame.x = 0;
			lens_01_frame.y = 0;
			
			lens_01_screen = new Image(this.assets.getTexture('holder_screen'));			
			lens_01_screen.touchable = false;
			lens_01_screen.x = -20;
			lens_01_screen.y = -3;
			
			lens_01_text  = new TextField(40,40,"045","digital", 30, 0xff0000);
			lens_01_text.vAlign = starling.utils.VAlign.TOP;
			lens_01_text.hAlign = starling.utils.HAlign.RIGHT;
			lens_01_text.x = -5;
			lens_01_text.y = 2;
			
			
			lens_01_lens = new Image(this.assets.getTexture('plain_lens'));			
			lens_01_lens.touchable = false;
			lens_01_lens.x = 60;
			lens_01_lens.y = 5;
			
			lens_01_latch = new Image(this.assets.getTexture('latch_closed'));			
			lens_01_latch.touchable = false;
			lens_01_latch.x = 309;
			lens_01_latch.y = 0;
			
			lens_01_frame.alpha = 1;
			if(GlassLensAttached === true){
				lens_01_text.alpha = 1;
				lens_01_lens.alpha = 1;
			}else{
				lens_01_text.alpha = 1;
				lens_01_lens.alpha = 0;
			}
			
			lens_01_latch.alpha = 1;
			
			lens_01_sprite.addChildAt(lens_01_lens,0);
			lens_01_sprite.addChildAt(lens_01_frame,1);
			lens_01_sprite.addChildAt(lens_01_screen,2);
			lens_01_sprite.addChildAt(lens_01_text,3);
			lens_01_sprite.addChildAt(lens_01_latch,4);
			
			
			hit_01_lens = new Shape();
			hit_01_lens.touchable = false;
			hit_01_lens.graphics.beginFill(0xff0000);
			
			hit_01_lens.graphics.lineTo(4,-8);	
			hit_01_lens.graphics.lineTo(337,-8);	
			hit_01_lens.graphics.lineTo(337,41);	
			hit_01_lens.graphics.lineTo(4,41);	
			
			hit_01_lens.graphics.endFill(false);
			hit_01_lens.alpha = 0.0;
			
			hit_01_lens.graphics.precisionHitTest = true;	
			
			hit_01_latch = new Shape();
			hit_01_latch.touchable = false;
			hit_01_latch.graphics.beginFill(0x0000ff);
			
			hit_01_latch.graphics.lineTo(192+110,-8);	
			hit_01_latch.graphics.lineTo(264+110,-8);	
			hit_01_latch.graphics.lineTo(264+110,42);	
			hit_01_latch.graphics.lineTo(192+110,42);			
			
			hit_01_latch.graphics.endFill(false);
			hit_01_latch.alpha = 0.0;
			
			hit_01_latch.graphics.precisionHitTest = true;	
			
			
			lens_01_sprite.addChild(hit_01_lens);
			lens_01_sprite.addChild(hit_01_latch);
			
			lens_01_sprite.alpha = 1;
			
			this.addChild(lens_01_sprite);
			
		}
		
		private function CreateLens00():void{
			lens_00_sprite =  new Sprite();
			lens_00_sprite.touchable = false;
			lens_00_sprite.x = 229;
			lens_00_sprite.y = 100;
			
			lens_00_frame = new Image(this.assets.getTexture('holder'));			
			lens_00_frame.touchable = false;
			lens_00_frame.x = 0;
			lens_00_frame.y = 0;
			
			lens_00_screen = new Image(this.assets.getTexture('holder_screen'));			
			lens_00_screen.touchable = false;
			lens_00_screen.x = -20;
			lens_00_screen.y = -3;
			
			lens_00_text  = new TextField(40,40,"017","digital", 30, 0xff0000);
			lens_00_text.vAlign = starling.utils.VAlign.TOP;
			lens_00_text.hAlign = starling.utils.HAlign.RIGHT;
			lens_00_text.x = -5;
			lens_00_text.y = 2;
			
			lens_00_lens = new Image(this.assets.getTexture('plain_lens'));			
			lens_00_lens.touchable = false;
			lens_00_lens.x = 60;
			lens_00_lens.y = 5;
			
			lens_00_latch = new Image(this.assets.getTexture('latch_closed'));			
			lens_00_latch.touchable = false;
			lens_00_latch.x = 309;
			lens_00_latch.y = 0;
			
			lens_00_frame.alpha = 1;
			lens_00_lens.alpha = 1;
			lens_00_latch.alpha = 1;
			
			lens_00_sprite.addChildAt(lens_00_lens,0);
			lens_00_sprite.addChildAt(lens_00_frame,1);
			lens_00_sprite.addChildAt(lens_00_screen,2);
			lens_00_sprite.addChildAt(lens_00_text,3);
			lens_00_sprite.addChildAt(lens_00_latch,4);
			
			
			hit_00_lens = new Shape();
			hit_00_lens.touchable = false;
			hit_00_lens.graphics.beginFill(0xff0000);
			
			hit_00_lens.graphics.lineTo(4,-8);	
			hit_00_lens.graphics.lineTo(337,-8);	
			hit_00_lens.graphics.lineTo(337,41);	
			hit_00_lens.graphics.lineTo(4,41);	
			
			hit_00_lens.graphics.endFill(false);
			hit_00_lens.alpha = 0.0;
			
			hit_00_lens.graphics.precisionHitTest = true;	
			
			hit_00_latch = new Shape();
			hit_00_latch.touchable = false;
			hit_00_latch.graphics.beginFill(0x0000ff);
			
			hit_00_latch.graphics.lineTo(192+110,-8);	
			hit_00_latch.graphics.lineTo(264+110,-8);	
			hit_00_latch.graphics.lineTo(264+110,42);	
			hit_00_latch.graphics.lineTo(192+110,42);	
			
			hit_00_latch.graphics.endFill(false);
			hit_00_latch.alpha = 0.0;
			
			hit_00_latch.graphics.precisionHitTest = true;	
			
			
			lens_00_sprite.addChild(hit_00_lens);
			lens_00_sprite.addChild(hit_00_latch);
			
			lens_00_sprite.alpha = 1;
			
			this.addChild(lens_00_sprite);
			
		
		}
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					if (touches[0].phase == TouchPhase.BEGAN) {
					//	trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(targ == goback.SourceImage){
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((GeneticsRoomBox as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomBoxObj,true
							);
						}else if(Solved === false){
						//	trace('00:');
							if(hit_00_latch.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LatchHandler('00');
							}else if(hit_01_latch.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LatchHandler('01');
							}else if(hit_02_latch.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LatchHandler('02');
								
								/*if(Latch02Open === false){
									Latch02Open = true;
									lens_02_latch.texture = this.assets.getTexture('latch_open');	
								}else{
									Latch02Open = false;
									lens_02_latch.texture = this.assets.getTexture('latch_closed');	
								}*/
							}else if(hit_00_lens.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								//trace('01:');
								if(Latch00Open === false){
								//	trace('02:');
								//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWaveTwo(999);
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TuneForkHumOne();
									LensFlag = "lens_00";
									prevY = touches[0].globalY;
								}
							}else if(hit_01_lens.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							//	trace('03:');
								
								if(GlassLensAttached === false){
									EmptySpaceHandler();
								}else{
									if(Latch01Open === false){
										//	trace('04:');
								//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWaveTwo(999);
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TuneForkHumOne();
										//PlaySFX_TuneForkHumOne
										LensFlag = "lens_01";
										prevY = touches[0].globalY;
									}
								}
								
							}else if(hit_02_lens.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							//	trace('05:');
								if(Latch02Open === false){
								//	trace('06:');
								//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWaveTwo(999);
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_TuneForkHumOne();
									
									LensFlag = "lens_02";
									prevY = touches[0].globalY;
								}		
							}else{
							//	trace('07:');
								LensFlag = null;
							}
						}	
					}else if(touches[0].phase == TouchPhase.MOVED){
					//	trace('08:');
						if(Solved === false){
						//	trace('09:');
							if(LensFlag != null){
						//		trace('10:');
								if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('RotaryClicks') === false){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_RotaryClicks();
								}
								if(isEvenOdd(RONum2) == 'odd'){
						//			if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('CrystalWave') === false){
						//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWave();
						//			}
								}else{
									if((stage.getChildAt(0) as Object).SoundFXObj.soundManager.soundIsPlaying('CrystalWaveTwo') === false){
										
										(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWaveTwo();
									}
								}
								
								if(GlassLensAttached === true){
									LensHandler();
								}else{
									LensNotAttachedHandler();
								}
								
							}
						}
					}else if(touches[0].phase == TouchPhase.ENDED){
					//	trace('11:');
						
						(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("RotaryClicks");
						(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("TuneForkHumOne");
				//		(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("CrystalWaveTwo");
						//SFX_CrystalWaveTwo
						if(LensFlag != null){
						//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
							RandNoiseHandler();
						}
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						trace('lens_00_sprite.y: '+lens_00_sprite.y);
						trace('lens_01_sprite.y: '+lens_01_sprite.y);
						trace('lens_02_sprite.y: '+lens_02_sprite.y);
						
						if(Solved === false){
							if(LensFlag != null){
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle != undefined){
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle;
								}	
								
								SaveArray[LensFlag+"_y"] = this[LensFlag+'_sprite'].y;
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomLensPuzzle',SaveArray);
								
								
								LensFlag = null;
								
								
							}
							Solve();
							
							
						}
					
						
						
							
						
					}
				}
			}
		}
		
		private function isEvenOdd(num):String {
			if ((num % 2) == 0) {
				return "even";
			} else {
				return "odd";
			}
		}
		
		private function RandNoiseHandler():void{
		//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
			if(RONum2 == 0){
				
				if(RONum == 0){
					RONum = 1;
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
				RONum2 = 1;
			}else if(RONum2 == 1){
				if(RONum == 0){
					RONum = 1;
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
					//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
					
				}else if(RONum == 2){
					RONum = 0;
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
				RONum2 = 2;
			}else if(RONum2 == 2){
				if(RONum == 0){
					RONum = 1;
					//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
					//			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
					
				}else if(RONum == 2){
					RONum = 0;
					//			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
				RONum2 = 3;
			}else if(RONum2 == 3){
				if(RONum == 0){
					RONum = 1;
					//			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
					//			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
					//			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
				RONum2 = 4;
			}else if(RONum2 == 4){
				if(RONum == 0){
					RONum = 1;
					//			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
				RONum2 = 5;
			}else if(RONum2 == 5){
				if(RONum == 0){
					RONum = 1;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
					//					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
				RONum2 = 6;
			}else if(RONum2 == 6){
				if(RONum == 0){
					RONum = 1;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
				RONum2 = 7;
			}else if(RONum2 == 7){
				if(RONum == 0){
					RONum = 1;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
				RONum2 = 8;
			}else if(RONum2 == 8){
				if(RONum == 0){
					RONum = 1;
					
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
				RONum2 = 9;
			}else if(RONum2 == 9){
				if(RONum == 0){
					RONum = 1;
					
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;					
					//				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
				RONum2 = 0;
			}
		}
		
		private function LatchHandler(Latch:String):void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle;
			}	
			if(this['Latch'+Latch+'Open'] === false){
				this['Latch'+Latch+'Open'] = true;
				SaveArray['Latch'+Latch] = 'Open';
				this['lens_'+Latch+'_latch'].texture = this.assets.getTexture('latch_open');	
			
			}else{
				this['Latch'+Latch+'Open'] = false;
				SaveArray['Latch'+Latch] = 'Closed';
				this['lens_'+Latch+'_latch'].texture = this.assets.getTexture('latch_closed');	
				
			}	
		
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomLensPuzzle',SaveArray);
			
		}
		/*
		
		*/
		
		private function EmptySpaceHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Lens)
				
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsThree();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				
				trace("LensHit");	
				lens_01_lens.alpha = 1;
				GlassLensAttached = true;
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle;
				}	
				
				SaveArray["GlassLensAttached"] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomLensPuzzle',SaveArray);
				
				
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_Lens,
						"item_Lens"
					);
				
				
				line_02_00_holder =  new Sprite();
				line_02_00_holder.touchable = false;
				line_02_00_holder.x = 375;
				line_02_00_holder.y = lens_01_sprite.y+20;
				line_02_00_holder.rotation = deg2rad(75);
				
				line_02_00 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
				line_02_00.touchable = false;
				line_02_00.loop = true; 
				line_02_00.pivotY = line_02_00.width/2;
				line_02_00.play();
				
				line_02_00.alpha = 1;
				line_02_00_holder.addChild(line_02_00);
				
				
				
				
				line_02_01_holder =  new Sprite();
				line_02_01_holder.touchable = false;
				line_02_01_holder.x = 430;
				line_02_01_holder.y = lens_01_sprite.y+20;
				line_02_01_holder.rotation = deg2rad(105);
				
				line_02_01 = new MovieClip(this.assets.getTextures("line_frame_0"),8);	
				line_02_01.touchable = false;
				line_02_01.loop = true; 
				line_02_01.pivotY = line_02_01.width/2;
				line_02_01.play();
				
				line_02_01.alpha = 1;
				line_02_01_holder.addChild(line_02_01);
				
				
				flare_02_00 = new Image(this.assets.getTexture('flare_01'));	
				flare_02_00.touchable = false;
				flare_02_00.pivotX = flare_02_00.width/2;
				flare_02_00.pivotY = flare_02_00.height/2;
				flare_02_00.x = line_02_00_holder.x;
				flare_02_00.y = line_02_00_holder.y;
				
				flare_02_00.alpha = 1;
				
				flare_02_01 = new Image(this.assets.getTexture('flare_01'));	
				flare_02_01.touchable = false;
				flare_02_01.pivotX = flare_02_01.width/2;
				flare_02_01.pivotY = flare_02_01.height/2;
				flare_02_01.x = line_02_01_holder.x;
				flare_02_01.y = line_02_01_holder.y;
				flare_02_01.alpha = 1;
				
				
				
				line_01_00_holder.y = lens_00_sprite.y+20;
				line_01_00_holder.rotation = deg2rad(100)*(1+(1/(line_01_00_holder.y/3)));		
				line_01_00.width = ((lens_01_sprite.y-lens_00_sprite.y));			
				line_01_00_holder.x = line_00_00_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_00_00.width,2)-Math.pow((line_00_00_holder.height),2))));
				
				line_01_01_holder.y = lens_00_sprite.y+20;
				line_01_01_holder.rotation = deg2rad(80)*(1-(1/(line_01_00_holder.y/3)));		
				line_01_01.width = ((lens_01_sprite.y-lens_00_sprite.y));			
				line_01_01_holder.x = line_00_01_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_00_01.width,2)-Math.pow((line_00_01_holder.height),2))));
				
				line_02_00_holder.x = line_01_00_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_01_00.width,2)-Math.pow((line_01_00_holder.height),2))));
				line_02_01_holder.x = line_01_01_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_01_01.width,2)-Math.pow((line_01_01_holder.height),2))));
				
				line_02_00.width = (lens_02_sprite.y-lens_01_sprite.y);		
				line_02_01.width = (lens_02_sprite.y-lens_01_sprite.y);		
				
				line_03_00_holder.x = line_02_00_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_02_00.width,2)-Math.pow((line_02_00_holder.height),2))));
				line_03_01_holder.x = line_02_01_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_02_01.width,2)-Math.pow((line_02_01_holder.height),2))));
				
				flare_01_00.x = line_01_00_holder.x;
				flare_01_00.y = line_01_00_holder.y;
				flare_01_01.x = line_01_01_holder.x;
				flare_01_01.y = line_01_01_holder.y;
				
				
				flare_02_00.x = line_02_00_holder.x;
				flare_02_00.y = line_02_00_holder.y;
				flare_02_01.x = line_02_01_holder.x;
				flare_02_01.y = line_02_01_holder.y;
				
				flare_03_00.x = line_03_00_holder.x;
				flare_03_00.y = line_03_00_holder.y;
				flare_03_01.x = line_03_01_holder.x;
				flare_03_01.y = line_03_01_holder.y;
				this.addChildAt(line_02_00_holder,1);
				this.addChildAt(line_02_01_holder,2);
				this.addChild(flare_02_00);
				this.addChild(flare_02_01);
			}else{
				if(Latch01Open === false){
					//	trace('04:');
					LensFlag = "lens_01";
					prevY = touches[0].globalY;
				}
			}
		}
		
		
		private function LensNotAttachedHandler():void{
			curY = touches[0].globalY;
			if(LensFlag == 'lens_00'){
				trace('lens_00_sprite.y: '+lens_00_sprite.y);
				trace('line_00_00.width: '+line_00_00.width);
				if(curY >= (lens_01_sprite.y-40)){
					lens_00_sprite.y = (lens_01_sprite.y-40);					
					line_00_00.width = (lens_01_sprite.y-50);
					line_00_01.width = (lens_01_sprite.y-50);
					
				}else if(curY <= 33){
					lens_00_sprite.y = 33;				
					line_00_00.width = 23;
					line_00_01.width = 23;					
				}else{
					lens_00_sprite.y = curY;					
					line_00_00.width = curY-10;
					line_00_01.width = curY-10;				
				}		
				var temp00Text:int = Math.round((lens_00_sprite.y-ReductOffset)/(ReductScaler));
				if(temp00Text < 0){
					lens_00_text.text = '000';
				}else if(temp00Text > 100){
					lens_00_text.text = '099';
				}else{
					if(temp00Text < 10){
						lens_00_text.text = '00'+temp00Text;
					}else if(temp00Text < 100){
						lens_00_text.text = '0'+temp00Text;
					}
				//	lens_00_text.text = ''+temp00Text;
				}
				//lens_00_text.text = ""+Math.round((lens_00_sprite.y-ReductOffset)/(ReductScaler));
				
				line_01_00_holder.y = lens_00_sprite.y+20;
				line_01_00_holder.rotation = deg2rad(100)*(1+(1/(line_01_00_holder.y/3)));		
				line_01_00.width = ((lens_02_sprite.y-lens_00_sprite.y));			
				line_01_00_holder.x = line_00_00_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_00_00.width,2)-Math.pow((line_00_00_holder.height),2))));
				
				line_01_01_holder.y = lens_00_sprite.y+20;
				line_01_01_holder.rotation = deg2rad(80)*(1-(1/(line_01_00_holder.y/3)));		
				line_01_01.width = ((lens_02_sprite.y-lens_00_sprite.y));			
				line_01_01_holder.x = line_00_01_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_00_01.width,2)-Math.pow((line_00_01_holder.height),2))));
				
				line_03_00_holder.y = lens_02_sprite.y+20;
				line_03_00_holder.x = line_01_00_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_01_00.width,2)-Math.pow((line_01_00_holder.height),2))));
				line_03_00.width = (lens_02_sprite.y-512+60)*-1;
				
				line_03_01_holder.y = lens_02_sprite.y+20;
				line_03_01_holder.x = line_01_01_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_01_01.width,2)-Math.pow((line_01_01_holder.height),2))));
				line_03_01.width = (lens_02_sprite.y-512+60)*-1;
				
				
			/*	line_02_00_holder.x = line_01_00_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_01_00.width,2)-Math.pow((line_01_00_holder.height),2))));
				line_02_01_holder.x = line_01_01_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_01_01.width,2)-Math.pow((line_01_01_holder.height),2))));
				
				line_03_00_holder.x = line_01_00_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_01_00.width,2)-Math.pow((line_01_00_holder.height),2))));
				line_03_01_holder.x = line_01_01_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_01_01.width,2)-Math.pow((line_01_01_holder.height),2))));
			*/	
				flare_01_00.x = line_01_00_holder.x;
				flare_01_00.y = line_01_00_holder.y;
				flare_01_01.x = line_01_01_holder.x;
				flare_01_01.y = line_01_01_holder.y;
				
			
				flare_03_00.x = line_03_00_holder.x;
				flare_03_00.y = line_03_00_holder.y;
				flare_03_01.x = line_03_01_holder.x;
				flare_03_01.y = line_03_01_holder.y;
				
				
			}else if(LensFlag == 'lens_01'){
				if(curY <= (lens_00_sprite.y+40)){
					lens_01_sprite.y = (lens_00_sprite.y+40);
				}else if(curY >= (lens_02_sprite.y-40)){
					lens_01_sprite.y = (lens_02_sprite.y-40);
					
				}else{
					lens_01_sprite.y = curY;
				}
				var temp01Text:int = Math.round((lens_01_sprite.y-ReductOffset)/(ReductScaler));
				if(temp01Text < 0){
					lens_01_text.text = '000';
				}else if(temp01Text > 100){
					lens_01_text.text = '099';
				}else{
					if(temp01Text < 10){
						lens_01_text.text = '00'+temp01Text;
					}else if(temp01Text < 100){
						lens_01_text.text = '0'+temp01Text;
					}
				}
				
			}else if(LensFlag == 'lens_02'){
				if(curY <= (lens_01_sprite.y+40)){
					lens_02_sprite.y = (lens_01_sprite.y+40);
					
				}else if(curY >= 400){
					lens_02_sprite.y = 400;
				}else{
					lens_02_sprite.y = curY;
				}
				//var lens02pos:int = 0;
				var temp02Text:int = Math.round((lens_02_sprite.y-ReductOffset)/(ReductScaler));
				if(temp02Text < 0){
					lens_02_text.text = '000';
				}else if(temp02Text > 100){
					lens_02_text.text = '099';
				}else{
					if(temp02Text < 10){
						lens_02_text.text = '00'+temp02Text;
					}else if(temp02Text < 100){
						lens_02_text.text = '0'+temp02Text;
					}
				}
				
			//	lens_02_text.text = ""+Math.round((lens_02_sprite.y-ReductOffset)/(ReductScaler));
				
				line_01_00_holder.y = lens_00_sprite.y+20;
				line_01_00.width = (lens_02_sprite.y-lens_00_sprite.y);
				
				line_01_01_holder.y = lens_00_sprite.y+20;
				line_01_01.width = (lens_02_sprite.y-lens_00_sprite.y);
				
				
				line_03_00_holder.y = lens_02_sprite.y+20;
				line_03_00_holder.x = line_01_00_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_01_00.width,2)-Math.pow((line_01_00_holder.height),2))));
				line_03_00.width = (lens_02_sprite.y-512+60)*-1;
				
				line_03_01_holder.y = lens_02_sprite.y+20;
				line_03_01_holder.x = line_01_01_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_01_01.width,2)-Math.pow((line_01_01_holder.height),2))));
				line_03_01.width = (lens_02_sprite.y-512+60)*-1;
				
				flare_03_00.x = line_03_00_holder.x;
				flare_03_00.y = line_03_00_holder.y;
				flare_03_01.x = line_03_01_holder.x;
				flare_03_01.y = line_03_01_holder.y;
				
			}
			
			trace("------------------------------------------------------------------");
			trace("line_00_00.width: "+line_00_00.width);
			trace("line_00_00_holder.x,y: "+line_00_00_holder.x+","+line_00_00_holder.y);
			trace("line_01_00.width: "+line_01_00.width);
			trace("line_01_00_holder.x: "+line_01_00_holder.x+","+line_01_00_holder.y);
		//	trace("line_02_00.width: "+line_02_00.width);
		//	trace("line_02_00_holder.x: "+line_02_00_holder.x+","+line_02_00_holder.y);
			trace("line_03_00.width: "+line_03_00.width);
			trace("line_03_00_holder.x: "+line_03_00_holder.x+","+line_03_00_holder.y);
			
		}
		
		private function LensHandler():void{
			curY = touches[0].globalY;
			if(LensFlag == 'lens_00'){
				trace('lens_00_sprite.y: '+lens_00_sprite.y);
				trace('line_00_00.width: '+line_00_00.width);
				if(curY >= (lens_01_sprite.y-40)){
					lens_00_sprite.y = (lens_01_sprite.y-40);					
					line_00_00.width = (lens_01_sprite.y-50);
					line_00_01.width = (lens_01_sprite.y-50);
				
				}else if(curY <= 33){
					lens_00_sprite.y = 33;				
					line_00_00.width = 23;
					line_00_01.width = 23;					
				}else{
					lens_00_sprite.y = curY;					
					line_00_00.width = curY-10;
					line_00_01.width = curY-10;				
				}		
				//lens_00_text.text = ""+Math.round((lens_00_sprite.y-ReductOffset)/(ReductScaler));
				
				var temp00Text:int = Math.round((lens_00_sprite.y-ReductOffset)/(ReductScaler));
				if(temp00Text < 0){
					lens_00_text.text = '000';
				}else if(temp00Text > 100){
					lens_00_text.text = '099';
				}else{
					if(temp00Text < 10){
						lens_00_text.text = '00'+temp00Text;
					}else if(temp00Text < 100){
						lens_00_text.text = '0'+temp00Text;
					}
				}
				
				line_01_00_holder.y = lens_00_sprite.y+20;
				line_01_00_holder.rotation = deg2rad(100)*(1+(1/(line_01_00_holder.y/3)));		
				line_01_00.width = ((lens_01_sprite.y-lens_00_sprite.y));			
				line_01_00_holder.x = line_00_00_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_00_00.width,2)-Math.pow((line_00_00_holder.height),2))));
			
				line_01_01_holder.y = lens_00_sprite.y+20;
				line_01_01_holder.rotation = deg2rad(80)*(1-(1/(line_01_00_holder.y/3)));		
				line_01_01.width = ((lens_01_sprite.y-lens_00_sprite.y));			
				line_01_01_holder.x = line_00_01_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_00_01.width,2)-Math.pow((line_00_01_holder.height),2))));
				
				line_02_00_holder.x = line_01_00_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_01_00.width,2)-Math.pow((line_01_00_holder.height),2))));
				line_02_01_holder.x = line_01_01_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_01_01.width,2)-Math.pow((line_01_01_holder.height),2))));
				line_03_00_holder.x = line_02_00_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_02_00.width,2)-Math.pow((line_02_00_holder.height),2))));
				line_03_01_holder.x = line_02_01_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_02_01.width,2)-Math.pow((line_02_01_holder.height),2))));
				
				flare_01_00.x = line_01_00_holder.x;
				flare_01_00.y = line_01_00_holder.y;
				flare_01_01.x = line_01_01_holder.x;
				flare_01_01.y = line_01_01_holder.y;
				
				
				flare_02_00.x = line_02_00_holder.x;
				flare_02_00.y = line_02_00_holder.y;
				flare_02_01.x = line_02_01_holder.x;
				flare_02_01.y = line_02_01_holder.y;
				
				flare_03_00.x = line_03_00_holder.x;
				flare_03_00.y = line_03_00_holder.y;
				flare_03_01.x = line_03_01_holder.x;
				flare_03_01.y = line_03_01_holder.y;
				
			}else if(LensFlag == 'lens_01'){
				if(curY <= (lens_00_sprite.y+40)){
					lens_01_sprite.y = (lens_00_sprite.y+40);
				}else if(curY >= (lens_02_sprite.y-40)){
					lens_01_sprite.y = (lens_02_sprite.y-40);
					
				}else{
					lens_01_sprite.y = curY;
				}
			//lens_01_text.text = ""+Math.round((lens_01_sprite.y-ReductOffset)/(ReductScaler));
				
				var temp01Text:int = Math.round((lens_01_sprite.y-ReductOffset)/(ReductScaler));
				if(temp01Text < 0){
					lens_01_text.text = '000';
				}else if(temp01Text > 100){
					lens_01_text.text = '099';
				}else{
					if(temp01Text < 10){
						lens_01_text.text = '00'+temp01Text;
					}else if(temp01Text < 100){
						lens_01_text.text = '0'+temp01Text;
					}
				}
				
				line_01_00.width = (lens_01_sprite.y-lens_00_sprite.y);
				line_01_01.width = (lens_01_sprite.y-lens_00_sprite.y);
				
				line_02_00_holder.y = lens_01_sprite.y+20;
				line_02_00.width = (lens_02_sprite.y-lens_01_sprite.y);		
				line_02_00_holder.x = line_01_00_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_01_00.width,2)-Math.pow((line_01_00_holder.height),2))));
				
				line_02_01_holder.y = lens_01_sprite.y+20;
				line_02_01.width = (lens_02_sprite.y-lens_01_sprite.y);		
				line_02_01_holder.x = line_01_01_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_01_01.width,2)-Math.pow((line_01_01_holder.height),2))));
				
				line_03_00_holder.x = line_02_00_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_02_00.width,2)-Math.pow((line_02_00_holder.height),2))));
				line_03_01_holder.x = line_02_01_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_02_01.width,2)-Math.pow((line_02_01_holder.height),2))));
				
				
				flare_02_00.x = line_02_00_holder.x;
				flare_02_00.y = line_02_00_holder.y;
				flare_02_01.x = line_02_01_holder.x;
				flare_02_01.y = line_02_01_holder.y;
				
				flare_03_00.x = line_03_00_holder.x;
				flare_03_00.y = line_03_00_holder.y;
				flare_03_01.x = line_03_01_holder.x;
				flare_03_01.y = line_03_01_holder.y;
			//	line_02_00_holder.x = line_01_00_holder.x-(lens_01_sprite.y*0.1);
				
			
			
			}else if(LensFlag == 'lens_02'){
				if(curY <= (lens_01_sprite.y+40)){
					lens_02_sprite.y = (lens_01_sprite.y+40);
					
				}else if(curY >= 400){
					lens_02_sprite.y = 400;
				}else{
					lens_02_sprite.y = curY;
				}
				var temp02Text:int = Math.round((lens_02_sprite.y-ReductOffset)/(ReductScaler));
				if(temp02Text < 0){
					lens_02_text.text = '0';
				}else if(temp02Text > 100){
					lens_02_text.text = '099';
				}else{
					//lens_02_text.text = ''+temp02Text;
					
					if(temp02Text < 10){
						lens_02_text.text = '00'+temp02Text;
					}else if(temp02Text < 100){
						lens_02_text.text = '0'+temp02Text;
					}
				}
				
			//	lens_02_text.text = ""+Math.round((lens_02_sprite.y-ReductOffset)/(ReductScaler));
				
				line_02_00_holder.y = lens_01_sprite.y+20;
				line_02_00.width = (lens_02_sprite.y-lens_01_sprite.y);
				
				line_02_01_holder.y = lens_01_sprite.y+20;
				line_02_01.width = (lens_02_sprite.y-lens_01_sprite.y);
				
				
				
				line_03_00_holder.y = lens_02_sprite.y+20;
				line_03_00_holder.x = line_02_00_holder.x+Math.round(Math.sqrt(Math.abs(Math.pow(line_02_00.width,2)-Math.pow((line_02_00_holder.height),2))));
				line_03_00.width = (lens_02_sprite.y-512+60)*-1;
				
				line_03_01_holder.y = lens_02_sprite.y+20;
				line_03_01_holder.x = line_02_01_holder.x-Math.round(Math.sqrt(Math.abs(Math.pow(line_02_01.width,2)-Math.pow((line_02_01_holder.height),2))));				
				line_03_01.width = (lens_02_sprite.y-512+60)*-1;
				
				flare_03_00.x = line_03_00_holder.x;
				flare_03_00.y = line_03_00_holder.y;
				flare_03_01.x = line_03_01_holder.x;
				flare_03_01.y = line_03_01_holder.y;
				
			}
		
			trace("------------------------------------------------------------------");
			trace("line_00_00.width: "+line_00_00.width);
			trace("line_00_00_holder.x,y: "+line_00_00_holder.x+","+line_00_00_holder.y);
			trace("line_01_00.width: "+line_01_00.width);
			trace("line_01_00_holder.x: "+line_01_00_holder.x+","+line_01_00_holder.y);
			trace("line_02_00.width: "+line_02_00.width);
			trace("line_02_00_holder.x: "+line_02_00_holder.x+","+line_02_00_holder.y);
			trace("line_03_00.width: "+line_03_00.width);
			trace("line_03_00_holder.x: "+line_03_00_holder.x+","+line_03_00_holder.y);
			
		}
		
		private function Solve():void{
			if(lens_00_text.text == '006'){
				if(lens_01_text.text == '041'){
					if(lens_02_text.text == '092'){
						if(GlassLensAttached === true){
							trace('Solved!');
							trace('Solved!');
							trace('Solved!');
							Animating = true;
							
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle != undefined){
								SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle;
							}	
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerPulse();
							SaveArray["Solved"] = "Yes";
							(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomLensPuzzle',SaveArray);
							
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MachineThree();
							
							RedTween = new Tween(red_spine, 2.5, Transitions.EASE_IN);
							RedTween.fadeTo(1);
							RedTween.onComplete = function():void{			
								//	CompleteDNAAnimation();
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_PowerPulse();
								RunSolve()
								
								RedTween = null;
								
							};
							Starling.juggler.add(red_spine);
							Starling.juggler.add(RedTween);	
						}
					}else{
						trace("FAIL ON TWO");
					}
				}else{
					trace("FAIL ON ONE");
				}
			}else{
				trace("FAIL ON Zero");
			}
				
		//	}
		}
		
		private function RunSolve():void{
			Starling.juggler.delayCall(function():void{
				
				Animating = false;
				FadeOut((GeneticsRoomBox as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomBoxObj,true
				);
			},1);
			
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
			
			
			
			this.assets.removeTexture("geneticsRoomLensPuzzle_bg",true);
			this.assets.removeTexture("GeneticsRoomLensPuzzle_Sprite_01",true);
			this.assets.removeTextureAtlas("GeneticsRoomLensPuzzle_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomLensPuzzle_01");
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomLensPuzzle_02");
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomLensPuzzle_03");
			
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