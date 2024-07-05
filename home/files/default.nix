{ config, pkgs, ... }:

{
  imports = [
    ./browser/default.nix
    ./nvim/default.nix
  ];

  home.file = {
    ".config/scripts/set-wallpaper.sh".source = ./scripts/set-wallpaper.sh;
    ".config/scripts/hyprshot.sh".source = ./scripts/hyprshot.sh;

    ".config/alacritty/alacritty.toml".source = ./terminal/alacritty.toml;

    ".config/hypr/hyprland.conf".source = ./wm/hyprland.conf;
    "Pictures/wallpaper/wallpaper.jpg".source = ./wm/wallpaper.jpg;
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    HYPRSHOT_DIR = "~/Pictures/Screenshots"
  };
}
