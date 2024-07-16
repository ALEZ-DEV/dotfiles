{ config, pkgs, ... }:

{
  imports = [
    ./browser/default.nix
    ./mpv/default.nix
    ./nvim/default.nix
  ];

  home.file = {
    ".config/scripts/hyprshot.sh".source = ./scripts/hyprshot.sh;

    ".config/alacritty/alacritty.toml".source = ./terminal/alacritty.toml;

    ".config/hypr/hyprland.conf".source = ./wm/hyprland.conf;
    ".config/wallpaper/wallpaper.mp4".source = ./wm/wallpaper.mp4;
    ".config/wallpaper/wallpaper-littlescreen.mp4".source = ./wm/wallpaper-littlescreen.mp4;
    ".config/wallpaper/wallpaper-widescreen.mp4".source = ./wm/wallpaper-widescreen.mp4;
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    HYPRSHOT_DIR = "~/Pictures/Screenshots";
  };
}
