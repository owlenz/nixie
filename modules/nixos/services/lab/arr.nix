{
  flake.modules.nixos.arr =
    { pkgs, ... }:
    {
      services = {
        ## indexers manager
        prowlarr = {
          enable = true;
          openFirewall = true;
        };
        ## cloudflare bypassing
        # flaresolverr = {
        #   enable = true;
        #   openFirewall = true;
        # };
        ## movie & tv show requesting
        # seerr = {
        #   enable = true;
        #   openFirewall = true;
        # };
        # # movies
        # radarr = {
        #   enable = true;
        #   user = "arr";
        #   openFirewall = true;
        # };
        # # tv shows
        # sonarr = {
        #   enable = true;
        #   user = "arr";
        #   openFirewall = true;
        # };
        # subtitles
        bazarr = {
          enable = true;
          user = "arr";
          openFirewall = true;
        };
      };
      users.users.arr = {
        isSystemUser = true;
        group = "arr";
        extraGroups = [
          "media"
          "bazarr"
        ];
      };
      users.groups.arr = { };
      environment.systemPackages = with pkgs; [
        ffsubsync
      ];
      systemd.services.bazarr.serviceConfig = {
        UMask = "0002";
      };
    };
}
