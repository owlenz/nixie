{
  flake.modules.homeManager.kitty = { pkgs, ... }: {
    programs.kitty = {
      enable = true;
      enableGitIntegration = true;

      settings = {
        update_check_interval = "0";
        enable_audio_bell = "yes";

        window_border_width = "0pt";
        draw_minimal_borders = "yes";
        window_margin_width = "0";
        window_padding_width = "0";

        tab_bar_margin_height = "0.0 0.0";

        placement_strategy = "top-left";
      };
    };
  };

}
