{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Emulators
    pcsx2
    rpcs3
    ryujinx
    # yuzu # rip
    # citra # rip
    
    prismlauncher
    lutris
    heroic
    r2modman
    # osu-lazer
    osu-lazer-bin
    shattered-pixel-dungeon

    # Tools 
    wine-wayland
    winetricks
    mangohud
    goverlay
    protonup-qt
    steamtinkerlaunch
  ];
}
