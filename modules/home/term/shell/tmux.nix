{
  flake.modules.homeManager.tmux = { config, pkgs, ... }: {
    programs.tmux = {
      enable = true;

      focusEvents = true;
      sensibleOnTop = true;

      prefix = "C-b";
      baseIndex = 1;

      shell = "${pkgs.zsh}/bin/zsh";
      terminal = "tmux-256color";
      mouse = true;
      keyMode = "vi";

      disableConfirmationPrompt = true;

      tmuxinator = {
        enable = true;
      };

      extraConfig = ''
        bind-key -T copy-mode-vi v send-keys -X begin-selection
        bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "wl-copy && wl-paste -n | wl-copy -p"
        unbind -T copy-mode-vi MouseDragEnd1Pane

        bind-key p run "wl-paste -n | tmux load-buffer - ; tmux paste-buffer"

        unbind '%'
        unbind '"'
        set -gq allow-passthrough on
        set -as terminal-features ',*:sixel'

        bind v split-window -h -c "#{pane_current_path}"
        bind s split-window -v -c "#{pane_current_path}"

        bind h select-pane -L
        bind j select-pane -D
        bind k select-pane -U
        bind l select-pane -R
        bind R source-file ${config.home.homeDirectory}/.config/tmux/tmux.conf \; display-message "Config reloaded!"

        bind g display-popup \
            -d "#{pane_current_path}" \
            -w 80% \
            -h 80% \
            -E "lazygit"

      '';

      plugins = with pkgs.tmuxPlugins; [
        {
          plugin = vim-tmux-navigator;
        }
        {
          plugin = yank;
        }
        # {
        #   plugin = resurrect;
        #   extraConfig = ''
        #     set -g @resurrect-strategy-nvim 'session' # Restore Neovim sessions
        #   '';
        # }
        # {
        #   plugin = continuum;
        #   extraConfig = ''
        #     set -g @continuum-restore 'on'
        #     set -g @continuum-save-interval '10' # in minutes
        #   '';
        # }
      ];
    };
  };
}
