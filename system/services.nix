{ userSettings, ... }:
{
  services.mullvad-vpn = {
    enable = true;
    package = pkgs.mullvad-vpn; # includes gui
  };
  services.onedrive.enable = true;
  
  services.syncthing = {
    enable = true;
    user = userSettings.username;
    dataDir = "/home/${userSettings.username}/Documents";
    configDir = "/home/${userSettings.username}/.config/syncthing";
  };
}