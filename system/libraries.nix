{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    openssl
    pkg-config
    libiconv
  ];

  environment.variables = {
    OPENSSL_DEV=pkgs.openssl.dev;
  };
}
