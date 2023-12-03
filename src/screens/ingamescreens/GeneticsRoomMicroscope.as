package screens.ingamescreens
{
	import flash.filesystem.File;
	
	import screens.hud.GoBackButton;
	
	import starling.animation.DelayedCall;
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
	
	public class GeneticsRoomMicroscope extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		private var hood:Image;
		private var square_0:Image;
		private var square_1:Image;
		private var square_2:Image;
		
		
		private var pos_0:Image;
		private var pos_1:Image;
		private var pos_2:Image;
		private var pos_3:Image;
		private var pos_4:Image;
		private var pos_5:Image;
		private var pos_6:Image;
		private var pos_7:Image;
		private var pos_8:Image;
		private var pos_9:Image;
		
		private var hit_pos_0:Shape;
		private var hit_pos_1:Shape;
		private var hit_pos_2:Shape;
		private var hit_pos_3:Shape;
		private var hit_pos_4:Shape;
		private var hit_pos_5:Shape;
		private var hit_pos_6:Shape;
		private var hit_pos_7:Shape;
		private var hit_pos_8:Shape;
		private var hit_pos_9:Shape;
		
		private var pos_0_conn:Image;
		private var pos_1_conn:Image;
		private var pos_2_conn:Image;
		private var pos_3_conn:Image;
		private var pos_4_conn:Image;
		
		private var pos_0_purine_conn:Image;
		private var pos_0_pyrimi_conn:Image;
		private var pos_1_purine_conn:Image;
		private var pos_1_pyrimi_conn:Image;
		private var pos_2_purine_conn:Image;
		private var pos_2_pyrimi_conn:Image;
		private var pos_3_purine_conn:Image;
		private var pos_3_pyrimi_conn:Image;
		private var pos_4_purine_conn:Image;
		private var pos_4_pyrimi_conn:Image;
		private var pos_5_purine_conn:Image;
		private var pos_5_pyrimi_conn:Image;
		private var pos_6_purine_conn:Image;
		private var pos_6_pyrimi_conn:Image;
		private var pos_7_purine_conn:Image;
		private var pos_7_pyrimi_conn:Image;
		private var pos_8_purine_conn:Image;
		private var pos_8_pyrimi_conn:Image;
		private var pos_9_purine_conn:Image;
		private var pos_9_pyrimi_conn:Image;
		
		private var pos_0_s0:String = 'n';
		private var pos_1_s0:String = 'n';
		private var pos_2_s0:String = 'n';
		private var pos_3_s0:String = 'a';
		private var pos_4_s0:String = 'n';
		private var pos_5_s0:String = 'n';
		private var pos_6_s0:String = 'n';
		private var pos_7_s0:String = 'n';
		private var pos_8_s0:String = 'n';
		private var pos_9_s0:String = 'n';
		
		private var pos_0_s1:String = 'n';
		private var pos_1_s1:String = 'c';
		private var pos_2_s1:String = 'n';
		private var pos_3_s1:String = 'n';
		private var pos_4_s1:String = 'n';
		private var pos_5_s1:String = 'n';
		private var pos_6_s1:String = 'n';
		private var pos_7_s1:String = 'n';
		private var pos_8_s1:String = 'n';
		private var pos_9_s1:String = 'n';
		
		private var pos_0_s2:String = 'n';
		private var pos_1_s2:String = 'n';
		private var pos_2_s2:String = 'n';
		private var pos_3_s2:String = 'n';
		private var pos_4_s2:String = 'n';
		private var pos_5_s2:String = 'n';
		private var pos_6_s2:String = 'n';
		private var pos_7_s2:String = 'c';
		private var pos_8_s2:String = 'n';
		private var pos_9_s2:String = 'n';
		
		private var hit_set_0:Shape;
		private var hit_set_1:Shape;
		private var hit_set_2:Shape;
		
		private var currentSet:String = '0';
		private var Set0Solved:Boolean = false;
		private var Set1Solved:Boolean = false;
		private var Set2Solved:Boolean = false;
		
		private var GAvailable:Boolean = false;
		private var AAvailable:Boolean = false;
		private var CAvailable:Boolean = false;
		private var TAvailable:Boolean = false;
	
		private var Solved:Boolean = false;
		
		private var RONum:int = 0;
		
		private var delayedCall:DelayedCall;
		private var Animating:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function GeneticsRoomMicroscope(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('geneticsRoomMicroscope_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomMicroscope/geneticsRoomMicroscope_bg.jpg'));
				game.TrackAssets('geneticsRoomMicroscope_01');
			}
			if(game.CheckAsset('geneticsRoomMicroscope_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomMicroscope/GeneticsRoomMicroscope_Sprite_01.png'));
				game.TrackAssets('geneticsRoomMicroscope_02');
			}
			if(game.CheckAsset('geneticsRoomMicroscope_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomMicroscope/GeneticsRoomMicroscope_Sprite_01.xml'));
				game.TrackAssets('geneticsRoomMicroscope_03');
			}
			//GeneticsRoomMicroscope_Sprite_01
			
			//	if(game.CheckAsset('coast_02') === false){
			//		this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/Coast/Coast_SpriteSheet.xml'));
			//		game.TrackAssets('coast_02');
			//	}
			this.assets.loadQueue(function(n:Number):void{
				if(n==1){
					onLoadAssets();
					//	(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BirdHouse","BirdHouseObj");;
					//		onLoadAssets();
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GeneticsRoomMicroscope","GeneticsRoomMicroscopeObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('geneticsRoomMicroscope_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			
			pos_0_purine_conn = new Image(this.assets.getTexture('purine_connect'));
			pos_0_purine_conn.touchable = false;
			pos_0_purine_conn.x = 90;	
			pos_0_purine_conn.y = 103;		
			
			pos_0_pyrimi_conn = new Image(this.assets.getTexture('pyrimidine_connect'));
			pos_0_pyrimi_conn.touchable = false;
			pos_0_pyrimi_conn.x = 90;	
			pos_0_pyrimi_conn.y = 103;
		
			pos_1_purine_conn = new Image(this.assets.getTexture('purine_connect'));
			pos_1_purine_conn.touchable = false;
			pos_1_purine_conn.x = 248;	
			pos_1_purine_conn.y = 103;
		
			pos_1_pyrimi_conn = new Image(this.assets.getTexture('pyrimidine_connect'));
			pos_1_pyrimi_conn.touchable = false;
			pos_1_pyrimi_conn.x = 248;	
			pos_1_pyrimi_conn.y = 103;		
			
			pos_2_purine_conn = new Image(this.assets.getTexture('purine_connect'));
			pos_2_purine_conn.touchable = false;
			pos_2_purine_conn.x = 403;	
			pos_2_purine_conn.y = 103;
		
			pos_2_pyrimi_conn = new Image(this.assets.getTexture('pyrimidine_connect'));
			pos_2_pyrimi_conn.touchable = false;
			pos_2_pyrimi_conn.x = 403;	
			pos_2_pyrimi_conn.y = 103;
	
			pos_3_purine_conn = new Image(this.assets.getTexture('purine_connect'));
			pos_3_purine_conn.touchable = false;
			pos_3_purine_conn.x = 558;	
			pos_3_purine_conn.y = 103;
		
			pos_3_pyrimi_conn = new Image(this.assets.getTexture('pyrimidine_connect'));
			pos_3_pyrimi_conn.touchable = false;
			pos_3_pyrimi_conn.x = 558;	
			pos_3_pyrimi_conn.y = 103;
						
			pos_4_purine_conn = new Image(this.assets.getTexture('purine_connect'));
			pos_4_purine_conn.touchable = false;
			pos_4_purine_conn.x = 717;	
			pos_4_purine_conn.y = 103;
		
			pos_4_pyrimi_conn = new Image(this.assets.getTexture('pyrimidine_connect'));
			pos_4_pyrimi_conn.touchable = false;
			pos_4_pyrimi_conn.x = 717;	
			pos_4_pyrimi_conn.y = 103;
		
			pos_5_purine_conn = new Image(this.assets.getTexture('purine_connect'));
			pos_5_purine_conn.touchable = false;
			pos_5_purine_conn.x = 60;	
			pos_5_purine_conn.y = 343;
			
			pos_5_pyrimi_conn = new Image(this.assets.getTexture('pyrimidine_connect'));
			pos_5_pyrimi_conn.touchable = false;
			pos_5_pyrimi_conn.x = 60;	
			pos_5_pyrimi_conn.y = 315;
					
			pos_6_purine_conn = new Image(this.assets.getTexture('purine_connect'));
			pos_6_purine_conn.touchable = false;
			pos_6_purine_conn.x = 218;	
			pos_6_purine_conn.y = 343;
			
			pos_6_pyrimi_conn = new Image(this.assets.getTexture('pyrimidine_connect'));
			pos_6_pyrimi_conn.touchable = false;
			pos_6_pyrimi_conn.x = 218;	
			pos_6_pyrimi_conn.y = 315;
			
			pos_7_purine_conn = new Image(this.assets.getTexture('purine_connect'));
			pos_7_purine_conn.touchable = false;
			pos_7_purine_conn.x = 374;	
			pos_7_purine_conn.y = 343;
			
			pos_7_pyrimi_conn = new Image(this.assets.getTexture('pyrimidine_connect'));
			pos_7_pyrimi_conn.touchable = false;
			pos_7_pyrimi_conn.x = 374;	
			pos_7_pyrimi_conn.y = 315;
		
			pos_8_purine_conn = new Image(this.assets.getTexture('purine_connect'));
			pos_8_purine_conn.touchable = false;
			pos_8_purine_conn.x = 529;	
			pos_8_purine_conn.y = 343;
		
			pos_8_pyrimi_conn = new Image(this.assets.getTexture('pyrimidine_connect'));
			pos_8_pyrimi_conn.touchable = false;
			pos_8_pyrimi_conn.x = 529;	
			pos_8_pyrimi_conn.y = 315;
		
			pos_9_purine_conn = new Image(this.assets.getTexture('purine_connect'));
			pos_9_purine_conn.touchable = false;
			pos_9_purine_conn.x = 689;	
			pos_9_purine_conn.y = 343;
		
			pos_9_pyrimi_conn = new Image(this.assets.getTexture('pyrimidine_connect'));
			pos_9_pyrimi_conn.touchable = false;
			pos_9_pyrimi_conn.x = 689;	
			pos_9_pyrimi_conn.y = 315;
	
			pos_0_conn = new Image(this.assets.getTexture('at_connect'));
			pos_0_conn.touchable = false;
			pos_0_conn.x = 25;	
			pos_0_conn.y = 215;
			
			pos_1_conn = new Image(this.assets.getTexture('cg_connect'));
			pos_1_conn.touchable = false;
			pos_1_conn.x = 183;	
			pos_1_conn.y = 215;
		
			pos_2_conn = new Image(this.assets.getTexture('ta_connect'));
			pos_2_conn.touchable = false;
			pos_2_conn.x = 337;	
			pos_2_conn.y = 215;
			
			
			pos_3_conn = new Image(this.assets.getTexture('gc_connect'));
			pos_3_conn.touchable = false;
			pos_3_conn.x = 492;	
			pos_3_conn.y = 215;
		
			
			pos_4_conn = new Image(this.assets.getTexture('at_connect'));
			pos_4_conn.touchable = false;
			pos_4_conn.x = 653;	
			pos_4_conn.y = 215;
			
			pos_0 = new Image(this.assets.getTexture('adenine'));
			pos_0.touchable = false;
			pos_0.x = -8;	
			pos_0.y = 119-10;
			
			
			pos_1 = new Image(this.assets.getTexture('cytosine'));
			pos_1.touchable = false;
			pos_1.x = 0+150;	
			pos_1.y = 119-10;
		
			pos_2 = new Image(this.assets.getTexture('thymine'));
			pos_2.touchable = false;
			pos_2.x = 0+305;	
			pos_2.y = 119-10;
			
			pos_3 = new Image(this.assets.getTexture('adenine'));
			pos_3.touchable = false;
			pos_3.x = 0+460;	
			pos_3.y = 119-10;
			
			
			pos_4 = new Image(this.assets.getTexture('adenine'));
			pos_4.touchable = false;
			pos_4.x = 0+620;	
			pos_4.y = 119-10;

			pos_5 = new Image(this.assets.getTexture('thymine'));
			pos_5.touchable = false;
			pos_5.x = 0+162;	
			pos_5.y = 380+10;
			pos_5.rotation = 3.142;
			
			pos_6 = new Image(this.assets.getTexture('guanine'));
			pos_6.touchable = false;
			pos_6.x = 0+320;	
			pos_6.y = 380+10;
			pos_6.rotation = 3.142;
				
			pos_7 = new Image(this.assets.getTexture('adenine'));
			pos_7.touchable = false;
			pos_7.x = 0+475;	
			pos_7.y = 380+10;
			pos_7.rotation = 3.142;
		
			pos_8 = new Image(this.assets.getTexture('cytosine'));
			pos_8.touchable = false;
			pos_8.x = 0+631;	
			pos_8.y = 380+10;
			pos_8.rotation = 3.142;
		
			pos_9 = new Image(this.assets.getTexture('thymine'));
			pos_9.touchable = false;
			pos_9.x = 791;	
			pos_9.y = 380+10;
			pos_9.rotation = 3.142;
		
			hood = new Image(this.assets.getTexture('micro_hood'));
			hood.touchable = false;
			hood.x = 0;
			hood.y = 0;
			
			square_0 = new Image(this.assets.getTexture('square_yellow'));
			square_0.touchable = false;
			square_0.x = 125;
			square_0.y = 8;
			
			square_1 = new Image(this.assets.getTexture('square_red'));
			square_1.touchable = false;
			square_1.x = 351;
			square_1.y = 8;
			
			square_2 = new Image(this.assets.getTexture('square_red'));
			square_2.touchable = false;
			square_2.x = 460;
			square_2.y = 8;
			/*
			private var square_0:Image;
			private var square_1:Image;
			private var square_2:Image;
			*/
			
		
			pos_0_purine_conn.alpha = 0;
			pos_0_pyrimi_conn.alpha = 0;
			pos_1_purine_conn.alpha = 0;
			pos_1_pyrimi_conn.alpha = 0;
			pos_2_purine_conn.alpha = 0;
			pos_2_pyrimi_conn.alpha = 0;
			pos_3_purine_conn.alpha = 1;
			pos_3_pyrimi_conn.alpha = 0;
			pos_4_purine_conn.alpha = 0;
			pos_4_pyrimi_conn.alpha = 0;
			pos_5_purine_conn.alpha = 0;
			pos_5_pyrimi_conn.alpha = 0;
			pos_6_purine_conn.alpha = 0;
			pos_6_pyrimi_conn.alpha = 0;
			pos_7_purine_conn.alpha = 0;
			pos_7_pyrimi_conn.alpha = 0;
			pos_8_purine_conn.alpha = 0;
			pos_8_pyrimi_conn.alpha = 0;
			pos_9_purine_conn.alpha = 0;
			pos_9_pyrimi_conn.alpha = 0;
			pos_0_conn.alpha = 0;
			pos_1_conn.alpha = 0;
			pos_2_conn.alpha = 0;
			pos_3_conn.alpha = 0;
			pos_4_conn.alpha = 0;
			pos_0.alpha = 0;
			pos_1.alpha = 0;
			pos_2.alpha = 0;
			pos_3.alpha = 1;
			pos_4.alpha = 0;
			pos_5.alpha = 0;
			pos_6.alpha = 0;
			pos_7.alpha = 0;
			pos_8.alpha = 0;
			pos_9.alpha = 0;
			hood.alpha = 1;
			square_0.alpha = 1;
			square_1.alpha = 1;
			square_2.alpha = 1;
			
			/*
			private var pos_0_s0:String = 'n';
			private var pos_1_s0:String = 'n';
			private var pos_2_s0:String = 'n';
			private var pos_3_s0:String = 'a';
			private var pos_4_s0:String = 'n';
			private var pos_5_s0:String = 'n';
			private var pos_6_s0:String = 'n';
			private var pos_7_s0:String = 'n';
			private var pos_8_s0:String = 'n';
			private var pos_9_s0:String = 'n';
			*/
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
				trace("SPARK 00");
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_0_s0'] != undefined){	
					trace("SPARK 01");
					pos_0_s0 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_0_s0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_1_s0'] != undefined){	
					trace("SPARK 02");
					pos_1_s0 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_1_s0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_2_s0'] != undefined){	
					pos_2_s0 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_2_s0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_3_s0'] != undefined){	
					pos_3_s0 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_3_s0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_4_s0'] != undefined){	
					pos_4_s0 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_4_s0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_5_s0'] != undefined){	
					pos_5_s0 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_5_s0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_6_s0'] != undefined){	
					pos_6_s0 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_6_s0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_7_s0'] != undefined){	
					pos_7_s0 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_7_s0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_8_s0'] != undefined){	
					pos_8_s0 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_8_s0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_9_s0'] != undefined){	
					pos_9_s0 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_9_s0'];
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_0_s1'] != undefined){	
					pos_0_s1 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_0_s1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_1_s1'] != undefined){	
					pos_1_s1 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_1_s1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_2_s1'] != undefined){	
					pos_2_s1 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_2_s1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_3_s1'] != undefined){	
					pos_3_s1 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_3_s1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_4_s1'] != undefined){	
					pos_4_s1 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_4_s1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_5_s1'] != undefined){	
					pos_5_s1 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_5_s1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_6_s1'] != undefined){	
					pos_6_s1 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_6_s1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_7_s1'] != undefined){	
					pos_7_s1 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_7_s1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_8_s1'] != undefined){	
					pos_8_s1 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_8_s1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_9_s1'] != undefined){	
					pos_9_s1 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_9_s1'];
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_0_s2'] != undefined){	
					pos_0_s2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_0_s2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_1_s2'] != undefined){	
					pos_1_s2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_1_s2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_2_s2'] != undefined){	
					pos_2_s2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_2_s2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_3_s2'] != undefined){	
					pos_3_s2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_3_s2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_4_s2'] != undefined){	
					pos_4_s2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_4_s2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_5_s2'] != undefined){	
					pos_5_s2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_5_s2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_6_s2'] != undefined){	
					pos_6_s2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_6_s2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_7_s2'] != undefined){	
					pos_7_s2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_7_s2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_8_s2'] != undefined){	
					pos_8_s2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_8_s2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_9_s2'] != undefined){	
					pos_9_s2 = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['pos_9_s2'];
				}
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['Solved'] == 'yes'){	
					Solved = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['Set0Solved'] == 'yes'){	
					Set0Solved = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['Set1Solved'] == 'yes'){	
					Set1Solved = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['Set2Solved'] == 'yes'){	
					Set2Solved = true;
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['currentSet'] != undefined){
					currentSet = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope['currentSet'];				
				}
				if(currentSet == '0'){
					if(Set0Solved === false){
						square_0.texture = this.assets.getTexture('square_yellow');
					}
					if(Set1Solved === false){
						square_1.texture = this.assets.getTexture('square_red');
					}								
					if(Set2Solved === false){
						square_2.texture = this.assets.getTexture('square_red');
					}
				}else if(currentSet == '1'){
					if(Set0Solved === false){
						square_0.texture = this.assets.getTexture('square_red');
					}
					if(Set1Solved === false){
						square_1.texture = this.assets.getTexture('square_yellow');
					}								
					if(Set2Solved === false){
						square_2.texture = this.assets.getTexture('square_red');
					}
				}else if(currentSet == '2'){
					if(Set0Solved === false){
						square_0.texture = this.assets.getTexture('square_red');
					}
					if(Set1Solved === false){
						square_1.texture = this.assets.getTexture('square_red');
					}								
					if(Set2Solved === false){
						square_2.texture = this.assets.getTexture('square_yellow');
					}
				}
			
				ChangeSet(currentSet,true);
			}else{
				
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_g'] == 'Yes'){
					GAvailable = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_a'] == 'Yes'){
					AAvailable = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_c'] == 'Yes'){
					CAvailable = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomElectron['lever_t'] == 'Yes'){
					TAvailable = true;
				}
			}
			
			if(Set0Solved === true){
				square_0.texture = this.assets.getTexture('square_green');
			}
			if(Set1Solved === true){
				square_1.texture = this.assets.getTexture('square_green');
			}
			if(Set2Solved === true){
				square_2.texture = this.assets.getTexture('square_green');
			}
			/*\
			private var GAvailable:Boolean = false;
			private var AAvailable:Boolean = false;
			private var CAvailable:Boolean = false;
			private var TAvailable:Boolean = false;
			*/
			
			this.addChildAt(pos_0_purine_conn,1);
			this.addChildAt(pos_0_pyrimi_conn,2);
			this.addChildAt(pos_1_purine_conn,3);
			this.addChildAt(pos_1_pyrimi_conn,4);
			this.addChildAt(pos_2_purine_conn,5);
			this.addChildAt(pos_2_pyrimi_conn,6);
			this.addChildAt(pos_3_purine_conn,7);
			this.addChildAt(pos_3_pyrimi_conn,8);
			this.addChildAt(pos_4_purine_conn,9);
			this.addChildAt(pos_4_pyrimi_conn,10);
			
			this.addChildAt(pos_5_purine_conn,11);
			this.addChildAt(pos_5_pyrimi_conn,12);
			this.addChildAt(pos_6_purine_conn,13);
			this.addChildAt(pos_6_pyrimi_conn,14);
			this.addChildAt(pos_7_purine_conn,15);
			this.addChildAt(pos_7_pyrimi_conn,16);
			this.addChildAt(pos_8_purine_conn,17);
			this.addChildAt(pos_8_pyrimi_conn,18);
			this.addChildAt(pos_9_purine_conn,19);
			this.addChildAt(pos_9_pyrimi_conn,20);
			
			this.addChildAt(pos_0_conn,21);
			this.addChildAt(pos_1_conn,22);
			this.addChildAt(pos_2_conn,23);
			this.addChildAt(pos_3_conn,24);
			this.addChildAt(pos_4_conn,25);
			
			this.addChildAt(pos_0,26);
			this.addChildAt(pos_1,27);
			this.addChildAt(pos_2,28);
			this.addChildAt(pos_3,29);
			this.addChildAt(pos_4,30);
						
			this.addChildAt(pos_5,31);
			this.addChildAt(pos_6,32);
			this.addChildAt(pos_7,33);
			this.addChildAt(pos_8,34);
			this.addChildAt(pos_9,35);
			
			this.addChildAt(hood,36);
			this.addChildAt(square_0,37);
			this.addChildAt(square_1,38);
			this.addChildAt(square_2,39);
		
			
			CreatePosHits();
			CreateSetHits();
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
	
		//	(stage.getChildAt(0) as Object).AmbientObj.LoadSpaceHumPower(true,999);		
	//		(stage.getChildAt(0) as Object).AmbientObj.LoadDrone(true,999);		
		}
		
		private function CreateSetHits():void{
			/*
			private var hit_set_0:Shape;
			private var hit_set_1:Shape;
			private var hit_set_2:Shape;
			*/
			hit_set_0 = new Shape();
			hit_set_0.touchable = false;
			hit_set_0.graphics.beginFill(0xff0000);
			
			hit_set_0.graphics.lineTo(119,0);	
			hit_set_0.graphics.lineTo(172,0);	
			hit_set_0.graphics.lineTo(172,54);	
			hit_set_0.graphics.lineTo(119,54);	
	
			hit_set_0.graphics.endFill(false);
			hit_set_0.alpha = 0.0;
			
			hit_set_0.graphics.precisionHitTest = true;	
			
			hit_set_1 = new Shape();
			hit_set_1.touchable = false;
			hit_set_1.graphics.beginFill(0xff0000);
			
			hit_set_1.graphics.lineTo(345,0);	
			hit_set_1.graphics.lineTo(398,0);	
			hit_set_1.graphics.lineTo(398,54);	
			hit_set_1.graphics.lineTo(345,54);	
			
			hit_set_1.graphics.endFill(false);
			hit_set_1.alpha = 0.0;
			
			hit_set_1.graphics.precisionHitTest = true;	
			
			hit_set_2 = new Shape();
			hit_set_2.touchable = false;
			hit_set_2.graphics.beginFill(0xff0000);
			
			hit_set_2.graphics.lineTo(454,0);	
			hit_set_2.graphics.lineTo(508,0);	
			hit_set_2.graphics.lineTo(508,54);	
			hit_set_2.graphics.lineTo(454,54);	
			
			hit_set_2.graphics.endFill(false);
			hit_set_2.alpha = 0.0;
			
			hit_set_2.graphics.precisionHitTest = true;	
			
			this.addChild(hit_set_0);
			this.addChild(hit_set_1);
			this.addChild(hit_set_2);
			
		}
		
		private function CreatePosHits():void{
			hit_pos_0 = new Shape();
			hit_pos_0.touchable = false;
			hit_pos_0.graphics.beginFill(0xff0000);
			
			hit_pos_0.graphics.lineTo(15,112);	
			hit_pos_0.graphics.lineTo(155,112);	
			hit_pos_0.graphics.lineTo(155,247);	
			hit_pos_0.graphics.lineTo(15,247);	
		
			hit_pos_0.graphics.endFill(false);
			hit_pos_0.alpha = 0.0;
			
			hit_pos_0.graphics.precisionHitTest = true;	

			hit_pos_1 = new Shape();
			hit_pos_1.touchable = false;
			hit_pos_1.graphics.beginFill(0xff0000);
			
			hit_pos_1.graphics.lineTo(160,112);	
			hit_pos_1.graphics.lineTo(300,112);	
			hit_pos_1.graphics.lineTo(300,247);	
			hit_pos_1.graphics.lineTo(160,247);	
			
			hit_pos_1.graphics.endFill(false);
			hit_pos_1.alpha = 0.0;
			
			hit_pos_1.graphics.precisionHitTest = true;	
			
			
			hit_pos_2 = new Shape();
			hit_pos_2.touchable = false;
			hit_pos_2.graphics.beginFill(0xff0000);
			
			hit_pos_2.graphics.lineTo(301,112);	
			hit_pos_2.graphics.lineTo(468,112);	
			hit_pos_2.graphics.lineTo(468,247);	
			hit_pos_2.graphics.lineTo(301,247);	
			
			hit_pos_2.graphics.endFill(false);
			hit_pos_2.alpha = 0.0;
			
			hit_pos_2.graphics.precisionHitTest = true;	
			
			
			hit_pos_3 = new Shape();
			hit_pos_3.touchable = false;
			hit_pos_3.graphics.beginFill(0xff0000);
			
			hit_pos_3.graphics.lineTo(469,112);	
			hit_pos_3.graphics.lineTo(644,112);	
			hit_pos_3.graphics.lineTo(644,247);	
			hit_pos_3.graphics.lineTo(469,247);	
			
			hit_pos_3.graphics.endFill(false);
			hit_pos_3.alpha = 0.0;
			
			hit_pos_3.graphics.precisionHitTest = true;	
			
			
			hit_pos_4 = new Shape();
			hit_pos_4.touchable = false;
			hit_pos_4.graphics.beginFill(0xff0000);
			
			hit_pos_4.graphics.lineTo(646,112);	
			hit_pos_4.graphics.lineTo(790,112);	
			hit_pos_4.graphics.lineTo(790,247);	
			hit_pos_4.graphics.lineTo(646,247);	
			
			hit_pos_4.graphics.endFill(false);
			hit_pos_4.alpha = 0.0;
			
			hit_pos_4.graphics.precisionHitTest = true;	
			
			
			hit_pos_5 = new Shape();
			hit_pos_5.touchable = false;
			hit_pos_5.graphics.beginFill(0xff0000);
			
			hit_pos_5.graphics.lineTo(15,249);	
			hit_pos_5.graphics.lineTo(155,249);	
			hit_pos_5.graphics.lineTo(155,382);	
			hit_pos_5.graphics.lineTo(15,382);	
			
			hit_pos_5.graphics.endFill(false);
			hit_pos_5.alpha = 0.0;
			
			hit_pos_5.graphics.precisionHitTest = true;	
			
			hit_pos_6 = new Shape();
			hit_pos_6.touchable = false;
			hit_pos_6.graphics.beginFill(0xff0000);
			
			hit_pos_6.graphics.lineTo(160,249);	
			hit_pos_6.graphics.lineTo(300,249);	
			hit_pos_6.graphics.lineTo(300,382);	
			hit_pos_6.graphics.lineTo(160,382);	
			
			hit_pos_6.graphics.endFill(false);
			hit_pos_6.alpha = 0.0;
			
			hit_pos_6.graphics.precisionHitTest = true;	
			
			
			hit_pos_7 = new Shape();
			hit_pos_7.touchable = false;
			hit_pos_7.graphics.beginFill(0xff0000);
			
			hit_pos_7.graphics.lineTo(301,249);	
			hit_pos_7.graphics.lineTo(468,249);	
			hit_pos_7.graphics.lineTo(468,382);	
			hit_pos_7.graphics.lineTo(301,382);	
			
			hit_pos_7.graphics.endFill(false);
			hit_pos_7.alpha = 0.0;
			
			hit_pos_7.graphics.precisionHitTest = true;	
			
			
			hit_pos_8 = new Shape();
			hit_pos_8.touchable = false;
			hit_pos_8.graphics.beginFill(0xff0000);
			
			hit_pos_8.graphics.lineTo(469,249);	
			hit_pos_8.graphics.lineTo(644,249);	
			hit_pos_8.graphics.lineTo(644,382);	
			hit_pos_8.graphics.lineTo(469,382);	
			
			hit_pos_8.graphics.endFill(false);
			hit_pos_8.alpha = 0.0;
			
			hit_pos_8.graphics.precisionHitTest = true;	
			
			
			hit_pos_9 = new Shape();
			hit_pos_9.touchable = false;
			hit_pos_9.graphics.beginFill(0xff0000);
			
			hit_pos_9.graphics.lineTo(646,249);	
			hit_pos_9.graphics.lineTo(790,249);	
			hit_pos_9.graphics.lineTo(790,382);	
			hit_pos_9.graphics.lineTo(646,382);	
			
			hit_pos_9.graphics.endFill(false);
			hit_pos_9.alpha = 0.0;
			
			hit_pos_9.graphics.precisionHitTest = true;	
			
	
			
			this.addChild(hit_pos_0);
			this.addChild(hit_pos_1);
			this.addChild(hit_pos_2);
			this.addChild(hit_pos_3);
			this.addChild(hit_pos_4);
			this.addChild(hit_pos_5);
			this.addChild(hit_pos_6);
			this.addChild(hit_pos_7);
			this.addChild(hit_pos_8);
			this.addChild(hit_pos_9);
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
						
							FadeOut((GeneticsRoomElectron as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomElectronObj,false
							);
						}else if(hit_set_0.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							
							if(currentSet == '0'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsOne();
								ChangeSet('0');
								currentSet = '0';
								if(Set0Solved === false){
									square_0.texture = this.assets.getTexture('square_yellow');
								}
								if(Set1Solved === false){
									square_1.texture = this.assets.getTexture('square_red');
								}								
								if(Set2Solved === false){
									square_2.texture = this.assets.getTexture('square_red');
								}
							}
						}else if(hit_set_1.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentSet == '1'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsOne();
								ChangeSet('1');
								currentSet = '1';
								if(Set0Solved === false){
									square_0.texture = this.assets.getTexture('square_red');
								}
								if(Set1Solved === false){
									square_1.texture = this.assets.getTexture('square_yellow');
								}								
								if(Set2Solved === false){
									square_2.texture = this.assets.getTexture('square_red');
								}
							}
						}else if(hit_set_2.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(currentSet == '2'){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsOne();
								ChangeSet('2');
								currentSet = '2';
								if(Set0Solved === false){
									square_0.texture = this.assets.getTexture('square_red');
								}
								if(Set1Solved === false){
									square_1.texture = this.assets.getTexture('square_red');
								}								
								if(Set2Solved === false){
									square_2.texture = this.assets.getTexture('square_yellow');
								}
							}
							
						}else if(this['Set'+currentSet+'Solved'] === false){
							
							if(hit_pos_0.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								RandNoiseHandler(0);
								PosHandler(0,5);
							}else if(hit_pos_1.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(currentSet == '1'){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
								}else{
									RandNoiseHandler(1);
									PosHandler(1,6);
								}
								
							}else if(hit_pos_2.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								RandNoiseHandler(2);
								PosHandler(2,7);
														
							}else if(hit_pos_3.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(currentSet == '0'){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
								}else{
									RandNoiseHandler(3);
									PosHandler(3,8);
								}								
							}else if(hit_pos_4.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								RandNoiseHandler(4);
								PosHandler(4,9);
							}else if(hit_pos_5.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								RandNoiseHandler(5);
								PosHandler(5,0);
							}else if(hit_pos_6.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								RandNoiseHandler(6);
								PosHandler(6,1);
							}else if(hit_pos_7.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(currentSet == '2'){
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakTwo();
								}else{
									RandNoiseHandler(7);
									PosHandler(7,2);
								}								
							}else if(hit_pos_8.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								RandNoiseHandler(8);
								PosHandler(8,3);
							}else if(hit_pos_9.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								RandNoiseHandler(9);
								PosHandler(9,4);
							}
						}

					}
				}
			}
		}
		
		private function RandNoiseHandler(PosNum:int = 0):void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
			if(PosNum == 0){
				
				if(RONum == 0){
					RONum = 1;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
			}else if(PosNum == 1){
				if(RONum == 0){
					RONum = 1;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
				}else if(RONum == 2){
					RONum = 0;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
			}else if(PosNum == 2){
				if(RONum == 0){
					RONum = 1;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
					
				}else if(RONum == 2){
					RONum = 0;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
			}else if(PosNum == 3){
				if(RONum == 0){
					RONum = 1;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
			}else if(PosNum == 4){
				if(RONum == 0){
					RONum = 1;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
			}else if(PosNum == 5){
				if(RONum == 0){
					RONum = 1;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
			}else if(PosNum == 6){
				if(RONum == 0){
					RONum = 1;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
			}else if(PosNum == 7){
				if(RONum == 0){
					RONum = 1;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
			//		(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
			}else if(PosNum == 8){
				if(RONum == 0){
					RONum = 1;
					
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note00();
				}else if(RONum == 1){
					RONum = 2;
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note01();
				}else if(RONum == 2){
					RONum = 0;
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note02();
				}
			}else if(PosNum == 9){
				if(RONum == 0){
					RONum = 1;
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimeMove();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note03();
				}else if(RONum == 1){
					RONum = 2;
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimePlop();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note04();
				}else if(RONum == 2){
					RONum = 0;
					
				//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerOne();
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Note05();
				}
			}
		}
		private function ChangeSet(SetToGoTo:String,FromSave:Boolean = false):void{
		//	if(SetToGoTo == '0'){
				
		//	}else if(SetToGoTo == '1'){
				if(this['pos_0_s'+SetToGoTo] == 'n'){
					pos_0.alpha = 0;
					pos_0_conn.alpha = 0;
					pos_0_purine_conn.alpha = 0;
					pos_0_pyrimi_conn.alpha = 0;
				}else if(this['pos_0_s'+SetToGoTo] == 'a'){
					pos_0.texture = this.assets.getTexture('adenine');
					pos_0.alpha = 1;
					
					pos_0_purine_conn.alpha = 1;
					pos_0_pyrimi_conn.alpha = 0;
					if(this['pos_5_s'+SetToGoTo] == 't'){
						pos_0_conn.texture = this.assets.getTexture('at_connect');
						pos_0_conn.alpha = 1;
					}else{
						pos_0_conn.alpha = 0;
					}					
				}else if(this['pos_0_s'+SetToGoTo] == 't'){
					pos_0.texture = this.assets.getTexture('thymine');
					pos_0.alpha = 1;
					
					pos_0_purine_conn.alpha = 0;
					pos_0_pyrimi_conn.alpha = 1;
					if(this['pos_5_s'+SetToGoTo] == 'a'){
						pos_0_conn.texture = this.assets.getTexture('ta_connect');
						pos_0_conn.alpha = 1;
					}else{
						pos_0_conn.alpha = 0;
					}					
				}else if(this['pos_0_s'+SetToGoTo] == 'g'){
					pos_0.texture = this.assets.getTexture('guanine');
					pos_0.alpha = 1;
					
					pos_0_purine_conn.alpha = 1;
					pos_0_pyrimi_conn.alpha = 0;
					if(this['pos_5_s'+SetToGoTo] == 'c'){
						pos_0_conn.texture = this.assets.getTexture('gc_connect');
						pos_0_conn.alpha = 1;
					}else{
						pos_0_conn.alpha = 0;
					}					
				}else if(this['pos_0_s'+SetToGoTo] == 'c'){
					pos_0.texture = this.assets.getTexture('cytosine');
					pos_0.alpha = 1;
					
					pos_0_purine_conn.alpha = 0;
					pos_0_pyrimi_conn.alpha = 1;
					if(this['pos_5_s'+SetToGoTo] == 'g'){
						pos_0_conn.texture = this.assets.getTexture('cg_connect');
						pos_0_conn.alpha = 1;
					}else{
						pos_0_conn.alpha = 0;
					}	
				}
				
				if(this['pos_1_s'+SetToGoTo] == 'n'){
					pos_1.alpha = 0;
					pos_1_conn.alpha = 0;
					pos_1_purine_conn.alpha = 0;
					pos_1_pyrimi_conn.alpha = 0;
				}else if(this['pos_1_s'+SetToGoTo] == 'a'){
					pos_1.texture = this.assets.getTexture('adenine');
					pos_1.alpha = 1;
					
					pos_1_purine_conn.alpha = 1;
					pos_1_pyrimi_conn.alpha = 0;
					if(this['pos_6_s'+SetToGoTo] == 't'){
						pos_1_conn.texture = this.assets.getTexture('at_connect');
						pos_1_conn.alpha = 1;
					}else{
						pos_1_conn.alpha = 0;
					}					
				}else if(this['pos_1_s'+SetToGoTo] == 't'){
					pos_1.texture = this.assets.getTexture('thymine');
					pos_1.alpha = 1;
					
					pos_1_purine_conn.alpha = 0;
					pos_1_pyrimi_conn.alpha = 1;
					if(this['pos_6_s'+SetToGoTo] == 'a'){
						pos_1_conn.texture = this.assets.getTexture('ta_connect');
						pos_1_conn.alpha = 1;
					}else{
						pos_1_conn.alpha = 0;
					}					
				}else if(this['pos_1_s'+SetToGoTo] == 'g'){
					pos_1.texture = this.assets.getTexture('guanine');
					pos_1.alpha = 1;
					
					pos_1_purine_conn.alpha = 1;
					pos_1_pyrimi_conn.alpha = 0;
					if(this['pos_6_s'+SetToGoTo] == 'c'){
						pos_1_conn.texture = this.assets.getTexture('gc_connect');
						pos_1_conn.alpha = 1;
					}else{
						pos_1_conn.alpha = 0;
					}					
				}else if(this['pos_1_s'+SetToGoTo] == 'c'){
					pos_1.texture = this.assets.getTexture('cytosine');
					pos_1.alpha = 1;
					
					pos_1_purine_conn.alpha = 0;
					pos_1_pyrimi_conn.alpha = 1;
					if(this['pos_6_s'+SetToGoTo] == 'g'){
						pos_1_conn.texture = this.assets.getTexture('cg_connect');
						pos_1_conn.alpha = 1;
					}else{
						pos_1_conn.alpha = 0;
					}	
				}
				
				if(this['pos_2_s'+SetToGoTo] == 'n'){
					pos_2.alpha = 0;
					pos_2_conn.alpha = 0;
					pos_2_purine_conn.alpha = 0;
					pos_2_pyrimi_conn.alpha = 0;
				}else if(this['pos_2_s'+SetToGoTo] == 'a'){
					pos_2.texture = this.assets.getTexture('adenine');
					pos_2.alpha = 1;
					
					pos_2_purine_conn.alpha = 1;
					pos_2_pyrimi_conn.alpha = 0;
					if(this['pos_7_s'+SetToGoTo] == 't'){
						pos_2_conn.texture = this.assets.getTexture('at_connect');
						pos_2_conn.alpha = 1;
					}else{
						pos_2_conn.alpha = 0;
					}					
				}else if(this['pos_2_s'+SetToGoTo] == 't'){
					pos_2.texture = this.assets.getTexture('thymine');
					pos_2.alpha = 1;
					
					pos_2_purine_conn.alpha = 0;
					pos_2_pyrimi_conn.alpha = 1;
					if(this['pos_7_s'+SetToGoTo] == 'a'){
						pos_2_conn.texture = this.assets.getTexture('ta_connect');
						pos_2_conn.alpha = 1;
					}else{
						pos_2_conn.alpha = 0;
					}					
				}else if(this['pos_2_s'+SetToGoTo] == 'g'){
					pos_2.texture = this.assets.getTexture('guanine');
					pos_2.alpha = 1;
					
					pos_2_purine_conn.alpha = 1;
					pos_2_pyrimi_conn.alpha = 0;
					if(this['pos_7_s'+SetToGoTo] == 'c'){
						pos_2_conn.texture = this.assets.getTexture('gc_connect');
						pos_2_conn.alpha = 1;
					}else{
						pos_2_conn.alpha = 0;
					}					
				}else if(this['pos_2_s'+SetToGoTo] == 'c'){
					pos_2.texture = this.assets.getTexture('cytosine');
					pos_2.alpha = 1;
					
					pos_2_purine_conn.alpha = 0;
					pos_2_pyrimi_conn.alpha = 1;
					if(this['pos_7_s'+SetToGoTo] == 'g'){
						pos_2_conn.texture = this.assets.getTexture('cg_connect');
						pos_2_conn.alpha = 1;
					}else{
						pos_2_conn.alpha = 0;
					}	
				}
				
				if(this['pos_3_s'+SetToGoTo] == 'n'){
					pos_3.alpha = 0;
					pos_3_conn.alpha = 0;
					pos_3_purine_conn.alpha = 0;
					pos_3_pyrimi_conn.alpha = 0;
				}else if(this['pos_3_s'+SetToGoTo] == 'a'){
					pos_3.texture = this.assets.getTexture('adenine');
					pos_3.alpha = 1;
					
					pos_3_purine_conn.alpha = 1;
					pos_3_pyrimi_conn.alpha = 0;
					if(this['pos_8_s'+SetToGoTo] == 't'){
						pos_3_conn.texture = this.assets.getTexture('at_connect');
						pos_3_conn.alpha = 1;
					}else{
						pos_3_conn.alpha = 0;
					}					
				}else if(this['pos_3_s'+SetToGoTo] == 't'){
					pos_3.texture = this.assets.getTexture('thymine');
					pos_3.alpha = 1;
					
					pos_3_purine_conn.alpha = 0;
					pos_3_pyrimi_conn.alpha = 1;
					if(this['pos_8_s'+SetToGoTo] == 'a'){
						pos_3_conn.texture = this.assets.getTexture('ta_connect');
						pos_3_conn.alpha = 1;
					}else{
						pos_3_conn.alpha = 0;
					}					
				}else if(this['pos_3_s'+SetToGoTo] == 'g'){
					pos_3.texture = this.assets.getTexture('guanine');
					pos_3.alpha = 1;
					
					pos_3_purine_conn.alpha = 1;
					pos_3_pyrimi_conn.alpha = 0;
					if(this['pos_8_s'+SetToGoTo] == 'c'){
						pos_3_conn.alpha = 1;
					}else{
						pos_3_conn.alpha = 0;
					}					
				}else if(this['pos_3_s'+SetToGoTo] == 'c'){
					pos_3.texture = this.assets.getTexture('cytosine');
					pos_3.alpha = 1;
					
					pos_3_purine_conn.alpha = 0;
					pos_3_pyrimi_conn.alpha = 1;
					if(this['pos_8_s'+SetToGoTo] == 'g'){
						pos_3_conn.alpha = 1;
					}else{
						pos_3_conn.alpha = 0;
					}	
				}
				
				if(this['pos_4_s'+SetToGoTo] == 'n'){
					pos_4.alpha = 0;
					pos_4_conn.alpha = 0;
					pos_4_purine_conn.alpha = 0;
					pos_4_pyrimi_conn.alpha = 0;
				}else if(this['pos_4_s'+SetToGoTo] == 'a'){
					pos_4.texture = this.assets.getTexture('adenine');
					pos_4.alpha = 1;
					
					pos_4_purine_conn.alpha = 1;
					pos_4_pyrimi_conn.alpha = 0;
					if(this['pos_9_s'+SetToGoTo] == 't'){
						pos_4_conn.alpha = 1;
					}else{
						pos_4_conn.alpha = 0;
					}					
				}else if(this['pos_4_s'+SetToGoTo] == 't'){
					pos_4.texture = this.assets.getTexture('thymine');
					pos_4.alpha = 1;
					
					pos_4_purine_conn.alpha = 0;
					pos_4_pyrimi_conn.alpha = 1;
					if(this['pos_9_s'+SetToGoTo] == 'a'){
						pos_4_conn.texture = this.assets.getTexture('ta_connect');
						pos_4_conn.alpha = 1;
					}else{
						pos_4_conn.alpha = 0;
					}					
				}else if(this['pos_4_s'+SetToGoTo] == 'g'){
					pos_4.texture = this.assets.getTexture('guanine');
					pos_4.alpha = 1;
					
					pos_4_purine_conn.alpha = 1;
					pos_4_pyrimi_conn.alpha = 0;
					if(this['pos_9_s'+SetToGoTo] == 'c'){
						pos_4_conn.texture = this.assets.getTexture('gc_connect');
						pos_4_conn.alpha = 1;
					}else{
						pos_4_conn.alpha = 0;
					}					
				}else if(this['pos_4_s'+SetToGoTo] == 'c'){
					pos_4.texture = this.assets.getTexture('cytosine');
					pos_4.alpha = 1;
					
					pos_4_purine_conn.alpha = 0;
					pos_4_pyrimi_conn.alpha = 1;
					if(this['pos_9_s'+SetToGoTo] == 'g'){
						pos_4_conn.texture = this.assets.getTexture('cg_connect');
						pos_4_conn.alpha = 1;
					}else{
						pos_4_conn.alpha = 0;
					}	
				}
				
				
				if(this['pos_5_s'+SetToGoTo] == 'n'){
					pos_5.alpha = 0;
					//pos_5_conn.alpha = 0;
					pos_5_purine_conn.alpha = 0;
					pos_5_pyrimi_conn.alpha = 0;
				}else if(this['pos_5_s'+SetToGoTo] == 'a'){
					pos_5.texture = this.assets.getTexture('adenine');
					pos_5.alpha = 1;
					
					pos_5_purine_conn.alpha = 1;
					pos_5_pyrimi_conn.alpha = 0;
									
				}else if(this['pos_5_s'+SetToGoTo] == 't'){
					pos_5.texture = this.assets.getTexture('thymine');
					pos_5.alpha = 1;
					
					pos_5_purine_conn.alpha = 0;
					pos_5_pyrimi_conn.alpha = 1;
									
				}else if(this['pos_5_s'+SetToGoTo] == 'g'){
					pos_5.texture = this.assets.getTexture('guanine');
					pos_5.alpha = 1;
					
					pos_5_purine_conn.alpha = 1;
					pos_5_pyrimi_conn.alpha = 0;
										
				}else if(this['pos_5_s'+SetToGoTo] == 'c'){
					pos_5.texture = this.assets.getTexture('cytosine');
					pos_5.alpha = 1;
					
					pos_5_purine_conn.alpha = 0;
					pos_5_pyrimi_conn.alpha = 1;					
				}
				
				if(this['pos_6_s'+SetToGoTo] == 'n'){
					pos_6.alpha = 0;
					//pos_5_conn.alpha = 0;
					pos_6_purine_conn.alpha = 0;
					pos_6_pyrimi_conn.alpha = 0;
				}else if(this['pos_6_s'+SetToGoTo] == 'a'){
					pos_6.texture = this.assets.getTexture('adenine');
					pos_6.alpha = 1;
					
					pos_6_purine_conn.alpha = 1;
					pos_6_pyrimi_conn.alpha = 0;
					
				}else if(this['pos_6_s'+SetToGoTo] == 't'){
					pos_6.texture = this.assets.getTexture('thymine');
					pos_6.alpha = 1;
					
					pos_6_purine_conn.alpha = 0;
					pos_6_pyrimi_conn.alpha = 1;
					
				}else if(this['pos_6_s'+SetToGoTo] == 'g'){
					pos_6.texture = this.assets.getTexture('guanine');
					pos_6.alpha = 1;
					
					pos_6_purine_conn.alpha = 1;
					pos_6_pyrimi_conn.alpha = 0;
					
				}else if(this['pos_6_s'+SetToGoTo] == 'c'){
					pos_6.texture = this.assets.getTexture('cytosine');
					pos_6.alpha = 1;
					
					pos_6_purine_conn.alpha = 0;
					pos_6_pyrimi_conn.alpha = 1;
					
				}
				if(this['pos_7_s'+SetToGoTo] == 'n'){
					pos_7.alpha = 0;
					//pos_5_conn.alpha = 0;
					pos_7_purine_conn.alpha = 0;
					pos_7_pyrimi_conn.alpha = 0;
				}else if(this['pos_7_s'+SetToGoTo] == 'a'){
					pos_7.texture = this.assets.getTexture('adenine');
					pos_7.alpha = 1;
					
					pos_7_purine_conn.alpha = 1;
					pos_7_pyrimi_conn.alpha = 0;
					
				}else if(this['pos_7_s'+SetToGoTo] == 't'){
					pos_7.texture = this.assets.getTexture('thymine');
					pos_7.alpha = 1;
					
					pos_7_purine_conn.alpha = 0;
					pos_7_pyrimi_conn.alpha = 1;
					
				}else if(this['pos_7_s'+SetToGoTo] == 'g'){
					pos_7.texture = this.assets.getTexture('guanine');
					pos_7.alpha = 1;
					
					pos_7_purine_conn.alpha = 1;
					pos_7_pyrimi_conn.alpha = 0;
					
				}else if(this['pos_7_s'+SetToGoTo] == 'c'){
					pos_7.texture = this.assets.getTexture('cytosine');
					pos_7.alpha = 1;
					
					pos_7_purine_conn.alpha = 0;
					pos_7_pyrimi_conn.alpha = 1;
					
				}
				if(this['pos_8_s'+SetToGoTo] == 'n'){
					pos_8.alpha = 0;
					//pos_5_conn.alpha = 0;
					pos_8_purine_conn.alpha = 0;
					pos_8_pyrimi_conn.alpha = 0;
				}else if(this['pos_8_s'+SetToGoTo] == 'a'){
					pos_8.texture = this.assets.getTexture('adenine');
					pos_8.alpha = 1;
					
					pos_8_purine_conn.alpha = 1;
					pos_8_pyrimi_conn.alpha = 0;
					
				}else if(this['pos_8_s'+SetToGoTo] == 't'){
					pos_8.texture = this.assets.getTexture('thymine');
					pos_8.alpha = 1;
					
					pos_8_purine_conn.alpha = 0;
					pos_8_pyrimi_conn.alpha = 1;
					
				}else if(this['pos_8_s'+SetToGoTo] == 'g'){
					pos_8.texture = this.assets.getTexture('guanine');
					pos_8.alpha = 1;
					
					pos_8_purine_conn.alpha = 1;
					pos_8_pyrimi_conn.alpha = 0;
					
				}else if(this['pos_8_s'+SetToGoTo] == 'c'){
					pos_8.texture = this.assets.getTexture('cytosine');
					pos_8.alpha = 1;
					
					pos_8_purine_conn.alpha = 0;
					pos_8_pyrimi_conn.alpha = 1;
					
				}
				if(this['pos_9_s'+SetToGoTo] == 'n'){
					pos_9.alpha = 0;
					//pos_5_conn.alpha = 0;
					pos_9_purine_conn.alpha = 0;
					pos_9_pyrimi_conn.alpha = 0;
				}else if(this['pos_9_s'+SetToGoTo] == 'a'){
					pos_9.texture = this.assets.getTexture('adenine');
					pos_9.alpha = 1;
					
					pos_9_purine_conn.alpha = 1;
					pos_9_pyrimi_conn.alpha = 0;
					
				}else if(this['pos_9_s'+SetToGoTo] == 't'){
					pos_9.texture = this.assets.getTexture('thymine');
					pos_9.alpha = 1;
					
					pos_9_purine_conn.alpha = 0;
					pos_9_pyrimi_conn.alpha = 1;
					
				}else if(this['pos_9_s'+SetToGoTo] == 'g'){
					pos_9.texture = this.assets.getTexture('guanine');
					pos_9.alpha = 1;
					
					pos_9_purine_conn.alpha = 1;
					pos_9_pyrimi_conn.alpha = 0;
					
				}else if(this['pos_9_s'+SetToGoTo] == 'c'){
					pos_9.texture = this.assets.getTexture('cytosine');
					pos_9.alpha = 1;
					
					pos_9_purine_conn.alpha = 0;
					pos_9_pyrimi_conn.alpha = 1;
					
				}
				if(FromSave === false){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope;	
					}
					SaveArray['currentSet'] = SetToGoTo;
					
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomMicroscope',SaveArray);
				}
				
				
		}
		
		private function PosHandler(pos:Number,counterPos:Number):void{
			trace('pos: '+pos);
			trace('counterPos: '+counterPos);
			
			/*
			private var GAvailable:Boolean = false;
			private var AAvailable:Boolean = false;
			private var CAvailable:Boolean = false;
			private var TAvailable:Boolean = false;
			*/
			
		
			
			
			
			
			if(this['pos_'+pos+'_s'+currentSet] == 'n'){
				trace(':0');
				if(AAvailable === true){
					trace(':1');
					SetA(pos,counterPos);
				}else{
					trace(':2');
					if(TAvailable === true){
						trace(':4');
						SetT(pos,counterPos);
					}else{
						trace(':5');
						if(GAvailable === true){
							trace(':6');
							SetG(pos,counterPos);
						}else{
							trace(':7');
							if(CAvailable === true){
								trace(':8');
								SetC(pos,counterPos);
							}else{
								trace(':9');
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I can see two strands of molecules.");
							}
						}
					}
				}
				
				
			}else if(this['pos_'+pos+'_s'+currentSet] == 'a'){
				trace(':10');
				if(TAvailable === true){
					trace(':11');
					SetT(pos,counterPos);
				}else{
					trace(':12');
					if(GAvailable === true){
						trace(':13');
						SetG(pos,counterPos);
					}else{
						trace(':14');
						if(CAvailable === true){
							trace(':15');
							SetC(pos,counterPos);
						}else{
							trace(':16');
							SetN(pos,counterPos);
						}
					}
				}
			}else if(this['pos_'+pos+'_s'+currentSet] == 't'){
				trace(':16');
				if(GAvailable === true){
					trace(':17');
					SetG(pos,counterPos);
				}else{
					trace(':18');
					if(CAvailable === true){
						trace(':19');
						SetC(pos,counterPos);
					}else{
						trace(':20');
						SetN(pos,counterPos);
					}
				}
				
			}else if(this['pos_'+pos+'_s'+currentSet] == 'g'){
				trace(':21');
				if(CAvailable === true){
					trace(':22');
					SetC(pos,counterPos);
				}else{
					trace(':23');
					SetN(pos,counterPos);
				}
				
			}else if(this['pos_'+pos+'_s'+currentSet] == 'c'){
				trace(':24');
				SetN(pos,counterPos);
				
			}
			
		}
		
		
		
		private function SetN(pos:Number,counterPos:Number):void{
			this['pos_'+pos+'_s'+currentSet] = 'n';
			this['pos_'+pos].alpha = 0;
			this['pos_'+pos+'_purine_conn'].alpha = 0;
			this['pos_'+pos+'_pyrimi_conn'].alpha = 0;
			
			//	if(this['pos_'+counterPos+'_s'] == 't'){
			if(counterPos > 4){
				//	this['pos_'+pos+'_conn'].texture = this.assets.getTexture('cg_connect');
				this['pos_'+pos+'_conn'].alpha = 0;
			}else {
				//		this['pos_'+counterPos+'_conn'].texture = this.assets.getTexture('gc_connect');
				this['pos_'+counterPos+'_conn'].alpha = 0;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope;	
			}
			
			SaveArray['pos_'+pos+'_s'+currentSet] = this['pos_'+pos+'_s'+currentSet];
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomMicroscope',SaveArray);
			
			SolveSet(currentSet);
		}
		private function SetC(pos:Number,counterPos:Number):void{
			this['pos_'+pos+'_s'+currentSet] = 'c';
			this['pos_'+pos].texture = this.assets.getTexture('cytosine');
			this['pos_'+pos].alpha = 1;
			this['pos_'+pos+'_purine_conn'].alpha = 0;
			this['pos_'+pos+'_pyrimi_conn'].alpha = 1;
			
			if(this['pos_'+counterPos+'_s'+currentSet] == 'g'){
				if(counterPos > 4){
					this['pos_'+pos+'_conn'].texture = this.assets.getTexture('cg_connect');
					this['pos_'+pos+'_conn'].alpha = 1;
				}else{
					this['pos_'+counterPos+'_conn'].texture = this.assets.getTexture('gc_connect');
					this['pos_'+counterPos+'_conn'].alpha = 1;
				}
			}else{
				if(counterPos > 4){
					this['pos_'+pos+'_conn'].alpha = 0;
				}else{
					this['pos_'+counterPos+'_conn'].alpha = 0;
				}
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope;	
			}
			
			SaveArray['pos_'+pos+'_s'+currentSet] = this['pos_'+pos+'_s'+currentSet];
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomMicroscope',SaveArray);
			
			SolveSet(currentSet);
		}
		private function SetG(pos:Number,counterPos:Number):void{
			this['pos_'+pos+'_s'+currentSet] = 'g';
			this['pos_'+pos].texture = this.assets.getTexture('guanine');
			this['pos_'+pos].alpha = 1;
			this['pos_'+pos+'_purine_conn'].alpha = 1;
			this['pos_'+pos+'_pyrimi_conn'].alpha = 0;
			
			if(this['pos_'+counterPos+'_s'+currentSet] == 'c'){
				if(counterPos > 4){
					this['pos_'+pos+'_conn'].texture = this.assets.getTexture('gc_connect');
					this['pos_'+pos+'_conn'].alpha = 1;
				}else {
					this['pos_'+counterPos+'_conn'].texture = this.assets.getTexture('cg_connect');
					this['pos_'+counterPos+'_conn'].alpha = 1;
				}
			}else{
				if(counterPos > 4){
					this['pos_'+pos+'_conn'].alpha = 0;
				}else{
					this['pos_'+counterPos+'_conn'].alpha = 0;
				}
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope;	
			}
			
			SaveArray['pos_'+pos+'_s'+currentSet] = this['pos_'+pos+'_s'+currentSet];
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomMicroscope',SaveArray);
			
			SolveSet(currentSet);
		}
		private function SetA(pos:Number,counterPos:Number):void{
			this['pos_'+pos+'_s'+currentSet] = 'a';
			this['pos_'+pos].texture = this.assets.getTexture('adenine');
			this['pos_'+pos].alpha = 1;
			this['pos_'+pos+'_purine_conn'].alpha = 1;
			this['pos_'+pos+'_pyrimi_conn'].alpha = 0;
			
			if(this['pos_'+counterPos+'_s'+currentSet] == 't'){
				trace('bark 00');
				if(counterPos > 4){
					trace('bark 01');
					this['pos_'+pos+'_conn'].texture = this.assets.getTexture('at_connect');
					this['pos_'+pos+'_conn'].alpha = 1;
				}else {
					trace('bark 02');
					this['pos_'+counterPos+'_conn'].texture = this.assets.getTexture('ta_connect');
					this['pos_'+counterPos+'_conn'].alpha = 1;
				}
			}else{
				if(counterPos > 4){
					this['pos_'+pos+'_conn'].alpha = 0;
				}else{
					this['pos_'+counterPos+'_conn'].alpha = 0;
				}
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope;	
			}
			
			SaveArray['pos_'+pos+'_s'+currentSet] = this['pos_'+pos+'_s'+currentSet];
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomMicroscope',SaveArray);
			
			SolveSet(currentSet);
		}
		private function SetT(pos:Number,counterPos:Number):void{
			this['pos_'+pos+'_s'+currentSet] = 't';
			this['pos_'+pos].texture = this.assets.getTexture('thymine');
			this['pos_'+pos].alpha = 1;
			this['pos_'+pos+'_purine_conn'].alpha = 0;
			this['pos_'+pos+'_pyrimi_conn'].alpha = 1;
			
			if(this['pos_'+counterPos+'_s'+currentSet] == 'a'){
				trace('bark 03');
				if(counterPos > 4){
					trace('bark 04');
					this['pos_'+pos+'_conn'].texture = this.assets.getTexture('ta_connect');
					this['pos_'+pos+'_conn'].alpha = 1;
				}else {
					trace('bark 05');
					this['pos_'+counterPos+'_conn'].texture = this.assets.getTexture('at_connect');
					this['pos_'+counterPos+'_conn'].alpha = 1;
				}
			}else{
				if(counterPos > 4){
					this['pos_'+pos+'_conn'].alpha = 0;
				}else{
					this['pos_'+counterPos+'_conn'].alpha = 0;
				}
			}
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope;	
			}
			
			SaveArray['pos_'+pos+'_s'+currentSet] = this['pos_'+pos+'_s'+currentSet];
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomMicroscope',SaveArray);
			
			SolveSet(currentSet);
		}
		
		private function SolveSet(SetToSolve:String):void{
			trace("Solve Set:"+SetToSolve);
			if(SetToSolve == '0'){
				if(pos_0_s0 == 'g'){
					if(pos_1_s0 == 't'){
						if(pos_2_s0 == 'c'){
							if(pos_3_s0 == 'a'){
								if(pos_4_s0 == 't'){
									if(pos_5_s0 == 'c'){
										if(pos_6_s0 == 'a'){
											if(pos_7_s0 == 'g'){
												if(pos_8_s0 == 't'){
													if(pos_9_s0 == 'a'){
														Set0Solved = true;
														square_0.texture = this.assets.getTexture('square_green');
														(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiThree();
														
														if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
															SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope;	
														}														
														SaveArray['Set0Solved'] = 'yes';
														(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomMicroscope',SaveArray);
																											
														CheckSolve();
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}else if(SetToSolve == '1'){
				if(pos_0_s1 == 'a'){
					if(pos_1_s1 == 'c'){
						if(pos_2_s1 == 't'){
							if(pos_3_s1 == 'g'){
								if(pos_4_s1 == 'a'){
									if(pos_5_s1 == 't'){
										if(pos_6_s1 == 'g'){
											if(pos_7_s1 == 'a'){
												if(pos_8_s1 == 'c'){
													if(pos_9_s1 == 't'){
														Set1Solved = true;
														square_1.texture = this.assets.getTexture('square_green');
														(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiThree();
														
														if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
															SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope;	
														}														
														SaveArray['Set1Solved'] = 'yes';
														(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomMicroscope',SaveArray);
														
														CheckSolve();
														
													}
												}
											}
										}
									}
								}
							}
						}
					}
				}
			}else if(SetToSolve == '2'){
				if(pos_0_s2 == 'g'){
					if(pos_1_s2 == 'a'){
						if(pos_2_s2 == 'g'){
							if(pos_3_s2 == 't'){
								if(pos_4_s2 == 'c'){
									if(pos_5_s2 == 'c'){
										if(pos_6_s2 == 't'){
											if(pos_7_s2 == 'c'){
												if(pos_8_s2 == 'a'){
													if(pos_9_s2 == 'g'){
														trace("SOLVE 2");
														Set2Solved = true;
														square_2.texture = this.assets.getTexture('square_green');
														
														(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiThree();
														
														
														if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
															SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope;	
														}														
														SaveArray['Set2Solved'] = 'yes';
														(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomMicroscope',SaveArray);
														
														
														CheckSolve();
													}else{
														trace('fail on 9');
													}
												}else{
													trace('fail on 8');
												}
											}else{
												trace('fail on 7');
											}
										}else{
											trace('fail on 6');
										}
									}else{
										trace('fail on 5');
									}
								}else{
									trace('fail on 4');
								}
							}else{
								trace('fail on 3');
							}
						}else{
							trace('fail on 2');
						}
					}else{
						trace('fail on 1');
					}
				}else{
					trace('fail on 0');
				}
			}
		}
		
		private function CheckSolve():void{
			if(Set0Solved === true){
				if(Set1Solved === true){
					if(Set2Solved === true){
						Animating = true;
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope != undefined){	
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomMicroscope;	
						}														
						SaveArray['Solved'] = 'yes';
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomMicroscope',SaveArray);
					
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CosmicProcess();
						
						if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
							(stage.getChildAt(0) as Object).MusicObj.LoadJamLoop(true,3);
						}
						
						delayedCall = new DelayedCall(function():void{		
							RunSolve();
						}, 2);
						Starling.juggler.add(delayedCall);		
					}
				}
			}
		}
		private function RunSolve():void{
			FadeOut((GeneticsRoomElectron as Class), 
				(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomElectronObj,true
			);
			
									
			//	OpenDoorLeft();
				
			
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
			
			
			
			this.assets.removeTexture("geneticsRoomMicroscope_bg",true);
			this.assets.removeTexture("GeneticsRoomMicroscope_Sprite_01",true);
			this.assets.removeTextureAtlas("GeneticsRoomMicroscope_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomMicroscope_01");
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomMicroscope_02");
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomMicroscope_03");
			
			// stage.getChildAt(0) as Object).falseAsset("coastSurf_02");
			
			if(blackOut === true){
				(stage.getChildAt(0) as Object).screenGamePlayHandler.BlackOutRectangleFade(0,0.5);
			}
			(stage.getChildAt(0) as Object).screenGamePlayHandler.
				UnloadScene(
					
				);			
			
			this.dispose();
			
		}
	}
}
