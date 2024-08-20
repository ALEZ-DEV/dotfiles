{ config, pkgs, lib, ... }:

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
      pc-name = mkOption {
        type = types.string;
        default = builtins.getEnv "HOST";
        description = "Default PC name of the current computer";
      };
    };
  };
}
