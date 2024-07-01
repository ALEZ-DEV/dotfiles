{ config, pkgs, ... }:

{
  networking.hostName = "nixos";

  networking.networkmanager.enable = true;
  networking.extraHosts =
  ''
    127.0.0.1 pc.crashsight.wetest.net
  ''; 
}
