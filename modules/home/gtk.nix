{ ... }:
{
  flake.modules.homeManager.gtk =
    { pkgs, ... }:
    {
      home.pointerCursor = {
        enable = true;
        package = pkgs.bibata-cursors;
        name = "Bibata-Original-Ice";
        size = 24;
        gtk.enable = true;
        x11.enable = true;
      };

      gtk = {
        enable = true;
      };
      home.packages = with pkgs; [
        nwg-look
        nautilus

        libnotify
        playerctl
        gobject-introspection
      ];
    };
}
