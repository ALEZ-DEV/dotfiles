{ config, pkgs, lib, ... }:

{
  home.packages = (lib.mkIf config.packages.dev.enable [
    pkgs.neovim
    pkgs.git
    pkgs.gcc
    pkgs.gitnuro
    pkgs.lazygit
  ]);
}
