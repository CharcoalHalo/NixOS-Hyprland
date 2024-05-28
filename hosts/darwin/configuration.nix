{ userSettings, ... }:

let user = "fbright"; in
{ 
  imports = [
    ../../modules/darwin/home-manager.nix
  ];
  environment.systemPackages = with pkgs; [
    neovim
  ];
  nixpkgs.config.allowUnfree = true;
  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;

  nix = {
    package = pkgs.nixUnstable;
    settings.trusted-users = [ "@admin" "${user}" ];

    # Automatic garbage collection
    gc = {
      user = "root";
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
      options = "--delete-older-than 30d";
    };

    # Enable flakes
    settings.experimental-features = "nix-command flakes";
  };

  system = {
    defaults = {
      # 120, 90, 60, 30, 12, 6, 2
      KeyRepeat = 2;
    };


    # Used for backwards compatibility read changelog before changing
    # $ darwin-rebuild changelog
    stateVersion = 4;
  };

  homebrew = {
    enable = true;
    casks = pkgs.callPackage ../../modules/darwin/casks.nix {};
  };

  nixpkgs.hostPlatform = "aarch64-darwin";
}