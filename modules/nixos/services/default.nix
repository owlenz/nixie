{ config, ... }:
{
  flake.modules.nixos.services =
    { pkgs, ... }:
    {
      imports = [
        config.flake.modules.nixos.dm
        config.flake.modules.nixos.ssh
        config.flake.modules.nixos.x11
        config.flake.modules.nixos.pipewire
        config.flake.modules.nixos.secrets
        config.flake.modules.nixos.virt
      ];
      programs.wireshark.enable = true;

      environment.systemPackages = with pkgs; [ local.fluxcast ];
      services = {
        gvfs.enable = true;
        blueman.enable = true;
        flatpak.enable = true;
        cloudflare-warp.enable = true;
        dbus.packages = with pkgs; [ local.fluxcast ];
      };

      # virtualisation.oci-containers = {
      # containers.couchdb-obsidian = {
      #   image = "couchdb:latest";
      #   ports = [ "5984:5984" ];
      #   environment = {
      #     COUCHDB_USER = "owlenz";
      #     COUCHDB_PASSWORD = "test";
      #   };
      #   volumes = [
      #     "./couchdb-data:/var/lib/couchdb/data"
      #     "./couchdb-etc:/var/lib/couchdb/etc/local.d "
      #   ];
      # };
      # };

      # services.caddy = {
      #   enable = true;
      #   virtualHosts."cdb.owlenz.xyz" = {
      #     extraConfig = "reverse_proxy 127.0.0.1:5984";
      #   };
      # };
      #
      # networking.extraHosts = ''
      #   127.0.0.1 cdb.owlenz.xyz
      # '';
    };
}
