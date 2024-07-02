{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    inputs.nix-flatpak.nixosmodules.nix-flatpak
  ];

  home.packages = lib.mkIf config.packages.office.enable (with pkgs; [
    goofcord
    spotify
    #obsidian # don't work because of nvidia, so I use the flatpak one for the time being, https://discourse.nixos.org/t/drm-kernel-driver-nvidia-drm-in-use-nvk-requires-nouveau/42222/16
  ]);
}
