{
  config,
  pkgs,
  system,
  ...
}:

{
  imports = [
    ./kde.nix
    ./virtualization.nix
    ./networking.nix
    ./services.nix
    ./packages.nix
  ];

  nixpkgs.config.allowUnfree = true;
  time.timeZone = "America/New_York";

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

  hardware.graphics.enable32Bit = true;
  hardware.bluetooth.enable = true;

  environment.shells = with pkgs; [ zsh ];
  users.users.colin.shell = pkgs.zsh;

  xdg.portal = {
    enable = true;
    #wlr.enable = true;
    extraPortals = with pkgs; [ kdePackages.xdg-desktop-portal-kde ];
  };

  users.users.colin = {
    isNormalUser = true;
    description = "colin";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
    packages = with pkgs; [ ];
  };

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        .firefox-wrapped
        firefox
        .zen-beta-wrapped
        zen
      '';
      mode = "0755";
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?

  nix.settings.trusted-users = [
    "root"
    "colin"
  ];
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };
}
