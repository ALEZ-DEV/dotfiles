{ config, pkgs, lib, ... }:

{
  home.packages = lib.mkIf config.packages.dev.enable (with pkgs; [
    git
    gitnuro
    lazygit

    # neovim dependecies
    neovim
    gcc
    fzf
    ripgrep

    # language
    # Rust
    rustc
    cargo
  ]);
}
