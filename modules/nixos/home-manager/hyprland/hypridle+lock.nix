{ ... }:
{
  # hypridle config

  # TOFIX crashes when turning displays
  home.file.".config/hypr/hypridle.conf".text = ''
    general {
      lock_cmd = pidof hyprlock || hyprlock
      before_sleep_cmd = loginctl lock-session
      after_sleep_cmd = hyprctl dispatch dpms on
    }

    listener {
      timeout = 290
      on-timeout = notify-send "Going to sleep in 10"
      on-resume = notify-send "back"
    }

    listener {
      timeout = 300 # 300 = 5min
      on-timeout = loginctl lock-session
    }
    # listner {
    # timeout = 320
    # on-timeout = hyprctl dispatch dpms off
    # }
   '';

  # hyprlock config
  home.file.".config/hypr/hyprlock.conf".text = ''                                  
    source = $HOME/.cache/wal/colors-hyprland

    background {
        monitor =
        path = $HOME/Pictures/Wallpaper/kaisa.png  # only png supported for now
        color = $color7

        # all these options are taken from hyprland, see https://wiki.hyprland.org/Configuring/Variables/#b>
        blur_size = 4
        blur_passes = 3
        noise = 0.0117
        contrast = 1.3000 
        brightness = 0.8000
        vibrancy = 0.2100
        vibrancy_darkness = 0.0
    }

    input-field {
        monitor =
        size = 250, 50
        outline_thickness = 3
        dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.64 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true
        outer_color = $color1
        inner_color = $color0
        font_color = $color7
        fade_on_empty = true
        placeholder_text = <i>Password...</i> # Text rendered in the input box when it's empty.
        hide_input = false
        position = 0, 50
        halign = center
        valign = bottom
    }

    # Current time
    label {
        monitor =
        text = cmd[update:1000] echo "<b><big> $(date +"%H:%M:%S") </big></b>"
        color = $color5
        font_size = 64
        font_family = JetBrains Mono Nerd Font 10
        position = 0, 16
        halign = center
        valign = center
    }
  '';
}