{ ... }:
{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;

    extraConfig = ''
    
    '';
  };

  programs.neovim.plugins = [

  ];
}