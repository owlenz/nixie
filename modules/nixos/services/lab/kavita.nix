{
  flake.modules.nixos.kavita = { config, ... }: {

    # sops.secrets."kavita_token_key" = { };
    # services.kavita = {
    #   enable = true;
    #   settings.Port = 5000;
    #   tokenKeyFile = config.sops.secrets."kavita_token_key".path;
    # };

    #  users.users.kavita = {
    #   isSystemUser = true;
    #   extraGroups = [ "media" ];
    # };

    services.komga = {
      enable = true;
      settings.server.port = 5001;
    };

    users.users.komga = {
      isSystemUser = true;
      extraGroups = [ "media" ];
    };

    virtualisation.oci-containers = {
      backend = "docker";
      containers.komf = {
        image = "docker.io/sndxr/komf:latest";
        ports = [ "8085:8085" ];
        volumes = [
          "/var/lib/komf/config:/config"
        ];
        extraOptions = [
          "--network=host"
        ];
        environment = {
          KOMF_KOMGA_BASE_URI = "http://127.0.0.1:5001";
          KOMF_KOMGA_USER = "saifowlenzz@gmail.com";
          KOMF_KOMGA_PASSWORD = "$a!f";
          # KOMF_KAVITA_BASE_URI = "http://127.0.0.1:5000";
          # KOMF_KAVITA_API_KEY = "QhXCU3bm";
          KOMF_LOG_LEVEL = "INFO";
          JAVA_TOOL_OPTIONS = "-XX:+UnlockExperimentalVMOptions -XX:+UseShenandoahGC -XX:ShenandoahGCHeuristics=compact -XX:ShenandoahGuaranteedGCInterval=3600000 -XX:TrimNativeHeapInterval=3600000";
        };
      };
    };
  };
}
