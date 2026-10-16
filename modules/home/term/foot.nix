{ ... }:
{
  flake.modules.homeManager.foot =
    { pkgs, ... }:
    {

      programs.foot = {
        enable = true;
        package = pkgs.symlinkJoin {
          name = "foot";
          paths = [ pkgs.foot ];
          nativeBuildInputs = [ pkgs.makeWrapper ];
          postBuild = ''
            wrapProgram $out/bin/foot \
              --set FREETYPE_PROPERTIES "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"
            wrapProgram $out/bin/footclient \
              --set FREETYPE_PROPERTIES "cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"
          '';
        };

        server.enable = true;
        settings = {
          colors-dark = {
            alpha-mode = "all";
          };
          main = {
            pad = "0x0";
          };
          url = {
            launch = "${pkgs.xdg-utils}/bin/xdg-open \${url}";
          };
        };
      };
    };
}
