{config, pkgs, userSettings, ... }:
{
  home.packages = with pkgs; [ git ];

  programs.git = {
    enable = true;
    userName = userSettings.username;
    userEmail = userSettings.email;
  };
}