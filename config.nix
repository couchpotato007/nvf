{
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./keymaps.nix
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

    statusline.lualine = {
      enable = true;
      theme = "catppuccin";
    };
    comments.comment-nvim.enable = true;
    autopairs.nvim-autopairs.enable = true;

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

    telescope = {
      enable = true;
      mappings = {
        findFiles = "<leader>ff";
        liveGrep = "<leader>fg";
        buffers = "<leader>fb";
        lspDocumentSymbols = "<leader>fs";
      };
    };

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
