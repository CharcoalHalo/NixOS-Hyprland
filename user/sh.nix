{ pkgs, ... }:
let
  myAliases = {
    nix-switch = "sudo nixos-rebuild switch --flake ~/.nix-config#system";
    home-switch = "home-manager switch --flake ~/.nix-config#user";
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
