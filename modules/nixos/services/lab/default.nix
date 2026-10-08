{ config, ... }:
{
  flake.modules.nixos.services =
    { ... }:
    {
      imports = [
        config.flake.modules.nixos.audiobookshelf
        # config.flake.modules.nixos.paperless
        #config.flake.modules.nixos.slskd

        config.flake.modules.nixos.ddns

        # config.flake.modules.nixos.syncthing
        # config.flake.modules.nixos.pi-hole
        ## streaming media
        config.flake.modules.nixos.jellyfin
        ## *arr services
        # config.flake.modules.nixos.arr
        ## password manager
        config.flake.modules.nixos.vaultwarden
        ## music
        config.flake.modules.nixos.navidrome
        ## images
        config.flake.modules.nixos.immich
        ## ebooks and manga
        config.flake.modules.nixos.kavita

        # config.flake.modules.nixos.searxng
        config.flake.modules.nixos.hister
        config.flake.modules.nixos.karakeep
        config.flake.modules.nixos.timetagger
      ];
    };
}
