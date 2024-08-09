{ config, pkgs, lib, inputs, programs, ... }:

let
  nix-gaming = inputs.nix-gaming.packages.${pkgs.system};
  isEnable = config.packages.games.enable;
in 
{
  imports = [
    ./aagl.nix
  ];

  home.packages = lib.mkIf isEnable (with pkgs; [
    waydroid
    bottles
    mangohud
    gamemode
    protonup-qt
    lutris
    winetricks
    protontricks
    wineWowPackages.staging
    nix-gaming.osu-lazer-bin
    nix-gaming.northstar-proton
    prismlauncher
    glfw-wayland-minecraft
  ]);

  nixpkgs.config.allowBroken = isEnable; # who broke minecraft ???

  # some desktop entries
  xdg.desktopEntries = lib.mkIf isEnable {
    "nikke" = {
      name = "Nikke: Goddess of Victory";
      genericName = "nikke";
      exec = "sh ${config.user.home}/Games/Nikke/start.sh";
      terminal = false;
      categories = [ "Application" ];
    };
  };
}
