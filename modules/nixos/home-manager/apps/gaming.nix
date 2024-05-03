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
    steam
    lutris
    heroic
    r2modman
    # osu-lazer # bin won't launch
    osu-lazer-bin
    shattered-pixel-dungeon

    # Tools 
    wine-staging
    wine-wayland
    winetricks
    gamemode
    gamescope
    mangohud
    goverlay
    protonup-qt

    lact # overclocking

  ];
}
