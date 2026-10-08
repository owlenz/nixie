{ config, ... }:
{
  flake.modules.homeManager.shell =
    { pkgs, ... }:
    {
      imports = with config.flake.modules.homeManager; [
        git
        zsh
        direnv
        nix
        tmux
      ];
      programs.fzf = {
        enable = true;
        enableZshIntegration = true;
        tmux.enableShellIntegration = true;
      };

      home.packages = with pkgs; [
        # killall command and more
        psmisc
        just
        at
        bat
        btop
        htop
        lazygit

        man
        bc
        dust
        eza
        fd
        nil
        ripgrep
        tokei
        unar
        zip
        unzip
        feh

        fastfetch

        ## parsing
        jq
        yq

        ## man pages
        man-pages
        man-pages-posix

        ## io
        lsof
        iotop
      ];
    };
}
