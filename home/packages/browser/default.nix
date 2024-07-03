{ config, pkgs, ... }:

let
  chromeDir = "${config.xdg.configHome}/browser/style/userChrome.css";
in
{
  home.packages = with pkgs; [
    (floorp.override {
      userChrome = chromeDir;
    })
  ];
}
