{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./desktop.nix
    ./fonts.nix
    ./libraries.nix
    ./network.nix
    ./options.nix
    ./packages.nix
    ./services.nix
    ./users.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Zurich";

  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "fr_CH";

  security.rtkit.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "24.05";
}
