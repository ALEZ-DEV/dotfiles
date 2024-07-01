{ config, pkgs, lib, ... }:

let
  nix-gaming = inputs.nix-gaming;
in 
{
  imports = [
    ./aagl.nix
    nix-gaming.nixosModules.osu-lazer-bin
    nix-gaming.nixosModules.northstar-proton
    nix-gaming.viper
  ];

  home.packages = [
    steam
  ];
}
