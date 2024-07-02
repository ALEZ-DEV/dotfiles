{ config, ... }:

{
  config = {
    packages = {
      dev.enable = true;
      games.enable = true;
      office.enable = true;
    };
    drivers.tablet.enable = true;
  };
}
