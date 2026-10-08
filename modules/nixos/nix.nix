{
  inputs,
  ...
}:
{
  flake.modules.nixos.nix =
    { ... }:
    {
      programs.nh = {
        enable = true;
        clean.enable = true;
        clean.extraArgs = "--keep-since 4d --keep 3";
        flake = "/home/owlenz/dotfiles";
      };
      nix.registry.nixpkgs.flake = inputs.nixpkgs;
      nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
      nix.settings = {
        substituters = [
          "https://cache.nixos.org"
          # "https://noctalia.cachix.org"
          # "https://kopuz.cachix.org"
        ];
        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          # "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
          # "kopuz.cachix.org-1:J2X3AnAYhKTJW5S3aCLoA1ckonQXVNZMQvhZA0YAufw="
        ];
        trusted-users = [
          "root"
          "@wheel"
        ];
      };
    };
}
