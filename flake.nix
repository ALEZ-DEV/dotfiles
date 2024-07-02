{
  description = "Personal dotfiles of alez";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming.url = "github:fufexan/nix-gaming";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    hostName = builtins.getEnv "HOST";
  in {
    nixosConfigurations = {
      ${hostName} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
        };

        modules = [
          inputs.nix-flatpak.nixosModules.nix-flatpak

          ./system/configuration.nix
          ./hosts/${hostName}/hardware-configuration.nix
        ];
      };
    };

    homeConfigurations."alez" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit inputs;
        };

        modules = [
          inputs.nix-flatpak.nixosModules.nix-flatpak

          ./home/default.nix
          ./system/options.nix
          ./hosts/${hostName}/config.nix
        ];
      };
    };
}
