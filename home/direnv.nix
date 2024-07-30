{ config, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "ALEZ-DEV";
    userEmail = "raidersfocus@gmail.com";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
  };

  home = {
    sessionVariables = {
      EDITOR = "nvim";
    };
    sessionPath = [
      "${config.user.home}/.cargo/bin"
    ];
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
