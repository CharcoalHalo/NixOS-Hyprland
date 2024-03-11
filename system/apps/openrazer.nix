{ pkgs, userSettings, ... }:
{
  environment.systemPackages = with pkgs; [ polychromatic ];

  hardware.openrazer.enable = true;
  hardware.openrazer.users = [ userSettings.username ];
}