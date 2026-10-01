{ config, ... }:
{

  flake-file.inputs.helium = {
    url = "github:schembriaiden/helium-browser-nix-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  # flake-file.inputs.nixpkgs-unstable-brave = {
  #   url = "github:nixos/nixpkgs/nixos-unstable";
  # };
  flake.modules.homeManager.browsers =
    { pkgs, inputs, ... }:
    {
      home.packages = [
        # pkgs.chromium
        inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
        # inputs.nixpkgs-unstable-brave.legacyPackages.${pkgs.stdenv.hostPlatform.system}.
        pkgs.brave-origin
      ];

      # imports = [ config.flake.modules.homeManager.firefox ];
    };
}
