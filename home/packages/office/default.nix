{ config, pkgs, lib, inputs, ... }:

{
  home.packages = lib.mkIf config.packages.office.enable (with pkgs; [
    goofcord
    spotify
    spotdl
    gimp
    blender
    #obsidian # don't work because of nvidia, so I use the flatpak one for the time being, https://discourse.nixos.org/t/drm-kernel-driver-nvidia-drm-in-use-nvk-requires-nouveau/42222/16
    appflowy
    qalculate-gtk
    #cura using the flatpak for now because some python packages to build this derivation, https://github.com/NixOS/nixpkgs/issues/325896
  ]);
}
