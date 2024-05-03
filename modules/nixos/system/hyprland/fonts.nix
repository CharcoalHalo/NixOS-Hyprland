{ pkgs, ... }:
{
  fonts.fontDir.enable = true;
  fonts.packages = with pkgs; [
    powerline-fonts
    font-awesome
    nerdfonts
    jetbrains-mono
  ];
}
