{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # Emulators
    pcsx2
    rpcs3
    yuzu # rip
    ryujinx
    citra # rip
    
    prismlauncher

    steam
    lutris
    heroic

    # Tools 
    wine-staging
    winetricks
    gamemode
    gamescope
    mangohud
    goverlay
    protonup-qt
    osu-lazer # bin won't launch
  ];
}