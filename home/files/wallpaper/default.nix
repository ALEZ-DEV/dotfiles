{config, pkgs, ... }:
let
  wallpaperDownloaderRepo = "https://github.com/ALEZ-DEV/WallpaperDownloader.git";
  imagesList = ./wallpaper.list;
  imagesOutputFolder = "${config.xdg.configHome}/wallpaper";
  scriptDir = "${config.xdg.configHome}/scripts/wallpaperDownloader";
in
{
  home = {
    activation = {
      downloadWallpapers = ''
        export PATH="${pkgs.git}/bin:${pkgs.wget}/bin:$PATH"

        if [ ! -d "${scriptDir}" ]; then
          git clone ${wallpaperDownloaderRepo} ${scriptDir}
        else
          cd ${scriptDir} && git pull
        fi

        sh ${scriptDir}/bashImageDownloader.sh ${imagesList} ${imagesOutputFolder}

        echo "Downloaded wallpaper!"
      '';
    };

    file = {
      ".config/scripts/wallpaper-manager.sh".text = ''
        swww-daemon &
        
        while :
        do
          sh ${config.xdg.configHome}/scripts/update-wallpaper.sh
          sleep 30m
        done

      '';

      ".config/scripts/update-wallpaper.sh".text = ''
        source ${config.xdg.configHome}/scripts/set-special-variable.sh
        displays=$(wlr-randr --json | jq -r '.[].name')

        for display in $displays; do
          swww img -o $display --transition-type wipe --transition-angle 35 --transition-step 60 ~/.config/wallpaper/$((0 + $RANDOM % $WALLPAPER_COUNT))
        done
      '';
    };
  };
}
