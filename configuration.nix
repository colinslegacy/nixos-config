# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  system,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./system/hardware-configuration.nix
    ./system/wm/kde.nix
    ./system/virtualization.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.consoleLogLevel = 0;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "amdgpu.sg_display=0"
    "amd_iommu=on"
    "quiet"
    "udev.log_level=3"
  ];
  boot.blacklistedKernelModules = [
    "nvidia"
    "nouveau"
  ];
  boot.kernelModules = [
    "vfio_virqfd"
    "vfio_pci"
    "vfio_iommu_type1"
    "vfio"
  ];
  boot.extraModprobeConfig = "options vfio-pci ids=10de:1b80,10de:10f0";
  boot.postBootCommands = ''
    DEVS="0000:05:00.0 0000:05:00.1"

    for DEV in $DEVS; do
      echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
    done
    modprobe -i vfio-pci
  '';

  networking.hostName = "legacy"; # Define your hostname.
  #networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.wireless.iwd.enable = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  #networking.networkmanager.wifi.backend = "iwd";

  # allow unfree
  nixpkgs.config.allowUnfree = true;
  # Set your time zone.
  time.timeZone = "America/New_York";

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
  services.xserver.autorun = true;
  #services.xserver.displayManager.startx.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver.xrandrHeads = [
    {
      output = "HDMI-A-1";
      monitorConfig = ''
        Option "DPMS" "false"
      '';
    }
    {
      output = "DP-1";
      primary = true;
      monitorConfig = ''
        Option "DPMS" "false"
      '';
    }
  ];

  hardware.graphics.enable32Bit = true;
  programs.dconf.enable = true;

  # shell
  environment.shells = with pkgs; [ zsh ];
  users.users.colin.shell = pkgs.zsh;
  programs.zsh.enable = true;

  xdg.portal = {
    enable = true;
    #wlr.enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  };

  # Configure keymap in X11
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  #ratbagd
  services.ratbagd.enable = true;

  # Enable sound with pipewire.
  #sound.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
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

  users.users.sarah = {
    isNormalUser = true;
    description = "sarah";
    extraGroups = [
      "networkmanager"
      "wheel"
      "libvirtd"
    ];
    packages = with pkgs; [ ];
  };

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    git
    libratbag
    killall
    vulkan-tools
    glxinfo
    wineWowPackages.stable
    kdePackages.kio
    kdePackages.kio-extras
    unzip
    ripgrep
    bc
    libsecret
    (callPackage ./system/dm/sddm/sddm-sugar-candy.nix { }).sddm-sugar-candy
  ];
  services.displayManager.sddm.theme = "sddm-sugar-candy";

  services.udev.packages = with pkgs; [
    zsa-udev-rules
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu-sans
    nerd-fonts.jetbrains-mono
    noto-fonts
  ];

  fileSystems."/mnt/nvme0n1p1" = {
    device = "/dev/nvme0n1p1";
    fsType = "ext4";
  };

  /*
    /qt = {
      enable = true;
      style = "kvantum";
      platformTheme = "kde6";
    };/
  */

  security.pam.services.swaylock = { };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:
  services.gvfs.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;
  services.blueman.enable = true;
  services.flatpak.enable = true;

  hardware.bluetooth.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
  #

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
    allowedUDPPortRanges = [
      {
        from = 1714;
        to = 1764;
      } # KDE Connect
    ];
  };

  networking.wireguard.enable = true;
  services.mullvad-vpn.enable = true;

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
}
