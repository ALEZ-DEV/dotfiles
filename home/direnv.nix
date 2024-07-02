{ config, pkgs, ... }:

{
  programs.direnv = {
    enable = true;
    enableZshIntgregation = true;
  };
}
