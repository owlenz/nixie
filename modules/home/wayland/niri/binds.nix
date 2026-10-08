{
  flake.modules.homeManager.niri =
    { config, lib, ... }:
    {

      programs.niri.settings = {
        recent-windows.enable = false;
        binds =
          with config.lib.niri.actions;
          {
            "Mod+Q".action = spawn "footclient";
            "Mod+E".action = spawn "nautilus";
            "Mod+R".action = spawn "fuzzel";
            ## hister
            "Mod+S".action = spawn-sh "xdg-open 'http://127.0.0.1:4433/' ";
            "Mod+W".action = spawn-sh "hyprpicker | tail -c +1 | head -c -1 | wl-copy";
            "Mod+Tab" = {
              action = toggle-overview;
              repeat = false;
            };
            "Mod+V".action = toggle-window-floating;
            "Mod+C".action = close-window;
            "Mod+Alt+L".action = spawn "swaylock";

            XF86Favorites = {
              action = spawn-sh "xdg-open 'http://127.0.0.1:3000/' ";
            };
            XF86AudioRaiseVolume = {
              allow-when-locked = true;
              action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05+";
            };
            XF86AudioLowerVolume = {
              allow-when-locked = true;
              action = spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.05-";
            };
            XF86AudioMute = {
              allow-when-locked = true;
              action = spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
            };
            XF86PickupPhone = {
              allow-when-locked = true;
              action = spawn-sh "playerctl play-pause";
            };
            XF86AudioPrev = {
              allow-when-locked = true;
              action = spawn-sh "playerctl previous";
            };
            XF86AudioNext = {
              allow-when-locked = true;
              action = spawn-sh "playerctl next";
            };

            "Print".action.screenshot = {
              show-pointer = false;
            };
            "Mod+Print".action.screenshot-screen = {
              show-pointer = false;
            };
            # "Alt+Print".action = screenshot-window;

            "Mod+Shift+E".action.spawn = [
              "niri"
              "msg"
              "action"
              "quit"
            ];

            "Mod+K".action = focus-window-or-workspace-up;
            "Mod+H".action = focus-column-left;
            "Mod+J".action = focus-window-or-workspace-down;
            "Mod+L".action = focus-column-right;

            "Mod+Shift+K".action = move-column-to-workspace-up;
            "Mod+Shift+H".action = move-column-left;
            "Mod+Shift+J".action = move-column-to-workspace-down;
            "Mod+Shift+L".action = move-column-right;

            "Mod+F".action = maximize-column;
            "Mod+Shift+F".action = fullscreen-window;

            "Mod+X".action = center-column;
            "Mod+Z".action = switch-preset-column-width;

            "Mod+Minus".action = set-column-width "-10%";
            "Mod+Equal".action = set-column-width "+10%";

            ## workspaces
            "Mod+1".action = focus-workspace 1;
            "Mod+2".action = focus-workspace 2;
            "Mod+3".action = focus-workspace 3;
            "Mod+4".action = focus-workspace 4;
            "Mod+5".action = focus-workspace 5;
            "Mod+6".action = focus-workspace 6;
            "Mod+7".action = focus-workspace 7;
            "Mod+8".action = focus-workspace 8;
            "Mod+9".action = focus-workspace 9;
          }
          // lib.optionalAttrs (config.programs.noctalia.enable or false) {
            # "Mod+R".action = spawn-sh "noctalia msg panel-toggle launcher";
            XF86AudioRaiseVolume = {
              action = spawn-sh "noctalia msg volume-up";
              allow-when-locked = true;
            };
            XF86AudioLowerVolume = {
              action = spawn-sh "noctalia msg volume-down";
              allow-when-locked = true;
            };
            XF86AudioMute = {
              action = spawn-sh "noctalia msg volume-mute";
              allow-when-locked = true;
            };
            XF86MonBrightnessUp = {
              action = spawn-sh "noctalia msg brightness-up";
              allow-when-locked = true;
            };
            XF86MonBrightnessDown = {
              action = spawn-sh "noctalia msg brightness-down";
              allow-when-locked = true;
            };
            XF86AudioMicMute = {
              action = spawn-sh "noctalia msg mic-mute";
              allow-when-locked = true;
            };
            XF86PickupPhone = {
              action = spawn-sh "noctalia msg media toggle";
              allow-when-locked = true;
            };
          };
      };
    };
}
