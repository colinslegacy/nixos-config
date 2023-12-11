{ config, lib, pkgs, pkgsStable, ... }:

{
  home.packages = [
    pkgs.element-desktop
    pkgs.keepassxc
    pkgs.btop
    pkgs.neofetch
    pkgs.discord
    pkgs.zsh-syntax-highlighting
    pkgs.alacritty
    pkgs.spotify
    pkgs.steam-run
    pkgs.localsend
    pkgsStable.librewolf
    pkgs.firefox
    pkgs.kate
    pkgs.thunderbird
    pkgs.ungoogled-chromium
    pkgs.vlc
    pkgs.trash-cli
    pkgs.libsForQt5.kalk
  ];
}
