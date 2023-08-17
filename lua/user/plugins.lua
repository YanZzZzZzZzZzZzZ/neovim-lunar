local barbar = {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
    'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
  },
  init = function() vim.g.barbar_auto_setup = false end,
  opts = {
    -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    -- animation = true,
    -- insert_at_start = true,
    -- …etc.
  },
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}

local cheatsheet =
{
  'doctorfree/cheatsheet.nvim',
  event = "VeryLazy",
  dependencies = {
    { "nvim-telescope/telescope.nvim" },
    { "nvim-lua/popup.nvim" },
    { "nvim-lua/plenary.nvim" },
  },
  config = function()
    local ctactions = require("cheatsheet.telescope.actions")
    require("cheatsheet").setup({
      bundled_cheetsheets = {
        enabled = {
          "default",
          "lua",
          "markdown",
          "regex",
          "netrw",
          "unicode",
        },
        disabled = { "nerd-fonts" },
      },
      bundled_plugin_cheatsheets = {
        enabled = {
          "auto-session",
          "goto-preview",
          "telescope.nvim",
          "vim-easy-align",
          "vim-sandwich",
        },
        disabled = { "gitsigns" },
      },
      include_only_installed_plugins = true,
      telescope_mappings = {
        ["<CR>"] = ctactions.select_or_fill_commandline,
        ["<A-CR>"] = ctactions.select_or_execute,
        ["<C-Y>"] = ctactions.copy_cheat_value,
        ["<C-E>"] = ctactions.edit_user_cheatsheet,
      },
    })
  end,
}

local neoclip = {
  "AckslD/nvim-neoclip.lua",
  dependencies = {
    -- you'll need at least one of these
    { 'nvim-telescope/telescope.nvim' },
    -- {'ibhagwan/fzf-lua'},
  },
  config = function()
    require('neoclip').setup()
  end,
}

local trouble = {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}

local ls_lines = {
  "Maan2003/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
  end,
}

local lsp_signiture = {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  opts = {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    handler_opts = {
        border = 'rounded',
    },
  },
  config = function(_, opts) require 'lsp_signature'.setup(opts) end
}

local lspsaga = {
  'nvimdev/lspsaga.nvim',
  config = function()
    require('lspsaga').setup({
      ui = {
        -- Currently, only the round theme exists
        theme = 'round',
        -- This option only works in Neovim 0.9
        title = true,
        -- Border type can be single, double, rounded, solid, shadow.
        border = 'rounded',
        winblend = 0,
        expand = '',
        collapse = '',
        preview = ' ',
        code_action = '💡',
        diagnostic = '🐞',
        incoming = ' ',
        outgoing = ' ',
        hover = ' ',
        kind = {},
      },
    })
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons'      -- optional
  }
}

local legendary = {
  'mrjones2014/legendary.nvim',
  -- since legendary.nvim handles all your keymaps/commands,
  -- its recommended to load legendary.nvim before other plugins
  priority = 10000,
  lazy = false,
  -- sqlite is only needed if you want to use frecency sorting
  -- dependencies = { 'kkharji/sqlite.lua' }
}

local dressing = {
  config = function()
    require('dressing').setup({
      win_options = {
        -- Window transparency (0-100)
        winblend = 10,
        -- Change default highlight groups (see :help winhl)
        winhighlight =
        'Normal:DressingInputNormalFloat,NormalFloat:DressingInputNormalFloat,FloatBorder:DressingInputFloatBorder',
      },
      input = {
        -- Set to false to disable the vim.ui.input implementation
        enabled = true,

        -- Default prompt string
        default_prompt = 'Input:',

        -- Can be 'left', 'right', or 'center'
        prompt_align = 'left',

        -- When true, <Esc> will close the modal
        insert_only = true,

        -- When true, input will start in insert mode.
        start_in_insert = true,

        -- These are passed to nvim_open_win
        border = 'rounded',
        -- 'editor' and 'win' will default to being centered
        relative = 'cursor',

        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        prefer_width = 40,
        width = nil,
        -- min_width and max_width can be a list of mixed types.
        -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
        max_width = { 140, 0.9 },
        min_width = { 20, 0.2 },

        override = function(conf)
          -- This is the config that will be passed to nvim_open_win.
          -- Change values here to customize the layout
          return conf
        end,

        -- see :help dressing_get_config
        get_config = nil,
      },
      select = {
        -- Set to false to disable the vim.ui.select implementation
        enabled = true,

        -- Priority list of preferred vim.select implementations
        backend = { 'telescope', 'fzf_lua', 'fzf', 'builtin', 'nui' },

        -- Trim trailing `:` from prompt
        trim_prompt = true,
      },
    })
  end
}
lvim.plugins = {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestions = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },

  { 'jose-elias-alvarez/typescript.nvim' },

  { 'lunarvim/lunar.nvim' },
  { "morhetz/gruvbox" },
  { "sainnhe/gruvbox-material" },
  { "sainnhe/sonokai" },
  { "sainnhe/edge" },
  { "lunarvim/horizon.nvim" },
  { "tomasr/molokai" },
  { "ayu-theme/ayu-vim" },

  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },

  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    config = function()
      require("persistence").setup({
        dir = vim.fn.expand(vim.fn.stdpath "state" .. "/sessions/"),
        options = { "buffers", "curdir", "tabpages", "winsize" }
      })
    end
  },

  { "tpope/vim-surround" },

  { "felipec/vim-sanegx", event = "BufRead" },

  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  { "tpope/vim-repeat" },

  { "ThePrimeagen/harpoon" },

  -- {
  --   'phaazon/hop.nvim',
  --   branch = 'v2',
  --   config = function()
  --     require('hop').setup()
  --   end
  -- },

  {
    'nvim-telescope/telescope-frecency.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'kkharji/sqlite.lua' },
  },

  {
    'AckslD/nvim-trevJ.lua',
    config = 'require("trevj").setup()',
    init = function()
      vim.keymap.set('n', '<leader>j', function()
        require('trevj').format_at_cursor()
      end)
    end,
  },

  {
    "numToStr/Navigator.nvim",
    config = function()
      require("Navigator").setup({})
      local map = vim.api.nvim_set_keymap
      local default_options = { noremap = true, silent = true }
      -- tmux navigation
      map("n", "<C-h>", "<cmd>lua require('Navigator').left()<CR>", default_options)
      map("n", "<C-k>", "<cmd>lua require('Navigator').up()<CR>", default_options)
      map("n", "<C-l>", "<cmd>lua require('Navigator').right()<CR>", default_options)
      map("n", "<C-j>", "<cmd>lua require('Navigator').down()<CR>", default_options)
    end,
  },

  {
    "ggandor/flit.nvim",
    keys = function()
      local ret = {}
      for _, key in ipairs { "f", "F", "t", "T" } do
        ret[#ret + 1] = { key, mode = { "n", "x", "o" }, desc = key }
      end
      return ret
    end,
    opts = { labeled_modes = "nx" },
  },

  {
    "ggandor/leap.nvim",
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },

  -- coq, not configured properly
  -- {
  --   "ms-jpq/coq_nvim",
  --   branch = "coq",
  --   dependencies = {
  --     {
  --       "ms-jpq/coq.artifacts",
  --       branch = "artifacts",
  --     },
  --     {
  --       "ms-jpq/coq.thirdparty",
  --       branch = "3p",
  --     },
  --   },
  -- },

  -- {
  --   "kevinhwang91/nvim-ufo",
  --   event = "BufRead",
  --   dependencies = {
  --     { "kevinhwang91/promise-async" },
  --     { "luukvbaal/statuscol.nvim" },
  --   },
  --   config = function()
  --     require("ufo").setup({
  --       close_fold_kinds = { "imports" },
  --       provider_selector = function(bufnr, filetype, buftype)
  --         -- if you prefer treesitter provider rather than lsp,
  --         -- return ftMap[filetype] or {'treesitter', 'indent'}

  --         -- refer to ./doc/example.lua for detail
  --         return "treesitter"
  --       end
  --     })
  --     vim.keymap.set("n", "zR", require("ufo").openAllFolds, { desc = "Open all folds" })
  --     vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { desc = "Close all folds" })
  --     vim.keymap.set("n", "zk", require("ufo").openFoldsExceptKinds, { desc = "Open folds except kinds" })
  --     vim.keymap.set("n", "zK", function()
  --       local winid = require("ufo").peekFoldedLinesUnderCursor()
  --       if not winid then
  --         vim.lsp.buf.hover()
  --       end
  --     end, { desc = "Peek folded lines under cursor" })
  --   end,
  -- },

  {
    "luukvbaal/statuscol.nvim",
    config = function()
      local builtin = require("statuscol.builtin")
      require("statuscol").setup({
        relculright = false,
        ft_ignore = { "neo-tree" },
        segments = {
          {
            -- line number
            text = { builtin.lnumfunc },
            condition = { true, builtin.not_empty },
            click = "v:lua.ScLa",
          },
          { text = { "%s" },      click = "v:lua.ScSa" }, -- Sign
          { text = { "%C", " " }, click = "v:lua.ScFa" }, -- Fold
        },
      })
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        callback = function()
          if vim.bo.filetype == "neo-tree" then
            vim.opt_local.statuscolumn = ""
          end
        end,
      })
    end,
  },

  {
    "m4xshen/smartcolumn.nvim",
    opts = {}
  },

  { 'Mofiqul/dracula.nvim' },

  { "EdenEast/nightfox.nvim" },

  { "rebelot/kanagawa.nvim" },

  {
    "olimorris/onedarkpro.nvim",
    priority = 1000 -- Ensure it loads first
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  },

  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require 'rainbow-delimiters'

      vim.g.rainbow_delimiters = {
        strategy = {
          [''] = rainbow_delimiters.strategy['global'],
          vim = rainbow_delimiters.strategy['local'],
        },
        query = {
          [''] = 'rainbow-delimiters',
          lua = 'rainbow-blocks',
        },
        highlight = {
          'RainbowDelimiterRed',
          'RainbowDelimiterYellow',
          'RainbowDelimiterBlue',
          'RainbowDelimiterOrange',
          'RainbowDelimiterGreen',
          'RainbowDelimiterViolet',
          'RainbowDelimiterCyan',
        },
      }
    end
  },

  {
    "AckslD/muren.nvim",
    cmd = {
      "MurenOpen",
      "MurenClose",
      "MurenToggle",
      "MurenFresh",
      "MurenUnique"
    },
    config = function()
      require("muren").setup({
        keys = {
          toggle_options_focus = "<C-o>",
          scroll_preview_up = "<C-b>",
          scroll_preview_down = "<C-f>"
        },
        hl = {
          options = {
            on = "DiagnosticOk",
            off = "DiagnosticError"
          },
          preview = {
            cwd = {
              path = "Directory",
              lnum = "LineNr"
            }
          },
        },
      })
    end,
  },

  {
    "mg979/vim-visual-multi",
    event = "BufAdd",
  },

  {
    "simrat39/symbols-outline.nvim",
    opts = {
      -- Depth past which nodes will be folded by default
      autofold_depth = 1,
    },
    keys = {
      { "<leader>tO", "<cmd>SymbolsOutline<cr>", desc = "Toggle SymbolsOutline" },
    },
  },

  {
    "rcarriga/nvim-notify",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
    },
    config = function()
      local async = require('plenary.async')
      local notify = require('notify')
      notify.setup({
        background_colour = "#ba4444"
      })
      notify = notify.async
      local ntfunc = function(message, config)
        async.run(function()
          notify(message, config)
        end)
      end
      vim.notify = ntfunc
      lvim.notify = ntfunc
    end
  },


  {
    "folke/noice.nvim",
    dependencies = {
      "rcarriga/nvim-notify",
      "MunifTanjim/nui.nvim"
    },
    event = "VeryLazy",
    opts = {
      cmdline = {
        view = "cmdline",
        format = {
          cmdline = { icon = "  " },
          search_down = { icon = "  󰄼" },
          search_up = { icon = "  " },
          lua = { icon = "  " },
        },
      },

      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },

      lsp = {
        progress = { enabled = true },
        hover = { enabled = false },
        signature = { enabled = false },
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            find = "%d+L, %d+B",
          },
        },
      },
    },

    {
      "NeogitOrg/neogit",
      dependencies = {
        "nvim-lua/plenary.nvim",         -- required
        "nvim-telescope/telescope.nvim", -- optional
        "sindrets/diffview.nvim",        -- optional
      },
      config = function()
        require('noice').setup({})
      end
    }
  },

  -- ui components
  { "MunifTanjim/nui.nvim",  lazy = true },

  -- library used by other plugins
  { "nvim-lua/plenary.nvim", lazy = true },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "junegunn/gv.vim",
    lazy = false,
  },
  -- Lua
  {
    "folke/twilight.nvim",
    config = function()
      require('twilight').setup({
        dimming = {
          alpha = 0.4, -- amount of dimming
          -- we try to get the foreground from the highlight groups or fallback color
          color = { "Normal", "#ffffff" },
          term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
          inactive = false,    -- when true, other windows will be fully dimmed (unless they contain the same buffer)
        },
        context = 10,          -- amount of lines we will try to show around the current line
        treesitter = true,     -- use treesitter when available for the filetype
        -- treesitter is used to automatically expand the visible text,
        -- but you can further control the types of nodes that should always be fully expanded
        expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
          "function",
          "method",
          "table",
          "if_statement",
        },
        exclude = {}, -- exclude these filetypes
      })
    end

  },

  -- {
  --   'echasnovski/mini.animate',
  --   version = false,
  --   config = function()
  --     require('mini.animate').setup({})
  --   end
  -- },

  -- {
  --   'echasnovski/mini.indentscope',
  --   version = false,
  --   config = function() require('mini.indentscope').setup() end
  -- },

  -- nvim-treesitter setup
  { 'nvim-treesitter/nvim-treesitter-refactor' },
  {
    'nvim-treesitter/nvim-treesitter-context',
    config = function()
      require("treesitter-context").setup({

        enable = true,        -- Enable this plugin (Can be enabled/disabled later via commands)
        max_lines = 0,        -- How many lines the window should span. Values <= 0 mean no limit.
        trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        patterns = {          -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
          -- For all filetypes
          -- Note that setting an entry here replaces all other patterns for this entry.
          -- By setting the 'default' entry below, you can control which nodes you want to
          -- appear in the context window.
          default = {
            'class',
            'function',
            'method',
            'for',
            'while',
            'if',
            'switch',
            'case',
          },
          -- Example for a specific filetype.
          -- If a pattern is missing, *open a PR* so everyone can benefit.
          --   rust = {
          --       'impl_item',
          --   },
        },
        exact_patterns = {
          -- Example for a specific filetype with Lua patterns
          -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
          -- exactly match "impl_item" only)
          -- rust = true,
        },

        -- [!] The options below are exposed but shouldn't require your attention,
        --     you can safely ignore them.

        zindex = 20,     -- The Z-index of the context window
        mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
      })
    end
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects' },
  { 'RRethy/nvim-treesitter-endwise' },
  { 'RRethy/nvim-treesitter-textsubjects' },

  cheatsheet,

  barbar,

  neoclip,

  trouble,

  ls_lines,

  lspsaga,

  lsp_signiture,

  dressing,

  legendary,
}


-- table.insert(lvim.plugins, {
--   "zbirenbaum/copilot-cmp",
--   event = "InsertEnter",
--   dependencies = { "zbirenbaum/copilot.lua" },
--   config = function()
--     local ok, cmp = pcall(require, "copilot_cmp")
--     if ok then cmp.setup({}) end
--   end,
-- })

lvim.builtin.telescope.on_config_done = function(telescope)
  pcall(telescope.load_extension, "frecency")
end
