{ config, lib, pkgs, ... }:

{
  home.file = {
    ".config/waybar/config".text = ''
      ${builtins.readFile ./config}
    '';
  };
}
