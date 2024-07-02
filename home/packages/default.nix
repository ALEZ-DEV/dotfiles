{ config, pkgs, ... }:

{
  imports = [
    ./dev/default.nix
    ./desktop/default.nix
    ./games/default.nix
    ./lib/default.nix
    ./office/default.nix
  ];

  # basic needs
  home.packages = with pkgs; [
    mpv
    floorp
    qbittorrent
    localsend
    mission-center
    blueman
    fastfetch
    gnome.nautilus
  ];
}
