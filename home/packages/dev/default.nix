{ config, pkgs, lib, ... }:

{
  home.packages = lib.mkIf config.packages.dev.enable (with pkgs; [
    git
    gitnuro
    lazygit
    podman
    distrobox
    jq
    ghex
    sqlitestudio
    blender
    dbeaver-bin
    chromium
    ollama
    ghidra
    bruno
    bbe
    usbimager

    # neovim dependecies
    neovim
    gcc
    fzf
    ripgrep
  ]);
}
