{ config, pkgs, ... }:

{
  virtualisation = {
    containers.enable = true;
    waydroid.enable = true;
    lxd.enable = true;
    spiceUSBRedirection.enable = true;
    docker.enable = true;
  };

  users.users.alez.extraGroups = [ "docker" ];

  environment.systemPackages = with pkgs; [
    quickemu
    config.nur.repos.ataraxiasjel.waydroid-script
  ];
}
