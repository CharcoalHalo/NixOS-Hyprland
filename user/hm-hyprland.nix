{ pkgs, ... }:
{
  # wayland.windowManager.hyprland.enable = true;
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    # using pywal theme
  };
}