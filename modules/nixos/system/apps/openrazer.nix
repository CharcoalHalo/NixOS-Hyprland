{ pkgs, userSettings, ... }:
{
  environment.systemPackages = with pkgs; [ polychromatic ];
  
  hardware.openrazer = {
    enable = true;
    users = [ userSettings.username ];
    batteryNotifier = true;
    devicesOffOnScreensaver = true;
  };
}