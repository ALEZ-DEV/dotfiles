{ config, pkgs, ... }:

{
  home.packages = [
   pkgs.mpv
   pkgs.floorp
   pkgs.neovim
   pkgs.wofi
   pkgs.qbittorrent
   pkgs.goofcord
   pkgs.localsend
   pkgs.git
   pkgs.gcc
   pkgs.mission-center
   pkgs.spotify
   pkgs.blueman
   pkgs.fastfetch
  ];
}
