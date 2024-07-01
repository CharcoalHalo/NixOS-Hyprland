{ lib, pkgs, ... }:
{
  #environment.systemPackages = with pkgs; [
    #libsForQt5.qt5.qtquickcontrols2
    #libsForQt5.qt5.qtquickcontrols
    #libsForQt5.qt5.qtgraphicaleffects
   # libsForQt5.qt5.qtsvg
    #libsForQt5.qt5.qtbase
    
    #sddm-chili-theme
  #];
  environment.systemPackages = [(
  pkgs.catppuccin-sddm.override {
    flavor = "mocha";
    font  = "Noto Sans";
    fontSize = "9";
    #background = "${./wallpaper.png}";
    loginBackground = false;
  }
)];

  services.displayManager.sddm = {
    enable = true;
    #package = pkgs.lib.mkForce pkgs.libsForQt5.sddm;
    #extraPackages = pkgs.lib.mkForce [ pkgs.libsForQt5.qt5.qtgraphicaleffects ];
    extraPackages = with pkgs; [     
      kdePackages.qt6ct
      #kdePackages.qt5compat
      kdePackages.qtdeclarative
      kdePackages.qtsvg
    ];
    wayland.enable = true;
    enableHidpi = true;
    theme = "catppuccin-mocha";#"${import ./sddm-theme.nix { inherit pkgs; }}";

    settings = {
      General = {
        DefaultSession = "hyprland.desktop";
      };
      Theme = {
        CursorTheme = "Bibata-Modern-Ice";
        CursorSize = "22";
      };
    };
  };
}