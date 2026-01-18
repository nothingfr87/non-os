{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;

  networking.hostName = "null-pc";


  # Enable networking
  networking.networkmanager.enable = true;

  # Set time zone.
  time.timeZone = "Africa/Cairo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable DBUS and Policy Kit
  services.dbus.enable = true;
  security.polkit.enable = true;


  # Enable the Cinnamon Desktop Environment.
  services.xserver.displayManager.lightdm.enable = true;
  services.xserver.desktopManager.cinnamon.enable = true;


  # Enable i3 Window Manager
  services.xserver.windowManager.i3 = {
    enable = true; 
    extraPackages = with pkgs; [
      dmenu
      i3status
    ];
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable sound with pipewire.
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  users.users.nothing = {
    isNormalUser = true;
    description = "nothing";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      vscodium
      gimp
      obsidian
    ];
  };

  # Enable Flakes
  nix.settings.experimental-features = "nix-command flakes"; 

  # Install firefox.
  programs.firefox.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # Other
    fastfetch
    bat

    # Basic Packages
    wget

    # GCC & GDB
    gcc
    libgcc
    gdb

    # Git
    git

    # Coding
    neovim
    nixd

    # Desktop Utilties
    xclip
    wl-clipboard
    alacritty
    feh
    picom
  ];

  environment.variables = {
    SUDO_EDITOR="nvim";
    EDITOR="nvim";
    VISUAL="nvim";
  };

  # Font Packages
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-color-emoji
    nerd-fonts.jetbrains-mono
  ];
  system.stateVersion = "25.11"; 
}
