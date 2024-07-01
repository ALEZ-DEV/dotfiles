{
  description = "Personal dotfiles of alez";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
    hostName = builtins.getEnv "HOST";
    hardwarePath = ./hosts/${hostName}/hardware-configuration.nix;
    configPath = ./hosts/${hostName}/config.nix;
  in {
    nixosConfigurations = {
      ${hostName} = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./system/configuration.nix
          hardwarePath
          configPath
        ];
      };
    };

    homeConfigurations."alez" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
          ./home/default.nix
          configPath
        ];
      };
    };
}
