{ config, pkgs, ... }:

{
  virtualisation = {
    containers.enable = true;
    waydroid.enable = true;
    lxd.enable = true;
    spiceUSBRedirection.enable = true;
  };

  environment.systemPackages = with pkgs; [
    quickemu
    quickgui
    config.nur.repos.ataraxiasjel.waydroid-script
  ];
}
