{ pkgs, ... }:
let
  myAliases = {
    nix-switch-virtues = "sudo nixos-rebuild switch --flake ~/.nix-config#virtues";
    home-switch-virtues = "home-manager switch --flake ~/.nix-config#virtues";
    darwin-switch-mac = "darwin-rebuild switch --flake ~/.config/nix-darwin#Fletchers-MacBook-Air";
  };

in {
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
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
