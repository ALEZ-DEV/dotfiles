{ config, pkgs, lib, ... }:

let
  aagl = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/refs/heads/zzz.zip");
in 
{
  home.packages = (lib.mkIf config.packages.games.enable [
    aagl.wavey-launcher
    aagl.honkers-railway-launcher
    aagl.sleepy-launcher
  ]);
}
