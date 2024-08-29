{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    libiconv
    libnotify
    unzip
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-libav
  ];
}
