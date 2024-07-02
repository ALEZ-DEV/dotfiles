{ config, pkgs, lib, ... }:

{
  home.packages = (lib.mkIf config.packages.dev.enable with pkgs; [
    neovim
    git
    gcc
    gitnuro
    lazygit
  ]);
}
