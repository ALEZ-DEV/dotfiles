{ config, pkgs, ... }:

{
  hardware = {
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };

    steam-hardware.enable = true;
  };
}
