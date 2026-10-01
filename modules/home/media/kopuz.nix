{
  flake-file.inputs.kopuz = {
    url = "github:temidaradev/kopuz";
    inputs.nixpkgs.follows = "nixpkgs";
    inputs.rust-overlay.follows = "rust-overlay";
  };
  flake.modules.homeManager.kopuz =
    { pkgs, inputs, ... }:
    {
      home.packages = [ inputs.kopuz.packages.${pkgs.stdenv.hostPlatform.system}.default ];
    };
}
