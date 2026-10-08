{ config, ... }:
{
  flake.modules.homeManager.wayland =
    { pkgs, ... }:
    let
      hyprland-eco = with pkgs; [
        hyprsunset
        hypridle
        hyprlock
        grim
        slurp
      ];
      niri-eco = with pkgs; [
        xwayland-satellite
        swaylock
        swaybg
        swayidle
        awww
      ];
      xmonad-eco = with pkgs; [
        xterm
        # rofi
        dmenu
        xclip
      ];
    in
    {
      imports = [
        config.flake.modules.homeManager.fuzzel
        config.flake.modules.homeManager.niri
        # config.flake.modules.homeManager.hyprland
        config.flake.modules.homeManager.waybar
        config.flake.modules.homeManager.noctalia
        config.flake.modules.homeManager.mako
        config.flake.modules.homeManager.quickshell
        # config.flake.modules.homeManager.xmonad
      ];
      home.packages =
        niri-eco
        # hyprland-eco
        # ++ xmonad-eco
        ++ (with pkgs; [
          wl-clipboard
          hyprpicker
          udiskie
        ]);

    };
}
