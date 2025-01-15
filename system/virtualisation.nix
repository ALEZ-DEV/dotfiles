{ config, pkgs, ... }:

{
  programs.virt-manager.enable = true;

  virtualisation = {
    containers.enable = true;
    waydroid.enable = true;
    lxd.enable = true;
    spiceUSBRedirection.enable = true;
    docker.enable = true;
    libvirtd.enable = true;
  };

  users = {
    users.alez.extraGroups = [ "docker" ];
    groups.libvirtd.members = ["alez"];
  };

  environment.systemPackages = with pkgs; [
    quickemu
  ];
}
