package screens.ingamescreens
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.AssetManager;
	import starling.utils.deg2rad;
	import starling.textures.TextureSmoothing;	
	
	public class ElectricBoxSquare extends Sprite
	{
		public var assets:AssetManager;
		public var SourceImage:Image;
		public var type:String;
		public var __x:Number;
		public var __y:Number;
		public var pos:String;
		
		
		public var left:Boolean;
		public var top:Boolean;
		public var right:Boolean;
		public var bottom:Boolean;
		
		public var neighbor_left:String;
		public var neighbor_top:String;
		public var neighbor_right:String;
		public var neighbor_bottom:String;
		
		public function ElectricBoxSquare(_assets:AssetManager,_type:String,_x:Number,_y:Number,
										//  n_l:String,
										//  n_t:String,
										//  n_r:String,
										//  n_b:String,
										  _pos:String)
		{
			super();
			this.assets = _assets;
			type = _type;
			__x = _x;
			__y = _y;
			pos = _pos;
		//	neighbor_left = n_l;
		//	neighbor_top = n_t;
		//	neighbor_right = n_r;
		//	neighbor_bottom = n_b;
			
			
			
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		private function onAddedToStage(e:Event):void{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			//		this.assets = new AssetManager();
//			if((stage.getChildAt(0) as Object).CheckAsset('goback') === false){
//				this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/GoBack/element_hud_goBack_v003a001.png'));
//				(stage.getChildAt(0) as Object).TrackAssets('goback');
//			}
			//	this.assets.enqueue(File.applicationDirectory.resolvePath('./media/graphics/HUD/GoBack/element_hud_goBack_v003a001.png'));
			//this.assets.enqueue(File.applicationDirectory.resolvePath('./media/audio/IntroSequence'));
//			this.assets.loadQueue(function(n:Number):void{
//				if(n==1){
					onLoadAssets();
//				}				
//			});						
			
		}		
		private function onLoadAssets():void{
			
			
			SourceImage = new Image(this.assets.getTexture('off_'+type));
		//	SourceImage.smoothing = TextureSmoothing.NONE;
			SourceImage.touchable = false;
			SourceImage.x = __x;
			SourceImage.y = __y;
			SourceImage.pivotX = 43.5;
			SourceImage.pivotY = 43.5;
		//	s
			trace("MY POS is: "+pos);
	//		if(pos == '0'){
	//			SourceImage.rotation = deg2rad(0);
	//		}
	//		else if(pos == '1'){
	//			SourceImage.rotation = deg2rad(90);
	//		}
	//		else if(pos == '2'){v
	//			SourceImage.rotation = deg2rad(180);
	//		}
	//		else if(pos == '3'){
	//			SourceImage.rotation = deg2rad(-90);
	//		}
			this.addChild(SourceImage);
			//Rotate(pos);
		}
		
		public function Rotate(rot:String):void{
			if(rot == "0"){
				SourceImage.rotation = deg2rad(90);
				pos = "1";
			}else if(rot == "1"){
				SourceImage.rotation = deg2rad(180);
				pos = "2";
			}else if(rot == "2"){
				SourceImage.rotation = deg2rad(-90);
				pos = "3";
			}else if(rot == "3"){
				SourceImage.rotation = deg2rad(0);
				pos = "0";
			}	
			RePos();
		}
		
		public function RePos():void{
			trace("My Repos is : "+pos);
			if(type == 'bend'){
				if(pos == "0"){
					left = false;
					top = false;
					right = true;
					bottom = true;
				}else if(pos == "1"){
					left = true;
					top = false;
					right = false;
					bottom = true;
				}else if(pos == "2"){
					left = true;
					top = true;
					right = false;
					bottom = false;
				}else if(pos == "3"){
					left = false;
					top = true;
					right = true;
					bottom = false;
				}
			}else if(type == 'straight'){
				if(pos == "0"){
					left = false;
					top = true;
					right = false;
					bottom = true;
				}else if(pos == "1"){
					left = true;
					top = false;
					right = true;
					bottom = false;
				}else if(pos == "2"){
					left = false;
					top = true;
					right = false;
					bottom = true;
				}else if(pos == "3"){
					left = true;
					top = false;
					right = true;
					bottom = false;
				}
			}else if(type == 'end'){
				if(pos == "0"){
					left = false;
					top = false;
					right = false;
					bottom = true;
				}else if(pos == "1"){
					left = true;
					top = false;
					right = false;
					bottom = false;
				}else if(pos == "2"){
					left = false;
					top = true;
					right = false;
					bottom = false;
				}else if(pos == "3"){
					left = false;
					top = false;
					right = true;
					bottom = false;
				}
			}else if(type == 'three'){
				if(pos == "0"){
					left = false;
					top = true;
					right = true;
					bottom = true;
				}else if(pos == "1"){
					left = true;
					top = false;
					right = true;
					bottom = true;
				}else if(pos == "2"){
					left = true;
					top = true;
					right = false;
					bottom = true;
				}else if(pos == "3"){
					left = true;
					top = true;
					right = true;
					bottom = false;
				}
			}
		}
		
		public function TurnOff():void{
			trace("turn_off");
			SourceImage.texture = this.assets.getTexture('off_'+type)
		}
		public function TurnOn():void{
			trace("turn_on");
			SourceImage.texture = this.assets.getTexture('on_'+type)
		}
		
	}
}