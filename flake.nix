{
  description = "Personal dotfiles of alez";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-gaming.url = "github:fufexan/nix-gaming?rev=6ca46afc73dcca4bfef3e6d18c7f1ac8aae99bd9"; # added specific commit because osu devs don't know how to make a release
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
          ./home/default.nix
          ./system/options.nix
          ./hosts/${hostName}/config.nix
        ];
      };
    };
}
