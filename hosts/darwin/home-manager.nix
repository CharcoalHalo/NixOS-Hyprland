{ pkgs, userSettings, ... }:
{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  imports = [
    ../../user/apps/vim.nix
  ];

  zsh = {
    enable = true;
  };

  git = {
    enable = true;
    userName = userSettings.username;
    userEmail = userSettings.email;
  };

  kitty = {
    enable = true;
    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = -1; # only on shells with running tasks
      wayland_titlebar_color = "system";
      # font_family = "jetbrains-mono";
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
    };
  };
  
  # So home-manager can manage itself
  programs.home-manager.enable = true;

  home.stateVersion = "4"; # nix-darwin version
}