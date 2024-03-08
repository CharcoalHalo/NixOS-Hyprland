{ pkgs, ... }:
{
  home.packages = with pkgs; [
    libsForQt5.dolphin
    gnome.nautilus
    gnome.eog
    mullvad-vpn
    filezilla
    krita
    qbittorrent
    r2modman
    shotcut
    strawberry
    vlc
    zoom-us
    vesktop
    (pkgs.discord.override {
      withVencord = true;
    })
    motrix
    keepassxc
    backintime
    blender_4_0
    easyeffects
    audacity
    pavucontrol
    syncthingtray
    gnome-text-editor
    qdirstat
    gparted
    isoimagewriter
    joplin-desktop
    libreoffice
    obs-studio
    obs-studio-plugins.wlrobs
    reaper
    shattered-pixel-dungeon
    thunderbird
  ];
}
