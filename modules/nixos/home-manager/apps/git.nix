{config, pkgs, userSettings, ... }:
{
  home.packages = with pkgs; [ git git-credential-manager ];

  programs.git = {
    enable = true;
    lfs.enable = true;
    userName = userSettings.username;
    userEmail = userSettings.email;

    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}