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
      "explorer.confirmDragAndDrop" = false;
      "git.autofetch" = true;
      "workbench.startupEditor" = "none";
      "git.confirmSync" = false;
      "redhat.telemetry.enabled" = false;
      "editor.indentSize" = "tabSize";
    };
  };
  
  programs.eclipse = {
    enable = true;
    plugins = [

    ];
  };
}