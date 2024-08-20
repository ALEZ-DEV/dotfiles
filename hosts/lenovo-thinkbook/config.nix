{ config, ... }:

{
  config = {
    packages = {
      dev.enable = true;
      games.enable = false;
      office.enable = true;
      video-editor.enable = false;
    };
    drivers.tablet.enable = false;
  };
}
