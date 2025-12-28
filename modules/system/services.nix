{
  config,
  pkgs,
  system,
  ...
}:

{
  services.xserver.enable = true;
  services.xserver.autorun = true;
  services.xserver.videoDrivers = [ "amdgpu" ];
  services.xserver = {
    xkb = {
      layout = "us";
      variant = "";
    };
  };
  services.printing.enable = true;
  services.ratbagd.enable = true;
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  services.gvfs.enable = true;
  services.avahi.enable = true;
  services.avahi.nssmdns4 = true;
  services.avahi.openFirewall = true;
  services.blueman.enable = true;
  services.flatpak.enable = true;
  services.mullvad-vpn.enable = true;
  services.tailscale = {
    enable = true;
    useRoutingFeatures = "client";
  };
  services.udev.packages = with pkgs; [
    zsa-udev-rules
  ];
}
