{ config, lib, pkgs, hyprland, split-monitor-workspaces, hycov, hyprland-plugins, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      hycov.packages.${pkgs.system}.hycov
    ];

    extraConfig = ''
      ${builtins.readFile ./hyprland.conf}
    '';

    systemd = {
      enable = true;
      variables = ["-all"];
    };
  };

  home.file = {
    ".config/hypr/hyprpaper.conf".text = ''
      ${builtins.readFile ./hyprpaper.conf}
    '';
  };
}
