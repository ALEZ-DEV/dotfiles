{ config, pkgs, ... }:

{
  options = {
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
    };
  };
}
