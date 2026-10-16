{
  plugins = {
    nvim-surround = {
      enable = true;
    };
    markdown-preview = {
      enable = true;
    };
    flash = {
      enable = true;
    };
    oil = {
      enable = true;
    };
    nvim-ufo = {
      enable = true;
    };
    obsidian = {
      enable = false;
      settings = {
        legacy_commands = false;
        new_notes_location = "current_dir";
        # workspaces = [
        # {
        #   name = "study";
        #   path = "~/Documents/obsidian/test";
        # }
        # ];
      };
    };
  };
}
