{ inputs, pkgs, ... }:
{
  imports = [ 
    ./pipewire.nix
    ./dbus.nix 
    ./fonts.nix
    ];

  environment.systemPackages = with pkgs; [
    hyprland-protocols
    grimblast
    nwg-displays
    hyprpicker
    wl-clipboard
    cliphist

    swayidle
    swaylock

    swww
    rofi-wayland
    dunst
    waybar
    libsForQt5.qtstyleplugin-kvantum
    catppuccin-kvantum

  ];

  nix.settings = {
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    xwayland.enable = true;
  };

  services.gnome.gnome-keyring.enable = true;

  # So swalock works
  security = {
    pam.services.swaylock = {
      text = ''
        auth include login
      '';
    };
    pam.services.login.enableGnomeKeyring = true;
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1"; # enables wayland for electron

    WLR_NO_HARDWARE_CURSORS = "1"; # if cursor invisible 
    EDITOR = "nano";
    BROWSER = "librewolf";
    TERMINAL = "kitty";

    # Nvidia 
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia"; # hardware acceleration

    # Toolkit
    GDK_BACKEND = "wayland,x11";
    SDL_VIDEODRIVER = "wayland,x11"; # can cause issues in games
    CLUTTER_BACKEND = "wayland";

    # XDG
    XDG_CURRENT_DESKTOP = "Hyprland";
    XDG_SESSION_TYPE = "wayland";
    XDG_SESSION_DESKTOP = "Hyprland";

    # QT
    QT_AUTO_SCREEN_SCALE_FACTOR="1";
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    QT_QPA_PLATFORMTHEME = "kvantum"; # if using kvantum over qt5ct
  };
}