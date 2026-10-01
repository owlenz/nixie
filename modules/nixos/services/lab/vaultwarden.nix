{ ... }:
{
  flake.modules.nixos.vaultwarden = { config, ... }: {
    sops.secrets."vaultwarden/admin_token" = { };
    services.vaultwarden = {
      enable = true;
      dbBackend = "sqlite";
      config = {
        DOMAIN = "https://vaultowlenz.duckdns.org";
        SIGNUPS_ALLOWED = true;
        ROCKET_ADDRESS = "0.0.0.0";
        ROCKET_PORT = 8222;
        WEBSOCKET_ENABLED = true;
      };
      environmentFile = config.sops.secrets."vaultwarden/admin_token".path;
    };

    services.caddy = {
      enable = true;
      email = "saifowlenzz@gmail.com";
      virtualHosts."vaultowlenz.duckdns.org" = {
        extraConfig = ''
          reverse_proxy 127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}
        '';
      };
    };

    networking.extraHosts = ''
      127.0.0.1 vaultowlenz.duckdns.org
    '';

    networking.firewall.allowedTCPPorts = [ 8222 ];
  };
}
