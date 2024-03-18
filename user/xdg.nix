{ pkgs, userSettings, ... }:
{
  xdg = {
    enable = true;

    xdg.mime = {
      enable = true;

    };

    xdg.userDirs ={
      enable = true;
      desktop = "${home.homeDirectory}/Desktop";
      download = "${home.homeDirectory}/Downloads";
    };
  };
}