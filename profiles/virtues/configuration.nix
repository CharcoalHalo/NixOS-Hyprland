{ pkgs, lib, config, systemSettings, userSettings, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ../../system/general.nix
    ../../system/app/virt-manager.nix
    ../../system/hardware/nvidia.nix
    ../../system/hardware/openrazer.nix
    ../../system/security/automount.nix
    # ../../system/security/firewall.nix
    ../../system/wm/hyprland.nix
    ../../system/security/polkit.nix
  ];

  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  system.stateVersion = "23.11";
}