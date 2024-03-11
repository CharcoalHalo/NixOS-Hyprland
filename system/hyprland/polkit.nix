{ pkgs, ... }:
{
  security.polkit.enable = true;

  environment.systemPackages = with pkgs; [ polkit_gnome ];

  services.gnome.gnome-keyring.enable = true;
  sercurity.pam.services.login.enableGnomeKeyring = true; # will try to unlock keyring on login 


  # allow mounting from file managers like thuanr
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (subject.isInGroup("wheel")) {
        if (action.id.startsWith("org.freedesktop.udisks2.")) {
          return polkit.Result.YES;
        }
      }
    });
  '';

  # create systemd user service to autostart gnome_polkit
  # needed for hyprland
  systemd = {
  user.services.polkit-gnome-authentication-agent-1 = {
    description = "polkit-gnome-authentication-agent-1";
    wantedBy = [ "graphical-session.target" ];
    wants = [ "graphical-session.target" ];
    after = [ "graphical-session.target" ];
    serviceConfig = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}