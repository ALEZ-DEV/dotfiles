{ config, pkgs, ... }:

let
  imagesList = ./wallpaper/wallpaper.list;

  floorpDir = "${config.user.home}/.floorp";
  floorpEntries = builtins.attrNames (builtins.readDir floorpDir);
  profileDir = builtins.elemAt (builtins.filter (entry: builtins.match ".*\\.default" entry != null) floorpEntries) 0;
  configDir = "${floorpDir}/${profileDir}";
in
{
  imports = [
    ./browser/default.nix
    ./mpv/default.nix
    ./nvim/default.nix
    ./swaync/default.nix
    ./wallpaper/default.nix
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
    ".config/scripts/set-special-variable.sh".text = ''
      export WALLPAPER_COUNT=$(wc -l < ${imagesList})
    '';

    ".config/alacritty/alacritty.toml".source = ./terminal/alacritty.toml;

    ".config/hypr/hyprland.conf".source = ./wm/hyprland.conf;
    ".config/hypr/monitor.conf".source = ./wm/${config.hostname}-monitor.conf;
    ".config/wallpaper/wallpaper.mp4".source = ./wm/wallpaper.mp4;
    ".config/wallpaper/wallpaper-littlescreen.mp4".source = ./wm/wallpaper-littlescreen.mp4;
    ".config/wallpaper/wallpaper-widescreen.mp4".source = ./wm/wallpaper-widescreen.mp4;

    ".config/waybar/style.css".source = ./waybar/style.css;
    ".config/waybar/style-bottom.css".source = ./waybar/style-bottom.css;
    ".config/waybar/style-hyprland.css".source = ./waybar/style-hyprland.css;
    ".config/waybar/style-options.css".source = ./waybar/style-options.css;
    ".config/waybar/style-app.css".source = ./waybar/style-app.css;
    ".config/waybar/style-scheme.css".source = ./waybar/style-scheme.css;

    ".config/scripts/mpv_with_cookie.py".text = ''
      #!/bin/bash
      COOKIE_FILE="/tmp/mpv_cookies.txt"
      DB_PATH="${configDir}/cookies.sqlite"
      TEMP_DB="/tmp/cookies.sqlite"

      cp "$DB_PATH" "$TEMP_DB"
      sqlite3 "$TEMP_DB" "SELECT host, path, isSecure, expiry, name, value FROM moz_cookies" > "$COOKIE_FILE"
      rm "$TEMP_DB"

      mpv --ytdl-format="(best[height>=1080]/bestvideo+bestaudio)" --cookies-file="$COOKIE_FILE" "$1"
    '';

    ".bashrc".text = ''
      alias mpvc='sh ${config.user.home}/.config/scripts/mpv_with_cookie.py'
    '';
  };

  home.sessionVariables = {
    XDG_CURRENT_DESKTOP = "Hyprland";
    HYPRSHOT_DIR = "~/Pictures/Screenshots";
  };
}
