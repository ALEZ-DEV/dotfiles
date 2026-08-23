{ config, pkgs, lib, ... }:

{
  home.packages = lib.mkIf config.packages.dev.enable (with pkgs; [
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
    mitmproxy
    jetbrains.rider

    # neovim dependecies
    neovim
    gcc
    fzf
    ripgrep
  ]);

  programs.git = {
    enable = true;
    lfs.enable = true;
  };
}
