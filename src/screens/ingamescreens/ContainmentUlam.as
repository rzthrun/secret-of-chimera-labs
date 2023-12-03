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

	
	public class ContainmentUlam extends Sprite
	{
		
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
	
		private var pos_01:Image;
		private var pos_02:Image;
		private var pos_03:Image;
		private var pos_04:Image;
		private var pos_05:Image;
		private var pos_06:Image;
		private var pos_07:Image;
		private var pos_08:Image;
		private var pos_09:Image;
		private var pos_10:Image;
		private var pos_11:Image;
		private var pos_12:Image;
		private var pos_13:Image;
		private var pos_14:Image;
		private var pos_15:Image;
		private var pos_16:Image;
		private var pos_17:Image;
		private var pos_18:Image;
		private var pos_19:Image;
		private var pos_20:Image;
		private var pos_21:Image;
		private var pos_22:Image;
		private var pos_23:Image;
		private var pos_24:Image;
		private var pos_25:Image;
		private var pos_26:Image;
		private var pos_27:Image;
		private var pos_28:Image;
		private var pos_29:Image;
		private var pos_30:Image;
		private var pos_31:Image;
		private var pos_32:Image;
		private var pos_33:Image;
		private var pos_34:Image;
		private var pos_35:Image;
		private var pos_36:Image;
		private var pos_37:Image;
		private var pos_38:Image;
		private var pos_39:Image;
		private var pos_40:Image;
		private var pos_41:Image;
		private var pos_42:Image;
		private var pos_43:Image;
		private var pos_44:Image;
		private var pos_45:Image;
		private var pos_46:Image;
		private var pos_47:Image;
		private var pos_48:Image;
		private var pos_49:Image;
		
		private var hit_pos_01:Shape;
		private var hit_pos_02:Shape;
		private var hit_pos_03:Shape;
		private var hit_pos_04:Shape;
		private var hit_pos_05:Shape;
		private var hit_pos_06:Shape;
		private var hit_pos_07:Shape;
		private var hit_pos_08:Shape;
		private var hit_pos_09:Shape;
		private var hit_pos_10:Shape;
		private var hit_pos_11:Shape;
		private var hit_pos_12:Shape;
		private var hit_pos_13:Shape;
		private var hit_pos_14:Shape;
		private var hit_pos_15:Shape;
		private var hit_pos_16:Shape;
		private var hit_pos_17:Shape;
		private var hit_pos_18:Shape;
		private var hit_pos_19:Shape;
		private var hit_pos_20:Shape;
		private var hit_pos_21:Shape;
		private var hit_pos_22:Shape;
		private var hit_pos_23:Shape;
		private var hit_pos_24:Shape;
		private var hit_pos_25:Shape;
		private var hit_pos_26:Shape;
		private var hit_pos_27:Shape;
		private var hit_pos_28:Shape;
		private var hit_pos_29:Shape;
		private var hit_pos_30:Shape;
		private var hit_pos_31:Shape;
		private var hit_pos_32:Shape;
		private var hit_pos_33:Shape;
		private var hit_pos_34:Shape;
		private var hit_pos_35:Shape;
		private var hit_pos_36:Shape;
		private var hit_pos_37:Shape;
		private var hit_pos_38:Shape;
		private var hit_pos_39:Shape;
		private var hit_pos_40:Shape;
		private var hit_pos_41:Shape;
		private var hit_pos_42:Shape;
		private var hit_pos_43:Shape;
		private var hit_pos_44:Shape;
		private var hit_pos_45:Shape;
		private var hit_pos_46:Shape;
		private var hit_pos_47:Shape;
		private var hit_pos_48:Shape;
		private var hit_pos_49:Shape;
		
		private var posArray:Array = new Array(
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false,
			false
		);
		
		
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function ContainmentUlam(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('containmentUlam_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentUlam/containmentUlam_bg.jpg'));
				game.TrackAssets('containmentUlam_01');
			}
			if(game.CheckAsset('containmentUlam_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentUlam/ContainmentUlam_Sprite_00.xml'));
				game.TrackAssets('containmentUlam_02');
			}
			if(game.CheckAsset('containmentUlam_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ContainmentUlam/ContainmentUlam_Sprite_00.png'));
				game.TrackAssets('containmentUlam_03');
			}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ContainmentUlam","ContainmentUlamObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('containmentUlam_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			pos_01 = new Image(this.assets.getTexture('numBlock_01'));
			pos_01.touchable = false;
			pos_01.x = 355-45;
			pos_01.y = 222;
			
			pos_02 = new Image(this.assets.getTexture('numBlock_02'));
			pos_02.touchable = false; 
			pos_02.x = 425-45;
			pos_02.y = 222;
			
			pos_03 = new Image(this.assets.getTexture('numBlock_03'));
			pos_03.touchable = false;
			pos_03.x = 425-45;
			pos_03.y = 152;
			
			pos_04 = new Image(this.assets.getTexture('numBlock_04'));
			pos_04.touchable = false;
			pos_04.x = 355-45;
			pos_04.y = 152;
			
			pos_05 = new Image(this.assets.getTexture('numBlock_05'));
			pos_05.touchable = false;
			pos_05.x = 285-45;
			pos_05.y = 152;
			
			pos_06 = new Image(this.assets.getTexture('numBlock_06'));
			pos_06.touchable = false;
			pos_06.x = 285-45;
			pos_06.y = 222;
			
			pos_07 = new Image(this.assets.getTexture('numBlock_07'));
			pos_07.touchable = false;
			pos_07.x = 285-45;
			pos_07.y = 292;
			
			pos_08 = new Image(this.assets.getTexture('numBlock_08'));
			pos_08.touchable = false;
			pos_08.x = 355-45;
			pos_08.y = 292;
			
			pos_09 = new Image(this.assets.getTexture('numBlock_09'));
			pos_09.touchable = false;
			pos_09.x = 425-45;
			pos_09.y = 292;
			
			pos_10 = new Image(this.assets.getTexture('numBlock_10'));
			pos_10.touchable = false;
			pos_10.x = 495-45;
			pos_10.y = 292;
			
			pos_11 = new Image(this.assets.getTexture('numBlock_11'));
			pos_11.touchable = false;
			pos_11.x = 495-45;
			pos_11.y = 222;
			
			pos_12 = new Image(this.assets.getTexture('numBlock_12'));
			pos_12.touchable = false;
			pos_12.x = 495-45;
			pos_12.y = 152;
			
			pos_13 = new Image(this.assets.getTexture('numBlock_13'));
			pos_13.touchable = false;
			pos_13.x = 495-45;
			pos_13.y = 82;
			
			pos_14 = new Image(this.assets.getTexture('numBlock_14'));
			pos_14.touchable = false;
			pos_14.x = 425-45;
			pos_14.y = 82;
			
			pos_15 = new Image(this.assets.getTexture('numBlock_15'));
			pos_15.touchable = false;
			pos_15.x = 355-45;
			pos_15.y = 82;
			
			pos_16 = new Image(this.assets.getTexture('numBlock_16'));
			pos_16.touchable = false;
			pos_16.x = 285-45;
			pos_16.y = 82;
			
			pos_17 = new Image(this.assets.getTexture('numBlock_17'));
			pos_17.touchable = false;
			pos_17.x = 215-45;
			pos_17.y = 82;
			
			pos_18 = new Image(this.assets.getTexture('numBlock_18'));
			pos_18.touchable = false;
			pos_18.x = 215-45;
			pos_18.y = 152;
			
			pos_19 = new Image(this.assets.getTexture('numBlock_19'));
			pos_19.touchable = false;
			pos_19.x = 215-45;
			pos_19.y = 222;
			
			pos_20 = new Image(this.assets.getTexture('numBlock_20'));
			pos_20.touchable = false;
			pos_20.x = 215-45;
			pos_20.y = 292;
			
			pos_21 = new Image(this.assets.getTexture('numBlock_21'));
			pos_21.touchable = false;
			pos_21.x = 215-45;
			pos_21.y = 362;
			
			pos_22 = new Image(this.assets.getTexture('numBlock_22'));
			pos_22.touchable = false;
			pos_22.x = 285-45;
			pos_22.y = 362;
			
			pos_23 = new Image(this.assets.getTexture('numBlock_23'));
			pos_23.touchable = false;
			pos_23.x = 355-45;
			pos_23.y = 362;
			
			pos_24 = new Image(this.assets.getTexture('numBlock_24'));
			pos_24.touchable = false;
			pos_24.x = 425-45;
			pos_24.y = 362;
			
			pos_25 = new Image(this.assets.getTexture('numBlock_25'));
			pos_25.touchable = false;
			pos_25.x = 495-45;
			pos_25.y = 362;
			
			pos_26 = new Image(this.assets.getTexture('numBlock_26'));
			pos_26.touchable = false;
			pos_26.x = 565-45;
			pos_26.y = 362;
			
			pos_27 = new Image(this.assets.getTexture('numBlock_27'));
			pos_27.touchable = false;
			pos_27.x = 565-45;
			pos_27.y = 292;
			
			pos_28 = new Image(this.assets.getTexture('numBlock_28'));
			pos_28.touchable = false;
			pos_28.x = 565-45;
			pos_28.y = 222;
			
			pos_29 = new Image(this.assets.getTexture('numBlock_29'));
			pos_29.touchable = false;
			pos_29.x = 565-45;
			pos_29.y = 152;
			
			pos_30 = new Image(this.assets.getTexture('numBlock_30'));
			pos_30.touchable = false;
			pos_30.x = 565-45;
			pos_30.y = 82;
			
			pos_31 = new Image(this.assets.getTexture('numBlock_31'));
			pos_31.touchable = false;
			pos_31.x = 565-45;
			pos_31.y = 12;
			
			pos_32 = new Image(this.assets.getTexture('numBlock_32'));
			pos_32.touchable = false;
			pos_32.x = 495-45;
			pos_32.y = 12;
			
			pos_33 = new Image(this.assets.getTexture('numBlock_33'));
			pos_33.touchable = false;
			pos_33.x = 425-45;
			pos_33.y = 12;
			
			pos_34 = new Image(this.assets.getTexture('numBlock_34'));
			pos_34.touchable = false;
			pos_34.x = 355-45;
			pos_34.y = 12;
			
			pos_35 = new Image(this.assets.getTexture('numBlock_35'));
			pos_35.touchable = false;
			pos_35.x = 285-45;
			pos_35.y = 12;
			
			pos_36 = new Image(this.assets.getTexture('numBlock_36'));
			pos_36.touchable = false;
			pos_36.x = 215-45;
			pos_36.y = 12;
			
			pos_37 = new Image(this.assets.getTexture('numBlock_37'));
			pos_37.touchable = false;
			pos_37.x = 145-45;
			pos_37.y = 12;
			
			pos_38 = new Image(this.assets.getTexture('numBlock_38'));
			pos_38.touchable = false;
			pos_38.x = 145-45;
			pos_38.y = 82;
			
			pos_39 = new Image(this.assets.getTexture('numBlock_39'));
			pos_39.touchable = false;
			pos_39.x = 145-45;
			pos_39.y = 152;
			
			pos_40 = new Image(this.assets.getTexture('numBlock_40'));
			pos_40.touchable = false;
			pos_40.x = 145-45;
			pos_40.y = 222;
			
			pos_41 = new Image(this.assets.getTexture('numBlock_41'));
			pos_41.touchable = false;
			pos_41.x = 145-45;
			pos_41.y = 292;
			
			pos_42 = new Image(this.assets.getTexture('numBlock_42'));
			pos_42.touchable = false;
			pos_42.x = 145-45;
			pos_42.y = 362;
			
			pos_43 = new Image(this.assets.getTexture('numBlock_43'));
			pos_43.touchable = false;
			pos_43.x = 145-45;
			pos_43.y = 432;
			
			pos_44 = new Image(this.assets.getTexture('numBlock_44'));
			pos_44.touchable = false;
			pos_44.x = 215-45;
			pos_44.y = 432;
			
			pos_45 = new Image(this.assets.getTexture('numBlock_45'));
			pos_45.touchable = false;
			pos_45.x = 285-45;
			pos_45.y = 432;
			
			pos_46 = new Image(this.assets.getTexture('numBlock_46'));
			pos_46.touchable = false;
			pos_46.x = 355-45;
			pos_46.y = 432;
			
			pos_47 = new Image(this.assets.getTexture('numBlock_47'));
			pos_47.touchable = false;
			pos_47.x = 425-45;
			pos_47.y = 432;
			
			pos_48 = new Image(this.assets.getTexture('numBlock_48'));
			pos_48.touchable = false;
			pos_48.x = 495-45;
			pos_48.y = 432;
			
			pos_49 = new Image(this.assets.getTexture('numBlock_49'));
			pos_49.touchable = false;
			pos_49.x = 565-45;
			pos_49.y = 432;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentUlam != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentUlam['posArray'] != undefined){
					posArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentUlam['posArray'];
				}else{
					
				}
			}
		
	
			for(var i:int = 1; i<50;i++){
				//	trace(i);			
				if(i < 10){
					if(posArray[(i-1)] === true){
						
						this['pos_0'+(i)].alpha = 1;
					}else{
						this['pos_0'+(i)].alpha = 0;
					}
				}else{
					if(posArray[i-1] === true){
						this['pos_'+(i)].alpha = 1;
					}else{
						this['pos_'+(i)].alpha = 0;
					}
				}
			}
			
		/*	
			pos_01.alpha = 0;
			pos_02.alpha = 0;
			pos_03.alpha = 0;
			pos_04.alpha = 0;
			pos_05.alpha = 0;
			pos_06.alpha = 0;
			pos_07.alpha = 0;
			pos_08.alpha = 0;
			pos_09.alpha = 0;
			pos_10.alpha = 0;
			pos_11.alpha = 0;
			pos_12.alpha = 0;
			pos_13.alpha = 0;
			pos_14.alpha = 0;
			pos_15.alpha = 0;
			pos_16.alpha = 0;
			pos_17.alpha = 0;
			pos_18.alpha = 0;
			pos_19.alpha = 0;
			pos_20.alpha = 0;
			pos_21.alpha = 0;
			pos_22.alpha = 0;
			pos_23.alpha = 0;
			pos_24.alpha = 0;
			pos_25.alpha = 0;
			pos_26.alpha = 0;
			pos_27.alpha = 0;
			pos_28.alpha = 0;
			pos_29.alpha = 0;
			pos_30.alpha = 0;
			pos_31.alpha = 0;
			pos_32.alpha = 0;
			pos_33.alpha = 0;
			pos_34.alpha = 0;
			pos_35.alpha = 0;
			pos_36.alpha = 0;
			pos_37.alpha = 0;
			pos_38.alpha = 0;
			pos_39.alpha = 0;
			pos_40.alpha = 0;
			pos_41.alpha = 0;
			pos_42.alpha = 0;
			pos_43.alpha = 0;
			pos_44.alpha = 0;
			pos_45.alpha = 0;
			pos_46.alpha = 0;
			pos_47.alpha = 0;
			pos_48.alpha = 0;
			pos_49.alpha = 0;
		*/
		
			
			
			
			
			this.addChildAt(pos_01,1)
			this.addChildAt(pos_02,2)
			this.addChildAt(pos_03,3)
			this.addChildAt(pos_04,4)
			this.addChildAt(pos_05,5)
			this.addChildAt(pos_06,6)
			this.addChildAt(pos_07,7)
			this.addChildAt(pos_08,8)
			this.addChildAt(pos_09,9)
			this.addChildAt(pos_10,10)
			this.addChildAt(pos_11,11)
			this.addChildAt(pos_12,12)
			this.addChildAt(pos_13,13)
			this.addChildAt(pos_14,14)
			this.addChildAt(pos_15,15)
			this.addChildAt(pos_16,16)
			this.addChildAt(pos_17,17)
			this.addChildAt(pos_18,18)
			this.addChildAt(pos_19,19)
			this.addChildAt(pos_20,20)
			this.addChildAt(pos_21,21)
			this.addChildAt(pos_22,22)
			this.addChildAt(pos_23,23)
			this.addChildAt(pos_24,24)
			this.addChildAt(pos_25,25)
			this.addChildAt(pos_26,26)
			this.addChildAt(pos_27,27)
			this.addChildAt(pos_28,28)
			this.addChildAt(pos_29,29)
			this.addChildAt(pos_30,30)
			this.addChildAt(pos_31,31)
			this.addChildAt(pos_32,32)
			this.addChildAt(pos_33,33)
			this.addChildAt(pos_34,34)
			this.addChildAt(pos_35,35)
			this.addChildAt(pos_36,36)
			this.addChildAt(pos_37,37)
			this.addChildAt(pos_38,38)
			this.addChildAt(pos_39,39)
			this.addChildAt(pos_40,40)
			this.addChildAt(pos_41,41)
			this.addChildAt(pos_42,42)
			this.addChildAt(pos_43,43)
			this.addChildAt(pos_44,44)
			this.addChildAt(pos_45,45)
			this.addChildAt(pos_46,46)
			this.addChildAt(pos_47,47)
			this.addChildAt(pos_48,48)
			this.addChildAt(pos_49,49)
			
			CreatePosHits();
				
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		
		private function CreatePosHits():void{
			//hit_pos_01
			hit_pos_01 = new Shape();
			hit_pos_01.touchable = false;
			hit_pos_01.graphics.beginFill(0xff0000);			
			hit_pos_01.graphics.lineTo(310,222);	
			hit_pos_01.graphics.lineTo(310+69,222);	
			hit_pos_01.graphics.lineTo(310+69,222+69);	
			hit_pos_01.graphics.lineTo(310,222+69);			
			hit_pos_01.graphics.endFill(false);
			hit_pos_01.alpha = 0.0;			
			hit_pos_01.graphics.precisionHitTest = true;	
						
			hit_pos_02 = new Shape();
			hit_pos_02.touchable = false;
			hit_pos_02.graphics.beginFill(0xff0000);			
			hit_pos_02.graphics.lineTo(380,222);	
			hit_pos_02.graphics.lineTo(380+69,222);	
			hit_pos_02.graphics.lineTo(380+69,222+69);	
			hit_pos_02.graphics.lineTo(380,222+69);				
			hit_pos_02.graphics.endFill(false);
			hit_pos_02.alpha = 0.0;			
			hit_pos_02.graphics.precisionHitTest = true;	
			
			hit_pos_03 = new Shape();
			hit_pos_03.touchable = false;
			hit_pos_03.graphics.beginFill(0xff0000);			
			hit_pos_03.graphics.lineTo(380,152);	
			hit_pos_03.graphics.lineTo(380+69,152);	
			hit_pos_03.graphics.lineTo(380+69,152+69);	
			hit_pos_03.graphics.lineTo(380,152+69);				
			hit_pos_03.graphics.endFill(false);
			hit_pos_03.alpha = 0.0;			
			hit_pos_03.graphics.precisionHitTest = true;	
					
			hit_pos_04 = new Shape();
			hit_pos_04.touchable = false;
			hit_pos_04.graphics.beginFill(0xff0000);			
			hit_pos_04.graphics.lineTo(310,152);				
			hit_pos_04.graphics.lineTo(310+69,152);				
			hit_pos_04.graphics.lineTo(310+69,152+69);				
			hit_pos_04.graphics.lineTo(310,152+69);				
			hit_pos_04.graphics.endFill(false);
			hit_pos_04.alpha = 0.0;			
			hit_pos_04.graphics.precisionHitTest = true;	
						
			hit_pos_05 = new Shape();
			hit_pos_05.touchable = false;
			hit_pos_05.graphics.beginFill(0xff0000);			
			hit_pos_05.graphics.lineTo(240,152);				
			hit_pos_05.graphics.lineTo(240+69,152);				
			hit_pos_05.graphics.lineTo(240+69,152+69);				
			hit_pos_05.graphics.lineTo(240,152+69);						
			hit_pos_05.graphics.endFill(false);
			hit_pos_05.alpha = 0.0;			
			hit_pos_05.graphics.precisionHitTest = true;	
			
			hit_pos_06 = new Shape();
			hit_pos_06.touchable = false;
			hit_pos_06.graphics.beginFill(0xff0000);			
			hit_pos_06.graphics.lineTo(240,222);				
			hit_pos_06.graphics.lineTo(240+69,222);				
			hit_pos_06.graphics.lineTo(240+69,222+69);				
			hit_pos_06.graphics.lineTo(240,222+69);											
			hit_pos_06.graphics.endFill(false);
			hit_pos_06.alpha = 0.0;			
			hit_pos_06.graphics.precisionHitTest = true;	
						
			hit_pos_07 = new Shape();
			hit_pos_07.touchable = false;
			hit_pos_07.graphics.beginFill(0xff0000);			
			hit_pos_07.graphics.lineTo(240,292);				
			hit_pos_07.graphics.lineTo(240+69,292);				
			hit_pos_07.graphics.lineTo(240+69,292+69);				
			hit_pos_07.graphics.lineTo(240,292+69);										
			hit_pos_07.graphics.endFill(false);
			hit_pos_07.alpha = 0.0;			
			hit_pos_07.graphics.precisionHitTest = true;	
						
			hit_pos_08 = new Shape();
			hit_pos_08.touchable = false;
			hit_pos_08.graphics.beginFill(0xff0000);			
			hit_pos_08.graphics.lineTo(310,292);				
			hit_pos_08.graphics.lineTo(310+69,292);				
			hit_pos_08.graphics.lineTo(310+69,292+69);				
			hit_pos_08.graphics.lineTo(310,292+69);														
			hit_pos_08.graphics.endFill(false);
			hit_pos_08.alpha = 0.0;			
			hit_pos_08.graphics.precisionHitTest = true;	
						
			hit_pos_09 = new Shape();
			hit_pos_09.touchable = false;
			hit_pos_09.graphics.beginFill(0xff0000);			
			hit_pos_09.graphics.lineTo(380,292);				
			hit_pos_09.graphics.lineTo(380+69,292);				
			hit_pos_09.graphics.lineTo(380+69,292+69);				
			hit_pos_09.graphics.lineTo(380,292+69);																	
			hit_pos_09.graphics.endFill(false);
			hit_pos_09.alpha = 0.0;			
			hit_pos_09.graphics.precisionHitTest = true;	
						
			hit_pos_10 = new Shape();
			hit_pos_10.touchable = false;
			hit_pos_10.graphics.beginFill(0xff0000);			
			hit_pos_10.graphics.lineTo(450,292);				
			hit_pos_10.graphics.lineTo(450+69,292);				
			hit_pos_10.graphics.lineTo(450+69,292+69);				
			hit_pos_10.graphics.lineTo(450,292+69);																				
			hit_pos_10.graphics.endFill(false);
			hit_pos_10.alpha = 0.0;			
			hit_pos_10.graphics.precisionHitTest = true;	
			
			hit_pos_11 = new Shape();
			hit_pos_11.touchable = false;
			hit_pos_11.graphics.beginFill(0xff0000);			
			hit_pos_11.graphics.lineTo(450,222);				
			hit_pos_11.graphics.lineTo(450+69,222);				
			hit_pos_11.graphics.lineTo(450+69,222+69);				
			hit_pos_11.graphics.lineTo(450,222+69);																							
			hit_pos_11.graphics.endFill(false);
			hit_pos_11.alpha = 0.0;			
			hit_pos_11.graphics.precisionHitTest = true;	
			
			hit_pos_12 = new Shape();
			hit_pos_12.touchable = false;
			hit_pos_12.graphics.beginFill(0xff0000);			
			hit_pos_12.graphics.lineTo(450,152);				
			hit_pos_12.graphics.lineTo(450+69,152);				
			hit_pos_12.graphics.lineTo(450+69,152+69);				
			hit_pos_12.graphics.lineTo(450,152+69);																									
			hit_pos_12.graphics.endFill(false);
			hit_pos_12.alpha = 0.0;			
			hit_pos_12.graphics.precisionHitTest = true;
			
			hit_pos_13 = new Shape();
			hit_pos_13.touchable = false;
			hit_pos_13.graphics.beginFill(0xff0000);			
			hit_pos_13.graphics.lineTo(450,82);				
			hit_pos_13.graphics.lineTo(450+69,82);				
			hit_pos_13.graphics.lineTo(450+69,82+69);				
			hit_pos_13.graphics.lineTo(450,82+69);																											
			hit_pos_13.graphics.endFill(false);
			hit_pos_13.alpha = 0.0;			
			hit_pos_13.graphics.precisionHitTest = true;
			
			hit_pos_14 = new Shape();
			hit_pos_14.touchable = false;
			hit_pos_14.graphics.beginFill(0xff0000);			
			hit_pos_14.graphics.lineTo(380,82);				
			hit_pos_14.graphics.lineTo(380+69,82);				
			hit_pos_14.graphics.lineTo(380+69,82+69);				
			hit_pos_14.graphics.lineTo(380,82+69);																												
			hit_pos_14.graphics.endFill(false);
			hit_pos_14.alpha = 0.0;			
			hit_pos_14.graphics.precisionHitTest = true;
						
			hit_pos_15 = new Shape();
			hit_pos_15.touchable = false;
			hit_pos_15.graphics.beginFill(0xff0000);			
			hit_pos_15.graphics.lineTo(310,82);				
			hit_pos_15.graphics.lineTo(310+69,82);				
			hit_pos_15.graphics.lineTo(310+69,82+69);				
			hit_pos_15.graphics.lineTo(310,82+69);																												
			hit_pos_15.graphics.endFill(false);
			hit_pos_15.alpha = 0.0;			
			hit_pos_15.graphics.precisionHitTest = true;
			
			hit_pos_16 = new Shape();
			hit_pos_16.touchable = false;
			hit_pos_16.graphics.beginFill(0xff0000);			
			hit_pos_16.graphics.lineTo(240,82);				
			hit_pos_16.graphics.lineTo(240+69,82);				
			hit_pos_16.graphics.lineTo(240+69,82+69);				
			hit_pos_16.graphics.lineTo(240,82+69);																												
			hit_pos_16.graphics.endFill(false);
			hit_pos_16.alpha = 0.0;			
			hit_pos_16.graphics.precisionHitTest = true;
					
			hit_pos_17 = new Shape();
			hit_pos_17.touchable = false;
			hit_pos_17.graphics.beginFill(0xff0000);			
			hit_pos_17.graphics.lineTo(170,82);				
			hit_pos_17.graphics.lineTo(170+69,82);				
			hit_pos_17.graphics.lineTo(170+69,82+69);				
			hit_pos_17.graphics.lineTo(170,82+69);																												
			hit_pos_17.graphics.endFill(false);
			hit_pos_17.alpha = 0.0;			
			hit_pos_17.graphics.precisionHitTest = true;
						
			hit_pos_18 = new Shape();
			hit_pos_18.touchable = false;
			hit_pos_18.graphics.beginFill(0xff0000);			
			hit_pos_18.graphics.lineTo(170,152);				
			hit_pos_18.graphics.lineTo(170+69,152);				
			hit_pos_18.graphics.lineTo(170+69,152+69);				
			hit_pos_18.graphics.lineTo(170,152+69);																												
			hit_pos_18.graphics.endFill(false);
			hit_pos_18.alpha = 0.0;			
			hit_pos_18.graphics.precisionHitTest = true;
						
			hit_pos_19 = new Shape();
			hit_pos_19.touchable = false;
			hit_pos_19.graphics.beginFill(0xff0000);			
			hit_pos_19.graphics.lineTo(170,222);				
			hit_pos_19.graphics.lineTo(170+69,222);				
			hit_pos_19.graphics.lineTo(170+69,222+69);				
			hit_pos_19.graphics.lineTo(170,222+69);																												
			hit_pos_19.graphics.endFill(false);
			hit_pos_19.alpha = 0.0;			
			hit_pos_19.graphics.precisionHitTest = true;
					
			hit_pos_20 = new Shape();
			hit_pos_20.touchable = false;
			hit_pos_20.graphics.beginFill(0xff0000);			
			hit_pos_20.graphics.lineTo(170,292);				
			hit_pos_20.graphics.lineTo(170+69,292);				
			hit_pos_20.graphics.lineTo(170+69,292+69);				
			hit_pos_20.graphics.lineTo(170,292+69);																								
			hit_pos_20.graphics.endFill(false);
			hit_pos_20.alpha = 0.0;			
			hit_pos_20.graphics.precisionHitTest = true;
			
			hit_pos_21 = new Shape();
			hit_pos_21.touchable = false;
			hit_pos_21.graphics.beginFill(0xff0000);			
			hit_pos_21.graphics.lineTo(170,362);				
			hit_pos_21.graphics.lineTo(170+69,362);				
			hit_pos_21.graphics.lineTo(170+69,362+69);				
			hit_pos_21.graphics.lineTo(170,362+69);																								
			hit_pos_21.graphics.endFill(false);
			hit_pos_21.alpha = 0.0;			
			hit_pos_21.graphics.precisionHitTest = true;
			
			hit_pos_22 = new Shape();
			hit_pos_22.touchable = false;
			hit_pos_22.graphics.beginFill(0xff0000);			
			hit_pos_22.graphics.lineTo(240,362);				
			hit_pos_22.graphics.lineTo(240+69,362);				
			hit_pos_22.graphics.lineTo(240+69,362+69);				
			hit_pos_22.graphics.lineTo(240,362+69);																								
			hit_pos_22.graphics.endFill(false);
			hit_pos_22.alpha = 0.0;			
			hit_pos_22.graphics.precisionHitTest = true;
			
			hit_pos_23 = new Shape();
			hit_pos_23.touchable = false;
			hit_pos_23.graphics.beginFill(0xff0000);			
			hit_pos_23.graphics.lineTo(310,362);				
			hit_pos_23.graphics.lineTo(310+69,362);				
			hit_pos_23.graphics.lineTo(310+69,362+69);				
			hit_pos_23.graphics.lineTo(310,362+69);																								
			hit_pos_23.graphics.endFill(false);
			hit_pos_23.alpha = 0.0;			
			hit_pos_23.graphics.precisionHitTest = true;
						
			hit_pos_24 = new Shape();
			hit_pos_24.touchable = false;
			hit_pos_24.graphics.beginFill(0x0000ff);			
			hit_pos_24.graphics.lineTo(380,362);				
			hit_pos_24.graphics.lineTo(380+69,362);				
			hit_pos_24.graphics.lineTo(380+69,362+69);				
			hit_pos_24.graphics.lineTo(380,362+69);																								
			hit_pos_24.graphics.endFill(false);
			hit_pos_24.alpha = 0.2;			
			hit_pos_24.graphics.precisionHitTest = true;
			
			hit_pos_25 = new Shape();
			hit_pos_25.touchable = false;
			hit_pos_25.graphics.beginFill(0xff0000);			
			hit_pos_25.graphics.lineTo(450,362);				
			hit_pos_25.graphics.lineTo(450+69,362);				
			hit_pos_25.graphics.lineTo(450+69,362+69);				
			hit_pos_25.graphics.lineTo(450,362+69);																								
			hit_pos_25.graphics.endFill(false);
			hit_pos_25.alpha = 0.0;			
			hit_pos_25.graphics.precisionHitTest = true;
					
			hit_pos_26 = new Shape();
			hit_pos_26.touchable = false;
			hit_pos_26.graphics.beginFill(0xff0000);			
			hit_pos_26.graphics.lineTo(520,362);				
			hit_pos_26.graphics.lineTo(520+69,362);				
			hit_pos_26.graphics.lineTo(520+69,362+69);				
			hit_pos_26.graphics.lineTo(520,362+69);																								
			hit_pos_26.graphics.endFill(false);
			hit_pos_26.alpha = 0.0;			
			hit_pos_26.graphics.precisionHitTest = true;
			
			hit_pos_27 = new Shape();
			hit_pos_27.touchable = false;
			hit_pos_27.graphics.beginFill(0xff0000);			
			hit_pos_27.graphics.lineTo(520,292);				
			hit_pos_27.graphics.lineTo(520+69,292);				
			hit_pos_27.graphics.lineTo(520+69,292+69);				
			hit_pos_27.graphics.lineTo(520,292+69);																								
			hit_pos_27.graphics.endFill(false);
			hit_pos_27.alpha = 0.0;			
			hit_pos_27.graphics.precisionHitTest = true;
			
			hit_pos_28 = new Shape();
			hit_pos_28.touchable = false;
			hit_pos_28.graphics.beginFill(0xff0000);			
			hit_pos_28.graphics.lineTo(520,222);				
			hit_pos_28.graphics.lineTo(520+69,222);				
			hit_pos_28.graphics.lineTo(520+69,222+69);				
			hit_pos_28.graphics.lineTo(520,222+69);																								
			hit_pos_28.graphics.endFill(false);
			hit_pos_28.alpha = 0.0;			
			hit_pos_28.graphics.precisionHitTest = true;
			
			hit_pos_29 = new Shape();
			hit_pos_29.touchable = false;
			hit_pos_29.graphics.beginFill(0xff0000);			
			hit_pos_29.graphics.lineTo(520,152);				
			hit_pos_29.graphics.lineTo(520+69,152);				
			hit_pos_29.graphics.lineTo(520+69,152+69);				
			hit_pos_29.graphics.lineTo(520,152+69);																								
			hit_pos_29.graphics.endFill(false);
			hit_pos_29.alpha = 0.0;			
			hit_pos_29.graphics.precisionHitTest = true;
			
			hit_pos_30 = new Shape();
			hit_pos_30.touchable = false;
			hit_pos_30.graphics.beginFill(0xff0000);			
			hit_pos_30.graphics.lineTo(520,82);				
			hit_pos_30.graphics.lineTo(520+69,82);				
			hit_pos_30.graphics.lineTo(520+69,82+69);				
			hit_pos_30.graphics.lineTo(520,82+69);																								
			hit_pos_30.graphics.endFill(false);
			hit_pos_30.alpha = 0.0;			
			hit_pos_30.graphics.precisionHitTest = true;
			
			hit_pos_31 = new Shape();
			hit_pos_31.touchable = false;
			hit_pos_31.graphics.beginFill(0xff0000);			
			hit_pos_31.graphics.lineTo(520,12);				
			hit_pos_31.graphics.lineTo(520+69,12);				
			hit_pos_31.graphics.lineTo(520+69,12+69);				
			hit_pos_31.graphics.lineTo(520,12+69);																								
			hit_pos_31.graphics.endFill(false);
			hit_pos_31.alpha = 0.0;			
			hit_pos_31.graphics.precisionHitTest = true;
						
			hit_pos_32 = new Shape();
			hit_pos_32.touchable = false;
			hit_pos_32.graphics.beginFill(0xff0000);			
			hit_pos_32.graphics.lineTo(450,12);				
			hit_pos_32.graphics.lineTo(450+69,12);				
			hit_pos_32.graphics.lineTo(450+69,12+69);				
			hit_pos_32.graphics.lineTo(450,12+69);																								
			hit_pos_32.graphics.endFill(false);
			hit_pos_32.alpha = 0.0;			
			hit_pos_32.graphics.precisionHitTest = true;
			
			hit_pos_33 = new Shape();
			hit_pos_33.touchable = false;
			hit_pos_33.graphics.beginFill(0xff0000);			
			hit_pos_33.graphics.lineTo(380,12);				
			hit_pos_33.graphics.lineTo(380+69,12);				
			hit_pos_33.graphics.lineTo(380+69,12+69);				
			hit_pos_33.graphics.lineTo(380,12+69);																								
			hit_pos_33.graphics.endFill(false);
			hit_pos_33.alpha = 0.0;			
			hit_pos_33.graphics.precisionHitTest = true;
			
			hit_pos_34 = new Shape();
			hit_pos_34.touchable = false;
			hit_pos_34.graphics.beginFill(0xff0000);			
			hit_pos_34.graphics.lineTo(310,12);				
			hit_pos_34.graphics.lineTo(310+69,12);				
			hit_pos_34.graphics.lineTo(310+69,12+69);				
			hit_pos_34.graphics.lineTo(310,12+69);																								
			hit_pos_34.graphics.endFill(false);
			hit_pos_34.alpha = 0.0;			
			hit_pos_34.graphics.precisionHitTest = true;			
			
			hit_pos_35 = new Shape();
			hit_pos_35.touchable = false;
			hit_pos_35.graphics.beginFill(0xff0000);			
			hit_pos_35.graphics.lineTo(240,12);				
			hit_pos_35.graphics.lineTo(240+69,12);				
			hit_pos_35.graphics.lineTo(240+69,12+69);				
			hit_pos_35.graphics.lineTo(240,12+69);																								
			hit_pos_35.graphics.endFill(false);
			hit_pos_35.alpha = 0.0;			
			hit_pos_35.graphics.precisionHitTest = true;			
			
			hit_pos_36 = new Shape();
			hit_pos_36.touchable = false;
			hit_pos_36.graphics.beginFill(0xff0000);			
			hit_pos_36.graphics.lineTo(170,12);				
			hit_pos_36.graphics.lineTo(170+69,12);				
			hit_pos_36.graphics.lineTo(170+69,12+69);				
			hit_pos_36.graphics.lineTo(170,12+69);																								
			hit_pos_36.graphics.endFill(false);
			hit_pos_36.alpha = 0.0;			
			hit_pos_36.graphics.precisionHitTest = true;			
			
			hit_pos_37 = new Shape();
			hit_pos_37.touchable = false;
			hit_pos_37.graphics.beginFill(0xff0000);			
			hit_pos_37.graphics.lineTo(100,12);				
			hit_pos_37.graphics.lineTo(100+69,12);				
			hit_pos_37.graphics.lineTo(100+69,12+69);				
			hit_pos_37.graphics.lineTo(100,12+69);																								
			hit_pos_37.graphics.endFill(false);
			hit_pos_37.alpha = 0.0;			
			hit_pos_37.graphics.precisionHitTest = true;		
			
			hit_pos_38 = new Shape();
			hit_pos_38.touchable = false;
			hit_pos_38.graphics.beginFill(0xff0000);			
			hit_pos_38.graphics.lineTo(100,82);				
			hit_pos_38.graphics.lineTo(100+69,82);				
			hit_pos_38.graphics.lineTo(100+69,82+69);				
			hit_pos_38.graphics.lineTo(100,82+69);																								
			hit_pos_38.graphics.endFill(false);
			hit_pos_38.alpha = 0.0;			
			hit_pos_38.graphics.precisionHitTest = true;		
			
			hit_pos_39 = new Shape();
			hit_pos_39.touchable = false;
			hit_pos_39.graphics.beginFill(0xff0000);			
			hit_pos_39.graphics.lineTo(100,152);				
			hit_pos_39.graphics.lineTo(100+69,152);				
			hit_pos_39.graphics.lineTo(100+69,152+69);				
			hit_pos_39.graphics.lineTo(100,152+69);																								
			hit_pos_39.graphics.endFill(false);
			hit_pos_39.alpha = 0.0;			
			hit_pos_39.graphics.precisionHitTest = true;		
			
			hit_pos_40 = new Shape();
			hit_pos_40.touchable = false;
			hit_pos_40.graphics.beginFill(0xff0000);			
			hit_pos_40.graphics.lineTo(100,222);				
			hit_pos_40.graphics.lineTo(100+69,222);				
			hit_pos_40.graphics.lineTo(100+69,222+69);				
			hit_pos_40.graphics.lineTo(100,222+69);																								
			hit_pos_40.graphics.endFill(false);
			hit_pos_40.alpha = 0.0;			
			hit_pos_40.graphics.precisionHitTest = true;		
			
			hit_pos_41 = new Shape();
			hit_pos_41.touchable = false;
			hit_pos_41.graphics.beginFill(0xff0000);			
			hit_pos_41.graphics.lineTo(100,292);				
			hit_pos_41.graphics.lineTo(100+69,292);				
			hit_pos_41.graphics.lineTo(100+69,292+69);				
			hit_pos_41.graphics.lineTo(100,292+69);																								
			hit_pos_41.graphics.endFill(false);
			hit_pos_41.alpha = 0.0;			
			hit_pos_41.graphics.precisionHitTest = true;		
			
			hit_pos_42 = new Shape();
			hit_pos_42.touchable = false;
			hit_pos_42.graphics.beginFill(0xff0000);			
			hit_pos_42.graphics.lineTo(100,362);				
			hit_pos_42.graphics.lineTo(100+69,362);				
			hit_pos_42.graphics.lineTo(100+69,362+69);				
			hit_pos_42.graphics.lineTo(100,362+69);																								
			hit_pos_42.graphics.endFill(false);
			hit_pos_42.alpha = 0.0;			
			hit_pos_42.graphics.precisionHitTest = true;		

			hit_pos_43 = new Shape();
			hit_pos_43.touchable = false;
			hit_pos_43.graphics.beginFill(0xff0000);			
			hit_pos_43.graphics.lineTo(100,432);				
			hit_pos_43.graphics.lineTo(100+69,432);				
			hit_pos_43.graphics.lineTo(100+69,432+69);				
			hit_pos_43.graphics.lineTo(100,432+69);																								
			hit_pos_43.graphics.endFill(false);
			hit_pos_43.alpha = 0.0;			
			hit_pos_43.graphics.precisionHitTest = true;		
			
			hit_pos_44 = new Shape();
			hit_pos_44.touchable = false;
			hit_pos_44.graphics.beginFill(0xff0000);			
			hit_pos_44.graphics.lineTo(170,432);				
			hit_pos_44.graphics.lineTo(170+69,432);				
			hit_pos_44.graphics.lineTo(170+69,432+69);				
			hit_pos_44.graphics.lineTo(170,432+69);																								
			hit_pos_44.graphics.endFill(false);
			hit_pos_44.alpha = 0.0;			
			hit_pos_44.graphics.precisionHitTest = true;		
			
			hit_pos_45 = new Shape();
			hit_pos_45.touchable = false;
			hit_pos_45.graphics.beginFill(0xff0000);			
			hit_pos_45.graphics.lineTo(240,432);				
			hit_pos_45.graphics.lineTo(240+69,432);				
			hit_pos_45.graphics.lineTo(240+69,432+69);				
			hit_pos_45.graphics.lineTo(240,432+69);																								
			hit_pos_45.graphics.endFill(false);
			hit_pos_45.alpha = 0.0;			
			hit_pos_45.graphics.precisionHitTest = true;		
			
			hit_pos_46 = new Shape();
			hit_pos_46.touchable = false;
			hit_pos_46.graphics.beginFill(0xff0000);			
			hit_pos_46.graphics.lineTo(310,432);				
			hit_pos_46.graphics.lineTo(310+69,432);				
			hit_pos_46.graphics.lineTo(310+69,432+69);				
			hit_pos_46.graphics.lineTo(310,432+69);																								
			hit_pos_46.graphics.endFill(false);
			hit_pos_46.alpha = 0.0;			
			hit_pos_46.graphics.precisionHitTest = true;		
			
			hit_pos_47 = new Shape();
			hit_pos_47.touchable = false;
			hit_pos_47.graphics.beginFill(0xff0000);			
			hit_pos_47.graphics.lineTo(380,432);				
			hit_pos_47.graphics.lineTo(380+69,432);				
			hit_pos_47.graphics.lineTo(380+69,432+69);				
			hit_pos_47.graphics.lineTo(380,432+69);																								
			hit_pos_47.graphics.endFill(false);
			hit_pos_47.alpha = 0.0;			
			hit_pos_47.graphics.precisionHitTest = true;		
			
			hit_pos_48 = new Shape();
			hit_pos_48.touchable = false;
			hit_pos_48.graphics.beginFill(0xff0000);			
			hit_pos_48.graphics.lineTo(450,432);				
			hit_pos_48.graphics.lineTo(450+69,432);				
			hit_pos_48.graphics.lineTo(450+69,432+69);				
			hit_pos_48.graphics.lineTo(450,432+69);																								
			hit_pos_48.graphics.endFill(false);
			hit_pos_48.alpha = 0.0;			
			hit_pos_48.graphics.precisionHitTest = true;		
			
			
			hit_pos_49 = new Shape();
			hit_pos_49.touchable = false;
			hit_pos_49.graphics.beginFill(0xff0000);			
			hit_pos_49.graphics.lineTo(520,432);				
			hit_pos_49.graphics.lineTo(520+69,432);				
			hit_pos_49.graphics.lineTo(520+69,432+69);				
			hit_pos_49.graphics.lineTo(520,432+69);																								
			hit_pos_49.graphics.endFill(false);
			hit_pos_49.alpha = 0.0;			
			hit_pos_49.graphics.precisionHitTest = true;	
			
			this.addChild(hit_pos_01);
			this.addChild(hit_pos_02);
			this.addChild(hit_pos_03);
			this.addChild(hit_pos_04);
			this.addChild(hit_pos_05);
			this.addChild(hit_pos_06);
			this.addChild(hit_pos_07);
			this.addChild(hit_pos_08);
			this.addChild(hit_pos_09);
			this.addChild(hit_pos_10);
			this.addChild(hit_pos_11);
			this.addChild(hit_pos_12);
			this.addChild(hit_pos_13);
			this.addChild(hit_pos_14);
			this.addChild(hit_pos_15);
			this.addChild(hit_pos_16);
			this.addChild(hit_pos_17);
			this.addChild(hit_pos_18);
			this.addChild(hit_pos_19);
			this.addChild(hit_pos_20);
			this.addChild(hit_pos_21);
			this.addChild(hit_pos_22);
			this.addChild(hit_pos_23);
			this.addChild(hit_pos_24);
			this.addChild(hit_pos_25);
			this.addChild(hit_pos_26);
			this.addChild(hit_pos_27);
			this.addChild(hit_pos_28);
			this.addChild(hit_pos_29);
			this.addChild(hit_pos_30);
			this.addChild(hit_pos_31);
			this.addChild(hit_pos_32);
			this.addChild(hit_pos_33);
			this.addChild(hit_pos_34);
			this.addChild(hit_pos_35);
			this.addChild(hit_pos_36);
			this.addChild(hit_pos_37);
			this.addChild(hit_pos_38);
			this.addChild(hit_pos_39);
			this.addChild(hit_pos_40);
			this.addChild(hit_pos_41);
			this.addChild(hit_pos_42);
			this.addChild(hit_pos_43);
			this.addChild(hit_pos_44);
			this.addChild(hit_pos_45);
			this.addChild(hit_pos_46);
			this.addChild(hit_pos_47);
			this.addChild(hit_pos_48);
			this.addChild(hit_pos_49);
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
							FadeOut((ContainmentConsole as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentConsoleObj,true
							);
						}else{
							for(var i:int = 1; i<50;i++){
								//	trace(i);
								if(i < 10){
									if(this[('hit_pos_0'+i)].graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
										trace('hit_pos_0'+i);
										GridHandler('0'+i);
										return;
									}
								}else{
									if(this[('hit_pos_'+i)].graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
										trace('hit_pos_'+i);
										
										GridHandler(''+i);
										return;
									}
								}
							}
						}
					}
				}
			}
		}
		private function GridHandler(pos):void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentUlam != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentUlam;
			}
			
			trace('GRID #: '+pos);
			if(posArray[(pos-1)] === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InputTiny();
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
				posArray[(pos-1)] = true;
				this['pos_'+pos].alpha = 1;
				//SaveArray['pos_'+pos] = 'Yes';
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
				posArray[(pos-1)] = false;
				this['pos_'+pos].alpha = 0;
				//SaveArray['pos_'+pos] = 'No';
			}
			SaveArray['posArray'] = posArray;
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentUlam',SaveArray);
			
			Solve();
		}
		
		private function Solve():void{
			if(posArray[0] === false){
				if(posArray[1] === true){
					if(posArray[2] === true){
						if(posArray[3] === false){
							if(posArray[4] === true){
								if(posArray[5] === false){
									if(posArray[6] === true){
										if(posArray[7] === false){
											if(posArray[8] === false){
												if(posArray[9] === false){
													if(posArray[10] === true){
														if(posArray[11] === false){
															if(posArray[12] === true){
																if(posArray[13] === false){
																	if(posArray[14] === false){
																		if(posArray[15] === false){
																			if(posArray[16] === true){
																				if(posArray[17] === false){
																					if(posArray[18] === true){
																						if(posArray[19] === false){
																							if(posArray[20] === false){
																								if(posArray[21] === false){
																									if(posArray[22] === true){
																										if(posArray[23] === false){
																											if(posArray[24] === false){
																												if(posArray[25] === false){
																													if(posArray[26] === false){
																														if(posArray[27] === false){
																															if(posArray[28] === true){
																																if(posArray[29] === false){
																																	if(posArray[30] === true){
																																		if(posArray[31] === false){
																																			if(posArray[32] === false){
																																				if(posArray[33] === false){
																																					if(posArray[34] === false){
																																						if(posArray[35] === false){
																																							if(posArray[36] === true){
																																								if(posArray[37] === false){
																																									if(posArray[38] === false){
																																										if(posArray[39] === false){
																																											if(posArray[40] === true){
																																												if(posArray[41] === false){
																																													if(posArray[42] === true){
																																														if(posArray[43] === false){
																																															if(posArray[44] === false){
																																																if(posArray[45] === false){
																																																	
																																																	if(posArray[46] === true){
																																																		if(posArray[47] === false){
																																																			if(posArray[48] === false){
																																																				trace("SOLVE");
																																																				trace("SOLVE");
																																																				trace("SOLVE");
																																																				RunSolve();
																																																			}else{
																																																				trace('fail on 49');
																																																			}
																																																		}else{
																																																			trace('fail on 48');
																																																		}
																																																	}else{
																																																		trace('fail on 47');
																																																	}
																																																}else{
																																																	trace('fail on 46');
																																																}
																																																	
																																															}else{
																																																trace('fail on 45');
																																															}
																																														}else{
																																															trace('fail on 44');
																																														}
																																													}else{
																																														trace('fail on 43');
																																													}
																																												}else{
																																													trace('fail on 42');
																																												}
																																											}else{
																																												trace('fail on 41');
																																											}
																																										}else{
																																											trace('fail on 40');
																																										}
																																									}else{
																																										trace('fail on 39');
																																									}
																																								}else{
																																									trace('fail on 38');
																																								}																																							
																																							}else{
																																								trace('fail on 37');
																																							}
																																						}else{
																																							trace('fail on 36');
																																						}
																																					}else{
																																						trace('fail on 35');
																																					}
																																				}else{
																																					trace('fail on 34');
																																				}
																																			}else{
																																				trace('fail on 33');
																																			}
																																		}else{
																																			trace('fail on 32');
																																		}
																																	}else{
																																		trace('fail on 31');
																																	}
																																}else{
																																	trace('fail on 30');
																																}
																															}else{
																																trace('fail on 29');
																															}
																														}else{
																															trace('fail on 28');
																														}
																													}else{
																														trace('fail on 27');
																													}																											
																												}else{
																													trace('fail on 26');
																												}	
																											}else{
																												trace('fail on 25');
																											}	
																										}else{
																											trace('fail on 24');
																										}	
																									}else{
																										trace('fail on 23');
																									}	
																								}else{
																									trace('fail on 22');
																								}																								
																							}else{
																								trace('fail on 21');
																							}	
																						}else{
																							trace('fail on 20');
																						}	
																					}else{
																						trace('fail on 19');
																					}	
																				}else{
																					trace('fail on 18');
																				}	
																			}else{
																				trace('fail on 17');
																			}	
																		}else{
																			trace('fail on 16');
																		}	
																	}else{
																		trace('fail on 15');
																	}	
																}else{
																	trace('fail on 14');
																}	
															}else{
																trace('fail on 13');
															}	
														}else{
															trace('fail on 12');
														}													
													}else{
														trace('fail on 11');
													}	
												}else{
													trace('fail on 10');
												}	
											}else{
												trace('fail on 09');
											}	
										}else{
											trace('fail on 08');
										}	
									}else{
										trace('fail on 07');
									}	
								}else{
									trace('fail on 06');
								}	
							}else{
								trace('fail on 05');
							}	
						}else{
							trace('fail on 04');
						}	
					}else{
						trace('fail on 03');
					}	
				}else{
					trace('fail on 02');
				}
			}else{
				trace('fail on 01');
			}	
		}
		
		private function RunSolve():void{
			Animating = true;
		
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_InputAccept();
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentUlam != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ContainmentUlam;
			}
			SaveArray['Solved'] = 'Yes';
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ContainmentUlam',SaveArray);
			
			
			Starling.juggler.delayCall(function():void{
				FadeOut((ContainmentInterior as Class), 
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ContainmentInteriorObj,true
				);
			},1.5);
			
			trace("Running Solve...");
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
			
			
			
			this.assets.removeTexture("containmentUlam_bg",true);
			this.assets.removeTexture("ContainmentUlam_Sprite_00",true);
			this.assets.removeTextureAtlas("ContainmentUlam_Sprite_00",true);
			
			(stage.getChildAt(0) as Object).falseAsset("containmentUlam_01");
			(stage.getChildAt(0) as Object).falseAsset("containmentUlam_02");
			(stage.getChildAt(0) as Object).falseAsset("containmentUlam_03");
			
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