{ ... }:

{
  config = {
    packages = {
      dev.enable = true;
      games.enable = true;
      office.enable = true;
      video-editor.enable = false;
    };
    drivers.tablet.enable = true;
  };  
}
