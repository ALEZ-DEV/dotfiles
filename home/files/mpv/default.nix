{ config, pkgs, lib, ... }:

let
  mpvRepo = "https://github.com/ALEZ-DEV/mpv";
  mpvDir = "${config.xdg.configHome}/mpv";
  gitPath = "${pkgs.git}/bin/git";
in
{
  home = {
    packages = [ pkgs.git ];

    sessionPath = [ "${pkgs.git}/bin" ];

    activation = {
      configureMPV = ''
        if [ ! -d "${mpvDir}" ]; then
          ${gitPath} clone ${mpvRepo} ${mpvDir}
        else
          cd ${mpvDir} && ${gitPath} pull
        fi

        echo "MPV configuration updated!"
      '';
    };
  };
}
