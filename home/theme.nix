{ pkgs, ... }: 

{
  home.packages = with pkgs; [
    adwaita-icon-theme
    morewaita-icon-theme
    adw-gtk3
    adwaita-qt
    bibata-cursors
  ];

  gtk = {
    enable = true;
    theme.name = "adw-gtk3-dark";
    cursorTheme.name = "Bibata-Modern-Classic";
    iconTheme = {
      name = "MoreWaita";
    };
    gtk4.theme = null;
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "gtk3";
    style = {
      name = "adwaita-dark";
      package = pkgs.adwaita-qt;
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Classic";
    package = pkgs.bibata-cursors;
  };
}
