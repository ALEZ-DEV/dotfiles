{ config, pkgs, ... }:

{
  hardware = {
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };

    steam-hardware.enable = true;
  };

  environment.systemPackages = with pkgs; [
    opentabletdriver
  ];
}
