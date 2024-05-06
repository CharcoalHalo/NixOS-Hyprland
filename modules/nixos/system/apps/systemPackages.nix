{ pkgs, userSettings, ...}:
{
  environment.systemPackages = with pkgs; [
    bat
    btop
    cava
    gcc
    gnupg
    neofetch
    cryptsetup # luks unlock
    home-manager # home folder managment
    neofetch
    tree
    nvtopPackages.full
    pciutils
    usbutils
    wget
    # File compression
    zip
    unzip
    rar
    unrar
  ];

  system.stateVersion = "23.11";
}