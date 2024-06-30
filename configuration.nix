# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  hostName = builtins.getEnv "HOST";
  hardwareConfigPath = ./hosts/${hostName}/hardware-configuration.nix;
in
{
  imports =
    [
      hardwareConfigPath
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  hardware= {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
	  Enable = "Source,Sink,Media,Socket";
	  Experimental = true;
	};
      };
    };
    #pulseaudio = {
    #  enable = true;
    #  package = pkgs.pulseaudioFull;
    #};
  };

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    layout = "ch";
    xkbVariant = "fr";
  };

  services.displayManager.sddm = {
    enable = true;
    theme = "catppuccin-macchiato";
    package = pkgs.kdePackages.sddm;
  };

  services = {
    gvfs.enable = true;
    blueman.enable = true;
  };

  # Configure console keymap
  console.keyMap = "fr_CH";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.alez = {
    isNormalUser = true;
    description = "alez";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

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

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.sessionVariables = {
    # if your cursor become invisible / enable putting "1"
    WLR_NO_HARDWARE_CURSORS = "0";
    # Hint eletron apps to use wayland / enable putting "1"
    NIXOS_OZONE_WL = "0";
  };

  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = false;
  };

  nix.settings.experimental-features = ["nix-command" "flakes"];

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim
    networkmanager
    wget
    home-manager
    alacritty
    yazi
    git
    waybar
    (catppuccin-sddm.override {
      flavor = "macchiato";
      font = "Noto Sans";
      fontSize = "9";
      #background = "some path";
      loginBackground = true;
    })
  ];

  fonts.fonts= with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];  

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
