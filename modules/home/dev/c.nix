{ ... }:
{
  flake.modules.homeManager.c =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        clang-tools
        valgrind
        gdb
        bear
        cmake
        gnumake
        gcc
        pkg-config
      ];
    };
}
