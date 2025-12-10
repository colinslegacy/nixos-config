# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  config,
  pkgs,
  system,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ../../modules/system/common.nix
  ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.consoleLogLevel = 0;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [
    "amdgpu.sg_display=0"
    "amd_iommu=on"
    "quiet"
    "udev.log_level=3"
  ];
  boot.blacklistedKernelModules = [
    "nvidia"
    "nouveau"
  ];
  boot.kernelModules = [
    "vfio_virqfd"
    "vfio_pci"
    "vfio_iommu_type1"
    "vfio"
  ];
  boot.extraModprobeConfig = "options vfio-pci ids=10de:1b80,10de:10f0";
  boot.postBootCommands = ''
    DEVS="0000:05:00.0 0000:05:00.1"

    for DEV in $DEVS; do
      echo "vfio-pci" > /sys/bus/pci/devices/$DEV/driver_override
    done
    modprobe -i vfio-pci
  '';

  networking.hostName = "legacy"; # Define your hostname.

  fileSystems."/mnt/nvme0n1p1" = {
    device = "/dev/disk/by-uuid/ce7015b9-b9a9-4be6-9658-c48dc84c1541";
    fsType = "ext4";
  };

}
