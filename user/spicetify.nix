{ inputs, pkgs, lib, ...}:
# https://github.com/the-argus/spicetify-nix
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in
{
  imports = [ inputs.spicetify-nix.homeManagerModule ];

  programs.spicetify = {
    enable = true;
    theme = spicePkgs.themes.Sleek;
    colorScheme = "UltraBlack";

    enabledExtensions = with spicePkgs.extensions; [
      shuffle # shuffle+ (special characters are sanitized out of ext names)
      hidePodcasts
      # playlistIcons
      fullAlbumDate
    ];
  };

}