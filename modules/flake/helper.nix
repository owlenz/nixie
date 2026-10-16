# Borrowed from https://github.com/bivsk/nix-iv/blob/ef0cd9ae5b053ef02965d4c88439a70a54817dbc/modules/flake/nixos-hosts.nix
{
  inputs,
  lib,
  config,
  ...
}:
let
  inherit (lib) types mkOption;
in
{
  options = {
    nixosHosts =
      let
        nixosHostType = types.submodule {
          options = {
            system = mkOption {
              type = types.str;
              default = "x86_64-linux";
            };
            # specialArgs = mkOption {
            #   type = ;
            # }
            unstable = mkOption {
              type = types.bool;
              default = true;
            };
          };
        };
      in
      mkOption {
        type = types.attrsOf nixosHostType;
      };
  };

  config = {
    flake.nixosConfigurations =
      let
        mkHost =
          hostname: options:
          let
            nixpkgs' = if options.unstable then inputs.nixpkgs else inputs.nixpkgs-stable;
          in
          nixpkgs'.lib.nixosSystem {
            inherit (options) system;
            specialArgs = {
              inherit inputs;
            };
            modules = [
              (config.flake.modules.nixos."${hostname}Home" or { })
              (config.flake.modules.nixos."${hostname}Configuration" or { })
              (config.flake.modules.nixos."${hostname}Hardware" or { })
            ];
          };
      in
      lib.mapAttrs mkHost config.nixosHosts;
  };
}
