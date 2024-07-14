{ config, pkgs, lib, ... }:

let
  nvimRepo = "https://github.com/ALEZ-DEV/nvim";
  nvimDir = "${config.xdg.configHome}/nvim";
  gitPath = "${pkgs.git}/bin/git";
in
{
  home = lib.mkIf config.packages.dev.enable {
    packages = [ pkgs.git ];

    sessionPath = [ "${pkgs.git}/bin" ];

    activation = {
      configureNeovim = ''
        if [ ! -d "${nvimDir}" ]; then
          ${gitPath} clone ${nvimRepo} ${nvimDir}
        else
          cd ${nvimDir} && ${gitPath} pull || echo "Failed to pull Neovim configuration"
        fi

        echo "Neovim configuration updated!"
      '';
    };
  };
}
