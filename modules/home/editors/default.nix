{ config, ... }:
{
  flake.modules.homeManager.editors = { pkgs, ... }: {
    imports = with config.flake.modules.homeManager; [
      emacs
      zed
      nixvim
    ];
    home.packages = [
      pkgs.cursor-cli
      # pkgs.opencode
    ];
  };
}
