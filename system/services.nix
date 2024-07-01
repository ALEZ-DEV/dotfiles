{ config, pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      layout = "ch";
      xkbVariant = "fr";
    };

    displayManager.sddm = {
      enable = true;
      theme = "catppuccin-macchiato";
      package = pkgs.kdePackages.sddm;
    };

    gvfs.enable = true;
    blueman.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
    };
  };
}
