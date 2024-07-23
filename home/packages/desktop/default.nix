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
    swaynotificationcenter
    mpvpaper
    swww
  ];

  services.swaync = {
    enable = true;
    package = pkgs.swaynotificationcenter;
  };
}
