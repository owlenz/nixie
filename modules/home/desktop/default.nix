{
  config,
  ...
}:
{
  flake.modules.homeManager.desktop =
    {
      pkgs,
      ...
    }:
    {
      programs.obs-studio = {
        enable = true;
      };
      programs.zathura = {
        enable = true;
        options = {
          selection-clipboard = "clipboard";
        };
        mappings = {
          "d" = "scroll half-down";
          "u" = "scroll half-up";
        };
      };

      imports = [ config.flake.modules.homeManager.obsidian ];
      home.packages = with pkgs; [
        keepassxc
        krita
        # (discord.override {
        #   withOpenASAR = true;
        #   # withVencord = true;
        # })
        vesktop
        onlyoffice-desktopeditors
        corefonts
      ];
    };
}
