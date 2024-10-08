{ ... }:

{
  config = {
    packages = {
      dev.enable = true;
      games.enable = true;
      office.enable = true;
      video-editor.enable = true;
    };
    drivers.tablet.enable = true;
    user.wallpaper.script = ''
      mpvpaper 'eDP-1' -o "--loop --panscan=1.0" ~/.config/wallpaper/wallpaper.mp4 &
      mpvpaper 'DP-2' -o "--loop --panscan=1.0" ~/.config/wallpaper/wallpaper-littlescreen.mp4 &
      mpvpaper 'HDMI-A-1' -o "--loop --panscan=1.0" ~/.config/wallpaper/wallpaper-widescreen.mp4 &
    '';
  };  
}
