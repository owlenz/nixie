{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland = {
      enable = true;
      package = null;
      configType = "hyprlang";
      portalPackage = null;
    };
  };
}
