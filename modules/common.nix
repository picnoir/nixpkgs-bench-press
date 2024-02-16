{ config, lib, pkgs, ... }:

{
  boot.initrd.availableKernelModules = [ "ata_piix" "uhci_hcd" "virtio_pci" "sr_mod" "virtio_blk" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/000000000000000000000000000000000000";
      fsType = "ext4";
    };
  swapDevices =
    [ { device = "/dev/disk/by-uuid/000000000000000000000000000000000000"; }
    ];
  nix.settings.max-jobs = lib.mkDefault 4;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  system.stateVersion = "24.05";
}
