{ system, config, lib, pkgs, pkgsStable, inputs, ... }:

{
  home.packages = [
    pkgs.steam
    pkgs.runelite
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
    pkgs.quickgui
    pkgs.nil
    pkgs.ani-cli
    pkgs.atlauncher
    pkgs.protontricks
    pkgs.protonup-qt
    pkgs.nodejs_22
    pkgs.qbittorrent
    pkgs.pinta
    pkgs.lutris
    pkgs.heroic
    pkgs.winetricks
    pkgs.ffmpeg
    pkgs.appimage-run
    pkgs.feh
    pkgs.obs-studio
    pkgs.kdePackages.ark
    pkgs.vscode
    pkgs.kcc
    pkgs.hakuneko
    pkgs.nicotine-plus
    pkgs.evolution
    pkgs.xonotic
    pkgs.rpcs3
    pkgs.pcsx2
    pkgs.xivlauncher
    pkgs.kdePackages.kdeconnect-kde
    pkgs.btop
    pkgs.neofetch
    pkgs.zsh-syntax-highlighting
    pkgs.alacritty
    pkgs.spotify
    pkgs.steam-run
    pkgs.flutter
    pkgs.localsend
    pkgs.firefox
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
    inputs.nixvim-config.packages.${system}.default
  ];
}
