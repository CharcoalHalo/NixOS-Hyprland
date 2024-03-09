{ ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;

    theme = "$HOME/.config/rofi/themes/nova-dark.rasi"
    # using pywal theme
  };
}