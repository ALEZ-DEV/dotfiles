{ config, pkgs, ... }:

{
  virtualisation = {
    containers.enable = true;
    waydroid.enable = true;
    lxd.enable = true;
  };

  environment.systemPackages = with pkgs; [
    quickemu
  ];
}
