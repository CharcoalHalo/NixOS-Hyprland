{ pkgs, ... }:
{
  # if not using xfce needed to save prefrences
  programs.xfconf.enable = true; 

  programs.thunar = {
    enable = true;
    plugins = with pkgs.xfce; [
      thunar-volman
      thunar-archive-plugin
      thunar-media-tags-plugin
    ];
  };

  services.gvfs.enable = true; # Mount, trash, and other functionalities
  services.tumbler.enable = true; # Thumbnail support for images
  environment.systemPackages = with pkgs; [
    ffmpegthumbnailer # video thumbnails
    evince # pdf viewer
    xarchiver # gui archiver
  ];

}