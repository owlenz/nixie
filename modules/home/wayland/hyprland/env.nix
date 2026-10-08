{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {
      env = [
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "ELECTRON_OZONE_PLATFORM_HINT,auto"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "XCURSOR_SIZE,20"

        "XDG_SESSION_TYPE,wayland"
      ];
    };
  };
}
