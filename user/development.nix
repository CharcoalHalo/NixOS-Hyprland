{ pkgs, ... }:
{
  home.packages = with pkgs; [ openjdk17 ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      
    ];
    userSettings = {
      "window.titleBarStyle" = "custom";
      "[nix]"."editor.tabsize" = 2;
    }
  };
  
  programs.eclipse = {
    enable = true;
    plugins = [

    ];
  };
}