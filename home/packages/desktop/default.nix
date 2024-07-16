{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
    swww
    pavucontrol
    waybar
    wl-clipboard
    grim
    slurp
    mako
  ];
}
