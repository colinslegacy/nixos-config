{
  config,
  pkgs,
  system,
  pkgsStable,
  lib,
  username,
  browser,
  editor,
  term,
  inputs,
  ...
}:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/" + username;

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./user/shell/zsh.nix
    ./user/git.nix
    ./user/virtualization.nix
    ./packages.nix
    #./user/nixcord.nix
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
    EDITOR = editor;
    BROWSER = browser;
    TERM = term;
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

  home.pointerCursor =
    let
      getFrom = url: hash: name: {
        gtk.enable = true;
        x11.enable = true;
        name = name;
        size = 24;
        package = pkgs.runCommand "moveUp" { } ''
          mkdir -p $out/share/icons
          ln -s ${
            pkgs.fetchzip {
              url = url;
              hash = hash;
            }
          } $out/share/icons/${name}
        '';
      };
    in
    getFrom "https://github.com/ful1e5/BreezeX_Cursor/releases/download/v2.0.0/BreezeX-Dark.tar.gz"
      "sha256-JPPVPU2nXqN4WFMsAcPEyt2M1n6iwkjytT9zF99YeO8="
      "BreezeX-Dark";

  programs.home-manager.enable = true;
}
