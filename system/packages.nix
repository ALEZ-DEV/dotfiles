{ config, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    vim
    networkmanager
    wget
    home-manager
    alacritty
    yazi
    git
    lshw
    (catppuccin-sddm.override {
      flavor = "macchiato";
      font = "Noto Sans";
      fontSize = "9";
      background = "/home/alez/Pictures/wallpaper/wallpaper.jpg";
    })
  ];
}
