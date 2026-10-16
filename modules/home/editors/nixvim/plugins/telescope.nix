{ lib, ... }:
let
  utils = import ../lib/utils.nix { inherit lib; };
  keymaps = map utils.mkKeymap [
    {
      key = "ff";
      action = "Telescope frecency";
      desc = "Find Files";
    }
    {
      key = "fn";
      action = "Telescope file_browser";
      desc = "Find Files";
    }
    {
      key = "fd";
      action = "lua require('telescope.builtin').find_files({ find_command = { 'fd', '--type', 'd' } })";
      desc = "Find Directories";
    }
    {
      key = "/";
      action = "Telescope live_grep";
      desc = "Live grep";
    }
    {
      key = "bb";
      action = "Telescope buffers";
      desc = "Buffers";
    }
  ];
in
{
  plugins.telescope = {
    enable = true;
    extensions.file-browser = {
      enable = true;
    };
    extensions.frecency = {
      enable = true;
      settings = {
        default_workspace = "CWD";
      };

    };
    settings = {
      defaults = {
        preview = false;
        theme = "ivy";
        # layout_config = {
        #   height = 0.5;
        # };
        mappings = {
          i = {
            "<C-j>" = "move_selection_next";
            "<C-k>" = "move_selection_previous";
          };
          n = {
            "<C-j>" = "move_selection_next";
            "<C-k>" = "move_selection_previous";
          };
        };
      };
      pickers = {
        live_grep = {
          preview = true;
        };
        buffers = {
          sort_lastused = true;
          sort_mru = true;
          ignore_current_buffer = true;
        };
      };

    };
  };
  inherit keymaps;
}
