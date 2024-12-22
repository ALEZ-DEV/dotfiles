{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "ALEZ-DEV";
    userEmail = "raidersfocus@gmail.com";
  };

  #programs.zsh = {
  #  enable = true;
  #  enableCompletion = true;
  #  autosuggestion.enable = true;
  #  syntaxHighlighting.enable = true;

  #  history = {
  #    size = 10000;
  #    path = "${config.xdg.dataHome}/zsh/history";
  #  };
  #};

  programs.bash = {
    enable = true;
    initExtra = ''
      . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
    '';
  };

  home = {
    sessionVariables = {
      EDITOR = "nvim";
      GST_PLUGIN_PATH = "${pkgs.gst_all_1.gst-libav}/lib:${pkgs.gst_all_1.gst-vaapi}/lib:${pkgs.gst_all_1.gst-plugins-good}/lib:${pkgs.gst_all_1.gst-plugins-bad}/lib:${pkgs.gst_all_1.gst-plugins-good}/lib:${pkgs.gst_all_1.gst-plugins-ugly}/lib";
    };

    sessionPath = [
      "${config.user.home}/.cargo/bin"
    ];

    shellAliases = {
      xctrl = ''SDL_GAMECONTROLLERCONFIG= SDL_JOYSTICK_HIDAPI=0 exec "$@"'';
      "prime-run" = ''__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia __VK_LAYER_NV_optimus=NVIDIA_only exec "$@"'';
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "neovide.desktop" ];
    "application/pdf" = [ "floorp.desktop" ];
    "video/png" = [ "mpv.desktop" ];
    "video/jpg" = [ "mpv.desktop" ];
    "video/*" = [ "mpv.desktop" ];
    "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
    "image/png" = [ "org.gnome.eog.desktop" ];
    "image/jpeg" = [ "org.gnome.eog.desktop" ];
    "image/gif" = [ "org.gnome.eog.desktop" ];
    "image/bmp" = [ "org.gnome.eog.desktop" ];
    "image/tiff" = [ "org.gnome.eog.desktop" ];
    "image/webp" = [ "org.gnome.eog.desktop" ];
    "image/svg+xml" = [ "org.gnome.eog.desktop" ];
    "image/avif" = [ "org.gnome.eog.desktop" ];
    "image/x-raw" = [ "org.gnome.eog.desktop" ];
    "image/x-tga" = [ "org.gnome.eog.desktop" ];
    "image/x-exr" = [ "org.gnome.eog.desktop" ];
    "image/vnd.radiance" = [ "org.gnome.eog.desktop" ];
  };
}
