{config, pkgs, ... }:
let
  wallpaperDownloaderRepo = "https://github.com/ALEZ-DEV/WallpaperDownloader";
  gitPath = "${pkgs.git}/bin/git";
  imagesList = ./wallpaper.list;
  imagesOutputFolder = "${config.user.home}/Pictures/wallpapers";
in
{
  home = {
    packages = [ pkgs.git ];

    sessionPath = [ "${pkgs.git}/bin" ];

    activation = {
      configureBrowser = ''
        if $(${gitPath} rev-parse --is-inside-work-tree); then
          ${gitPath} pull
        else
          cd ${config.user.home}
          rm -rf ./*
          ${gitPath} clone ${wallpaperDownloaderRepo}
        fi
        sh ./bashWallpaperDownload.sh ${imagesList} ${imagesOutputFolder}

        echo "Downloaded wallpaper!"
      '';
    };
  };
}
