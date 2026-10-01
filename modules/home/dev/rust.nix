{
  flake-file.inputs.rust-overlay = {
    url = "github:oxalica/rust-overlay";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.homeManager.rust =
    { pkgs, inputs, ... }:
    let
      rustPkgs = pkgs.extend inputs.rust-overlay.overlays.default;
    in
    {
      # nixpkgs.overlays = [
      #   inputs.rust-overlay.overlays.default
      # ];
      home.packages = [
        (rustPkgs.rust-bin.stable.latest.default.override {
          extensions = [
            "rust-src"
            "rust-analyzer"
          ];
        })
      ];
    };
}
