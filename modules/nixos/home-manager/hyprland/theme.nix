{ pkgs, ... }:
{
  home.packages = with pkgs; [
    nwg-look
  ];
  
  # cursor only applies to some apps without this
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    size = 22;
  };

  programs.pywal.enable = true; # adds pywal for zsh, kitty, rofi, nvim

  gtk = {
    enable = true;
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };

    iconTheme = {
    package = pkgs.gnome.adwaita-icon-theme;
    name = "Adwaita";
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 22;
    };

    font = {
      name = "NotoSans";
      package = pkgs.noto-fonts;
      size = 11;
    };
  };
  #qt = {
  #  enable = true;
  #  platformTheme.name = "adwaita-dark";
    #style.name = "kvantum";
    #style.package = pkgs.whitesur-kde;
  #};
}