{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.wofi
    pkgs.swww
    pkgs.pavucontrol
    pkgs.waybar
  ];
}
