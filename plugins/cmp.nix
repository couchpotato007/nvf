{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    autocomplete.nvim-cmp = {
      enable = true;
      mappings = {
        complete = "<C-Space";
        confirm = "<Tab>";
        next = "<C-n>";
        previous = "<C-p>";
        scrollDocsUp = "<C-b>";
        scrollDocsDown = "<C-f>";
      };
      sources = {
        buffer = "[Buffer]";
        path = "[Path]";
        rg = "[rg]";
      };
      setupOpts = {
        experimental = {
          ghost_text = true;
        };
      };
    };
  };
}
