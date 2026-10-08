{
  flake.modules.nixos.ddns =
    { config, ... }:
    {
      # sops.secrets."namecheap_dns_password" = { };
      sops.secrets."duckdns_password" = { };

      services.ddclient = {
        enable = true;
        interval = "5min";

        protocol = "duckdns";
        username = "nouser";
        # server = "dynamicdns.park-your-domain.com";
        passwordFile = config.sops.secrets.duckdns_password.path;

        domains = [
          "vaultowlenz"
          "owlenz"
          "krkp"
          "naviz"
          "absoz"
        ];
        usev4 = "webv4";
        usev6 = "disabled";

        # domains = [
        #   "vault"
        #   "fin"
        #   "navi"
        #   "abs"
        #   "cdb"
        # ];
      };
    };
}
