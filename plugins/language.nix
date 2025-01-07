{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    lsp = {
      enable = true;
      formatOnSave = true;
      # lightbulb.enable = true;
      # lspsaga.enable = true;
      trouble.enable = true;
      lspSignature.enable = true;
      otter-nvim.enable = true;
      lsplines.enable = true;
      nvim-docs-view.enable = true;
      mappings = {
        codeAction = "<leader>ca";
        goToDeclaration = "gD";
        goToDefinition = "gT";
        hover = "K";
        nextDiagnostic = "[d";
        previousDiagnostic = "]d";
        renameSymbol = "<leader>cr";
      };
    };
    debugger = {
      nvim-dap = {
        enable = true;
        ui.enable = true;
      };
    };
    languages = {
      enableLSP = true;
      enableTreesitter = true;
      enableFormat = true;
      enableExtraDiagnostics = true;

      nix = {
        enable = true;
        format = {
          enable = true;
          package = pkgs.alejandra;
        };
      };
      rust = {
        enable = true;
        format = {
          enable = true;
          package = pkgs.rustfmt;
        };
      };
      zig.enable = true;
      clang.enable = true;
      markdown.enable = true;
    };
    treesitter = {
      enable = true;
      context = {
        enable = true;
      };
    };
    snippets.luasnip = {
      enable = true;
    };
  };
}
