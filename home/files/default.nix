{ config, pkgs, ... }:

{
  home.file = {
    ".config/alacritty/alacritty.toml".source = ./alacritty.toml;
    ".config/hypr/hyprland.conf".source = ./hyprland.conf;
  };
}
