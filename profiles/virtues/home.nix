{ pkgs, userSettings, ... }:
{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  imports = [

  ];
  
  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}