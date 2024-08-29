{ config, pkgs, ... }:

{
  imports = [
    ./browser/default.nix
    ./mpv/default.nix
    ./nvim/default.nix
    ./swaync/default.nix
    ./waybar/default.nix
    ./wofi/default.nix
  ];

  home.file = {
    ".config/scripts/hyprshot.sh".source = ./scripts/hyprshot.sh;
    ".config/scripts/playerctl-status.sh".source = ./scripts/playerctl-status.sh;
    ".config/scripts/playerctl-status-new.sh".source = ./scripts/playerctl-status-new.sh;
    ".config/scripts/start-polkit.sh".text = ''
      ${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1 &
    '';

    ".config/alacritty/alacritty.toml".source = ./terminal/alacritty.toml;

    ".config/hypr/hyprland.conf".source = ./wm/hyprland.conf;
    ".config/hypr/monitor.conf".source = builtins.toPath "~/.config/hypr/${config.user.pc-name}-monitor.conf";
    ".config/wallpaper/wallpaper.mp4".source = ./wm/wallpaper.mp4;
    ".config/wallpaper/wallpaper-littlescreen.mp4".source = ./wm/wallpaper-littlescreen.mp4;
    ".config/wallpaper/wallpaper-widescreen.mp4".source = ./wm/wallpaper-widescreen.mp4;

    ".config/waybar/style.css".source = ./waybar/style.css;
    ".config/waybar/style-bottom.css".source = ./waybar/style-bottom.css;
    ".config/waybar/style-hyprland.css".source = ./waybar/style-hyprland.css;
    ".config/waybar/style-options.css".source = ./waybar/style-options.css;
    ".config/waybar/style-app.css".source = ./waybar/style-app.css;
    ".config/waybar/style-scheme.css".source = ./waybar/style-scheme.css;
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    HYPRSHOT_DIR = "~/Pictures/Screenshots";
  };
}
