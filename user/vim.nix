{ pkgs, ... }:
{
  home.packages = with pkgs; [];

  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlsia = true;

    extraConfig = ''
    
    '';
  };

  programs.neovim.plugins = [

  ];
}