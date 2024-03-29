{ config, lib, pkgs, nixvim, nixvim-config, ... }:

{
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    withPython3 = true;
    extraPackages = (with pkgs ;[ tree-sitter nodejs ripgrep fd unzip ]);
  };
}
