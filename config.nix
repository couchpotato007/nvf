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
      "nix-develop.nvim" = {
        package = nix-develop-nvim;
      };
      # "nvzone-typr" = {
      #   package = nvzone-typr;
      # };
    };

    lazy.plugins = with pkgs.vimPlugins; {
      "oil.nvim" = {
        package = oil-nvim;
        setupModule = "oil.nvim";
        event = ["DirChanged"];
      };

      vimtex = {
        enabled = true;
        package = vimtex;
        lazy = false;
        ft = "tex";
        setupOpts = {
          init = ''
            vim.g.vimtex_view_method = "general"
            vim.g.vimtex_view_general_viewer = "okular"
            vim.g.vimtex_compiler_method = "latexrun"
          '';
        };
        after = ''
          vim.api.nvim_command('unlet b:did_ftplugin')
          vim.api.nvim_command('call vimtex#init()')
        '';
      };
    };

    preventJunkFiles = true;

    luaConfigPost = "${builtins.readFile ./extraConfig.lua}";

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
      yanky-nvim.enable = true;

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
      enable = true;
      programmingWordlist.enable = true;
      languages = ["en" "de"];
    };

    terminal.toggleterm = {
      enable = true;
      lazygit = {
        enable = true;
        package = pkgs.lazygit;
      };
    };

    presence.neocord = {
      enable = true;
    };

    git = {
      enable = true;
      gitsigns.enable = true;
      gitsigns.codeActions.enable = false; # throws an annoying debug message
    };

    visuals = {
      nvim-web-devicons.enable = true;
      tiny-devicons-auto-colors.enable = true;
      fidget-nvim.enable = true;
      nvim-cursorline = {
        enable = true;
        setupOpts = {
          # cursorline.enable = true;
          cursorword.enable = true;
        };
      };
      cinnamon-nvim.enable = true;
      cellular-automaton.enable = true;
      rainbow-delimiters.enable = true;
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

    # dashboard.alpha.enable = true;

    mini = {
      ai.enable = true;
      # animate.enable = true;
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
        complete = "<C-Space>";
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
      lightbulb.enable = false;
      # lspsaga.enable = true;
      trouble.enable = true;
      lspSignature.enable = true;
      otter-nvim.enable = true;
      lsplines.enable = true;
      nvim-docs-view = {
        enable = true;
        mappings = {
          viewToggle = "<localleader>lvt";
          viewUpdate = "<localleader>lvu";
        };
      };
      mappings = {
        codeAction = "<leader>ca";
        goToDeclaration = "gD";
        goToDefinition = "gT";
        hover = "K";
        nextDiagnostic = "[d";
        previousDiagnostic = "]d";
        renameSymbol = "<leader>cr";
      };
      lspconfig = {
        enable = true;
        sources = {
          "texlab" = "
                lspconfig.texlab.setup {
                  capabilities = capabilities,
                  on_attach = default_on_attach,
                  cmd = {'${lib.getExe pkgs.texlab}'}
                }";
        };
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
      markdown = {
        enable = true;
        extensions.render-markdown-nvim.enable = true;
        format = {
          enable = true;
        };
      };
      lua.enable = true;
      python = {
        enable = true;
      };
      css.enable = true;
      go.enable = true;
      bash.enable = true;
      typst = {
        enable = true;
        # lsp.enable = true;
        format = {
          enable = true;
          type = "typstyle";
        };
        # extensions.typst-preview-nvim.enable = true;
      };
      svelte = {
        enable = true;
        treesitter.enable = true;
      };
      ts = {
        enable = true;
        extraDiagnostics.enable = true;
      };
      tailwind.enable = true;
    };
    treesitter = {
      enable = true;
      context = {
        enable = true;
      };
      grammars = [
        pkgs.vimPlugins.nvim-treesitter-parsers.latex
        pkgs.vimPlugins.nvim-treesitter-parsers.typst
        # pkgs.vimPlugins.nvim-treesitter-parsers.svelte
      ];
    };
    snippets.luasnip = {
      enable = true;
    };
  };
}
