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
  };
}
