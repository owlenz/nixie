{
  flake-file.inputs = {
    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    qml-niri = {
      url = "github:imiric/qml-niri/main";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.quickshell.follows = "quickshell";
    };
  };
  flake.modules.homeManager.quickshell =
    { pkgs, inputs, ... }:
    {
      home.packages = [
        inputs.qml-niri.packages.${pkgs.stdenv.hostPlatform.system}.default
        inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
      ];
      # environment.variables.QML_IMPORT_PATH = "${
      #   inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default
      # }/lib/qt-6/qml";
    };
}
