{ config, pkgs, lib, ... }:

let
  arcWTFRepo = "https://github.com/KiKaraage/ArcWTF";
  gitPath = "${pkgs.git}/bin/git";

  floorpDir = "${config.user.home}/.floorp";
  floorpEntries = builtins.attrNames (builtins.readDir floorpDir);
  profileDir = builtins.elemAt (builtins.filter (entry: builtins.match ".*\\.default" entry != null) floorpEntries) 0;
  configDir = "${floorpDir}/${profileDir}";
  chromeDir = "${configDir}/chrome";
in
{
  home = {
    packages = [ pkgs.git ];

    sessionPath = [ "${pkgs.git}/bin" ];

    activation = {
      run = lib.mkForce ''
        cd ${chromeDir}
        if $(${gitPath} rev-parse --is-inside-work-tree); then
          ${gitPath} pull
        else
          cd ${config.user.home}
          rm -rf ${chromeDir}
          ${gitPath} clone ${arcWTFRepo} ${chromeDir}
        fi

        echo "ArcWTF configuration updated!"
      '';
    };
  };
}
