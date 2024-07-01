{ config, pkgs, ... }:

{
  users.users.alez = {
    isNormalUser = true;
    description = "alez";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
