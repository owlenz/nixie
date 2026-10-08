{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {
      "$mainMod" = "SUPER";
      bind = [
        # Apps
        "$mainMod, Q, exec, foot"
        "$mainMod, C, killactive,"
        "$mainMod, M, exit,"
        "$mainMod, E, exec, nautilus"
        "$mainMod, V, togglefloating,"
        "$mainMod, W, exec, hyprpicker | tail -c +1 | head -c -1 | wl-copy"
        "$mainMod, R, exec, fuzzel"
        "$mainMod, P, pseudo,"
        "$mainMod, F, fullscreen"

        # Screenshots
        ", Print, exec, grim -g \"$(slurp)\""
        "SHIFT, Print, exec, grim -g \"$(slurp)\" - | wl-copy"
        "$mainMod, Print, exec, grim -g \"$(slurp)\" - | feh -"

        # Focus
        "$mainMod, left,  movefocus, l"
        "$mainMod, right, movefocus, r"
        "$mainMod, up,    movefocus, u"
        "$mainMod, down,  movefocus, d"

        # Workspaces
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        ", XF86Tools,     exec, ~/.config/hypr/func.sh -1"
        ", XF86AudioPlay, exec, ~/.config/hypr/func.sh -2"
        ", XF86AudioPrev, exec, ~/.config/hypr/func.sh -3"
        ", XF86AudioNext, exec, ~/.config/hypr/func.sh -4"
        ", XF86AudioMute, exec, ~/.config/hypr/func.sh -7"

        "$mainMod, S, togglespecialworkspace, magic"
        "$mainMod SHIFT, S, movetoworkspace, special:magic"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up,   workspace, e-1"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
