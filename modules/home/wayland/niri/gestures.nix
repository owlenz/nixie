{
  flake.modules.homeManager.niri =
    { ... }:
    {
      programs.niri.settings.gestures = {
        # hot-corners.enable = false;
      };
    };
}
