{ config, lib, pkgs, ... }:

{
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.displaymanager.plasma5.enable = true;
}
