{ pkgs, userSettings, ... }:
{
  environment.systemPackages = with pkgs; [ polychromatic ];
  
  hardware.openrazer = {
    enable = true;
    users = [ userSettings.username ];
    batteryNotifier = {
      enable = false;
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
    ];
  };
  
  programs.gamescope = {
    enable = true;
    capSysNice = false;
  };

  programs.gamemode = {
    enable = true;
    enableRenice = false;
  };
}