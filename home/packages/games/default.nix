{ config, pkgs, lib, inputs, ... }:

let
  nix-gaming = inputs.nix-gaming.packages.${pkgs.system};
in 
{
  imports = [
    ./aagl.nix
  ];

  home.packages = lib.mkIf config.packages.games.enable (with pkgs; [
    steam
    waydroid
    bottles
    lutris
    winetricks
    wineWowPackages.staging
    nix-gaming.osu-lazer-bin
    nix-gaming.northstar-proton
  ]);
}
