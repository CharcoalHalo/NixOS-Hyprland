{ inputs, pkgs, ... }:
{
  imports = [ 
    ./fonts.nix
    ./polkit.nix
    ./sddm.nix
    ];

  environment.systemPackages = with pkgs; [
    hyprland-protocols
    hyprpicker

    grimblast
    nwg-displays
    wl-clipboard
    cliphist

    wlogout
    libnotify

    swww
    dunst
    waybar
    xdg-utils

  ];

  # so you don't have to compile it
  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };

  services.dbus.enable = true;
  programs.dconf.enable = true;
  
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # So hyprlock works
  security.pam.services.hyprlock = {};
}