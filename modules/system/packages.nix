{
  config,
  pkgs,
  system,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
    libratbag
    killall
    vulkan-tools
    mesa-demos
    wineWowPackages.stable
    unzip
    ripgrep
    bc
    libsecret
    xclicker
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.ubuntu-sans
    nerd-fonts.jetbrains-mono
    noto-fonts
  ];

  programs._1password.enable = true;
  programs._1password-gui = {
    enable = true;
    # Certain features, including CLI integration and system authentication support,
    # require enabling PolKit integration on some desktop environments (e.g. Plasma).
    polkitPolicyOwners = [ "colin" ];
  };

  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # Open ports in the firewall for Steam Local Network Game Transfers
  };

  programs.dconf.enable = true;
  programs.zsh.enable = true;
}
