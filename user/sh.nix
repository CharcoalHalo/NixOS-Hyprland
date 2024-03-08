{ pkgs, ... }:
let
  myAliases = {
    nix-switch-virtues = "sudo nixos-rebuild switch --flake ~/.nix-config#virtues";
    home-switch-virtues = "home-manager switch --flake ~/.nix-config#virtues";
  };

in {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;
    shellAliases = myAliases;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
      theme = "agnoster";
    };
  };
}
