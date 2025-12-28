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

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
    config = {
      allowUnfree = true;
    };
  };

  imports = [
    ./shell/zsh.nix
    ./git.nix
    ./virtualization.nix
    ./packages.nix
    ./nixcord.nix
    ./zen-browser.nix
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
    BROWSER = "zen";
    TERM = "yakuake";
  };

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = "zen.desktop";
      "x-scheme-handler/http" = "zen-beta.desktop";
      "x-scheme-handler/https" = "zen-beta.desktop";
      "x-scheme-handler/about" = "zen-beta.desktop";
      "x-scheme-handler/unknown" = "zen-beta.desktop";
    };
  };

  programs.home-manager.enable = true;
}
