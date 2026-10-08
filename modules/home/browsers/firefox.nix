{
  flake-file.inputs.nixpkgs-firefox = {
    url = "github:NixOS/nixpkgs/nixos-unstable";
  };
  flake.modules.homeManager.firefox =
    { pkgs, inputs, ... }:
    {
      home.packages = [
        inputs.nixpkgs-firefox.legacyPackages.${pkgs.stdenv.hostPlatform.system}.firefox
      ];
    };
}
