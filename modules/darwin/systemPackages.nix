{ pkgs }:
{
  environment.systemPackages = with pkgs; [
    bat
    btop
    cava
    gcc
    gnupg
    kitty
    neofetch
    openssh
    pciutils
    tree
    usbutils
    wget

    # File compression
    zip
    unzip
    rar
    unrar
  ];
}
