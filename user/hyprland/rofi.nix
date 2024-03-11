{ pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    theme = "~/.config/rofi/themes/nova-dark.rasi";
    # using pywal theme
  };
}