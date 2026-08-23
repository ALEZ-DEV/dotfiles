{ config, pkgs, ... }:

{
  imports = [
    ./bluetooth.nix
    ./desktop.nix
    ./fonts.nix
    ./hardware.nix
    ./network.nix
    ./options.nix
    ./packages.nix
    ./services.nix
    ./users.nix
    ./virtualisation.nix
  ];

  boot = {
    plymouth = {
      enable = true;
      theme = "cuts";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "cuts" ];
        })
      ];
    };

    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    loader.timeout = 15;
    loader.systemd-boot.enable = false;

    loader.grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;

      minegrub-theme = {
        enable = true;
        splash = "100% Flakes!";
        background = "background_options/1.8  - [Classic Minecraft].png";
        boot-options-count = 4;
      };
    };

    loader.efi.canTouchEfiVariables = true;
  };

  #time.timeZone = "Europe/Zurich";
  time.timeZone = "Asia/Tokyo";

  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "fr_CH";

  security.rtkit.enable = true;

  nix.settings.experimental-features = ["nix-command" "flakes"];

  system.stateVersion = "24.05";
}
