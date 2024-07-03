{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    openssl
    pkg-config
    libiconv
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-libav
  ];

  environment.variables = {
    OPENSSL_DEV=pkgs.openssl.dev;
  };

  programs.fish.shellInit = "export PKG_CONFIG_PATH=${pkgs.openssl.dev}/lib/pkgconfig";
}
