{ config, pkgs, ... }: 

{
  home.packages = with pkgs; [
    pkgs.adwaita-icon-theme
  ];

  gtk = {
    enable = true;
    theme.name = "adw-gtk3-dark";
    cursorTheme.name = "Bibata-Modern-Ice";
    iconTheme.name = "GruvboxPlus";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

}
