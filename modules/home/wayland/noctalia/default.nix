{
  flake-file.inputs.noctalia = {
    url = "github:noctalia-dev/noctalia";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.homeManager.noctalia =
    { pkgs, inputs, ... }:
    {
      home.packages = [ inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default ];
    };
}
