{ config, pkgs, ... }:

let
  arcWTFRepo = "https://github.com/KiKaraage/ArcWTF";
  styleDir = "${config.xdg.configHome}/browser/style";
  gitPath = "${pkgs.git}/bin/git";
in
{
  home = {
    packages = [ pkgs.git ];

    sessionPath = [ "${pkgs.git}/bin" ];

    activation = {
      run = ''
        if [ ! -d "${styleDir}" ]; then
          ${gitPath} clone ${arcWTFRepo} ${styleDir}
        else
          cd ${styleDir} && ${gitPath} pull
        fi

        echo "ArcWTF configuration updated!"
      '';
    };
  };
}
