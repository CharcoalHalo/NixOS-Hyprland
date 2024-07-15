{ ... }:
{
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "loginctl lock-session";
        text = "lock";
        keybind = "l";
      }
      {
        label = "exit";
        action = "hyprctl dispatch exit";
        text = "exit hyprland";
        keybind = "h";
      }
      {
        label = "logout";
        action = "killall Hyprland";
        text = "logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "sleep";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "restart";
        keybind = "r";
      }
    ];

    style = ''
      * {
        all: unset;
        background-image: none;
        transition: 400ms cubic-bezier(0.05, 0.7, 0.1, 1);
      }

      window {
        background: rgba(0, 0, 0, 0.5);
      }

      button {
        font-family: "JetBrainsMono Nerd Font", "Font Awesome 5 Free";
        font-size: 2rem;
        background-color: rgba(33, 179, 209, 0.2);
        color: #FFFFFF;
        margin: 2rem;
        border-radius: 2rem;
        padding: 1rem;
      }

      button:hover {
        background-color: rgba(51, 51, 51, 0.5);
        border-radius: 4rem;
      }
    '';
  };
} 