{ config, pkgs, ... }:

{
  imports = [
    ./dev/default.nix
    ./desktop/default.nix
    ./games/default.nix
  ];

  # basic needs
  home.packages = with pkgs; [
    mpv
    floorp
    qbittorrent
    goofcord
    localsend
    mission-center
    spotify
    blueman
    fastfetch
    gnome.nautilus
  ];
}
