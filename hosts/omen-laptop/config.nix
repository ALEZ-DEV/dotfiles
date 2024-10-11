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
      #mpvpaper 'eDP-1' -o "--loop --panscan=1.0" ~/.config/wallpaper/wallpaper.mp4 &
      #mpvpaper 'DP-2' -o "--loop --panscan=1.0" ~/.config/wallpaper/wallpaper-littlescreen.mp4 &
      #mpvpaper 'HDMI-A-1' -o "--loop --panscan=1.0" ~/.config/wallpaper/wallpaper-widescreen.mp4 &
      
      source ~/.config/scripts/set-special-variable.sh

      swww-daemon &
      displays=$(wlr-randr --json | jq -r '.[].name')

      while :
      do
        for display in $displays; do
          echo $display
          swww img -o $display --transition-type wipe --transition-angle 35 --transition-step 60 ~/.config/wallpaper/$((0 + $RANDOM % $WALLPAPER_COUNT))
        done
        sleep 30m
      done
    '';
  };  
}
