{ config, pkgs, ... }:

{
  fonts.packages = with pkgs; [
    pkgs.nerd-fonts.fira-code
  ];
}
