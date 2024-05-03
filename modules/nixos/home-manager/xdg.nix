{ pkgs, userSettings, ... }:
{
  # Still not working
  xdg = {
    enable = true;
    mime.enable = true; # always true on linux
    mimeApps.defaultApplications = {
      "application/zip" = [ "org.gnome.FileRoller.desktop" ];
    };
    # to add mime types edit .config/mimeapps.list

    userDirs ={
      enable = true;
      desktop = "/home/${userSettings.username}/Desktop";
      download = "/home/${userSettings.username}/Downloads";
      
      extraConfig = {
        XDG_ONEDRIVE_DIR = "/home/${userSettings.username}/OneDrive";
      };
    };
  };
}