{
  config,
  lib,
  pkgs,
  ...
}:

{
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.qemu.ovmf.enable = true;
  programs.virt-manager.enable = true;
}
