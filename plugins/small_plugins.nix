{
  pkgs,
  lib,
  ...
}: {
  config.vim = {
    statusline.lualine = {
      enable = true;
      theme = "catppuccin";
    };
    comments.comment-nvim.enable = true;
    autopairs.nvim-autopairs.enable = true;
  };
}
