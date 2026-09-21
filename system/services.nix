{ config, pkgs, lib, ... }:

{
  security.polkit.enable = true;

  services = {
    xserver = {
      enable = true;
      xkb = {
        layout = "us";
      };
    };

    displayManager = {
      sddm = {
        enable = true;
        wayland.enable = true;
        theme = "catppuccin-macchiato";
        package = pkgs.kdePackages.sddm;
      };
    };

    gvfs.enable = true;
    blueman.enable = true;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;

      extraConfig.pipewire."91-null-sinks" = {
        "context.objects" = [
          {
            factory = "adapter";
            args = {
              "factory.name" = "support.null-audio-sink";
              "node.name" = "Game-Share";
              "node.description" = "GameShare";
              "media.class" = "Audio/Sink";
              "audio.position" = "FL,FR";
            };
          }
        ];
      };
    };

    actkbd = {
      enable = true;
    };

    # printer related
    printing.enable = true;
    avahi = {
      enable = true;
      nssmdns4 = true;
      openFirewall = true;
    };
  };
}
