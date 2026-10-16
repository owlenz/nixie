{ lib, pkgs, ... }:
let
  utils = import ../lib/utils.nix { inherit lib; };
  keymaps = map utils.mkKeymap [
    {
      key = "e";
      action = "Neotree";
      desc = "Open Directory Tree";
    }
  ];
in
{
  # extraPlugins = with pkgs.vimPlugins; [
  #   plenary-nvim
  #   nvim-web-devicons
  #   nui-nvim
  #   (pkgs.vimUtils.buildVimPlugin {
  #     pname = "dired-nvim";
  #     version = "2026-03-05";
  #     src = pkgs.fetchFromGitHub {
  #       owner = "X3eRo0";
  #       repo = "dired.nvim";
  #       rev = "7cf5ceb69a6bbea547f97397fa5310b1571eb03a";
  #       hash = "sha256-cPbfSoVxKlsUaiHMJ74FROL+9KnZRE4Ed+n823gc/04=";
  #     };
  #     doCheck = false;
  #   })
  # ];
  # extraConfigLua = "require('dired').setup({})";

  plugins.neo-tree = {
    enable = true;
    settings = {
      # popup_border_style = "rounded";
      filesystem = {
        filtered_items = {
          hide_dotfiles = false;
          hide_gitignored = false;
          hide_by_name = [
            "node_modules"
          ];
        };
      };
      window = {
        position = "left";
        width = 40;
      };
      buffers = {
        group_empty_dirs = true;
      };
    };
  };
  inherit keymaps;
}
