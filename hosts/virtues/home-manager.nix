{ pkgs, userSettings, ... }:
{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  imports = [
    ../../modules/nixos/home-manager/apps/userPackages.nix
    ../../modules/nixos/home-manager/apps/git.nix
    ../../modules/nixos/home-manager/apps/kitty.nix
    ../../modules/nixos/home-manager/apps/librewolf.nix
    ../../modules/nixos/home-manager/apps/spicetify.nix
    ../../modules/nixos/home-manager/apps/neovim.nix
    ../../modules/nixos/home-manager/apps/development.nix
    ../../modules/nixos/home-manager/apps/gaming.nix

    ../../modules/nixos/home-manager/hyprland/hyprconf.nix
    ../../modules/nixos/home-manager/hyprland/hypridle+lock.nix
    ../../modules/nixos/home-manager/hyprland/rofi.nix
    ../../modules/nixos/home-manager/hyprland/theme.nix
    ../../modules/nixos/home-manager/hyprland/swaync.nix
    ../../modules/nixos/home-manager/hyprland/waybar.nix
    ../../modules/nixos/home-manager/hyprland/wlogout.nix

    ../../modules/nixos/home-manager/services.nix
    ../../modules/nixos/home-manager/shell.nix
    ../../modules/nixos/home-manager/xdg.nix
  ];
  
  programs.home-manager.enable = true;

  home.stateVersion = "23.11";
}