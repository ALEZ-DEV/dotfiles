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
    };
  };
}
