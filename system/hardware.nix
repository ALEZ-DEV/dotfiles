{ config, pkgs, ... }:

{
  hardware = {
    opentabletdriver = {
      enable = true;
      daemon.enable = true;
    };

    steam-hardware.enable = true;

    keyboard.qmk.enable = true;
  };

  environment.systemPackages = with pkgs; [
    opentabletdriver
    via
    avrdude
    pico-sdk
  ];
}
