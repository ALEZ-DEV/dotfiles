{ config, pkgs, ... }:

let
  nvimRepo = "https://github.com/ALEZ-DEV/nvim";
  nvimDir = "${config.xdg.configHome}/nvim";
  gitPath = "${pkgs.git}/bin/git";
in
{
  home.packages = [ pkgs.git ];

  home.sessionPath = [ "${pkgs.git}/bin" ];

  home.activation = {
    run = ''
      if [ ! -d "${nvimDir}" ]; then
        ${gitPath} clone ${nvimRepo} ${nvimDir}
      else
        cd ${nvimDir} && ${gitPath} pull
      fi

      echo "Neovim configuration updated!"
    '';
  };
}
