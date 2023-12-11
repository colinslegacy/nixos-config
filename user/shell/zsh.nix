{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    shellAliases = {
      ls = "eza";
      cp = "cp -i";
      df = "duf";
      weather = "curl wttr.in/purcellville";
      rm = "trash --trash-dir /home/colin/.trash";
      restore = "trash-restore --trash-dir /home/colin/.trash";
      tlist = "trash-list --trash-dir /home/colin/.trash";
      tempty = "trash-empty --trash-dir /home/colin/.trash";
    };
    initExtra = ''
      unset HISTFILE
      autoload -U colors && colors
      PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b ";
      autoload -U compinit
      zstyle ':completion:*' menu select
      zmodload zsh/complist
      compinit -D
      _comp_options+=(globdots)		# Include hidden files.
      bindkey -v
    '';
  };
}
