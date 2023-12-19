{ config, lib, pkgs, ... }:

{
  programs.doom-emacs = {
    enable = true;
    doomPrivateDir = ./.;
    emacsPackage = pkgs.emacs28;
  };
}
