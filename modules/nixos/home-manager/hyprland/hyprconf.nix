{ pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.hyprland-plugins.packages.${pkgs.stdenv.hostPlatform.system}.csgo-vulkan-fix
    ];
    

    settings = {
      "$configs" = "$HOME/.config/hypr/configs";
      "source" = [
        "$configs/autostart.conf"
        "$configs/keybinds.conf"
        "$configs/windowrules.conf"
        "$configs/decoration.conf"
        "$configs/input.conf"
        #"$configs/monitors.conf"
        #"$configs/workspaces.conf"
        "./monitors.conf"
        "./workspaces.conf"
      ];
      # Environment Variables
      "env" = [
        "NIXOS_OZONE_WL,1" # set wayland flag for electron apps
        "NIXOS_XDG_OPEN_USE_PORTAL,1"

        # Toolkit
        "GDK_BACKEND,wayland,x11,*"
        #SDL_VIDEODRIVER = "wayland,x11"; # can cause issues in games
        "CLUTTER_BACKEND,wayland"

        # XDG
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"

        # GTK
        #"GTK_USE_PORTAL,1"

        # QT
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        #"QT_STYLE_OVERRIDE,adwaita"
        # QT_STYLE_OVERRIDE = "kvantum"; # if using kvantum over qt5ct
      ];
    };
  };
}

