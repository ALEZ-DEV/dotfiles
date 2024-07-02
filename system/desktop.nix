{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-gtk
      ];
      gtkUsePortal = true;
    };
  };

  environment.sessionVariables = {
    # if your cursor become invisible / enable putting "1"
    WLR_NO_HARDWARE_CURSORS = "0";
    # Hint eletron apps to use wayland / enable putting "1"
    NIXOS_OZONE_WL = "1";
  };
}
