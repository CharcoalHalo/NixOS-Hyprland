{ pkgs, userSettings, ... }:
{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  imports = [
    ../../user/git.nix
  ];
  
  programs.home-manager.enable = true;

  home.stateVersion = "24.05";
}