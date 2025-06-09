{ config, lib, pkgs, ... }:

{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.userName = "colinslegacy";
  programs.git.userEmail = "colin@colinslegacy.com";
  programs.git.extraConfig = {
    init.defaultBranch = "main";
  };
}
