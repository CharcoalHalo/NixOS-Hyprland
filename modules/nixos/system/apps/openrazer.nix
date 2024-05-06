{ pkgs, userSettings, ... }:
{
  environment.systemPackages = with pkgs; [ polychromatic ];
  
  hardware.openrazer = {
    enable = true;
    users = [ userSettings.username ];
    batteryNotifier = {
      enable = true;
      percentage = 25;
      frequency = 300; # 5min
    };
    devicesOffOnScreensaver = true;
  };

  programs.tuxclocker = {
    enable = true;
    enableAMD = true;
    
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    gamescopeSession.enable = true;
    #gamescopeSession.env = ;
    gamescopeSession.args = [
      "-W 3840"
      "-H 2160"
      "-O HDMI-A-1"
      "--hdr-enabled"
      "--hdr-itm-enable"
    ];
  };
  
  programs.gamescope = {
    enable = true;
    capSysNice = true;
  };

  programs.gamemode = {
    enable = true;
    enableRenice = true;
  };
}