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
    syncthingtray-minimal
    filelight
    gparted
    isoimagewriter

    # Creative Tools
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
