{ userSettings, ... }:
{
  imports = [
    ./hardware-configuration.nix
    
  ];


  # Networking
  networking.hostName = "crisis";
  networking.networkmanager.enable = true;

  environment.shells = [ pkgs.zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;

  system.stateVersion = "23.11";
}