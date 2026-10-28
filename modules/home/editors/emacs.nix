{
  flake-file.inputs.emacs-overlay = {
    url = "github:nix-community/emacs-overlay";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  flake.modules.homeManager.emacs =
    { pkgs, inputs, ... }:
    let
      pkgs' = pkgs.extend (import inputs.emacs-overlay);
    in
    {
      programs.emacs = {
        enable = false;
        package = (
          pkgs'.emacsWithPackagesFromUsePackage {
            package = pkgs'.emacs-pgtk;
            config = ./emacs/init.el;
            defaultInitFile = false;
            extraEmacsPackages = epkgs: [
              epkgs.nerd-icons
              epkgs.astro-ts-mode
              epkgs.lsp-tailwindcss
              epkgs.magit
              epkgs.treesit-grammars.with-all-grammars
              epkgs.exec-path-from-shell
              epkgs.lsp-mode
              epkgs.lsp-ui
              epkgs.rustic
              epkgs.dockerfile-mode
              epkgs.go-mode
            ];
          }
        );
      };
      services.emacs = {
        enable = false;
        startWithUserSession = "graphical";
        defaultEditor = false;
      };
      xdg.configFile."emacs" = {
        source = ./emacs;
        recursive = true;
      };
    };
}
