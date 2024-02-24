{ pkgs, ... }:
{
  home.packages = with pkgs; [
    spotify
    krita
    qbittorrent
    r2modman
    shotcut
    strawberry
    vlc
    zoom-us
    vscodium
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
    xarchiver
    xfce.thunar
    xfce.thunar-archive-plugin
    xfce.thunar-media-tags-plugin
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