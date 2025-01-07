{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    keymaps = [
      {
        mode = "i";
        key = "<C-s>";
        action = "<ESC>:w<CR>";
      }

      {
        mode = "n";
        key = "<C-s>";
        action = ":w<CR>";
      }

      {
        mode = "n";
        key = "<leader>q";
        action = ":wq<CR>";
      }
      {
        mode = "n";
        key = "<leader>e";
        action = ":lua require('yazi').yazi() <CR>";
        silent = true;
        desc = "open yazi";
      }
    ];
  };
}
