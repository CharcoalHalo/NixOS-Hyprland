{ pkgs, ... }:
{
  home.packages = with pkgs; [
    neofetch
    cava
    nvtop
    btop
    pciutils
    usbutils
    zip
    unzip
    rar
  ];
}