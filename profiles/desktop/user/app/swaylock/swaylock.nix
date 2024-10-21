{ config, lib, pkgs, ... }:

{
  home.file.".config/swaylock/config".text = ''
    ${builtins.readFile ./config}
  '';
}
