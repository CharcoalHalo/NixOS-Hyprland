{ pkgs, ... }:
{
  gtk = {
    enable = true;

    # add font

    cursorTheme.name = "macOS-BigSur-White";
    cursorTheme.package = pkgs.apple-cursor;
    cursorTheme.size = 24;

    iconTheme.name = "WhiteSur-dark";
    iconTheme.package = pkgs.whitesur-icon-theme;

    theme.name = "WhiteSur-Dark";
    theme.package = pkgs.whitesur-gtk-theme;

  };
  qt.style.package = pkgs.whitesur-kde; # for kvantum
}