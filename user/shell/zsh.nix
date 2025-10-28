{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = [ pkgs.zsh-powerlevel10k ];
  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    plugins = [
      {
        name = "powerlevel10k-config";
        src = lib.cleanSource ./.;
        file = "p10k.zsh";
      }
    ];
    shellAliases = {
      vim = "nvim";
      vi = "nvim";
      ls = "eza";
      cp = "cp -i";
      df = "duf";
      weather = "curl wttr.in/purcellville";
      rm = "trash --trash-dir /home/colin/.trash";
      restore = "trash-restore --trash-dir /home/colin/.trash";
      tlist = "trash-list --trash-dir /home/colin/.trash";
      tempty = "trash-empty --trash-dir /home/colin/.trash";
      repairstore = "nix-store --verify --check-contents --repair";
    };
    initContent = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
      unset HISTFILE
      autoload -U colors && colors
      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit -D
      _comp_options+=(globdots)		# Include hidden files.
      bindkey -v
    '';
  };
}
