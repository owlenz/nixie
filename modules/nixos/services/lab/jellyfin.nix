{
  flake.modules.nixos.jellyfin =
    { pkgs, ... }:
    {
      services.jellyfin = {
        enable = true;
        openFirewall = true;
        hardwareAcceleration = {
          enable = true;
          device = "/dev/dri/renderD128";
        };
      };
      environment.systemPackages = with pkgs; [
        jellyfin
        jellyfin-media-player
        jellyfin-web
        jellyfin-ffmpeg
      ];

      services.caddy = {
        enable = true;
        virtualHosts."fin.owlenz.xyz" = {
          extraConfig = "reverse_proxy 127.0.0.1:8096";
        };
      };

      systemd.tmpfiles.rules = [
        "d /var/lib/jellyfin 0750 jellyfin jellyfin -"
      ];

      networking.extraHosts = ''
        127.0.0.1 fin.owlenz.xyz
      '';
      users.users.jellyfin = {
        isSystemUser = true;
        extraGroups = [ "media" ];
      };
    };
}
