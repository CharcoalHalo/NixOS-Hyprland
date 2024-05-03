{
  description = "CharcoalHalo's NixOS & Hyprland Flake";

  outputs = { self, nixpkgs, home-manager, nix-darwin, nix-homebrew, 
              homebrew-bundle, homebrew-cask, homebrew-core, ... } @inputs:

  let
    userSettings = rec {
      username = "fbright";
      name = "Fletcher";
      email = "fletcbet1660@gmail.com";
    };

    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config = {
        allowUnfree = true;
        permittedInsecurePackages = [ "electron-25.9.0" ];
      };
    };

    lib = nixpkgs.lib;
  
  in {
    nixosConfigurations = {
      virtues = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./hosts/virtues/configuration.nix ];
        specialArgs = {
          inherit inputs;
          inherit userSettings;
        };
      };
    };
    # Standalone home-manager allows for rootless updates
    homeConfigurations = {
      virtues = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hosts/virtues/home-manager.nix ];
        extraSpecialArgs = {
          inherit userSettings;
          inherit inputs;
        };
      };
    };

    darwinConfigurations."Fletchers-MacBook-Air" = nix-darwin.lib.darwinSystem {
      modules = [
        ./host/darwin/configuration.nix
        home-manager.darwinModules.home-manager
        nix-homebrew.darwinModules.nix-homebrew
        {
          nix-homebrew = {
            # Install under default prefix and install for Rosetta
            enable = true;
            enableRosetta = false;

            # User owning the Homebrew prefix
            user = "${userSettings.username}";

            taps = {
              "homebrew/homebrew-core" = homebrew-core;
              "homebrew/homebrew-cask" = homebrew-cask;
              "homebrew/homebrew-bundle" = homebrew-bundle;
            };
            mutableTaps = false;
            # Automatically migrate existing Homebrew installs
            # autoMigrate = false;
          };
        }
      ];
    };
  };

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # NixOS
    hyprland.url = "github:hyprwm/Hyprland";
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    # Macos
    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew = {
      url = "github:zhaofengli-wip/nix-homebrew";
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    }; 
  };
}
