{ pkgs, userSettings, ... }:
{
  imports = [
    ./hardware-configuration.nix
    #apps
    ../../modules/nixos/system/apps/systemPackages.nix
    ../../modules/nixos/system/apps/openrazer.nix
    ../../modules/nixos/system/apps/thunar.nix
    ../../modules/nixos/system/apps/virt-manager.nix
    #hyprland
    ../../modules/nixos/system/hyprland/hyprland.nix
    #general
    ../../modules/nixos/system/networking.nix
    ../../modules/nixos/system/pipewire.nix
  ];
  
  nixpkgs.config.allowUnfree = true;

  # User account 
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # Bootloader
  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    useOSProber = true;
    efiSupport = true;
    configurationLimit = 50;
  };

  # creates hard links of duplicate files in the nix store
  nix.settings.auto-optimise-store = true;

  # NTFS support
  boot.supportedFilesystems = [ "ntfs" ];

  # Automounting 
  services.gvfs.enable = true;
  services.udisks2.enable = true;

  # Shell
  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.initrd.kernelModules = [ "amdgpu" ];

  # vulkan
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  # offical amd drivers
  # hardware.opengl.extraPackages = with pkgs; [ amdvlk ];
  # hardware.opengl.extraPackages32 = with pkgs; [ driversi686Linux.amdvlk ];

  # Fix time when using dual boot
  time.hardwareClockInLocalTime = true;

  # Timezone and locale 
  time.timeZone = "Pacific/Auckland"; # time zone
  i18n.defaultLocale = "en_NZ.utf8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_NZ.utf8";
    LC_IDENTIFICATION = "en_NZ.utf8";
    LC_MEASUREMENT = "en_NZ.utf8";
    LC_MONETARY = "en_NZ.utf8";
    LC_NAME = "en_NZ.utf8";
    LC_NUMERIC = "en_NZ.utf8";
    LC_PAPER = "en_NZ.utf8";
    LC_TELEPHONE = "en_NZ.utf8";
    LC_TIME = "en_NZ.utf8";
  };

  system.stateVersion = "23.11";
}