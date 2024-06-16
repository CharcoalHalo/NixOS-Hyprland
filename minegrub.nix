# flake.nix
{
  inputs.minegrub-theme.url = "github:Lxtharia/minegrub-theme";
  # ...

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations.HOSTNAME = nixpkgs.lib.nixosSystem {
      modules = [
        ./configuration.nix
        inputs.minegrub-theme.nixosModules.default
      ];
    };
  }
}

# configuration.nix
{ pkgs, ... }: {

  boot.loader.grub = {
    minegrub-theme = {
      enable = true;
      splash = "100% Flakes!";
      boot-options-count = 4;
    };
    # ...
  };
}