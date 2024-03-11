{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    pywal
  ];
  
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