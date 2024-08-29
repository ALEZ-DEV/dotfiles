{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
    onagre
    pavucontrol
    playerctl
    swayosd
    wl-clipboard
    grim
    slurp
    swaynotificationcenter
    mpvpaper
    swww
    networkmanagerapplet
  ];

  services.swaync = {
    enable = true;
    package = pkgs.swaynotificationcenter;
  };

  wayland.windowManager.hyprland.systemd.enable = true;
}
