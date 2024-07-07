{ ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = [ "clock" "custom/separator" "hyprland/workspaces" "custom/separator" "tray" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "group/multispot" "network" "pulseaudio" "custom/separator" "custom/powermenu" ];

        "custom/separator" = {
          exec = "echo \"|\"";
          format = "{}";
        };
        
        "tray" = {
          icon-size = 16;
          spacing = 8;
        };

        "clock" = {
          format = " {:%I:%M %p}";
          interval = 60;
        };

        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = true;
          format = " {icon} ";
          show-special = true;
          on-click = "activate";
          on-scroll-up = "hyprctl dispatch workspace e+1";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          }
        };





      };
    };

    style = {

    };

  };
}