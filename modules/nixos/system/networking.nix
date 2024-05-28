{ pkgs, userSettings, ... }:
{
  # Networking
  networking.hostName = "virtues";
  networking.networkmanager.enable = true;

  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [ 30298 ];
  networking.firewall.allowedUDPPorts = [       ];

  services.zerotierone = {
    enable = true;
  };

  services.openssh = {
    enable = false;
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    settings.PermitRootLogin = "no";
  };
  users.users.${userSettings.username}.openssh.authorizedKeys.keys = 
  [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDBHgWkT2h8uEnttH8hUBKKUcx5aQVuNX80jh2ous50gswM1BxgTqfjzSGNx0Mz9ji5/Pd7mYvdOV9i1DML8e60URUfIZGsErIBz8CdIilQaOB0w0z3ooyu93xyu5vxduYvMQdhwn30x473tlFNbpgutMlrlPbxX95y/8kR4gYna+Rm3FHq4Eigz+xeWvWYBmT267f7J4SolT3ARmeteQ8r67/O0Q4liA7LImuQkBNg5vW2l8FEtSBU/1C0TEfUJ6N8SMb6aG9FROOASxxfo/v0KGZz1h70gx0B2QxL+Q+ubOC0UXLw16ZAS96grjcV/GiZGPZPYVLmNubRen/3pZ5z35yfRYiKIw6SYwquM7u4ikv770QylYiNX1yIQJksWpoIFjOVIWeUUuDN2psG+PjMqwcSdC3rjMXJT/dlAjEn7yMCsfgRxXz38FChdEr/lD7jAOxuXfYlAczvyQU3qhhIuDtPWXIl2wTnuSelYerhtr6l5ml0tHH13SKaEx3/q3M= fbright@fedora" ];
  
  services.mullvad-vpn = {
    enable = false;
    package = pkgs.mullvad-vpn; # includes gui
  };

  #services.onedrive.enable = true;
  
  services.syncthing = {
    enable = true;
    user = userSettings.username;
    dataDir = "/home/${userSettings.username}/Documents";
    configDir = "/home/${userSettings.username}/.config/syncthing";
  };

  # Bluetooth
  hardware.bluetooth.enable = true; 
  services.blueman.enable = true;
}
