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
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.utils.AssetManager;
	import starling.utils.rad2deg;
	
	public class BuildingOfficeLock extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var pos_0:Image;
		private var pos_1:Image;
		private var pos_2:Image;
		private var pos_3:Image;
		
		private var wheel_mc:MovieClip;
		
		private var num_0:Image;
		private var num_1:Image;
		private var num_2:Image;
		private var num_3:Image;
		
		private var hit_pos_0:Shape;
		private var hit_pos_1:Shape;
		private var hit_pos_2:Shape;
		private var hit_pos_3:Shape;
		
		private var hit_wheel:Shape;
		
		private var pos_0_val:int = 0;
		private var pos_1_val:int = 0;
		private var pos_2_val:int = 0;
		private var pos_3_val:int = 0;
		
		private var Animating:Boolean = false;
		
		private var PosFlag:String = null;
		private var MousePrevAngle:Number;
		private var MouseCurrentAngle:Number;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		
		public function BuildingOfficeLock(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('buildingOfficeLock_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeLock/buildingOfficeLock_bg.jpg'));
				game.TrackAssets('buildingOfficeLock_01');
			}
			if(game.CheckAsset('buildingOfficeLock_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeLock/BuildingOfficeLock_Sprite_01.png'));
				game.TrackAssets('buildingOfficeLock_02');
			}
			if(game.CheckAsset('buildingOfficeLock_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/BuildingOfficeLock/BuildingOfficeLock_Sprite_01.xml'));
				game.TrackAssets('buildingOfficeLock_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("BuildingOfficeLock","BuildingOfficeLockObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('buildingOfficeLock_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock['pos_0'] != undefined){	
					pos_0_val = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock['pos_0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock['pos_1'] != undefined){	
					pos_1_val = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock['pos_1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock['pos_2'] != undefined){	
					pos_2_val = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock['pos_2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock['pos_3'] != undefined){	
					pos_3_val = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock['pos_3'];
				}
			}
			
			
			pos_0 = new Image(this.assets.getTexture('pos_0_'+pos_0_val));
			pos_0.touchable = false;
			pos_0.x = 39;
			pos_0.y = 67;
			
			pos_1 = new Image(this.assets.getTexture('pos_1_'+pos_1_val));
			pos_1.touchable = false;
			pos_1.x = 248;
			pos_1.y = 68;
			
			pos_2 = new Image(this.assets.getTexture('pos_2_'+pos_2_val));
			pos_2.touchable = false;
			pos_2.x = 38;
			pos_2.y = 289;
			
			pos_3 = new Image(this.assets.getTexture('pos_3_'+pos_3_val));
			pos_3.touchable = false;
			pos_3.x = 249;
			pos_3.y = 290;
			
			wheel_mc = new MovieClip(this.assets.getTextures('wheel_'),12);
			wheel_mc.addFrameAt(4,this.assets.getTexture("wheel_0"), null, 0.0833);
			
			//	elevator_mc.smoothing = TextureSmoothing.NONE;
			wheel_mc.x = 499
			wheel_mc.y = 219;
			wheel_mc.touchable = false;
			wheel_mc.loop = false; 
		
			num_0 = new Image(this.assets.getTexture('in_'+pos_0_val));
			num_0.touchable = false;
			num_0.x = 481;
			num_0.y = 76;
			
			num_1 = new Image(this.assets.getTexture('in_'+pos_1_val));
			num_1.touchable = false;
			num_1.x = 555;
			num_1.y = 76;
			
			num_2 = new Image(this.assets.getTexture('in_'+pos_2_val));
			num_2.touchable = false;
			num_2.x = 629;
			num_2.y = 76;
			
			num_3 = new Image(this.assets.getTexture('in_'+pos_3_val));
			num_3.touchable = false;
			num_3.x = 701;
			num_3.y = 76;
			
			/*
			private var pos_0:Image;
			private var pos_1:Image;
			private var pos_2:Image;
			private var pos_3:Image;
			*/
			pos_0.alpha = 1;
			pos_1.alpha = 1;
			pos_2.alpha = 1;
			pos_3.alpha = 1;
			wheel_mc.alpha = 1;
			
			num_0.alpha = 1;
			num_1.alpha = 1;
			num_2.alpha = 1;
			num_3.alpha = 1;
			
			this.addChildAt(pos_0,1);
			this.addChildAt(pos_1,2);
			this.addChildAt(pos_2,3);
			this.addChildAt(pos_3,4);
			this.addChildAt(wheel_mc,5);
			this.addChildAt(num_0,6);
			this.addChildAt(num_1,7);
			this.addChildAt(num_2,8);
			this.addChildAt(num_3,9);
			
			CreatePosHit();
			CreateWheelHit();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			
			wheel_mc.stop();
			Starling.juggler.add(wheel_mc);
		}
		
		private function CreateWheelHit():void{
			hit_wheel = new Shape();
				
			hit_wheel.graphics.beginFill(0x0000FF);
				
			hit_wheel.graphics.lineTo(514,333);	
			hit_wheel.graphics.lineTo(536,278);	
			hit_wheel.graphics.lineTo(586,243);	
			hit_wheel.graphics.lineTo(656,243);	
			hit_wheel.graphics.lineTo(697,283);	
			hit_wheel.graphics.lineTo(712,342);	
			hit_wheel.graphics.lineTo(678,401);	
			hit_wheel.graphics.lineTo(612,432);	
			hit_wheel.graphics.lineTo(535,394);	
			
				
			hit_wheel.graphics.endFill(false);
			hit_wheel.alpha = 0.0;
			hit_wheel.touchable = false;
			hit_wheel.graphics.precisionHitTest = true;	
				
				this.addChild(hit_wheel);
		}
		
		private function CreatePosHit():void{
			hit_pos_0 = new Shape();
			
			hit_pos_0.graphics.beginFill(0x0000FF);
			
			hit_pos_0.graphics.lineTo(31,151);	
			hit_pos_0.graphics.lineTo(47,101);	
			hit_pos_0.graphics.lineTo(98,64);	
			hit_pos_0.graphics.lineTo(154,70);	
			hit_pos_0.graphics.lineTo(194,104);	
			hit_pos_0.graphics.lineTo(205,151);	
			hit_pos_0.graphics.lineTo(189,200);	
			hit_pos_0.graphics.lineTo(152,229);	
			hit_pos_0.graphics.lineTo(113,234);	
			hit_pos_0.graphics.lineTo(66,214);	
			hit_pos_0.graphics.lineTo(42,183);	
		
			hit_pos_0.graphics.endFill(false);
			hit_pos_0.alpha = 0.0;
			hit_pos_0.touchable = false;
			hit_pos_0.graphics.precisionHitTest = true;	
			
			
			hit_pos_1 = new Shape();
			
			hit_pos_1.graphics.beginFill(0x0000FF);
			
			hit_pos_1.graphics.lineTo(240,147);	
			hit_pos_1.graphics.lineTo(252,104);	
			hit_pos_1.graphics.lineTo(298,65);	
			hit_pos_1.graphics.lineTo(350,65);	
			hit_pos_1.graphics.lineTo(390,85);	
			hit_pos_1.graphics.lineTo(410,117);	
			hit_pos_1.graphics.lineTo(416,151);	
			hit_pos_1.graphics.lineTo(401,194);	
			hit_pos_1.graphics.lineTo(371,224);	
			hit_pos_1.graphics.lineTo(328,234);	
			hit_pos_1.graphics.lineTo(293,224);	
			hit_pos_1.graphics.lineTo(260,197);	
			hit_pos_1.graphics.lineTo(245,164);	
			
			
			hit_pos_1.graphics.endFill(false);
			hit_pos_1.alpha = 0.0;
			hit_pos_1.touchable = false;
			hit_pos_1.graphics.precisionHitTest = true;	
			
			
			hit_pos_2 = new Shape();
			
			hit_pos_2.graphics.beginFill(0x0000FF);
			
			hit_pos_2.graphics.lineTo(32,371);	
			hit_pos_2.graphics.lineTo(45,329);	
			hit_pos_2.graphics.lineTo(88,288);	
			hit_pos_2.graphics.lineTo(133,282);	
			hit_pos_2.graphics.lineTo(178,305);	
			hit_pos_2.graphics.lineTo(206,349);	
			hit_pos_2.graphics.lineTo(202,400);	
			hit_pos_2.graphics.lineTo(171,440);	
			hit_pos_2.graphics.lineTo(133,457);	
			hit_pos_2.graphics.lineTo(86,449);	
			
			
			hit_pos_2.graphics.endFill(false);
			hit_pos_2.alpha = 0.0;
			hit_pos_2.touchable = false;
			hit_pos_2.graphics.precisionHitTest = true;	
			
			hit_pos_3 = new Shape();
			
			hit_pos_3.graphics.beginFill(0x0000FF);
			
			hit_pos_3.graphics.lineTo(238,371);	
			hit_pos_3.graphics.lineTo(258,319);	
			hit_pos_3.graphics.lineTo(298,285);	
			hit_pos_3.graphics.lineTo(350,280);	
			hit_pos_3.graphics.lineTo(394,307);	
			hit_pos_3.graphics.lineTo(416,348);	
			hit_pos_3.graphics.lineTo(411,399);	
			hit_pos_3.graphics.lineTo(393,432);	
			hit_pos_3.graphics.lineTo(341,460);	
			hit_pos_3.graphics.lineTo(275,441);	
			hit_pos_3.graphics.lineTo(248,399);	
			
			
			hit_pos_3.graphics.endFill(false);
			hit_pos_3.alpha = 0.0;
			hit_pos_3.touchable = false;
			hit_pos_3.graphics.precisionHitTest = true;	
			
			this.addChild(hit_pos_0);
			this.addChild(hit_pos_1);
			this.addChild(hit_pos_2);
			this.addChild(hit_pos_3);
		}
		
		/*
		private var hit_pos_0:Shape;
		private var hit_pos_1:Shape;
		private var hit_pos_2:Shape;
		private var hit_pos_3:Shape;
		
		private var hit_wheel:Shape;
		*/
		
		private function TouchHandler(e:TouchEvent):void{
			targ = e.target;
			touches = e.getTouches(this);
			if (touches.length > 0){
				if(Animating === false){
					/*
					private var DiskFlag:String = null;
					private var MousePrevAngle:Number;
					private var MouseCurrentAngle:Number;
					*/
					if (touches[0].phase == TouchPhase.BEGAN) {
						PosFlag = null;
						MousePrevAngle = 0
						MouseCurrentAngle = 0
						if(targ == goback.SourceImage){
							
							
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Powm();
							FadeOut((BuildingOfficePainting as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficePaintingObj,true
							);
						}else if(hit_pos_0.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PosFlag = '0';
							MousePrevAngle = (
								((Math.atan2(touches[0].globalY-144, touches[0].globalX-129))
									*180
								)/ Math.PI
							)+180;
							//PosHandler(0);
						}else if(hit_pos_1.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PosFlag = '1';
							MousePrevAngle = (
								((Math.atan2(touches[0].globalY-142, touches[0].globalX-335))
									*180
								)/ Math.PI
							)+180;
						}else if(hit_pos_2.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PosFlag = '2';
							MousePrevAngle = (
								((Math.atan2(touches[0].globalY-370, touches[0].globalX-126))
									*180
								)/ Math.PI
							)+180;
						}else if(hit_pos_3.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							PosFlag = '3';
							MousePrevAngle = (
								((Math.atan2(touches[0].globalY-373, touches[0].globalX-332))
									*180
								)/ Math.PI
							)+180;
						}else if(hit_wheel.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							WheelHandler();
						}
					}
					else if (touches[0].phase == TouchPhase.ENDED) {
						trace(touches[0].globalX+" ,"+touches[0].globalY);
						if(PosFlag == null){
							
						}else{
							PosUpHandler();
						}
					}
				}
			}
		}
		private function PosUpHandler():void{
			if(PosFlag == '0'){
				MouseCurrentAngle = (
					((Math.atan2(touches[0].globalY-144, touches[0].globalX-129))
						*180
					)/ Math.PI
				)+180;
				
				PosChanger(0);
			}else if(PosFlag == '1'){
				MouseCurrentAngle = (
					((Math.atan2(touches[0].globalY-142, touches[0].globalX-335))
						*180
					)/ Math.PI
				)+180;
				
				PosChanger(1);
			}else if(PosFlag == '2'){
				MouseCurrentAngle = (
					((Math.atan2(touches[0].globalY-370, touches[0].globalX-126))
						*180
					)/ Math.PI
				)+180;
				
				PosChanger(2);
			}else if(PosFlag == '3'){
				MouseCurrentAngle = (
					((Math.atan2(touches[0].globalY-373, touches[0].globalX-332))
						*180
					)/ Math.PI
				)+180;
				
				PosChanger(3);
			}
		}
		
		private function PosChanger(pos:int):void{
			if((Math.abs(MouseCurrentAngle - MousePrevAngle)) > 10){
				trace('C: '+(MouseCurrentAngle));
				trace('P: '+(MousePrevAngle));
				trace('D:'+(Math.abs(MouseCurrentAngle - MousePrevAngle)));
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsTwo();
				if(MouseCurrentAngle > MousePrevAngle){
					
					this['pos_'+pos+'_val'] = (this['pos_'+pos+'_val'])-1;
					if(this['pos_'+pos+'_val'] < 0){
						this['pos_'+pos+'_val'] = 9;
					}
					this['pos_'+pos].texture = this.assets.getTexture('pos_'+pos+'_'+this['pos_'+pos+'_val']);
					this['num_'+pos].texture = this.assets.getTexture('in_'+this['pos_'+pos+'_val']);
				}else if(MouseCurrentAngle < MousePrevAngle){
					this['pos_'+pos+'_val'] = (this['pos_'+pos+'_val'])+1;
					if(this['pos_'+pos+'_val'] > 9){
						this['pos_'+pos+'_val'] = 0;
					}
					this['pos_'+pos].texture = this.assets.getTexture('pos_'+pos+'_'+this['pos_'+pos+'_val']);
					this['num_'+pos].texture = this.assets.getTexture('in_'+this['pos_'+pos+'_val']);
					
				}
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock;	
				}
				SaveArray['pos_'+pos] = this['pos_'+pos+'_val'];
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeLock',SaveArray);
				
			}
			PosFlag = null;
			MousePrevAngle = 0;
			MouseCurrentAngle = 0;
		}
		
		private function WheelHandler():void{
			
				if(pos_0_val == 1){
					if(pos_1_val == 2){
						if(pos_2_val == 3){
							if(pos_3_val == 1){
								Animating = true;
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsOne(4);
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock != undefined){	
									SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock;	
								}
								SaveArray['Solved'] = 'Yes';
								(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeLock',SaveArray);
								
								wheel_mc.currentFrame = 0;
								wheel_mc.removeFrameAt(4);
								wheel_mc.loop = true;
								wheel_mc.play();
								
								Starling.juggler.delayCall(function():void{
									(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
									FadeOut((BuildingOfficePainting as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.BuildingOfficePaintingObj,true
									);
								},2);
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsOne();
								wheel_mc.currentFrame = 0;
								wheel_mc.play();
							}
						}else{
							(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsOne();
							wheel_mc.currentFrame = 0;
							wheel_mc.play();
						}
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsOne();
						wheel_mc.currentFrame = 0;
						wheel_mc.play();
					}
				}else{
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_GearsOne();
					wheel_mc.currentFrame = 0;
					wheel_mc.play();
				}
		}
		private function PosHandler(pos:int):void{
			this['pos_'+pos+'_val'] = (this['pos_'+pos+'_val'])+1;
			if(this['pos_'+pos+'_val'] > 9){
				this['pos_'+pos+'_val'] = 0;
			}
			
			this['pos_'+pos].texture = this.assets.getTexture('pos_'+pos+'_'+this['pos_'+pos+'_val']);
			this['num_'+pos].texture = this.assets.getTexture('in_'+this['pos_'+pos+'_val']);
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock != undefined){	
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.BuildingOfficeLock;	
			}
			SaveArray['pos_'+pos] = this['pos_'+pos+'_val'];
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('BuildingOfficeLock',SaveArray);
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
			
			
			
			this.assets.removeTexture("buildingOfficeLock_bg",true);
			this.assets.removeTexture("BuildingOfficeLock_Sprite_01",true);
			this.assets.removeTextureAtlas("BuildingOfficeLock_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeLock_01");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeLock_02");
			(stage.getChildAt(0) as Object).falseAsset("buildingOfficeLock_03");
			
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