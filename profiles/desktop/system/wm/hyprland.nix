{ inputs, config, lib, pkgs, ... }:

{
  #programs.hyprland.enable = true;
  services.xserver.displayManager.lightdm.enable = false;
  services.displayManager.sddm.enable = true;
  programs.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };
  environment.systemPackages = [
    pkgs.hyprpaper
  ];
}
