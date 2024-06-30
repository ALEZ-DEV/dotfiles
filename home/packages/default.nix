{ config, pkgs, ... }:

{
  home.packages = [
   pkgs.mpv
   pkgs.floorp
   pkgs.qbittorrent
   pkgs.goofcord
   pkgs.localsend
   pkgs.mission-center
   pkgs.spotify
   pkgs.blueman
   pkgs.fastfetch
   pkgs.gnome.nautilus
  ];
}
