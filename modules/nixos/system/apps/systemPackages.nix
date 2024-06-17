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
    nvtopPackages.amd
    pciutils
    usbutils
    wget
    # File compression
    zip
    unzip
    rar
    unrar

    libsForQt5.kservice
  ];

  system.stateVersion = "23.11";
}