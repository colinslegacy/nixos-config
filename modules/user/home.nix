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
      (_: prev: {
        openldap = prev.openldap.overrideAttrs {
          doCheck = !prev.stdenv.hostPlatform.isi686;
        };
      })
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
      "application/zip" = "file-roller.desktop";
      "application/x-7z-compressed" = "file-roller.desktop";
      "application/x-tar" = "file-roller.desktop";
      "application/x-compressed-tar" = "file-roller.desktop";
      "application/gzip" = "file-roller.desktop";
      "application/x-bzip2" = "file-roller.desktop";
      "application/x-bzip-compressed-tar" = "file-roller.desktop";
      "application/x-xz" = "file-roller.desktop";
      "application/x-xz-compressed-tar" = "file-roller.desktop";
      "application/vnd.rar" = "file-roller.desktop";
      "application/x-rar" = "file-roller.desktop";
      "application/x-rar-compressed" = "file-roller.desktop";
      "application/zstd" = "file-roller.desktop";
    };
  };

  programs.home-manager.enable = true;
}
