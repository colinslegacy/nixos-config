{ config, lib, pkgs, pkgsStable, ... }:

{
  home.packages = [
    pkgs.element-desktop
    pkgs.keepassxc
    pkgs.btop
    pkgs.neofetch
    pkgs.vesktop
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
    #pkgs.ungoogled-chromium
    pkgs.vlc
    pkgs.trash-cli
    pkgs.kdePackages.kalk
    pkgs.swaylock-effects
    pkgs.kooha
    pkgs.wl-clipboard
    pkgs.nix-init
    pkgs.bitwarden
  ];
}
