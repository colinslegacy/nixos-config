{ config, pkgs, pkgsStable, nix-doom-emacs, nix-gaming, lib, username, name, email, allowUnfree, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = username;
  home.homeDirectory = "/home/"+username;

  nixpkgs.config.allowUnfree = allowUnfree;

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = ["qemu:///system"];
      uris = ["qemu:///system"];
    };
  };

  imports = [
    nix-doom-emacs.hmModule
    ../../user/shell/zsh.nix
    ../../user/app/neovim/neovim.nix
    ../../user/app/doom-emacs/doom-emacs.nix
    ../../user/app/git/git.nix
  ];

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    pkgs.element-desktop
    pkgs.keepassxc
    pkgs.neofetch
    pkgs.btop
    pkgs.discord
    pkgs.steam
    pkgs.runelite
    pkgs.zsh-syntax-highlighting
    pkgs.eza
    pkgs.duf
    pkgs.cargo
    pkgs.nerdfonts
    pkgs.gcc
    pkgs.gnumake
    pkgs.alacritty
    pkgs.spotify
    pkgs.python311Full
    pkgs.steam-run
    pkgs.gnupg
    pkgs.telegram-desktop
    pkgs.scrcpy
    pkgs.piper
    pkgs.localsend
    pkgs.fzf
    pkgs.quickemu
    pkgs.nil
    pkgs.ani-cli
    pkgs.megasync
    pkgs.protontricks
    pkgs.protonup-qt
    pkgsStable.librewolf
    pkgs.firefox
    pkgs.kate
    pkgs.thunderbird
    pkgs.ungoogled-chromium
    pkgs.vlc
    pkgs.nodejs_21
    pkgs.trash-cli
    pkgs.qbittorrent
    pkgs.pinta
    pkgs.libsForQt5.kalk
    nix-gaming.packages.${pkgs.system}.star-citizen # installs a package
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    #(pkgs.writeShellScriptBin "my-hello" ''
    #  echo "Hello, ${config.home.username}!"
    #'')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
    #

    ".config/alacritty/alacritty.yml".text = ''
      font:
        size: 10.0
    '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/colin/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    EDITOR = "emacsclient";
  };


  services.emacs = {
    startWithUserSession = "graphical";
    enable = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
