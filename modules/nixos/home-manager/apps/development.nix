{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    openjdk21
    bluej 

    # C tools 
    cppcheck 
    valgrind
    ];

  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      # nixpkgs are not up to date most of the time
      # https://github.com/nix-community/nix-vscode-extensions
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
      "telemetry.enableTelemetry" = false;
    };
  };
  
  programs.eclipse = {
    enable = true;
    plugins = [

    ];
    package = pkgs.eclipses.eclipse-java;
  };
}
