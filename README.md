# Nixpkgs Bench Press

A collections of NixOS closures I use to benchmark the Nixpkgs performance.

## Usage

You can benchmark those dummy-yet-representative-or-at-least-I-hope machines by instantiating the top-level machines:

```
hyperfine "nix-instantiate nixos-closures/webserver.nix"
```
