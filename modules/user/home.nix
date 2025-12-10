{
  config,
  pkgs,
  system,
  pkgsStable,
  lib,
  inputs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "colin";
  home.homeDirectory = "/home/colin";

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./shell/zsh.nix
    ./git.nix
    ./virtualization.nix
    ./packages.nix
    ./nixcord.nix
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.sessionVariables = {
    EDITOR = "zeditor";
    BROWSER = "firefox";
    TERM = "yakuake";
  };

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };

  programs.home-manager.enable = true;
}
