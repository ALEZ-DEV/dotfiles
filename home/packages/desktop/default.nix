{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
    pavucontrol
    waybar
    wl-clipboard
    grim
    slurp
    mako
    mpvpaper
  ];
}
