{ ... }:
let
  editor = "nvim";
in
{
  flake.modules.homeManager.zsh =
    { pkgs, ... }:
    {
      home.sessionVariables = {
        SHELL = "${pkgs.zsh}/bin/zsh";

        AWS_DEFAULT_REGION = "us-east-1";
        AWS_ACCESS_KEY_ID = "LKIAQAAAAAAACXUCJRHF";
        AWS_SECRET_ACCESS_KEY = "LUo8lOM5YCJJe4vNt3/WRBW/i6YQYdpjVle7ZgQW";
        AWS_ENDPOINT_URL = "http://localhost:4566";
      };
      home.packages = with pkgs; [
        nix-zsh-completions
        awscli2
      ];

      programs.zsh = {
        enable = true;
        autosuggestion = {
          enable = true;
          highlight = "fg=#585b70";
        };
        syntaxHighlighting.enable = true;
        autocd = true;
        enableCompletion = true;
        sessionVariables = {
          EDITOR = editor;
        };
        history = {
          ignoreAllDups = true;
          extended = true;
          save = 3000;
        };

        initContent = ''
          eval "$(hister completion zsh)"

          bindkey -v
          DISABLE_MAGIC_FUNCTIONS="true"
          export PS1="%F{#FD43B7}%n%f@%F{cyan}%m%f-> %1~ $ "

          ENABLE_CORRECTION="true"

          COMPLETION_WAITING_DOTS="true"
          # npm
          export PATH="$HOME/.npm-global/bin:$PATH"
          # cargo
          export PATH="$HOME/.cargo/bin:$PATH"
          # go
          export PATH="$HOME/go/bin:$PATH"
        '';

        shellAliases = {
          ### config files shortcut ###
          kittyC = "${editor} ~/.config/kitty/kitty.conf";
          hyprC = "${editor} ~/.config/hypr/hyprland.conf";
          tmuxC = "${editor} ~/.tmux.conf";
          barC = "cd ~/.config/waybar/ ; ${editor}";
          nvimC = "cd ~/.config/nvim/ ;  ${editor}";
          vimC = "cd ~/.config/nvim/ ; ${editor}";
          i3C = "cd ~/.config/i3/ ; ${editor}";
          zshC = "${editor} ~/.zshrc";
          starC = "${editor} ~/.config/starship/starship.toml";

          ### QOL aliases ###
          ".." = "cd ..";
          vim = "nvim";
          nivm = "nvim";
          tx = "tmux";
          ec = "emacs-client -c";
          icat = "kitten icat";

          pick = "hyprpicker | tail -c +2 | head -c -1 |wl-copy";
          xpick = "xcolor | xclip -sel clip";
          ### eza ###
          ls = "eza --icons=always --group-directories-first";
          ll = "eza -bglF --icons always";
          tree = "eza --tree --icons";

          # nix aliases
          nrf = "sudo nixos-rebuild switch --flake ~/dotfiles";
          nr = "sudo nixos-rebuild switch";
          nsp = "nix search nixpkgs";
          nlp = "nix-store --query --requisites /run/current-system | cut -d- -f2- | sort -u";

          ### personal aliases ###
          passC = "cat ~/Documents/xdd/pass | wl-copy";
          notes = "cd ~/Documents/notes; nvim";
        };
        oh-my-zsh = {
          enable = true;
          plugins = [
            "git"
            "golang"
            "docker"
            "aws"
            "podman"
            "tmux"
            "tmuxinator"
            "emacs"
            "rust"
            "command-not-found"
            "bun"
            "vi-mode"
          ];
        };
      };
    };
}
