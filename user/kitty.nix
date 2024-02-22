{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [ kitty ];

  programs.kitty.enable = true;
  programs.kitty.settings = {
    enable_audio_bell = false;
    confirm_os_window_close = -1; # only on shells with running tasks
    wayland_titlebar_color = "system";
  };
}