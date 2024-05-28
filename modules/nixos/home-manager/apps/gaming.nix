{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Emulators
    pcsx2
    rpcs3
    # yuzu # rip
    ryujinx
    # citra # rip
    
    prismlauncher
    lutris
    heroic
    r2modman
    # osu-lazer # bin won't launch
    # osu-lazer-bin
    shattered-pixel-dungeon

    # Tools 
    wine-wayland
    winetricks
    mangohud
    goverlay
    protonup-qt
  ];
}
