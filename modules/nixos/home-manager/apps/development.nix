{ pkgs, ... }:
{
  home.packages = with pkgs; [ 
    # Java
    openjdk22
    # bluej no wayland support

    # C tools 
    cppcheck 
    valgrind


    # Game Dev
    godot_4
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
      "telemetry.telemetryLevel" = "off";
      "godotTools.editorPath.godot4" = "/home/fbright/.nix-profile/bin/godot4";
    };
  };
  
  programs.eclipse = {
    enable = true;
    plugins = [

    ];
    package = pkgs.eclipses.eclipse-java;
  };
}
