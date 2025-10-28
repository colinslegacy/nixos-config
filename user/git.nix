{
  config,
  lib,
  pkgs,
  ...
}:
{
  home.packages = [ pkgs.git ];
  programs.git.enable = true;
  programs.git.settings = {
    init.defaultBranch = "main";
    user.name = "colinslegacy";
    user.email = "colin@colinslegacy.com";
  };
}
