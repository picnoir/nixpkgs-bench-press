{ pkgs ? import <nixpkgs> {}}:

(pkgs.nixos (
  {lib, pkgs, ... }: {
    imports = [ ../modules/common.nix ];
    services.openssh.enable = true;
    security.acme = {
      defaults.email = "emaili@emailo.org";
      acceptTerms = true;
    };
   services.nginx = {
     enable = true;
     virtualHosts."0.my.test" = {
       extraConfig = ''
         access_log syslog:server=unix:/dev/log,facility=user,tag=mytag,severity=info ceeformat;
         location /favicon.ico { allow all; access_log off; log_not_found off; }
       '';
     };
   };
  }
)).toplevel
