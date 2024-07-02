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

  programs.fish.shellInit = "export PKG_CONFIG_PATH=${pkgs.openssl.dev}/lib/pkgconfig";
}
