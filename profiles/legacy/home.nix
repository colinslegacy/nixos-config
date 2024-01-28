{ config, pkgs, pkgsStable, nix-doom-emacs, nix-gaming, lib, username, name, email, browser, editor, term, allowUnfree, split-monitor-workspaces, ... }:

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
    ../../user/wm/hyprland/hyprland.nix
    ../../user/app/waybar/waybar.nix
    ../../user/app/fuzzel/fuzzel.nix
    ../../user/app/swaync/swaync.nix
    ../../user/app/swaylock/swaylock.nix
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
    pkgs.steam
    pkgs.runelite
    pkgs.eza
    pkgs.duf
    pkgs.cargo
    pkgs.nerdfonts
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
    pkgs.megasync
    pkgs.protontricks
    pkgs.protonup-qt
    pkgs.nodejs_21
    pkgs.qbittorrent
    pkgs.pinta
    pkgs.prismlauncher
    pkgs.lutris
    pkgs.heroic
    pkgs.winetricks
    pkgs.ffmpeg
    pkgs.appimage-run
    pkgs.swaynotificationcenter
    pkgs.fuzzel
    pkgs.grimblast
    pkgs.feh
    pkgs.gnome.nautilus
    pkgs.gnome.file-roller
    pkgs.obs-studio
    nix-gaming.packages.${pkgs.system}.star-citizen
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
      "text/html" = "librewolf.desktop";
      "x-scheme-handler/http" = "librewolf.desktop";
      "x-scheme-handler/https" = "librewolf.desktop";
      "x-scheme-handler/about" = "librewolf.desktop";
      "x-scheme-handler/unknown" = "librewolf.desktop";
    };
  };

  home.pointerCursor = 
    let 
      getFrom = url: hash: name: {
          gtk.enable = true;
          x11.enable = true;
          name = name;
          size = 48;
          package = 
            pkgs.runCommand "moveUp" {} ''
              mkdir -p $out/share/icons
              ln -s ${pkgs.fetchzip {
                url = url;
                hash = hash;
              }} $out/share/icons/${name}
          '';
        };
    in
      getFrom 
        "https://github.com/ful1e5/BreezeX_Cursor/releases/download/v2.0.0/BreezeX-Dark.tar.gz"
        "sha256-JPPVPU2nXqN4WFMsAcPEyt2M1n6iwkjytT9zF99YeO8="
        "BreezeX-Dark";

  programs.home-manager.enable = true;
}
