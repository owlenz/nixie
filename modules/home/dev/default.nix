{ config, ... }:
{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      home.packages = with pkgs; [
        # typst
        typst
        tinymist
        ispell
        dockerfile-language-server

        go
        gotools
        gopls

        gh

        (pkgs.unityhub.override {
          extraPkgs =
            pkgs: with pkgs; [
              gst_all_1.gstreamer
              gst_all_1.gst-plugins-base
              gst_all_1.gst-plugins-good
              gst_all_1.gst-plugins-bad
              gst_all_1.gst-plugins-ugly
              gst_all_1.gst-libav
            ];
        })
      ];
      imports = [
        config.flake.modules.homeManager.web
        config.flake.modules.homeManager.java
        config.flake.modules.homeManager.c
        config.flake.modules.homeManager.rust
      ];
      programs.home-manager.enable = true;
    };
}
