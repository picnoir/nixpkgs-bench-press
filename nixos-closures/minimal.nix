{ pkgs ? import <nixpkgs> {}}:

(pkgs.nixos (
  {lib, pkgs, ... }: {
    imports = [ ../modules/common.nix ];
  }
)).toplevel
