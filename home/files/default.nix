{ config, pkgs, ... }:

{
  imports = [
    ./nvim/default.nix
  ];

  home.file = {
    ".config/scripts/set-wallpaper.sh".source = ./scripts/set-wallpaper.sh;

    ".config/alacritty/alacritty.toml".source = ./terminal/alacritty.toml;

    ".config/hypr/hyprland.conf".source = ./wm/hyprland.conf;
    "Pictures/wallpaper/wallpaper.jpg".source = ./wm/wallpaper.jpg;
  };
}
