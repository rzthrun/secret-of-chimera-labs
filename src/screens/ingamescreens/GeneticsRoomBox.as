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
	import starling.utils.deg2rad;
	
	public class GeneticsRoomBox extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
	//	public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var door:Image;
		private var hood:Image;
		private var hand:Image;
		
		private var spot:Image;
		
		private var lead_left_sprite:Sprite;
		private var lead_left:Image;
		private var lead_right_sprite:Sprite;
		private var lead_right:Image;
		
		private var red_glow:Image;
		private var center_lazer:Image;
	
		private var hit_door:Shape;
		private var hit_lens:Shape;
		private var hit_base:Shape;
		private var hit_button:Shape;
		private var hit_hand:Shape;
		
		private var HandTween:Tween;
		private var LazerLeftTween:Tween;
		private var LazerRightTween:Tween;
		private var LazerLeftTweenTwo:Tween;
		private var LazerRightTweenTwo:Tween;
		private var SpotTween:Tween;
		
		private var DoorOpen:Boolean = false;
		private var NailsAttached:Boolean = false;
		private var IodineAttached:Boolean = false;
		private var GooAttached:Boolean = false;
		private var LensPuzzleSolved:Boolean = false;
		private var HandGrown:Boolean = false;
		private var HandPickedUp:Boolean = false
		
		private var Animating:Boolean = false;
		
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function GeneticsRoomBox(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('geneticsRoomBox_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomBox/geneticsRoomBox_bg.jpg'));
				game.TrackAssets('geneticsRoomBox_01');
			}
			if(game.CheckAsset('geneticsRoomBox_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomBox/GeneticsRoomBox_Sprite_01.png'));
				game.TrackAssets('geneticsRoomBox_02');
			}
			if(game.CheckAsset('geneticsRoomBox_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/GeneticsRoomBox/GeneticsRoomBox_Sprite_01.xml'));
				game.TrackAssets('geneticsRoomBox_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("GeneticsRoomBox","GeneticsRoomBoxObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('geneticsRoomBox_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
		/*	
			private var red_glow:Image;
			private var center_lazer:Image;
		*/
			red_glow = new Image(this.assets.getTexture('chamber_glow'));
			red_glow.touchable = false;
			red_glow.x = 354;
			red_glow.y = 145;
			
			center_lazer = new Image(this.assets.getTexture('lazer'));
			center_lazer.touchable = false;
			center_lazer.x = 374;
			center_lazer.y = 294;
			
			lead_left_sprite = new Sprite();
			lead_left_sprite.touchable = false;
			lead_left_sprite.pivotX = 14.5;
			lead_left_sprite.x = 233;
			lead_left_sprite.y = 243;
			lead_left_sprite.rotation = deg2rad(-40);
			
			lead_left = new Image(this.assets.getTexture('lead_left'));
			lead_left.touchable = false;
			lead_left.x = 0;
			lead_left.y = 0;
			
			lead_left_sprite.addChildAt(lead_left,0);
			
			
			lead_right_sprite = new Sprite();
			lead_right_sprite.touchable = false;
			lead_right_sprite.pivotX = 14.5;
			lead_right_sprite.x = 527;
			lead_right_sprite.y = 242;
			lead_right_sprite.rotation = deg2rad(40);
			
			lead_right = new Image(this.assets.getTexture('lead_right'));
			lead_right.touchable = false;
			//	lead_right.pivotX = 14.5;
			lead_right.x = 0;
			lead_right.y = 0;
			//	lead_right.rotation = deg2rad(45);
			
			lead_right_sprite.addChildAt(lead_right,0);
			
			hand = new Image(this.assets.getTexture('hand'));
			hand.touchable = false;
			hand.x = 324;
			hand.y = 401;
			
			hood = new Image(this.assets.getTexture('goo_hood'));
			hood.touchable = false;
			hood.x = 246;
			hood.y = 398;
			
			spot = new Image(this.assets.getTexture('spot_nails'));
			spot.touchable = false;
			spot.x = 332;
			spot.y = 380;
						
			
			
			door = new Image(this.assets.getTexture('door_on'));
			door.touchable = false;
			door.x = 0;
			door.y = 0;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomLensPuzzle['Solved'] == 'Yes'){
					LensPuzzleSolved = true;
					
				}else{
					//	door.alpha = 1;
				}
			}else{
				//	door.alpha = 1;
			}
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox['Nails'] == 'Attached'){
					trace("Nails Are Attached!!!!!!!!!!!!!!!!!!!!!!!");
					NailsAttached = true;
					spot.alpha = 1;
				//	spot.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox['HandGrown'] == 'Yes'){
					HandGrown = true;
					hand.x = 345;
					hand.y = 173;
					hand.alpha = 1;
					spot.alpha = 0;
				}else{
					hand.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox['Hand'] == 'PickedUp'){
					HandPickedUp = true;
					spot.alpha = 0;
					hand.alpha = 0;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox['IodineAttached'] == 'Yes'){
					IodineAttached = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox['GooAttached'] == 'Yes'){
					GooAttached = true;
				}
				//IodineAttached
				
				if(NailsAttached === false){
					if(GooAttached === false){
						if(IodineAttached === false){
							spot.alpha = 0;	
						}else{
							spot.texture = this.assets.getTexture('spot_iodine');
							spot.alpha = 1;	
						}
					}else{
						if(IodineAttached === false){
							spot.texture = this.assets.getTexture('spot_iodine');
							spot.alpha = 1;	
						}else{
							spot.texture = this.assets.getTexture('spot_iodine_goo');
							spot.alpha = 1;	
						}
					}
									
				}else{
					if(HandGrown === false){
						spot.alpha = 1;
						if(GooAttached === true){
							if(IodineAttached === true){
								spot.texture = this.assets.getTexture('spot_nails_iodine_goo');
								spot.alpha = 1;	
							}else{
								spot.texture = this.assets.getTexture('spot_nails_iodine');
								spot.alpha = 1;	
							}
						}else{
							if(IodineAttached === true){
								spot.texture = this.assets.getTexture('spot_nails_iodine_goo');
								spot.alpha = 1;	
							}else{
							//	spot.texture = this.assets.getTexture('spot_nails_iodine');
								spot.alpha = 1;	
							}
						//	spot.alpha = 1;	
						}
						
					}else{
						spot.alpha = 0;

					}
										
				}
				
			//	if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox['Goo'] == 'Attached'){
			//		HandTween.animate("y",173);
			//345	HandTween.animate("x",345);
			//	}
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox['Door'] == 'Open'){
					DoorOpen = true;
					door.alpha = 0;
				}else{
					door.alpha = 1;
				}
				if(LensPuzzleSolved === true){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox['FirstFire'] == 'Yes'){
						red_glow.alpha = 0;
						center_lazer.alpha = 0;
					}else{
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWave();
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_CrystalWave();
						
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
							SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox;
						}	
						SaveArray["FirstFire"] = "Yes";
						
						(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomBox',SaveArray);
						
						red_glow.alpha = 1;
						center_lazer.alpha = 1;
						lead_left.texture =this.assets.getTexture('lead_left_lazer');
						lead_right.texture =this.assets.getTexture('lead_right_lazer');
						
						SpotTween = new Tween(spot, 1.5, Transitions.LINEAR);			
						SpotTween.fadeTo(0);
						//	LazerLeftTween.animate("x",345);
						SpotTween.onComplete = function():void{		
							
							
						};
						Starling.juggler.add(SpotTween);	
						
						
						Animating = true;
						Starling.juggler.delayCall(RotateLazers,1.5);
					}
				}else{
					red_glow.alpha = 0;
					center_lazer.alpha = 0;
					
				}
				
			}else{
				door.alpha = 1;
				red_glow.alpha = 0;
				center_lazer.alpha = 0;
				spot.alpha = 0;
				hand.alpha = 0;
			}
		
			
			
			hood.alpha = 1;
			
			
			
			lead_left.alpha = 1;
			lead_right.alpha = 1;
		
			
			this.addChildAt(center_lazer,1);
			this.addChildAt(red_glow,2);
			this.addChildAt(lead_left_sprite,3);
			this.addChildAt(lead_right_sprite,4);
			this.addChildAt(hand,5);
			this.addChildAt(hood,6);
						
		
			
			
			this.addChildAt(spot,7);
			this.addChildAt(door,8);
			
			CreateButtonHit();
			CreateBaseHit();
			CreateLensHit();
			CreateHandHit();
			CreateDoorHit(DoorOpen);
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
			
			
		//	MoveArm();
		//	RotateLazers();
		}
	 
		
		//hit_door
		private function RotateLazers():void{
			trace("SMART 00");
			LazerLeftTween = new Tween(lead_left_sprite, 1, Transitions.LINEAR);			
			LazerLeftTween.animate("rotation", deg2rad(-60));
		//	LazerLeftTween.animate("x",345);
			LazerLeftTween.onComplete = function():void{		
				
				RotateBackLazers();
			};
			LazerRightTween = new Tween(lead_right_sprite, 1, Transitions.LINEAR);			
			LazerRightTween.animate("rotation", deg2rad(60));
			//	LazerLeftTween.animate("x",345);
			LazerRightTween.onComplete = function():void{		
				
				
			};
			Starling.juggler.add(LazerRightTween);	
			Starling.juggler.add(LazerLeftTween);	
			
		}
		private function RotateBackLazers():void{
			trace("SMART 01");
			LazerLeftTweenTwo = new Tween(lead_left_sprite, 2, Transitions.LINEAR);			
			LazerLeftTweenTwo.animate("rotation", deg2rad(-20));
			//	LazerLeftTween.animate("x",345);
			LazerLeftTweenTwo.onComplete = function():void{		
				RotateLazerFar();
			};
			LazerRightTweenTwo = new Tween(lead_right_sprite, 2, Transitions.LINEAR);			
			LazerRightTweenTwo.animate("rotation", deg2rad(20));
			//	LazerLeftTween.animate("x",345);
			LazerRightTweenTwo.onComplete = function():void{		
				//RotateLazerFar();
			};
			Starling.juggler.add(LazerRightTweenTwo);	
			Starling.juggler.add(LazerLeftTweenTwo);	
			
			
		}
		private function RotateLazerFar():void{
			trace("SMART 02");
			LazerLeftTween = new Tween(lead_left_sprite, 2, Transitions.LINEAR);			
			LazerLeftTween.animate("rotation", deg2rad(-60));
			//	LazerLeftTween.animate("x",345);
			LazerLeftTween.onComplete = function():void{		
				RotateLazerOriginal();
				//RotateBackLazers();
			};
			LazerRightTween = new Tween(lead_right_sprite, 2, Transitions.LINEAR);			
			LazerRightTween.animate("rotation", deg2rad(60));
			//	LazerLeftTween.animate("x",345);
			LazerRightTween.onComplete = function():void{		
				//RotateLazerOriginal();
				//RotateBackLazers();
			};
			Starling.juggler.add(LazerRightTween);	
			Starling.juggler.add(LazerLeftTween);	
			if(NailsAttached === true){
				trace("Love 02");
			
				if(GooAttached === true){
					trace("Love 00");
					if(HandGrown === false){
						trace("Love 01");
						MoveArm();
					}
				}
				
			}
			
			
		}
		private function RotateLazerOriginal():void{
			trace("SMART 03");
			LazerLeftTweenTwo = new Tween(lead_left_sprite, 1, Transitions.LINEAR);			
			LazerLeftTweenTwo.animate("rotation", deg2rad(-40));
			//	LazerLeftTween.animate("x",345);
			LazerLeftTweenTwo.onComplete = function():void{		
				
				//RotateBackLazers();
			};
			LazerRightTweenTwo = new Tween(lead_right_sprite, 1, Transitions.LINEAR);			
			LazerRightTweenTwo.animate("rotation", deg2rad(40));
			//	LazerLeftTween.animate("x",345);
			LazerRightTweenTwo.onComplete = function():void{		
				LeadLazersComplete();
				//RotateBackLazers();
			};
			Starling.juggler.add(LazerRightTweenTwo);	
			Starling.juggler.add(LazerLeftTweenTwo);	
		}
		private function LeadLazersComplete():void{
			trace("SMART 04");
			lead_left.texture =this.assets.getTexture('lead_left');
			lead_right.texture =this.assets.getTexture('lead_right');
			red_glow.alpha = 0;
			center_lazer.alpha = 0;
			
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Machine();
			//(stage.getChildAt(0) as Object).SoundFXObj.soundManager.stopSound("MachineThree");
			if(NailsAttached === false){
				trace("Roda");
				Animating= false;
			//	spot.alpha = 1;
				
				SpotTween = new Tween(spot, 0.5, Transitions.LINEAR);			
				SpotTween.fadeTo(1);
				//	LazerLeftTween.animate("x",345);
				SpotTween.onComplete = function():void{			
				};
				Starling.juggler.add(SpotTween);	
				
			}else if(HandGrown === true){
				trace("jodi");
				Animating= false;
				spot.alpha = 0;
			//	SpotTween = new Tween(spot, 0.5, Transitions.LINEAR);			
			//	SpotTween.fadeTo(0);
				//	LazerLeftTween.animate("x",345);
			//	SpotTween.onComplete = function():void{			
			//	};
			//	Starling.juggler.add(SpotTween);	
			}else if(GooAttached === false){
				Animating= false;
				SpotTween = new Tween(spot, 0.5, Transitions.LINEAR);			
				SpotTween.fadeTo(1);
				//	LazerLeftTween.animate("x",345);
				SpotTween.onComplete = function():void{			
				};
				Starling.juggler.add(SpotTween);	
			}
		}
		
		private function MoveArm():void{
			trace("SMART 05");
			HandGrown = true;
			spot.alpha = 0;
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Ohm();
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerTwo();
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox;
			}	
			SaveArray["HandGrown"] = "Yes";
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomBox',SaveArray);
			
			hand.alpha = 1;
			HandTween = new Tween(hand, 3.5, Transitions.EASE_OUT);			
			HandTween.animate("y",173);
			HandTween.animate("x",345);
			HandTween.onComplete = function():void{		
				
			//	HandTween = null;
				//FadeOutCabbage();	
				//OrbMoveComplete();
			//	MoveArm();
				Animating = false;
			};
			Starling.juggler.add(HandTween);		
			
			if((stage.getChildAt(0) as Object).MusicObj.currentSong == null){
				
				Starling.juggler.delayCall(function():void{
					(stage.getChildAt(0) as Object).MusicObj.LoadSoYoung(true,2);
					
				},1);
			}
		}
		
		private function CreateDoorHit(open:Boolean = false):void{
			hit_door = new Shape();		
			hit_door.x = 0;
			hit_door.y = 0;
			hit_door.graphics.beginFill(0x0000FF);
			if(open === false){	
				
				
				hit_door.graphics.lineTo(59,0);
				hit_door.graphics.lineTo(680,0);
				hit_door.graphics.lineTo(635,501);
				hit_door.graphics.lineTo(111,494);
				
			}else{
				
				hit_door.graphics.lineTo(0,0);
				hit_door.graphics.lineTo(59,0);
				hit_door.graphics.lineTo(111,491);
				hit_door.graphics.lineTo(0,512);
				
			}
			
			hit_door.graphics.endFill(false);			
			hit_door.alpha = 0.0;			
			hit_door.graphics.precisionHitTest = true;	
			hit_door.touchable = false
			this.addChild(hit_door);
			
			
			
		}
		
		//hit_button
		private function CreateHandHit():void{
			hit_hand = new Shape();
			hit_hand.touchable = false;
			hit_hand.graphics.beginFill(0xff0000);
			
			hit_hand.graphics.lineTo(331,202);	
			hit_hand.graphics.lineTo(371,162);	
			hit_hand.graphics.lineTo(434,161);	
			hit_hand.graphics.lineTo(460,222);	
			hit_hand.graphics.lineTo(422,305);	
			hit_hand.graphics.lineTo(413,414);	
			hit_hand.graphics.lineTo(333,412);	
		
			hit_hand.graphics.endFill(false);
			hit_hand.alpha = 0.0;
			
			hit_hand.graphics.precisionHitTest = true;	
			this.addChild(hit_hand);
		}
		
		
		private function CreateButtonHit():void{
			hit_button = new Shape();
			hit_button.touchable = false;
			hit_button.graphics.beginFill(0xff0000);
			
			hit_button.graphics.lineTo(675,231);	
			hit_button.graphics.lineTo(680,183);	
			hit_button.graphics.lineTo(723,143);	
			hit_button.graphics.lineTo(774,145);	
			hit_button.graphics.lineTo(797,179);	
			hit_button.graphics.lineTo(795,229);	
			hit_button.graphics.lineTo(762,259);	
			
			hit_button.graphics.endFill(false);
			hit_button.alpha = 0.0;
			
			hit_button.graphics.precisionHitTest = true;	
			this.addChild(hit_button);
		}
		
		private function CreateBaseHit():void{
			hit_base = new Shape();
			hit_base.touchable = false;
			hit_base.graphics.beginFill(0xff0000);
			
			hit_base.graphics.lineTo(273,370);	
			hit_base.graphics.lineTo(493,371);	
			hit_base.graphics.lineTo(508,428);	
			hit_base.graphics.lineTo(247,424);	
		
			hit_base.graphics.endFill(false);
			hit_base.alpha = 0.0;
			
			hit_base.graphics.precisionHitTest = true;	
			this.addChild(hit_base);
		}
		
		private function CreateLensHit():void{
			hit_lens = new Shape();
			hit_lens.touchable = false;
			hit_lens.graphics.beginFill(0xff0000);
			
			hit_lens.graphics.lineTo(303,154);	
			hit_lens.graphics.lineTo(331,93);	
			hit_lens.graphics.lineTo(385,76);	
			hit_lens.graphics.lineTo(441,105);	
			hit_lens.graphics.lineTo(464,152);	
			hit_lens.graphics.lineTo(461,200);	
			hit_lens.graphics.lineTo(435,238);	
			hit_lens.graphics.lineTo(336,242);	
			
			hit_lens.graphics.endFill(false);
			hit_lens.alpha = 0.0;
			
			hit_lens.graphics.precisionHitTest = true;	
			this.addChild(hit_lens);
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
							FadeOut((GeneticsRoom as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomObj,true
							);
							
							
						}else if(hit_button.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(LensPuzzleSolved === true){
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MachineFour();
								red_glow.alpha = 1;
								center_lazer.alpha = 1;
							//	spot.alpha = 1;
								lead_left.texture =this.assets.getTexture('lead_left_lazer');
								lead_right.texture =this.assets.getTexture('lead_right_lazer');
								Animating = true;
								
								SpotTween = new Tween(spot, 1, Transitions.LINEAR);			
								SpotTween.fadeTo(0);
								//	LazerLeftTween.animate("x",345);
								SpotTween.onComplete = function():void{		
									
									
								};
								Starling.juggler.add(SpotTween);	
								
								
								Starling.juggler.delayCall(RotateLazers,1);
							}
						}else if(DoorOpen === false){
							if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								DoorHandler();
							}
							
						}else{
							if(hit_lens.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(LensPuzzleSolved === false){
									FadeOut((GeneticsRoomLensPuzzle as Class), 
										(stage.getChildAt(0) as Object).screenGamePlayHandler.GeneticsRoomLensPuzzleObj,true
									);
								}else if(hit_hand.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									if(HandGrown === true){
										HandHandler();
									}
								//	if(GooAttached === true){
								//		if(NailsAttached === true){
								//			HandHandler();
								//		}
								//	}
									
								}	
							}else if(hit_door.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								DoorHandler();
							}else if(hit_base.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								BaseHandler();
							}else if(hit_hand.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(HandGrown === true){
									HandHandler();
								}
							}	
						}
					}
				}
			}
		}
		private function HandHandler():void{
			trace("Hand Handler");
			if(HandPickedUp === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SlimerTwo();
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.AddItemToInventory(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_Hand,
					'item_Hand',
					'inven_hand_sm'
				);
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox;	
				}
				HandPickedUp = true;
				hand.alpha = 0;
				SaveArray['Hand'] = "PickedUp";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomBox',SaveArray);
				
			}
				
			
		}
		
		private function BaseHandler():void{
			if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_SampleNails)
				
			{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ItemPlace();
				NailsAttached = true;
				if(IodineAttached === true){
					if(GooAttached === true){
						spot.texture = this.assets.getTexture('spot_nails_iodine_goo');
					}else{
						spot.texture = this.assets.getTexture('spot_nails_iodine');
					}
				}else{
					if(GooAttached === true){
						spot.texture = this.assets.getTexture('spot_nails_iodine');
					}else{
						spot.texture = this.assets.getTexture('spot_nails');
					}
				}
				spot.alpha = 1;
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox;
				}	
				SaveArray["Nails"] = "Attached";
				
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomBox',SaveArray);
				
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
					.InventoryObj.removeItemFromInventory(
						(stage.getChildAt(0) as Object)
						.screenGamePlayHandler
						.InventoryObj.item_SampleNails,
						"item_SampleNails"
					);
				
				
				
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_Iodine)				
			{
				
				IodineAttached = true;
				if(NailsAttached === true){
					if(GooAttached === true){
						spot.texture = this.assets.getTexture('spot_nails_iodine_goo');
					}else{
						spot.texture = this.assets.getTexture('spot_nails_iodine');
					}
				}else{
					if(GooAttached === true){
						spot.texture = this.assets.getTexture('spot_iodine_goo');
					}else{
						spot.texture = this.assets.getTexture('spot_iodine');
					}
				}
				
				spot.alpha = 1;
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox;
				}	
				SaveArray["IodineAttached"] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomBox',SaveArray);
				
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_TestTube)				
			{
				GooAttached = true;
				if(NailsAttached === true){
					if(IodineAttached === true){
						spot.texture = this.assets.getTexture('spot_nails_iodine_goo');
					}else{
						spot.texture = this.assets.getTexture('spot_nails_iodine');
					}
				}else{
					if(IodineAttached === true){
						spot.texture = this.assets.getTexture('spot_iodine_goo');
					}else{
						spot.texture = this.assets.getTexture('spot_iodine');
					}
				}
				spot.alpha = 1;
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox;
				}	
				SaveArray["GooAttached"] = "Yes";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomBox',SaveArray);
				
				(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.ChangeInventoryItem(
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_TestTubeHalf,
					'item_TestTubeHalf',
					'inven_testTubeHalf_sm',
					(stage.getChildAt(0) as Object).screenGamePlayHandler.InventoryObj.item_TestTube,
					'item_TestTube'
				);
				
				
			}else if((stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.armedItem
				== 
				(stage.getChildAt(0) as Object)
				.screenGamePlayHandler
				.InventoryObj.inventoryBarObj
				.item_TestTubeHalf)
			{
				if(GooAttached === false){
					GooAttached = true;
					if(NailsAttached === true){
						if(IodineAttached === true){
							spot.texture = this.assets.getTexture('spot_nails_iodine_goo');
						}else{
							spot.texture = this.assets.getTexture('spot_nails_iodine');
						}
					}else{
						if(IodineAttached === true){
							spot.texture = this.assets.getTexture('spot_iodine_goo');
						}else{
							spot.texture = this.assets.getTexture('spot_iodine');
						}
					}
					spot.alpha = 1;
					
					
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox;
					}	
					SaveArray["GooAttached"] = "Yes";
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomBox',SaveArray);
					
					(stage.getChildAt(0) as Object)
					.screenGamePlayHandler
						.InventoryObj.removeItemFromInventory(
							(stage.getChildAt(0) as Object)
							.screenGamePlayHandler
							.InventoryObj.item_TestTubeHalf,
							"item_TestTubeHalf"
						);
				}else{
					(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("Probably should save some of the recombinant DNA solution...");
				}	
			}else{
				if(NailsAttached === true){
					if(IodineAttached === true){
						if(GooAttached === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("I've placed the nail clippings, several drops of iodine, and the recombinant DNA onto the agar solution.");
						}else{
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The nail clippings sit in a few drops of iodine upon the surface of the nutrient jelly.");
						}
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The nail clippings sit on the sticky surface of the nutrient rich agar jelly.");
					}
				}else{
					if(IodineAttached === true){
						if(GooAttached === true){
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("The nail clippings sit on the sticky surface of the nutrient rich agar jelly.");
						}else{
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("They jelly has absorbed the few drops of iodine. It is slowly diffusing through the solution.");
						}
					}else{
						(stage.getChildAt(0) as Object).screenGamePlayHandler.ReadOutObj.ToggleReadOut("A shallow tray sits in the machine. It is filled with an orange-pink semi-transparent jelly.");
					}
				}
			}
		}
		
		private function DoorHandler():void{
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.GeneticsRoomBox;
			}	
			if(DoorOpen === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxOpen();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
				DoorOpen = true;
				door.alpha = 0;
				hit_door._graphics.clear();
				CreateDoorHit(true);
				SaveArray["Door"] = "Open";
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_MetalBoxClose();
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThumpTwo();
				DoorOpen = false;
				door.alpha = 1;
				hit_door._graphics.clear();
				CreateDoorHit(false);
				SaveArray["Door"] = "Closed";
			}
		
			
		
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('GeneticsRoomBox',SaveArray);
			
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
			
			
			
			this.assets.removeTexture("geneticsRoomBox_bg",true);
			this.assets.removeTexture("GeneticsRoomBox_Sprite_01",true);
			this.assets.removeTextureAtlas("GeneticsRoomBox_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomBox_01");
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomBox_02");
			(stage.getChildAt(0) as Object).falseAsset("geneticsRoomBox_03");
			
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