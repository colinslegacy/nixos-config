{
  config,
  pkgs,
  system,
  ...
}:

{
  networking.wireless.iwd.enable = true;
  networking.networkmanager.enable = true;
  networking.wireguard.enable = true;
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
}
