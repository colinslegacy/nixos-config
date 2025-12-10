{
  config,
  lib,
  pkgs,
  ...
}:

{
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  environment.systemPackages = with pkgs; [
    kdePackages.yakuake
    kdePackages.kjournald
    kdePackages.kmail
    kdePackages.kmail-account-wizard
    kdePackages.kalk
    kdePackages.kate
    kdePackages.kdeconnect-kde
    kdePackages.ark
    kdePackages.kio
    kdePackages.kio-extras
    kdePackages.filelight
    kdePackages.partitionmanager
    kdePackages.ksystemlog
    kdePackages.isoimagewriter
    kdePackages.kgpg
    kdePackages.kmag
    kdePackages.kweather
    kdePackages.marble
  ];
}
