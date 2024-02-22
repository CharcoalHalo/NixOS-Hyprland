{
  description = "My Flake";



  outputs = { self, nixpkgs, home-manager, ... }@inputs:

  let
    systemSettings = {
      system = "x86_64-linux";
      hostname = "virtues";
      profile = "virtues";
      timezone = "Pacific/Auckland";
      locale = "en_NZ.utf8";
    };
    userSettings = rec {
      username = "fbright";
      name = "Fletcher";
      email = "fletcbet1660@gmail.com";
    };

    pkgs = import nixpkgs {
      system = systemSettings.system;
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "electron-25.9.0" ];
      };
      overlays = [ inputs.blender-bin.overlays.default ];
    };

    lib = nixpkgs.lib;
  
  in {
    nixosConfigurations = {
      system = lib.nixosSystem {
        system = systemSettings.system;
        modules = [ (./. + "/profiles"+("/"+systemSettings.profile)+"/configuration.nix") ];
        specialArgs = {
          inherit inputs;
          inherit systemSettings;
          inherit userSettings;
        };
      };
    };

    homeConfigurations = {
      user = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ (./. + "/profiles"+("/"+systemSettings.profile)+"/home.nix") ];
        extraSpecialArgs = {
          inherit systemSettings;
          inherit userSettings;
        };
      };
    };
  };


  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    blender-bin.url = "github:edolstra/nix-warez?dir=blender";

    hyprland.url = "github:hyprwm/Hyprland";
  };
}