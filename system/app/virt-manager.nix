{ pkgs, userSettings, ... }:
{
  environment.systemPackages = with pkgs; [ qemu virtiofsd ];

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

  users.users.${userSettings.username}.extraGroups = [ "libvirtd" ];

}