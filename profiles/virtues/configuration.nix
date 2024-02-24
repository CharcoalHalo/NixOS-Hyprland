{ pkgs, lib, config, systemSettings, userSettings, ... }:
let
 sysdir = "../../system";

in
{
  imports = [
    ../../system/general.nix
    ./hardware-configuration.nix
    # app
    ../../system/app/thunar.nix
    ../../system/app/virt-manager.nix
    # hardware
    ../../system/hardware/nvidia.nix
    ../../system/hardware/openrazer.nix
    # security 
    # ../../system/security/firewall.nix
    ../../system/security/ntfs.nix
    ../../system/security/polkit.nix
    # services
    ../../system/services/default.nix
    ../../system/services/automount.nix
    ../../system/services/onedrive.nix
    ../../system/services/syncthing.nix
    # window manager
    ../../system/wm/hyprland.nix

  ];

  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  system.stateVersion = "23.11";
}