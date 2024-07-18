{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wofi
    pavucontrol
    wl-clipboard
    grim
    slurp
    mako
    mpvpaper
    swww
  ];

  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = {
      height = 36;
      modules-left = [ "group/leftside" ];
      modules-right = [ "hyprland/window" ];
      layer = "top";

      "hyprland/window" = {
        format = "{} ";
        separate-outputs = false;
      };

      "group/leftside" = {
        orientation = "horizontal";
        modules = [
          "hyprland/workspaces"
          "mpris#prefix"
          "mpris#suffix"
        ];
      };

      "clock#time" = {
        format = "{:%H:%M}";
        tooltip-format = "{:%a, %d %b %H:%M}";
        interval = 1;
        tooltip = false;
      };

      "clock#date" = {
        format = "{:%a %d %b}";
        interval = false;
      };

      "group/datetime" = {
        orientation = "horizontal";
        drawer = {
          transition-left-to-right = false;
        };
        modules = [
          "clock#time"
          "clock#date"
        ];
      };

      "battery#prefix" = {
        format = " {icon}";
        format-charging = " 󰂄",
        format-icons = [
          "󰁺"
          "󰁼"
          "󰁾"
          "󰂁"
          "󰁹"
        ];
        interval = 1;
      };

      "battery#suffix" = {
        format = "{capacity}%";
        interval = 1;
      };

      "privacy" = {
        icon-size = 13;
        icon-spacing = 0;
      };

      "group/network" = {
        orientation = "horizontal";
        modules = []; #TODO
      }
    };
  };
}
