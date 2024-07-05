{ config, pkgs, lib, ... }:

{
  imports = [
    ./direnv.nix
    ./theme.nix
    ./packages/default.nix
    ./files/default.nix
  ];

  home.username = "alez";
  home.homeDirectory = "/home/alez";

  home.stateVersion = "23.11"; 

  nixpkgs.config.allowUnfree = true;

  programs.home-manager.enable = true; 

  # don't work too ???!
  #programs.steam.enable = lib.mkIf config.packages.games.enable true;
}
