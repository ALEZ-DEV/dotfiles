{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [{
      height = 36;
      layer = "top";
      modules-left = [ "hyprland/workspaces" ];
      modules-center = [ "group/center" ];

      modules-right = [ 
        "group/rightside"
      ];

      "group/rightside" = {
        orientation = "horizontal";
        modules = [
          "group/network"
          "custom/cpuprefix"
          "cpu"
          "custom/memoryprefix"
          "memory"
          "battery#prefix"
          "battery#suffix"
          "custom/timeprefix"
          "group/datetime" 
          "group/traygroup"
        ];
      };

      "group/center" = {
        orientation = "horizontal";
        modules = [ 
          "mpris#prefix"
          "mpris#suffix"
        ];
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

      "group/traygroup" = {
        orientation = "horizontal";
        modules = [
          "custom/cc"
          "privacy"
          "pulseaudio"
          "pulseaudio#prefix"
          "tray"
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

      "clock#centered" = {
        format = " {:a%, %d, %b %H:%M} ";
        interval = 1;
      };

      "battery#prefix" = {
        format = " {icon}";
        format-charging = " 󰂄";
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
        modules = [
          "network#statusprefix"
          "network#status"
          #"network#uploadprefix"
          #"network#dnlprefix"
        ];
      };

      "network#statusprefix" = {
        format-wifi = " ";
        format-ethernet = " 󰈀";
        format-disconnected = " 󰌙";
        tooltip-format = "{iframe} via {gwaddr}";
        tooltip-format-wifi = "{essid} ({signalStrengh}%)";
        tooltip-format-ethernet = "{iframe}";
        tooltip-format-disconnected = "Disconnected";
      };

      "network#status" = {
        format-wifi = "{signalStrengh}";
        format-ethernet = "LAN";
        format-disconnected = "";
        tooltip-format = "{iframe} via {gwaddr}";
        tooltip-format-wifi = "{essid} ({signalStrengh}%)";
        tooltip-format-ethernet = "{iframe}";
        tooltip-format-disconnected = "Disconnected";
        max-length = 50;
      };

      "network#uploadprefix" = {
        format-wifi = " 󰬬";
        format-ethernet = " 󰬬";
        format-disconnected = "";
        tooltip = false;
      };

      "network#dnlprefix" = {
        format-wifi = " 󰬦";
        format-ethernet = " 󰬦";
        format-disconnected = "";
        tooltip = false;
      };

      "custom/app" = {
        format = " Applications ";
        tooltip = false;
        on-click = "nwg-drawer";
      };

      "mpris#prefix" = {
        format = "{status_icon}";
        status-icons = {
          playing = "";
          paused = "";
          stopped = "";
        };
      };

      "mpris#suffix" = {
        format = "";
        format-playing = "{dynamic} ";
        format-paused = "{dynamic} ";
        format-stopped = "{dynamic} ";
        dynamic-order = [
          "artist"
          "title"
        ];
      };

      "custom/playerctl#prefix" = {
        exec = "~/.config/scripts/playerctl-status -s 2> /dev/null";
        format = "{}";
        interval = 1;
      };

      "custom/playerctl#suffix" = {
        exec = "~/.config/scripts/playerctl-status-new -s 2> /dev/null";
        format = "{}";
        interval = 1;
      };

      "custom/timeprefix" = {
        format = " ";
        tooltip = false;
      };

      "custom/memoryprefix" = {
        format = " ";
        tooltip = false;
      };

      "memory" = {
        tooltip-format = "{used:0.2f}/{total:0.2f} GB Used";
      };

      "network#cpuprefixon" = {
        format-wifi = " ";
        format-ethernet = " ";
        format-disconnected = "";
        tooltip = false;
      };

      "custom/cpuprefix" = {
        format = " ";
        tooltip = false;
      };

      "custom/barpadding" = {
        format = " ";
        tooltip = false;
      };

      "cpu" = {
        format = "{usage}%";
      };

      "pulseaudio#prefix" = {
        format = " {icon}";
        format-muted = " 󰝟";
        format-icons = {
          default = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
        };
      };

      "tray" = {
        format = "a";
        spacing = 10;
      };

      "custom/cc" = {
        format = " 󰍜";
        on-click = "";
        tooltip = false;
      };

      "custom/trayright" = {
        format = " ";
        tooltip = false;
      };

      "hyprland/workspaces" = {
        format = "{id}";
      };

      "hyprland/window" = {
        format = "{} ";
        separate-outputs = false;
      };
    }];
  };
}
