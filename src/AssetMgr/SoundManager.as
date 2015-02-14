package AssetMgr
{
	import flash.media.*;

	public class SoundManager
	{
		private static var popSFX:Sound;
		private static var shockSFX:Sound;
		private static var mouseOverSFX:Sound;
		private static var loseALifeSFX:Sound;
		private static var nextWaveSFX:Sound;
		private static var combo1SFX:Sound;
		private static var combo2SFX:Sound;
		private static var win2SFX:Sound;
		
		private static var _music:Sound;
		private static var _musicChannel:SoundChannel;
		
		private static var _isSoundOn:Boolean;
		private static var _isMusicOn:Boolean;
		
		public function SoundManager()
		{
			popSFX = new AssetManager.PopSFX();
			shockSFX = new AssetManager.ShockSFX();
			mouseOverSFX = new AssetManager.MouseOverSFX();
			loseALifeSFX = new AssetManager.LoseALifeSFX();
			nextWaveSFX = new AssetManager.NextWaveSFX();
			combo1SFX = new AssetManager.Combo1SFX();
			//combo2SFX = new AssetManager.Combo2SFX();
			win2SFX = new AssetManager.Win2SFX();
			
			_musicChannel = new SoundChannel();
			_music = new AssetManager.Wallpaper3Music();
			
			_isSoundOn = true;
		}

		public static function get isSoundOn():Boolean{
			return _isSoundOn;
		}

		public static function get isMusicOn():Boolean{
			return _isMusicOn;
		}
		
		public static function PlayMusic():void {
			_musicChannel = _music.play(0, int.MAX_VALUE);
			_isMusicOn = true;
		}
		
		public static function StopMusic():void {
			_musicChannel.stop();
			_isMusicOn = false;
		}
		
		public static function SoundOff():void {
			_isSoundOn = false;
		}
		
		public static function SoundOn():void {
			_isSoundOn = true;
		}

		public static function MusicOff():void {
			_isMusicOn = false;
			StopMusic();
		}
		
		public static function MusicOn():void {
			_isMusicOn = true;
			PlayMusic();
		}
		
		public static function PlayPopSFX():void{
			if(!_isSoundOn) return;
			
			popSFX.play();
		}
		
		public static function PlayShockSFX():void{
			if(!_isSoundOn) return;
		
			shockSFX.play();
		}
		
		public static function PlayMouseOverSFX():void{
			if(!_isSoundOn) return;
			
			mouseOverSFX.play();
		}
		
		public static function PlayLoseALifeSFX():void{
			if(!_isSoundOn) return;
			
			loseALifeSFX.play();
		}
		
		public static function PlayNextWaveSFX():void{
			if(!_isSoundOn) return;
			
			nextWaveSFX.play();
		}
		
		public static function PlayCombo1SFX():void{
			if(!_isSoundOn) return;
			
			combo1SFX.play();
		}
		
		public static function PlayCombo2SFX():void{
			if(!_isSoundOn) return;
			
			combo2SFX.play();
		}
		
		public static function PlayWin2SFX():void{
			if(!_isSoundOn) return;
			
			win2SFX.play();
		}
		
	}
}