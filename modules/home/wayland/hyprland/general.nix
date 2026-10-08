{
  flake.modules.homeManager.hyprland = {
    wayland.windowManager.hyprland.settings = {

      exec = [
        ''gsettings set org.gnome.desktop.interface gtk-theme "Adwaita-dark"''
        ''gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"''
      ];

      exec-once = [
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        # "hyprpaper"
        "waybar"
      ];

      monitor = ",1920x1080@60,auto,auto";

      general = {
        gaps_in = 2;
        gaps_out = 10;
        border_size = 2;
        # "col.active_border" = "rgba(663C91FF)";
        # "col.inactive_border" = "rgba(010404FF)";
        layout = "dwindle";
        allow_tearing = false;
      };

      decoration = {
        rounding = 4;
        inactive_opacity = 0.90;

        blur = {
          enabled = true;
          size = 8;
          passes = 2;
        };

        shadow = {
          enabled = false;
          range = 4;
          render_power = 3;
          # color = "rgba(1a1a1aee)";
        };
      };

      animations = {
        enabled = true;

        bezier = "myBezier, 0.05, 0.9, 0.1, 1.1";

        animation = [
          "windows, 1, 7, myBezier"
          "windowsOut, 1, 7, default, popin 80%"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 7, default"
          "workspaces, 1, 6, default"
        ];
      };

      dwindle = {
        preserve_split = true;
      };

      misc = {
        force_default_wallpaper = 0;
      };
    };
  };
}
