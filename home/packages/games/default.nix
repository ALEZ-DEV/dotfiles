{ config, pkgs, lib, inputs, programs, ... }:

let
  nix-gaming = inputs.nix-gaming.packages.${pkgs.system};
in 
{
  imports = [
    ./aagl.nix
  ];

  #programs.steam.enable = true; # Idk why it do not want to work

  home.packages = lib.mkIf config.packages.games.enable (with pkgs; [
    waydroid
    bottles
    lutris
    winetricks
    wineWowPackages.staging
    nix-gaming.osu-lazer-bin
    nix-gaming.northstar-proton
  ]);
}
