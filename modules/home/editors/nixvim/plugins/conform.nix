{ pkgs, ... }:
{
  extraPackages = with pkgs; [
    fourmolu
    yamlfmt
    tombi
    dockerfmt
    shellcheck
    nixfmt
    tombi
    shfmt
    shellharden
  ];
  plugins.conform-nvim = {
    enable = true;
    settings = {
      formatters_by_ft = {
        sh = [
          "shellcheck"
          "shellharden"
          "shfmt"
        ];
        cpp = [ "clang_format" ];
        c = [ "clang_format" ];
        haskell = [ "fourmolu" ];
        go = [
          "gofmt"
          "goimports"
        ];
        nix = [
          "nixfmt"
        ];
        toml = [
          "tombi"
        ];
        yaml = [
          "yamlfmt"
        ];
        Dockerfile = [
          "dockerfmt"
        ];
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };
      formatters.yamlfmt = {
        command = "${pkgs.yamlfmt}/bin/yamlfmt";
        args = [
          "-formatter"
          "retain_line_breaks=true"
          "-"
        ];
        stdin = true;
      };
      format_on_save = # Lua
        ''
          function(bufnr)
            -- Ensure global table exists
            _G.slow_format_filetypes = _G.slow_format_filetypes or {}

            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
              return
            end

            if _G.slow_format_filetypes[vim.bo[bufnr].filetype] then
              return
            end

            local function on_format(err)
              if err and err:match("timeout$") then
                _G.slow_format_filetypes[vim.bo[bufnr].filetype] = true
              end
            end

            return { timeout_ms = 200, lsp_fallback = true }, on_format
          end
        '';
    };
  };
}
