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
        modules-right = [ "group/multispot" "network" "pulseaudio" "custom/separator" 
                          "custom/notification" "custom/separator" "custom/powermenu" ];

        "custom/separator" = {
          exec = "echo \"|\"";
          format = " {} ";
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
          format = "{icon}";
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
          };
          format-icons = {
            "1" = "󰈹";
            "2" = "";
            "3" = "󰓓";
            "4" = "";
            "5" = "";
            "default" = "";
          };
        };

        "hyprland/window" = {
          format = "{}";
        };

        "network" = {
          format = "󰖩 ";
          tooltip-format-ethernet = "{ifname} ";
          interface = "enp34s0";
          interval = 2;
        };

        "pulseaudio" = {
          format = " {volume}%";
          scroll-step = 5;
          on-click = "pavucontrol";
        };

        "custom/powermenu" = {
          format = "  ";
          tooltip = false;
          on-click = "exec wlogout -P 0 layer-shell";
        };

        "custom/notification" = {
          tooltip = false;
          format = "{} {icon} ";
          "format-icons" = {
            notification = "󱅫";
            none = "";
            "dnd-notification" = " ";
            "dnd-none" = "󰂛";
            "inhibited-notification" = " ";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = " ";
            "dnd-inhibited-none" = " ";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          exec = "swaync-client -swb";
          "on-click" = "sleep 0.1 && swaync-client -t -sw";
          "on-click-right" = "sleep 0.1 && swaync-client -d -sw";
          escape = true;
        };

        "custom/next" = {
          format = " ";
          on-click = "exec playerctl -p spotify next";
          tooltip = false;
        };
        "custom/back" = {
          format = " ";
          on-click = "exec playerctl -p spotify previous";
          tooltip = false;
        };
        "custom/spotify" = {
          format = " ";
          on-click = "exec playerctl -p spotify play-pause";
          tooltip = false;
        };

        "group/multispot" = {
          orientation = "horizontal";
          modules = [
            "custom/back"
            "custom/spotify"
            "custom/next"
          ];
        };
      };
    };

    style = ''
      @import '../../.cache/wal/colors-waybar.css';

      * {
          border: 2px;
          border-radius: 0;
          font-family: "JetBrainsMono Nerd Font", "Font Awesome 5 Free";
          font-weight: bold;
          color: white;
          font-size: 100%;
          font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
          padding: 1px;
          min-height: 0;
      }

      window#waybar {
          background: rgba(0, 0, 0, 0.5);
          border: 2px solid @color5;
          padding: 1px;
      }

      tooltip {
        background: rgba(43, 48, 59, 0.5);
        border: 1px solid rgba(100, 114, 125, 0.5);
      }
      tooltip label {
        color: white;
      }

      #workspaces button {
          padding: 0 5px;
          background: transparent;
          color: white;
          border-bottom: 3px solid transparent;
      }
      #workspaces button:hover {
          color: @color6;
          background-color: transparent;
      }


      #workspaces button.focused {
          background: #64727D;
          border-bottom: 3px solid white;
      }
      #workspaces button.active {
      color: @color6;
      }

      #mode, #clock  {
          padding: 0 10px;
      }

      #mode {
          background: #64727D;
          border-bottom: 3px solid white;
      }

      #clock {
      }


      @keyframes blink {
          to {
              background-color: #ffffff;
              color: black;
          }
      }
    ''; 
  };
}