{ pkgs, userSettings, ... }:
{
  environment.systemPackages = with pkgs; [ qemu ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.${userSettings.username}.extraGroups = [ "libvirtd" ];
}