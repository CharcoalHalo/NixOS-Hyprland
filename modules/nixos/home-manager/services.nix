{ ... }:
{
  systemd.user.startServices = true;
  services.ssh-agent.enable = true;
  
  services.easyeffects.enable = true; #requires programs.dconf.enable = true; (enabled in hyprland for now)
}