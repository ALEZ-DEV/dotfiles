{ config, pkgs, lib, inputs, ... }:

let
  nix-gaming = inputs.nix-gaming;
in 
{
  imports = [
    ./aagl.nix
  ];

  home.packages = (lib.mkIf config.packages.games.enable [
    pkgs.steam
    #nix-gaming.nixosModules.osu-lazer-bin
    #nix-gaming.nixosModules.northstar-proton
    #nix-gaming.nixosModules.viper
  ]);
}
