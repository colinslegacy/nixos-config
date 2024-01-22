{ config, lib, pkgs, ... }:

{
  home.file = {
    ".config/alacritty/alacritty.toml".text = ''
      [font]
      size = 10.0
    '';
  };
}
