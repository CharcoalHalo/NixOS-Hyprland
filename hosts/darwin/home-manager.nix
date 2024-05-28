{ pkgs, userSettings, ... }:
{
  home.username = userSettings.username;
  home.homeDirectory = "/home/"+userSettings.username;

  imports = [
    ../../user/apps/vim.nix
  ];

  home.packages = with pkgs; [
    raycast
    spotify
    obsidian
    keepassxc
    vscodium
    rectangle
    zoom-us
  ];

  zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      extraConfig = ''
        alias nix-darwin-switch="darwin-rebuild switch --flake ~/.config/NixOS-Hyprland#Fletchers-MacBook-Air"
        '';
    };
  };

  programs.java = {
    enable = true;
    package = pkgs.openjdk22;
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