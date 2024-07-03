{ config, pkgs, ... }:

{
  imports = [
    ./browser/default.nix
    ./dev/default.nix
    ./desktop/default.nix
    ./games/default.nix
    ./office/default.nix
  ];

  # basic needs
  home.packages = with pkgs; [
    mpv
    qbittorrent
    localsend
    mission-center
    blueman
    fastfetch
    gnome.nautilus
    obs-studio
  ];
}
