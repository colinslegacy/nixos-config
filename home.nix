{ config, pkgs, system, pkgsStable, lib, username, browser, editor, term, inputs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/"+username;

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./user/shell/zsh.nix
    ./user/app/git/git.nix
    ./user/app/virtualization/virtualization.nix
    ./defaultPackages.nix
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
    pkgs.steam
    pkgsStable.runelite
    pkgs.zoom-us
    pkgs.eza
    pkgs.duf
    pkgs.cargo
    pkgs.gcc
    pkgs.gnumake
    pkgs.python311Full
    pkgs.gnupg
    pkgs.telegram-desktop
    pkgs.scrcpy
    pkgs.piper
    pkgs.fzf
    pkgs.quickemu
    pkgs.nil
    pkgs.ani-cli
    pkgs.atlauncher
    pkgs.protontricks
    pkgs.protonup-qt
    pkgs.nodejs_22
    pkgs.qbittorrent
    pkgs.pinta
    pkgs.prismlauncher
    pkgs.lutris
    pkgs.heroic
    pkgs.winetricks
    pkgs.ffmpeg
    pkgs.appimage-run
    pkgs.rofi-wayland
    pkgs.grimblast
    pkgs.feh
    pkgs.obs-studio
    pkgs.pcmanfm
    pkgs.kdePackages.ark
    pkgs.vscode
    pkgs.kcc
    pkgs.hakuneko
    pkgs.nicotine-plus
    pkgs.evolution
    pkgs.xonotic
    #pkgs.rpcs3
    #pkgs.pcsx2
    pkgs.xivlauncher
    pkgs.bitwarden-cli
    pkgs.bitwarden-menu
    pkgs.kdePackages.kdeconnect-kde
    inputs.nixvim-config.packages.${system}.default
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

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "text/html" = "floorp.desktop";
      "x-scheme-handler/http" = "floorp.desktop";
      "x-scheme-handler/https" = "floorp.desktop";
      "x-scheme-handler/about" = "floorp.desktop";
      "x-scheme-handler/unknown" = "floorp.desktop";
      "x-scheme-handler/mailto" = "userapp-Evolution-COQOL2.desktop";
    };
  };


  xdg.desktopEntries = {
    atlauncher = {
      name = "ATLauncher";
      genericName = "Minecraft Launcher";
      exec = "steam-run atlauncher";
      terminal = false;
      icon = "atlauncher";
      type = "Application";
      categories = [ "Game" ];
    };
  };

  programs.home-manager.enable = true;
}
