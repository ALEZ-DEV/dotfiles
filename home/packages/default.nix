{ config, pkgs, inputs, ... }:

{
  imports = [
    #./browser/default.nix
    ./dev/default.nix
    ./desktop/default.nix
    ./games/default.nix
    ./libraries/default.nix
    ./office/default.nix
    ./video-editor/default.nix
  ];

  # basic needs
  home.packages = with pkgs; [
    mpv
    qbittorrent
    localsend
    mission-center
    blueman
    fastfetch
    nautilus
    obs-studio
    p7zip
    eog
    gnome-disk-utility
    baobab
    qmk
    btop
    sqlite
    inputs.zen-browser.packages.${pkgs.system}.default
    cura-appimage
    delfin

    python3
    ffmpeg-full
    yt-dlp
  ];
}
