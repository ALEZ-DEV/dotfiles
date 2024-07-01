{ config, pkgs, lib, ... }:

let
  aagl = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz");
in 
{
  home.packages = (lib.mkIf config.packages.dev.enable [
    aagl.wavey-launcher
    aagl.honkers-railway-launcher
  ]);
}
