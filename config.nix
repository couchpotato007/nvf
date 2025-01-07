{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./keymaps.nix
    ./plugins/language.nix
    ./plugins/small_plugins.nix
    ./plugins/cmp.nix
    ./plugins/telescope.nix
  ];
  config.vim = {
    extraPlugins = with pkgs.vimPlugins; {
      yazi = {
        package = yazi-nvim;
      };
      illuminate = {
        package = vim-illuminate;
      };
      "nix-develop.nvim" = {
        package = nix-develop-nvim;
      };
      "markview.nvim" = {
        package = markview-nvim;
      };
    };

    lazy.plugins = with pkgs.vimPlugins; {
      "oil.nvim" = {
        package = oil-nvim;
        setupModule = "oil.nvim";
        event = ["DirChanged"];
      };
    };

    viAlias = true;
    vimAlias = true;
    useSystemClipboard = true;

    options = {
      number = true;
      relativenumber = true;
      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      mouse = "a";
      showmode = false;
      clipboard = "unnamedplus";
      ignorecase = true;
      smartcase = true;
      scrolloff = 10;
      encoding = "utf-8";
    };

    theme = {
      enable = true;
      name = "catppuccin";
      style = "mocha";
      transparent = false;
    };

    utility = {
      icon-picker.enable = true;
      diffview-nvim.enable = true;

      images = {
        image-nvim.enable = false;
      };
    };

    binds = {
      whichKey.enable = true;
      cheatsheet.enable = true;
    };

    spellcheck = {
      enable = false;
      languages = ["en" "de"];
    };

    terminal.toggleterm = {
      enable = true;
      lazygit = {
        enable = true;
        package = pkgs.lazygit;
      };
    };

    visuals = {
      nvim-web-devicons.enable = true;
      fidget-nvim.enable = true;
      highlight-undo.enable = true;
      nvim-cursorline.enable = true;
      cinnamon-nvim.enable = true;
    };

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false; # throws an annoying debug message
    };

    ui = {
      modes-nvim.enable = false;
      colorizer.enable = true;
      borders = {
        enable = true;
        plugins = {
          nvim-cmp = {
            enable = true;
            style = "rounded";
          };
        };
      };
    };
  };
}
