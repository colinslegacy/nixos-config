{ config, lib, pkgs, ... }:

{
  home.file = {
    ".config/swaync/config.json".text = ''
      ${builtins.readFile ./config.json}
    '';
    ".config/swaync/style.css".text = ''
      ${builtins.readFile ./style.css}
    '';
  };
}
