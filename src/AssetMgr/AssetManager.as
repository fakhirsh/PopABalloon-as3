package AssetMgr 
{
	/**
	 * ...
	 * @author fakhir
	 */
	public class AssetManager 
	{

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
//		Textures
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		

		// Gameplay
		[Embed(source="../../assets/artwork/gameplay/nailTilt.png")] public static var NailTiltGFX:Class;
		[Embed(source = "../../assets/artwork/gameplay/nail-shock1Tilt.png")] public static var NailShocked1TiltGFX:Class;
		[Embed(source = "../../assets/artwork/gameplay/nail-shock2Tilt.png")] public static var NailShocked2TiltGFX:Class;
		[Embed(source = "../../assets/artwork/gameplay/balloon-green.png")] public static var BalloonGreenGFX:Class;
		[Embed(source = "../../assets/artwork/gameplay/balloon-red.png")] public static var BalloonRedGFX:Class;
		[Embed(source = "../../assets/artwork/gameplay/bolt.png")] public static var BoltGFX:Class;
		[Embed(source = "../../assets/artwork/gameplay/star.png")] public static var StarGFX:Class;
		[Embed(source = "../../assets/artwork/gameplay/poofCloud.png")] public static var PoofCloudGFX:Class;
		
		// Background
		[Embed(source = "../../assets/artwork/background/bg.jpg")] public static var BGGFX:Class;
		[Embed(source = "../../assets/artwork/background/cloud1.png")] public static var Cloud1GFX:Class;
		[Embed(source = "../../assets/artwork/background/cloud2.png")] public static var Cloud2GFX:Class;
		[Embed(source = "../../assets/artwork/background/cloud3.png")] public static var Cloud3GFX:Class;
		[Embed(source = "../../assets/artwork/background/ray.png")] public static var RayGFX:Class;
		
		// Logos
		[Embed(source = "../../assets/artwork/logos/logo_large.png")] public static var LogoLargeGFX:Class;
		[Embed(source = "../../assets/artwork/logos/logo_small.png")] public static var LogoSmallGFX:Class;
		
		// Main menu
		[Embed(source = "../../assets/artwork/mainmenu/playBtn.png")] public static var PlayBtnGFX:Class;
		[Embed(source = "../../assets/artwork/mainmenu/creditsBtn.png")] public static var CreditsBtnGFX:Class;
		[Embed(source = "../../assets/artwork/mainmenu/moreGamesBtn.png")] public static var MoreGamesBtnGFX:Class;
		[Embed(source = "../../assets/artwork/mainmenu/title.png")] public static var MainTitleGFX:Class;
		
		//Credts screen
		[Embed(source = "../../assets/artwork/credits/credits.png")] public static var CreditsLblGFX:Class;
		[Embed(source = "../../assets/artwork/credits/backBtn.png")] public static var BackBtnGFX:Class;
		
		// Text Labels
		[Embed(source = "../../assets/artwork/text/livesLbl.png")] public static var LivesLblGFX:Class;
		[Embed(source = "../../assets/artwork/text/comboLbl.png")] public static var ComboLblGFX:Class;
		[Embed(source = "../../assets/artwork/text/waveLbl.png")] public static var WaveLblGFX:Class;
		[Embed(source = "../../assets/artwork/text/great.png")] public static var GreatLblGFX:Class;
		[Embed(source = "../../assets/artwork/text/awesome.png")] public static var AwesomeLblGFX:Class;
		[Embed(source = "../../assets/artwork/text/nextWave.png")] public static var NextWaveLblGFX:Class;
		[Embed(source = "../../assets/artwork/text/gameOverBG.png")] public static var GameOverBGGFX:Class;
		[Embed(source = "../../assets/artwork/text/endMsg1.png")] public static var EndMsgLblGFX:Class;
		[Embed(source = "../../assets/artwork/text/RetryBtn.png")] public static var RetryBtnGFX:Class;
		[Embed(source = "../../assets/artwork/text/comboLbl2.png")] public static var ComboLbl2GFX:Class;
		[Embed(source = "../../assets/artwork/text/helpMsg4.png")] public static var HelpMsg4GFX:Class;
		[Embed(source = "../../assets/artwork/text/helpMsg5.png")] public static var HelpMsg5GFX:Class;
		[Embed(source = "../../assets/artwork/text/life1Msg.png")] public static var Life1MSGGFX:Class;
		
		[Embed(source = "../../assets/artwork/text/infoMsg1.png")] public static var InfoMsgGFX:Class;
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////				
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
//		Sound SFX + MUSIC
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
		
		[Embed(source = "../../assets/sounds/pop.mp3")] public static var PopSFX:Class;
		[Embed(source = "../../assets/sounds/shock.mp3")] public static var ShockSFX:Class;
		[Embed(source = "../../assets/sounds/mouseOver.mp3")] public static var MouseOverSFX:Class;
		[Embed(source = "../../assets/sounds/loseALife.mp3")] public static var LoseALifeSFX:Class;
		[Embed(source = "../../assets/sounds/nextWave.mp3")] public static var NextWaveSFX:Class;
		[Embed(source = "../../assets/sounds/combo1.mp3")] public static var Combo1SFX:Class;
		[Embed(source = "../../assets/sounds/win2.mp3")] public static var Win2SFX:Class;
		[Embed(source="../../assets/sounds/Wallpaper3.mp3")]  public static var Wallpaper3Music:Class;
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////				
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
//		Strings
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		
	
		public static const PATH1:String = "M 8.0924812,448.55491 C 5.780343,285.54914 5.7803465,78.612706 4.6242738,-42.77457";
		public static const PATH2:String = "M 4.6242762,-42.77457 C -1.1560738,109.82659 5.7803543,301.73411 4.6242843,448.55491";
		public static const PATH3:String = "M 627.74567,448.55491 C 630.05781,159.53758 11.560694,301.7341 12.716763,-42.77457";
		public static const PATH4:String = "M 9.2485549,448.55491 C 3.4682081,167.63005 628.90173,272.83236 632.36994,-42.77457";
		public static const PATH5:String = "M -10.404624,448.55491 C 106.35838,85.549139 505.20232,75.144509 656.6474,448.55491";
		public static const PATH6:String = "M -12.716763,-42.77457 C 65.895954,310.98266 580.34682,324.85548 648.55491,-42.77457";
		public static const PATH7:String = "M 17.34104,-42.77457 C 18.49711,136.41618 126.01156,218.49711 310.98266,218.49711 C 491.32948,218.49711 630.05781,280.92485 634.68208,448.55491";
		public static const PATH8:String = "M 5.7803468,448.55491 C 12.716763,270.52023 80.924855,218.49711 301.7341,217.34104 C 522.54335,216.18497 631.21387,180.34681 631.21387,-42.77457";
		public static const PATH9:String = "M 627.74566,448.55491 C 626.5896,226.58959 473.93698,225.02003 310.98266,219.65318 C 142.19166,214.0941 19.653179,198.84392 12.716763,-42.77457";
		public static const PATH10:String = "M -50.867051,31.213873 C 492.48555,21.965318 509.82658,367.63005 -52.02312,371.09826";
		public static const PATH11:String = "M 692.48555,33.526011 C 117.91907,34.682081 121.38728,366.47399 707.51445,363.00578";
		public static const PATH12:String = "M -71.676301,132.94797 C -27.745665,60.115607 -1.1560696,54.33526 41.618497,54.33526 C 84.393063,54.33526 86.712036,137.24996 137.57225,136.41619 C 208.09248,135.26012 199.99024,55.715624 265.89595,55.491329 C 343.3484,55.227739 310.99419,138.27889 403.46821,136.41619 C 505.28779,134.36523 461.27168,56.647399 538.72832,57.803468 C 616.18497,58.959538 572.25433,138.72832 669.36416,137.57225";
		public static const PATH13:String = "M 668.20809,314.45087 C 643.93064,246.24277 604.62428,239.30636 556.06937,239.30636 C 507.51445,239.30636 522.54336,328.32369 421.96532,331.79191 C 321.28116,335.26378 372.25433,240.46243 278.61271,238.15029 C 184.97109,235.83815 230.0578,334.10405 138.72832,330.63584 C 47.398844,327.16763 109.82659,219.65318 31.213873,224.27746 C -47.398844,228.90173 -71.676301,317.91908 -71.676301,317.91908";
		public static const PATH14:String = "M 625.43353,448.55491 C 626.5896,271.6763 631.21387,76.300578 470.52023,46.242775 C 309.82659,16.184971 186.71598,-6.2243572 146.82081,119.07514 C 102.2569,259.03783 133.96748,361.77115 330.63584,347.97688 C 497.91868,336.2437 542.19653,255.49133 549.13295,224.27746 C 556.06936,193.06358 570.65318,115.78468 435.83815,82.080924 C 324.85549,54.33526 210.03158,68.767885 200,129.47977 C 189.85085,190.90317 181.50289,269.36417 249.71098,269.36417 C 317.91907,269.36417 457.80347,284.39306 469.36416,219.65318 C 480.92486,154.91329 394.21965,109.82659 356.06936,123.69942 C 317.91908,137.57226 317.91908,173.23358 317.91908,212.71676 C 317.91908,256.6474 322.54335,448.55491 322.54335,448.55491";
		public static const PATH15:String = "M 619.65318,448.55491 C 502.89017,216.18497 404.62428,26.589595 404.62428,26.589595 C 404.62428,26.589595 145.66474,179.19075 33.526012,250.86705 C -78.612717,322.54335 624.27746,285.54913 624.27746,285.54913 C 624.27746,285.54913 63.583815,31.213873 46.242775,41.618497 C 28.901734,52.023121 216.18497,425.43353 243.93064,448.55491";
		
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////		

		public function AssetManager() 
		{

		}
		
	}

}