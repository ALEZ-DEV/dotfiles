{ config, pkgs, ... }:

{
  home.file = {
    ".config/alacritty/alacritty.toml".source = ./alacritty.toml;
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;

    ".config/scripts/set-wallpaper.sh".source = ./scripts/set-wallpaper.sh;
    ".config/scripts/start-swww-daemon.sh".source = ./scripts/start-swww-daemon.sh;

    "Pictures/wallpaper/wallpaper.jpg".source = ./wallpaper.jpg;
  };
}
