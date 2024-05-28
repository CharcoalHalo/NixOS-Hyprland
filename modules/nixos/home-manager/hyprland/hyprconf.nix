{ pkgs, inputs, ... }:
{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      #split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      inputs.hyprsplit.packages.${pkgs.system}.hyprsplit
    ];
    

    settings = {
      "$configs" = "$HOME/.config/hypr/configs";
      "source" = [
        "$configs/autostart.conf"
        "$configs/keybinds.conf"
        "$configs/windowrules.conf"
        "$configs/decoration.conf"
        "$configs/input.conf"
        "$configs/monitors.conf"
        "$configs/workspaces.conf"
      ];
    };
  };
}