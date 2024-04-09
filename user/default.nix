{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # system stuff
    pamixer
    playerctl
    gnome.eog
    gnome.gnome-calculator
    gnome-text-editor
    vlc
    pavucontrol
    rsync
    backintime
    syncthingtray
    filelight
    gparted
    isoimagewriter

    # Creative Tools
    # blender_4_0 # for blender bin
    blender-hip
    krita
    shotcut
    audacity
    reaper

    ungoogled-chromium
    libreoffice
    filezilla
    qbittorrent
    obsidian
    strawberry
    zoom-us
    vesktop
    (pkgs.discord.override {
      withVencord = true;
    })
    arrpc
    motrix
    keepassxc
    thunderbird

  ];

  programs.obs-studio = {
    enable = true;
    plugins = with pkgs.obs-studio-plugins; [
      wlrobs
    ];
  };
}
