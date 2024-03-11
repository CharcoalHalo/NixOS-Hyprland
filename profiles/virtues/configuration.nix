{ pkgs, userSettings, ... }:
{
  imports = [
    ./hardware-configuration.nix
    
  ];

  # Bootloader
  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    useOSProber = true;
    efiSupport = true;
  };

  # Fix time when using dual boot
  time.hardwareClockInLocalTime = true;

  # Networking
  networking.hostName = "virtues";
  networking.networkmanager.enable = true;

  # NTFS support
  boot.supportedFilesystems = [ "ntfs" ];

  # Automounting 
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Shell
  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  system.stateVersion = "23.11";
}