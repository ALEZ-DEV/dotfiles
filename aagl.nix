{ config, pkgs, ... }:

let
  aagl = import (builtins.fetchTarball "https://github.com/ezKEa/aagl-gtk-on-nix/archive/main.tar.gz");
in 
{
  home.packages = [
    aagl.wavey-launcher
  ];
}
