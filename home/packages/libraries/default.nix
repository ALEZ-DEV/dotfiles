{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    openssl
    pkg-config
    libiconv
    libnotify
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-libav
  ];

  home.sessionsvariables = {
    OPENSSL_DIR="${pkgs.openssl.dev}/lib";
  };
}
