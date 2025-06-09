{ config, lib, pkgs, pkgsStable, ... }:

{
  home.packages = [
    pkgs.btop
    pkgs.neofetch
    pkgs.discord
    pkgs.zsh-syntax-highlighting
    pkgs.alacritty
    pkgs.spotify
    pkgs.steam-run
    pkgs.flutter
    pkgsStable.localsend
    pkgs.firefox
    pkgs.floorp
    pkgs.kdePackages.kate
    pkgs.thunderbird
    pkgs.chromium
    pkgs.vlc
    pkgs.trash-cli
    pkgs.kdePackages.kalk
    pkgs.wl-clipboard
    pkgs.nix-init
    pkgs.bitwarden
    pkgs.kdePackages.yakuake
    pkgs.kdePackages.kjournald
  ];
}
