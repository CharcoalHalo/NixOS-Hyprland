{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #libsForQt5.qt5ct
    #libsForQt5.qtstyleplugin-kvantum
    nwg-look

    #adw-gtk3
    #whitesur-icon-theme
    #whitesur-kde
  ];
  
  # cursor only applies to some apps without this
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Ice";
    #package = pkgs.apple-cursor;
    #name = "macOS-BigSur-White";
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
  /* gtk = {
    enable = true;

    font = {
      name = "NotoSans";
      package = pkgs.noto-fonts;
    };
    
    # need to add "exec-once hyprctl setcursor theme size" to hyprconfig
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 22;
    };

    theme = {
      name = "adw-gtk3";
      package = pkgs.adw-gtk3;
      #name = "WhiteSur-Dark-Solid";
      #package = pkgs.whitesur-gtk-theme;
    };

    # Options: WhiteSur-light, WhiteSur-dark, WhiteSur
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    }; 

    
    #cursorTheme.name = "macOS-BigSur-White";
    #cursorTheme.package = pkgs.apple-cursor;
    #theme.name = "WhiteSur-Dark";
    #theme.package = pkgs.whitesur-gtk-theme;

  };*/
  #qt = {
  #  enable = true;
  #  platformTheme.name = "adwaita-dark";
    #style.name = "kvantum";
    #style.package = pkgs.whitesur-kde;
  #};
}