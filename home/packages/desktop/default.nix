{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
    onagre
    pavucontrol
    playerctl
    wl-clipboard
    grim
    slurp
    mako
    mpvpaper
    swww
  ];
}
