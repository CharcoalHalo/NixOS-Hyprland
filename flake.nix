{
  description = "CharcoalHalo's NixOS & Hyprland Flake";

  outputs = { self, nixpkgs, home-manager, ... }@inputs:

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
      overlays = [ inputs.blender-bin.overlays.default ];
    };

    lib = nixpkgs.lib;
  
  in {
    nixosConfigurations = {
      virtues = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./profiles/virtues/configuration.nix ];
        specialArgs = {
          inherit inputs;
          inherit userSettings;
        };
      };

      crisis = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./profiles/crisis/configuration.nix ];
        specialArgs = {
          inherit inputs;
          inherit userSettings;
        };
      };
    };

    homeConfigurations = {
      virtues = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./profiles/virtues/home.nix ];
        extraSpecialArgs = {
          inherit userSettings;
          inherit inputs;
        };
      };

      crisis = home-manager.lib.homeManagerConfiguration {
        # inherit pkgs;
        modules = [ ./profiles/crisis/home.nix ]; 
        extraSpecialArgs = {
          inherit userSettings;
          inherit inputs;
        };
      };
    };
  };


  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # blender with builtin cuda support
    blender-bin.url = "github:edolstra/nix-warez?dir=blender";

    hyprland.url = "github:hyprwm/Hyprland";

    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };
}
