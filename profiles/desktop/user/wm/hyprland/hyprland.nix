{ config, lib, pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    plugins = [
      inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
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
