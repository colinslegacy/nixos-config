{ config, lib, pkgs, ... }:

{
  home.file.".config/fuzzel/fuzzel.ini".text = ''
    [colors]
    background=282a36dd
    text=f8f8f2ff
    match=8be9fdff
    selection-match=8be9fdff
    selection=44475add
    selection-text=f8f8f2ff
    border=1565c0e6
  '';
}
