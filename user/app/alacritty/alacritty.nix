{ config, lib, pkgs, ... }:

{
  home.file = {
    ".config/alacritty/alacritty.yml".text = ''
      font:
        size: 10.0
    '';
  };
}
