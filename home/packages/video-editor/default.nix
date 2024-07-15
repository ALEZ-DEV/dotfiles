{ config, pkgs, lib, ... }:

{
  home.packages = lib.mkIf config.packages.video-editor.enable (with pkgs; [
    davinci-resolve
  ]);
}
