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
}