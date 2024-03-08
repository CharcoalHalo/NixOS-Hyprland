{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [ kitty ];

  programs.kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = -1; # only on shells with running tasks
      wayland_titlebar_color = "system";
      font_family = "jetbrains-mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };
    extraConfig = ''
      # Base16 Dark Violet - kitty color config
      # Scheme by ruler501 (https://github.com/ruler501/base16-darkviolet)
      background #000000
      foreground #b08ae6
      selection_background #b08ae6
      selection_foreground #000000
      url_color #00ff00
      cursor #b08ae6
      active_border_color #593380
      inactive_border_color #231a40
      active_tab_background #000000
      active_tab_foreground #b08ae6
      inactive_tab_background #231a40
      inactive_tab_foreground #00ff00
      tab_bar_background #231a40

      # normal
      color0 #000000
      color1 #a82ee6
      color2 #4595e6
      color3 #f29df2
      color4 #4136d9
      color5 #7e5ce6
      color6 #40dfff
      color7 #b08ae6

      # bright
      color8 #593380
      color9 #bb66cc
      color10 #231a40
      color11 #432d59
      color12 #00ff00
      color13 #9045e6
      color14 #a886bf
      color15 #a366ff
    '';
  };
}
