{ config, pkgs, lib, ... }:

{
  home.packages = lib.mkIf config.packages.office.enable (with pkgs; [
    goofcord
    spotify
    obsidian
  ]);
}
