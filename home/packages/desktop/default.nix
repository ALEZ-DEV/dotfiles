{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.wofi
    pkgs.swww
  ];
}
