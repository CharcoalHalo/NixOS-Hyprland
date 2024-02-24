{ pkgs, systemSettings, userSettings, ...}:
{
  # User account 
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [];
  };

  nixpkgs.config.allowUnfree = true;

  services.onedrive.enable = true;
  services.syncthing = {
    enable = true;
    user = userSettings.username;
    dataDir = "/home/${userSettings.username}/Documents";
    configDir = "/home/${userSettings.username}/.config/syncthing";
  };

  environment.systemPackages = with pkgs; [
    cryptsetup
    home-manager
  ];
  
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Bootloader
  boot.loader.grub = {
    enable = true;
    devices = [ "nodev" ];
    useOSProber = true;
    efiSupport = true;
  };

  # Networking
  networking.hostName = systemSettings.hostname;
  networking.networkmanager.enable = true;

  # Timezone and locale 
  time.timeZone = systemSettings.timezone; # time zone
  i18n.defaultLocale = systemSettings.locale;
  i18n.extraLocaleSettings = {
    LC_ADDRESS = systemSettings.locale;
    LC_IDENTIFICATION = systemSettings.locale;
    LC_MEASUREMENT = systemSettings.locale;
    LC_MONETARY = systemSettings.locale;
    LC_NAME = systemSettings.locale;
    LC_NUMERIC = systemSettings.locale;
    LC_PAPER = systemSettings.locale;
    LC_TELEPHONE = systemSettings.locale;
    LC_TIME = systemSettings.locale;
  };

  # Fix time when using dual boot
  time.hardwareClockInLocalTime = true;

  system.stateVersion = "23.11";
}