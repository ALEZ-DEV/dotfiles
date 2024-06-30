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
  in {
    nixosConfigurations = {
      "laptop-lenovo-nixos" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
        ];
      };

      "omen-laptop" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
        ];
      };
    };

    homeConfigurations."alez" = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      modules = [
            ./home.nix
            ./nvim.nix

            #game related
            ./aagl.nix
        ];
      };
    };
}
