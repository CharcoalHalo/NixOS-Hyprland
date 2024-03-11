{ pkgs, userSettings, ... }:
{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  imports = [
    ../../user/apps/git.nix
    ../../user/apps/kitty.nix
    ../../user/apps/librewolf.nix
    ../../user/apps/spicetify.nix
    ../../user/apps/vim.nix
    ../../user/hyprland/hyprconf.nix
    ../../user/hyprland/hypridle+lock.nix
    ../../user/hyprland/rofi.nix
    ../../user/hyprland/theme.nix
    ../../user/cli-apps.nix
    ../../user/default.nix
    ../../user/development.nix
    ../../user/gaming.nix
    ../../user/services.nix
    ../../user/sh.nix
  ];
  
  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}