{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.neovim
    pkgs.git
    pkgs.gcc
    pkgs.gitnuro
    pkgs.sqlitestudio
  ];
}
