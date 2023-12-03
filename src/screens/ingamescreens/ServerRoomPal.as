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
	import starling.events.EnterFrameEvent;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.TextField;
	import starling.utils.AssetManager;
	import starling.utils.HAlign;
	import starling.utils.VAlign;
	import starling.utils.deg2rad;
	
	public class ServerRoomPal extends Sprite
	{
		private var assets:AssetManager;
		private var game:Game;
		public var SaveArray:Array = new Array();
		
		private var bg:Image;
		
		private var button_video:Image;
		private var button_logs:Image;
		private var button_adimm:Image;
		
		private var bread_crumb:Image;
		
		private var hit_button_video:Shape;
		private var hit_button_logs:Shape;
		private var hit_button_adimm:Shape;
		
		private var videoSprite:Sprite;
		private var video_bg:Image;
		private var video_pos_00:Image;
		private var video_pos_01:Image;
		private var video_pos_02:Image;
		private var video_pos_03:Image;
		private var video_pos_04:Image;
		private var video_pos_05:Image;
		
		private var logsSprite:Sprite;
		private var logs_outline:Image;
		private var logs_header:Image;
		private var logs_number:Image;
		private var logs_text:Image;
		private var hit_logs_left:Shape;
		private var hit_logs_right:Shape;
		
		
		private var adimmSprite:Sprite;
		private var adimm_outline:Image;
		private var adimm_cube:Image;		
		private var adimm_disc_00:Image;
		private var adimm_disc_01:Image;
		private var adimm_disc_02:Image;
		private var adimm_disc_03:Image;
		private var adimm_error_00:Image;
		private var adimm_error_01:Image;
		private var adimm_error_02:Image;
		private var adimm_error_03:Image;
		private var adimm_popup:Image;
		private var adimm_popup_text:Image;
		private var hit_disc_00:Shape;
		private var hit_disc_01:Shape;
		private var hit_disc_02:Shape;
		private var hit_disc_03:Shape;
		private var hit_popup_yes:Shape;
		private var hit_popup_no:Shape;
		
		private var adimm_error_00_Clicked:Boolean = false;
		private var adimm_error_01_Clicked:Boolean = false;
		private var adimm_error_02_Clicked:Boolean = false;
		private var adimm_error_03_Clicked:Boolean = false;
		
		
		private var pcSprite:Sprite;
		private var pc_outline:Image;
		private var pc_bg:Image;
		private var pc_status:Image;
		private var pc_txt_00:TextField;
		private var pc_txt_01:TextField;
		private var pc_txt_02:TextField;
		private var pc_highlight:Image;
		
		private var hit_pc_left:Shape;
		private var hit_pc_right:Shape;
		private var hit_pc_pos_00_up:Shape;
		private var hit_pc_pos_00_down:Shape;
		private var hit_pc_pos_01_up:Shape;
		private var hit_pc_pos_01_down:Shape;
		private var hit_pc_pos_02_up:Shape;
		private var hit_pc_pos_02_down:Shape;
		private var hit_pc_enter:Shape;
		private var pc_pos:int = 0;
		
		private var fruit_arr:Array = new Array(
			'sphere',
			'apple',
			'eggplant',
			'cylinder',
			'orange',
			'cube'
			);
		
		private var EggplantAttached:Boolean = false;
		private var CubeDamageAttached:Boolean = false;
		private var CubeAttached:Boolean = false;
		private var LidClosed:Boolean = false;
		private var PassCodeSolved:Boolean = false;
		private var AdimmPopUpOpen:Boolean = false;
		private var AdimmPopUpChoice:Boolean = false;
		private var DiaStep01:Boolean = false;
		private var DiaStep02:Boolean = false;
		private var LogsCurrentPage:int = 0;
		private var delayedCall:DelayedCall;
		private var CurrentScreen:String = 'logs';
		private var Animating:Boolean = false;
		private var AdimmRepaired:Boolean = false;
		
		private var touches:Vector.<Touch>;
		private var targ:Object;
		private var goback:GoBackButton;		
		
		public function ServerRoomPal(_assets:AssetManager,_game:Game)
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
			if(game.CheckAsset('serverRoomPal_01') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoomPal/serverRoomPal_bg.jpg'));
				game.TrackAssets('serverRoomPal_01');
			}
			if(game.CheckAsset('serverRoomPal_02') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoomPal/ServerRoomPal_Sprite_01.png'));
				game.TrackAssets('serverRoomPal_02');
			}
			if(game.CheckAsset('serverRoomPal_03') === false){
				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/InGame/ServerRoomPal/ServerRoomPal_Sprite_01.xml'));
				game.TrackAssets('serverRoomPal_03');
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
					(stage.getChildAt(0) as Object).SavedGame.SaveCurrentRoom("ServerRoomPal","ServerRoomPalObj");
				} 				
			});	
			//	goback = new GoBackButton();
			//	goback.alpha = 0;
		}
		
		private function onLoadAssets():void{
			bg = new Image(this.assets.getTexture('serverRoomPal_bg'));
			bg.touchable = true;
			this.addChildAt(bg,0);
			
			button_video = new Image(this.assets.getTexture('highlight_rect'));
			button_video.touchable = false;
			button_video.x = 25;
			button_video.y = 101;
			
			button_logs = new Image(this.assets.getTexture('highlight_rect'));
			button_logs.touchable = false;
			button_logs.x = 25;
			button_logs.y = 179;
			
			button_adimm = new Image(this.assets.getTexture('highlight_rect'));
			button_adimm.touchable = false;
			button_adimm.x = 25;
			button_adimm.y = 258;
			
			bread_crumb = new Image(this.assets.getTexture('bread_video'));
			bread_crumb.touchable = false;
			bread_crumb.x = 293;
			bread_crumb.y = 65;

			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['CubeDamage'] == 'Attached'){
					CubeDamageAttached = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['Cube'] == 'Attached'){
					CubeAttached = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomComputer['Lid'] == 'Open'){
					
				}else{
					LidClosed = true;
				}
			}
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['EggplantAttached'] == 'Yes'){	
					EggplantAttached = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['0'] != undefined){	
					fruit_arr[0] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['0'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['1'] != undefined){	
					fruit_arr[1] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['1'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['2'] != undefined){	
					fruit_arr[2] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['2'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['3'] != undefined){	
					fruit_arr[3] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['3'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['4'] != undefined){	
					fruit_arr[4] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['4'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['5'] != undefined){	
					fruit_arr[5] = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomTable['5'];
				}
			}else{
				
			}
			
			
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['CurrentScreen'] != undefined){	
					CurrentScreen = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['CurrentScreen'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['PassCodeSolved'] == 'Yes'){
					PassCodeSolved = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['DiaStep01'] == 'Yes'){
					DiaStep01 = true;
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['DiaStep02'] == 'Yes'){
					DiaStep02 = true;
				}
				//SaveArray['DiaStep01'] = 'No';
				
				//SaveArray['pc_txt_0'+blockNum]
			}else{
				
			}
			CreateVideoSprite();
			CreateLogsSprite();
			CreatePassCodeSprite();
			CreateAdimmSprite();
			
			
			
			if(CurrentScreen == 'video'){
				videoSprite.alpha = 1;				
				button_video.alpha = 1;
				button_logs.alpha = 0;
				button_adimm.alpha = 0;
			}else if(CurrentScreen == 'logs'){
				logsSprite.alpha = 1;
				button_video.alpha = 0;
				button_logs.alpha = 1;
				button_adimm.alpha = 0;
			}else if(CurrentScreen == 'passcode'){
				pcSprite.alpha = 1;
				button_video.alpha = 0;
				button_logs.alpha = 0;
				button_adimm.alpha = 1;
			}else if(CurrentScreen == 'adimm'){
				adimmSprite.alpha = 1;
				button_video.alpha = 0;
				button_logs.alpha = 0;
				button_adimm.alpha = 1;
				this.addEventListener(EnterFrameEvent.ENTER_FRAME, RotateAdimmImages);
				if(DiaStep01 === false){
					RunAdimmDiagnostic(true);
				}else if(DiaStep02 === false){
					RunAdimmDiagnostic(true);
				}else {
					
				}
				
			}
	
			bread_crumb.alpha = 1;
	
			this.addChildAt(button_video,1);
			this.addChildAt(button_logs,2);
			this.addChildAt(button_adimm,3);
			this.addChildAt(bread_crumb,4);
			
			CreateButtonHits();
			
			goback = new GoBackButton(this.assets);
			this.addChild(goback);
			
			this.addEventListener(TouchEvent.TOUCH,TouchHandler);
		}
		
		private function RunAdimmDiagnostic(FromSave:Boolean = false):void{
			if(FromSave === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_SuccessLow();
				
				
				Animating = true;
				AdimmPopUpOpen = true;
			}else{
				AdimmPopUpOpen = false;
			}
			PassCodeSolved = true;
		
			adimm_popup_text.texture = this.assets.getTexture('popup_running');
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal;
			}
			SaveArray['PassCodeSolved'] = 'Yes';
			if(LidClosed === true){
				SaveArray['DiaStep01'] = 'Yes';
				if(CubeDamageAttached === true || CubeAttached === true){
					SaveArray['DiaStep02'] = 'Yes';
				}else{
					SaveArray['DiaStep02'] = 'No';
				}
			}else{
				SaveArray['DiaStep01'] = 'No';
			}
			
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomPal',SaveArray);
			
			pc_txt_00.text = '#';
			pc_txt_01.text = '#';
			pc_txt_02.text = '#';
			pc_status.alpha = 1;
			pc_status.texture = this.assets.getTexture('success');
			
			if(FromSave === false){
				delayedCall = new DelayedCall(function():void{
					
					
					DisplayAdimmHandler();
					AdimmPopUpChange();
					
				}, 1.5);
				Starling.juggler.add(delayedCall);
			
			}else{
				AdimmPopUpChangeToDiaComplete(true);
			}
		}
		
		private function CreateButtonHits():void{
			hit_button_video = new Shape();
			hit_button_video.touchable = false;
			hit_button_video.graphics.beginFill(0xff0000);
			
			hit_button_video.graphics.lineTo(16,92);	
			hit_button_video.graphics.lineTo(270,92);	
			hit_button_video.graphics.lineTo(270,159);	
			hit_button_video.graphics.lineTo(16,159);	
			
			hit_button_video.graphics.endFill(false);
			hit_button_video.alpha = 0.0;
			
			hit_button_video.graphics.precisionHitTest = true;	
			
			
			hit_button_logs = new Shape();
			hit_button_logs.touchable = false;
			hit_button_logs.graphics.beginFill(0xff0000);
			
			hit_button_logs.graphics.lineTo(16,169);	
			hit_button_logs.graphics.lineTo(270,169);	
			hit_button_logs.graphics.lineTo(270,237);	
			hit_button_logs.graphics.lineTo(16,237);	
		
			hit_button_logs.graphics.endFill(false);
			hit_button_logs.alpha = 0.0;
			
			hit_button_logs.graphics.precisionHitTest = true;	
			
			
			hit_button_adimm = new Shape();
			hit_button_adimm.touchable = false;
			hit_button_adimm.graphics.beginFill(0xff0000);
			
			hit_button_adimm.graphics.lineTo(16,250);	
			hit_button_adimm.graphics.lineTo(270,250);	
			hit_button_adimm.graphics.lineTo(270,314);	
			hit_button_adimm.graphics.lineTo(16,314);	
		
			hit_button_adimm.graphics.endFill(false);
			hit_button_adimm.alpha = 0.0;
			
			hit_button_adimm.graphics.precisionHitTest = true;	
			
			
			this.addChild(hit_button_video);
			this.addChild(hit_button_logs);
			this.addChild(hit_button_adimm);
			/*
			private var hit_button_video:Shape;
			private var hit_button_logs:Shape;
			private var hit_button_adimm:Shape;
			*/
		}
		
		
		private function CreateAdimmSprite():void{
			adimmSprite = new Sprite();
			adimmSprite.touchable = false;
			adimmSprite. x = 293;
			adimmSprite. y = 94;
			
			
			
			adimm_cube = new Image(this.assets.getTexture('screen_cube_damage'));
			adimm_cube.touchable = false;
			adimm_cube.x = 90;
			adimm_cube.y = 40;
			
			adimm_error_00  = new Image(this.assets.getTexture('error_block_00'));
			adimm_error_00.touchable = false;
			adimm_error_00.x = 284;
			adimm_error_00.y = 222;
			
			adimm_error_01 = new Image(this.assets.getTexture('error_block_01'));
			adimm_error_01.touchable = false;
			adimm_error_01.x = 8;
			adimm_error_01.y = 28;
			
			adimm_error_02 = new Image(this.assets.getTexture('error_block_02'));
			adimm_error_02.touchable = false;
			adimm_error_02.x = 285;
			adimm_error_02.y = 9;
			
			adimm_error_03 = new Image(this.assets.getTexture('error_block_03'));
			adimm_error_03.touchable = false;
			adimm_error_03.x = 11;
			adimm_error_03.y = 261;
			
			adimm_disc_00 = new Image(this.assets.getTexture('disc'));
			adimm_disc_00.touchable = false;
			adimm_disc_00.pivotX = 41;
			adimm_disc_00.pivotY = 41;
			adimm_disc_00.x = 255;
			adimm_disc_00.y = 221;

			adimm_disc_01 = new Image(this.assets.getTexture('disc'));
			adimm_disc_01.touchable = false;
			adimm_disc_01.pivotX = 41;
			adimm_disc_01.pivotY = 41;
			adimm_disc_01.x = 153;
			adimm_disc_01.y = 151;
			
			adimm_disc_02 = new Image(this.assets.getTexture('disc'));
			adimm_disc_02.touchable = false;
			adimm_disc_02.pivotX = 41;
			adimm_disc_02.pivotY = 41;
			adimm_disc_02.x = 260;
			adimm_disc_02.y = 122;
			
			adimm_disc_03 = new Image(this.assets.getTexture('disc'));
			adimm_disc_03.touchable = false;
			adimm_disc_03.pivotX = 41;
			adimm_disc_03.pivotY = 41;
			adimm_disc_03.x = 173;
			adimm_disc_03.y = 242;

			
			adimm_popup = new Image(this.assets.getTexture('popup_outline'));
			adimm_popup.touchable = false;
			adimm_popup.x = 84;
			adimm_popup.y = 84;
			
			adimm_popup_text = new Image(this.assets.getTexture('popup_running'));
			adimm_popup_text.touchable = false;
			adimm_popup_text.x = 84;
			adimm_popup_text.y = 84;
			
			hit_disc_00 = new Shape();
			hit_disc_00.touchable = false;
			hit_disc_00.graphics.beginFill(0xff0000);
			
			hit_disc_00.graphics.lineTo(499-293,301-94);	
			hit_disc_00.graphics.lineTo(521-293,264-94);	
			hit_disc_00.graphics.lineTo(571-293,266-94);	
			hit_disc_00.graphics.lineTo(592-293,296-94);	
			hit_disc_00.graphics.lineTo(590-293,340-94);	
			hit_disc_00.graphics.lineTo(556-293,360-94);	
			hit_disc_00.graphics.lineTo(524-293,354-94);	
			hit_disc_00.graphics.lineTo(508-293,334-94);	
				
			hit_disc_00.graphics.endFill(false);
			hit_disc_00.alpha = 0.0;
			
			hit_disc_00.graphics.precisionHitTest = true;	
			
			
			hit_disc_01 = new Shape();
			hit_disc_01.touchable = false;
			hit_disc_01.graphics.beginFill(0xff0000);
			
			hit_disc_01.graphics.lineTo(399-293,235-94);	
			hit_disc_01.graphics.lineTo(413-293,206-94);	
			hit_disc_01.graphics.lineTo(441-293,195-94);	
			hit_disc_01.graphics.lineTo(475-293,209-94);	
			hit_disc_01.graphics.lineTo(490-293,250-94);	
			hit_disc_01.graphics.lineTo(468-293,284-94);	
			hit_disc_01.graphics.lineTo(424-293,288-94);	
			hit_disc_01.graphics.lineTo(410-293,273-94);	
			
			hit_disc_01.graphics.endFill(false);
			hit_disc_01.alpha = 0.0;
			
			hit_disc_01.graphics.precisionHitTest = true;	

			hit_disc_02 = new Shape();
			hit_disc_02.touchable = false;
			hit_disc_02.graphics.beginFill(0xff0000);
			
			hit_disc_02.graphics.lineTo(501-293,209-94);	
			hit_disc_02.graphics.lineTo(523-293,171-94);	
			hit_disc_02.graphics.lineTo(565-293,170-94);	
			hit_disc_02.graphics.lineTo(597-293,200-94);	
			hit_disc_02.graphics.lineTo(586-293,246-94);	
			hit_disc_02.graphics.lineTo(558-293,259-94);	
			hit_disc_02.graphics.lineTo(517-293,245-94);	
			
			hit_disc_02.graphics.endFill(false);
			hit_disc_02.alpha = 0.0;
			
			hit_disc_02.graphics.precisionHitTest = true;	
			
			hit_disc_03 = new Shape();
			hit_disc_03.touchable = false;
			hit_disc_03.graphics.beginFill(0xff0000);
			
			hit_disc_03.graphics.lineTo(416-293,337-94);	
			hit_disc_03.graphics.lineTo(429-293,302-94);	
			hit_disc_03.graphics.lineTo(465-293,289-94);	
			hit_disc_03.graphics.lineTo(496-293,302-94);	
			hit_disc_03.graphics.lineTo(506-293,345-94);	
			hit_disc_03.graphics.lineTo(487-293,374-94);	
			hit_disc_03.graphics.lineTo(442-293,375-94);	
			
			hit_disc_03.graphics.endFill(false);
			hit_disc_03.alpha = 0.0;
			
			hit_disc_03.graphics.precisionHitTest = true;	
			
			hit_popup_yes = new Shape();
			hit_popup_yes.touchable = false;
			hit_popup_yes.graphics.beginFill(0xff0000);
			
			hit_popup_yes.graphics.lineTo(501-293,287-94);	
			hit_popup_yes.graphics.lineTo(570-293,287-94);	
			hit_popup_yes.graphics.lineTo(570-293,360-94);	
			hit_popup_yes.graphics.lineTo(501-293,360-94);	
			
			hit_popup_yes.graphics.endFill(false);
			hit_popup_yes.alpha = 0.0;
			
			hit_popup_yes.graphics.precisionHitTest = true;	
			
			
			hit_popup_no = new Shape();
			hit_popup_no.touchable = false;
			hit_popup_no.graphics.beginFill(0xff0000);
			
			hit_popup_no.graphics.lineTo(581-293,288-94);	
			hit_popup_no.graphics.lineTo(648-293,288-94);	
			hit_popup_no.graphics.lineTo(648-293,360-94);	
			hit_popup_no.graphics.lineTo(581-293,360-94);	
			
			hit_popup_no.graphics.endFill(false);
			hit_popup_no.alpha = 0.0;
			
			hit_popup_no.graphics.precisionHitTest = true;	
			
			
			/*
			private var hit_popup_yes:Shape;
			private var hit_popup_no:Shape;
			*/
			
			
			if(PassCodeSolved === true){
				trace("PLUSH 00");
				if(LidClosed === true){
					trace("PLUSH 01");
					if(CubeDamageAttached === true || CubeAttached === true){
						trace("PLUSH 02");
						adimm_cube.alpha = 1;
						if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){
							trace("PLUSH 03");
							if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['AdimmRepaired'] == 'Yes'){
								AdimmRepaired = true;
								trace("PLUSH 04");
								adimm_cube.texture = this.assets.getTexture('screen_cube');
								adimm_error_00.alpha = 0;
								adimm_error_01.alpha = 0;
								adimm_error_02.alpha = 0;
								adimm_error_03.alpha = 0;
								
								adimm_disc_00.alpha = 0;
								adimm_disc_01.alpha = 0;
								adimm_disc_02.alpha = 0;
								adimm_disc_03.alpha = 0;
								
								adimm_popup.alpha = 0;
								adimm_popup_text.alpha = 0;
							}else{
								trace("PLUSH 05");
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['error_00'] == 'Yes'){
									adimm_error_00_Clicked = true;
									adimm_error_00.alpha = 1;
									adimm_disc_00.texture = this.assets.getTexture('circle');
									adimm_disc_00.readjustSize();
								}else{
									adimm_error_00.alpha = 0;
								}
								
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['error_01'] == 'Yes'){
									adimm_error_01_Clicked = true;
									adimm_error_01.alpha = 1;
									adimm_disc_01.texture = this.assets.getTexture('circle');
									adimm_disc_01.readjustSize();
								}else{
									adimm_error_01.alpha = 0;
								}
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['error_02'] == 'Yes'){
									adimm_error_02_Clicked = true;
									adimm_error_02.alpha = 1;
									adimm_disc_02.texture = this.assets.getTexture('circle');
									adimm_disc_02.readjustSize();
								}else{
									adimm_error_02.alpha = 0;
								}
								if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['error_03'] == 'Yes'){
									adimm_error_03_Clicked = true;
									adimm_error_03.alpha = 1;
									adimm_disc_03.texture = this.assets.getTexture('circle');
									adimm_disc_03.readjustSize();
								}else{
									adimm_error_03.alpha = 0;
								}
								adimm_popup.alpha = 0;
								adimm_popup_text.alpha = 0;
							}												
						}else{
							trace("PLUSH 06");
							adimm_error_00.alpha = 0;
							adimm_error_01.alpha = 0;
							adimm_error_02.alpha = 0;
							adimm_error_03.alpha = 0;
							
							adimm_disc_00.alpha = 1;
							adimm_disc_01.alpha = 1;
							adimm_disc_02.alpha = 1;
							adimm_disc_03.alpha = 1;
							
							adimm_popup.alpha = 1;
							adimm_popup_text.alpha = 1;
						}
						
					}else{
						trace("PLUSH 07");
						adimm_popup_text.texture = this.assets.getTexture('popup_dia_noadimm')
						adimm_cube.alpha = 0;
						
						adimm_error_00.alpha = 0;
						adimm_error_01.alpha = 0;
						adimm_error_02.alpha = 0;
						adimm_error_03.alpha = 0;
						
						adimm_disc_00.alpha = 0;
						adimm_disc_01.alpha = 0;
						adimm_disc_02.alpha = 0;
						adimm_disc_03.alpha = 0;
						
						adimm_popup.alpha = 1;
						adimm_popup_text.alpha = 1;
					}
				}else{
					trace("PLUSH 08");
					adimm_popup_text.texture = this.assets.getTexture('popup_dia_close')
					adimm_cube.alpha = 0;
					
					adimm_error_00.alpha = 0;
					adimm_error_01.alpha = 0;
					adimm_error_02.alpha = 0;
					adimm_error_03.alpha = 0;
					
					adimm_disc_00.alpha = 0;
					adimm_disc_01.alpha = 0;
					adimm_disc_02.alpha = 0;
					adimm_disc_03.alpha = 0;
					
					adimm_popup.alpha = 1;
					adimm_popup_text.alpha = 1;
				}
			}else{
				trace("PLUSH 09");
				adimm_cube.alpha = 0;
				
				adimm_error_00.alpha = 0;
				adimm_error_01.alpha = 0;
				adimm_error_02.alpha = 0;
				adimm_error_03.alpha = 0;
				
				adimm_disc_00.alpha = 0;
				adimm_disc_01.alpha = 0;
				adimm_disc_02.alpha = 0;
				adimm_disc_03.alpha = 0;
				
				adimm_popup.alpha = 1;
				adimm_popup_text.alpha = 1;
			}
			
			
		//	adimm_outline.alpha = 0;
			
			
			adimmSprite.alpha = 0;
			
		//	adimmSprite.addChildAt(adimm_outline,0);
			adimmSprite.addChildAt(adimm_cube,0);
			adimmSprite.addChildAt(adimm_error_00,1);
			adimmSprite.addChildAt(adimm_error_01,2);
			adimmSprite.addChildAt(adimm_error_02,3);
			adimmSprite.addChildAt(adimm_error_03,4);
			adimmSprite.addChildAt(adimm_disc_00,5);
			adimmSprite.addChildAt(adimm_disc_01,6);
			adimmSprite.addChildAt(adimm_disc_02,7);
			adimmSprite.addChildAt(adimm_disc_03,8);
			adimmSprite.addChildAt(adimm_popup,9);
			adimmSprite.addChildAt(adimm_popup_text,10);
			
			adimmSprite.addChildAt(hit_disc_00,11);
			adimmSprite.addChildAt(hit_disc_01,12);
			adimmSprite.addChildAt(hit_disc_02,13);
			adimmSprite.addChildAt(hit_disc_03,14);
			adimmSprite.addChildAt(hit_popup_yes,15);
			adimmSprite.addChildAt(hit_popup_no,16);
			
			this.addChild(adimmSprite);
		}
		
		private function CreatePassCodeSprite():void{
			pcSprite = new Sprite();
			pcSprite.touchable = false;
			pcSprite. x = 293;
			pcSprite. y = 94;
		
			pc_bg = new Image(this.assets.getTexture('passcode'));
			pc_bg.touchable = false;
			pc_bg.x = 11;
			pc_bg.y = 11;
			
			pc_status = new Image(this.assets.getTexture('invalid'));
			pc_status.touchable = false;
			pc_status.x = 224;
			pc_status.y = 312;
			
			pc_highlight = new Image(this.assets.getTexture('passcode_highlight'));
			pc_highlight.touchable = false;			
			pc_highlight.x = 75;
			pc_highlight.y = 110;
			//(311-293,379-94)
			pc_txt_00 = new TextField(150,135,"#","Terminal", 100, 0x01ff5b);
			pc_txt_00.touchable = false;
			pc_txt_00.hAlign = starling.utils.HAlign.LEFT;
			pc_txt_00.x = 95;
			pc_txt_00.y = 92;
			
			pc_txt_01 = new TextField(150,135,"#","Terminal", 100, 0x01ff5b);
			pc_txt_01.touchable = false;
			pc_txt_01.hAlign = starling.utils.HAlign.LEFT;
			pc_txt_01.x = 205;
			pc_txt_01.y = 92;
			
			pc_txt_02 = new TextField(150,135,"#","Terminal", 100, 0x01ff5b);
			pc_txt_02.touchable = false;
			pc_txt_02.hAlign = starling.utils.HAlign.LEFT;
			pc_txt_02.x = 315;
			pc_txt_02.y = 92;
			
		
			
			
			hit_pc_left = new Shape();
			hit_pc_left.touchable = false;
			hit_pc_left.graphics.beginFill(0xff0000);
			
			hit_pc_left.graphics.lineTo(299-293,209-94);	
			hit_pc_left.graphics.lineTo(366-293,209-94);	
			hit_pc_left.graphics.lineTo(366-293,297-94);	
			hit_pc_left.graphics.lineTo(299-293,297-94);	
			
			hit_pc_left.graphics.endFill(false);
			hit_pc_left.alpha = 0.0;
			
			hit_pc_left.graphics.precisionHitTest = true;	
			
			
			hit_pc_right = new Shape();
			hit_pc_right.touchable = false;
			hit_pc_right.graphics.beginFill(0xff0000);
			
			hit_pc_right.graphics.lineTo(683-293,213-94);	
			hit_pc_right.graphics.lineTo(756-293,213-94);	
			hit_pc_right.graphics.lineTo(756-293,298-94);	
			hit_pc_right.graphics.lineTo(683-293,298-94);	
						
			hit_pc_right.graphics.endFill(false);
			hit_pc_right.alpha = 0.0;
			
			hit_pc_right.graphics.precisionHitTest = true;	
			
			
			hit_pc_pos_00_up = new Shape();
			hit_pc_pos_00_up.touchable = false;
			hit_pc_pos_00_up.graphics.beginFill(0xff0000);
			
			hit_pc_pos_00_up.graphics.lineTo(373-293,138-94);	
			hit_pc_pos_00_up.graphics.lineTo(458-293,138-94);	
			hit_pc_pos_00_up.graphics.lineTo(458-293,202-45);	
			hit_pc_pos_00_up.graphics.lineTo(373-293,202-45);	
					
			hit_pc_pos_00_up.graphics.endFill(false);
			hit_pc_pos_00_up.alpha = 0.0;
			
			hit_pc_pos_00_up.graphics.precisionHitTest = true;	
			
			hit_pc_pos_00_down = new Shape();
			hit_pc_pos_00_down.touchable = false;
			hit_pc_pos_00_down.graphics.beginFill(0xff0000);
			
			hit_pc_pos_00_down.graphics.lineTo(373-293,306-94-45);	
			hit_pc_pos_00_down.graphics.lineTo(458-293,306-94-45);	
			hit_pc_pos_00_down.graphics.lineTo(458-293,373-94);	
			hit_pc_pos_00_down.graphics.lineTo(373-293,373-94);	
		
			hit_pc_pos_00_down.graphics.endFill(false);
			hit_pc_pos_00_down.alpha = 0.0;
			
			hit_pc_pos_00_down.graphics.precisionHitTest = true;	
			
			hit_pc_pos_01_up = new Shape();
			hit_pc_pos_01_up.touchable = false;
			hit_pc_pos_01_up.graphics.beginFill(0xff0000);
			
			hit_pc_pos_01_up.graphics.lineTo(483-293,140-94);	
			hit_pc_pos_01_up.graphics.lineTo(570-293,140-94);	
			hit_pc_pos_01_up.graphics.lineTo(570-293,206-45);	
			hit_pc_pos_01_up.graphics.lineTo(483-293,206-45);	
		
			hit_pc_pos_01_up.graphics.endFill(false);
			hit_pc_pos_01_up.alpha = 0.0;
			
			hit_pc_pos_01_up.graphics.precisionHitTest = true;	
			
			
			hit_pc_pos_01_down = new Shape();
			hit_pc_pos_01_down.touchable = false;
			hit_pc_pos_01_down.graphics.beginFill(0xff0000);
			
			hit_pc_pos_01_down.graphics.lineTo(483-293,305-94-45);	
			hit_pc_pos_01_down.graphics.lineTo(570-293,305-94-45);	
			hit_pc_pos_01_down.graphics.lineTo(570-293,373-94);	
			hit_pc_pos_01_down.graphics.lineTo(483-293,373-94);	
					
			hit_pc_pos_01_down.graphics.endFill(false);
			hit_pc_pos_01_down.alpha = 0.0;
			
			hit_pc_pos_01_down.graphics.precisionHitTest = true;	
			
			
			hit_pc_pos_02_up = new Shape();
			hit_pc_pos_02_up.touchable = false;
			hit_pc_pos_02_up.graphics.beginFill(0xff0000);
			
			hit_pc_pos_02_up.graphics.lineTo(591-293,140-94);	
			hit_pc_pos_02_up.graphics.lineTo(675-293,140-94);	
			hit_pc_pos_02_up.graphics.lineTo(675-293,204-45);	
			hit_pc_pos_02_up.graphics.lineTo(591-293,204-45);	
			
			hit_pc_pos_02_up.graphics.endFill(false);
			hit_pc_pos_02_up.alpha = 0.0;
			
			hit_pc_pos_02_up.graphics.precisionHitTest = true;	
			
			
			hit_pc_pos_02_down = new Shape();
			hit_pc_pos_02_down.touchable = false;
			hit_pc_pos_02_down.graphics.beginFill(0xff0000);
			
			hit_pc_pos_02_down.graphics.lineTo(591-293,309-94-45);	
			hit_pc_pos_02_down.graphics.lineTo(675-293,309-94-45);	
			hit_pc_pos_02_down.graphics.lineTo(675-293,375-94);	
			hit_pc_pos_02_down.graphics.lineTo(591-293,375-94);	
			
			hit_pc_pos_02_down.graphics.endFill(false);
			hit_pc_pos_02_down.alpha = 0.0;
			
			hit_pc_pos_02_down.graphics.precisionHitTest = true;	
			
			
			hit_pc_enter = new Shape();
			hit_pc_enter.touchable = false;
			hit_pc_enter.graphics.beginFill(0xff0000);
			
			hit_pc_enter.graphics.lineTo(311-293,379-94);	
			hit_pc_enter.graphics.lineTo(463-293,379-94);	
			hit_pc_enter.graphics.lineTo(463-293,446-94);	
			hit_pc_enter.graphics.lineTo(311-293,446-94);	
			
			
			hit_pc_enter.graphics.endFill(false);
			hit_pc_enter.alpha = 0.0;
			
			hit_pc_enter.graphics.precisionHitTest = true;	
			/*
			
			private var hit_pc_pos_02_up:Shape;
			private var hit_pc_pos_02_down:Shape;
			private var hit_enter:Shape;
			*/
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){	
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['pc_txt_00'] != undefined){	
					pc_txt_00.text = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['pc_txt_00'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['pc_txt_01'] != undefined){	
					pc_txt_01.text = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['pc_txt_01'];
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['pc_txt_02'] != undefined){	
					pc_txt_02.text = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['pc_txt_02'];
				}
				//SaveArray['pc_txt_0'+blockNum]
			}else{
				
			}
			
			
		
			pc_bg.alpha = 1;
			pc_status.alpha = 0;
			pc_highlight.alpha = 1;
			pc_txt_00.alpha = 1;
			pc_txt_01.alpha = 1;
			pc_txt_02.alpha = 1;
			pcSprite.alpha = 0;
			
			pcSprite.addChildAt(pc_bg,0);
			
			pcSprite.addChildAt(pc_status,1);
			pcSprite.addChildAt(pc_txt_00,2);
			pcSprite.addChildAt(pc_txt_01,3);
			pcSprite.addChildAt(pc_txt_02,4);
			pcSprite.addChildAt(pc_highlight,5);
			
			
			pcSprite.addChildAt(hit_pc_left,6);
			pcSprite.addChildAt(hit_pc_right,7);
			pcSprite.addChildAt(hit_pc_pos_00_up,8);
			pcSprite.addChildAt(hit_pc_pos_00_down,9);
			pcSprite.addChildAt(hit_pc_pos_01_up,10);
			pcSprite.addChildAt(hit_pc_pos_01_down,11);
			pcSprite.addChildAt(hit_pc_pos_02_up,12);
			pcSprite.addChildAt(hit_pc_pos_02_down,13);
			pcSprite.addChildAt(hit_pc_enter,14);
			this.addChild(pcSprite);
		}
		
		private function CreateLogsSprite():void{
			logsSprite = new Sprite();
			logsSprite.touchable = false;
			logsSprite. x = 293;
			logsSprite. y = 94;
			
						
			logs_header = new Image(this.assets.getTexture('logs_header'));
			logs_header.touchable = false;
			logs_header.x = 10;
			logs_header.y = 7;
			
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['LogsCurrentPage'] != undefined){
					LogsCurrentPage =(stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal['LogsCurrentPage'];
					logs_number = new Image(this.assets.getTexture('logs_num_0'+LogsCurrentPage));
					logs_text = new Image(this.assets.getTexture('logs_page_0'+LogsCurrentPage));
				}else{
					logs_number = new Image(this.assets.getTexture('logs_num_00'));
					logs_text = new Image(this.assets.getTexture('logs_page_00'));
				}
			}else{
				logs_number = new Image(this.assets.getTexture('logs_num_00'));
				logs_text = new Image(this.assets.getTexture('logs_page_00'));
			}

			
			logs_number.touchable = false;
			logs_number.x = 347;
			logs_number.y = 51;
			
			
			logs_text.touchable = false;
			logs_text.x = 14;
			logs_text.y = 75;
			
			
			hit_logs_left = new Shape();
			hit_logs_left.touchable = false;
			hit_logs_left.graphics.beginFill(0xff0000);
			
			hit_logs_left.graphics.lineTo(296-293,96-94);	
			hit_logs_left.graphics.lineTo(365-293,96-94);	
			hit_logs_left.graphics.lineTo(365-293,168-94);	
			hit_logs_left.graphics.lineTo(296-293,168-94);	
		
			hit_logs_left.graphics.endFill(false);
			hit_logs_left.alpha = 0.0;
			
			hit_logs_left.graphics.precisionHitTest = true;	
			
			
			hit_logs_right = new Shape();
			hit_logs_right.touchable = false;
			hit_logs_right.graphics.beginFill(0xff0000);
			
			hit_logs_right.graphics.lineTo(687-293,103-94);	
			hit_logs_right.graphics.lineTo(760-293,103-94);	
			hit_logs_right.graphics.lineTo(760-293,167-94);	
			hit_logs_right.graphics.lineTo(687-293,167-94);	
			
			hit_logs_right.graphics.endFill(false);
			hit_logs_right.alpha = 0.0;
			
			hit_logs_right.graphics.precisionHitTest = true;	
			
			
			
			logs_header.alpha = 1;
			logs_number.alpha = 1;
			logs_text.alpha = 1;
			
			logsSprite.alpha = 0;
			
			
			logsSprite.addChildAt(logs_header,0);
			logsSprite.addChildAt(logs_number,1);
			logsSprite.addChildAt(logs_text,2);
			
			logsSprite.addChildAt(hit_logs_left,3);
			logsSprite.addChildAt(hit_logs_right,4);
			
			this.addChild(logsSprite);
		}
		
		private function CreateVideoSprite():void{
			videoSprite = new Sprite();
			videoSprite.touchable = false;
			videoSprite. x = 293;
			videoSprite. y = 94;
			
			
			video_bg = new Image(this.assets.getTexture('video_bg'));
			video_bg.touchable = false;
			video_bg.x = 0;
			video_bg.y = 0;
			
			
			video_pos_00 = new Image(this.assets.getTexture('pos_00_'+fruit_arr[0]));
			video_pos_00.touchable = false;
			video_pos_00.x = 360;
			video_pos_00.y = 163;
			
			video_pos_01 = new Image(this.assets.getTexture('pos_01_'+fruit_arr[1]));
			video_pos_01.touchable = false;
			video_pos_01.x = 281;
			video_pos_01.y = 172;
			
			video_pos_02 = new Image(this.assets.getTexture('pos_02_'+fruit_arr[2]));
			video_pos_02.touchable = false;
			video_pos_02.x = 190;
			video_pos_02.y = 163;
			
			video_pos_03 = new Image(this.assets.getTexture('pos_03_'+fruit_arr[3]));
			video_pos_03.touchable = false;
			video_pos_03.x = 203;
			video_pos_03.y = 180;
			
			video_pos_04 = new Image(this.assets.getTexture('pos_04_'+fruit_arr[4]));
			video_pos_04.touchable = false;
			video_pos_04.x = 123;
			video_pos_04.y = 176;
			
			video_pos_05 = new Image(this.assets.getTexture('pos_05_'+fruit_arr[5]));
			video_pos_05.touchable = false;
			video_pos_05.x = 27;
			video_pos_05.y = 163;
			/*
			private var video_pos_00:Image;
			private var video_pos_01:Image;
			private var video_pos_02:Image;
			private var video_pos_03:Image;
			private var video_pos_04:Image;
			private var video_pos_05:Image;
			*/
			if(fruit_arr[0] == 'eggplant'){
				if(EggplantAttached === true){
					video_pos_00.alpha = 1;
				}else{
					video_pos_00.alpha = 0;
				}
			}else{
				video_pos_00.alpha = 1;
			}
			if(fruit_arr[1] == 'eggplant'){
				if(EggplantAttached === true){
					video_pos_01.alpha = 1;
				}else{
					video_pos_01.alpha = 0;
				}
			}else{
				video_pos_01.alpha = 1;
			}
			if(fruit_arr[2] == 'eggplant'){
				if(EggplantAttached === true){
					video_pos_02.alpha = 1;
				}else{
					video_pos_02.alpha = 0;
				}
			}else{
				video_pos_02.alpha = 1;
			}
			if(fruit_arr[3] == 'eggplant'){
				if(EggplantAttached === true){
					video_pos_03.alpha = 1;
				}else{
					video_pos_03.alpha = 0;
				}
			}else{
				video_pos_03.alpha = 1;
			}
			if(fruit_arr[4] == 'eggplant'){
				if(EggplantAttached === true){
					video_pos_04.alpha = 1;
				}else{
					video_pos_04.alpha = 0;
				}
			}else{
				video_pos_04.alpha = 1;
			}
			if(fruit_arr[5] == 'eggplant'){
				if(EggplantAttached === true){
					video_pos_05.alpha = 1;
				}else{
					video_pos_05.alpha = 0;
				}
			}else{
				video_pos_05.alpha = 1;
			}
		
		
			video_bg.alpha = 1;
			
			videoSprite.alpha = 0;
			
			videoSprite.addChildAt(video_bg,0);
			videoSprite.addChildAt(video_pos_00,1);
			videoSprite.addChildAt(video_pos_01,2);
			videoSprite.addChildAt(video_pos_03,3);
			videoSprite.addChildAt(video_pos_02,4);
			videoSprite.addChildAt(video_pos_04,5);
			videoSprite.addChildAt(video_pos_05,6);
			
			
			this.addChild(videoSprite);
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
							FadeOut((ServerRoomComputer as Class), 
								(stage.getChildAt(0) as Object).screenGamePlayHandler.ServerRoomComputerObj,true
							);
							return;
						}else if(hit_button_video.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							DisplayVideoHandler();
							return;
						}else if(hit_button_logs.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
						//	if(PassCodeSolved === false){
						//		DisplayPassCodeHandler();
						//	}else{
								DisplayLogsHandler();
						//	}
							return;
							
						}else if(hit_button_adimm.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
							if(PassCodeSolved === false){
								DisplayPassCodeHandler();
								return;
							}else{
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
								DisplayAdimmHandler(true);
								return;
							}
						}
						
						if(CurrentScreen == 'passcode'){
							if(hit_pc_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PCLeftRightHandler('left');
							}else if(hit_pc_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PCLeftRightHandler('right');
							}else if(hit_pc_pos_00_up.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(pc_pos == 0){
									PCTextChanger(0,'Up');
								}else{
									PCAssignPos(0,'Up');
									
								}
							}else if(hit_pc_pos_00_down.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(pc_pos == 0){
									PCTextChanger(0,'Down');
								}else{
									PCAssignPos(0,'Down');
								}
							}else if(hit_pc_pos_01_up.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(pc_pos == 1){
									PCTextChanger(1,'Up');
								}else{
									PCAssignPos(1,'Up');
								}								
							}else if(hit_pc_pos_01_down.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(pc_pos == 1){
									PCTextChanger(1,'Down');
								}else{
									PCAssignPos(1,'Down');
								}								
							}else if(hit_pc_pos_02_up.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(pc_pos == 2){
									PCTextChanger(2,'Up');
								}else{
									PCAssignPos(2,'Up');
								}							
							}else if(hit_pc_pos_02_down.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								if(pc_pos == 2){
									PCTextChanger(2,'Down');
								}else{
									PCAssignPos(2,'Down');
								}								
							}else if(hit_pc_enter.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								PCSolve();					
							}
						}else if(CurrentScreen == 'adimm'){
							trace("SMART 00");
							if(AdimmPopUpOpen === false){
								trace("SMART 01");
								if(hit_disc_00.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									trace("SMART 02");
								//	if(adimm_error_00_Clicked === false){
										AdimmErrorHandler(0);
								//	}
								}else if(hit_disc_01.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									trace("SMART 03");
								//	if(adimm_error_01_Clicked === false){
										AdimmErrorHandler(1);
								//	}
								}else if(hit_disc_02.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									trace("SMART 04")
								//	if(adimm_error_02_Clicked === false){
										AdimmErrorHandler(2);
								//	}
								}else if(hit_disc_03.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									trace("SMART 05")
								//	if(adimm_error_03_Clicked === false){
										AdimmErrorHandler(3);
								//	}
								}
							}else if(AdimmPopUpChoice === true){
								trace("SMART 06")
								if(hit_popup_yes.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									AdimmStartRepairHandler('Yes');
								}else if(hit_popup_no.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
									AdimmStartRepairHandler('No');
								}
							}
						}else if(CurrentScreen == 'logs'){
							if(hit_logs_left.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LogsPageHandler('Left');
							}else if(hit_logs_right.graphics.shapeHitTest(touches[0].globalX,touches[0].globalY) === true){
								LogsPageHandler('Right');
							}
						}
						/*
						private var hit_logs_left:Shape;
						private var hit_logs_right:Shape;
						*/
					}
				}
			}
		}
		private function LogsPageHandler(LeftRight:String):void{
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal;
			}			
			if(LeftRight == 'Left'){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
				if(LogsCurrentPage == 0){
					LogsCurrentPage = 3;
					logs_text.texture = this.assets.getTexture('logs_page_03');
					logs_number.texture = this.assets.getTexture('logs_num_03');
				}else if(LogsCurrentPage == 1){
					LogsCurrentPage = 0;
					logs_text.texture = this.assets.getTexture('logs_page_00');
					logs_number.texture = this.assets.getTexture('logs_num_00');
				}else if(LogsCurrentPage == 2){
					LogsCurrentPage = 1;
					logs_text.texture = this.assets.getTexture('logs_page_01');
					logs_number.texture = this.assets.getTexture('logs_num_01');
				}else if(LogsCurrentPage == 3){
					LogsCurrentPage = 2;
					logs_text.texture = this.assets.getTexture('logs_page_02');
					logs_number.texture = this.assets.getTexture('logs_num_02');
				}
			}else{			
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
				if(LogsCurrentPage == 0){
					LogsCurrentPage = 1;
					logs_text.texture = this.assets.getTexture('logs_page_01');
					logs_number.texture = this.assets.getTexture('logs_num_01');
				}else if(LogsCurrentPage == 1){
					LogsCurrentPage = 2;
					logs_text.texture = this.assets.getTexture('logs_page_02');
					logs_number.texture = this.assets.getTexture('logs_num_02');
				}else if(LogsCurrentPage == 2){
					LogsCurrentPage = 3;
					logs_text.texture = this.assets.getTexture('logs_page_03');
					logs_number.texture = this.assets.getTexture('logs_num_03');
				}else if(LogsCurrentPage == 3){
					LogsCurrentPage = 0;
					logs_text.texture = this.assets.getTexture('logs_page_00');
					logs_number.texture = this.assets.getTexture('logs_num_00');
				}
				
			}
			SaveArray['LogsCurrentPage'] = LogsCurrentPage;
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomPal',SaveArray);
		}
		
		private function AdimmStartRepairHandler(YesNo:String):void{
			if(YesNo === 'No'){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
				AdimmPopUpChoice = false
				AdimmPopUpOpen = false;
				adimm_popup.alpha = 0;
				adimm_popup_text.alpha = 0;
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiThree();
				//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
				
				Animating = true;
				adimm_popup_text.texture = this.assets.getTexture('popup_repair_starting');
				Starling.juggler.delayCall(AdimmRepairHandler,2);
			}
		}
		
		private function AdimmRepairHandler():void{
			if(LidClosed === true){
				if(CubeDamageAttached === true || CubeAttached === true){
					if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){
						SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal;
					}
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
					SaveArray['AdimmRepaired'] = 'Yes';
					(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomPal',SaveArray);
					
					delayedCall = new DelayedCall(function():void{
						//(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Machine();
						FadeOut((ServerRoomComputer as Class), 
							(stage.getChildAt(0) as Object).screenGamePlayHandler.ServerRoomComputerObj,true
						);
						
					}, 2);
					Starling.juggler.add(delayedCall);
				}else{
					adimm_popup_text.texture = this.assets.getTexture('popup_repair_noadimm');
					Animating = false;
				}
			}else{
				adimm_popup_text.texture = this.assets.getTexture('popup_repair_close');
				Animating = false;
			}
		}
		
		private function AdimmErrorHandler(error:int):void{
			if(AdimmRepaired === false){
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal;
				}		
				if(error == 0){
					if(adimm_error_00_Clicked === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiThree();
					}
					
					adimm_disc_00.texture = this.assets.getTexture('circle');
					adimm_disc_00.readjustSize();
					adimm_error_00.alpha = 1;
					adimm_error_00_Clicked = true;
					
					
					SaveArray['error_00'] = 'Yes';
				}else if(error == 1){
					if(adimm_error_01_Clicked === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiThree();
					}
					
					adimm_disc_01.texture = this.assets.getTexture('circle');
					adimm_disc_01.readjustSize();
					adimm_error_01.alpha = 1;
					adimm_error_01_Clicked = true;
					SaveArray['error_01'] = 'Yes';
				}else if(error == 2){
					if(adimm_error_02_Clicked === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiThree();
					}
					adimm_disc_02.texture = this.assets.getTexture('circle');
					adimm_disc_02.readjustSize();
					adimm_error_02.alpha = 1;
					adimm_error_02_Clicked = true;
					SaveArray['error_02'] = 'Yes';
				}else if(error == 3){
					if(adimm_error_03_Clicked === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFiThree();
					}
					adimm_disc_03.texture = this.assets.getTexture('circle');
					adimm_disc_03.readjustSize();
					adimm_error_03.alpha = 1;
					adimm_error_03_Clicked = true;
					SaveArray['error_03'] = 'Yes';
				}
				
				if(adimm_error_00_Clicked === true){
					if(adimm_error_01_Clicked === true){
						if(adimm_error_02_Clicked === true){
							if(adimm_error_03_Clicked === true){
								Animating = true;
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
								(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
								Starling.juggler.delayCall(AdimmPopUpStartRepair,0.5);
							}
						}
					}
				}
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomPal',SaveArray);
			}
		}
		
		private function AdimmPopUpStartRepair():void{
		//	if(SoundIt === true){
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
			//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
		//	}
			trace("Noodles !");
				
			Animating = false;
			AdimmPopUpOpen = true;
			AdimmPopUpChoice = true;
			adimm_popup_text.texture = this.assets.getTexture('popup_damage_id');
			adimm_popup.alpha = 1;
			
			adimm_popup_text.alpha = 1;
		}
		
		private function PCSolve():void{
			if(pc_txt_00.text == 'H'){
				if(pc_txt_01.text == 'A'){
					if(pc_txt_02.text == 'B'){
						trace("SOLVE");
						trace("SOLVE");
						trace("SOLVE");
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickSciFi();
						RunAdimmDiagnostic();
				
					}else{
						trace("Bark 1");
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
						pc_status.alpha = 1;
						trace("FAIL ON 2");
						
					}
				}else{
					trace("Bark 2");
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
					pc_status.alpha = 1;
					trace("FAIL ON 1");
				}
			}else{
				trace("Bark 3");
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
				pc_status.alpha = 1;
				trace("FAIL ON 0");
			}
			
		}
		
		private function AdimmPopUpChange(SoundIt:Boolean = false):void{
			if(SoundIt === true){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ComputerBeepsTwo();
			}
			
			Starling.juggler.delayCall(AdimmPopUpChangeToDiaComplete,2);
		}
		private function AdimmPopUpChangeToDiaComplete(FromSave:Boolean = false):void{
			if(FromSave === false){
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			}
			if(LidClosed === true){
				if(CubeDamageAttached === true || CubeAttached === true){
					trace("Bark 4");
					//if(FromSave === false){
					//	(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
					//}
					
					adimm_popup_text.texture = this.assets.getTexture('popup_dia_complete');
					Starling.juggler.delayCall(AdimmPopUpRemove,2);
				}else{
					trace("Bark 5");
					if(FromSave === false){
						(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
					}
					adimm_popup_text.texture = this.assets.getTexture('popup_dia_noadimm');
					Animating = false;
					
				}
			}else{
				trace("Bark 6");
				if(FromSave === false){
					(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Error();
				}
				adimm_popup_text.texture = this.assets.getTexture('popup_dia_close');
				Animating = false;
			}
			
			
			/*
			private var CubeDamageAttached:Boolean = false;
			private var CubeAttached:Boolean = false;
			private var LidClosed:Boolean = false;
			*/
		}
		private function AdimmPopUpRemove():void{
			Animating = false;
			AdimmPopUpOpen = false;
			adimm_popup.alpha = 0;
			adimm_popup_text.alpha = 0;
			adimm_cube.alpha = 1;
			
			adimm_disc_00.alpha = 1;
			adimm_disc_01.alpha = 1;
			adimm_disc_02.alpha = 1;
			adimm_disc_03.alpha = 1;
		
		}
		private function PCTextChanger(blockNum:int,blockDirc:String):void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ThakOne();
			if(this[('pc_txt_0'+blockNum)].text == '#'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'Z';
				}else{
					this[('pc_txt_0'+blockNum)].text = '9';
				}
			}
			else if(this[('pc_txt_0'+blockNum)].text == '9'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = '#';
				}else{
					this[('pc_txt_0'+blockNum)].text = '8';
				}
			}
			else if(this[('pc_txt_0'+blockNum)].text == '8'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = '9';
				}else{
					this[('pc_txt_0'+blockNum)].text = '7';
				}
			}
			else if(this[('pc_txt_0'+blockNum)].text == '7'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = '8';
				}else{
					this[('pc_txt_0'+blockNum)].text = '6';
				}
			}
			else if(this[('pc_txt_0'+blockNum)].text == '6'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = '7';
				}else{
					this[('pc_txt_0'+blockNum)].text = '5';
				}
			}
			else if(this[('pc_txt_0'+blockNum)].text == '5'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = '6';
				}else{
					this[('pc_txt_0'+blockNum)].text = '4';
				}
			}
			else if(this[('pc_txt_0'+blockNum)].text == '4'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = '5';
				}else{
					this[('pc_txt_0'+blockNum)].text = '3';
				}
			}
			else if(this[('pc_txt_0'+blockNum)].text == '3'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = '4';
				}else{
					this[('pc_txt_0'+blockNum)].text = '2';
				}
			}
			else if(this[('pc_txt_0'+blockNum)].text == '2'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = '3';
				}else{
					this[('pc_txt_0'+blockNum)].text = '1';
				}
			}
			else if(this[('pc_txt_0'+blockNum)].text == '1'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = '2';
				}else{
					this[('pc_txt_0'+blockNum)].text = '0';
				}
			}
			else if(this[('pc_txt_0'+blockNum)].text == '0'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = '1';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'A';
				}
			}
			else if(this[('pc_txt_0'+blockNum)].text == 'A'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = '0';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'B';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'B'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'A';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'C';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'C'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'B';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'D';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'D'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'C';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'E';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'E'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'D';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'F';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'F'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'E';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'G';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'G'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'F';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'H';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'H'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'G';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'I';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'I'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'H';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'J';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'J'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'I';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'K';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'K'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'J';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'L';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'L'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'K';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'M';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'M'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'L';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'N';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'N'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'M';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'O';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'O'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'N';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'P';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'P'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'O';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'Q';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'Q'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'P';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'R';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'R'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'Q';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'S';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'S'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'R';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'T';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'T'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'S';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'U';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'U'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'T';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'V';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'V'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'U';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'W';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'W'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'V';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'X';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'X'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'W';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'Y';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'Y'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'X';
				}else{
					this[('pc_txt_0'+blockNum)].text = 'Z';
				}
			}else if(this[('pc_txt_0'+blockNum)].text == 'Z'){
				if(blockDirc == 'Up'){
					this[('pc_txt_0'+blockNum)].text = 'Y';
				}else{
					this[('pc_txt_0'+blockNum)].text = '#';
				}
			}
			
			SaveBlockVal(blockNum);
		}
		
		private function SaveBlockVal(blockNum:int):void{
			trace("blockNum :"+blockNum);
			if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){
				SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal;
			}
			SaveArray['pc_txt_0'+blockNum] = this[('pc_txt_0'+blockNum)].text;
			(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomPal',SaveArray);
		}
		
		private function PCAssignPos(PosS:int,UpDown:String):void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			if(PosS == 0){
				pc_pos = 0;
				pc_highlight.x = 75;
			}else if(PosS == 1){
				pc_pos = 1;
				pc_highlight.x = 186;
			}else if(PosS == 2){
				pc_pos = 2;
				pc_highlight.x = 298;
			}
			
			
		//	PCTextChanger(pc_pos,UpDown);
		}
		
		private function PCLeftRightHandler(LeftRight:String):void{
			(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_ClickTiny();
			if(LeftRight == 'right'){
				if(pc_pos == 0){
					pc_pos = 1;
					pc_highlight.x = 186;
						//479-293
				}else if(pc_pos == 1){
					pc_pos = 2;
					pc_highlight.x = 298;
					
				}else if(pc_pos == 2){
					pc_pos = 0;
					pc_highlight.x = 75;
				}
			}else{
				if(pc_pos == 0){
					pc_pos = 2;
					pc_highlight.x = 298;
					//479-293
				}else if(pc_pos == 1){
					pc_pos = 0;
					pc_highlight.x = 75;
					
				}else if(pc_pos == 2){
					pc_pos = 1;
					pc_highlight.x = 186;
				}
			}
		}
		
		private function RotateAdimmImages(e:Event):void{
		
			adimm_disc_00.rotation = adimm_disc_00.rotation-deg2rad(3);
			adimm_disc_01.rotation = adimm_disc_01.rotation-deg2rad(3);
			adimm_disc_02.rotation = adimm_disc_02.rotation-deg2rad(3);
			adimm_disc_03.rotation = adimm_disc_03.rotation-deg2rad(3);
		}
		
		private function DisplayAdimmHandler(SoundIt:Boolean = false):void{
			trace("DisplayAdimm");
			if(CurrentScreen == 'adimm'){
				
			}else{
				
				
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal;	
				}
				CurrentScreen = 'adimm';
				bread_crumb. texture = this.assets.getTexture('bread_fault');
				adimmSprite.alpha = 1;
				pcSprite.alpha = 0;
				logsSprite.alpha = 0;
				videoSprite.alpha = 0;
				
				button_video.alpha = 0;
				button_logs.alpha = 0;
				button_adimm.alpha = 1;
				
				SaveArray['CurrentScreen'] = "adimm";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomPal',SaveArray);
				
				
				this.addEventListener(EnterFrameEvent.ENTER_FRAME, RotateAdimmImages);
				
				if(DiaStep01 === false){
					RunAdimmDiagnostic(SoundIt);
				}else if(DiaStep02 === false){
					RunAdimmDiagnostic(SoundIt);
				}
			}
		}
		private function DisplayPassCodeHandler():void{
			if(CurrentScreen == 'passcode'){
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
				if(CurrentScreen == 'adimm'){
					this.removeEventListener(EnterFrameEvent.ENTER_FRAME, RotateAdimmImages);
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal;	
				}
				bread_crumb. texture = this.assets.getTexture('bread_auth');
				CurrentScreen = 'passcode';
				adimmSprite.alpha = 0;
				pcSprite.alpha = 1;
				logsSprite.alpha = 0;
				videoSprite.alpha = 0;
				
				button_video.alpha = 0;
				button_logs.alpha = 0;
				button_adimm.alpha = 1;
				SaveArray['CurrentScreen'] = "passcode";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomPal',SaveArray);
				
			}
		}
		
		private function DisplayLogsHandler():void{
			if(CurrentScreen == 'logs'){
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
				if(CurrentScreen == 'adimm'){
					this.removeEventListener(EnterFrameEvent.ENTER_FRAME, RotateAdimmImages);
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal;	
				}
				bread_crumb. texture = this.assets.getTexture('bread_log');
				CurrentScreen = 'logs';
				adimmSprite.alpha = 0;
				pcSprite.alpha = 0;
				logsSprite.alpha = 1;
				videoSprite.alpha = 0;
				
				button_video.alpha = 0;
				button_logs.alpha = 1;
				button_adimm.alpha = 0;
				SaveArray['CurrentScreen'] = "logs";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomPal',SaveArray);
				
			}
		}
		private function DisplayVideoHandler():void{
			if(CurrentScreen == 'video'){
				
			}else{
				(stage.getChildAt(0) as Object).SoundFXObj.PlaySFX_Click();
				if(CurrentScreen == 'adimm'){
					this.removeEventListener(EnterFrameEvent.ENTER_FRAME, RotateAdimmImages);
				}
				if((stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal != undefined){	
					SaveArray = (stage.getChildAt(0) as Object).SavedGame.SavedGameObj.data.ServerRoomPal;	
				}
				bread_crumb. texture = this.assets.getTexture('bread_video');
				CurrentScreen = 'video';
				adimmSprite.alpha = 0;
				pcSprite.alpha = 0;
				logsSprite.alpha = 0;
				videoSprite.alpha = 1;
				
				button_video.alpha = 1;
				button_logs.alpha = 0;
				button_adimm.alpha = 0;
				SaveArray['CurrentScreen'] = "video";
				(stage.getChildAt(0) as Object).SavedGame.SaveRoomData('ServerRoomPal',SaveArray);
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
			
			
			
			this.assets.removeTexture("serverRoomPal_bg",true);
			this.assets.removeTexture("ServerRoomPal_Sprite_01",true);
			this.assets.removeTextureAtlas("ServerRoomPal_Sprite_01",true);
			
			(stage.getChildAt(0) as Object).falseAsset("serverRoomPal_01");
			(stage.getChildAt(0) as Object).falseAsset("serverRoomPal_02");
			(stage.getChildAt(0) as Object).falseAsset("serverRoomPal_03");
			
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
