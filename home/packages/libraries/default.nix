{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    libiconv
    libnotify
    unzip
    gst_all_1.gstreamer
    gst_all_1.gst-vaapi
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
  ];

  nixpkgs.config.allowUnfree = true;
}
