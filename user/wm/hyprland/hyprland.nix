{ config, lib, pkgs, hyprland, split-monitor-workspaces, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
    ];

    extraConfig = ''
      ${builtins.readFile ./hyprland.conf}
    '';

    systemd = {
      enable = true;
      variables = ["-all"];
    };
  };
}
