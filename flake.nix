{
  description = "CharcoalHalo's NixOS & Hyprland Flake";

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:

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
        modules = [ 
          ./hosts/virtues/configuration.nix 
          inputs.minegrub-theme.nixosModules.default
        ];
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
  };

  inputs = {
      nixpkgs.url = "nixpkgs/nixos-unstable";

      home-manager.url = "github:nix-community/home-manager/master";
      home-manager.inputs.nixpkgs.follows = "nixpkgs";

      # NixOS
      hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      split-monitor-workspaces = {
        url = "github:Duckonaut/split-monitor-workspaces";
        inputs.hyprland.follows = "hyprland";
      };
      hyprsplit.url = "github:shezdy/hyprsplit";
      hyprsplit.inputs.hyprland.follows = "hyprland";

      spicetify-nix.url = "github:the-argus/spicetify-nix";

      # Grub theme
      minegrub-theme.url = "github:Lxtharia/minegrub-theme";
  };
}
