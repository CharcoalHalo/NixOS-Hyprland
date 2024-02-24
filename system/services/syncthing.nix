{ ... }:
{ 
  services.syncthing = {
    enable = true;
    user = userSettings.username;
    dataDir = "/home/${userSettings.username}/Documents";
    configDir = "/home/${userSettings.username}/.config/syncthing";
  };
}