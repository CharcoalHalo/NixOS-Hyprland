{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
  ];
  
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.apple-cursor;
    name = "macOS-BigSur-White";
    size = 24;
  };

  programs.pywal.enable = true; # adds pywal for zsh, kitty, rofi, nvim

  gtk = {
    enable = true;

    # add font

    # need to add "exec-once hyprctl setcursor theme size" to hyprconfig
    cursorTheme.name = "macOS-BigSur-White";
    cursorTheme.package = pkgs.apple-cursor;
    cursorTheme.size = 24;

    iconTheme.name = "WhiteSur-dark";
    iconTheme.package = pkgs.whitesur-icon-theme;

    theme.name = "WhiteSur-Dark";
    theme.package = pkgs.whitesur-gtk-theme;

  };

  qt.style.package = pkgs.whitesur-kde; # adds mojave theme to kvantum
}