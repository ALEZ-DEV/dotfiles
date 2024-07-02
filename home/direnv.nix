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

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "neovide.desktop" ];
    "application/pdf" = [ "floorp.desktop" ];
    "video/png" = [ "mpv.desktop" ];
    "video/jpg" = [ "mpv.desktop" ];
    "video/*" = [ "mpv.desktop" ];
    "inode/directory" = [ "org.gnome.Nautilus.desktop" ];
  };
}
