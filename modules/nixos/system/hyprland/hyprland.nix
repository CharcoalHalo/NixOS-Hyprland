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
    hypridle
    hyprlock

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
    xdgOpenUsePortal = false;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # So hyprlock works
  security.pam.services.hyprlock = {
    text = ''
      auth include login
    '';
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # set wayland flags for electron apps
    NIXOS_XDG_OPEN_USE_PORTAL = "1";

   
    EDITOR = "nano";
    BROWSER = "librewolf";
    TERMINAL = "kitty";

    # Toolkit
    GDK_BACKEND = "wayland,x11";
    #SDL_VIDEODRIVER = "wayland,x11"; # can cause issues in games
    CLUTTER_BACKEND = "wayland";

    # XDG
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";

    # GTK
    GTK_USE_PORTAL = "1";

    # QT
    QT_AUTO_SCREEN_SCALE_FACTOR="1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME="qt5ct";
    QT_STYLE_OVERRIDE = "kvantum"; # if using kvantum over qt5ct
  };
}