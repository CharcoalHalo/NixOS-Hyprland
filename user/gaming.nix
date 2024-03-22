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
    osu-lazer # bin won't launch
    # osu-lazer-bin
    shattered-pixel-dungeon

    # Tools 
    wine-staging
    winetricks
    gamemode
    gamescope
    mangohud
    goverlay
    protonup-qt
    #sunshine

  ];

  # systemd.user.services = {
  #     sunshine = {
  #       Unit.Description = "Sunshine is a Game stream host for Moonlight.";
  #       Service.ExecStart = "${pkgs.sunshine}/bin/sunshine";
  #       Install.WantedBy = [ "graphical-session.target" ];
  #     };
  # };
}