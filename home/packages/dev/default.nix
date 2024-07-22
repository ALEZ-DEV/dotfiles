{ config, pkgs, lib, ... }:

{
  home.packages = lib.mkIf config.packages.dev.enable (with pkgs; [
    git
    gitnuro
    lazygit
    podman
    distrobox
    jq

    # neovim dependecies
    neovim
    gcc
    fzf
    ripgrep

    # language
    # Rust
    rustc
    cargo
    just
    rust-analyzer
  ]);
}
