{ config, pkgs, ... }:

{
  security.polkit.enable = true;

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
      };
    };

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
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

    actkbd = {
      enable = true;
    };
  };
}
