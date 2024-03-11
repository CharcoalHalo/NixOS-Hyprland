{ pkgs, userSettings, ...}:
{
  # User account 
  users.users.${userSettings.username} = {
    isNormalUser = true;
    description = userSettings.name;
    extraGroups = [ "networkmanager" "wheel" ];
    packages = [];
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    cryptsetup # luks unlock
    home-manager # home folder managment
  ];
  
  # Enable Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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