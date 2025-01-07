{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    telescope = {
      enable = true;
      mappings = {
        findFiles = "<leader>ff";
        liveGrep = "<leader>fg";
        buffers = "<leader>fb";
        lspDocumentSymbols = "<leader>fs";
      };
    };
  };
}
