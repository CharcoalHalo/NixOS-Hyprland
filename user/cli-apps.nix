{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
    cava
    nvtopPackages.full
    btop
    pciutils
    usbutils
    zip
    unzip
    rar
    wget
  ];
}