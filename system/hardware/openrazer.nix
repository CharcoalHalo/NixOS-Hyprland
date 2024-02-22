{ pkgs, userSettings, ... }:
{
  environment.systemPackages = with pkgs; [ openrazer-daemon polychromatic ];

  hardware.openrazer.enable = true;
  hardware.openrazer.users = [ userSettings.username ];
}