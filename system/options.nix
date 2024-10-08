{ lib, ... }:

{
  options = with lib; {
    packages = {
      dev.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Install dev related packages";
      };
      games.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Install game related packages";
      };
      office.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Install office related packages";
      };
      video-editor.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Install Davinci-resolve and other utility";
      };
    };
    drivers = {
      tablet.enable = mkOption {
        type = types.bool;
        default = false;
        description = "Enable graphics tablet drivers";
      };
    };
    user = {
      home = mkOption {
        type = types.path;
        default = builtins.getEnv "HOME";
        description = "Default home folder of the current user";
      };
      wallpaper = {
        script = mkOption {
          type = types.str;
          description = "The script that will be executed at startup to manage your wallpaper";
          default = ''
            mpvpaper 'eDP-1' -o "--loop --panscan=1.0" ~/.config/wallpaper/wallpaper.mp4 &
          '';
        };
      };
    };
    hostname = mkOption {
      type = types.str;
      default = builtins.getEnv "HOST";
      description = "Default PC name of the current computer";
    };
  };
}
