{ pkgs, userSettings, ... }:
{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  imports = [
    ../../user/browsers.nix
    ../../user/cli-apps.nix
    ../../user/default.nix
    ../../user/gaming.nix
    ../../user/git.nix
    ../../user/gtk.nix
    ../../user/hm-hyprland.nix
    ../../user/kitty.nix
    ../../user/sh.nix
    ../../user/services.nix
    ../../user/development.nix
    ../../user/spicetify.nix
  ];
  
  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}