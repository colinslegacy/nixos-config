{ config, pkgs, pkgsStable, nix-doom-emacs, nix-gaming, lib, username, name, email, browser, editor, term, allowUnfree, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/"+username;

  nixpkgs.config.allowUnfree = allowUnfree;

  imports = [
    nix-doom-emacs.hmModule
    ../../user/shell/zsh.nix
    ../../user/app/neovim/neovim.nix
    ../../user/app/doom-emacs/doom-emacs.nix
    ../../user/app/git/git.nix
    ../../user/app/alacritty/alacritty.nix
    ../../user/app/virtualization/virtualization.nix
    ../defaultPackages.nix
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.eza
    pkgs.duf
    pkgs.cargo
    pkgs.gcc
    pkgs.gnumake
    pkgs.python311Full
    pkgs.gnupg
    pkgs.telegram-desktop
    pkgs.scrcpy
    pkgs.fzf
    pkgs.quickemu
    pkgs.ani-cli
    pkgs.megasync
    pkgs.nodejs_21
    pkgs.qbittorrent
    pkgs.pinta
  ];

  home.sessionVariables = {
    EDITOR = editor;
    BROWSER = browser;
    TERM = term;
  };


  services.emacs = {
    startWithUserSession = "graphical";
    enable = true;
  };

  programs.home-manager.enable = true;
}
