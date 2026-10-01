{
  pkgs,
  hostname,
  ...
}:
{
  plugins = {
    lsp = {
      enable = true;
      servers = {
        # taplo.enable = true;
        bashls.enable = true;
        # nil_ls.enable = true;
        yamlls = {
          enable = true;
          package = pkgs.yaml-language-server;
          settings = {
            schemas = {
              kubernetes = [
                "k8s/**/*.yaml"
                "*deployment*.yaml"
                "*service*.yaml"
              ];
              "https://raw.githubusercontent.com/SchemaStore/schemastore/master/src/schemas/json/github-workflow.json" =
                "/.github/workflows/*.{yml,yaml}";
            };
            validate = true;
            completion = true;
            hover = true;
          };
        };
        nixd = {
          enable = true;
          settings = {
            nixpkgs.expr = "import <nixpkgs> { }";
            formatting.command = [ "nixfmt" ];
            diagnostic.suppress = [ ];
            options = {
              nixos.expr = ''(builtins.getFlake "/home/owlenz/dotfiles").nixosConfigurations.${hostname}.options'';
            };
          };
        };
        hls = {
          enable = false;
          # installGhc = false;
          package = null;
        };
        qmlls = {
          enable = true;
        };
        gopls = {
          enable = true;
          package = null;
        };
        rust_analyzer = {
          enable = true;
          package = null;
          installCargo = false;
          installRustc = false;
        };
        pyright = {
          enable = true;
          package = null;
        };
      };
      keymaps.lspBuf = {
        "<F2>" = "rename";
        K = "hover";
        gd = "definition";
        gD = "declaration";
        gr = "references";
        "<F4>" = "code_action";
      };
    };
  };
}
