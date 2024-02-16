{ pkgs ? import <nixpkgs> {}}:

(pkgs.nixos (
  {lib, pkgs, ... }: {
    imports = [ ../modules/common.nix ];
    services.xserver.enable = true;
    services.xserver.displayManager = {
      sddm.enable = true;
      defaultSession = "plasmawayland";
    };
    services.xserver.desktopManager.plasma5.enable = true;
  }
)).toplevel
