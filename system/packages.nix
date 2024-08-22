{ config, pkgs, lib, ... }:

{
  nixpkgs.config.allowUnfree = true;

  services.flatpak.enable = true;

  #nix-gaming caching 
  nix.settings = lib.mkIf config.packages.games.enable { 
    substituters = [
      "https://nix-gaming.cachix.org"
      "https://ezkea.cachix.org"
    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];
  };

  programs.steam.enable = true;
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries = with pkgs; [
    wineWowPackages.stagingFull
  ];

  environment.systemPackages = with pkgs; [
    vim
    networkmanager
    wget
    home-manager
    alacritty
    yazi
    git
    lshw
    polkit_gnome
    gparted
    (catppuccin-sddm.override {
      flavor = "macchiato";
      font = "Noto Sans";
      fontSize = "9";
      background = "${./sddm_wallpaper.jpg}";
    })
  ];
}
